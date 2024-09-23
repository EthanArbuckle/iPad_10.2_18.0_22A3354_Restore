@implementation DYMTLTextureResize

- (DYMTLTextureResize)initWithDevice:(id)a3
{
  id v5;
  DYMTLTextureResize *v6;
  DYMTLTextureResize *v7;
  id *p_device;
  MTLDevice *device;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  MTLFunction *thumbnailColorFragment;
  uint64_t v15;
  MTLFunction *thumbnailDepthFragment;
  uint64_t v17;
  MTLFunction *thumbnailStencilFragment;
  uint64_t v19;
  MTLBuffer *quadPositions;
  uint64_t v21;
  MTLBuffer *quadTexCoords;
  uint64_t v23;
  MTLBuffer *quadIndicies;
  uint64_t v25;
  MTLRenderPassDescriptor *thumbnailRenderPass;
  void *v27;
  id v28;
  uint64_t v29;
  MTLDepthStencilState *thumbnailDepthStencilState;
  uint64_t v31;
  MTLRenderPipelineDescriptor *thumbnailPipelineDescriptor;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  MTLSamplerState *downscaleSampler;
  uint64_t v38;
  MTLSamplerState *upscaleSampler;
  uint64_t v40;
  NSMutableDictionary *fragmentFunctionForPixelFormatCache;
  id v43;
  objc_super v44;

  v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)DYMTLTextureResize;
  v6 = -[DYMTLTextureResize init](&v44, sel_init);
  v7 = v6;
  if (v6)
  {
    p_device = (id *)&v6->_device;
    objc_storeStrong((id *)&v6->_device, a3);
    device = v7->_device;
    v43 = 0;
    v10 = (void *)-[MTLDevice newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", CFSTR("#include <metal_stdlib>\nusing namespace metal;\nstruct VertexOutput\n{\n    vec<float, 4> pos [[position]];\n    vec<float, 2> uv;\n};\nvertex VertexOutput passthroughVertex(uint vid [[ vertex_id ]],\n                                      constant vec<float,4> *pos_data [[ buffer(0) ]],\n                                      constant vec<float,2> *uv_data [[ buffer(1) ]])\n{\n    VertexOutput out;\n    out.pos = pos_data[vid];\n    out.uv = uv_data[vid];\n    return out;\n}\nfragment float4 texturedQuadFragmentDepth(VertexOutput in [[ stage_in ]],\n                                     depth2d<float> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\nfloat sample = tex.sample(samp, in.uv);\nreturn float4(sample, sample, sample, 1.0);\n}\nfragment float4 texturedQuadFragmentStencil(VertexOutput in [[ stage_in ]],\n                                     depth2d<float> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\nfloat sample = tex.sample(samp, in.uv);\nreturn float4(sample, sample, sample, 1.0);\n}\nfragment float4 texturedQuadFragment(VertexOutput in [[ stage_in ]],\n                                     texture2d<float> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\nreturn tex.sample(samp, in.uv);\n}"),
                    0,
                    &v43);
    v11 = v43;
    if (!v10)
      __assert_rtn("-[DYMTLTextureResize initWithDevice:]", ", 0, "_quadLibrary != nil");
    v12 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("passthroughVertex"));
    v13 = objc_msgSend(v10, "newFunctionWithName:", CFSTR("texturedQuadFragment"));
    thumbnailColorFragment = v7->_thumbnailColorFragment;
    v7->_thumbnailColorFragment = (MTLFunction *)v13;

    v15 = objc_msgSend(v10, "newFunctionWithName:", CFSTR("texturedQuadFragmentDepth"));
    thumbnailDepthFragment = v7->_thumbnailDepthFragment;
    v7->_thumbnailDepthFragment = (MTLFunction *)v15;

    v17 = objc_msgSend(v10, "newFunctionWithName:", CFSTR("texturedQuadFragmentStencil"));
    thumbnailStencilFragment = v7->_thumbnailStencilFragment;
    v7->_thumbnailStencilFragment = (MTLFunction *)v17;

    v19 = -[MTLDevice newBufferWithBytes:length:options:](v7->_device, "newBufferWithBytes:length:options:", &-[DYMTLTextureResize initWithDevice:]::posData, 96, 0);
    quadPositions = v7->_quadPositions;
    v7->_quadPositions = (MTLBuffer *)v19;

    v21 = -[MTLDevice newBufferWithBytes:length:options:](v7->_device, "newBufferWithBytes:length:options:", &-[DYMTLTextureResize initWithDevice:]::texCoords, 48, 0);
    quadTexCoords = v7->_quadTexCoords;
    v7->_quadTexCoords = (MTLBuffer *)v21;

    v23 = -[MTLDevice newBufferWithBytes:length:options:](v7->_device, "newBufferWithBytes:length:options:", &-[DYMTLTextureResize initWithDevice:]::indexData, 24, 0);
    quadIndicies = v7->_quadIndicies;
    v7->_quadIndicies = (MTLBuffer *)v23;

    v25 = objc_opt_new();
    thumbnailRenderPass = v7->_thumbnailRenderPass;
    v7->_thumbnailRenderPass = (MTLRenderPassDescriptor *)v25;

    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "setStencilCompareFunction:", 7);
    objc_msgSend(v27, "setReadMask:", 0);
    objc_msgSend(v27, "setWriteMask:", 0);
    v28 = objc_alloc_init(MEMORY[0x24BDDD590]);
    objc_msgSend(v28, "setDepthCompareFunction:", 7);
    objc_msgSend(v28, "setFrontFaceStencil:", v27);
    objc_msgSend(v28, "setBackFaceStencil:", v27);
    objc_msgSend(v28, "setDepthWriteEnabled:", 0);
    v29 = objc_msgSend(*p_device, "newDepthStencilStateWithDescriptor:", v28);
    thumbnailDepthStencilState = v7->_thumbnailDepthStencilState;
    v7->_thumbnailDepthStencilState = (MTLDepthStencilState *)v29;

    v31 = objc_opt_new();
    thumbnailPipelineDescriptor = v7->_thumbnailPipelineDescriptor;
    v7->_thumbnailPipelineDescriptor = (MTLRenderPipelineDescriptor *)v31;

    -[MTLRenderPipelineDescriptor setLabel:](v7->_thumbnailPipelineDescriptor, "setLabel:", CFSTR("Thumbnail Render"));
    -[MTLRenderPipelineDescriptor setVertexFunction:](v7->_thumbnailPipelineDescriptor, "setVertexFunction:", v12);
    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "setMinFilter:", 1);
    objc_msgSend(v33, "setMagFilter:", 1);
    objc_msgSend(v33, "setMipFilter:", 2);
    objc_msgSend(v33, "setMaxAnisotropy:", 1);
    objc_msgSend(v33, "setSAddressMode:", 0);
    objc_msgSend(v33, "setTAddressMode:", 0);
    objc_msgSend(v33, "setRAddressMode:", 0);
    objc_msgSend(v33, "setNormalizedCoordinates:", 1);
    LODWORD(v34) = 0;
    objc_msgSend(v33, "setLodMinClamp:", v34);
    LODWORD(v35) = 2139095039;
    objc_msgSend(v33, "setLodMaxClamp:", v35);
    v36 = objc_msgSend(*p_device, "newSamplerStateWithDescriptor:", v33);
    downscaleSampler = v7->_downscaleSampler;
    v7->_downscaleSampler = (MTLSamplerState *)v36;

    objc_msgSend(v33, "setMinFilter:", 0);
    objc_msgSend(v33, "setMagFilter:", 0);
    objc_msgSend(v33, "setMipFilter:", 0);
    v38 = objc_msgSend(*p_device, "newSamplerStateWithDescriptor:", v33);
    upscaleSampler = v7->_upscaleSampler;
    v7->_upscaleSampler = (MTLSamplerState *)v38;

    v40 = objc_opt_new();
    fragmentFunctionForPixelFormatCache = v7->_fragmentFunctionForPixelFormatCache;
    v7->_fragmentFunctionForPixelFormatCache = (NSMutableDictionary *)v40;

  }
  return v7;
}

- (id)stencilTextureFromTexture:(id)a3 commandBuffer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "pixelFormat") == 260)
  {
    if ((objc_msgSend(v6, "usage") & 0x10) == 0)
    {
      MakeMTLTextureDescriptorFromTexture(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUsage:", 17);
      -[DYMTLTextureResize device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "newTextureWithDescriptor:", v8);

      objc_msgSend(v7, "blitCommandEncoder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v18, 0, sizeof(v18));
      v17[0] = objc_msgSend(v6, "width");
      v17[1] = objc_msgSend(v6, "height");
      v17[2] = 1;
      memset(v16, 0, sizeof(v16));
      objc_msgSend(v11, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v6, 0, 0, v18, v17, v10, 0, 0, v16);
      objc_msgSend(v11, "endEncoding");

      v6 = (id)v10;
    }
    v12 = objc_msgSend(v6, "pixelFormat");
    if (v12 == 260)
      v13 = 261;
    else
      v13 = v12;
    v14 = (void *)objc_msgSend(v6, "newTextureViewWithPixelFormat:", v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)resolveMultisampleTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a3;
  v13 = a7;
  if (objc_msgSend(v12, "textureType") == 4 || objc_msgSend(v12, "textureType") == 8)
  {
    MakeMTLTextureDescriptorFromTexture(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUsage:", 1);
    -[DYMTLTextureResize device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newTextureWithDescriptor:", v14);

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v12, "pixelFormat"))
    {
      case 250:
      case 252:
        objc_msgSend(v17, "depthAttachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTexture:", v12);
        objc_msgSend(v18, "setLevel:", a5);
        objc_msgSend(v18, "setSlice:", a4);
        objc_msgSend(v18, "setDepthPlane:", a6);
        objc_msgSend(v18, "setResolveTexture:", v16);
        objc_msgSend(v18, "setLoadAction:", 1);
        objc_msgSend(v18, "setStoreAction:", 2);
        break;
      case 253:
      case 261:
        objc_msgSend(v17, "stencilAttachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTexture:", v12);
        objc_msgSend(v18, "setLevel:", a5);
        objc_msgSend(v18, "setSlice:", a4);
        objc_msgSend(v18, "setDepthPlane:", a6);
        objc_msgSend(v18, "setResolveTexture:", v16);
        objc_msgSend(v18, "setLoadAction:", 1);
        objc_msgSend(v18, "setStoreAction:", 2);
        break;
      case 260:
        objc_msgSend(v17, "depthAttachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTexture:", v12);
        objc_msgSend(v18, "setLevel:", a5);
        objc_msgSend(v18, "setSlice:", a4);
        objc_msgSend(v18, "setDepthPlane:", a6);
        objc_msgSend(v18, "setResolveTexture:", v16);
        objc_msgSend(v18, "setLoadAction:", 1);
        objc_msgSend(v18, "setStoreAction:", 2);
        objc_msgSend(v17, "stencilAttachment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTexture:", v12);
        objc_msgSend(v19, "setLevel:", a5);
        objc_msgSend(v19, "setSlice:", a4);
        objc_msgSend(v19, "setDepthPlane:", a6);
        objc_msgSend(v19, "setResolveTexture:", v16);
        objc_msgSend(v19, "setLoadAction:", 1);
        objc_msgSend(v19, "setStoreAction:", 2);

        break;
      default:
        objc_msgSend(v17, "colorAttachments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setTexture:", v12);
        objc_msgSend(v18, "setLevel:", a5);
        objc_msgSend(v18, "setSlice:", a4);
        objc_msgSend(v18, "setDepthPlane:", a6);
        objc_msgSend(v18, "setResolveTexture:", v16);
        objc_msgSend(v18, "setLoadAction:", 1);
        objc_msgSend(v18, "setStoreAction:", 2);
        break;
    }

    objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endEncoding");

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)returnTypeForPixelFormat:(unint64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x14uLL:
    case 0x16uLL:
    case 0x19uLL:
    case 0x37uLL:
      result = CFSTR("float");
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6FuLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
      return result;
    case 0xDuLL:
    case 0x17uLL:
    case 0x35uLL:
      result = CFSTR("uint");
      break;
    case 0xEuLL:
    case 0x18uLL:
    case 0x36uLL:
      result = CFSTR("int");
      break;
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x41uLL:
    case 0x69uLL:
      result = CFSTR("float2");
      break;
    case 0x21uLL:
    case 0x3FuLL:
    case 0x67uLL:
      result = CFSTR("uint2");
      break;
    case 0x22uLL:
    case 0x40uLL:
    case 0x68uLL:
      result = CFSTR("int2");
      break;
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x5AuLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x5EuLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x73uLL:
    case 0x7DuLL:
      goto LABEL_2;
    case 0x49uLL:
    case 0x5BuLL:
    case 0x71uLL:
    case 0x7BuLL:
      result = CFSTR("uint4");
      break;
    case 0x4AuLL:
    case 0x72uLL:
    case 0x7CuLL:
      result = CFSTR("int4");
      break;
    default:
      if (a3 - 554 < 2)
LABEL_2:
        result = CFSTR("float4");
      break;
  }
  return result;
}

- (id)textureTypeForPixelFormat:(unint64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x14uLL:
    case 0x16uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x5AuLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x5EuLL:
    case 0x69uLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x73uLL:
    case 0x7DuLL:
      goto LABEL_2;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6FuLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
      return result;
    case 0xDuLL:
    case 0x17uLL:
    case 0x21uLL:
    case 0x35uLL:
    case 0x3FuLL:
    case 0x49uLL:
    case 0x5BuLL:
    case 0x67uLL:
    case 0x71uLL:
    case 0x7BuLL:
      result = CFSTR("uint");
      break;
    case 0xEuLL:
    case 0x18uLL:
    case 0x22uLL:
    case 0x36uLL:
    case 0x40uLL:
    case 0x4AuLL:
    case 0x68uLL:
    case 0x72uLL:
    case 0x7CuLL:
      result = CFSTR("int");
      break;
    default:
      if (a3 - 554 < 2)
LABEL_2:
        result = CFSTR("float");
      break;
  }
  return result;
}

- (id)dataTypeForReturnType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("int")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("uint")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("float")) & 1) != 0)
  {
    v4 = CFSTR(".x");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("int2")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("uint2")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("float2")) & 1) != 0)
  {
    v4 = CFSTR(".xy");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("int4")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("uint4")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("float4")))
  {
    v4 = CFSTR(".xyzw");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (id)generateFragmentFunctionForPixelFormat:(unint64_t)a3 texture:(id)a4
{
  id v6;
  NSMutableDictionary *fragmentFunctionForPixelFormatCache;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  MTLDevice *device;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  BOOL v24;
  id v25;
  void *v26;
  id v27;

  v6 = a4;
  fragmentFunctionForPixelFormatCache = self->_fragmentFunctionForPixelFormatCache;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fragmentFunctionForPixelFormatCache, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_20;
  -[DYMTLTextureResize returnTypeForPixelFormat:](self, "returnTypeForPixelFormat:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLTextureResize textureTypeForPixelFormat:](self, "textureTypeForPixelFormat:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLTextureResize dataTypeForReturnType:](self, "dataTypeForReturnType:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isSparse") & 1) == 0)
    v13 = CFSTR("tex.sparse_sample(samp, in.uv).value()");
  else
    v13 = CFSTR("tex.sample(samp, in.uv)");
  v14 = !v10 || v11 == 0;
  v15 = v14 || v12 == 0;
  v16 = v15;
  if (v15)
  {
    v9 = 0;
  }
  else
  {
    v24 = v16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#include <metal_stdlib>\nusing namespace metal;\n\nstruct VertexOutput\n{\n    vec<float, 4> pos [[position]];\n    vec<float, 2> uv;\n};\n\n\nfragment %@ texturedQuadFragment(VertexOutput in [[ stage_in ]],\n                                     texture2d<%@> tex [[ texture(0) ]],\n                                     sampler samp [[ sampler(0) ]])\n{\n   return %@%@;\n}\n"),
      v10,
      v11,
      v13,
      v12);
    v17 = objc_claimAutoreleasedReturnValue();
    device = self->_device;
    v27 = 0;
    v26 = (void *)v17;
    v19 = (void *)-[MTLDevice newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", v17, 0, &v27);
    v25 = v27;
    v9 = (id)objc_msgSend(v19, "newFunctionWithName:", CFSTR("texturedQuadFragment"));
    v20 = self->_fragmentFunctionForPixelFormatCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v9, v21);

    v16 = v24;
  }

  if (!v16)
  {
LABEL_20:
    v9 = v9;
    v22 = v9;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)generateThumbnailFromTexture:(id)a3 commandBuffer:(id)a4 resolution:(id *)a5 withFence:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t var0;
  float v18;
  uint64_t v19;
  unint64_t var1;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  MTLRenderPipelineDescriptor *thumbnailPipelineDescriptor;
  MTLRenderPipelineState *v47;
  id v48;
  MTLRenderPipelineState *thumbnailPipeline;
  void *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  __int128 v56;
  id v57;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = 0;
  if (!v10 || !v11)
    goto LABEL_33;
  v14 = objc_msgSend(v10, "width");
  v15 = objc_msgSend(v10, "height");
  v16 = v15;
  var0 = a5->var0;
  if (v14 < a5->var0 && v15 < a5->var1 && a5->var2)
  {
    v18 = (float)var0 / (float)v14;
    v14 = (unint64_t)(float)(v18 * (float)v14);
    v16 = (unint64_t)(float)(v18 * (float)v15);
    v19 = 24;
  }
  else
  {
    v19 = 16;
  }
  v53 = v19;
  if ((v14 > var0 || v16 > a5->var1) && a5->var2)
  {
    var1 = a5->var1;
    if (v16 <= var1)
    {
      if (v14 <= var0)
      {
LABEL_17:
        if (v14 <= 8)
          v14 = 8;
        if (v16 <= 0x10)
          v16 = 16;
        goto LABEL_21;
      }
      v24 = (float)var0;
      v26 = (float)v14;
    }
    else
    {
      v21 = objc_msgSend(v10, "height");
      v22 = objc_msgSend(v10, "width");
      v23 = objc_msgSend(v10, "height");
      v24 = (float)var0;
      v25 = (float)var1 / (float)v21;
      v14 = (unint64_t)(float)(v25 * (float)v22);
      v16 = (unint64_t)(float)(v25 * (float)v23);
      v26 = (float)v14;
      if ((float)v14 <= (float)var0)
        goto LABEL_17;
    }
    v27 = v24 / v26;
    v14 = (unint64_t)(float)(v27 * v26);
    v16 = (unint64_t)(float)(v27 * (float)v16);
    goto LABEL_17;
  }
LABEL_21:
  v28 = objc_msgSend(v10, "pixelFormat", v53);
  v29 = v28;
  if (v28 == 1)
  {
    v29 = 10;
  }
  else if ((unint64_t)(v28 - 1) >= 0x7D)
  {
    if ((unint64_t)(v28 - 250) > 0xB)
      v29 = 90;
    else
      v29 = qword_24114DFB0[v28 - 250];
  }
  MakeMTLTextureDescriptorFromTexture(v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPixelFormat:", v29);
  objc_msgSend(v30, "setWidth:", v14);
  objc_msgSend(v30, "setHeight:", v16);
  objc_msgSend(v30, "setUsage:", 4);
  objc_msgSend(v30, "setStorageMode:", 0);
  -[DYMTLTextureResize device](self, "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "newTextureWithDescriptor:", v30);

  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "colorAttachments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTexture:", v32);

  objc_msgSend(v33, "colorAttachments");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLoadAction:", 2);

  objc_msgSend(v33, "colorAttachments");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setStoreAction:", 1);

  -[MTLRenderPipelineDescriptor colorAttachments](self->_thumbnailPipelineDescriptor, "colorAttachments");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPixelFormat:", v29);

  -[MTLRenderPipelineDescriptor colorAttachments](self->_thumbnailPipelineDescriptor, "colorAttachments");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBlendingEnabled:", 0);

  -[DYMTLTextureResize generateFragmentFunctionForPixelFormat:texture:](self, "generateFragmentFunctionForPixelFormat:texture:", v29, v10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLRenderPipelineDescriptor setFragmentFunction:](self->_thumbnailPipelineDescriptor, "setFragmentFunction:", v44);

  -[DYMTLTextureResize device](self, "device");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  thumbnailPipelineDescriptor = self->_thumbnailPipelineDescriptor;
  v57 = 0;
  v47 = (MTLRenderPipelineState *)objc_msgSend(v45, "newRenderPipelineStateWithDescriptor:error:", thumbnailPipelineDescriptor, &v57);
  v48 = v57;
  thumbnailPipeline = self->_thumbnailPipeline;
  self->_thumbnailPipeline = v47;

  if (self->_thumbnailPipeline)
  {
    objc_msgSend(v11, "renderCommandEncoderWithDescriptor:", v33);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v12)
      objc_msgSend(v50, "waitForFence:beforeStages:", v12, 2);
    objc_msgSend(v51, "setRenderPipelineState:", self->_thumbnailPipeline);
    objc_msgSend(v51, "setDepthStencilState:", self->_thumbnailDepthStencilState);
    objc_msgSend(v51, "setFragmentSamplerState:atIndex:", *(Class *)((char *)&self->super.isa + v54), 0);
    objc_msgSend(v51, "setVertexBuffer:offset:atIndex:", self->_quadPositions, 0, 0);
    objc_msgSend(v51, "setVertexBuffer:offset:atIndex:", self->_quadTexCoords, 0, 1);
    v55[0] = 0;
    v55[1] = 0;
    *(double *)&v55[2] = (double)(unint64_t)objc_msgSend(v32, "width");
    *(double *)&v55[3] = (double)(unint64_t)objc_msgSend(v32, "height");
    v56 = xmmword_24114E010;
    objc_msgSend(v51, "setViewport:", v55);
    objc_msgSend(v51, "setFragmentTexture:atIndex:", v10, 0);
    objc_msgSend(v51, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 6, 1, self->_quadIndicies, 0);
    objc_msgSend(v51, "endEncoding");
    v13 = v32;

  }
  else
  {
    v13 = 0;
  }

LABEL_33:
  return v13;
}

- (id)textureFromTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];

  v11 = a3;
  v12 = a7;
  if (objc_msgSend(v11, "width") && objc_msgSend(v11, "height"))
  {
    if (objc_msgSend(v11, "textureType") == 2
      && objc_msgSend(v11, "mipmapLevelCount") == 1
      && (objc_msgSend(v11, "usage") & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v11, "isSparse") & 1) == 0)
    {
      v23 = v11;
      goto LABEL_32;
    }
    if ((objc_msgSend(v11, "usage") & 1) != 0
      && objc_msgSend(v11, "textureType")
      && objc_msgSend(v11, "textureType") != 1
      && objc_msgSend(v11, "textureType") != 7
      && objc_msgSend(v11, "textureType") != 9
      && ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v11, "isSparse") & 1) != 0))
    {
      v23 = (id)objc_msgSend(v11, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v11, "pixelFormat"), 2, a5, 1, a4, 1);
LABEL_32:
      v20 = v23;
      goto LABEL_27;
    }
    v13 = objc_msgSend(v11, "width");
    v14 = objc_msgSend(v11, "height");
    if (a5)
    {
      v15 = a5;
      do
      {
        if (v13 <= 1)
          v13 = 1;
        else
          v13 >>= 1;
        if (v14 <= 1)
          v14 = 1;
        else
          v14 >>= 1;
        --v15;
      }
      while (v15);
    }
    MakeMTLTextureDescriptorFromTexture(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWidth:", v13);
    objc_msgSend(v16, "setHeight:", v14);
    objc_msgSend(v16, "setUsage:", 17);
    if (objc_msgSend(v11, "textureType") == 9)
    {
      -[DYMTLTextureResize device](self, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "maxTextureWidth2D");

      if (v13 > v18)
      {
        objc_msgSend(v16, "setWidth:", v18);
        v13 = v18;
      }
    }
    -[DYMTLTextureResize device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "newTextureWithDescriptor:", v16);

    objc_msgSend(v12, "blitCommandEncoder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = 0;
    v27[1] = 0;
    v27[2] = a6;
    v26[0] = v13;
    v26[1] = v14;
    v26[2] = 1;
    memset(v25, 0, sizeof(v25));
    objc_msgSend(v21, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v11, a4, a5, v27, v26, v20, 0, 0, v25);
    objc_msgSend(v21, "endEncoding");

  }
  else
  {
    v20 = 0;
  }
LABEL_27:

  return v20;
}

- (id)_texture2DFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTextureType:", 2);
  objc_msgSend(v14, "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
  v15 = objc_msgSend(v12, "width");
  if (v15 >> a4 <= 1)
    v16 = 1;
  else
    v16 = v15 >> a4;
  objc_msgSend(v14, "setWidth:", v16);
  v17 = objc_msgSend(v12, "height");
  if (v17 >> a4 <= 1)
    v18 = 1;
  else
    v18 = v17 >> a4;
  objc_msgSend(v14, "setHeight:", v18);
  objc_msgSend(v14, "setUsage:", objc_msgSend(v14, "usage") | 1);
  -[DYMTLTextureResize device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "newTextureWithDescriptor:", v14);

  if (objc_msgSend(v12, "textureType") == 4)
  {
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v20, "pixelFormat"))
    {
      case 250:
      case 252:
        objc_msgSend(v21, "depthAttachment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTexture:", v12);
        objc_msgSend(v22, "setLevel:", a4);
        objc_msgSend(v22, "setSlice:", a5);
        objc_msgSend(v22, "setDepthPlane:", a6);
        objc_msgSend(v22, "setResolveTexture:", v20);
        objc_msgSend(v22, "setLoadAction:", 1);
        objc_msgSend(v22, "setStoreAction:", 2);
        break;
      case 253:
        objc_msgSend(v21, "stencilAttachment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTexture:", v12);
        objc_msgSend(v22, "setLevel:", a4);
        objc_msgSend(v22, "setSlice:", a5);
        objc_msgSend(v22, "setDepthPlane:", a6);
        objc_msgSend(v22, "setResolveTexture:", v20);
        objc_msgSend(v22, "setLoadAction:", 1);
        objc_msgSend(v22, "setStoreAction:", 2);
        break;
      case 260:
      case 261:
        objc_msgSend(v21, "depthAttachment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTexture:", v12);
        objc_msgSend(v22, "setLevel:", a4);
        objc_msgSend(v22, "setSlice:", a5);
        objc_msgSend(v22, "setDepthPlane:", a6);
        objc_msgSend(v22, "setResolveTexture:", v20);
        objc_msgSend(v22, "setLoadAction:", 1);
        objc_msgSend(v22, "setStoreAction:", 2);
        objc_msgSend(v21, "stencilAttachment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTexture:", v12);
        objc_msgSend(v23, "setLevel:", a4);
        objc_msgSend(v23, "setSlice:", a5);
        objc_msgSend(v23, "setDepthPlane:", a6);
        objc_msgSend(v23, "setResolveTexture:", v20);
        objc_msgSend(v23, "setLoadAction:", 1);
        objc_msgSend(v23, "setStoreAction:", 2);

        break;
      default:
        objc_msgSend(v21, "colorAttachments");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setTexture:", v12);
        objc_msgSend(v22, "setLevel:", a4);
        objc_msgSend(v22, "setSlice:", a5);
        objc_msgSend(v22, "setDepthPlane:", a6);
        objc_msgSend(v22, "setResolveTexture:", v20);
        objc_msgSend(v22, "setLoadAction:", 1);
        objc_msgSend(v22, "setStoreAction:", 2);
        break;
    }

    objc_msgSend(v13, "renderCommandEncoderWithDescriptor:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endEncoding");

  }
  else
  {
    objc_msgSend(v13, "blitCommandEncoder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = 0;
    v29[1] = 0;
    v29[2] = a6;
    v28[0] = objc_msgSend(v20, "width");
    v28[1] = objc_msgSend(v20, "height");
    v28[2] = 1;
    memset(v27, 0, sizeof(v27));
    objc_msgSend(v21, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v12, a5, a4, v29, v28, v20, 0, 0, v27);
    objc_msgSend(v21, "endEncoding");
  }

  return v20;
}

- (void)resizeTexture:(id)a3 resolution:(id *)a4 level:(unint64_t)a5 slice:(unint64_t)a6 depthPlane:(unint64_t)a7 inBuffer:(id)a8 withType:(unsigned int)a9 completion:(id)a10
{
  id v16;
  id v17;
  unint64_t var1;
  unint64_t var0;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  MTLTextureDescriptor *v33;
  MTLTextureDescriptor *thumbnailTextureDescriptor;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  MTLRenderPipelineDescriptor *thumbnailPipelineDescriptor;
  MTLRenderPipelineState *v48;
  id v49;
  MTLRenderPipelineState *thumbnailPipeline;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  __int128 v59;
  id v60;

  v16 = a3;
  v17 = a8;
  v53 = a10;
  if (v17)
  {
    objc_msgSend(v16, "width");
    objc_msgSend(v16, "height");
    if (!a4->var2)
      goto LABEL_11;
    v20 = a4;
    var0 = a4->var0;
    var1 = v20->var1;
    v21 = objc_msgSend(v16, "height");
    v22 = objc_msgSend(v16, "width");
    v23 = objc_msgSend(v16, "height");
    v24 = (float)var1 / (float)v21;
    v25 = (unint64_t)(float)(v24 * (float)v22);
    if ((float)v25 > (float)var0)
    {
      v26 = objc_msgSend(v16, "width");
      v27 = objc_msgSend(v16, "width");
      v23 = objc_msgSend(v16, "height");
      v24 = (float)var0 / (float)v26;
      v25 = (unint64_t)(float)(v24 * (float)v27);
    }
    if (v25 && (unint64_t)(float)(v24 * (float)v23) != 0)
    {
LABEL_11:
      v29 = objc_msgSend(v16, "pixelFormat");
      v30 = 55;
      v31 = 90;
      if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 0x104)
        v31 = 55;
      if (v29 == 253)
        v31 = 10;
      if (v29 == 252)
        v31 = 55;
      if (v29 != 250)
        v30 = v31;
      if ((unint64_t)(v29 - 1) >= 0x7D)
        v32 = v30;
      else
        v32 = v29;
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v32);
      v33 = (MTLTextureDescriptor *)objc_claimAutoreleasedReturnValue();
      thumbnailTextureDescriptor = self->_thumbnailTextureDescriptor;
      self->_thumbnailTextureDescriptor = v33;

      -[MTLTextureDescriptor setUsage:](self->_thumbnailTextureDescriptor, "setUsage:", -[MTLTextureDescriptor usage](self->_thumbnailTextureDescriptor, "usage") | 4);
      -[MTLTextureDescriptor setResourceOptions:](self->_thumbnailTextureDescriptor, "setResourceOptions:", 32);
      -[MTLTextureDescriptor setStorageMode:](self->_thumbnailTextureDescriptor, "setStorageMode:", 0);
      -[DYMTLTextureResize device](self, "device");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "newTextureWithDescriptor:", self->_thumbnailTextureDescriptor);

      -[MTLRenderPassDescriptor colorAttachments](self->_thumbnailRenderPass, "colorAttachments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTexture:", v36);

      v39 = v16;
      if (objc_msgSend(v39, "textureType") != 2 || (objc_msgSend(v39, "usage") & 1) == 0)
      {
        -[DYMTLTextureResize _texture2DFromTexture:level:slice:depthPlane:commandBuffer:](self, "_texture2DFromTexture:level:slice:depthPlane:commandBuffer:", v39, a5, a6, a7, v17);
        v40 = objc_claimAutoreleasedReturnValue();

        v39 = (id)v40;
      }
      -[MTLRenderPipelineDescriptor colorAttachments](self->_thumbnailPipelineDescriptor, "colorAttachments");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setPixelFormat:", v52);

      -[MTLRenderPipelineDescriptor colorAttachments](self->_thumbnailPipelineDescriptor, "colorAttachments");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBlendingEnabled:", 0);

      switch(a9)
      {
        case 1u:
          v45 = 56;
          break;
        case 2u:
          v45 = 64;
          break;
        case 4u:
          v45 = 72;
          break;
        default:
LABEL_32:
          -[DYMTLTextureResize device](self, "device");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          thumbnailPipelineDescriptor = self->_thumbnailPipelineDescriptor;
          v60 = 0;
          v48 = (MTLRenderPipelineState *)objc_msgSend(v46, "newRenderPipelineStateWithDescriptor:error:", thumbnailPipelineDescriptor, &v60);
          v49 = v60;
          thumbnailPipeline = self->_thumbnailPipeline;
          self->_thumbnailPipeline = v48;

          if (self->_thumbnailPipeline)
          {
            objc_msgSend(v17, "renderCommandEncoderWithDescriptor:", self->_thumbnailRenderPass);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setRenderPipelineState:", self->_thumbnailPipeline);
            objc_msgSend(v51, "setDepthStencilState:", self->_thumbnailDepthStencilState);
            objc_msgSend(v51, "setFragmentSamplerState:atIndex:", self->_downscaleSampler, 0);
            objc_msgSend(v51, "setVertexBuffer:offset:atIndex:", self->_quadPositions, 0, 0);
            objc_msgSend(v51, "setVertexBuffer:offset:atIndex:", self->_quadTexCoords, 0, 1);
            v58[0] = 0;
            v58[1] = 0;
            *(double *)&v58[2] = (double)(unint64_t)objc_msgSend(v36, "width");
            *(double *)&v58[3] = (double)(unint64_t)objc_msgSend(v36, "height");
            v59 = xmmword_24114E010;
            objc_msgSend(v51, "setViewport:", v58);
            objc_msgSend(v51, "setFragmentTexture:atIndex:", v39, 0);
            objc_msgSend(v51, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 6, 1, self->_quadIndicies, 0);
            objc_msgSend(v51, "endEncoding");
            v54[0] = MEMORY[0x24BDAC760];
            v54[1] = 3221225472;
            v54[2] = __99__DYMTLTextureResize_resizeTexture_resolution_level_slice_depthPlane_inBuffer_withType_completion___block_invoke;
            v54[3] = &unk_251122C38;
            v56 = v53;
            v55 = v36;
            v57 = v52;
            objc_msgSend(v17, "addCompletedHandler:", v54);

          }
          goto LABEL_35;
      }
      -[MTLRenderPipelineDescriptor setFragmentFunction:](self->_thumbnailPipelineDescriptor, "setFragmentFunction:", *(Class *)((char *)&self->super.isa + v45));
      goto LABEL_32;
    }
  }
LABEL_35:

}

uint64_t __99__DYMTLTextureResize_resizeTexture_resolution_level_slice_depthPlane_inBuffer_withType_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

+ (id)forDevice:(id)a3
{
  id v3;
  DYMTLTextureResize *v4;

  v3 = a3;
  if (+[DYMTLTextureResize forDevice:]::onceToken != -1)
    dispatch_once(&+[DYMTLTextureResize forDevice:]::onceToken, &__block_literal_global);
  objc_msgSend((id)sDeviceThumbnailGenerator, "objectForKey:", v3);
  v4 = (DYMTLTextureResize *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[DYMTLTextureResize initWithDevice:]([DYMTLTextureResize alloc], "initWithDevice:", v3);
    objc_msgSend((id)sDeviceThumbnailGenerator, "setObject:forKey:", v4, v3);
  }

  return v4;
}

void __32__DYMTLTextureResize_forDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sDeviceThumbnailGenerator;
  sDeviceThumbnailGenerator = v0;

}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_fragmentFunctionForPixelFormatCache, 0);
  objc_storeStrong((id *)&self->_thumbnailDictionary, 0);
  objc_storeStrong((id *)&self->_thumbnailRenderPass, 0);
  objc_storeStrong((id *)&self->_thumbnailTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_thumbnailPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_thumbnailPipeline, 0);
  objc_storeStrong((id *)&self->_thumbnailStencilFragment, 0);
  objc_storeStrong((id *)&self->_thumbnailDepthFragment, 0);
  objc_storeStrong((id *)&self->_thumbnailColorFragment, 0);
  objc_storeStrong((id *)&self->_quadIndicies, 0);
  objc_storeStrong((id *)&self->_quadTexCoords, 0);
  objc_storeStrong((id *)&self->_quadPositions, 0);
  objc_storeStrong((id *)&self->_upscaleSampler, 0);
  objc_storeStrong((id *)&self->_downscaleSampler, 0);
  objc_storeStrong((id *)&self->_thumbnailDepthStencilState, 0);
}

@end
