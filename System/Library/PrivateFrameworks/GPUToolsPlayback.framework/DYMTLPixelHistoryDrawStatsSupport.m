@implementation DYMTLPixelHistoryDrawStatsSupport

- (DYMTLPixelHistoryDrawStatsSupport)initWithDebugFunctionPlayer:(id)a3
{
  id v5;
  DYMTLPixelHistoryDrawStatsSupport *v6;
  DYMTLPixelHistoryDrawStatsSupport *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  MTLLibrary *solidLibrary;
  MTLLibrary *v14;
  uint64_t v15;
  MTLFunction *solidCreationFragmentFunction;
  uint64_t v17;
  MTLTextureDescriptor *stencilTextureDescriptor;
  uint64_t v19;
  NSMutableArray *mockColorTextureDescriptors;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MTLTextureDescriptor *mockStencilTextureDescriptor;
  uint64_t v27;
  MTLTextureDescriptor *mockDepthTextureDescriptor;
  uint64_t v29;
  MTLRenderPassDescriptor *pixelHistoryRenderPassDescriptor;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  MTLRenderPassDescriptor *pixelHistoryMockRenderPassDescriptor;
  void *v36;
  void *v37;
  uint64_t v38;
  MTLRenderPassDescriptor *pixelHistoryVisibilityMockRenderPassDescriptor;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  DYMTLPixelHistoryDrawStatsSupport *v44;
  const char *v46;
  id v47;
  objc_super v48;

  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DYMTLPixelHistoryDrawStatsSupport;
  v6 = -[DYMTLPixelHistoryDrawStatsSupport init](&v48, sel_init);
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_player, a3),
        -[DYMTLFunctionPlayer device](v7->_player, "device"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v44 = 0;
    goto LABEL_9;
  }
  -[DYMTLFunctionPlayer device](v7->_player, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "\n        #include <metal_graphics>\n        #include <metal_texture>\n\n        using namespace metal;\n"
    "\n"
    "        fragment vec<float, 4> solidCreationFragment()\n"
    "        {\n"
    "            return vec<float, 4>(1.0, 1.0, 1.0, 1.0);\n"
    "        }\n"
    "    ");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v11 = objc_msgSend(v9, "newLibraryWithSource:options:error:", v10, 0, &v47);
  v12 = v47;
  solidLibrary = v7->_solidLibrary;
  v7->_solidLibrary = (MTLLibrary *)v11;

  v14 = v7->_solidLibrary;
  if (!v14)
  {
    v46 = "_solidLibrary != nil";
    goto LABEL_12;
  }
  v15 = -[MTLLibrary newFunctionWithName:](v14, "newFunctionWithName:", CFSTR("solidCreationFragment"));
  solidCreationFragmentFunction = v7->_solidCreationFragmentFunction;
  v7->_solidCreationFragmentFunction = (MTLFunction *)v15;

  if (!v7->_solidCreationFragmentFunction)
  {
    v46 = "_solidCreationFragmentFunction != nil";
LABEL_12:
    __assert_rtn("-[DYMTLPixelHistoryDrawStatsSupport initWithDebugFunctionPlayer:]", ", 0, v46);
  }
  objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 253, 1, 1, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  stencilTextureDescriptor = v7->_stencilTextureDescriptor;
  v7->_stencilTextureDescriptor = (MTLTextureDescriptor *)v17;

  -[MTLTextureDescriptor setUsage:](v7->_stencilTextureDescriptor, "setUsage:", -[MTLTextureDescriptor usage](v7->_stencilTextureDescriptor, "usage") | 4);
  -[MTLTextureDescriptor setStorageMode:](v7->_stencilTextureDescriptor, "setStorageMode:", 2);
  v19 = objc_opt_new();
  mockColorTextureDescriptors = v7->_mockColorTextureDescriptors;
  v7->_mockColorTextureDescriptors = (NSMutableArray *)v19;

  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 0, 1, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](v7->_mockColorTextureDescriptors, "setObject:atIndexedSubscript:", v22, i);

    -[NSMutableArray objectAtIndexedSubscript:](v7->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUsage:", 4);

    -[NSMutableArray objectAtIndexedSubscript:](v7->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", i);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStorageMode:", 2);

  }
  objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 0, 1, 1, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  mockStencilTextureDescriptor = v7->_mockStencilTextureDescriptor;
  v7->_mockStencilTextureDescriptor = (MTLTextureDescriptor *)v25;

  -[MTLTextureDescriptor setUsage:](v7->_mockStencilTextureDescriptor, "setUsage:", -[MTLTextureDescriptor usage](v7->_mockStencilTextureDescriptor, "usage") | 4);
  -[MTLTextureDescriptor setStorageMode:](v7->_mockStencilTextureDescriptor, "setStorageMode:", 2);
  objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 0, 1, 1, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  mockDepthTextureDescriptor = v7->_mockDepthTextureDescriptor;
  v7->_mockDepthTextureDescriptor = (MTLTextureDescriptor *)v27;

  -[MTLTextureDescriptor setUsage:](v7->_mockDepthTextureDescriptor, "setUsage:", -[MTLTextureDescriptor usage](v7->_mockDepthTextureDescriptor, "usage") | 4);
  -[MTLTextureDescriptor setStorageMode:](v7->_mockDepthTextureDescriptor, "setStorageMode:", 2);
  objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
  v29 = objc_claimAutoreleasedReturnValue();
  pixelHistoryRenderPassDescriptor = v7->_pixelHistoryRenderPassDescriptor;
  v7->_pixelHistoryRenderPassDescriptor = (MTLRenderPassDescriptor *)v29;

  -[MTLRenderPassDescriptor colorAttachments](v7->_pixelHistoryRenderPassDescriptor, "colorAttachments");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setLoadAction:", 0);
  objc_msgSend(v32, "setStoreAction:", 0);
  -[MTLRenderPassDescriptor stencilAttachment](v7->_pixelHistoryRenderPassDescriptor, "stencilAttachment");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLoadAction:", 2);
  objc_msgSend(v33, "setStoreAction:", 1);
  objc_msgSend(v33, "setClearStencil:", 0);

  objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
  v34 = objc_claimAutoreleasedReturnValue();
  pixelHistoryMockRenderPassDescriptor = v7->_pixelHistoryMockRenderPassDescriptor;
  v7->_pixelHistoryMockRenderPassDescriptor = (MTLRenderPassDescriptor *)v34;

  -[MTLRenderPassDescriptor depthAttachment](v7->_pixelHistoryMockRenderPassDescriptor, "depthAttachment");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLoadAction:", 1);
  objc_msgSend(v36, "setStoreAction:", 0);
  -[MTLRenderPassDescriptor stencilAttachment](v7->_pixelHistoryMockRenderPassDescriptor, "stencilAttachment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setLoadAction:", 2);
  objc_msgSend(v37, "setStoreAction:", 1);
  objc_msgSend(v37, "setClearStencil:", 0);

  objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
  v38 = objc_claimAutoreleasedReturnValue();
  pixelHistoryVisibilityMockRenderPassDescriptor = v7->_pixelHistoryVisibilityMockRenderPassDescriptor;
  v7->_pixelHistoryVisibilityMockRenderPassDescriptor = (MTLRenderPassDescriptor *)v38;

  -[MTLRenderPassDescriptor depthAttachment](v7->_pixelHistoryVisibilityMockRenderPassDescriptor, "depthAttachment");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLoadAction:", 1);
  objc_msgSend(v40, "setStoreAction:", 0);
  -[MTLRenderPassDescriptor stencilAttachment](v7->_pixelHistoryVisibilityMockRenderPassDescriptor, "stencilAttachment");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLoadAction:", 1);
  objc_msgSend(v41, "setStoreAction:", 0);

  objc_msgSend(v5, "device");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_supports_tessellation = objc_msgSend(v42, "supportsFeatureSet:", 7);

  LODWORD(v41) = v7->_supports_tessellation;
  v43 = (void *)objc_opt_new();
  NSSelectorFromString(CFSTR("tessellationControlPointIndexType"));
  v7->_supports_tessellation = ((_DWORD)v41 != 0) & objc_opt_respondsToSelector();

  v44 = v7;
LABEL_9:

  return v44;
}

- (BOOL)_updateTextureDescriptor:(id)a3 usingEncoder:(id)a4 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "width")
    && objc_msgSend(v7, "height")
    && ((v8 = objc_msgSend(v6, "width"), v8 != objc_msgSend(v7, "width"))
     || (v9 = objc_msgSend(v6, "height"), v9 != objc_msgSend(v7, "height"))))
  {
    objc_msgSend(v6, "setWidth:", objc_msgSend(v7, "width"));
    objc_msgSend(v6, "setHeight:", objc_msgSend(v7, "height"));
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getSingleUseMockColorTexture:(unint64_t)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "pixelFormat") == a4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "width") == a5)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "height");

      if (v14 == a6)
        return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextures, "objectAtIndexedSubscript:", a3);
      goto LABEL_7;
    }

  }
LABEL_7:
  -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPixelFormat:", a4);

  -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWidth:", a5);

  -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHeight:", a6);

  -[DYMTLFunctionPlayer device](self->_player, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextureDescriptors, "objectAtIndexedSubscript:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLNewTexture(v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_mockColorTextures, "setObject:atIndexedSubscript:", v20, a3);

  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_mockColorTextures, "objectAtIndexedSubscript:", a3);
}

- (id)getSingleUseMockDepthTextureWithPixelFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  void *v9;
  MTLTexture *v10;
  MTLTexture *mockDepthTexture;

  if (-[MTLTextureDescriptor pixelFormat](self->_mockDepthTextureDescriptor, "pixelFormat") != a3
    || -[MTLTextureDescriptor width](self->_mockDepthTextureDescriptor, "width") != a4
    || -[MTLTextureDescriptor height](self->_mockDepthTextureDescriptor, "height") != a5)
  {
    -[MTLTextureDescriptor setPixelFormat:](self->_mockDepthTextureDescriptor, "setPixelFormat:", a3);
    -[MTLTextureDescriptor setWidth:](self->_mockDepthTextureDescriptor, "setWidth:", a4);
    -[MTLTextureDescriptor setHeight:](self->_mockDepthTextureDescriptor, "setHeight:", a5);
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewTexture(v9, self->_mockDepthTextureDescriptor);
    v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mockDepthTexture = self->_mockDepthTexture;
    self->_mockDepthTexture = v10;

  }
  return self->_mockDepthTexture;
}

- (id)getSingleUseMockStencilTextureWithPixelFormat:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  void *v9;
  MTLTexture *v10;
  MTLTexture *mockStencilTexture;

  if (-[MTLTextureDescriptor pixelFormat](self->_mockStencilTextureDescriptor, "pixelFormat") != a3
    || -[MTLTextureDescriptor width](self->_mockStencilTextureDescriptor, "width") != a4
    || -[MTLTextureDescriptor height](self->_mockStencilTextureDescriptor, "height") != a5)
  {
    -[MTLTextureDescriptor setPixelFormat:](self->_mockStencilTextureDescriptor, "setPixelFormat:", a3);
    -[MTLTextureDescriptor setWidth:](self->_mockStencilTextureDescriptor, "setWidth:", a4);
    -[MTLTextureDescriptor setHeight:](self->_mockStencilTextureDescriptor, "setHeight:", a5);
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewTexture(v9, self->_mockStencilTextureDescriptor);
    v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mockStencilTexture = self->_mockStencilTexture;
    self->_mockStencilTexture = v10;

  }
  return self->_mockStencilTexture;
}

- (BOOL)prepareWithCommandEncoderId:(unint64_t)a3 parallelEncoderId:(unint64_t)a4 pipelineId:(unint64_t)a5 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a6
{
  void *v10;
  void *v11;
  BOOL v12;

  self->_originalCommandEncoderId = a3;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a4);
    a4 = objc_claimAutoreleasedReturnValue();
  }
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DYMTLPixelHistoryDrawStatsSupport _prepareWithEncoder:parallelEncoder:pipelineState:renderPassDescriptor:](self, "_prepareWithEncoder:parallelEncoder:pipelineState:renderPassDescriptor:", v10, a4, v11, a6);

  return v12;
}

- (BOOL)_prepareWithEncoder:(id)a3 parallelEncoder:(id)a4 pipelineState:(id)a5 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a6
{
  id v11;
  void *v12;
  char v13;
  void *v14;
  MTLTexture *v15;
  MTLTexture *stencilTexture;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  DYMTLStatefulRenderCommandEncoder *v27;
  DYMTLStatefulRenderCommandEncoder *savedVertexFragmentState;
  void *v30;
  id v31;

  v11 = a3;
  v31 = a4;
  DYMTLGetNullableAssociatedObject(a5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isRasterizationEnabled");
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v11, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[DYMTLPixelHistoryDrawStatsSupport _updateTextureDescriptor:usingEncoder:renderPassDescriptor:](self, "_updateTextureDescriptor:usingEncoder:renderPassDescriptor:", self->_stencilTextureDescriptor, v11, a6))
    {
      -[DYMTLFunctionPlayer device](self->_player, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      DYMTLNewTexture(v14, self->_stencilTextureDescriptor);
      v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      stencilTexture = self->_stencilTexture;
      self->_stencilTexture = v15;

    }
    objc_msgSend(v30, "stencilAttachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "texture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockStencilTextureWithPixelFormat:width:height:](self, "getSingleUseMockStencilTextureWithPixelFormat:width:height:", objc_msgSend(v18, "pixelFormat"), objc_msgSend(v18, "width"), objc_msgSend(v18, "height"));

    objc_msgSend(v30, "depthAttachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "texture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v24 = -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockDepthTextureWithPixelFormat:width:height:](self, "getSingleUseMockDepthTextureWithPixelFormat:width:height:", objc_msgSend(v22, "pixelFormat"), objc_msgSend(v22, "width"), objc_msgSend(v22, "height"));

    objc_storeStrong((id *)&self->_originalEncoder, a3);
    objc_storeStrong((id *)&self->_originalParallelEncoder, a4);
    objc_msgSend(v11, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewStatefulRenderCommandEncoder(v25, v26);
    v27 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
    savedVertexFragmentState = self->_savedVertexFragmentState;
    self->_savedVertexFragmentState = v27;

    objc_msgSend(v11, "applyVertexFragmentStateToEncoder:rawBytesBlock:", self->_savedVertexFragmentState, &__block_literal_global_2);
  }

  return v13;
}

uint64_t __108__DYMTLPixelHistoryDrawStatsSupport__prepareWithEncoder_parallelEncoder_pipelineState_renderPassDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

- (BOOL)createNumTotalRenderCommandEncoderInCommandBuffer:(id)a3 originalPipeline:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MTLTexture *stencilTexture;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  DYMTLStatefulRenderCommandEncoder *savedVertexFragmentState;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  _QWORD v45[5];
  id v46;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  DYMTLGetAssociatedObject(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", 0, 10, -[MTLTexture width](self->_stencilTexture, "width"), -[MTLTexture height](self->_stencilTexture, "height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLRenderPassDescriptor colorAttachments](self->_pixelHistoryRenderPassDescriptor, "colorAttachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTexture:", v10);

  stencilTexture = self->_stencilTexture;
  -[MTLRenderPassDescriptor stencilAttachment](self->_pixelHistoryRenderPassDescriptor, "stencilAttachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTexture:", stencilTexture);
  v42 = v8;

  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v9, "colorAttachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v19, "pixelFormat"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v19, "isBlendingEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

    objc_msgSend(v19, "setPixelFormat:", 0);
    objc_msgSend(v19, "setBlendingEnabled:", 0);

  }
  v22 = objc_msgSend(v9, "depthAttachmentPixelFormat");
  v23 = objc_msgSend(v9, "stencilAttachmentPixelFormat");
  objc_msgSend(v9, "fragmentFunction");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPixelFormat:", 10);

  objc_msgSend(v9, "setDepthAttachmentPixelFormat:", 0);
  objc_msgSend(v9, "setStencilAttachmentPixelFormat:", 253);
  objc_msgSend(v9, "setFragmentFunction:", self->_solidCreationFragmentFunction);
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v27 = (void *)objc_msgSend(v26, "newRenderPipelineStateWithDescriptor:error:", v9, &v46);
  v41 = v46;

  if (v27)
  {
    v40 = v7;
    for (j = 0; j != 8; ++j)
    {
      objc_msgSend(v9, "colorAttachments", v40, v41, v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", j);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "objectAtIndexedSubscript:", j);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPixelFormat:", objc_msgSend(v31, "unsignedLongLongValue"));

      objc_msgSend(v16, "objectAtIndexedSubscript:", j);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBlendingEnabled:", objc_msgSend(v32, "unsignedLongLongValue") != 0);

    }
    objc_msgSend(v9, "setDepthAttachmentPixelFormat:", v22);
    objc_msgSend(v9, "setStencilAttachmentPixelFormat:", v23);
    objc_msgSend(v9, "setFragmentFunction:", v43);
    DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryRenderPassDescriptor);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRenderPipelineState:", v27);
    objc_msgSend(v33, "setTriangleFillMode:", 0);
    savedVertexFragmentState = self->_savedVertexFragmentState;
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __104__DYMTLPixelHistoryDrawStatsSupport_createNumTotalRenderCommandEncoderInCommandBuffer_originalPipeline___block_invoke;
    v45[3] = &unk_250D6F1B0;
    v45[4] = self;
    -[DYMTLStatefulRenderCommandEncoder applyVertexFragmentStateToEncoder:rawBytesBlock:](savedVertexFragmentState, "applyVertexFragmentStateToEncoder:rawBytesBlock:", v33, v45);
    v44[0] = 0;
    v44[1] = 0;
    v44[2] = objc_msgSend(v33, "width");
    v44[3] = objc_msgSend(v33, "height");
    objc_msgSend(v33, "setScissorRect:", v44);
    v35 = (void *)objc_opt_new();
    objc_msgSend(v35, "setDepthStencilPassOperation:", 3);
    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setFrontFaceStencil:", v35);
    objc_msgSend(v36, "setBackFaceStencil:", v35);
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "newDepthStencilStateWithDescriptor:", v36);

    objc_msgSend(v33, "setDepthStencilState:", v38);
    -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v33, self->_originalCommandEncoderId);

    v7 = v40;
  }

  return v27 != 0;
}

uint64_t __104__DYMTLPixelHistoryDrawStatsSupport_createNumTotalRenderCommandEncoderInCommandBuffer_originalPipeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (BOOL)createNumFragmentPassesRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MTLTexture *stencilTexture;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  DYMTLStatefulRenderCommandEncoder *savedVertexFragmentState;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  _QWORD v38[5];
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  v37 = v11;
  DYMTLGetAssociatedObject(v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v10, "colorAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTLRenderPassDescriptor colorAttachments](self->_pixelHistoryMockRenderPassDescriptor, "colorAttachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setLoadAction:", 0);
    objc_msgSend(v17, "setStoreAction:", 0);
    objc_msgSend(v15, "texture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, objc_msgSend(v18, "pixelFormat"), objc_msgSend(v18, "width"), objc_msgSend(v18, "height"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTexture:", v20);

    }
    else
    {
      objc_msgSend(v17, "setTexture:", 0);
    }

  }
  -[MTLRenderPassDescriptor depthAttachment](self->_pixelHistoryMockRenderPassDescriptor, "depthAttachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTexture:", 0);

  stencilTexture = self->_stencilTexture;
  -[MTLRenderPassDescriptor stencilAttachment](self->_pixelHistoryMockRenderPassDescriptor, "stencilAttachment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTexture:", stencilTexture);

  v24 = objc_msgSend(v12, "depthAttachmentPixelFormat");
  v25 = objc_msgSend(v12, "stencilAttachmentPixelFormat");
  objc_msgSend(v12, "setDepthAttachmentPixelFormat:", 0);
  objc_msgSend(v12, "setStencilAttachmentPixelFormat:", 253);
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v27 = (void *)objc_msgSend(v26, "newRenderPipelineStateWithDescriptor:error:", v12, &v39);
  v28 = v39;

  if (v27)
  {
    v36 = v9;
    objc_msgSend(v12, "setDepthAttachmentPixelFormat:", v24);
    objc_msgSend(v12, "setStencilAttachmentPixelFormat:", v25);
    DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryMockRenderPassDescriptor);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setRenderPipelineState:", v27);
    objc_msgSend(v29, "setTriangleFillMode:", 0);
    savedVertexFragmentState = self->_savedVertexFragmentState;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __142__DYMTLPixelHistoryDrawStatsSupport_createNumFragmentPassesRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline___block_invoke;
    v38[3] = &unk_250D6F1B0;
    v38[4] = self;
    -[DYMTLStatefulRenderCommandEncoder applyVertexFragmentStateToEncoder:rawBytesBlock:](savedVertexFragmentState, "applyVertexFragmentStateToEncoder:rawBytesBlock:", v29, v38);
    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "setDepthStencilPassOperation:", 3);
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setFrontFaceStencil:", v31);
    objc_msgSend(v32, "setBackFaceStencil:", v31);
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "newDepthStencilStateWithDescriptor:", v32);

    objc_msgSend(v29, "setDepthStencilState:", v34);
    -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v29, self->_originalCommandEncoderId);

    v9 = v36;
  }

  return v27 != 0;
}

uint64_t __142__DYMTLPixelHistoryDrawStatsSupport_createNumFragmentPassesRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockDepthTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MTLBuffer *v32;
  MTLBuffer *visibilityResultBuffer;
  void *v34;
  DYMTLStatefulRenderCommandEncoder *savedVertexFragmentState;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  double v44;
  double v45;
  double v46;
  unint64_t v48;
  unint64_t v49;
  id v51;
  id v52;
  _QWORD v53[2];
  int64x2_t v54;
  _QWORD v55[5];

  v49 = a10;
  v48 = a9;
  v51 = a3;
  v16 = a4;
  v52 = a5;
  v17 = a6;
  v18 = a7;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v16, "colorAttachments", v48, v49);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTLRenderPassDescriptor colorAttachments](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "colorAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setLoadAction:", 0);
    objc_msgSend(v23, "setStoreAction:", 0);
    objc_msgSend(v21, "texture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, objc_msgSend(v24, "pixelFormat"), objc_msgSend(v24, "width"), objc_msgSend(v24, "height"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTexture:", v26);

    }
    else
    {
      objc_msgSend(v23, "setTexture:", 0);
    }

  }
  -[MTLRenderPassDescriptor depthAttachment](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "depthAttachment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTexture:", v18);

  objc_msgSend(v16, "stencilAttachment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "texture");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLRenderPassDescriptor stencilAttachment](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "stencilAttachment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v30, "setTexture:", v18);
  else
    objc_msgSend(v30, "setTexture:", 0);

  -[DYMTLFunctionPlayer device](self->_player, "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (MTLBuffer *)objc_msgSend(v31, "newBufferWithLength:options:", 8, 0);
  visibilityResultBuffer = self->_visibilityResultBuffer;
  self->_visibilityResultBuffer = v32;

  -[MTLRenderPassDescriptor setVisibilityResultBuffer:](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "setVisibilityResultBuffer:", self->_visibilityResultBuffer);
  DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryVisibilityMockRenderPassDescriptor);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setRenderPipelineState:", v52);
  objc_msgSend(v34, "setTriangleFillMode:", 0);
  savedVertexFragmentState = self->_savedVertexFragmentState;
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __202__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthTexture_visibilityResultMode_atX_y___block_invoke;
  v55[3] = &unk_250D6F1B0;
  v55[4] = self;
  -[DYMTLStatefulRenderCommandEncoder applyVertexFragmentStateToEncoder:rawBytesBlock:](savedVertexFragmentState, "applyVertexFragmentStateToEncoder:rawBytesBlock:", v34, v55);
  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setDepthWriteEnabled:", objc_msgSend(v17, "isDepthWriteEnabled"));
  objc_msgSend(v36, "setDepthCompareFunction:", objc_msgSend(v17, "depthCompareFunction"));
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "newDepthStencilStateWithDescriptor:", v36);

  objc_msgSend(v34, "setDepthStencilState:", v38);
  objc_msgSend(v34, "setDepthClipMode:", -[DYMTLStatefulRenderCommandEncoder depthClipMode](self->_originalEncoder, "depthClipMode"));
  -[DYMTLStatefulRenderCommandEncoder depthBias](self->_originalEncoder, "depthBias");
  v40 = v39;
  -[DYMTLStatefulRenderCommandEncoder depthBiasSlopeScale](self->_originalEncoder, "depthBiasSlopeScale");
  v42 = v41;
  -[DYMTLStatefulRenderCommandEncoder depthBiasClamp](self->_originalEncoder, "depthBiasClamp");
  LODWORD(v44) = v43;
  LODWORD(v45) = v40;
  LODWORD(v46) = v42;
  objc_msgSend(v34, "setDepthBias:slopeScale:clamp:", v45, v46, v44);
  objc_msgSend(v34, "setVisibilityResultMode:offset:", a8, 0);
  v53[0] = v48;
  v53[1] = v49;
  v54 = vdupq_n_s64(1uLL);
  objc_msgSend(v34, "setScissorRect:", v53);
  -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v34, self->_originalCommandEncoderId);

  return 1;
}

uint64_t __202__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthTexture_visibilityResultMode_atX_y___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockStencilTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MTLBuffer *v32;
  MTLBuffer *visibilityResultBuffer;
  void *v34;
  DYMTLStatefulRenderCommandEncoder *savedVertexFragmentState;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v46;
  unint64_t v47;
  id v49;
  id v50;
  _QWORD v51[2];
  int64x2_t v52;
  _QWORD v53[5];

  v47 = a10;
  v46 = a9;
  v49 = a3;
  v16 = a4;
  v50 = a5;
  v17 = a6;
  v18 = a7;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v16, "colorAttachments", v46, v47);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTLRenderPassDescriptor colorAttachments](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "colorAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setLoadAction:", 0);
    objc_msgSend(v23, "setStoreAction:", 0);
    objc_msgSend(v21, "texture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, objc_msgSend(v24, "pixelFormat"), objc_msgSend(v24, "width"), objc_msgSend(v24, "height"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTexture:", v26);

    }
    else
    {
      objc_msgSend(v23, "setTexture:", 0);
    }

  }
  objc_msgSend(v16, "depthAttachment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "texture");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLRenderPassDescriptor depthAttachment](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "depthAttachment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v29, "setTexture:", v18);
  else
    objc_msgSend(v29, "setTexture:", 0);

  -[MTLRenderPassDescriptor stencilAttachment](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "stencilAttachment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTexture:", v18);

  -[DYMTLFunctionPlayer device](self->_player, "device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (MTLBuffer *)objc_msgSend(v31, "newBufferWithLength:options:", 8, 0);
  visibilityResultBuffer = self->_visibilityResultBuffer;
  self->_visibilityResultBuffer = v32;

  -[MTLRenderPassDescriptor setVisibilityResultBuffer:](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "setVisibilityResultBuffer:", self->_visibilityResultBuffer);
  DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryVisibilityMockRenderPassDescriptor);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setRenderPipelineState:", v50);
  objc_msgSend(v34, "setTriangleFillMode:", 0);
  savedVertexFragmentState = self->_savedVertexFragmentState;
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __204__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockStencilTexture_visibilityResultMode_atX_y___block_invoke;
  v53[3] = &unk_250D6F1B0;
  v53[4] = self;
  -[DYMTLStatefulRenderCommandEncoder applyVertexFragmentStateToEncoder:rawBytesBlock:](savedVertexFragmentState, "applyVertexFragmentStateToEncoder:rawBytesBlock:", v34, v53);
  v36 = (void *)objc_opt_new();
  objc_msgSend(v17, "frontFaceStencil");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setStencilCompareFunction:", objc_msgSend(v37, "stencilCompareFunction"));

  objc_msgSend(v17, "frontFaceStencil");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setStencilFailureOperation:", objc_msgSend(v38, "stencilFailureOperation"));

  v39 = (void *)objc_opt_new();
  objc_msgSend(v17, "backFaceStencil");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setStencilCompareFunction:", objc_msgSend(v40, "stencilCompareFunction"));

  objc_msgSend(v17, "backFaceStencil");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setStencilFailureOperation:", objc_msgSend(v41, "stencilFailureOperation"));

  v42 = (void *)objc_opt_new();
  objc_msgSend(v42, "setFrontFaceStencil:", v36);
  objc_msgSend(v42, "setBackFaceStencil:", v39);
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "newDepthStencilStateWithDescriptor:", v42);

  objc_msgSend(v34, "setDepthStencilState:", v44);
  objc_msgSend(v34, "setStencilFrontReferenceValue:backReferenceValue:", -[DYMTLStatefulRenderCommandEncoder frontReferenceValue](self->_originalEncoder, "frontReferenceValue"), -[DYMTLStatefulRenderCommandEncoder backReferenceValue](self->_originalEncoder, "backReferenceValue"));
  objc_msgSend(v34, "setVisibilityResultMode:offset:", a8, 0);
  v51[0] = v46;
  v51[1] = v47;
  v52 = vdupq_n_s64(1uLL);
  objc_msgSend(v34, "setScissorRect:", v51);
  -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v34, self->_originalCommandEncoderId);

  return 1;
}

uint64_t __204__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockStencilTexture_visibilityResultMode_atX_y___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (BOOL)createNumVisibleRenderCommandEncoderInCommandBuffer:(id)a3 originalRenderPassDescriptor:(id)a4 originalPipeline:(id)a5 depthStencilDescriptor:(id)a6 mockDepthStencilTexture:(id)a7 visibilityResultMode:(unint64_t)a8 atX:(unint64_t)a9 y:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MTLBuffer *v30;
  MTLBuffer *visibilityResultBuffer;
  void *v32;
  DYMTLStatefulRenderCommandEncoder *savedVertexFragmentState;
  void *v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  unint64_t v45;
  unint64_t v46;
  id v48;
  id v49;
  _QWORD v50[2];
  int64x2_t v51;
  _QWORD v52[5];

  v46 = a10;
  v45 = a9;
  v48 = a3;
  v16 = a4;
  v49 = a5;
  v17 = a6;
  v18 = a7;
  objc_storeStrong((id *)&self->_originalCommandBuffer, a3);
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v16, "colorAttachments", v45, v46);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", i);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTLRenderPassDescriptor colorAttachments](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "colorAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setLoadAction:", 0);
    objc_msgSend(v23, "setStoreAction:", 0);
    objc_msgSend(v21, "texture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      -[DYMTLPixelHistoryDrawStatsSupport getSingleUseMockColorTexture:pixelFormat:width:height:](self, "getSingleUseMockColorTexture:pixelFormat:width:height:", i, objc_msgSend(v24, "pixelFormat"), objc_msgSend(v24, "width"), objc_msgSend(v24, "height"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTexture:", v26);

    }
    else
    {
      objc_msgSend(v23, "setTexture:", 0);
    }

  }
  -[MTLRenderPassDescriptor depthAttachment](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "depthAttachment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTexture:", v18);

  -[MTLRenderPassDescriptor stencilAttachment](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "stencilAttachment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTexture:", v18);

  -[DYMTLFunctionPlayer device](self->_player, "device");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (MTLBuffer *)objc_msgSend(v29, "newBufferWithLength:options:", 8, 0);
  visibilityResultBuffer = self->_visibilityResultBuffer;
  self->_visibilityResultBuffer = v30;

  -[MTLRenderPassDescriptor setVisibilityResultBuffer:](self->_pixelHistoryVisibilityMockRenderPassDescriptor, "setVisibilityResultBuffer:", self->_visibilityResultBuffer);
  DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_pixelHistoryVisibilityMockRenderPassDescriptor);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setRenderPipelineState:", v49);
  objc_msgSend(v32, "setTriangleFillMode:", 0);
  savedVertexFragmentState = self->_savedVertexFragmentState;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __209__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthStencilTexture_visibilityResultMode_atX_y___block_invoke;
  v52[3] = &unk_250D6F1B0;
  v52[4] = self;
  -[DYMTLStatefulRenderCommandEncoder applyVertexFragmentStateToEncoder:rawBytesBlock:](savedVertexFragmentState, "applyVertexFragmentStateToEncoder:rawBytesBlock:", v32, v52);
  -[DYMTLFunctionPlayer device](self->_player, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "newDepthStencilStateWithDescriptor:", v17);

  objc_msgSend(v32, "setDepthStencilState:", v35);
  objc_msgSend(v32, "setStencilFrontReferenceValue:backReferenceValue:", -[DYMTLStatefulRenderCommandEncoder frontReferenceValue](self->_originalEncoder, "frontReferenceValue"), -[DYMTLStatefulRenderCommandEncoder backReferenceValue](self->_originalEncoder, "backReferenceValue"));
  objc_msgSend(v32, "setDepthClipMode:", -[DYMTLStatefulRenderCommandEncoder depthClipMode](self->_originalEncoder, "depthClipMode"));
  -[DYMTLStatefulRenderCommandEncoder depthBias](self->_originalEncoder, "depthBias");
  v37 = v36;
  -[DYMTLStatefulRenderCommandEncoder depthBiasSlopeScale](self->_originalEncoder, "depthBiasSlopeScale");
  v39 = v38;
  -[DYMTLStatefulRenderCommandEncoder depthBiasClamp](self->_originalEncoder, "depthBiasClamp");
  LODWORD(v41) = v40;
  LODWORD(v42) = v37;
  LODWORD(v43) = v39;
  objc_msgSend(v32, "setDepthBias:slopeScale:clamp:", v42, v43, v41);
  objc_msgSend(v32, "setVisibilityResultMode:offset:", a8, 0);
  v50[0] = v45;
  v50[1] = v46;
  v51 = vdupq_n_s64(1uLL);
  objc_msgSend(v32, "setScissorRect:", v50);
  -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v32, self->_originalCommandEncoderId);

  return 1;
}

uint64_t __209__DYMTLPixelHistoryDrawStatsSupport_createNumVisibleRenderCommandEncoderInCommandBuffer_originalRenderPassDescriptor_originalPipeline_depthStencilDescriptor_mockDepthStencilTexture_visibilityResultMode_atX_y___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (void)collectPixelHistoryStencilDrawStatsAtX:(unint64_t)a3 y:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  MTLTexture *stencilTexture;
  MTLCommandBuffer *originalCommandBuffer;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", self->_originalCommandEncoderId);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endEncoding");

  -[DYMTLFunctionPlayer removeObjectForKey:](self->_player, "removeObjectForKey:", self->_originalCommandEncoderId);
  v10 = (void *)MEMORY[0x24BE63578];
  stencilTexture = self->_stencilTexture;
  originalCommandBuffer = self->_originalCommandBuffer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryStencilDrawStatsAtX_y_completion___block_invoke;
  v15[3] = &unk_250D6FB98;
  v13 = v8;
  v16 = v13;
  LOBYTE(v14) = 0;
  objc_msgSend(v10, "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:completion:", stencilTexture, 0, 0, 0, a3, a4, originalCommandBuffer, v14, v15);

}

void __89__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryStencilDrawStatsAtX_y_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_retainAutorelease(v3);
  (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(unsigned __int8 *)objc_msgSend(v5, "bytes"));

}

- (void)collectPixelHistoryVisibilityDrawStatsAtCompletion:(id)a3
{
  id v4;
  void *v5;
  MTLBuffer *v6;
  MTLCommandBuffer *originalCommandBuffer;
  id v8;
  MTLBuffer *v9;
  _QWORD v10[4];
  MTLBuffer *v11;
  id v12;

  v4 = a3;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", self->_originalCommandEncoderId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEncoding");

  -[DYMTLFunctionPlayer removeObjectForKey:](self->_player, "removeObjectForKey:", self->_originalCommandEncoderId);
  v6 = self->_visibilityResultBuffer;
  originalCommandBuffer = self->_originalCommandBuffer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryVisibilityDrawStatsAtCompletion___block_invoke;
  v10[3] = &unk_250D6FBC0;
  v8 = v4;
  v11 = v6;
  v12 = v8;
  v9 = v6;
  -[MTLCommandBuffer addCompletedHandler:](originalCommandBuffer, "addCompletedHandler:", v10);

}

uint64_t __88__DYMTLPixelHistoryDrawStatsSupport_collectPixelHistoryVisibilityDrawStatsAtCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "contents"));
}

- (MTLTexture)mockStencilTexture
{
  return self->_mockStencilTexture;
}

- (void)setMockStencilTexture:(id)a3
{
  objc_storeStrong((id *)&self->_mockStencilTexture, a3);
}

- (MTLTexture)mockDepthTexture
{
  return self->_mockDepthTexture;
}

- (void)setMockDepthTexture:(id)a3
{
  objc_storeStrong((id *)&self->_mockDepthTexture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockDepthTexture, 0);
  objc_storeStrong((id *)&self->_mockStencilTexture, 0);
  objc_storeStrong((id *)&self->_originalParallelEncoder, 0);
  objc_storeStrong((id *)&self->_originalEncoder, 0);
  objc_storeStrong((id *)&self->_originalCommandBuffer, 0);
  objc_storeStrong((id *)&self->_savedVertexFragmentState, 0);
  objc_storeStrong((id *)&self->_pixelHistorySolidRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_pixelHistoryVisibilityMockRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_pixelHistoryMockRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_pixelHistoryRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_visibilityResultBuffer, 0);
  objc_storeStrong((id *)&self->_mockColorTextures, 0);
  objc_storeStrong((id *)&self->_stencilTexture, 0);
  objc_storeStrong((id *)&self->_mockDepthTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_mockStencilTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_mockColorTextureDescriptors, 0);
  objc_storeStrong((id *)&self->_stencilTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_solidCreationFragmentFunction, 0);
  objc_storeStrong((id *)&self->_solidLibrary, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
