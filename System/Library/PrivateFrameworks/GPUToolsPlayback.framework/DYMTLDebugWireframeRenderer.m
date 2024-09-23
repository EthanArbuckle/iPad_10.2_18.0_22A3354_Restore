@implementation DYMTLDebugWireframeRenderer

- (DYMTLDebugWireframeRenderer)initWithDebugFunctionPlayer:(id)a3
{
  id v5;
  DYMTLDebugWireframeRenderer *v6;
  DYMTLDebugWireframeRenderer *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  MTLLibrary *wireframeLibrary;
  MTLLibrary *v14;
  uint64_t v15;
  MTLFunction *wireframeCreationFragmentFunction;
  uint64_t v17;
  MTLFunction *outlinePostProcessFunction;
  uint64_t v19;
  MTLTextureDescriptor *wireframeTextureDescriptor;
  uint64_t v21;
  MTLTextureDescriptor *outlineTextureDescriptor;
  uint64_t v23;
  MTLRenderPassDescriptor *wireframeRenderPassDescriptor;
  void *v25;
  uint64_t v26;
  MTLRenderPassColorAttachmentDescriptor *wireframeRenderPassColorAttachmentDescriptor;
  uint64_t v28;
  MTLRenderPassDescriptor *solidRenderPassDescriptor;
  void *v30;
  uint64_t v31;
  MTLRenderPassColorAttachmentDescriptor *solidRenderPassColorAttachmentDescriptor;
  void *v33;
  _BOOL4 supports_tessellation;
  void *v35;
  DYMTLDebugWireframeRenderer *v36;
  const char *v38;
  id v39;
  objc_super v40;

  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)DYMTLDebugWireframeRenderer;
  v6 = -[DYMTLDebugWireframeRenderer init](&v40, sel_init);
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_player, a3),
        -[DYMTLFunctionPlayer device](v7->_player, "device"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v36 = 0;
    goto LABEL_8;
  }
  -[DYMTLFunctionPlayer device](v7->_player, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "\n        #include <metal_graphics>\n        #include <metal_texture>\n\n        using namespace metal;\n"
    "    \n"
    "        fragment vec<float, 4> wireframeCreationFragment()\n"
    "        {\n"
    "            return vec<float, 4>(1.0, 1.0, 1.0, 1.0);\n"
    "        }\n"
    "    \n"
    "        kernel void createOutlineTexture(texture2d<half, access::read> solid [[texture(0)]], texture2d<half, access:"
    ":write> outline [[texture(1)]], uint2 gridPosition [[thread_position_in_grid]])\n"
    "        {\n"
    "            uint width = solid.get_width();\n"
    "            uint height = solid.get_height();\n"
    "            if (gridPosition.x < width && gridPosition.y < height)\n"
    "            {\n"
    "                auto currentColor = solid.read(gridPosition).r;\n"
    "                outline.write(vec<half, 4>(0.0, 0.0, 0.0, 0.0), gridPosition);\n"
    "                \n"
    "                if (abs(currentColor - 0.0) <= 0.0001)\n"
    "                {\n"
    "                    auto left = solid.read(uint2(gridPosition.x - 1, gridPosition.y)).r;\n"
    "                    auto right = solid.read(uint2(gridPosition.x + 1, gridPosition.y)).r;\n"
    "                    auto up = solid.read(uint2(gridPosition.x, gridPosition.y + 1)).r;\n"
    "                    auto down = solid.read(uint2(gridPosition.x, gridPosition.y - 1)).r;\n"
    "                    if (left == 1 || right == 1 || up == 1 || down == 1)\n"
    "                    {\n"
    "                        // pixel is part of the outline\n"
    "                        outline.write(vec<half, 4>(1.0, 1.0, 1.0, 1.0), gridPosition);\n"
    "                    }\n"
    "                }\n"
    "                else if (abs(currentColor - 1.0) <= 0.0001 && (gridPosition.x == 0 || gridPosition.y == 0 || gridPos"
    "ition.x == width - 1 || gridPosition.y == height - 1))\n"
    "                {\n"
    "                     outline.write(vec<half, 4>(1.0, 1.0, 1.0, 1.0), gridPosition);\n"
    "                }\n"
    "            }\n"
    "        }\n"
    "    ");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v11 = objc_msgSend(v9, "newLibraryWithSource:options:error:", v10, 0, &v39);
  v12 = v39;
  wireframeLibrary = v7->_wireframeLibrary;
  v7->_wireframeLibrary = (MTLLibrary *)v11;

  v14 = v7->_wireframeLibrary;
  if (!v14)
  {
    v38 = "_wireframeLibrary != nil";
    goto LABEL_12;
  }
  v15 = -[MTLLibrary newFunctionWithName:](v14, "newFunctionWithName:", CFSTR("wireframeCreationFragment"));
  wireframeCreationFragmentFunction = v7->_wireframeCreationFragmentFunction;
  v7->_wireframeCreationFragmentFunction = (MTLFunction *)v15;

  if (!v7->_wireframeCreationFragmentFunction)
  {
    v38 = "_wireframeCreationFragmentFunction != nil";
    goto LABEL_12;
  }
  v17 = -[MTLLibrary newFunctionWithName:](v7->_wireframeLibrary, "newFunctionWithName:", CFSTR("createOutlineTexture"));
  outlinePostProcessFunction = v7->_outlinePostProcessFunction;
  v7->_outlinePostProcessFunction = (MTLFunction *)v17;

  if (!v7->_outlinePostProcessFunction)
  {
    v38 = "_outlinePostProcessFunction != nil";
LABEL_12:
    __assert_rtn("-[DYMTLDebugWireframeRenderer initWithDebugFunctionPlayer:]", ", 0, v38);
  }
  objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, 1, 1, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  wireframeTextureDescriptor = v7->_wireframeTextureDescriptor;
  v7->_wireframeTextureDescriptor = (MTLTextureDescriptor *)v19;

  -[MTLTextureDescriptor setUsage:](v7->_wireframeTextureDescriptor, "setUsage:", -[MTLTextureDescriptor usage](v7->_wireframeTextureDescriptor, "usage") | 5);
  objc_msgSend(MEMORY[0x24BDDD748], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, 1, 1, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  outlineTextureDescriptor = v7->_outlineTextureDescriptor;
  v7->_outlineTextureDescriptor = (MTLTextureDescriptor *)v21;

  -[MTLTextureDescriptor setUsage:](v7->_outlineTextureDescriptor, "setUsage:", -[MTLTextureDescriptor usage](v7->_outlineTextureDescriptor, "usage") | 7);
  objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
  v23 = objc_claimAutoreleasedReturnValue();
  wireframeRenderPassDescriptor = v7->_wireframeRenderPassDescriptor;
  v7->_wireframeRenderPassDescriptor = (MTLRenderPassDescriptor *)v23;

  -[MTLRenderPassDescriptor colorAttachments](v7->_wireframeRenderPassDescriptor, "colorAttachments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = objc_claimAutoreleasedReturnValue();
  wireframeRenderPassColorAttachmentDescriptor = v7->_wireframeRenderPassColorAttachmentDescriptor;
  v7->_wireframeRenderPassColorAttachmentDescriptor = (MTLRenderPassColorAttachmentDescriptor *)v26;

  -[MTLRenderPassColorAttachmentDescriptor setLoadAction:](v7->_wireframeRenderPassColorAttachmentDescriptor, "setLoadAction:", 2);
  -[MTLRenderPassColorAttachmentDescriptor setStoreAction:](v7->_wireframeRenderPassColorAttachmentDescriptor, "setStoreAction:", 1);
  -[MTLRenderPassColorAttachmentDescriptor setClearColor:](v7->_wireframeRenderPassColorAttachmentDescriptor, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x24BDDD698], "renderPassDescriptor");
  v28 = objc_claimAutoreleasedReturnValue();
  solidRenderPassDescriptor = v7->_solidRenderPassDescriptor;
  v7->_solidRenderPassDescriptor = (MTLRenderPassDescriptor *)v28;

  -[MTLRenderPassDescriptor colorAttachments](v7->_solidRenderPassDescriptor, "colorAttachments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
  v31 = objc_claimAutoreleasedReturnValue();
  solidRenderPassColorAttachmentDescriptor = v7->_solidRenderPassColorAttachmentDescriptor;
  v7->_solidRenderPassColorAttachmentDescriptor = (MTLRenderPassColorAttachmentDescriptor *)v31;

  -[MTLRenderPassColorAttachmentDescriptor setLoadAction:](v7->_solidRenderPassColorAttachmentDescriptor, "setLoadAction:", 2);
  -[MTLRenderPassColorAttachmentDescriptor setStoreAction:](v7->_solidRenderPassColorAttachmentDescriptor, "setStoreAction:", 1);
  -[MTLRenderPassColorAttachmentDescriptor setClearColor:](v7->_solidRenderPassColorAttachmentDescriptor, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, "device");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_supports_tessellation = objc_msgSend(v33, "supportsFeatureSet:", 7);

  supports_tessellation = v7->_supports_tessellation;
  v35 = (void *)objc_opt_new();
  NSSelectorFromString(CFSTR("tessellationControlPointIndexType"));
  v7->_supports_tessellation = supports_tessellation & objc_opt_respondsToSelector();

  v36 = v7;
LABEL_8:

  return v36;
}

- (void)_updateTextureDescriptor:(id)a3 usingEncoder:(id)a4 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "width"))
  {
    if (objc_msgSend(v7, "height"))
    {
      objc_msgSend(v9, "setWidth:", objc_msgSend(v7, "width"));
      objc_msgSend(v9, "setHeight:", objc_msgSend(v7, "height"));
      if (a5)
      {
        if (a5->renderTargetArrayLength + 1 >= 3)
        {
          v8 = objc_alloc_init(MEMORY[0x24BDDD698]);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "setTextureType:", 3);
            objc_msgSend(v9, "setArrayLength:", a5->renderTargetArrayLength);
          }

        }
      }
    }
  }

}

- (int64_t)_prepareWireframeTextureWithEncoder:(id)a3 commandBuffer:(id)a4 pipelineState:(id)a5 parallelEncoder:(id)a6 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MTLTexture *wireframeTexture;
  MTLTexture **p_wireframeTexture;
  int64_t v18;
  void *v19;
  void *v20;
  MTLTexture *v21;
  MTLTexture *v22;
  void *v23;
  MTLTexture *v24;
  MTLTexture *outlineTexture;
  void *v26;
  MTLTexture *v27;
  MTLTexture *solidTexture;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MTLRenderPipelineState *v36;
  id v37;
  MTLRenderPipelineState *wireframeRenderPipelineState;
  void *v39;
  MTLFunction *outlinePostProcessFunction;
  MTLComputePipelineState *v41;
  MTLComputePipelineState *outlineComputePipelineState;
  MTLTexture *v43;
  MTLTexture *v44;
  void *v45;
  void *v47;
  void *v48;
  DYMTLStatefulRenderCommandEncoder *v49;
  DYMTLStatefulRenderCommandEncoder *savedVertexState;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  id v57;
  id v58;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  obj = a6;
  v15 = a6;
  p_wireframeTexture = &self->_wireframeTexture;
  wireframeTexture = self->_wireframeTexture;
  self->_wireframeTexture = 0;

  v18 = 3;
  if (v12 && v13 && v14)
  {
    DYMTLGetNullableAssociatedObject(v14, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isRasterizationEnabled") & 1) == 0)
      goto LABEL_19;
    -[DYMTLDebugWireframeRenderer _updateTextureDescriptor:usingEncoder:renderPassDescriptor:](self, "_updateTextureDescriptor:usingEncoder:renderPassDescriptor:", self->_wireframeTextureDescriptor, v12, a7);
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewTexture(v20, self->_wireframeTextureDescriptor);
    v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v22 = self->_wireframeTexture;
    self->_wireframeTexture = v21;

    -[DYMTLDebugWireframeRenderer _updateTextureDescriptor:usingEncoder:renderPassDescriptor:](self, "_updateTextureDescriptor:usingEncoder:renderPassDescriptor:", self->_outlineTextureDescriptor, v12, a7);
    -[DYMTLFunctionPlayer device](self->_player, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewTexture(v23, self->_outlineTextureDescriptor);
    v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    outlineTexture = self->_outlineTexture;
    self->_outlineTexture = v24;

    -[DYMTLFunctionPlayer device](self->_player, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    DYMTLNewTexture(v26, self->_wireframeTextureDescriptor);
    v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    solidTexture = self->_solidTexture;
    self->_solidTexture = v27;

    if (!self->_wireframeTexture)
    {
LABEL_19:
      v18 = 3;
      goto LABEL_20;
    }
    v53 = v15;
    v54 = v13;
    v52 = v19;
    v29 = v19;
    v30 = (void *)objc_opt_new();
    objc_msgSend(v29, "vertexDescriptor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setVertexDescriptor:", v31);

    objc_msgSend(v29, "vertexFunction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setVertexFunction:", v32);

    objc_msgSend(v30, "setFragmentFunction:", self->_wireframeCreationFragmentFunction);
    objc_msgSend(v30, "colorAttachments");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPixelFormat:", 10);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "setInputPrimitiveTopology:", objc_msgSend(v29, "inputPrimitiveTopology"));
    if (self->_supports_tessellation)
    {
      objc_msgSend(v30, "setTessellationFactorFormat:", objc_msgSend(v29, "tessellationFactorFormat"));
      objc_msgSend(v30, "setTessellationPartitionMode:", objc_msgSend(v29, "tessellationPartitionMode"));
      objc_msgSend(v30, "setTessellationOutputWindingOrder:", objc_msgSend(v29, "tessellationOutputWindingOrder"));
      objc_msgSend(v30, "setTessellationFactorScaleEnabled:", objc_msgSend(v29, "isTessellationFactorScaleEnabled"));
      objc_msgSend(v30, "setTessellationFactorStepFunction:", objc_msgSend(v29, "tessellationFactorStepFunction"));
      objc_msgSend(v30, "setMaxTessellationFactor:", objc_msgSend(v29, "maxTessellationFactor"));
      objc_msgSend(v30, "setTessellationControlPointIndexType:", objc_msgSend(v29, "tessellationControlPointIndexType"));
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "setVertexAmplificationMode:", objc_msgSend(v29, "vertexAmplificationMode"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "setMaxVertexAmplificationCount:", objc_msgSend(v29, "maxVertexAmplificationCount"));
    -[DYMTLFunctionPlayer device](self->_player, "device", v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v36 = (MTLRenderPipelineState *)objc_msgSend(v35, "newRenderPipelineStateWithDescriptor:error:", v30, &v58);
    v37 = v58;
    wireframeRenderPipelineState = self->_wireframeRenderPipelineState;
    self->_wireframeRenderPipelineState = v36;

    DYMTLSetAssociatedObject(self->_wireframeRenderPipelineState, 0, v30);
    if (self->_wireframeRenderPipelineState)
    {

      -[DYMTLFunctionPlayer device](self->_player, "device");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      outlinePostProcessFunction = self->_outlinePostProcessFunction;
      v57 = 0;
      v41 = (MTLComputePipelineState *)objc_msgSend(v39, "newComputePipelineStateWithFunction:error:", outlinePostProcessFunction, &v57);
      v37 = v57;
      p_wireframeTexture = &self->_outlineComputePipelineState;
      outlineComputePipelineState = self->_outlineComputePipelineState;
      self->_outlineComputePipelineState = v41;

      if (!v37)
      {
        objc_storeStrong((id *)&self->_originalCommandBuffer, a4);
        objc_storeStrong((id *)&self->_originalEncoder, a3);
        objc_storeStrong((id *)&self->_originalParallelEncoder, obj);
        objc_msgSend(v12, "device");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "descriptor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLNewStatefulRenderCommandEncoder(v47, v48);
        v49 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
        savedVertexState = self->_savedVertexState;
        self->_savedVertexState = v49;

        -[DYMTLStatefulRenderCommandEncoder setRenderPipelineState:](self->_savedVertexState, "setRenderPipelineState:", self->_wireframeRenderPipelineState);
        objc_msgSend(v12, "applyVertexStateToEncoder:rawBytesBlock:", self->_savedVertexState, &__block_literal_global);
        v45 = v51;
        if (-[DYMTLDebugWireframeRenderer _currentRenderPipelineHasBufferOrTextureReadWrite:encoder:](self, "_currentRenderPipelineHasBufferOrTextureReadWrite:encoder:", v14, v12))
        {
          -[DYMTLDebugWireframeRenderer createWireframeRenderCommandEncoder:](self, "createWireframeRenderCommandEncoder:", a7);
          v18 = 1;
        }
        else
        {
          v18 = 0;
        }
        goto LABEL_18;
      }
      v43 = self->_outlineTexture;
      self->_outlineTexture = 0;

    }
    v44 = *p_wireframeTexture;
    *p_wireframeTexture = 0;

    v18 = 3;
    v45 = v51;
LABEL_18:

    v15 = v53;
    v13 = v54;
    v19 = v52;
LABEL_20:

  }
  return v18;
}

uint64_t __132__DYMTLDebugWireframeRenderer__prepareWireframeTextureWithEncoder_commandBuffer_pipelineState_parallelEncoder_renderPassDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

- (BOOL)currentRenderPipelineHasBufferOrTextureReadWrite:(unint64_t)a3
{
  DYMTLDebugWireframeRenderer *v3;
  void *v4;
  void *v5;

  v3 = self;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderPipelineState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[DYMTLDebugWireframeRenderer _currentRenderPipelineHasBufferOrTextureReadWrite:encoder:](v3, "_currentRenderPipelineHasBufferOrTextureReadWrite:encoder:", v5, v4);

  return (char)v3;
}

- (BOOL)_currentRenderPipelineHasBufferOrTextureReadWrite:(id)a3 encoder:(id)a4
{
  return 0;
}

- (BOOL)createWireframeRenderCommandEncoder:(DYMTLRenderPassDescriptor *)a3
{
  void *v5;
  void *v6;
  DYMTLStatefulParallelRenderCommandEncoder *originalParallelEncoder;
  void *v8;
  void *v9;
  DYMTLStatefulRenderCommandEncoder *savedVertexState;
  DYMTLStatefulRenderCommandEncoder *v11;
  DYMTLStatefulRenderCommandEncoder *originalEncoder;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  DYMTLStatefulRenderCommandEncoder *v18;
  DYMTLStatefulRenderCommandEncoder *v19;
  _QWORD v21[5];

  -[DYFunctionPlayer engine](self->_player, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wireframeLineWidth");

  if ((*(_DWORD *)-[DYFunctionPlayer function](self->_player, "function") + 16147) < 4)
  {
    -[DYFunctionPlayer engine](self->_player, "engine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tessellationWireframeLineWidth");

  }
  -[DYMTLStatefulRenderCommandEncoder endEncoding](self->_originalEncoder, "endEncoding");
  originalParallelEncoder = self->_originalParallelEncoder;
  if (originalParallelEncoder)
    -[DYMTLStatefulParallelRenderCommandEncoder endEncoding](originalParallelEncoder, "endEncoding");
  -[MTLRenderPassColorAttachmentDescriptor setTexture:](self->_wireframeRenderPassColorAttachmentDescriptor, "setTexture:", self->_wireframeTexture);
  if ((objc_opt_respondsToSelector() & 1) != 0 && a3->renderTargetArrayLength != -1)
    -[MTLRenderPassDescriptor setRenderTargetArrayLength:](self->_wireframeRenderPassDescriptor, "setRenderTargetArrayLength:");
  if ((objc_opt_respondsToSelector() & 1) != 0 && a3->rasterizationRateMap)
  {
    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLRenderPassDescriptor setRasterizationRateMap:](self->_wireframeRenderPassDescriptor, "setRasterizationRateMap:", v8);

  }
  DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_wireframeRenderPassDescriptor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRenderPipelineState:", self->_wireframeRenderPipelineState);
  savedVertexState = self->_savedVertexState;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__DYMTLDebugWireframeRenderer_createWireframeRenderCommandEncoder___block_invoke;
  v21[3] = &unk_250D6F1B0;
  v21[4] = self;
  -[DYMTLStatefulRenderCommandEncoder applyVertexStateToEncoder:rawBytesBlock:](savedVertexState, "applyVertexStateToEncoder:rawBytesBlock:", v9, v21);
  v11 = self->_savedVertexState;
  self->_savedVertexState = 0;

  originalEncoder = self->_originalEncoder;
  self->_originalEncoder = 0;

  -[DYMTLFunctionPlayer device](self->_player, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(v13, "newDepthStencilStateWithDescriptor:", v14);

  objc_msgSend(v9, "setDepthStencilState:", v15);
  objc_msgSend(v9, "setTriangleFillMode:", 1);
  -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v9, self->_originalCommandEncoderId);
  objc_msgSend(v9, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  DYMTLNewStatefulRenderCommandEncoder(v16, v17);
  v18 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
  v19 = self->_savedVertexState;
  self->_savedVertexState = v18;

  -[DYMTLStatefulRenderCommandEncoder setRenderPipelineState:](self->_savedVertexState, "setRenderPipelineState:", self->_wireframeRenderPipelineState);
  objc_msgSend(v9, "applyVertexStateToEncoder:rawBytesBlock:", self->_savedVertexState, &__block_literal_global_52);

  return 1;
}

uint64_t __67__DYMTLDebugWireframeRenderer_createWireframeRenderCommandEncoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

uint64_t __67__DYMTLDebugWireframeRenderer_createWireframeRenderCommandEncoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

- (BOOL)createSolidRenderCommandEncoder:(DYMTLRenderPassDescriptor *)a3 commandBufferId:(unint64_t)a4 commandEncoderId:(unint64_t)a5 parallelEncoderId:(unint64_t)a6
{
  MTLTexture *solidTexture;
  MTLCommandBufferSPI *v11;
  MTLCommandBufferSPI *originalCommandBuffer;
  DYMTLStatefulRenderCommandEncoder *v13;
  DYMTLStatefulRenderCommandEncoder *originalEncoder;
  DYMTLStatefulParallelRenderCommandEncoder *v15;
  DYMTLStatefulParallelRenderCommandEncoder *originalParallelEncoder;
  DYMTLStatefulParallelRenderCommandEncoder *v17;
  void *v18;
  void *v19;
  DYMTLStatefulRenderCommandEncoder *savedVertexState;
  DYMTLStatefulRenderCommandEncoder *v21;
  DYMTLStatefulRenderCommandEncoder *v22;
  _QWORD v24[5];

  solidTexture = self->_solidTexture;
  if (solidTexture)
  {
    self->_originalCommandEncoderId = a5;
    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a4);
    v11 = (MTLCommandBufferSPI *)objc_claimAutoreleasedReturnValue();
    originalCommandBuffer = self->_originalCommandBuffer;
    self->_originalCommandBuffer = v11;

    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a5);
    v13 = (DYMTLStatefulRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
    originalEncoder = self->_originalEncoder;
    self->_originalEncoder = v13;

    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a6);
    v15 = (DYMTLStatefulParallelRenderCommandEncoder *)objc_claimAutoreleasedReturnValue();
    originalParallelEncoder = self->_originalParallelEncoder;
    self->_originalParallelEncoder = v15;

    -[DYMTLStatefulRenderCommandEncoder endEncoding](self->_originalEncoder, "endEncoding");
    v17 = self->_originalParallelEncoder;
    if (v17)
      -[DYMTLStatefulParallelRenderCommandEncoder endEncoding](v17, "endEncoding");
    -[MTLRenderPassColorAttachmentDescriptor setTexture:](self->_solidRenderPassColorAttachmentDescriptor, "setTexture:", self->_solidTexture);
    if ((objc_opt_respondsToSelector() & 1) != 0 && a3->renderTargetArrayLength != -1)
      -[MTLRenderPassDescriptor setRenderTargetArrayLength:](self->_solidRenderPassDescriptor, "setRenderTargetArrayLength:");
    if ((objc_opt_respondsToSelector() & 1) != 0 && a3->rasterizationRateMap)
    {
      -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTLRenderPassDescriptor setRasterizationRateMap:](self->_solidRenderPassDescriptor, "setRasterizationRateMap:", v18);

    }
    DYMTLNewStatefulRenderCommandEncoder(self->_originalCommandBuffer, self->_solidRenderPassDescriptor);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRenderPipelineState:", self->_wireframeRenderPipelineState);
    savedVertexState = self->_savedVertexState;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __114__DYMTLDebugWireframeRenderer_createSolidRenderCommandEncoder_commandBufferId_commandEncoderId_parallelEncoderId___block_invoke;
    v24[3] = &unk_250D6F1B0;
    v24[4] = self;
    -[DYMTLStatefulRenderCommandEncoder applyVertexStateToEncoder:rawBytesBlock:](savedVertexState, "applyVertexStateToEncoder:rawBytesBlock:", v19, v24);
    v21 = self->_savedVertexState;
    self->_savedVertexState = 0;

    v22 = self->_originalEncoder;
    self->_originalEncoder = 0;

    -[DYMTLFunctionPlayer setObject:forKey:](self->_player, "setObject:forKey:", v19, self->_originalCommandEncoderId);
  }
  return solidTexture != 0;
}

uint64_t __114__DYMTLDebugWireframeRenderer_createSolidRenderCommandEncoder_commandBufferId_commandEncoderId_parallelEncoderId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a4));
}

- (void)createOutlineTexture
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int64x2_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];
  int64x2_t v16;
  uint64_t v17;
  _QWORD v18[3];

  if (self->_outlineComputePipelineState && self->_solidTexture)
  {
    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", self->_originalCommandEncoderId);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endEncoding");

    -[DYMTLFunctionPlayer removeObjectForKey:](self->_player, "removeObjectForKey:", self->_originalCommandEncoderId);
    DYMTLNewStatefulComputeCommandEncoder(self->_originalCommandBuffer, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MTLTexture width](self->_solidTexture, "width");
    v6 = -[MTLTexture height](self->_solidTexture, "height");
    objc_msgSend(v4, "setComputePipelineState:", self->_outlineComputePipelineState);
    v7 = vcvtps_u32_f32((float)v5 * 0.0625);
    v8 = vcvtps_u32_f32((float)v6 * 0.0625);
    if (-[MTLTexture textureType](self->_solidTexture, "textureType") == 3)
    {
      v9 = 0;
      v12 = vdupq_n_s64(0x10uLL);
      while (v9 < -[MTLTexture arrayLength](self->_solidTexture, "arrayLength", *(_OWORD *)&v12))
      {
        DYMTLNewTextureView(self->_solidTexture, -[MTLTexture pixelFormat](self->_solidTexture, "pixelFormat"), 2, 0, -[MTLTexture mipmapLevelCount](self->_solidTexture, "mipmapLevelCount"), v9, 1uLL);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        DYMTLNewTextureView(self->_outlineTexture, -[MTLTexture pixelFormat](self->_outlineTexture, "pixelFormat"), 2, 0, -[MTLTexture mipmapLevelCount](self->_outlineTexture, "mipmapLevelCount"), v9, 1uLL);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTexture:atIndex:", v10, 0);
        objc_msgSend(v4, "setTexture:atIndex:", v11, 1);
        v18[0] = v7;
        v18[1] = v8;
        v18[2] = 1;
        v16 = v12;
        v17 = 1;
        objc_msgSend(v4, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);

        ++v9;
      }
    }
    else
    {
      objc_msgSend(v4, "setTexture:atIndex:", self->_solidTexture, 0);
      objc_msgSend(v4, "setTexture:atIndex:", self->_outlineTexture, 1);
      v15[0] = v7;
      v15[1] = v8;
      v15[2] = 1;
      v13 = vdupq_n_s64(0x10uLL);
      v14 = 1;
      objc_msgSend(v4, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
    }
    objc_msgSend(v4, "endEncoding");

  }
}

- (int64_t)prepareWireframeTextureWithCommandBufferId:(unint64_t)a3 commandEncoderId:(unint64_t)a4 parallelEncoderId:(unint64_t)a5 pipelineId:(unint64_t)a6 renderPassDescriptor:(DYMTLRenderPassDescriptor *)a7
{
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;

  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_originalCommandEncoderId = a4;
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a5);
    a5 = objc_claimAutoreleasedReturnValue();
  }
  -[DYMTLFunctionPlayer objectForKey:](self->_player, "objectForKey:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DYMTLDebugWireframeRenderer _prepareWireframeTextureWithEncoder:commandBuffer:pipelineState:parallelEncoder:renderPassDescriptor:](self, "_prepareWireframeTextureWithEncoder:commandBuffer:pipelineState:parallelEncoder:renderPassDescriptor:", v13, v12, v14, a5, a7);

  return v15;
}

- (MTLTexture)wireframeTexture
{
  return self->_wireframeTexture;
}

- (MTLTexture)outlineTexture
{
  return self->_outlineTexture;
}

- (MTLTexture)solidTexture
{
  return self->_solidTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalParallelEncoder, 0);
  objc_storeStrong((id *)&self->_originalEncoder, 0);
  objc_storeStrong((id *)&self->_originalCommandBuffer, 0);
  objc_storeStrong((id *)&self->_savedVertexState, 0);
  objc_storeStrong((id *)&self->_outlineComputePipelineState, 0);
  objc_storeStrong((id *)&self->_wireframeRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_solidRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_solidRenderPassColorAttachmentDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeRenderPassColorAttachmentDescriptor, 0);
  objc_storeStrong((id *)&self->_solidTexture, 0);
  objc_storeStrong((id *)&self->_outlineTexture, 0);
  objc_storeStrong((id *)&self->_wireframeTexture, 0);
  objc_storeStrong((id *)&self->_outlineTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeTextureDescriptor, 0);
  objc_storeStrong((id *)&self->_outlinePostProcessFunction, 0);
  objc_storeStrong((id *)&self->_wireframeCreationFragmentFunction, 0);
  objc_storeStrong((id *)&self->_wireframeLibrary, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
