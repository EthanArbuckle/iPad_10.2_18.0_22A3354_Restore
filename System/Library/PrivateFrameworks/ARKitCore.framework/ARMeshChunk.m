@implementation ARMeshChunk

- (ARMeshChunk)initWithChunk:(ChunkMesh *)a3 device:(id)a4 timestamp:(double)a5 voxelSize:(double)a6
{
  id v11;
  ARMeshChunk *v12;
  ARMeshChunk *v13;
  ARMeshChunk *v14;
  int v15;
  objc_super v17;

  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ARMeshChunk;
  v12 = -[ARMeshChunk init](&v17, sel_init);
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    if (&v12->_chunkMesh != a3)
    {
      v15 = *(_DWORD *)a3->chunk_position.m_data;
      v12->_chunkMesh.chunk_position.m_data[2] = a3->chunk_position.m_data[2];
      *(_DWORD *)v12->_chunkMesh.chunk_position.m_data = v15;
    }
    cv3d::recon::mesh_util::TriMesh<float,unsigned int>::operator=((uint64_t)&v12->_chunkMesh.mesh, (uint64_t)&a3->mesh);
    objc_storeStrong((id *)&v13->_device, a4);
    v14->_timestamp = a5;
    v14->_voxelSize = a6;
  }

  return v14;
}

- (unint64_t)chunkIdFromPosition
{
  return (((uint64_t)self->_chunkMesh.chunk_position.m_data[1] << 16) + 0x80000000) | (((uint64_t)self->_chunkMesh.chunk_position.m_data[2] << 32)
                                                                                      + 0x800000000000) | (self->_chunkMesh.chunk_position.m_data[0] + 0x8000);
}

- (id)chunkIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ARMeshChunk chunkIdFromPosition](self, "chunkIdFromPosition"));
}

- (void)addSemantics:(const char *)a3 count:(unsigned int)a4 size:(unsigned int)a5
{
  id v9;

  -[ARMeshChunk setNumSemantics:](self, "setNumSemantics:", *(_QWORD *)&a4);
  v9 = (id)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", a3, a5 * (unint64_t)a4, 0);
  -[ARMeshChunk setSemantics:](self, "setSemantics:");

}

- (int64_t)vertexCount
{
  return 0xAAAAAAAAAAAAAAABLL
       * (((char *)self->_chunkMesh.mesh.vertices.__end_ - (char *)self->_chunkMesh.mesh.vertices.__begin_) >> 2);
}

- (int64_t)faceCount
{
  return 0xAAAAAAAAAAAAAAABLL
       * (((char *)self->_chunkMesh.mesh.faces.__end_ - (char *)self->_chunkMesh.mesh.faces.__begin_) >> 2);
}

- (id)identifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "ar_UUIDWithIntegerValue:", -[ARMeshChunk chunkIdFromPosition](self, "chunkIdFromPosition"));
}

- (void)convertToWorldSourceFromVisionSource:(simd_float4)a3 relativeTransform:(simd_float4)a4 rotationOnly:(uint64_t)a5
{
  id v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  unint64_t v16;
  int32x2_t v17;
  float *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  simd_float4x4 v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  id v30;
  simd_float4x4 v31;
  _OWORD v32[3];
  float32x4_t v33;
  simd_float4x4 v34;

  v25.columns[2] = a3;
  v25.columns[3] = a4;
  v25.columns[0] = a1;
  v25.columns[1] = a2;
  v30 = a7;
  objc_msgSend(v30, "buffer");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "contents");

  *(double *)v11.i64 = ARVisionToRenderingCoordinateTransform();
  v22 = v12;
  v23 = v11;
  v20 = v14;
  v21 = v13;
  v34 = __invert_f4(v25);
  v15 = 0;
  v31 = v34;
  do
  {
    v32[v15] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(_OWORD *)&v31.columns[v15])), v22, *(float32x2_t *)v31.columns[v15].f32, 1), v21, (float32x4_t)v31.columns[v15], 2), v20, (float32x4_t)v31.columns[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  v16 = 0;
  v28 = (float32x4_t)v32[1];
  v29 = (float32x4_t)v32[0];
  v26 = v33;
  v27 = (float32x4_t)v32[2];
  v17 = (int32x2_t)__PAIR64__(v33.u32[1], 1.0);
  if (a8)
    *(float *)v17.i32 = 0.0;
  v24 = (float32x4_t)vdupq_lane_s32(v17, 0);
  v18 = (float *)(v10 + 8);
  while (v16 < 3 * objc_msgSend(v30, "count", *(_OWORD *)&v20, *(_OWORD *)&v21, *(_OWORD *)&v22))
  {
    v19 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v29, *(v18 - 2)), v28, *(v18 - 1)), v27, *v18), v24, v26);
    if ((a8 & 1) == 0)
      v19 = vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 3));
    *((_QWORD *)v18 - 1) = v19.i64[0];
    *v18 = v19.f32[2];
    v16 += 3;
    v18 += 3;
  }

}

- (ARMeshAnchor)anchorForReferenceOriginTransform:(float32x4_t)a3
{
  void *v6;
  ARGeometrySource *v7;
  uint64_t v8;
  void *v9;
  ARGeometrySource *v10;
  ARGeometryElement *v11;
  ARMeshGeometry *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  ARGeometrySource *v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  unint64_t v30;
  unint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  unint64_t v36;
  ARMeshAnchor *v37;
  double v38;
  void *v39;
  ARMeshAnchor *v40;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  void *v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  double v52;
  double v54;
  double v56;
  double v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;

  if (objc_msgSend((id)a1, "vertexCount") < 1)
  {
    v40 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:", *(_QWORD *)(a1 + 144), 12 * objc_msgSend((id)a1, "vertexCount"), 0);
    v7 = -[ARGeometrySource initWithBuffer:count:format:componentsPerVector:offset:stride:]([ARGeometrySource alloc], "initWithBuffer:count:format:componentsPerVector:offset:stride:", v6, objc_msgSend((id)a1, "vertexCount"), 30, 3, 0, 12);
    v8 = -1431655765 * ((*(_QWORD *)(a1 + 200) - *(_QWORD *)(a1 + 192)) >> 2);
    if ((_DWORD)v8)
    {
      v9 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:");
      v10 = -[ARGeometrySource initWithBuffer:count:format:componentsPerVector:offset:stride:]([ARGeometrySource alloc], "initWithBuffer:count:format:componentsPerVector:offset:stride:", v9, v8, 30, 3, 0, 12);
      if (objc_msgSend((id)a1, "faceCount") < 1)
      {
        v40 = 0;
      }
      else
      {
        v46 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:", *(_QWORD *)(a1 + 216), 12 * objc_msgSend((id)a1, "faceCount"), 0);
        v11 = -[ARGeometryElement initWithBuffer:count:bytesPerIndex:primitiveType:]([ARGeometryElement alloc], "initWithBuffer:count:bytesPerIndex:primitiveType:", v46, objc_msgSend((id)a1, "faceCount"), 4, 1);
        v12 = -[ARMeshGeometry initWithVertices:normals:faces:]([ARMeshGeometry alloc], "initWithVertices:normals:faces:", v7, v10, v11);
        objc_msgSend((id)a1, "semanticsVector");
        v13 = objc_msgSend((id)a1, "faceCount");
        v14 = v63.i64[1] - v63.i64[0];
        if (v63.i64[0])
        {
          v63.i64[1] = v63.i64[0];
          operator delete((void *)v63.i64[0]);
        }
        if (v14 == v13)
        {
          v15 = *(void **)(a1 + 8);
          objc_msgSend((id)a1, "semanticsVector");
          v16 = (void *)objc_msgSend(v15, "newBufferWithBytes:length:options:", v63.i64[0], objc_msgSend((id)a1, "faceCount"), 0);
          if (v63.i64[0])
          {
            v63.i64[1] = v63.i64[0];
            operator delete((void *)v63.i64[0]);
          }
          v17 = -[ARGeometrySource initWithBuffer:count:format:componentsPerVector:offset:stride:]([ARGeometrySource alloc], "initWithBuffer:count:format:componentsPerVector:offset:stride:", v16, objc_msgSend((id)a1, "faceCount"), 45, 1, 0, 1);
          -[ARMeshGeometry setClassification:](v12, "setClassification:", v17);

        }
        ARMatrix4x4FromRotationAndTranslation();
        v49 = v19;
        v50 = v18;
        v47 = v21;
        v48 = v20;
        *(double *)v22.i64 = ARVisionToRenderingCoordinateTransform();
        v44 = v23;
        v45 = v22;
        v42 = v25;
        v43 = v24;
        *(double *)v26.i64 = ARRenderingToVisionCoordinateTransform();
        v30 = 0;
        v59 = v50;
        v60 = v49;
        v61 = v48;
        v62 = v47;
        do
        {
          *(float32x4_t *)((char *)&v63 + v30) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)((char *)&v59 + v30))), v44, *(float32x2_t *)&v59.f32[v30 / 4], 1), v43, *(float32x4_t *)((char *)&v59 + v30), 2), v42, *(float32x4_t *)((char *)&v59 + v30), 3);
          v30 += 16;
        }
        while (v30 != 64);
        v31 = 0;
        v32 = v63;
        v33 = v64;
        v34 = v65;
        v35 = v66;
        v59 = v26;
        v60 = v27;
        v61 = v28;
        v62 = v29;
        do
        {
          *(float32x4_t *)((char *)&v63 + v31) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(*(_OWORD *)((char *)&v59 + v31))), v33, *(float32x2_t *)&v59.f32[v31 / 4], 1), v34, *(float32x4_t *)((char *)&v59 + v31), 2), v35, *(float32x4_t *)((char *)&v59 + v31), 3);
          v31 += 16;
        }
        while (v31 != 64);
        v36 = 0;
        v59 = v63;
        v60 = v64;
        v61 = v65;
        v62 = v66;
        do
        {
          *(float32x4_t *)((char *)&v63 + v36) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)((char *)&v59 + v36))), a3, *(float32x2_t *)&v59.f32[v36 / 4], 1), a4, *(float32x4_t *)((char *)&v59 + v36), 2), a5, *(float32x4_t *)((char *)&v59 + v36), 3);
          v36 += 16;
        }
        while (v36 != 64);
        v56 = *(double *)v64.i64;
        v58 = *(double *)v63.i64;
        v52 = *(double *)v66.i64;
        v54 = *(double *)v65.i64;
        objc_msgSend((id)a1, "convertToWorldSourceFromVisionSource:relativeTransform:rotationOnly:", v7, 0, *(double *)v50.i64, *(double *)v49.i64, *(double *)v48.i64, *(double *)v47.i64);
        objc_msgSend((id)a1, "convertToWorldSourceFromVisionSource:relativeTransform:rotationOnly:", v10, 1, *(double *)v50.i64, *(double *)v49.i64, *(double *)v48.i64, *(double *)v47.i64);
        v37 = [ARMeshAnchor alloc];
        v38 = *(double *)(a1 + 80);
        objc_msgSend((id)a1, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[ARMeshAnchor initWithGeometry:atTimestamp:identifier:transform:voxelSize:](v37, "initWithGeometry:atTimestamp:identifier:transform:voxelSize:", v12, v39, v38, v58, v56, v54, v52, *(double *)(a1 + 88));

      }
    }
    else
    {
      v40 = 0;
    }

  }
  return v40;
}

- (__n128)chunkID
{
  return a1[6];
}

- (void)setChunkID:(ARMeshChunk *)self
{
  __int128 v2;

  *(_OWORD *)self->_chunkID = v2;
}

- (MTLBuffer)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
  objc_storeStrong((id *)&self->_vertices, a3);
}

- (MTLBuffer)normals
{
  return self->_normals;
}

- (void)setNormals:(id)a3
{
  objc_storeStrong((id *)&self->_normals, a3);
}

- (MTLBuffer)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
  objc_storeStrong((id *)&self->_faces, a3);
}

- (MTLBuffer)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (MTLBuffer)semantics
{
  return self->_semantics;
}

- (void)setSemantics:(id)a3
{
  objc_storeStrong((id *)&self->_semantics, a3);
}

- (unsigned)numVertices
{
  return self->_numVertices;
}

- (void)setNumVertices:(unsigned int)a3
{
  self->_numVertices = a3;
}

- (unsigned)numNormals
{
  return self->_numNormals;
}

- (void)setNumNormals:(unsigned int)a3
{
  self->_numNormals = a3;
}

- (unsigned)numFaces
{
  return self->_numFaces;
}

- (void)setNumFaces:(unsigned int)a3
{
  self->_numFaces = a3;
}

- (unsigned)numEdges
{
  return self->_numEdges;
}

- (void)setNumEdges:(unsigned int)a3
{
  self->_numEdges = a3;
}

- (unsigned)numSemantics
{
  return self->_numSemantics;
}

- (void)setNumSemantics:(unsigned int)a3
{
  self->_numSemantics = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ChunkMesh)chunkMesh
{
  *(_DWORD *)retstr->chunk_position.m_data = *(_DWORD *)self->_chunkMesh.chunk_position.m_data;
  retstr->chunk_position.m_data[2] = self->_chunkMesh.chunk_position.m_data[2];
  return (ChunkMesh *)cv3d::recon::mesh_util::TriMesh<float,unsigned int>::TriMesh((uint64_t)&retstr->mesh, (uint64_t **)&self->_chunkMesh.mesh);
}

- (void)setChunkMesh:(ChunkMesh *)a3
{
  int v3;

  if (&self->_chunkMesh != a3)
  {
    v3 = *(_DWORD *)a3->chunk_position.m_data;
    self->_chunkMesh.chunk_position.m_data[2] = a3->chunk_position.m_data[2];
    *(_DWORD *)self->_chunkMesh.chunk_position.m_data = v3;
  }
  cv3d::recon::mesh_util::TriMesh<float,unsigned int>::operator=((uint64_t)&self->_chunkMesh.mesh, (uint64_t)&a3->mesh);
}

- (vector<unsigned)semanticsVector
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned char, std::allocator<unsigned char>> *)std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(retstr, self->_semanticsVector.__begin_, (uint64_t)self->_semanticsVector.__end_, self->_semanticsVector.__end_- self->_semanticsVector.__begin_);
}

- (void)setSemanticsVector:(vector<unsigned)char
{
  vector<unsigned char, std::allocator<unsigned char>> *p_semanticsVector;

  p_semanticsVector = &self->_semanticsVector;
  if (p_semanticsVector != a3)
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(p_semanticsVector, a3->__begin_, a3->__end_, a3->__end_ - a3->__begin_);
}

- (double)voxelSize
{
  return self->_voxelSize;
}

- (void)setVoxelSize:(double)a3
{
  self->_voxelSize = a3;
}

- (void).cxx_destruct
{
  char *begin;

  cv3d::recon::mesh_util::TriMesh<float,unsigned int>::~TriMesh((uint64_t)&self->_chunkMesh.mesh);
  begin = self->_semanticsVector.__begin_;
  if (begin)
  {
    self->_semanticsVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_semantics, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 38) = 0;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0;
  *(_QWORD *)((char *)self + 134) = 0;
  return self;
}

@end
