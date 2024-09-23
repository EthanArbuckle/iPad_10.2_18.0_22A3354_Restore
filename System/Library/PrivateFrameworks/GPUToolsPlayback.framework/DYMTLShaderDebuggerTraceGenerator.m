@implementation DYMTLShaderDebuggerTraceGenerator

- (DYMTLShaderDebuggerTraceGenerator)initWithDebugFunctionPlayer:(id)a3
{
  id v5;
  DYMTLShaderDebuggerTraceGenerator *v6;
  DYMTLShaderDebuggerTraceGenerator *v7;
  uint64_t v8;
  DYMTLIndirectArgumentBufferManager *indirectArgumentManager;
  void *v10;
  NSDictionary *constantSamplerReflection;
  uint64_t v12;
  MTLBuffer *placeholderBuffer;
  id v14;
  uint64_t v15;
  MTLSamplerState *placeholderSamplerState;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MTLArgumentEncoder *dummyArgumentEncoder;
  uint64_t v22;
  MTLBuffer *dummyArgumentBuffer;
  objc_super v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DYMTLShaderDebuggerTraceGenerator;
  v6 = -[DYMTLShaderDebuggerTraceGenerator init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    objc_msgSend(v5, "indirectArgumentManager");
    v8 = objc_claimAutoreleasedReturnValue();
    indirectArgumentManager = v7->_indirectArgumentManager;
    v7->_indirectArgumentManager = (DYMTLIndirectArgumentBufferManager *)v8;

    -[DYMTLFunctionPlayer device](v7->_player, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    constantSamplerReflection = v7->_constantSamplerReflection;
    v7->_constantSamplerReflection = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v12 = objc_msgSend(v10, "newBufferWithLength:options:", 2048, 0);
    placeholderBuffer = v7->_placeholderBuffer;
    v7->_placeholderBuffer = (MTLBuffer *)v12;

    v14 = objc_alloc_init(MEMORY[0x24BDDD6E8]);
    objc_msgSend(v14, "setSupportArgumentBuffers:", 1);
    v15 = objc_msgSend(v10, "newSamplerStateWithDescriptor:", v14);
    placeholderSamplerState = v7->_placeholderSamplerState;
    v7->_placeholderSamplerState = (MTLSamplerState *)v15;

    objc_msgSend(MEMORY[0x24BDDD4C8], "argumentDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDataType:", 58);
    objc_msgSend(v17, "setIndex:", 0);
    objc_msgSend(MEMORY[0x24BDDD4C8], "argumentDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataType:", 59);
    objc_msgSend(v18, "setIndex:", 1);
    v26[0] = v17;
    v26[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "newArgumentEncoderWithArguments:", v19);
    dummyArgumentEncoder = v7->_dummyArgumentEncoder;
    v7->_dummyArgumentEncoder = (MTLArgumentEncoder *)v20;

    v22 = objc_msgSend(v10, "newBufferWithLength:options:", 4096, 0);
    dummyArgumentBuffer = v7->_dummyArgumentBuffer;
    v7->_dummyArgumentBuffer = (MTLBuffer *)v22;

    -[MTLArgumentEncoder setArgumentBuffer:offset:](v7->_dummyArgumentEncoder, "setArgumentBuffer:offset:", v7->_dummyArgumentBuffer, 0);
  }

  return v7;
}

- (id)_placeholderTextureWithType:(unint64_t)a3
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLTextureType, id<MTLTexture>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLTextureType, id<MTLTexture>>, void *>>> *v6;
  unint64_t v7;
  BOOL v8;
  char **v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v14;
  void *v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t *v18;

  v17 = a3;
  p_pair1 = &self->_placeholderTextures.__tree_.__pair1_;
  left = (char *)self->_placeholderTextures.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = &self->_placeholderTextures.__tree_.__pair1_;
    do
    {
      v7 = *((_QWORD *)left + 4);
      v8 = v7 >= a3;
      if (v7 >= a3)
        v9 = (char **)left;
      else
        v9 = (char **)(left + 8);
      if (v8)
        v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLTextureType, id<MTLTexture>>, void *>>> *)left;
      left = *v9;
    }
    while (*v9);
    if (v6 != p_pair1 && v6[4].__value_.__left_ <= (void *)a3)
      return v6[5].__value_.__left_;
  }
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 < 2)
    goto LABEL_15;
  if (a3 == 4)
  {
    v11 = 1;
LABEL_19:
    v12 = 16;
    goto LABEL_20;
  }
  if (a3 != 9)
  {
    v11 = 0;
    goto LABEL_19;
  }
LABEL_15:
  v11 = 0;
  v12 = 1;
LABEL_20:
  v14 = objc_alloc_init(MEMORY[0x24BDDD748]);
  objc_msgSend(v14, "setTextureType:", a3);
  objc_msgSend(v14, "setPixelFormat:", 125);
  objc_msgSend(v14, "setWidth:", 16);
  objc_msgSend(v14, "setHeight:", v12);
  objc_msgSend(v14, "setDepth:", 1);
  objc_msgSend(v14, "setMipmapLevelCount:", 1);
  if (v11)
  {
    objc_msgSend(v14, "setSampleCount:", 4);
    objc_msgSend(v14, "setResourceOptions:", 32);
  }
  DYMTLNewTexture(v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = &v17;
  v16 = std::__tree<std::__value_type<unsigned long long,unsigned long long>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,unsigned long long>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&p_pair1[-1], &v17, (uint64_t)&std::piecewise_construct, (uint64_t **)&v18);
  objc_storeStrong((id *)v16 + 5, v15);

  return v15;
}

- (id)_instrumentLibrary:(id)a3 generationOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSString *onlineSrc;
  id v27;
  NSString *v28;
  void *v29;
  NSString *v30;
  NSString *errorStr;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  id v37;
  id v38;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "code");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v8, "debugType");
    else
      v10 = objc_msgSend(v8, "type");
    v11 = v10;
    objc_msgSend(v8, "compileOptions");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DYMTLGetAssociatedObject(v6, 3u);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "type");
    objc_msgSend(v8, "code");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "compileOptions");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  if (v11 == 2)
  {
    v14 = (void *)objc_msgSend(v13, "copy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(MEMORY[0x24BDDD530]);
    v18 = v16;

    objc_msgSend(v18, "setTracingEnabled:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v18, "setAdditionalCompilerArguments:", CFSTR("-fno-tracepoint-instrument-line-markers"));
    objc_msgSend(v6, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "argumentBuffersSupport");

    if (!v24)
      objc_msgSend(v18, "setAdditionalCompilerArguments:", CFSTR("-fno-tracepoint-instrument-argument-buffers"));
    objc_storeStrong((id *)&self->_onlineSrc, v9);
    objc_msgSend(v6, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    onlineSrc = self->_onlineSrc;
    v38 = 0;
    v21 = (void *)objc_msgSend(v25, "newLibraryWithSource:options:error:", onlineSrc, v18, &v38);
    v22 = v38;

    if (v21)
      goto LABEL_19;
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v22, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Error creating instrumented library: %@"), v19);
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorStr = self->_errorStr;
    self->_errorStr = v30;

    goto LABEL_23;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE394D8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v28 = self->_errorStr;
    self->_errorStr = (NSString *)CFSTR("kDYMTLShaderDebuggerInstrumentedMetallib is nil");

    v22 = 0;
LABEL_24:
    v27 = 0;
    goto LABEL_25;
  }
  v18 = objc_retainAutorelease(v17);
  v19 = dispatch_data_create((const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), 0, 0);
  objc_msgSend(v6, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v21 = (void *)objc_msgSend(v20, "newLibraryWithData:error:", v19, &v37);
  v22 = v37;

  if (!v21)
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v22, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Error creating instrumented library: %@"), v33);
    v34 = (NSString *)objc_claimAutoreleasedReturnValue();
    v35 = self->_errorStr;
    self->_errorStr = v34;

LABEL_23:
    goto LABEL_24;
  }

LABEL_19:
  v27 = v21;
LABEL_25:

  return v27;
}

- (BOOL)_kernelBindingNeedsPlaceholderResource:(id)a3 computeCommandEncoder:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isActive") & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v8 = objc_msgSend(v5, "type");
    if (v8)
    {
      if (v8 == 2)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_2;
        v12[3] = &unk_250D6F548;
        v9 = v12;
        v12[4] = v5;
        v12[5] = &v14;
        objc_msgSend(v6, "enumerateTexturesUsingBlock:", v12);
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          v7 = *((_BYTE *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_3;
        v11[3] = &unk_250D6F570;
        v9 = v11;
        v11[4] = v5;
        v11[5] = &v14;
        objc_msgSend(v6, "enumerateSamplersUsingBlock:", v11);
      }
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke;
      v13[3] = &unk_250D6F250;
      v9 = v13;
      v13[4] = v5;
      v13[5] = &v14;
      objc_msgSend(v6, "enumerateBuffersUsingBlock:", v13);
    }

    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

void __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;

  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = *(_QWORD *)(a2 + 8);
    if (*(_QWORD *)a2)
    {
      if (!v7)
      {
        v8 = *(id *)a2;
        v9 = objc_msgSend(v8, "length");
        if (v9 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

      }
    }
    else if (v7)
    {
      v10 = *(_QWORD *)(a2 + 16);
      if (v10 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

void __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = objc_msgSend(v8, "textureType");
    if (v7 == objc_msgSend(*(id *)(a1 + 32), "textureType"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __98__DYMTLShaderDebuggerTraceGenerator__kernelBindingNeedsPlaceholderResource_computeCommandEncoder___block_invoke_3(uint64_t a1, _QWORD *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "index");
  if (result == a3)
  {
    if (*a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_vertexBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isActive") & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v8 = objc_msgSend(v5, "type");
    if (v8)
    {
      if (v8 == 2)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2;
        v12[3] = &unk_250D6F548;
        v9 = v12;
        v12[4] = v5;
        v12[5] = &v14;
        objc_msgSend(v6, "enumerateVertexTexturesUsingBlock:", v12);
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          v7 = *((_BYTE *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3;
        v11[3] = &unk_250D6F570;
        v9 = v11;
        v11[4] = v5;
        v11[5] = &v14;
        objc_msgSend(v6, "enumerateVertexSamplersUsingBlock:", v11);
      }
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke;
      v13[3] = &unk_250D6F250;
      v9 = v13;
      v13[4] = v5;
      v13[5] = &v14;
      objc_msgSend(v6, "enumerateVertexBuffersUsingBlock:", v13);
    }

    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

void __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;

  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = *(_QWORD *)(a2 + 8);
    if (*(_QWORD *)a2)
    {
      if (!v7)
      {
        v8 = *(id *)a2;
        v9 = objc_msgSend(v8, "length");
        if (v9 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

      }
    }
    else if (v7)
    {
      v10 = *(_QWORD *)(a2 + 16);
      if (v10 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

void __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = objc_msgSend(v8, "textureType");
    if (v7 == objc_msgSend(*(id *)(a1 + 32), "textureType"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __97__DYMTLShaderDebuggerTraceGenerator__vertexBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3(uint64_t a1, _QWORD *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "index");
  if (result == a3)
  {
    if (*a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_fragmentBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isActive") & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v8 = objc_msgSend(v5, "type");
    if (v8)
    {
      if (v8 == 2)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2;
        v12[3] = &unk_250D6F548;
        v9 = v12;
        v12[4] = v5;
        v12[5] = &v14;
        objc_msgSend(v6, "enumerateFragmentTexturesUsingBlock:", v12);
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          v7 = *((_BYTE *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3;
        v11[3] = &unk_250D6F570;
        v9 = v11;
        v11[4] = v5;
        v11[5] = &v14;
        objc_msgSend(v6, "enumerateFragmentSamplersUsingBlock:", v11);
      }
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke;
      v13[3] = &unk_250D6F250;
      v9 = v13;
      v13[4] = v5;
      v13[5] = &v14;
      objc_msgSend(v6, "enumerateFragmentBuffersUsingBlock:", v13);
    }

    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

void __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;

  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = *(_QWORD *)(a2 + 8);
    if (*(_QWORD *)a2)
    {
      if (!v7)
      {
        v8 = *(id *)a2;
        v9 = objc_msgSend(v8, "length");
        if (v9 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

      }
    }
    else if (v7)
    {
      v10 = *(_QWORD *)(a2 + 16);
      if (v10 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

void __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = objc_msgSend(v8, "textureType");
    if (v7 == objc_msgSend(*(id *)(a1 + 32), "textureType"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __99__DYMTLShaderDebuggerTraceGenerator__fragmentBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3(uint64_t a1, _QWORD *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "index");
  if (result == a3)
  {
    if (*a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_tileBindingNeedsPlaceholderResource:(id)a3 renderCommandEncoder:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isActive") & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v8 = objc_msgSend(v5, "type");
    if (v8)
    {
      if (v8 == 2)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2;
        v12[3] = &unk_250D6F548;
        v9 = v12;
        v12[4] = v5;
        v12[5] = &v14;
        objc_msgSend(v6, "enumerateTileTexturesUsingBlock:", v12);
      }
      else
      {
        if (v8 != 3)
        {
LABEL_10:
          v7 = *((_BYTE *)v15 + 24) != 0;
          _Block_object_dispose(&v14, 8);
          goto LABEL_11;
        }
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3;
        v11[3] = &unk_250D6F570;
        v9 = v11;
        v11[4] = v5;
        v11[5] = &v14;
        objc_msgSend(v6, "enumerateTileSamplersUsingBlock:", v11);
      }
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke;
      v13[3] = &unk_250D6F250;
      v9 = v13;
      v13[4] = v5;
      v13[5] = &v14;
      objc_msgSend(v6, "enumerateTileBuffersUsingBlock:", v13);
    }

    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

void __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;

  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = *(_QWORD *)(a2 + 8);
    if (*(_QWORD *)a2)
    {
      if (!v7)
      {
        v8 = *(id *)a2;
        v9 = objc_msgSend(v8, "length");
        if (v9 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

      }
    }
    else if (v7)
    {
      v10 = *(_QWORD *)(a2 + 16);
      if (v10 >= objc_msgSend(*(id *)(a1 + 32), "bufferDataSize"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    *a4 = 1;
  }
}

void __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "index") == a3)
  {
    v7 = objc_msgSend(v8, "textureType");
    if (v7 == objc_msgSend(*(id *)(a1 + 32), "textureType"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __95__DYMTLShaderDebuggerTraceGenerator__tileBindingNeedsPlaceholderResource_renderCommandEncoder___block_invoke_3(uint64_t a1, _QWORD *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "index");
  if (result == a3)
  {
    if (*a2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_prepareRenderCommandEncoder:(id)a3 generationOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  BOOL v35;
  id v36;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *next;
  void *v38;
  void *v39;
  NSString *errorStr;
  BOOL v41;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  unint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  id v62;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *p_p1;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  int v71;
  int v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  unint64_t v79;
  uint64_t *v80;
  uint64_t *v81;
  id v82;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *v83;
  void *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[4];
  id v107;
  DYMTLShaderDebuggerTraceGenerator *v108;
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[5];
  id v112;
  _QWORD v113[4];
  id v114;
  DYMTLShaderDebuggerTraceGenerator *v115;
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[5];
  id v119;
  _QWORD v120[4];
  id v121;
  DYMTLShaderDebuggerTraceGenerator *v122;
  id v123;
  _QWORD v124[5];
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  _QWORD *(*v128)(_QWORD *, _QWORD *);
  void (*v129)(uint64_t);
  const char *v130;
  _QWORD **v131;
  _QWORD *v132;
  uint64_t v133;
  _QWORD v134[5];
  _QWORD v135[5];
  id v136;
  id *v137[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BE39578]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BE394E0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "renderPipelineState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLGetNullableAssociatedObject(v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", objc_msgSend(v10, "unsignedLongLongValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[DYMTLShaderDebuggerTraceGenerator _instrumentLibrary:generationOptions:](self, "_instrumentLibrary:generationOptions:", v14, v7);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (v105)
    {
      DYMTLGetAssociatedObject(v11, 2u);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      switch((int)v9)
      {
        case 0:
          DYMTLGetAssociatedObject(v11, 1u);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v42, "copy");

          objc_msgSend(v39, "setMaxTotalThreadsPerThreadgroup:", objc_msgSend(v11, "maxTotalThreadsPerThreadgroup"));
          objc_msgSend(v39, "tileFunction");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:](self, "_createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:", v105, v102);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v43
            || (v87 = v43,
                objc_msgSend(v39, "setTileFunction:"),
                v44 = -[DYMTLShaderDebuggerTraceGenerator _createAndSetInstrumentedTileRenderPipelineStateWithDescriptor:renderCommandEncoder:](self, "_createAndSetInstrumentedTileRenderPipelineStateWithDescriptor:renderCommandEncoder:", v39, v6), v43 = v87, !v44))
          {

            goto LABEL_46;
          }
          objc_msgSend(v104, "tileBindings", v87);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v14;
          v46 = MEMORY[0x24BDAC760];
          v111[0] = MEMORY[0x24BDAC760];
          v111[1] = 3221225472;
          v111[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_7;
          v111[3] = &unk_250D6F598;
          v111[4] = self;
          v47 = v6;
          v112 = v47;
          v97 = v6;
          v99 = v7;
          v93 = v11;
          v95 = v10;
          objc_msgSend(v45, "enumerateObjectsUsingBlock:", v111);

          v110[0] = v46;
          v110[1] = 3221225472;
          v110[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_8;
          v110[3] = &unk_250D6F5C0;
          v110[4] = self;
          objc_msgSend(v47, "enumerateTileTexturesUsingBlock:", v110);
          v125 = 0;
          v126 = &v125;
          v127 = 0x4812000000;
          v128 = __Block_byref_object_copy__2;
          v129 = __Block_byref_object_dispose__2;
          v133 = 0;
          v132 = 0;
          v130 = "";
          v131 = &v132;
          v109[0] = v46;
          v109[1] = 3221225472;
          v109[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_9;
          v109[3] = &unk_250D6F5E8;
          v109[4] = &v125;
          objc_msgSend(v47, "enumerateTileSamplersUsingBlock:", v109);
          v48 = (uint64_t *)v126[6];
          v49 = v126 + 7;
          if (v48 != v126 + 7)
          {
            do
            {
              v50 = v48[4];
              v51 = (void *)v48[5];
              v52 = *((_DWORD *)v48 + 12);
              v53 = *((_DWORD *)v48 + 13);
              DYMTLGetAssociatedObject(v51, 0);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = (void *)objc_msgSend(v54, "copy");

              objc_msgSend(v55, "setSupportArgumentBuffers:", 1);
              objc_msgSend(v51, "device");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = (id)objc_msgSend(v56, "newSamplerStateWithDescriptor:", v55);

              -[MTLArgumentEncoder setSamplerState:atIndex:](self->_dummyArgumentEncoder, "setSamplerState:atIndex:", v123, 1);
              LODWORD(v57) = v52;
              LODWORD(v58) = v53;
              objc_msgSend(v47, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v123, v50, v57, v58);
              v59 = -[DYMTLFunctionPlayer keyForOriginalObject:](self->_player, "keyForOriginalObject:", v51);
              v137[0] = &v123;
              std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v123, (uint64_t)&std::piecewise_construct, v137)[5] = v59;

              v60 = (uint64_t *)v48[1];
              if (v60)
              {
                do
                {
                  v61 = v60;
                  v60 = (uint64_t *)*v60;
                }
                while (v60);
              }
              else
              {
                do
                {
                  v61 = (uint64_t *)v48[2];
                  v35 = *v61 == (_QWORD)v48;
                  v48 = v61;
                }
                while (!v35);
              }
              v48 = v61;
            }
            while (v61 != v49);
          }
          v106[0] = MEMORY[0x24BDAC760];
          v106[1] = 3221225472;
          v106[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_10;
          v106[3] = &unk_250D6F610;
          v62 = v47;
          v107 = v62;
          v108 = self;
          objc_msgSend(v62, "enumerateTileBuffersUsingBlock:", v106);
          p_p1 = &self->_bytesBufferReplacements.__table_.__p1_;
          v7 = v99;
          v11 = v93;
          v10 = v95;
          v14 = v90;
          while (1)
          {
            p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)p_p1->__value_.__next_;
            if (!p_p1)
              break;
            objc_msgSend(v62, "setTileBuffer:offset:atIndex:", p_p1[3].__value_.__next_, 0, p_p1[2].__value_.__next_);
          }

          _Block_object_dispose(&v125, 8);
          std::__tree<BufferEntry>::destroy((uint64_t)&v131, v132);

          goto LABEL_52;
        case 1:
        case 3:
          objc_msgSend(v13, "vertexFunction");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:](self, "_createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:", v105, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16
            || (v101 = v16,
                objc_msgSend(v13, "setVertexFunction:"),
                v17 = -[DYMTLShaderDebuggerTraceGenerator _createAndSetInstrumentedRenderPipelineStateWithDescriptor:renderCommandEncoder:roiType:](self, "_createAndSetInstrumentedRenderPipelineStateWithDescriptor:renderCommandEncoder:roiType:", v13, v6, v9), v16 = v101, !v17))
          {

            goto LABEL_47;
          }
          objc_msgSend(v104, "vertexBindings", v101);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v15;
          v19 = MEMORY[0x24BDAC760];
          v135[0] = MEMORY[0x24BDAC760];
          v135[1] = 3221225472;
          v135[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke;
          v135[3] = &unk_250D6F598;
          v135[4] = self;
          v20 = v6;
          v136 = v20;
          v97 = v6;
          v98 = v7;
          v92 = v11;
          v94 = v10;
          v89 = v14;
          objc_msgSend(v18, "enumerateObjectsUsingBlock:", v135);

          v134[0] = v19;
          v134[1] = 3221225472;
          v134[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2;
          v134[3] = &unk_250D6F5C0;
          v134[4] = self;
          objc_msgSend(v20, "enumerateVertexTexturesUsingBlock:", v134);
          v125 = 0;
          v126 = &v125;
          v127 = 0x4812000000;
          v128 = __Block_byref_object_copy__2;
          v129 = __Block_byref_object_dispose__2;
          v133 = 0;
          v132 = 0;
          v130 = "";
          v131 = &v132;
          v124[0] = v19;
          v124[1] = 3221225472;
          v124[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_50;
          v124[3] = &unk_250D6F5E8;
          v124[4] = &v125;
          objc_msgSend(v20, "enumerateVertexSamplersUsingBlock:", v124);
          v21 = (uint64_t *)v126[6];
          v22 = v126 + 7;
          if (v21 != v126 + 7)
          {
            do
            {
              v23 = v21[4];
              v24 = *((_DWORD *)v21 + 12);
              v25 = *((_DWORD *)v21 + 13);
              v26 = (id)v21[5];
              DYMTLGetAssociatedObject(v26, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)objc_msgSend(v27, "copy");

              objc_msgSend(v28, "setSupportArgumentBuffers:", 1);
              objc_msgSend(v26, "device");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = (id)objc_msgSend(v29, "newSamplerStateWithDescriptor:", v28);

              -[MTLArgumentEncoder setSamplerState:atIndex:](self->_dummyArgumentEncoder, "setSamplerState:atIndex:", v123, 1);
              LODWORD(v30) = v24;
              LODWORD(v31) = v25;
              objc_msgSend(v20, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v123, v23, v30, v31);
              v32 = -[DYMTLFunctionPlayer keyForOriginalObject:](self->_player, "keyForOriginalObject:", v26);
              v137[0] = &v123;
              std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v123, (uint64_t)&std::piecewise_construct, v137)[5] = v32;

              v33 = (uint64_t *)v21[1];
              if (v33)
              {
                do
                {
                  v34 = v33;
                  v33 = (uint64_t *)*v33;
                }
                while (v33);
              }
              else
              {
                do
                {
                  v34 = (uint64_t *)v21[2];
                  v35 = *v34 == (_QWORD)v21;
                  v21 = v34;
                }
                while (!v35);
              }
              v21 = v34;
            }
            while (v34 != v22);
          }
          v120[0] = MEMORY[0x24BDAC760];
          v120[1] = 3221225472;
          v120[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2_51;
          v120[3] = &unk_250D6F610;
          v36 = v20;
          v121 = v36;
          v122 = self;
          objc_msgSend(v36, "enumerateVertexBuffersUsingBlock:", v120);
          next = &self->_bytesBufferReplacements.__table_.__p1_;
          v7 = v98;
          v38 = v101;
          v11 = v92;
          v10 = v94;
          v14 = v89;
          v39 = v86;
          while (1)
          {
            next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)next->__value_.__next_;
            if (!next)
              break;
            objc_msgSend(v36, "setVertexBuffer:offset:atIndex:", next[3].__value_.__next_, 0, next[2].__value_.__next_);
          }

          _Block_object_dispose(&v125, 8);
          std::__tree<BufferEntry>::destroy((uint64_t)&v131, v132);
          v84 = v136;
          goto LABEL_50;
        case 2:
          objc_msgSend(v13, "fragmentFunction");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:](self, "_createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:", v105, v39);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64
            && (objc_msgSend(v13, "setFragmentFunction:", v64),
                -[DYMTLShaderDebuggerTraceGenerator _createAndSetInstrumentedRenderPipelineStateWithDescriptor:renderCommandEncoder:roiType:](self, "_createAndSetInstrumentedRenderPipelineStateWithDescriptor:renderCommandEncoder:roiType:", v13, v6, 2)))
          {
            objc_msgSend(v104, "fragmentBindings");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v64;
            v118[0] = MEMORY[0x24BDAC760];
            v118[1] = 3221225472;
            v118[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_3;
            v118[3] = &unk_250D6F598;
            v118[4] = self;
            v66 = v6;
            v119 = v66;
            v97 = v6;
            v100 = v7;
            v96 = v10;
            v91 = v14;
            v103 = v39;
            objc_msgSend(v65, "enumerateObjectsUsingBlock:", v118);

            v67 = MEMORY[0x24BDAC760];
            v117[0] = MEMORY[0x24BDAC760];
            v117[1] = 3221225472;
            v117[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_4;
            v117[3] = &unk_250D6F5C0;
            v117[4] = self;
            objc_msgSend(v66, "enumerateFragmentTexturesUsingBlock:", v117);
            v125 = 0;
            v126 = &v125;
            v127 = 0x4812000000;
            v128 = __Block_byref_object_copy__2;
            v129 = __Block_byref_object_dispose__2;
            v133 = 0;
            v132 = 0;
            v130 = "";
            v131 = &v132;
            v116[0] = v67;
            v116[1] = 3221225472;
            v116[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_5;
            v116[3] = &unk_250D6F5E8;
            v116[4] = &v125;
            objc_msgSend(v66, "enumerateFragmentSamplersUsingBlock:", v116);
            v68 = (uint64_t *)v126[6];
            v69 = v126 + 7;
            if (v68 != v126 + 7)
            {
              do
              {
                v70 = v68[4];
                v71 = *((_DWORD *)v68 + 12);
                v72 = *((_DWORD *)v68 + 13);
                v73 = (id)v68[5];
                DYMTLGetAssociatedObject(v73, 0);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = (void *)objc_msgSend(v74, "copy");

                objc_msgSend(v75, "setSupportArgumentBuffers:", 1);
                objc_msgSend(v73, "device");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = (id)objc_msgSend(v76, "newSamplerStateWithDescriptor:", v75);

                -[MTLArgumentEncoder setSamplerState:atIndex:](self->_dummyArgumentEncoder, "setSamplerState:atIndex:", v123, 1);
                LODWORD(v77) = v71;
                LODWORD(v78) = v72;
                objc_msgSend(v66, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v123, v70, v77, v78);
                v79 = -[DYMTLFunctionPlayer keyForOriginalObject:](self->_player, "keyForOriginalObject:", v73);
                v137[0] = &v123;
                std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v123, (uint64_t)&std::piecewise_construct, v137)[5] = v79;

                v80 = (uint64_t *)v68[1];
                if (v80)
                {
                  do
                  {
                    v81 = v80;
                    v80 = (uint64_t *)*v80;
                  }
                  while (v80);
                }
                else
                {
                  do
                  {
                    v81 = (uint64_t *)v68[2];
                    v35 = *v81 == (_QWORD)v68;
                    v68 = v81;
                  }
                  while (!v35);
                }
                v68 = v81;
              }
              while (v81 != v69);
            }
            v113[0] = MEMORY[0x24BDAC760];
            v113[1] = 3221225472;
            v113[2] = __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_6;
            v113[3] = &unk_250D6F610;
            v82 = v66;
            v114 = v82;
            v115 = self;
            objc_msgSend(v82, "enumerateFragmentBuffersUsingBlock:", v113);
            v83 = &self->_bytesBufferReplacements.__table_.__p1_;
            v7 = v100;
            v39 = v103;
            v10 = v96;
            v14 = v91;
            v38 = v88;
            while (1)
            {
              v83 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)v83->__value_.__next_;
              if (!v83)
                break;
              objc_msgSend(v82, "setFragmentBuffer:offset:atIndex:", v83[3].__value_.__next_, 0, v83[2].__value_.__next_);
            }

            _Block_object_dispose(&v125, 8);
            std::__tree<BufferEntry>::destroy((uint64_t)&v131, v132);
            v84 = v119;
LABEL_50:

LABEL_52:
            v41 = 1;
            v6 = v97;
          }
          else
          {

LABEL_46:
LABEL_47:
            v41 = 0;
          }
LABEL_53:

          break;
        default:
          v41 = 1;
          goto LABEL_53;
      }
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    errorStr = self->_errorStr;
    self->_errorStr = (NSString *)CFSTR("kDYMTLShaderDebuggerLibraryId library not found in object map");

    v41 = 0;
  }

  return v41;
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_vertexBindingNeedsPlaceholderResource:renderCommandEncoder:"))
  {
    v3 = objc_msgSend(v5, "type");
    if (v3)
    {
      if (v3 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setVertexTexture:atIndex:", v4, objc_msgSend(v5, "index"));

      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setVertexSamplerState:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setVertexBuffer:offset:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }

}

uint64_t __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTexture:atIndex:", a2, 0);
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_50(uint64_t a1, void **a2, unint64_t a3)
{
  void *v5;
  uint64_t **v6;
  unint64_t v7;
  unint64_t *v8;

  v7 = a3;
  DYMTLGetAssociatedObject(*a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportArgumentBuffers") & 1) == 0)
  {
    v6 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v8 = &v7;
    *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
  }

}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_2_51(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  unint64_t v13;
  unint64_t *v14;

  v13 = a3;
  if (!*a2 && a2[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    v8 = a2[1];
    if (!*a2)
    {
      if (v8)
        v7 = a2[2];
    }
    v9 = objc_msgSend(v5, "newBufferWithBytes:length:options:", v8, v7, 0);

    v10 = *(_QWORD *)(a1 + 40) + 136;
    v14 = &v13;
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    v12 = (void *)v11[3];
    v11[3] = v9;

  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_fragmentBindingNeedsPlaceholderResource:renderCommandEncoder:"))
  {
    v3 = objc_msgSend(v5, "type");
    if (v3)
    {
      if (v3 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setFragmentTexture:atIndex:", v4, objc_msgSend(v5, "index"));

      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setFragmentSamplerState:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }

}

uint64_t __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTexture:atIndex:", a2, 0);
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_5(uint64_t a1, void **a2, unint64_t a3)
{
  void *v5;
  uint64_t **v6;
  unint64_t v7;
  unint64_t *v8;

  v7 = a3;
  DYMTLGetAssociatedObject(*a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportArgumentBuffers") & 1) == 0)
  {
    v6 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v8 = &v7;
    *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
  }

}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_6(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  unint64_t v13;
  unint64_t *v14;

  v13 = a3;
  if (!*a2 && a2[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    v8 = a2[1];
    if (!*a2)
    {
      if (v8)
        v7 = a2[2];
    }
    v9 = objc_msgSend(v5, "newBufferWithBytes:length:options:", v8, v7, 0);

    v10 = *(_QWORD *)(a1 + 40) + 136;
    v14 = &v13;
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    v12 = (void *)v11[3];
    v11[3] = v9;

  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_tileBindingNeedsPlaceholderResource:renderCommandEncoder:"))
  {
    v3 = objc_msgSend(v5, "type");
    if (v3)
    {
      if (v3 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setTileTexture:atIndex:", v4, objc_msgSend(v5, "index"));

      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setTileSamplerState:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setTileBuffer:offset:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }

}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_256BD5410))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTexture:atIndex:", v3, 0);

}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_9(uint64_t a1, void **a2, unint64_t a3)
{
  void *v5;
  uint64_t **v6;
  unint64_t v7;
  unint64_t *v8;

  v7 = a3;
  if (objc_msgSend(*a2, "conformsToProtocol:", &unk_256BDBCB0))
  {
    DYMTLGetAssociatedObject(*a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "supportArgumentBuffers") & 1) == 0)
    {
      v6 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
      v8 = &v7;
      *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
    }

  }
}

void __84__DYMTLShaderDebuggerTraceGenerator__prepareRenderCommandEncoder_generationOptions___block_invoke_10(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  unint64_t v13;
  unint64_t *v14;

  v13 = a3;
  if (!*a2 && a2[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    v8 = a2[1];
    if (!*a2)
    {
      if (v8)
        v7 = a2[2];
    }
    v9 = objc_msgSend(v5, "newBufferWithBytes:length:options:", v8, v7, 0);

    v10 = *(_QWORD *)(a1 + 40) + 136;
    v14 = &v13;
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    v12 = (void *)v11[3];
    v11[3] = v9;

  }
}

- (BOOL)_prepareComputeCommandEncoder:(id)a3 generationOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  BOOL v33;
  id v34;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *p_p1;
  NSString *errorStr;
  BOOL v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  DYMTLShaderDebuggerTraceGenerator *v50;
  id v51;
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  _QWORD *(*v56)(_QWORD *, _QWORD *);
  void (*v57)(uint64_t);
  const char *v58;
  _QWORD **v59;
  _QWORD *v60[2];
  _QWORD v61[5];
  _QWORD v62[5];
  id v63;
  id *v64;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x24BE394E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computePipelineState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLGetAssociatedObject(v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v11, "setMaxTotalThreadsPerThreadgroup:", objc_msgSend(v9, "maxTotalThreadsPerThreadgroup"));
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", objc_msgSend(v8, "unsignedLongLongValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[DYMTLShaderDebuggerTraceGenerator _instrumentLibrary:generationOptions:](self, "_instrumentLibrary:generationOptions:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "computeFunction");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:](self, "_createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:", v13, v47);
      v14 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v14;
      if (v14
        && (objc_msgSend(v11, "setComputeFunction:", v14),
            -[DYMTLShaderDebuggerTraceGenerator _createAndSetInstrumentedComputePipelineStateWithDescriptor:computeCommandEncoder:](self, "_createAndSetInstrumentedComputePipelineStateWithDescriptor:computeCommandEncoder:", v11, v6)))
      {
        v43 = v6;
        v44 = v8;
        v45 = v7;
        v41 = v11;
        v42 = v9;
        v40 = v13;
        DYMTLGetAssociatedObject(v9, 2u);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "arguments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke;
        v62[3] = &unk_250D6F598;
        v62[4] = self;
        v16 = v6;
        v63 = v16;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v62);

        v17 = MEMORY[0x24BDAC760];
        v61[0] = MEMORY[0x24BDAC760];
        v61[1] = 3221225472;
        v61[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_2;
        v61[3] = &unk_250D6F5C0;
        v61[4] = self;
        objc_msgSend(v16, "enumerateTexturesUsingBlock:", v61);
        v53 = 0;
        v54 = &v53;
        v55 = 0x4812000000;
        v56 = __Block_byref_object_copy__2;
        v57 = __Block_byref_object_dispose__2;
        v60[0] = 0;
        v60[1] = 0;
        v58 = "";
        v59 = v60;
        v52[0] = v17;
        v52[1] = 3221225472;
        v52[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_3;
        v52[3] = &unk_250D6F5E8;
        v52[4] = &v53;
        objc_msgSend(v16, "enumerateSamplersUsingBlock:", v52);
        v18 = v17;
        v19 = (uint64_t *)v54[6];
        v20 = v54 + 7;
        if (v19 != v54 + 7)
        {
          do
          {
            v21 = v19[4];
            v22 = *((_DWORD *)v19 + 12);
            v23 = *((_DWORD *)v19 + 13);
            v24 = (id)v19[5];
            DYMTLGetAssociatedObject(v24, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v25, "copy");

            objc_msgSend(v26, "setSupportArgumentBuffers:", 1);
            objc_msgSend(v24, "device");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (id)objc_msgSend(v27, "newSamplerStateWithDescriptor:", v26);

            -[MTLArgumentEncoder setSamplerState:atIndex:](self->_dummyArgumentEncoder, "setSamplerState:atIndex:", v51, 1);
            LODWORD(v28) = v22;
            LODWORD(v29) = v23;
            objc_msgSend(v16, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v51, v21, v28, v29);
            v30 = -[DYMTLFunctionPlayer keyForOriginalObject:](self->_player, "keyForOriginalObject:", v24);
            v64 = &v51;
            std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::__emplace_unique_key_args<objc_object  {objcproto15MTLSamplerState}*,std::piecewise_construct_t const&,std::tuple<objc_object  {objcproto15MTLSamplerState} const {__strong}&>,std::piecewise_construct_t const&<>>((uint64_t **)&self->_replacedSamplerStates, (unint64_t *)&v51, (uint64_t)&std::piecewise_construct, &v64)[5] = v30;

            v31 = (uint64_t *)v19[1];
            if (v31)
            {
              do
              {
                v32 = v31;
                v31 = (uint64_t *)*v31;
              }
              while (v31);
            }
            else
            {
              do
              {
                v32 = (uint64_t *)v19[2];
                v33 = *v32 == (_QWORD)v19;
                v19 = v32;
              }
              while (!v33);
            }
            v19 = v32;
          }
          while (v32 != v20);
        }
        v48[0] = v18;
        v48[1] = 3221225472;
        v48[2] = __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_4;
        v48[3] = &unk_250D6F610;
        v34 = v16;
        v49 = v34;
        v50 = self;
        objc_msgSend(v34, "enumerateBuffersUsingBlock:", v48);
        p_p1 = &self->_bytesBufferReplacements.__table_.__p1_;
        v8 = v44;
        v7 = v45;
        v11 = v41;
        v9 = v42;
        v13 = v40;
        while (1)
        {
          p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, id<MTLBuffer>>, void *>>> *)p_p1->__value_.__next_;
          if (!p_p1)
            break;
          objc_msgSend(v34, "setBuffer:offset:atIndex:", p_p1[3].__value_.__next_, 0, p_p1[2].__value_.__next_);
        }

        _Block_object_dispose(&v53, 8);
        std::__tree<BufferEntry>::destroy((uint64_t)&v59, v60[0]);

        v37 = 1;
        v6 = v43;
      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    errorStr = self->_errorStr;
    self->_errorStr = (NSString *)CFSTR("kDYMTLShaderDebuggerLibraryId library not found in object map");

    v37 = 0;
  }

  return v37;
}

void __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_kernelBindingNeedsPlaceholderResource:computeCommandEncoder:"))
  {
    v3 = objc_msgSend(v5, "type");
    if (v3)
    {
      if (v3 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_placeholderTextureWithType:", objc_msgSend(v5, "textureType"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setTexture:atIndex:", v4, objc_msgSend(v5, "index"));

      }
      else if (v3 == 3)
      {
        objc_msgSend(*(id *)(a1 + 40), "setSamplerState:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(v5, "index"));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setBuffer:offset:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 0, objc_msgSend(v5, "index"));
    }
  }

}

uint64_t __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTexture:atIndex:", a2, 0);
}

void __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_3(uint64_t a1, void **a2, unint64_t a3)
{
  void *v5;
  uint64_t **v6;
  unint64_t v7;
  unint64_t *v8;

  v7 = a3;
  DYMTLGetAssociatedObject(*a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "supportArgumentBuffers") & 1) == 0)
  {
    v6 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v8 = &v7;
    *(_OWORD *)(std::__tree<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,DYMTLBoundSamplerInfo>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,DYMTLBoundSamplerInfo>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v6, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)+ 5) = *(_OWORD *)a2;
  }

}

void __85__DYMTLShaderDebuggerTraceGenerator__prepareComputeCommandEncoder_generationOptions___block_invoke_4(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  unint64_t v13;
  unint64_t *v14;

  v13 = a3;
  if (!*a2 && a2[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
    v8 = a2[1];
    if (!*a2)
    {
      if (v8)
        v7 = a2[2];
    }
    v9 = objc_msgSend(v5, "newBufferWithBytes:length:options:", v8, v7, 0);

    v10 = *(_QWORD *)(a1 + 40) + 136;
    v14 = &v13;
    v11 = std::__hash_table<std::__hash_value_type<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong}>,std::__unordered_map_hasher<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,objc_object  {objcproto9MTLBuffer}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto9MTLBuffer}* {__strong}>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::piecewise_construct_t const&<>>(v10, &v13, (uint64_t)&std::piecewise_construct, &v14);
    v12 = (void *)v11[3];
    v11[3] = v9;

  }
}

- (id)_generateConstantSamplerReflectionWithUniqueIdentifiers:(id)a3 descriptors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");
  if (v8 == objc_msgSend(v6, "count"))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __105__DYMTLShaderDebuggerTraceGenerator__generateConstantSamplerReflectionWithUniqueIdentifiers_descriptors___block_invoke;
    v13[3] = &unk_250D6F638;
    v14 = v5;
    v9 = v7;
    v15 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
    v10 = v15;
    v11 = v9;

  }
  return v7;
}

void __105__DYMTLShaderDebuggerTraceGenerator__generateConstantSamplerReflectionWithUniqueIdentifiers_descriptors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  GPUTools::MTL::CaptureHelper::SaveObject();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (BOOL)_createAndSetInstrumentedRenderPipelineStateWithDescriptor:(id)a3 renderCommandEncoder:(id)a4 roiType:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  MTLBuffer *traceBuffer;
  void *v15;
  void *v16;
  NSString *v17;
  void *errorStr;
  NSDictionary *v19;
  NSDictionary *constantSamplerReflection;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  v11 = (void *)objc_msgSend(v10, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v8, 0x200000, &v23, &v22);
  v12 = v23;
  v13 = v22;

  if (v11)
  {
    DYMTLSetAssociatedObject(v11, 0, v8);
    DYMTLSetAssociatedObject(v11, 2u, v12);
    traceBuffer = self->_traceBuffer;
    if (a5 == 2)
      objc_msgSend(v9, "setFragmentBuffer:offset:atIndex:", traceBuffer, 0, objc_msgSend(v12, "traceBufferIndex"));
    else
      objc_msgSend(v9, "setVertexBuffer:offset:atIndex:", traceBuffer, 0, objc_msgSend(v12, "traceBufferIndex"));
    objc_msgSend(v9, "setRenderPipelineState:", v11);
    objc_msgSend(v12, "constantSamplerUniqueIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constantSamplerDescriptors");
    errorStr = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLShaderDebuggerTraceGenerator _generateConstantSamplerReflectionWithUniqueIdentifiers:descriptors:](self, "_generateConstantSamplerReflectionWithUniqueIdentifiers:descriptors:", v16, errorStr);
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    constantSamplerReflection = self->_constantSamplerReflection;
    self->_constantSamplerReflection = v19;

  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Error creating instrumented render pipeline state: %@"), v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorStr = self->_errorStr;
    self->_errorStr = v17;
  }

  return v11 != 0;
}

- (BOOL)_createAndSetInstrumentedComputePipelineStateWithDescriptor:(id)a3 computeCommandEncoder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *errorStr;
  NSDictionary *v14;
  NSDictionary *constantSamplerReflection;
  void *v16;
  NSString *v17;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = 0;
  v9 = (void *)objc_msgSend(v8, "newComputePipelineStateWithDescriptor:options:reflection:error:", v6, 0x200000, &v20, &v19);
  v10 = v20;
  v11 = v19;

  if (v9)
  {
    DYMTLSetAssociatedObject(v9, 0, v6);
    DYMTLSetAssociatedObject(v9, 2u, v10);
    objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_traceBuffer, 0, objc_msgSend(v10, "traceBufferIndex"));
    objc_msgSend(v7, "setComputePipelineState:", v9);
    objc_msgSend(v10, "constantSamplerUniqueIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constantSamplerDescriptors");
    errorStr = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLShaderDebuggerTraceGenerator _generateConstantSamplerReflectionWithUniqueIdentifiers:descriptors:](self, "_generateConstantSamplerReflectionWithUniqueIdentifiers:descriptors:", v12, errorStr);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    constantSamplerReflection = self->_constantSamplerReflection;
    self->_constantSamplerReflection = v14;

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Error creating instrumented compute pipeline state: %@"), v12);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorStr = self->_errorStr;
    self->_errorStr = v17;
  }

  return v9 != 0;
}

- (BOOL)_createAndSetInstrumentedTileRenderPipelineStateWithDescriptor:(id)a3 renderCommandEncoder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *errorStr;
  NSDictionary *v14;
  NSDictionary *constantSamplerReflection;
  void *v16;
  NSString *v17;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = 0;
  v9 = (void *)objc_msgSend(v8, "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", v6, 0x200000, &v20, &v19);
  v10 = v20;
  v11 = v19;

  if (v9)
  {
    DYMTLSetAssociatedObject(v9, 0, v6);
    DYMTLSetAssociatedObject(v9, 2u, v10);
    objc_msgSend(v7, "setTileBuffer:offset:atIndex:", self->_traceBuffer, 0, objc_msgSend(v10, "traceBufferIndex"));
    objc_msgSend(v7, "setRenderPipelineState:", v9);
    objc_msgSend(v10, "constantSamplerUniqueIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constantSamplerDescriptors");
    errorStr = (void *)objc_claimAutoreleasedReturnValue();
    -[DYMTLShaderDebuggerTraceGenerator _generateConstantSamplerReflectionWithUniqueIdentifiers:descriptors:](self, "_generateConstantSamplerReflectionWithUniqueIdentifiers:descriptors:", v12, errorStr);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    constantSamplerReflection = self->_constantSamplerReflection;
    self->_constantSamplerReflection = v14;

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Error creating instrumented render pipeline state: %@"), v12);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorStr = self->_errorStr;
    self->_errorStr = v17;
  }

  return v9 != 0;
}

- (id)_createInstrumentedFunctionWithInstrumentedLibrary:(id)a3 originalFunction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *errorStr;
  __CFString *v19;
  id v21;

  v6 = a3;
  v7 = a4;
  if (-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::onceToken != -1)
    dispatch_once(&-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::onceToken, &__block_literal_global_0);
  if (-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::llvmLoaded)
  {
    DYMTLGetNullableAssociatedObject(v7, 4u);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v10 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v9, v8, &v21);
      v11 = v21;

      if (v10)
      {
LABEL_6:
        objc_msgSend(v10, "bitcodeData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (self->_metadata)
          {
            v13 = v10;
LABEL_16:

            goto LABEL_17;
          }
          errorStr = self->_errorStr;
          v19 = CFSTR("Could not generate shader metadata. Please update your target device to the latest OS version");
        }
        else
        {
          errorStr = self->_errorStr;
          v19 = CFSTR("Shader bitcode not found.");
        }
        self->_errorStr = &v19->isa;
LABEL_15:

        v13 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v7, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "newFunctionWithName:", v15);

      v11 = 0;
      if (v10)
        goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Error creating instrumented function: %@"), v12);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    errorStr = self->_errorStr;
    self->_errorStr = v17;
    goto LABEL_15;
  }
  v14 = self->_errorStr;
  self->_errorStr = (NSString *)CFSTR("Shader Debugger is not supported in this system configuration. Please install an Xcode with an SDK that is aligned to your OS version.");

  v13 = 0;
LABEL_17:

  return v13;
}

char *__105__DYMTLShaderDebuggerTraceGenerator__createInstrumentedFunctionWithInstrumentedLibrary_originalFunction___block_invoke()
{
  char *result;
  uint32_t v1;
  int v2;
  char *image_name;
  BOOL v4;

  result = (char *)_dyld_image_count();
  if ((_DWORD)result)
  {
    v1 = 0;
    v2 = (_DWORD)result - 1;
    do
    {
      image_name = (char *)_dyld_get_image_name(v1);
      result = strstr(image_name, "libLLVM.dylib");
      -[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::llvmLoaded |= result != 0;
      if (-[DYMTLShaderDebuggerTraceGenerator _createInstrumentedFunctionWithInstrumentedLibrary:originalFunction:]::llvmLoaded)
        v4 = 1;
      else
        v4 = v2 == v1;
      ++v1;
    }
    while (!v4);
  }
  return result;
}

- (BOOL)_createTraceBufferWithGenerationOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MTLBuffer *v11;
  MTLBuffer *traceBuffer;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE39578]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE395C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 0xFFFFFFFD) != 0)
    v9 = 0x200000;
  else
    v9 = 0x4000000;
  if (v7)
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", v9, 0);
  traceBuffer = self->_traceBuffer;
  self->_traceBuffer = v11;

  v13 = self->_traceBuffer != 0;
  return v13;
}

- (BOOL)_prepareTraceBufferWithGenerationOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  _DWORD *v31;
  int HeaderSize;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  int v38;
  _DWORD *v39;
  _DWORD *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  unsigned int v55;
  const float *v56;
  float32x4_t v57;
  unsigned int v58;
  unsigned int v59;
  const float *v60;
  float32x4_t v61;
  unsigned int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  int v72;
  _DWORD *v73;
  _DWORD *v74;
  NSString *errorStr;
  BOOL v76;
  _DWORD *v77;
  _DWORD *v78;
  unint64_t i;
  void *v80;
  int v81;
  int v82;
  int v83;
  unint64_t j;
  void *v85;
  int v86;
  int v87;
  unsigned int v89;
  unsigned int v90;
  void *v91;
  _DWORD *v92;
  unsigned int v93;
  _DWORD *v94;
  float32x4_t v95;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE39578]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  switch(v6)
  {
    case 0:
      v7 = *MEMORY[0x24BE39550];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39550]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_31;
      v9 = *MEMORY[0x24BE39558];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39558]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_31;
      v11 = *MEMORY[0x24BE39560];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39560]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_31;
      v13 = *MEMORY[0x24BE39520];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39520]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_31;
      v15 = *MEMORY[0x24BE39528];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39528]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_31;
      v17 = *MEMORY[0x24BE39530];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39530]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_31;
      objc_msgSend(v4, "objectForKeyedSubscript:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self->_traceType = 2;
      v25 = -[MTLBuffer contents](self->_traceBuffer, "contents");
      ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, v25, self->_traceBufferVersion);
      v91 = &unk_250D6FAE0;
      v94 = (_DWORD *)v25;
      *v92 = 1;
      v26 = -[MTLBuffer length](self->_traceBuffer, "length");
      v92[1] = v26;
      v27 = objc_msgSend(v19, "unsignedIntValue");
      LODWORD(v25) = objc_msgSend(v20, "unsignedIntValue");
      v28 = objc_msgSend(v21, "unsignedIntValue");
      v94[4] = v27;
      v94[5] = v25;
      v94[6] = v28;
      v29 = objc_msgSend(v22, "unsignedIntValue");
      LODWORD(v25) = objc_msgSend(v23, "unsignedIntValue");
      v30 = objc_msgSend(v24, "unsignedIntValue");
      v31 = v94;
      v94[8] = v29;
      v31[9] = v25;
      v31[10] = v30;
      HeaderSize = ShaderDebugger::KernelTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::KernelTraceBufferVersionedHeader *)&v91);
      v92[2] = HeaderSize;
      DispatchMPSMethod(&v91);
      goto LABEL_26;
    case 1:
      v33 = *MEMORY[0x24BE39500];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39500]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_31;
      v35 = *MEMORY[0x24BE39580];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39580]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        goto LABEL_31;
      self->_traceType = 0;
      objc_msgSend(v4, "objectForKeyedSubscript:", v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE394F8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, -[MTLBuffer contents](self->_traceBuffer, "contents"), self->_traceBufferVersion);
      v91 = &unk_250D6FA90;
      *v92 = 1;
      v37 = -[MTLBuffer length](self->_traceBuffer, "length");
      v92[1] = v37;
      v38 = objc_msgSend(v21, "count");
      if (v93 - 1 >= 2)
      {
        if (v93)
        {
          v40 = 0;
        }
        else
        {
          v77 = v92;
          v92[4] = v38;
          v40 = v77 + 5;
        }
      }
      else
      {
        v39 = v92;
        v92[5] = v38;
        v40 = v39 + 6;
      }
      for (i = 0; i < objc_msgSend(v21, "count"); ++i)
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", i);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v40[i] = objc_msgSend(v80, "unsignedIntegerValue");

      }
      v81 = objc_msgSend(v19, "unsignedIntegerValue");
      if (v93 - 1 < 2 || !v93)
        v92[3] = v81;
      v82 = objc_msgSend(v20, "unsignedIntegerValue");
      if (v93 - 1 <= 1)
        v92[4] = v82;
      v83 = ShaderDebugger::VertexTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::VertexTraceBufferVersionedHeader *)&v91);
      goto LABEL_56;
    case 2:
      v41 = *MEMORY[0x24BE39538];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39538]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
        goto LABEL_31;
      v43 = *MEMORY[0x24BE39540];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39540]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
        goto LABEL_31;
      v45 = *MEMORY[0x24BE39508];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39508]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46)
        goto LABEL_31;
      v47 = *MEMORY[0x24BE39510];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39510]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v48)
        goto LABEL_31;
      v49 = *MEMORY[0x24BE39548];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39548]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
        goto LABEL_31;
      v51 = *MEMORY[0x24BE39518];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39518]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
        goto LABEL_31;
      objc_msgSend(v4, "objectForKeyedSubscript:", v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v43);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v45);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v47);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v49);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v51);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE39570]);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      self->_traceType = 1;
      ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, -[MTLBuffer contents](self->_traceBuffer, "contents"), self->_traceBufferVersion);
      v91 = &unk_250D6FAB8;
      *v92 = 1;
      v54 = -[MTLBuffer length](self->_traceBuffer, "length");
      v92[1] = v54;
      objc_msgSend(v19, "floatValue");
      v89 = v55;
      objc_msgSend(v20, "floatValue");
      v56 = (const float *)&unk_23C7A48A4;
      v57 = vld1q_dup_f32(v56);
      v57.i64[0] = __PAIR64__(v58, v89);
      v95 = v57;
      objc_msgSend(v21, "floatValue", ShaderDebugger::FragmentTraceBufferVersionedHeader::setPositionMin((uint64_t)&v91, (unsigned __int32 *)&v95).n128_f64[0]);
      v90 = v59;
      objc_msgSend(v22, "floatValue");
      v60 = (const float *)"(knN";
      v61 = vld1q_dup_f32(v60);
      v61.i64[0] = __PAIR64__(v62, v90);
      v95 = v61;
      v63 = objc_msgSend(v23, "unsignedIntValue", ShaderDebugger::FragmentTraceBufferVersionedHeader::setPositionMax((uint64_t)&v91, (unsigned __int32 *)&v95).n128_f64[0]);
      if (v93 <= 2)
        v92[12] = v63;
      v64 = objc_msgSend(v24, "unsignedIntValue");
      if (v93 <= 2)
        v92[13] = v64;
      v65 = objc_msgSend(v53, "unsignedIntValue");
      if (v93 == 2)
        v92[14] = v65;
      v66 = ShaderDebugger::FragmentTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::FragmentTraceBufferVersionedHeader *)&v91);
      v92[2] = v66;
      DispatchMPSMethod(&v91);

LABEL_26:
      goto LABEL_57;
    case 3:
      v67 = *MEMORY[0x24BE39500];
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39500]);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68
        && (v69 = *MEMORY[0x24BE39568],
            objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE39568]),
            v70 = (void *)objc_claimAutoreleasedReturnValue(),
            v70,
            v70))
      {
        self->_traceType = 3;
        objc_msgSend(v4, "objectForKeyedSubscript:", v67);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE394F8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v69);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ShaderDebugger::TraceBufferVersionedHeader::TraceBufferVersionedHeader((uint64_t)&v91, -[MTLBuffer contents](self->_traceBuffer, "contents"), self->_traceBufferVersion);
        v91 = &unk_250D6FB08;
        *v92 = 1;
        v71 = -[MTLBuffer length](self->_traceBuffer, "length");
        v92[1] = v71;
        v72 = objc_msgSend(v21, "count");
        if (v93 - 1 >= 2)
        {
          if (v93)
          {
            v74 = 0;
          }
          else
          {
            v78 = v92;
            v92[4] = v72;
            v74 = v78 + 5;
          }
        }
        else
        {
          v73 = v92;
          v92[5] = v72;
          v74 = v73 + 6;
        }
        for (j = 0; j < objc_msgSend(v21, "count"); ++j)
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", j);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v74[j] = objc_msgSend(v85, "unsignedIntegerValue");

        }
        v86 = objc_msgSend(v19, "unsignedIntegerValue");
        if (v93 - 1 < 2 || !v93)
          v92[3] = v86;
        v87 = objc_msgSend(v20, "unsignedIntegerValue");
        if (v93 - 1 <= 1)
          v92[4] = v87;
        v83 = ShaderDebugger::PostTessellationVertexTraceBufferVersionedHeader::getHeaderSize((ShaderDebugger::PostTessellationVertexTraceBufferVersionedHeader *)&v91);
LABEL_56:
        v92[2] = v83;
        DispatchMPSMethod(&v91);
LABEL_57:

LABEL_58:
        v76 = 1;
      }
      else
      {
LABEL_31:
        errorStr = self->_errorStr;
        self->_errorStr = (NSString *)CFSTR("Incorrect ROI parameters");

        v76 = 0;
      }

      return v76;
    default:
      goto LABEL_58;
  }
}

- (void)prepareCommandEncoderForInstrumentedCall:(unint64_t)a3 generationOptions:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSString *errorStr;
  __CFString *v14;
  id v15;

  v15 = a4;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE39578];
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE39578]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE394E8]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9)
    && (objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE394E0]),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    if (-[DYMTLShaderDebuggerTraceGenerator _createTraceBufferWithGenerationOptions:](self, "_createTraceBufferWithGenerationOptions:", v15))
    {
      objc_msgSend(v15, "valueForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntValue");

      std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::destroy((uint64_t)&self->_replacedSamplerStates, (_QWORD *)self->_replacedSamplerStates.__tree_.__pair1_.__value_.__left_);
      self->_replacedSamplerStates.__tree_.__begin_node_ = &self->_replacedSamplerStates.__tree_.__pair1_;
      self->_replacedSamplerStates.__tree_.__pair1_.__value_.__left_ = 0;
      self->_replacedSamplerStates.__tree_.__pair3_.__value_ = 0;
      std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->_bytesBufferReplacements);
      switch(v12)
      {
        case 0:
          if ((objc_msgSend(v6, "conformsToProtocol:", &unk_256BDD688) & 1) == 0
            && (objc_msgSend(v6, "conformsToProtocol:", &unk_256BDCFE8) & 1) == 0)
          {
            errorStr = self->_errorStr;
            v14 = CFSTR("Invalid command encoder for Kernel ROI type");
            break;
          }
          if (objc_msgSend(v6, "conformsToProtocol:", &unk_256BDD688))
          {
            -[DYMTLShaderDebuggerTraceGenerator _prepareComputeCommandEncoder:generationOptions:](self, "_prepareComputeCommandEncoder:generationOptions:", v6, v15);
            goto LABEL_20;
          }
          if (!objc_msgSend(v6, "conformsToProtocol:", &unk_256BDCFE8))
            goto LABEL_20;
          goto LABEL_19;
        case 1:
        case 3:
          if ((objc_msgSend(v6, "conformsToProtocol:", &unk_256BDCFE8) & 1) != 0)
            goto LABEL_19;
          errorStr = self->_errorStr;
          v14 = CFSTR("Invalid command encoder for Vertex ROI type");
          break;
        case 2:
          if ((objc_msgSend(v6, "conformsToProtocol:", &unk_256BDCFE8) & 1) == 0)
          {
            errorStr = self->_errorStr;
            v14 = CFSTR("Invalid command encoder for Fragment ROI type");
            break;
          }
LABEL_19:
          -[DYMTLShaderDebuggerTraceGenerator _prepareRenderCommandEncoder:generationOptions:](self, "_prepareRenderCommandEncoder:generationOptions:", v6, v15);
LABEL_20:
          if (-[DYMTLShaderDebuggerTraceGenerator _prepareTraceBufferWithGenerationOptions:](self, "_prepareTraceBufferWithGenerationOptions:", v15))
          {
            goto LABEL_10;
          }
          errorStr = self->_errorStr;
          v14 = CFSTR("Error while preparing trace buffer.");
          break;
        default:
          goto LABEL_20;
      }
    }
    else
    {
      errorStr = self->_errorStr;
      v14 = CFSTR("Unable to create trace buffer.");
    }
  }
  else
  {
    errorStr = self->_errorStr;
    v14 = CFSTR("Incorrect ROI parameters");
  }
  self->_errorStr = &v14->isa;

LABEL_10:
}

- (id)_generateResourceResolutionRemappingTables
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  const void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t **v18;
  uint64_t v19;
  objc_object *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  DYMTLShaderDebuggerTraceGenerator *begin_node;
  objc_object *v27;
  MTLBuffer *placeholderBuffer;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  DYMTLCommonDebugFunctionPlayer *player;
  DYMTLShaderDebuggerTraceGenerator *indirectArgumentManager;
  objc_object *i;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSDictionary *constantSamplerReflection;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD v55[5];
  _QWORD v56[7];

  v56[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLFunctionPlayer indirectArgumentManager](self->_player, "indirectArgumentManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)objc_msgSend(v45, "bufferVitualAddressMap");
  v5 = v3 + 1;
  v4 = (_QWORD *)*v3;
  if ((_QWORD *)*v3 != v3 + 1)
  {
    do
    {
      v6 = (const void *)v4[5];
      v50 = v4[4];
      v52 = 0;
      v53 = 0;
      v51 = 0;
      std::vector<DYMTLOriginalProcessBuffer>::__init_with_size[abi:ne180100]<DYMTLOriginalProcessBuffer*,DYMTLOriginalProcessBuffer*>(&v51, v6, v4[6], (uint64_t)(v4[6] - (_QWORD)v6) >> 4);
      v8 = v51;
      v7 = v52;
      if (v51 != v52)
      {
        do
        {
          v9 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
          v54 = v8;
          v10 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v9, v8, (uint64_t)&std::piecewise_construct, &v54);
          DYMTLGetOriginalObject((objc_object *)v10[3]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "gpuAddress");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v50);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v13, v14);

          v8 += 2;
        }
        while (v8 != v7);
        v8 = v51;
      }
      if (v8)
      {
        v52 = v8;
        operator delete(v8);
      }
      v15 = (_QWORD *)v4[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (_QWORD *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v4[2];
          v17 = *v16 == (_QWORD)v4;
          v4 = v16;
        }
        while (!v17);
      }
      v4 = v16;
    }
    while (v16 != v5);
  }
  v18 = *(uint64_t ***)(-[DYMTLFunctionPlayer objectMap](self->_player, "objectMap") + 16);
  if (v18)
  {
    while (1)
    {
      v19 = (uint64_t)v18[2];
      v20 = v18[3];
      DYMTLGetOriginalObject(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "conformsToProtocol:", &unk_256BDDBE0))
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_msgSend(v21, "uniqueIdentifier");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v23, v24);
        goto LABEL_18;
      }
LABEL_19:

      v18 = (uint64_t **)*v18;
      if (!v18)
        goto LABEL_20;
    }
    v22 = objc_msgSend(v21, "uniqueIdentifier");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v23, v24);
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:
  begin_node = (DYMTLShaderDebuggerTraceGenerator *)self->_replacedSamplerStates.__tree_.__begin_node_;
  if (begin_node != (DYMTLShaderDebuggerTraceGenerator *)&self->_replacedSamplerStates.__tree_.__pair1_)
  {
    do
    {
      v27 = begin_node->_errorStr;
      placeholderBuffer = begin_node->_placeholderBuffer;
      DYMTLGetOriginalObject(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "uniqueIdentifier");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", placeholderBuffer);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v31, v32);

      player = begin_node->_player;
      if (player)
      {
        do
        {
          indirectArgumentManager = (DYMTLShaderDebuggerTraceGenerator *)player;
          player = (DYMTLCommonDebugFunctionPlayer *)player->super.super.super.super.isa;
        }
        while (player);
      }
      else
      {
        do
        {
          indirectArgumentManager = (DYMTLShaderDebuggerTraceGenerator *)begin_node->_indirectArgumentManager;
          v17 = indirectArgumentManager->super.isa == (Class)begin_node;
          begin_node = indirectArgumentManager;
        }
        while (!v17);
      }
      begin_node = indirectArgumentManager;
    }
    while (indirectArgumentManager != (DYMTLShaderDebuggerTraceGenerator *)&self->_replacedSamplerStates.__tree_.__pair1_);
  }
  for (i = (objc_object *)self->_bytesBufferReplacements.__table_.__p1_.__value_.__next_; i; i = (objc_object *)i->isa)
  {
    DYMTLGetOriginalObject((objc_object *)i[3].isa);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "gpuAddress");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", i[2].isa);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v38, v39);

  }
  v40 = *MEMORY[0x24BE395B0];
  v55[0] = *MEMORY[0x24BE39590];
  v55[1] = v40;
  v56[0] = v49;
  v56[1] = v46;
  v41 = *MEMORY[0x24BE395A0];
  v55[2] = *MEMORY[0x24BE395A8];
  v55[3] = v41;
  constantSamplerReflection = self->_constantSamplerReflection;
  v56[2] = v48;
  v56[3] = constantSamplerReflection;
  v55[4] = *MEMORY[0x24BE39598];
  v56[4] = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)notifyReplayFinishedAndGenerateTraceContainer
{
  NSString *errorStr;
  void *v4;
  NSString *v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  NSData *metadata;
  uint64_t v18;
  DYMTLShaderDebuggerTraceGenerator *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  uint64_t v25;
  NSString *v26;
  _QWORD v27[3];
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v19 = self;
  errorStr = self->_errorStr;
  if (errorStr)
  {
    v25 = *MEMORY[0x24BE394D0];
    v26 = errorStr;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_errorStr;
    self->_errorStr = 0;

    return v4;
  }
  v24[3] = 0;
  v27[0] = &off_250D6F6A8;
  v27[1] = &v19;
  v28 = v27;
  std::__function::__value_func<void ()(void)>::swap[abi:ne180100](v27, v24);
  v7 = v28;
  if (v28 == v27)
  {
    v8 = 4;
    v7 = v27;
    goto LABEL_7;
  }
  if (v28)
  {
    v8 = 5;
LABEL_7:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  v9 = -[MTLBuffer contents](v19->_traceBuffer, "contents", v19);
  if (*(_DWORD *)(v9 + 8) <= *(_DWORD *)(v9 + 4))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v19->_traceType, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    v14 = *(_DWORD *)(v9 + 4);
    v13 = *(_DWORD *)(v9 + 8);
    if (v14 >= v13)
      v15 = v13;
    else
      v15 = v14;
    objc_msgSend(v12, "appendBytes:length:", v9, v15);
    -[DYMTLShaderDebuggerTraceGenerator _generateResourceResolutionRemappingTables](v19, "_generateResourceResolutionRemappingTables");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    metadata = v19->_metadata;
    v18 = *MEMORY[0x24BE395B8];
    v20[0] = *MEMORY[0x24BE394F0];
    v20[1] = v18;
    v21[0] = metadata;
    v21[1] = v10;
    v20[2] = *MEMORY[0x24BE39588];
    v21[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22[0] = *MEMORY[0x24BE395C0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = *MEMORY[0x24BE394D0];
    v23[0] = v10;
    v23[1] = CFSTR("Trace buffer not big enough. Retry with new size.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  dy_defer::~dy_defer((dy_defer *)v24);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onlineSrc, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_bytesBufferReplacements);
  objc_storeStrong((id *)&self->_constantSamplerReflection, 0);
  std::__tree<std::__value_type<objc_object  {objcproto15MTLSamplerState}* {__strong},unsigned long long>,std::__map_value_compare<objc_object  {objcproto15MTLSamplerState}*,objc_object  {objcproto15MTLSamplerState}* {__strong},std::less<objc_object  {objcproto15MTLSamplerState}*>,true>,std::allocator<objc_object  {objcproto15MTLSamplerState}* {__strong}>>::destroy((uint64_t)&self->_replacedSamplerStates, (_QWORD *)self->_replacedSamplerStates.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_dummyArgumentBuffer, 0);
  objc_storeStrong((id *)&self->_dummyArgumentEncoder, 0);
  std::__tree<std::__value_type<MTLTextureType,objc_object  {objcproto10MTLTexture}* {__strong}>,std::__map_value_compare<MTLTextureType,objc_object  {objcproto10MTLTexture}* {__strong},std::less<MTLTextureType>,true>,std::allocator<objc_object  {objcproto10MTLTexture}* {__strong}>>::destroy((uint64_t)&self->_placeholderTextures, (_QWORD *)self->_placeholderTextures.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_placeholderSamplerState, 0);
  objc_storeStrong((id *)&self->_placeholderTexture, 0);
  objc_storeStrong((id *)&self->_placeholderBuffer, 0);
  objc_storeStrong((id *)&self->_errorStr, 0);
  objc_storeStrong((id *)&self->_traceBuffer, 0);
  objc_storeStrong((id *)&self->_indirectArgumentManager, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 8) = (char *)self + 72;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

- (void)notifyReplayFinishedAndGenerateTraceContainer
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = **(_QWORD **)(a1 + 8);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = **(_QWORD **)(a1 + 8);
  v5 = *(void **)(v4 + 200);
  *(_QWORD *)(v4 + 200) = 0;

  v6 = **(_QWORD **)(a1 + 8);
  v7 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = 0;

}

- (_QWORD)notifyReplayFinishedAndGenerateTraceContainer
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_250D6F6A8;
  result[1] = v3;
  return result;
}

- (uint64_t)notifyReplayFinishedAndGenerateTraceContainer
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_250D6F6A8;
  a2[1] = v2;
  return result;
}

@end
