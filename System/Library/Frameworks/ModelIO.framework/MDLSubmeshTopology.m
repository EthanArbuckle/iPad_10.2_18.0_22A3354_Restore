@implementation MDLSubmeshTopology

- (MDLSubmeshTopology)initWithSubmesh:(MDLSubmesh *)submesh
{
  const char *v5;
  uint64_t v6;
  MDLSubmesh *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  MDLSubmeshTopology *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  MDLMeshBuffer *faceTopology;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  MDLMeshBuffer *vertexCreaseIndices;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  MDLMeshBuffer *vertexCreases;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  MDLMeshBuffer *edgeCreaseIndices;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  MDLMeshBuffer *edgeCreases;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  MDLMeshBuffer *holes;
  const char *v55;
  uint64_t v56;
  MDLSubmeshTopology *v57;
  unint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  unint64_t v62;
  char *v63;
  BOOL v64;
  char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  MDLMeshBuffer *v74;
  MDLMeshBuffer *v75;
  MDLMeshBuffer *v76;
  _BYTE *v77;
  _BYTE *v78;
  MDLSubmeshTopology *v79;
  char v81;
  void *__p;
  _BYTE *v83;
  uint64_t v84;
  objc_super v85;

  v7 = submesh;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Cannot create topology with a submesh"), v10, v11);

  }
  if (objc_msgSend_geometryType(v7, v5, v6) == 3)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v13, v17, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Cannot create topology from triangle strips"), v15, v16);

  }
  v85.receiver = self;
  v85.super_class = (Class)MDLSubmeshTopology;
  v20 = -[MDLSubmeshTopology init](&v85, sel_init);
  if (v20)
  {
    objc_msgSend_topology(v7, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend_topology(v7, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_faceTopology(v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      faceTopology = v20->_faceTopology;
      v20->_faceTopology = (MDLMeshBuffer *)v27;

      v20->_faceCount = objc_msgSend_faceCount(v24, v29, v30);
      objc_msgSend_vertexCreaseIndices(v24, v31, v32);
      v33 = objc_claimAutoreleasedReturnValue();
      vertexCreaseIndices = v20->_vertexCreaseIndices;
      v20->_vertexCreaseIndices = (MDLMeshBuffer *)v33;

      objc_msgSend_vertexCreases(v24, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      vertexCreases = v20->_vertexCreases;
      v20->_vertexCreases = (MDLMeshBuffer *)v37;

      v20->_vertexCreaseCount = objc_msgSend_vertexCreaseCount(v24, v39, v40);
      v20->_edgeCreaseCount = objc_msgSend_edgeCreaseCount(v24, v41, v42);
      objc_msgSend_edgeCreaseIndices(v24, v43, v44);
      v45 = objc_claimAutoreleasedReturnValue();
      edgeCreaseIndices = v20->_edgeCreaseIndices;
      v20->_edgeCreaseIndices = (MDLMeshBuffer *)v45;

      objc_msgSend_edgeCreases(v24, v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      edgeCreases = v20->_edgeCreases;
      v20->_edgeCreases = (MDLMeshBuffer *)v49;

      objc_msgSend_holes(v24, v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();
      holes = v20->_holes;
      v20->_holes = (MDLMeshBuffer *)v53;

      v20->_holeCount = objc_msgSend_holeCount(v24, v55, v56);
      v57 = v20;

    }
    else
    {
      v58 = objc_msgSend_indexCount(v7, v22, v23);
      __p = 0;
      v83 = 0;
      v84 = 0;
      switch(objc_msgSend_geometryType(v7, v59, v60))
      {
        case 0:
          v81 = 1;
          v61 = (const char *)(v58 - (v83 - (_BYTE *)__p));
          if (v58 > v83 - (_BYTE *)__p)
            goto LABEL_16;
          if (v58 < v83 - (_BYTE *)__p)
          {
            v65 = (char *)__p + v58;
            goto LABEL_21;
          }
          break;
        case 1:
          v62 = v58 >> 1;
          v81 = 2;
          v63 = (char *)__p;
          v64 = v58 >> 1 >= v83 - (_BYTE *)__p;
          v61 = (const char *)((v58 >> 1) - (v83 - (_BYTE *)__p));
          if (v58 >> 1 <= v83 - (_BYTE *)__p)
            goto LABEL_17;
          goto LABEL_16;
        case 2:
          v62 = v58 / 3;
          v81 = 3;
          v63 = (char *)__p;
          v64 = v58 / 3 >= v83 - (_BYTE *)__p;
          v61 = (const char *)(v58 / 3 - (v83 - (_BYTE *)__p));
          if (v58 / 3 > v83 - (_BYTE *)__p)
            goto LABEL_16;
          goto LABEL_17;
        case 4:
          v62 = v58 >> 2;
          v81 = 4;
          v63 = (char *)__p;
          v64 = v58 >> 2 >= v83 - (_BYTE *)__p;
          v61 = (const char *)((v58 >> 2) - (v83 - (_BYTE *)__p));
          if (v58 >> 2 <= v83 - (_BYTE *)__p)
          {
LABEL_17:
            if (!v64)
            {
              v65 = &v63[v62];
LABEL_21:
              v83 = v65;
            }
          }
          else
          {
LABEL_16:
            sub_1DCBA8BF0(&__p, (unint64_t)v61, &v81);
          }
          break;
        default:
          break;
      }
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v61, (uint64_t)__p, v83 - (_BYTE *)__p);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexBuffer(v7, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allocator(v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (MDLMeshBuffer *)objc_msgSend_newBufferWithData_type_(v72, v73, (uint64_t)v66, 2);

      v75 = v20->_faceTopology;
      v20->_faceTopology = v74;
      v76 = v74;

      v78 = __p;
      v77 = v83;

      v20->_faceCount = v77 - v78;
      v79 = v20;

      if (__p)
      {
        v83 = __p;
        operator delete(__p);
      }
    }
  }

  return v20;
}

+ (id)decodeTopologyWithCoder:(id)a3 allocator:(id)a4
{
  id v5;
  id v6;
  MDLSubmeshTopology *v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  MDLMeshBuffer *faceTopology;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MDLSubmeshTopology);
  v7->_faceCount = objc_msgSend_decodeIntegerForKey_(v5, v8, (uint64_t)CFSTR("faceCount"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    objc_msgSend_decodeMeshBufferWithCoder_forKey_(v9, v10, (uint64_t)v5, CFSTR("faceTopology"));
    v11 = objc_claimAutoreleasedReturnValue();
    faceTopology = v7->_faceTopology;
    v7->_faceTopology = (MDLMeshBuffer *)v11;

  }
  return v7;
}

- (void)encodeTopologyWithCoder:(id)a3 allocator:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  MDLMeshBuffer *v10;
  MDLMeshBuffer *faceTopology;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend_encodeInteger_forKey_(v12, v7, self->_faceCount, CFSTR("faceCount"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend_decodeMeshBufferWithCoder_forKey_(v8, v9, (uint64_t)v12, CFSTR("faceTopology"));
    v10 = (MDLMeshBuffer *)objc_claimAutoreleasedReturnValue();
    faceTopology = self->_faceTopology;
    self->_faceTopology = v10;

  }
}

- (id)faceTopology
{
  return self->_faceTopology;
}

- (void)setFaceTopology:(id)faceTopology
{
  objc_storeStrong((id *)&self->_faceTopology, faceTopology);
}

- (NSUInteger)faceCount
{
  return self->_faceCount;
}

- (void)setFaceCount:(NSUInteger)faceCount
{
  self->_faceCount = faceCount;
}

- (id)vertexCreaseIndices
{
  return self->_vertexCreaseIndices;
}

- (void)setVertexCreaseIndices:(id)vertexCreaseIndices
{
  objc_storeStrong((id *)&self->_vertexCreaseIndices, vertexCreaseIndices);
}

- (id)vertexCreases
{
  return self->_vertexCreases;
}

- (void)setVertexCreases:(id)vertexCreases
{
  objc_storeStrong((id *)&self->_vertexCreases, vertexCreases);
}

- (NSUInteger)vertexCreaseCount
{
  return self->_vertexCreaseCount;
}

- (void)setVertexCreaseCount:(NSUInteger)vertexCreaseCount
{
  self->_vertexCreaseCount = vertexCreaseCount;
}

- (id)edgeCreaseIndices
{
  return self->_edgeCreaseIndices;
}

- (void)setEdgeCreaseIndices:(id)edgeCreaseIndices
{
  objc_storeStrong((id *)&self->_edgeCreaseIndices, edgeCreaseIndices);
}

- (id)edgeCreases
{
  return self->_edgeCreases;
}

- (void)setEdgeCreases:(id)edgeCreases
{
  objc_storeStrong((id *)&self->_edgeCreases, edgeCreases);
}

- (NSUInteger)edgeCreaseCount
{
  return self->_edgeCreaseCount;
}

- (void)setEdgeCreaseCount:(NSUInteger)edgeCreaseCount
{
  self->_edgeCreaseCount = edgeCreaseCount;
}

- (id)holes
{
  return self->_holes;
}

- (void)setHoles:(id)holes
{
  objc_storeStrong((id *)&self->_holes, holes);
}

- (NSUInteger)holeCount
{
  return self->_holeCount;
}

- (void)setHoleCount:(NSUInteger)holeCount
{
  self->_holeCount = holeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holes, 0);
  objc_storeStrong((id *)&self->_edgeCreases, 0);
  objc_storeStrong((id *)&self->_edgeCreaseIndices, 0);
  objc_storeStrong((id *)&self->_vertexCreases, 0);
  objc_storeStrong((id *)&self->_vertexCreaseIndices, 0);
  objc_storeStrong((id *)&self->_faceTopology, 0);
}

@end
