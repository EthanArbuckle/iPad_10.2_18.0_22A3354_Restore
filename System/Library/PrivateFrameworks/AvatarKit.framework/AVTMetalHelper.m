@implementation AVTMetalHelper

- (id)_initWithDevice:(id)a3
{
  id v5;
  AVTMetalHelper *v6;
  AVTMetalHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTMetalHelper;
  v6 = -[AVTMetalHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)helperForDevice:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&helperForDevice___lock);
  if (!helperForDevice___helpers)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)helperForDevice___helpers;
    helperForDevice___helpers = (uint64_t)v3;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "registryID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)helperForDevice___helpers, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[AVTMetalHelper _initWithDevice:]([AVTMetalHelper alloc], "_initWithDevice:", v2);
    objc_msgSend((id)helperForDevice___helpers, "setObject:forKeyedSubscript:", v6, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&helperForDevice___lock);

  return v6;
}

- (id)device
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (void)_locked_instanciateLibraryIfNeeded
{
  id *v3;
  MTLLibrary *v4;
  MTLLibrary *library;
  id v6;

  if (!self->_library)
  {
    +[AVTResourceLocator sharedResourceLocator]();
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v3, (uint64_t)CFSTR("default.metallib"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](self->_device, "newLibraryWithURL:error:", v6, 0);
    library = self->_library;
    self->_library = v4;

  }
}

- (os_unfair_lock_s)library
{
  os_unfair_lock_s *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = *(void **)&a1[4]._os_unfair_lock_opaque;
    if (!v2)
    {
      os_unfair_lock_lock(a1 + 6);
      -[os_unfair_lock_s _locked_instanciateLibraryIfNeeded](v1, "_locked_instanciateLibraryIfNeeded");
      os_unfair_lock_unlock(v1 + 6);
      v2 = *(void **)&v1[4]._os_unfair_lock_opaque;
    }
    a1 = v2;
  }
  return a1;
}

- (id)functionNamed:(id)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*((id *)a1 + 4), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)a1 + 6);
      objc_msgSend(a1, "_locked_functionNamed:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock((os_unfair_lock_t)a1 + 6);
    }
    a1 = v4;

  }
  return a1;
}

- (id)_locked_functionNamed:(id)a3
{
  id v4;
  NSMutableDictionary *functions;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  functions = self->_functions;
  if (!functions)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_functions;
    self->_functions = v6;

    functions = self->_functions;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](functions, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[AVTMetalHelper _locked_instanciateLibraryIfNeeded](self, "_locked_instanciateLibraryIfNeeded");
    v8 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_functions, "setObject:forKeyedSubscript:", v8, v4);
    if (!v8)
    {
      avt_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AVTMetalHelper _locked_functionNamed:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      v8 = 0;
    }
  }

  return v8;
}

- (id)renderPipelineStateWithDescriptor:(void *)a1
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  void *v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  _OWORD v27[4];
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;

  v3 = a1;
  if (a1)
  {
    v4 = 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * *(_QWORD *)a2) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)a2) >> 47));
    v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
    v6 = 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69
         * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ *(_QWORD *)(a2 + 8))) >> 47) ^ (0x9DDFEA08EB382D69
                                                                              * (v5 ^ *(_QWORD *)(a2 + 8))))) ^ ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ *(_QWORD *)(a2 + 8))) >> 47) ^ (0x9DDFEA08EB382D69 * (v5 ^ *(_QWORD *)(a2 + 8))))) >> 47));
    if (*(_BYTE *)(a2 + 16))
    {
      v7 = 0x9DDFEA08EB382D69 * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ 1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ 1)));
      v8 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                         * (*(_QWORD *)(a2 + 24) ^ (0x9DDFEA08EB382D69
                                                                                  * (v7 ^ (v7 >> 47))))) >> 47) ^ (0x9DDFEA08EB382D69 * (*(_QWORD *)(a2 + 24) ^ (0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47))))));
      v9 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                         * ((0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47))) ^ *(_QWORD *)(a2 + 32))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47))) ^ *(_QWORD *)(a2 + 32))));
      v10 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v9 ^ (v9 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                          * ((0x9DDFEA08EB382D69 * (v9 ^ (v9 >> 47))) ^ *(_QWORD *)(a2 + 40))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v9 ^ (v9 >> 47))) ^ *(_QWORD *)(a2 + 40))));
      v11 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                            * ((0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47))) ^ *(_QWORD *)(a2 + 48))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v10 ^ (v10 >> 47))) ^ *(_QWORD *)(a2 + 48))));
      v12 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                            * ((0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))) ^ *(_QWORD *)(a2 + 56))) >> 47) ^ (0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))) ^ *(_QWORD *)(a2 + 56))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v6 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69
           * (v13 ^ ((0x9DDFEA08EB382D69 * (v13 ^ *(_QWORD *)(a2 + 64))) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                   * (v13 ^ *(_QWORD *)(a2 + 64))))) ^ ((0x9DDFEA08EB382D69 * (v13 ^ ((0x9DDFEA08EB382D69 * (v13 ^ *(_QWORD *)(a2 + 64))) >> 47) ^ (0x9DDFEA08EB382D69 * (v13 ^ *(_QWORD *)(a2 + 64))))) >> 47));
    }
    v14 = objc_msgSend(*(id *)(a2 + 72), "hash");
    v15 = objc_msgSend(*(id *)(a2 + 80), "hash");
    v16 = 0x9DDFEA08EB382D69
        * (v6 ^ ((0x9DDFEA08EB382D69 * (v14 ^ v6)) >> 47) ^ (0x9DDFEA08EB382D69 * (v14 ^ v6)));
    v17 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69 * (v16 ^ (v16 >> 47))) ^ ((0x9DDFEA08EB382D69
                                                          * (v15 ^ (0x9DDFEA08EB382D69 * (v16 ^ (v16 >> 47))))) >> 47) ^ (0x9DDFEA08EB382D69 * (v15 ^ (0x9DDFEA08EB382D69 * (v16 ^ (v16 >> 47))))));
    v18 = 0x9DDFEA08EB382D69 * (v17 ^ (v17 >> 47));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x9DDFEA08EB382D69* ((0x9DDFEA08EB382D69* (v18 ^ ((0x9DDFEA08EB382D69 * (*(_QWORD *)(a2 + 88) ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69* (*(_QWORD *)(a2 + 88) ^ v18)))) ^ ((0x9DDFEA08EB382D69 * (v18 ^ ((0x9DDFEA08EB382D69 * (*(_QWORD *)(a2 + 88) ^ v18)) >> 47) ^ (0x9DDFEA08EB382D69 * (*(_QWORD *)(a2 + 88) ^ v18)))) >> 47)));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v3 + 5), "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      os_unfair_lock_lock((os_unfair_lock_t)v3 + 6);
      v21 = *(_OWORD *)(a2 + 48);
      v27[2] = *(_OWORD *)(a2 + 32);
      v27[3] = v21;
      v22 = *(void **)(a2 + 72);
      v28 = *(_QWORD *)(a2 + 64);
      v23 = *(_OWORD *)(a2 + 16);
      v27[0] = *(_OWORD *)a2;
      v27[1] = v23;
      v29 = v22;
      v24 = *(id *)(a2 + 80);
      v25 = *(_QWORD *)(a2 + 88);
      v30 = v24;
      v31 = v25;
      objc_msgSend(v3, "_locked_renderPipelineStateWithDescriptor:hashNumber:", v27, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock((os_unfair_lock_t)v3 + 6);
    }
    v3 = v20;

  }
  return v3;
}

- (id)_locked_renderPipelineStateWithDescriptor:(id *)a3 hashNumber:(id)a4
{
  id v6;
  NSMutableDictionary *renderPipelineStates;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MTLDevice *device;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  v6 = a4;
  renderPipelineStates = self->_renderPipelineStates;
  if (!renderPipelineStates)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_renderPipelineStates;
    self->_renderPipelineStates = v8;

    renderPipelineStates = self->_renderPipelineStates;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](renderPipelineStates, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CC6B70]);
    objc_msgSend(v11, "colorAttachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setPixelFormat:", a3->var0);
    objc_msgSend(v11, "setDepthAttachmentPixelFormat:", a3->var1);
    objc_msgSend(v13, "setBlendingEnabled:", a3->var2);
    objc_msgSend(v13, "setRgbBlendOperation:", a3->var3);
    objc_msgSend(v13, "setSourceRGBBlendFactor:", a3->var4);
    objc_msgSend(v13, "setDestinationRGBBlendFactor:", a3->var5);
    objc_msgSend(v13, "setAlphaBlendOperation:", a3->var6);
    objc_msgSend(v13, "setSourceAlphaBlendFactor:", a3->var7);
    objc_msgSend(v13, "setDestinationAlphaBlendFactor:", a3->var8);
    -[AVTMetalHelper _locked_functionNamed:](self, "_locked_functionNamed:", a3->var9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVertexFunction:", v14);

    -[AVTMetalHelper _locked_functionNamed:](self, "_locked_functionNamed:", a3->var10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFragmentFunction:", v15);

    objc_msgSend(v11, "setRasterSampleCount:", a3->var11);
    device = self->_device;
    v27 = 0;
    v10 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v11, &v27);
    v17 = v27;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderPipelineStates, "setObject:forKeyedSubscript:", v10, v6);

    if (!v10)
    {
      avt_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AVTMetalHelper _locked_renderPipelineStateWithDescriptor:hashNumber:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

      v10 = 0;
    }
  }

  return v10;
}

- (id)computePipelineStateWithFunctionName:(id)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*((id *)a1 + 6), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)a1 + 6);
      objc_msgSend(a1, "_locked_computePipelineStateWithFunctionName:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock((os_unfair_lock_t)a1 + 6);
    }
    a1 = v4;

  }
  return a1;
}

- (id)_locked_computePipelineStateWithFunctionName:(id)a3
{
  id v4;
  NSMutableDictionary *computePipelineStates;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  MTLDevice *device;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v4 = a3;
  computePipelineStates = self->_computePipelineStates;
  if (!computePipelineStates)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_computePipelineStates;
    self->_computePipelineStates = v6;

    computePipelineStates = self->_computePipelineStates;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](computePipelineStates, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[AVTMetalHelper _locked_functionNamed:](self, "_locked_functionNamed:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    v21 = 0;
    v8 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](device, "newComputePipelineStateWithFunction:error:", v9, &v21);
    v11 = v21;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computePipelineStates, "setObject:forKeyedSubscript:", v8, v4);

    if (!v8)
    {
      avt_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AVTMetalHelper _locked_renderPipelineStateWithDescriptor:hashNumber:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computePipelineStates, 0);
  objc_storeStrong((id *)&self->_renderPipelineStates, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_locked_functionNamed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

- (void)_locked_renderPipelineStateWithDescriptor:(uint64_t)a3 hashNumber:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

@end
