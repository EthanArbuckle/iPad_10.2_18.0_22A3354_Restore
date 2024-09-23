@implementation ColorTemperatureSpectrumRenderer

- (ColorTemperatureSpectrumRenderer)initWithMetal:(id)a3 startColor:(unsigned __int16)a4 endColor:(unsigned __int16)a5
{
  id v9;
  ColorTemperatureSpectrumRenderer *v10;
  MTLDevice *v11;
  MTLDevice *device;
  uint64_t v13;
  MTLCommandQueue *commandQueue;
  void *v15;
  void *v16;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ColorTemperatureSpectrumRenderer;
  v10 = -[ColorTemperatureSpectrumRenderer init](&v18, sel_init);
  if (v10)
  {
    v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v10->_device;
    v10->_device = v11;

    v13 = -[MTLDevice newCommandQueue](v10->_device, "newCommandQueue");
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v13;

    objc_storeStrong((id *)&v10->_metalView, a3);
    -[MTKView setDevice:](v10->_metalView, "setDevice:", v10->_device);
    -[MTKView setDelegate:](v10->_metalView, "setDelegate:", v10);
    v10->_startColor = a4;
    v10->_endColor = a5;
    -[ColorTemperatureSpectrumRenderer initializeVertexBuffer](v10, "initializeVertexBuffer");
    -[ColorTemperatureSpectrumRenderer setupRenderPipeline](v10, "setupRenderPipeline");
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "threadDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v10, CFSTR("SpectrumRendererThreadLocal"));

  }
  return v10;
}

- (void)setupRenderPipeline
{
  void *v3;
  MTLDevice *device;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  MTLPixelFormat v10;
  void *v11;
  void *v12;
  MTLDevice *v13;
  MTLRenderPipelineState *v14;
  id v15;
  MTLRenderPipelineState *pipelineState;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  v18 = 0;
  v5 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v3, &v18);
  v6 = v18;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
    v8 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("vertexShader"));
    objc_msgSend(v7, "setVertexFunction:", v8);

    v9 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("fragmentShader"));
    objc_msgSend(v7, "setFragmentFunction:", v9);

    v10 = -[MTKView colorPixelFormat](self->_metalView, "colorPixelFormat");
    objc_msgSend(v7, "colorAttachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPixelFormat:", v10);

    v13 = self->_device;
    v17 = v6;
    v14 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v13, "newRenderPipelineStateWithDescriptor:error:", v7, &v17);
    v15 = v17;

    pipelineState = self->_pipelineState;
    self->_pipelineState = v14;

    v6 = v15;
  }

}

- (void)initializeVertexBuffer
{
  MTLBuffer *v3;
  MTLBuffer *vertexBuffer;
  MTLBuffer *v5;
  MTLBuffer *fragmentShaderArgumentBuffer;
  _WORD *v7;
  _OWORD v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8[0] = xmmword_23E144240;
  v8[1] = unk_23E144250;
  v8[2] = xmmword_23E144260;
  v3 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v8, 48, 0);
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v3;

  v5 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0);
  fragmentShaderArgumentBuffer = self->_fragmentShaderArgumentBuffer;
  self->_fragmentShaderArgumentBuffer = v5;

  v7 = (_WORD *)-[MTLBuffer contents](self->_fragmentShaderArgumentBuffer, "contents");
  *v7 = -[ColorTemperatureSpectrumRenderer startColor](self, "startColor");
  v7[1] = -[ColorTemperatureSpectrumRenderer endColor](self, "endColor");
}

- (void)drawInMTKView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MTKView currentRenderPassDescriptor](self->_metalView, "currentRenderPassDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRenderPipelineState:", self->_pipelineState);
  objc_msgSend(v7, "setVertexBuffer:offset:atIndex:", self->_vertexBuffer, 0, 0);
  objc_msgSend(v7, "setFragmentBuffer:offset:atIndex:", self->_fragmentShaderArgumentBuffer, 0, 0);
  objc_msgSend(v7, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 6);
  objc_msgSend(v7, "endEncoding");
  -[MTKView currentDrawable](self->_metalView, "currentDrawable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentDrawable:", v8);

  objc_msgSend(v9, "commit");
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  objc_msgSend(a3, "setNeedsDisplay", a4.width, a4.height);
}

- (float)colorAtLocation:(CGPoint)a3
{
  CGFloat x;
  id v4;
  _DWORD *v5;
  float v6;

  x = a3.x;
  -[ColorTemperatureSpectrumRenderer fragmentShaderArgumentBuffer](self, "fragmentShaderArgumentBuffer", a3.x, a3.y);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (_DWORD *)objc_msgSend(v4, "contents");

  *(float *)&x = x;
  v6 = (*(float *)&x + 1.0) * 0.5;
  return fminf(fmaxf((float)(unsigned __int16)*v5 + (float)(v6 * (float)((float)HIWORD(*v5) - (float)(unsigned __int16)*v5)), 0.0), 1000.0);
}

+ (float)colorAtLocation:(CGPoint)a3
{
  CGFloat y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SpectrumRendererThreadLocal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "colorAtLocation:", x, y);
  LODWORD(y) = v8;

  return *(float *)&y;
}

- (CGPoint)positionForColor:(float)a3
{
  id v4;
  _DWORD *v5;
  float v6;
  double v7;
  double v8;
  CGPoint result;

  -[ColorTemperatureSpectrumRenderer fragmentShaderArgumentBuffer](self, "fragmentShaderArgumentBuffer");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (_DWORD *)objc_msgSend(v4, "contents");

  v6 = (float)((float)(a3 - (float)(unsigned __int16)*v5) / (float)((float)HIWORD(*v5) - (float)(unsigned __int16)*v5))
     * 2.0
     + -1.0;
  v7 = v6;
  v8 = 0.0;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (CGPoint)positionForColor:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SpectrumRendererThreadLocal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v7 = a3;
  objc_msgSend(v6, "positionForColor:", v7);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (MTKView)metalView
{
  return self->_metalView;
}

- (void)setMetalView:(id)a3
{
  objc_storeStrong((id *)&self->_metalView, a3);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (MTLRenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (void)setPipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineState, a3);
}

- (MTLBuffer)vertexBuffer
{
  return self->_vertexBuffer;
}

- (void)setVertexBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_vertexBuffer, a3);
}

- (MTLBuffer)fragmentShaderArgumentBuffer
{
  return self->_fragmentShaderArgumentBuffer;
}

- (void)setFragmentShaderArgumentBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentShaderArgumentBuffer, a3);
}

- (unsigned)startColor
{
  return self->_startColor;
}

- (void)setStartColor:(unsigned __int16)a3
{
  self->_startColor = a3;
}

- (unsigned)endColor
{
  return self->_endColor;
}

- (void)setEndColor:(unsigned __int16)a3
{
  self->_endColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentShaderArgumentBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
}

@end
