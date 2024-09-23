@implementation NUNICalliopeResourceManager

+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3
{
  id v4;
  NUNICalliopeResourceManager *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance_0)
  {
    v5 = -[NUNICalliopeResourceManager initWithDisplayPixelFormat:]([NUNICalliopeResourceManager alloc], "initWithDisplayPixelFormat:", a3);
    v6 = (void *)__sharedInstance_0;
    __sharedInstance_0 = (uint64_t)v5;

  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance_0;
  if (*(_QWORD *)(__sharedInstance_0 + 32) != a3)
  {
    NUNILoggingObjectForDomain(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[NUNICalliopeResourceManager sharedInstanceWithDisplayPixelFormat:].cold.1(a3, v8);

    v7 = (void *)__sharedInstance_0;
  }
  return v7;
}

+ (void)_deallocInstance:(id)a3
{
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance_0;
  __sharedInstance_0 = 0;

  objc_sync_exit(obj);
}

- (NUNICalliopeResourceManager)initWithDisplayPixelFormat:(unint64_t)a3
{
  NUNICalliopeResourceManager *v4;
  uint64_t v5;
  CLKUIResourceProviderKey *resourceProviderKey;
  uint64_t v7;
  MTLDevice *device;
  MTLDevice *v9;
  void *v10;
  uint64_t v11;
  MTLLibrary *library;
  uint64_t v13;
  NSMapTable *textureGroupHashTable;
  _TtC12NanoUniverse22AegirCloudCoverService *v15;
  double v16;
  uint64_t v17;
  _TtC12NanoUniverse22AegirCloudCoverService *cloudsService;
  _TtC12NanoUniverse22AegirCloudCoverService *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NUNICalliopeResourceManager;
  v4 = -[NUNICalliopeResourceManager init](&v23, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    resourceProviderKey = v4->_resourceProviderKey;
    v4->_resourceProviderKey = (CLKUIResourceProviderKey *)v5;

    objc_msgSend(MEMORY[0x24BE16F48], "sharedDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    device = v4->_device;
    v4->_device = (MTLDevice *)v7;

    v9 = v4->_device;
    NUNIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MTLDevice newDefaultLibraryWithBundle:error:](v9, "newDefaultLibraryWithBundle:error:", v10, 0);
    library = v4->_library;
    v4->_library = (MTLLibrary *)v11;

    v4->_displayPixelFormat = a3;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    textureGroupHashTable = v4->_textureGroupHashTable;
    v4->_textureGroupHashTable = (NSMapTable *)v13;

    v15 = [_TtC12NanoUniverse22AegirCloudCoverService alloc];
    LODWORD(v16) = 0.25;
    v17 = -[AegirCloudCoverService initWithImageScale:](v15, "initWithImageScale:", v16);
    cloudsService = v4->_cloudsService;
    v4->_cloudsService = (_TtC12NanoUniverse22AegirCloudCoverService *)v17;

    v19 = v4->_cloudsService;
    v20 = (void *)objc_opt_new();
    -[AegirCloudCoverService setFileConverter:](v19, "setFileConverter:", v20);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v4, sel__handleCloudCoverTextureExpired, CFSTR("CloudCoverExpiredNotification"), 0);

    -[NUNICalliopeResourceManager _loadGeometry](v4, "_loadGeometry");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NUNICalliopeResourceManager;
  -[NUNICalliopeResourceManager dealloc](&v2, sel_dealloc);
}

- (void)_asyncDeallocInstance
{
  int v2;
  void *v3;

  v2 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v3 = (void *)objc_opt_class();
  if (v2)
    objc_msgSend(v3, "_deallocInstance:", 0);
  else
    objc_msgSend(v3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__deallocInstance_, 0, 0);
}

- (void)addClient
{
  NUNICalliopeResourceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);

}

- (void)removeClient
{
  NUNICalliopeResourceManager *v2;
  uint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
    -[NUNICalliopeResourceManager _asyncDeallocInstance](v2, "_asyncDeallocInstance");
}

- (void)setPipelineConstants:(uint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;

  v5 = (void *)objc_opt_new();
  v6 = 0;
  obj = v5;
  do
  {
    objc_msgSend(v5, "setConstantValue:type:atIndex:", a3, 16, v6);
    v5 = obj;
    ++v6;
    a3 += 2;
  }
  while (v6 != 35);
  objc_storeStrong((id *)(a1 + 968), obj);
  v7 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = 0;

  v8 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = 0;

  v9 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;

  v10 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;

  v11 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = 0;

  v12 = 0;
  v13 = 1;
  do
  {
    v14 = 0;
    v15 = v13;
    v16 = a1 + 384 * v12;
    do
    {
      v17 = *(void **)(v16 + v14 + 104);
      *(_QWORD *)(v16 + v14 + 104) = 0;

      v18 = *(void **)(v16 + v14 + 112);
      *(_QWORD *)(v16 + v14 + 112) = 0;

      v14 += 16;
    }
    while (v14 != 384);
    v13 = 0;
    v12 = 1;
  }
  while ((v15 & 1) != 0);

}

- (void)_loadGeometry
{
  MTLBuffer *v3;
  MTLBuffer *rectVerticesBuffer;
  MTLBuffer *v5;
  MTLBuffer *discVerticesBuffer;
  MTLBuffer *v7;
  MTLBuffer *starVerticesBuffer;
  MTLBuffer *v9;
  MTLBuffer *starfieldVerticesBuffer;
  MTLBuffer *v11;
  MTLBuffer *starfieldIndicesBuffer;
  MTLBuffer *v13;
  MTLBuffer *atmosphereRingVerticesBuffer;
  MTLBuffer *v15;
  MTLBuffer *saturnRingVerticesBuffer;
  MTLBuffer *v17;
  MTLBuffer *patchVerticesBuffer;
  MTLBuffer *v19;
  MTLBuffer *v20;
  MTLBuffer *v21;
  MTLBuffer *v22;
  MTLBuffer *v23;
  MTLBuffer *v24;
  MTLBuffer *v25;
  MTLBuffer *v26;
  uint64_t v27;
  int32x4_t v28;
  uint64_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float16x4_t *v32;
  float32x4_t v33;
  unsigned __int8 *v40;
  float32x4_t v41;
  float32x4_t v42;
  uint64_t v43;
  float32x4_t v44;
  float32x4_t v45;

  v3 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopeQuadVertices, 16, 1);
  rectVerticesBuffer = self->_rectVerticesBuffer;
  self->_rectVerticesBuffer = v3;

  v5 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopeDiscVertices, 64, 1);
  discVerticesBuffer = self->_discVerticesBuffer;
  self->_discVerticesBuffer = v5;

  v7 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopeStarVertices, 44928, 1);
  starVerticesBuffer = self->_starVerticesBuffer;
  self->_starVerticesBuffer = v7;

  v9 = (MTLBuffer *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", &_NUNICalliopeStarfieldVertices, 518184, 1, &__block_literal_global);
  starfieldVerticesBuffer = self->_starfieldVerticesBuffer;
  self->_starfieldVerticesBuffer = v9;

  v11 = (MTLBuffer *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", &_NUNICalliopeStarfieldIndices, 768300, 1, &__block_literal_global_25);
  starfieldIndicesBuffer = self->_starfieldIndicesBuffer;
  self->_starfieldIndicesBuffer = v11;

  v13 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopeAtmosphereRingVertices, 200, 1);
  atmosphereRingVerticesBuffer = self->_atmosphereRingVerticesBuffer;
  self->_atmosphereRingVerticesBuffer = v13;

  v15 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopeSaturnRingVertices, 104, 1);
  saturnRingVerticesBuffer = self->_saturnRingVerticesBuffer;
  self->_saturnRingVerticesBuffer = v15;

  v17 = (MTLBuffer *)-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:](self->_device, "newBufferWithBytesNoCopy:length:options:deallocator:", &_NUNICalliopePatchVertices, 110976, 1, &__block_literal_global_26);
  patchVerticesBuffer = self->_patchVerticesBuffer;
  self->_patchVerticesBuffer = v17;

  v19 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopePatchIndices1, 3072, 1);
  v20 = self->_patchIndicesBuffer[0];
  self->_patchIndicesBuffer[0] = v19;

  v21 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopePatchIndices2, 768, 1);
  v22 = self->_patchIndicesBuffer[1];
  self->_patchIndicesBuffer[1] = v21;

  v23 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopePatchIndices3, 192, 1);
  v24 = self->_patchIndicesBuffer[2];
  self->_patchIndicesBuffer[2] = v23;

  v25 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_NUNICalliopePatchIndices4, 48, 1);
  v26 = self->_patchIndicesBuffer[3];
  self->_patchIndicesBuffer[3] = v25;

  v27 = 0;
  v28 = vdupq_n_s32(0x7F7FFFFFu);
  do
  {
    v29 = 0;
    v30.i64[0] = 0x80000000800000;
    v30.i32[2] = 0x800000;
    v31 = (float32x4_t)v28;
    do
    {
      v32 = (float16x4_t *)((char *)&_NUNICalliopePatchVertices
                          + 4624 * v27
                          + 16 * *(unsigned __int16 *)((char *)&_NUNICalliopePatchIndices1 + v29));
      v33.i64[0] = vcvtq_f32_f16(*v32).u64[0];
      _H4 = v32->i16[2];
      __asm { FCVT            S4, H4 }
      v31.i32[3] = 0;
      v33.i64[1] = _S4;
      v31 = vminnmq_f32(v31, v33);
      v30.i32[3] = 0;
      v30 = vmaxnmq_f32(v30, v33);
      v29 += 2;
    }
    while (v29 != 3072);
    v40 = &self->_anon_4c10[32 * v27];
    *(float32x4_t *)v40 = v31;
    *((float32x4_t *)v40 + 1) = v30;
    ++v27;
  }
  while (v27 != 24);
  v41 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
  v42.i64[0] = 0x80000000800000;
  v42.i32[2] = 0x800000;
  v43 = -768;
  do
  {
    v44 = *(float32x4_t *)((char *)&self[1].super.isa + v43);
    v41.i32[3] = 0;
    v44.i32[3] = 0;
    v41 = vminnmq_f32(v41, v44);
    v45 = *(float32x4_t *)((char *)&self[1]._resourceProviderKey + v43);
    v42.i32[3] = 0;
    v45.i32[3] = 0;
    v42 = vmaxnmq_f32(v42, v45);
    v43 += 32;
  }
  while (v43);
  *(float32x4_t *)&self[1].super.isa = v41;
  *(float32x4_t *)&self[1]._resourceProviderKey = v42;
}

- (id)rectVerticesBuffer
{
  return self->_rectVerticesBuffer;
}

- (id)discVerticesBuffer
{
  return self->_discVerticesBuffer;
}

- (id)starVerticesBuffer
{
  return self->_starVerticesBuffer;
}

- (id)starfieldVerticesBuffer
{
  return self->_starfieldVerticesBuffer;
}

- (id)starfieldIndicesBuffer
{
  return self->_starfieldIndicesBuffer;
}

- (id)atmosphereRingVerticesBuffer
{
  return self->_atmosphereRingVerticesBuffer;
}

- (id)saturnRingVerticesBuffer
{
  return self->_saturnRingVerticesBuffer;
}

- (id)patchVerticesBuffer
{
  return self->_patchVerticesBuffer;
}

- (id)patchIndicesBufferForLod:(unint64_t)a3
{
  unint64_t v3;

  v3 = 3;
  if (a3 < 3)
    v3 = a3;
  return self->_patchIndicesBuffer[v3];
}

- (unsigned)patchIndexCountForLod:(unint64_t)a3
{
  unint64_t v3;

  v3 = 3;
  if (a3 < 3)
    v3 = a3;
  return patchIndexCountForLod__counts[v3];
}

- (const)patchBoundingBoxes
{
  return (const $8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_anon_4c10;
}

- (const)patchBoundingBoxForSpheroid
{
  return (const $8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self[1];
}

- ($5AFC0E169F343DF89EAE37A2F834CF53)patchTextureGroupForSpheroid:(unint64_t)a3 index:(unint64_t)a4 suffix:(id)a5
{
  $2C9CF733BB96E0B4F614A95AA11FA3B9 (*patchTextureGroupTable)[24];
  $5AFC0E169F343DF89EAE37A2F834CF53 *v6;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id var0;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;

  patchTextureGroupTable = self->_patchTextureGroupTable;
  v6 = ($5AFC0E169F343DF89EAE37A2F834CF53 *)&self->_patchTextureGroupTable[a3][a4];
  if (!v6->var0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("p%02d-i%02d"), patchTextureGroupForSpheroid_index_suffix__spheroidIndex[a3], a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BE16F70];
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-a-%@"), a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textureWithProviderDelegate:uuid:streaming:", self, v13, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    var0 = v6->var0;
    v6->var0 = (id)v14;

    objc_msgSend(v6->var0, "atlas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaxPlaceholderSize:", 128);

    if (patchTextureGroupForSpheroid_index_suffix__spheroidHasNormal[a3])
    {
      v17 = (void *)MEMORY[0x24BE16F70];
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-n-%@"), a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textureWithProviderDelegate:uuid:streaming:", self, v18, 1);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (unint64_t)&patchTextureGroupTable[a3][a4];
      v21 = *(void **)(v20 + 8);
      *(_QWORD *)(v20 + 8) = v19;

      objc_msgSend(*(id *)(v20 + 8), "atlas");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setMaxPlaceholderSize:", 128);

    }
    if (patchTextureGroupForSpheroid_index_suffix__spheroidHasCloud[a3])
    {
      v23 = (void *)MEMORY[0x24BE16F70];
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-e-%@"), a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "textureWithProviderDelegate:uuid:streaming:", self, v24, 1);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (unint64_t)&patchTextureGroupTable[a3][a4];
      v27 = *(void **)(v26 + 16);
      *(_QWORD *)(v26 + 16) = v25;

      objc_msgSend(*(id *)(v26 + 16), "atlas");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setMaxPlaceholderSize:", 128);

    }
    if (patchTextureGroupForSpheroid_index_suffix__spheroidHasCloud[a3])
    {
      v29 = (void *)MEMORY[0x24BE16F70];
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("-c-%@"), a5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "textureWithProviderDelegate:uuid:streaming:", self, v30, 1);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (unint64_t)&patchTextureGroupTable[a3][a4];
      v33 = *(void **)(v32 + 24);
      *(_QWORD *)(v32 + 24) = v31;

      objc_msgSend(*(id *)(v32 + 24), "atlas");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setMaxPlaceholderSize:", 128);

    }
  }
  return v6;
}

- (id)textureGroupWithSuffix:(id)a3
{
  id v4;
  NUNICalliopeTextureGroup *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_textureGroupHashTable, "objectForKey:", v4);
  v5 = (NUNICalliopeTextureGroup *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(NUNICalliopeTextureGroup);
    objc_msgSend(MEMORY[0x24BE16F70], "nullTexture2D");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    for (i = 0; i != 24; ++i)
    {
      v9 = (void *)textureGroupWithSuffix__uuidGradients[i];
      if (v9)
      {
        objc_msgSend(v9, "stringByAppendingString:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE16F70], "textureWithProviderDelegate:uuid:nullTexture:", self, v10, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

      }
      else
      {
        objc_msgSend(v7, "addObject:", v6);
      }
    }
    -[NUNICalliopeTextureGroup setGradients:](v5, "setGradients:", v7);

    -[NSMapTable setObject:forKey:](self->_textureGroupHashTable, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)renderDisplayPipeline
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateDisplay;

  v3 = self->_pipelineStateDisplay;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_pass_vsh"), CFSTR("calliope_display_fsh"), 0, 0, 4, self->_displayPixelFormat, 0);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateDisplay = self->_pipelineStateDisplay;
    self->_pipelineStateDisplay = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForPost
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStatePost;

  v3 = self->_pipelineStatePost;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_post_vsh"), CFSTR("calliope_post_fsh"), 0, 2, 3, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStatePost = self->_pipelineStatePost;
    self->_pipelineStatePost = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStarfield
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateStarfield;

  v3 = self->_pipelineStateStarfield;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_starfield_vsh"), CFSTR("calliope_starfield_fsh"), 0, 0, 0, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateStarfield = self->_pipelineStateStarfield;
    self->_pipelineStateStarfield = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStar
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateStar;

  v3 = self->_pipelineStateStar;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_star_vsh"), CFSTR("calliope_star_fsh"), 0, 1, 4, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateStar = self->_pipelineStateStar;
    self->_pipelineStateStar = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSaturnRing
{
  MTLRenderPipelineState **p_pipelineStateSaturnRing;
  MTLRenderPipelineState *v4;

  p_pipelineStateSaturnRing = &self->_pipelineStateSaturnRing;
  v4 = self->_pipelineStateSaturnRing;
  if (!v4)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_saturn_ring_vsh"), CFSTR("calliope_saturn_ring_fsh"), 0, 1, 1, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_pipelineStateSaturnRing, v4);
  }
  return v4;
}

- (id)renderOffscreenPipelineForAtmosphere
{
  MTLRenderPipelineState **p_pipelineStateAtmosphere;
  MTLRenderPipelineState *v4;

  p_pipelineStateAtmosphere = &self->_pipelineStateAtmosphere;
  v4 = self->_pipelineStateAtmosphere;
  if (!v4)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_atmosphere_vsh"), CFSTR("calliope_atmosphere_fsh"), 0, 1, 1, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_pipelineStateAtmosphere, v4);
  }
  return v4;
}

- (id)renderOffscreenPipelineForLocationDot
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateLocationDot;

  v3 = self->_pipelineStateLocationDot;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_locdot_vsh"), CFSTR("calliope_locdot_fsh"), 0, 1, 4, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateLocationDot = self->_pipelineStateLocationDot;
    self->_pipelineStateLocationDot = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 layer:(int)a4 config:(unint64_t)a5
{
  char *v9;
  void **v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v9 = (char *)self + 384 * a4 + 16 * a3 + 8 * a5;
  v11 = (void *)*((_QWORD *)v9 + 13);
  v10 = (void **)(v9 + 104);
  v12 = v11;
  if (!v12)
  {
    v13 = (void *)renderOffscreenPipelineForSpheroid_layer_config__spheroridFshs[24 * a4 + a3];
    if (v13)
    {
      v14 = (void *)renderOffscreenPipelineForSpheroid_layer_config__spheroridVshs[24 * a4 + a3];
      v15 = v13;
      v16 = v14;
      -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", v16, v15, a5, 1, 1, 555, 10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *v10;
      *v10 = v17;

      v12 = v17;
    }
    else
    {
      v12 = 0;
    }
  }
  return v12;
}

- (id)renderOffscreenPipelineForDebugDraw
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateDebugDraw;

  v3 = self->_pipelineStateDebugDraw;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_debugdraw_vsh"), CFSTR("calliope_debugdraw_fsh"), 0, 0, 4, 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateDebugDraw = self->_pipelineStateDebugDraw;
    self->_pipelineStateDebugDraw = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForBloomDownsampleUsingTileShader
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateForBloomDownsampleUsingTileShader;

  v3 = self->_pipelineStateForBloomDownsampleUsingTileShader;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineTshName:pixelFormat0:pixelFormat1:](self, "_generatePipelineTshName:pixelFormat0:pixelFormat1:", CFSTR("calliope_bloom_downsample_tsh"), 555, 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateForBloomDownsampleUsingTileShader = self->_pipelineStateForBloomDownsampleUsingTileShader;
    self->_pipelineStateForBloomDownsampleUsingTileShader = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForBloomDownsample
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateForBloomDownsample;

  v3 = self->_pipelineStateForBloomDownsample;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("calliope_bloom_downsample_vsh"), CFSTR("calliope_bloom_downsample_fsh"), 0, 0, 4, 10, 0);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateForBloomDownsample = self->_pipelineStateForBloomDownsample;
    self->_pipelineStateForBloomDownsample = v4;

    v3 = v4;
  }
  return v3;
}

- (id)computePipelineForBloomChainDownsample
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *pipelineStateForBloomChainDownsample;

  v3 = self->_pipelineStateForBloomChainDownsample;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineCshName:](self, "_generatePipelineCshName:", CFSTR("calliope_bloom_chain_downsample_csh"));
    v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateForBloomChainDownsample = self->_pipelineStateForBloomChainDownsample;
    self->_pipelineStateForBloomChainDownsample = v4;

    v3 = v4;
  }
  return v3;
}

- (id)computePipelineForBloomChainUpsample
{
  MTLComputePipelineState *v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *pipelineStateForBloomChainUpsample;

  v3 = self->_pipelineStateForBloomChainUpsample;
  if (!v3)
  {
    -[NUNICalliopeResourceManager _generatePipelineCshName:](self, "_generatePipelineCshName:", CFSTR("calliope_bloom_chain_upsample_csh"));
    v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateForBloomChainUpsample = self->_pipelineStateForBloomChainUpsample;
    self->_pipelineStateForBloomChainUpsample = v4;

    v3 = v4;
  }
  return v3;
}

- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9
{
  char v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  BOOL v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v12 = a5;
  v46[2] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v44 = (v12 & 3) == 1;
  v43 = (v12 & 2) != 0;
  v17 = (void *)-[MTLFunctionConstantValues copy](self->_pipelineConstants, "copy");
  objc_msgSend(v17, "setConstantValue:type:atIndex:", &v44, 53, 35);
  objc_msgSend(v17, "setConstantValue:type:atIndex:", &v43, 53, 36);
  v46[0] = a6;
  v46[1] = a7;
  v18 = (void *)MEMORY[0x24BE16F40];
  NUNIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "archiveWithName:bundle:device:", CFSTR("NUNICalliopeShaders"), v19, self->_device);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDD5B0], "functionDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v17;
  objc_msgSend(v21, "setConstantValues:", v17);
  objc_msgSend(v21, "setName:", v15);
  v22 = objc_msgSend(v20, "newFunctionInLibrary:withDescriptor:", self->_library, v21);
  objc_msgSend(v21, "setName:", v16);
  v42 = v20;
  v23 = (void *)objc_msgSend(v20, "newFunctionInLibrary:withDescriptor:", self->_library, v21);
  v24 = (void *)objc_opt_new();
  v41 = v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)+(%@)"), v15, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLabel:", v25);

  v39 = (void *)v22;
  objc_msgSend(v24, "setVertexFunction:", v22);
  objc_msgSend(v24, "setFragmentFunction:", v23);
  v26 = 0;
  v45[0] = a8;
  v45[1] = a9;
  v27 = 1;
  do
  {
    v28 = v27;
    v29 = v45[v26];
    if (v29)
    {
      objc_msgSend(v24, "colorAttachments");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "setPixelFormat:", v29);
      objc_msgSend(v31, "setBlendingEnabled:", 0);
      switch(v46[v26])
      {
        case 1:
          objc_msgSend(v31, "setBlendingEnabled:", 1);
          objc_msgSend(v31, "setRgbBlendOperation:", 0);
          objc_msgSend(v31, "setAlphaBlendOperation:", 0);
          objc_msgSend(v31, "setSourceRGBBlendFactor:", 4);
          objc_msgSend(v31, "setSourceAlphaBlendFactor:", 4);
          objc_msgSend(v31, "setDestinationRGBBlendFactor:", 5);
          v32 = v31;
          v33 = 5;
          goto LABEL_8;
        case 2:
          objc_msgSend(v31, "setBlendingEnabled:", 1);
          objc_msgSend(v31, "setRgbBlendOperation:", 0);
          v34 = v31;
          v35 = 0;
          goto LABEL_7;
        case 3:
          objc_msgSend(v31, "setBlendingEnabled:", 1);
          objc_msgSend(v31, "setRgbBlendOperation:", 2);
          v34 = v31;
          v35 = 2;
LABEL_7:
          objc_msgSend(v34, "setAlphaBlendOperation:", v35);
          objc_msgSend(v31, "setSourceRGBBlendFactor:", 1);
          objc_msgSend(v31, "setSourceAlphaBlendFactor:", 1);
          objc_msgSend(v31, "setDestinationRGBBlendFactor:", 1);
          v32 = v31;
          v33 = 1;
LABEL_8:
          objc_msgSend(v32, "setDestinationAlphaBlendFactor:", v33);
          break;
        case 4:
          objc_msgSend(v31, "setWriteMask:", 0);
          break;
        default:
          break;
      }

    }
    v27 = 0;
    v26 = 1;
  }
  while ((v28 & 1) != 0);
  v36 = objc_msgSend(v42, "newRenderPipelineStateForDevice:withDescriptor:", self->_device, v24);
  if (!v36)
    -[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:].cold.1();
  v37 = (void *)v36;

  return v37;
}

- (id)_generatePipelineTshName:(id)a3 pixelFormat0:(unint64_t)a4 pixelFormat1:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  MTLDevice *device;
  void *v19;
  id v20;
  NSObject *v21;
  MTLDevice *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  MTLDevice *v28;
  __int16 v29;
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabel:", v10);

  v11 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v8);
  objc_msgSend(v9, "setTileFunction:", v11);

  objc_msgSend(v9, "setThreadgroupSizeMatchesTileSize:", 0);
  v12 = 0;
  v31[0] = a4;
  v31[1] = a5;
  v13 = 1;
  do
  {
    v14 = v13;
    v15 = v31[v12];
    if (v15)
    {
      objc_msgSend(v9, "colorAttachments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setPixelFormat:", v15);
    }
    v13 = 0;
    v12 = 1;
  }
  while ((v14 & 1) != 0);
  device = self->_device;
  v24 = 0;
  v19 = (void *)-[MTLDevice newRenderPipelineStateWithTileDescriptor:options:reflection:error:](device, "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", v9, 0, 0, &v24);
  v20 = v24;
  if (!v19)
  {
    NUNILoggingObjectForDomain(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = self->_device;
      *(_DWORD *)buf = 138412802;
      v26 = v8;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v20;
      _os_log_error_impl(&dword_2134A1000, v21, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: Metal compilation failure Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }

  }
  return v19;
}

- (id)_generatePipelineCshName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTLDevice *device;
  void *v9;
  id v10;
  NSObject *v11;
  MTLDevice *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  MTLDevice *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v6);

  v7 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v4);
  objc_msgSend(v5, "setComputeFunction:", v7);

  device = self->_device;
  v14 = 0;
  v9 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](device, "newComputePipelineStateWithDescriptor:options:reflection:error:", v5, 0, 0, &v14);
  v10 = v14;
  if (!v9)
  {
    NUNILoggingObjectForDomain(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_device;
      *(_DWORD *)buf = 138412802;
      v16 = v4;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_2134A1000, v11, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: Metal compilation failure Shader=%@ Device=%@ Error=%@", buf, 0x20u);
    }

  }
  return v9;
}

- (void)_handleCloudCoverTextureExpired
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__NUNICalliopeResourceManager__handleCloudCoverTextureExpired__block_invoke;
  block[3] = &unk_24CFD7B00;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __62__NUNICalliopeResourceManager__handleCloudCoverTextureExpired__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NUNILoggingObjectForDomain(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2134A1000, v2, OS_LOG_TYPE_DEFAULT, "Received cloud cover texture expired update. It will purge current textures.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "purgeAllCloudCoverTextures");
}

- (void)purgeAllCloudCoverTextures
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AegirCloudCoverService allCloudLevelFileNames](self->_cloudsService, "allCloudLevelFileNames", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BE16F60], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "purge:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_deferredCloudDataFetchIfNeeded
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  _TtC12NanoUniverse22AegirCloudCoverService *cloudsService;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = -[AegirCloudCoverService canFetchData](self->_cloudsService, "canFetchData");
  NUNILoggingObjectForDomain(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2134A1000, v4, OS_LOG_TYPE_DEFAULT, "Will Fetch cloud cover data.", buf, 2u);
    }

    cloudsService = self->_cloudsService;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__NUNICalliopeResourceManager__deferredCloudDataFetchIfNeeded__block_invoke;
    v7[3] = &unk_24CFD7B28;
    v7[4] = self;
    -[AegirCloudCoverService retrieveCloudTextureURLsWithNotifyOn:completionHandler:](cloudsService, "retrieveCloudTextureURLsWithNotifyOn:completionHandler:", MEMORY[0x24BDAC9B8], v7);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2134A1000, v4, OS_LOG_TYPE_DEFAULT, "Will not fetch cloud cover data.", buf, 2u);
    }

  }
}

uint64_t __62__NUNICalliopeResourceManager__deferredCloudDataFetchIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "purgeAllCloudCoverTextures");
}

- (id)_provideEarthCloudsAtlasBacking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NUNICalliopeResourceManager _deferredCloudDataFetchIfNeeded](self, "_deferredCloudDataFetchIfNeeded");
  -[AegirCloudCoverService currentURLForCloudLevelWith:](self->_cloudsService, "currentURLForCloudLevelWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE16F20];
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "atlasBackingWithArt:uuid:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)provideAtlasBacking:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[AegirCloudCoverService cloudLevelPrefix](_TtC12NanoUniverse22AegirCloudCoverService, "cloudLevelPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  if (v6)
  {
    -[NUNICalliopeResourceManager _provideEarthCloudsAtlasBacking:](self, "_provideEarthCloudsAtlasBacking:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NUNIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", v4, CFSTR("art"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NUNILoggingObjectForDomain(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_2134A1000, v11, OS_LOG_TYPE_DEFAULT, "providing artwork for %@ at %@", (uint8_t *)&v13, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BE16F20], "atlasBackingWithArt:uuid:", v9, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[NUNICalliopeResourceManager provideAtlasBacking:].cold.1((uint64_t)v4, v11);

      v7 = 0;
    }

  }
  return v7;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (_TtC12NanoUniverse22AegirCloudCoverService)cloudsService
{
  return self->_cloudsService;
}

- (void).cxx_destruct
{
  $2C9CF733BB96E0B4F614A95AA11FA3B9 *v3;
  uint64_t v4;
  uint64_t i;
  uint64_t j;

  v3 = &self->_patchTextureGroupTable[23][23];
  v4 = -18432;
  do
  {
    __destructor_8_s0_s8_s16_s24((id *)&v3->albedo);
    --v3;
    v4 += 32;
  }
  while (v4);
  for (i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_patchIndicesBuffer[i + 3], 0);
  objc_storeStrong((id *)&self->_patchVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_cloudsService, 0);
  objc_storeStrong((id *)&self->_textureGroupHashTable, 0);
  objc_storeStrong((id *)&self->_pipelineConstants, 0);
  objc_storeStrong((id *)&self->_starfieldIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_starfieldVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_saturnRingVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_atmosphereRingVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_starVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_discVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_rectVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomChainUpsample, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomChainDownsample, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomDownsample, 0);
  objc_storeStrong((id *)&self->_pipelineStateForBloomDownsampleUsingTileShader, 0);
  objc_storeStrong((id *)&self->_pipelineStateDebugDraw, 0);
  for (j = 864; j != 96; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_pipelineStateAtmosphere, 0);
  objc_storeStrong((id *)&self->_pipelineStateSaturnRing, 0);
  objc_storeStrong((id *)&self->_pipelineStateStar, 0);
  objc_storeStrong((id *)&self->_pipelineStateStarfield, 0);
  objc_storeStrong((id *)&self->_pipelineStateDisplay, 0);
  objc_storeStrong((id *)&self->_pipelineStatePost, 0);
  objc_storeStrong((id *)&self->_pipelineStateLocationDot, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)sharedInstanceWithDisplayPixelFormat:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(__sharedInstance_0 + 32);
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_2134A1000, a2, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: DisplayPixelFormat %d != %d", (uint8_t *)v3, 0xEu);
}

- (void)_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:.cold.1()
{
  __assert_rtn("-[NUNICalliopeResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:]", "NUNICalliopeResourceManager.m", 913, "pipelineState != nil");
}

- (void)provideAtlasBacking:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2134A1000, a2, OS_LOG_TYPE_ERROR, "CalliopeResourceManager: missing artwork for %@", (uint8_t *)&v2, 0xCu);
}

@end
