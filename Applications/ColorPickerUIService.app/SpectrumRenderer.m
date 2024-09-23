@implementation SpectrumRenderer

+ (id)colorAtLocation:(CGPoint)a3
{
  CGFloat y;
  double v4;
  int8x16_t v5;
  int8x16_t v6;
  float v7;
  float v8;
  int32x2_t v9;
  float v10;
  float32x2_t v11;
  float32x2_t v12;
  uint64_t v13;
  float v14;
  float v16;
  int32x2_t v17;
  int8x16_t v18;

  y = a3.y;
  v4 = COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3));
  v16 = *(float *)&v4;
  *(__n64 *)v5.i8 = sub_10003ED7C(v4);
  v6 = v5;
  v7 = fabsf(v16);
  v8 = *(float *)&v6.i32[2];
  *(float *)v9.i32 = fmaxf(fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]), *(float *)&v6.i32[2]);
  v17 = v9;
  v18 = v6;
  if (v16 >= 0.0)
  {
    v14 = (float)(1.0 - sub_10003EACC(flt_100047A30, v7)) / *(float *)v9.i32;
    v12 = vmul_n_f32(*(float32x2_t *)v18.i8, v14);
    HIDWORD(v13) = vextq_s8(v18, v18, 8uLL).i32[1];
    *(float *)&v13 = v8 * v14;
  }
  else
  {
    v10 = sub_10003EACC(flt_100047A30, 1.0 - v7);
    v11 = (float32x2_t)vdup_lane_s32(v17, 0);
    v12 = vadd_f32(v11, vmul_n_f32(vsub_f32(*(float32x2_t *)v18.i8, v11), v10));
    *(float *)&v13 = *(float *)v17.i32 + (float)((float)(v8 - *(float *)v17.i32) * v10);
    HIDWORD(v13) = v18.i32[3];
  }
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v12.f32[0], v12.f32[1], *(float *)&v13, *((float *)&v13 + 1));
}

+ (CGPoint)positionForColor:(id)a1
{
  __int128 v2;
  __int128 v3;
  float v4;
  float v5;
  __n128 v6;
  float32x2_t v7;
  float v8;
  __n128 v14;
  unsigned int v15;
  float64x2_t v16;
  double v17;
  __int128 v18;
  int32x2_t v19;
  float v20;
  unsigned int v21;
  CGPoint result;

  v3 = v2;
  v4 = *((float *)&v2 + 2);
  v5 = fmaxf(*(float *)&v2, fmaxf(*((float *)&v2 + 1), *((float *)&v2 + 2)));
  if (v5 >= 1.0)
  {
    *(float *)&v2 = fminf(*(float *)&v2, fminf(*((float *)&v2 + 1), *((float *)&v2 + 2))) + -1.0;
    v18 = v3;
    v19 = (int32x2_t)v2;
    v8 = -*(float *)&v2;
    *(float *)&v21 = sub_10003EC24(flt_100047A30, -*(float *)&v2) + -1.0;
    __asm { FMOV            V2.2D, #1.0 }
    v14.n128_u64[0] = (unint64_t)vcvt_f32_f64(vdivq_f64(vaddq_f64(vcvtq_f64_f32(vsub_f32(*(float32x2_t *)&v18, (float32x2_t)vdup_lane_s32(v19, 0))), _Q2), (float64x2_t)vdupq_lane_s64(COERCE__INT64(v8), 0)));
    *(float *)&v15 = ((float)(v4 - *(float *)v19.i32) + 1.0) / v8;
    v14.n128_u64[1] = __PAIR64__(HIDWORD(v18), v15);
    v7 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sub_10003EFE4(v14)), v21);
  }
  else
  {
    v6.n128_u64[0] = (unint64_t)vmul_n_f32(*(float32x2_t *)&v2, 1.0 / v5);
    v6.n128_f32[2] = *((float *)&v3 + 2) * (float)(1.0 / v5);
    v6.n128_u32[3] = HIDWORD(v3);
    v20 = sub_10003EFE4(v6);
    v7.f32[0] = sub_10003EC24(flt_100047A30, 1.0 - v5);
    v7.f32[1] = v20;
  }
  v16 = vcvtq_f64_f32(v7);
  v17 = v16.f64[1];
  result.x = v16.f64[0];
  result.y = v17;
  return result;
}

- (SpectrumRenderer)initWithMetal:(id)a3
{
  id v5;
  SpectrumRenderer *v6;
  MTLDevice *v7;
  MTLDevice *device;
  MTLCommandQueue *v9;
  MTLCommandQueue *commandQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SpectrumRenderer;
  v6 = -[SpectrumRenderer init](&v12, "init");
  if (v6)
  {
    v7 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v6->_device;
    v6->_device = v7;

    v9 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v6->_device, "newCommandQueue");
    commandQueue = v6->_commandQueue;
    v6->_commandQueue = v9;

    objc_storeStrong((id *)&v6->_metalView, a3);
    -[MTKView setDevice:](v6->_metalView, "setDevice:", v6->_device);
    -[MTKView setDelegate:](v6->_metalView, "setDelegate:", v6);
    -[SpectrumRenderer initializeVertexBuffer](v6, "initializeVertexBuffer");
    -[SpectrumRenderer setupRenderPipeline](v6, "setupRenderPipeline");
  }

  return v6;
}

- (void)setupRenderPipeline
{
  id v3;
  id v4;
  id v5;
  id v6;
  MTLPixelFormat v7;
  void *v8;
  void *v9;
  MTLDevice *device;
  MTLRenderPipelineState *v11;
  id v12;
  MTLRenderPipelineState *pipelineState;
  id v14;

  v3 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  v4 = -[MTLDevice newDefaultLibrary](self->_device, "newDefaultLibrary");
  v5 = objc_msgSend(v4, "newFunctionWithName:", CFSTR("vertexShader"));
  objc_msgSend(v3, "setVertexFunction:", v5);

  v6 = objc_msgSend(v4, "newFunctionWithName:", CFSTR("fragmentShader"));
  objc_msgSend(v3, "setFragmentFunction:", v6);

  v7 = -[MTKView colorPixelFormat](self->_metalView, "colorPixelFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorAttachments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v9, "setPixelFormat:", v7);

  device = self->_device;
  v14 = 0;
  v11 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v3, &v14);
  v12 = v14;
  pipelineState = self->_pipelineState;
  self->_pipelineState = v11;

}

- (void)initializeVertexBuffer
{
  MTLBuffer *v3;
  MTLBuffer *vertexBuffer;
  _OWORD v5[3];

  v5[0] = xmmword_100047A40;
  v5[1] = unk_100047A50;
  v5[2] = xmmword_100047A60;
  v3 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v5, 48, 0);
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v3;

}

- (void)drawInMTKView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTKView currentRenderPassDescriptor](self->_metalView, "currentRenderPassDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorAttachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v6, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", v4));
  objc_msgSend(v7, "setRenderPipelineState:", self->_pipelineState);
  objc_msgSend(v7, "setVertexBuffer:offset:atIndex:", self->_vertexBuffer, 0, 0);
  objc_msgSend(v7, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 6);
  objc_msgSend(v7, "endEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTKView currentDrawable](self->_metalView, "currentDrawable"));
  objc_msgSend(v9, "presentDrawable:", v8);

  objc_msgSend(v9, "commit");
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  _objc_msgSend(a3, "setNeedsDisplay", a4.width, a4.height);
}

- (void)startCapturing
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MTLCaptureManager sharedCaptureManager](MTLCaptureManager, "sharedCaptureManager"));
  v3 = objc_alloc_init((Class)MTLCaptureDescriptor);
  objc_msgSend(v3, "setCaptureObject:", self->_device);
  objc_msgSend(v4, "startCaptureWithDescriptor:error:", v3, 0);

}

- (void)stopCapturing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MTLCaptureManager sharedCaptureManager](MTLCaptureManager, "sharedCaptureManager"));
  objc_msgSend(v2, "stopCapture");

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

- (MTKView)metalView
{
  return self->_metalView;
}

- (void)setMetalView:(id)a3
{
  objc_storeStrong((id *)&self->_metalView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
}

@end
