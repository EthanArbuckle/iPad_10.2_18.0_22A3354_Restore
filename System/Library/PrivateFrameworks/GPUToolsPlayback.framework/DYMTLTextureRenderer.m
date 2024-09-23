@implementation DYMTLTextureRenderer

- (DYMTLTextureRenderer)initWithDevice:(id)a3
{
  id v5;
  DYMTLTextureRenderer *v6;
  DYMTLTextureRenderer *v7;
  id *p_device;
  MTLDevice *device;
  uint64_t v10;
  id v11;
  MTLLibrary *library;
  MTLLibrary *v13;
  uint64_t v14;
  MTLFunction *vertexFunction;
  uint64_t v16;
  MTLFunction *opaqueFragmentFunction;
  uint64_t v18;
  MTLFunction *blendingFragmentFunction;
  uint64_t v20;
  MTLFunction *blendingFragmentFunction_2dArray;
  uint64_t v22;
  MTLRenderPipelineDescriptor *renderPipelineDescriptor;
  void *v24;
  void *v25;
  uint64_t v26;
  MTLDepthStencilDescriptor *depthStencilDescriptor;
  uint64_t v28;
  MTLBuffer *positionBuffer;
  MTLBuffer *v30;
  _OWORD *v31;
  uint64_t v32;
  MTLBuffer *texCoordBuffer;
  MTLBuffer *v34;
  _OWORD *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  MTLSamplerState *samplerState;
  DYMTLTextureRenderer *v41;
  const char *v43;
  id v44;
  objc_super v45;

  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)DYMTLTextureRenderer;
  v6 = -[DYMTLTextureRenderer init](&v45, sel_init);
  v7 = v6;
  if (!v6 || (p_device = (id *)&v6->_device, objc_storeStrong((id *)&v6->_device, a3), (device = v7->_device) == 0))
  {
    v41 = 0;
    goto LABEL_9;
  }
  v44 = 0;
  v10 = -[MTLDevice newLibraryWithSource:options:error:](device, "newLibraryWithSource:options:error:", CFSTR("#include <metal_graphics>\n#include <metal_texture>\nusing namespace metal;\nstruct VertexOutput\n{\n  vec<float, 4> pos [[position]];\n  vec<float, 2> uv;\n};\nstruct UniformData\n{\n  vec<float, 4> blendColor;\n  uint selectedLayer;\n};\n\nvertex VertexOutput vertexFunction(device const vec<float,4> *pos_data [[ buffer(0) ]],\n                                   device const vec<float,2> *uv_data [[ buffer(1) ]], \n                                   uint vid [[ vertex_id ]])\n{\n  VertexOutput out;\n  out.pos = pos_data[vid];\n  out.uv = uv_data[vid];\n  return out;\n}\nfragment vec<float, 4> opaqueFragmentFunction(VertexOutput in [[stage_in]],\n                                              texture2d<float> tex [[ texture(0) ]],\n                                              sampler sam [[ sampler(0) ]])\n{\n  vec<float, 4> tex_color = tex.sample(sam, in.uv);\n  return tex_color;\n}\nfragment vec<float, 4> blendingFragmentFunction(VertexOutput in [[stage_in]],\n                                                texture2d<float> tex [[ texture(0) ]],\n                                                sampler sam [[ sampler(0) ]],\n                                                constant UniformData &uniformData [[ buffer(0) ]]){\n  vec<float, 4> tex_color = tex.sample(sam, in.uv);\n  return tex_color.r * uniformData.blendColor;\n}\nfragment vec<float, 4> blendingFragmentFunction_2dArray(VertexOutput in [[stage_in]],\n                                                        texture2d_array<float> tex [[ texture(0) ]],\n                                                        sampler sam [[ sampler(0) ]],\n                                                        constant UniformData &uniformData [[ buffer(0) ]]){\n  vec<float, 4> tex_color = tex.sample(sam, in.uv, uniformData.selectedLayer);\n  return tex_color.r * uniformData.blendColor;\n}\n"),
          0,
          &v44);
  v11 = v44;
  library = v7->_library;
  v7->_library = (MTLLibrary *)v10;

  v13 = v7->_library;
  if (!v13)
    __assert_rtn("-[DYMTLTextureRenderer initWithDevice:]", ", 0, "_library != nil");
  v14 = -[MTLLibrary newFunctionWithName:](v13, "newFunctionWithName:", CFSTR("vertexFunction"));
  vertexFunction = v7->_vertexFunction;
  v7->_vertexFunction = (MTLFunction *)v14;

  v16 = -[MTLLibrary newFunctionWithName:](v7->_library, "newFunctionWithName:", CFSTR("opaqueFragmentFunction"));
  opaqueFragmentFunction = v7->_opaqueFragmentFunction;
  v7->_opaqueFragmentFunction = (MTLFunction *)v16;

  v18 = -[MTLLibrary newFunctionWithName:](v7->_library, "newFunctionWithName:", CFSTR("blendingFragmentFunction"));
  blendingFragmentFunction = v7->_blendingFragmentFunction;
  v7->_blendingFragmentFunction = (MTLFunction *)v18;

  v20 = -[MTLLibrary newFunctionWithName:](v7->_library, "newFunctionWithName:", CFSTR("blendingFragmentFunction_2dArray"));
  blendingFragmentFunction_2dArray = v7->_blendingFragmentFunction_2dArray;
  v7->_blendingFragmentFunction_2dArray = (MTLFunction *)v20;

  v22 = objc_opt_new();
  renderPipelineDescriptor = v7->_renderPipelineDescriptor;
  v7->_renderPipelineDescriptor = (MTLRenderPipelineDescriptor *)v22;

  -[MTLRenderPipelineDescriptor colorAttachments](v7->_renderPipelineDescriptor, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setBlendingEnabled:", 0);
  objc_msgSend(v25, "setSourceRGBBlendFactor:", 4);
  objc_msgSend(v25, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v25, "setRgbBlendOperation:", 0);
  objc_msgSend(v25, "setSourceAlphaBlendFactor:", 0);
  objc_msgSend(v25, "setDestinationAlphaBlendFactor:", 1);
  objc_msgSend(v25, "setAlphaBlendOperation:", 0);
  -[MTLRenderPipelineDescriptor setVertexFunction:](v7->_renderPipelineDescriptor, "setVertexFunction:", v7->_vertexFunction);
  v26 = objc_opt_new();
  depthStencilDescriptor = v7->_depthStencilDescriptor;
  v7->_depthStencilDescriptor = (MTLDepthStencilDescriptor *)v26;

  if (!v7->_depthStencilDescriptor)
  {
    v43 = "_depthStencilDescriptor != nil";
    goto LABEL_14;
  }
  v28 = objc_msgSend(*p_device, "newBufferWithLength:options:", 64, 0);
  positionBuffer = v7->_positionBuffer;
  v7->_positionBuffer = (MTLBuffer *)v28;

  v30 = v7->_positionBuffer;
  if (!v30)
  {
    v43 = "_positionBuffer != nil";
    goto LABEL_14;
  }
  v31 = (_OWORD *)-[MTLBuffer contents](v30, "contents");
  *v31 = -[DYMTLTextureRenderer initWithDevice:]::positionList;
  v31[1] = unk_23C7A4840;
  v31[2] = xmmword_23C7A4850;
  v31[3] = unk_23C7A4860;
  v32 = objc_msgSend(*p_device, "newBufferWithLength:options:", 32, 0);
  texCoordBuffer = v7->_texCoordBuffer;
  v7->_texCoordBuffer = (MTLBuffer *)v32;

  v34 = v7->_texCoordBuffer;
  if (!v34)
  {
    v43 = "_texCoordBuffer != nil";
LABEL_14:
    __assert_rtn("-[DYMTLTextureRenderer initWithDevice:]", ", 0, v43);
  }
  v35 = (_OWORD *)-[MTLBuffer contents](v34, "contents");
  *v35 = -[DYMTLTextureRenderer initWithDevice:]::texCoordList;
  v35[1] = unk_23C7A4880;
  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setMinFilter:", 1);
  objc_msgSend(v36, "setMagFilter:", 1);
  objc_msgSend(v36, "setMipFilter:", 2);
  objc_msgSend(v36, "setMaxAnisotropy:", 1);
  objc_msgSend(v36, "setSAddressMode:", 0);
  objc_msgSend(v36, "setTAddressMode:", 0);
  objc_msgSend(v36, "setRAddressMode:", 0);
  objc_msgSend(v36, "setNormalizedCoordinates:", 1);
  LODWORD(v37) = 0;
  objc_msgSend(v36, "setLodMinClamp:", v37);
  LODWORD(v38) = 2139095039;
  objc_msgSend(v36, "setLodMaxClamp:", v38);
  v39 = objc_msgSend(*p_device, "newSamplerStateWithDescriptor:", v36);
  samplerState = v7->_samplerState;
  v7->_samplerState = (MTLSamplerState *)v39;

  v41 = v7;
LABEL_9:

  return v41;
}

- (void)renderTexture:(id)a3 withEncoder:(id)a4 enableBlending:(BOOL)a5 layerIndex:(unsigned int)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  unint64_t v12;
  MTLRenderPipelineDescriptor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v7 = a5;
  v37 = a3;
  v10 = a4;
  if (!v37)
    goto LABEL_21;
  if (!v10)
    goto LABEL_21;
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DYMTLTextureRenderer _renderPassPixelFormatFromDescriptor:](self, "_renderPassPixelFormatFromDescriptor:", v11);

  if (!v12)
    goto LABEL_21;
  v13 = self->_renderPipelineDescriptor;
  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBlendingEnabled:", v7);

  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRgbBlendOperation:", 0);

  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceRGBBlendFactor:", 4);

  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDestinationRGBBlendFactor:", 5);

  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlphaBlendOperation:", 0);

  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSourceAlphaBlendFactor:", 4);

  -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDestinationAlphaBlendFactor:", 5);

  v28 = objc_msgSend(v37, "textureType");
  if (v28 == 2)
  {
    v29 = 32;
    if (v7)
      v29 = 40;
  }
  else
  {
    if (v28 != 3)
      goto LABEL_13;
    if (!v7)
    {
      v30 = 0;
      goto LABEL_12;
    }
    v29 = 48;
  }
  v30 = *(uint64_t *)((char *)&self->super.isa + v29);
LABEL_12:
  -[MTLRenderPipelineDescriptor setFragmentFunction:](v13, "setFragmentFunction:", v30);
LABEL_13:
  -[MTLRenderPipelineDescriptor fragmentFunction](v13, "fragmentFunction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[MTLRenderPipelineDescriptor vertexFunction](v13, "vertexFunction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[MTLRenderPipelineDescriptor colorAttachments](v13, "colorAttachments");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPixelFormat:", v12);

      v35 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](self->_device, "newRenderPipelineStateWithDescriptor:error:", v13, 0);
      if (v35)
      {
        v36 = (void *)-[MTLDevice newDepthStencilStateWithDescriptor:](self->_device, "newDepthStencilStateWithDescriptor:", self->_depthStencilDescriptor);
        if (v36)
        {
          self->_uniformData.layerIndex = a6;
          objc_msgSend(v10, "setCullMode:", 0);
          objc_msgSend(v10, "setTriangleFillMode:", 0);
          objc_msgSend(v10, "setDepthStencilState:", v36);
          objc_msgSend(v10, "setRenderPipelineState:", v35);
          objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", self->_positionBuffer, 0, 0);
          objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", self->_texCoordBuffer, 0, 1);
          objc_msgSend(v10, "setFragmentTexture:atIndex:", v37, 0);
          objc_msgSend(v10, "setFragmentSamplerState:atIndex:", self->_samplerState, 0);
          objc_msgSend(v10, "setFragmentBytes:length:atIndex:", &self->_uniformData, 32, 0);
          objc_msgSend(v10, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 4, 0, 4, 1);
        }

      }
    }
  }

LABEL_21:
}

- (unint64_t)_renderPassPixelFormatFromDescriptor:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = 0;
  while (1)
  {
    objc_msgSend(a3, "colorAttachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "texture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "width") && objc_msgSend(v8, "height"))
        break;
    }

    if (++v4 == 8)
      return 0;
  }
  v9 = objc_msgSend(v8, "pixelFormat");

  return v9;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  self->_uniformData.blendColor[0] = a3;
  self->_uniformData.blendColor[1] = a4;
  self->_uniformData.blendColor[2] = a5;
  self->_uniformData.blendColor[3] = a6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplerState, 0);
  objc_storeStrong((id *)&self->_texCoordBuffer, 0);
  objc_storeStrong((id *)&self->_positionBuffer, 0);
  objc_storeStrong((id *)&self->_depthStencilDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_blendingFragmentFunction_2dArray, 0);
  objc_storeStrong((id *)&self->_blendingFragmentFunction, 0);
  objc_storeStrong((id *)&self->_opaqueFragmentFunction, 0);
  objc_storeStrong((id *)&self->_vertexFunction, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = xmmword_23C7A4820;
  *((_DWORD *)self + 26) = 0;
  return self;
}

@end
