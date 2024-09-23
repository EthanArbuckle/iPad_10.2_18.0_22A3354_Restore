@implementation NTKKaleidoscopeResourceManager

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3
{
  id v4;
  NTKKaleidoscopeResourceManager *v5;
  void *v6;

  v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance_0)
  {
    v5 = -[NTKKaleidoscopeResourceManager initWithPixelFormat:]([NTKKaleidoscopeResourceManager alloc], "initWithPixelFormat:", a3);
    v6 = (void *)__sharedInstance_0;
    __sharedInstance_0 = (uint64_t)v5;

  }
  objc_sync_exit(v4);

  if (*(_QWORD *)(__sharedInstance_0 + 32) != a3)
    +[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:].cold.1();
  return (id)__sharedInstance_0;
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

- (NTKKaleidoscopeResourceManager)initWithPixelFormat:(unint64_t)a3
{
  NTKKaleidoscopeResourceManager *v4;
  uint64_t v5;
  NSBundle *bundle;
  uint64_t v7;
  MTLDevice *device;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKKaleidoscopeResourceManager;
  v4 = -[NTKKaleidoscopeResourceManager init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = objc_claimAutoreleasedReturnValue();
    bundle = v4->_bundle;
    v4->_bundle = (NSBundle *)v5;

    v4->_viewMtlPixelFormat = a3;
    objc_msgSend(off_1E6BCA700, "sharedDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    device = v4->_device;
    v4->_device = (MTLDevice *)v7;

    -[NTKKaleidoscopeResourceManager _loadMTLBufferData](v4, "_loadMTLBufferData");
    -[NTKKaleidoscopeResourceManager _loadPrograms](v4, "_loadPrograms");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKKaleidoscopeResourceManager;
  -[NTKKaleidoscopeResourceManager dealloc](&v2, sel_dealloc);
}

- (void)_asyncDeallocInstance
{
  int v2;
  void *v3;

  v2 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = (void *)objc_opt_class();
  if (v2)
    objc_msgSend(v3, "_deallocInstance:", 0);
  else
    objc_msgSend(v3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__deallocInstance_, 0, 0);
}

- (void)addClient
{
  NTKKaleidoscopeResourceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);

}

- (void)removeClient
{
  NTKKaleidoscopeResourceManager *v2;
  uint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
    -[NTKKaleidoscopeResourceManager _asyncDeallocInstance](v2, "_asyncDeallocInstance");
}

- (void)_loadMTLBufferData
{
  id v3;
  float32x2_t *v4;
  float32x2_t *v5;
  int v6;
  uint64_t v7;
  float32x2_t v8;
  __float2 v9;
  __float2 v10;
  MTLBuffer *mtlBuffer;

  v3 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 128, 0));
  v4 = (float32x2_t *)objc_msgSend(v3, "contents");
  *(_OWORD *)v4->f32 = geomKaleidoscopeQuad;
  *(_OWORD *)v4[2].f32 = unk_1B755FD60;
  v5 = v4 + 5;
  v6 = 17;
  v7 = 6;
  v8 = (float32x2_t)vdup_n_s32(0x3F866666u);
  do
  {
    v9 = __sincosf_stret((float)(v7 + 10) * 0.5236);
    v5[-1] = vmul_f32((float32x2_t)__PAIR64__(LODWORD(v9.__sinval), LODWORD(v9.__cosval)), v8);
    v10 = __sincosf_stret((float)v6 * 0.5236);
    *v5 = vmul_f32((float32x2_t)__PAIR64__(LODWORD(v10.__sinval), LODWORD(v10.__cosval)), v8);
    v5 += 2;
    ++v6;
    --v7;
  }
  while (v7);
  mtlBuffer = self->_mtlBuffer;
  self->_mtlBuffer = (MTLBuffer *)v3;

}

- (id)_pipelineStateForShaderType:(unint64_t)a3 vertexName:(id)a4 fragmentName:(id)a5 inLibrary:(id)a6 archive:(id)a7 allowsBlending:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  unint64_t viewMtlPixelFormat;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;

  v8 = a8;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = CFSTR("off");
  if (v8)
    v18 = CFSTR("on");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_blend_%@"), _pipelineNames[a3], v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v50 = v8;
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setConstantValue:type:atIndex:", &v50, 53, 0);
  objc_msgSend(MEMORY[0x1E0CC6AB0], "functionDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v14;
  objc_msgSend(v21, "setName:", v14);
  objc_msgSend(v21, "setConstantValues:", v20);
  v22 = objc_msgSend(v17, "newFunctionInLibrary:withDescriptor:", v16, v21);
  v48 = v15;
  objc_msgSend(v21, "setName:", v15);
  v46 = v16;
  v23 = (void *)objc_msgSend(v17, "newFunctionInLibrary:withDescriptor:", v16, v21);
  v24 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  v47 = (void *)v19;
  objc_msgSend(v24, "setLabel:", v19);
  v45 = (void *)v22;
  objc_msgSend(v24, "setVertexFunction:", v22);
  objc_msgSend(v24, "setFragmentFunction:", v23);
  viewMtlPixelFormat = self->_viewMtlPixelFormat;
  objc_msgSend(v24, "colorAttachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPixelFormat:", viewMtlPixelFormat);

  if (v8)
  {
    objc_msgSend(v24, "colorAttachments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBlendingEnabled:", 1);

    objc_msgSend(v24, "colorAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setRgbBlendOperation:", 0);

    objc_msgSend(v24, "colorAttachments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlphaBlendOperation:", 0);

    objc_msgSend(v24, "colorAttachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSourceRGBBlendFactor:", 4);

    objc_msgSend(v24, "colorAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSourceAlphaBlendFactor:", 4);

    objc_msgSend(v24, "colorAttachments");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setDestinationRGBBlendFactor:", 5);

    objc_msgSend(v24, "colorAttachments");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDestinationAlphaBlendFactor:", 5);

  }
  v42 = objc_msgSend(v17, "newRenderPipelineStateForDevice:withDescriptor:", self->_device, v24);
  if (!v42)
    -[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:].cold.1();
  v43 = (void *)v42;

  return v43;
}

- (void)_queue_setupPipelineForType:(unint64_t)a3 vertexName:(id)a4 fragmentName:(id)a5 inLibrary:(id)a6 archive:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:](self, "_pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:", a3, v15, v14, v13, v12, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (char *)self + 16 * a3;
  v18 = (void *)*((_QWORD *)v17 + 5);
  *((_QWORD *)v17 + 5) = v16;

  -[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:](self, "_pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:", a3, v15, v14, v13, v12, 1);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)*((_QWORD *)v17 + 6);
  *((_QWORD *)v17 + 6) = v19;

}

- (void)_loadPrograms
{
  MTLDevice *device;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  device = self->_device;
  if (_cachedCurrentBundle_onceToken != -1)
    dispatch_once(&_cachedCurrentBundle_onceToken, &__block_literal_global_155);
  v8 = 0;
  v4 = (id)_cachedCurrentBundle___bundle;
  v5 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v4, &v8);
  v6 = v8;

  objc_msgSend(off_1E6BCA6F8, "archiveWithName:bundle:device:", CFSTR("NTKKaleidoscopeShaders"), self->_bundle, self->_device);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKKaleidoscopeResourceManager _queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:](self, "_queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:", 0, CFSTR("kal_circle_vert"), CFSTR("kal_faceted_frag"), v5, v7);
  -[NTKKaleidoscopeResourceManager _queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:](self, "_queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:", 1, CFSTR("kal_circle_vert"), CFSTR("kal_radial_frag"), v5, v7);
  -[NTKKaleidoscopeResourceManager _queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:](self, "_queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:", 2, CFSTR("kal_circle_vert"), CFSTR("kal_rosette_frag"), v5, v7);
  -[NTKKaleidoscopeResourceManager _queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:](self, "_queue_setupPipelineForType:vertexName:fragmentName:inLibrary:archive:", 3, CFSTR("kal_fullscreen_vert"), CFSTR("kal_faceted_fullscreen_frag"), v5, v7);

}

- (id)getPipelineForShaderType:(unint64_t)a3 blending:(BOOL)a4
{
  return self->_renderPipelines[a3][a4];
}

- (id)getGeometryBuffer
{
  return self->_mtlBuffer;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_mtlBuffer, 0);
  for (i = 96; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (void)sharedInstanceWithPixelFormat:.cold.1()
{
  __assert_rtn("+[NTKKaleidoscopeResourceManager sharedInstanceWithPixelFormat:]", "NTKKaleidoscopeResourceManager.m", 75, "((NTKKaleidoscopeResourceManager*)__sharedInstance)->_viewMtlPixelFormat == pixFmt");
}

- (void)_pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:.cold.1()
{
  __assert_rtn("-[NTKKaleidoscopeResourceManager _pipelineStateForShaderType:vertexName:fragmentName:inLibrary:archive:allowsBlending:]", "NTKKaleidoscopeResourceManager.m", 232, "pipelineState != nil");
}

@end
