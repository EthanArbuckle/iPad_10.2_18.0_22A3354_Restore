@implementation ARMeshPrimitive

- (ARMeshPrimitive)initAsPlaneWithTransform:(__n128)a3 min:(__n128)a4 max:(__n128)a5 texture:(__n128)a6
{
  id v11;
  ARMeshPrimitive *v12;
  ARMeshPrimitive *v13;
  void *v14;
  void *v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  uint64_t v19;
  MTLBuffer *vertexBuffer;
  uint64_t v21;
  MTLBuffer *uvBuffer;
  uint64_t v23;
  MTLBuffer *indexBuffer;
  objc_super v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[4];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a9;
  v32.receiver = a1;
  v32.super_class = (Class)ARMeshPrimitive;
  v12 = -[ARMeshPrimitive init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    *(__n128 *)&v12[1].super.isa = a2;
    *(__n128 *)&v12[1]._uvBuffer = a3;
    *(__n128 *)&v12[1]._indexBuffer = a4;
    *(__n128 *)&v12[1]._texture = a5;
    +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = a7;
    v17 = a6;
    v17.n128_u32[1] = 0;
    v36[0] = v17;
    v17.n128_u32[2] = a7.n128_u32[2];
    v16.n128_u32[1] = 0;
    v18 = v16;
    v18.n128_u32[2] = a6.n128_u32[2];
    v36[1] = v18;
    v36[2] = v17;
    v36[3] = v16;
    v13->_nVertices = 4;
    v19 = objc_msgSend(v15, "newBufferWithBytes:length:options:", v36, 64, 0);
    vertexBuffer = v13->_vertexBuffer;
    v13->_vertexBuffer = (MTLBuffer *)v19;

    v35[0] = xmmword_1B3C0B3D0;
    v35[1] = unk_1B3C0B3E0;
    v21 = objc_msgSend(v15, "newBufferWithBytes:length:options:", v35, 8 * v13->_nVertices, 0);
    uvBuffer = v13->_uvBuffer;
    v13->_uvBuffer = (MTLBuffer *)v21;

    v33 = xmmword_1B3C0B3F0;
    v34 = 0x200000003;
    v13->_nIndices = 6;
    v23 = objc_msgSend(v15, "newBufferWithBytes:length:options:", &v33, 24, 0);
    indexBuffer = v13->_indexBuffer;
    v13->_indexBuffer = (MTLBuffer *)v23;

    objc_storeStrong((id *)&v13->_texture, a9);
  }

  return v13;
}

+ (id)planeWithTransform:min:max:texture:
{
  return (id)objc_opt_new();
}

- (double)transform_world_from_primitive
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 64), 64, 1, 0);
  return *(double *)&v2;
}

- (MTLBuffer)vertexBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (MTLBuffer)uvBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)nVertices
{
  return self->_nVertices;
}

- (MTLBuffer)indexBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)nIndices
{
  return self->_nIndices;
}

- (MTLTexture)texture
{
  return (MTLTexture *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_uvBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
}

@end
