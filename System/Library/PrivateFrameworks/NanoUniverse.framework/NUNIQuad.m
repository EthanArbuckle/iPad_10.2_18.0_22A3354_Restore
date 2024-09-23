@implementation NUNIQuad

- (NUNIQuad)initWithScreenScale:(double)a3 renderer:(id)a4
{
  id v7;
  NUNIQuad *v8;
  NUNIQuad *v9;
  float v10;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *renderSemaphore;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NUNIQuad;
  v8 = -[CLKUIQuad init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = a3;
    v8->_screenScale = v10;
    objc_storeStrong((id *)&v8->_renderer, a4);
    v11 = dispatch_semaphore_create(3);
    renderSemaphore = v9->_renderSemaphore;
    v9->_renderSemaphore = (OS_dispatch_semaphore *)v11;

  }
  return v9;
}

- (void)setupForQuadView:(id)a3
{
  self->_baseTime = CACurrentMediaTime();
}

- (NUNIViewport)_viewport
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float screenScale;
  uint64_t v10;
  float v11;

  -[CLKUIQuad quadView](self, "quadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  screenScale = self->_screenScale;
  v10 = (int)(float)(screenScale * v8);
  v11 = v7;
  return (NUNIViewport)(v10 | ((unint64_t)(int)(float)(screenScale * v11) << 32));
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NUNIQuad scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NUNIRenderer renderOffscreenWithScene:viewport:commandBuffer:](self->_renderer, "renderOffscreenWithScene:viewport:commandBuffer:", v4, -[NUNIQuad _viewport](self, "_viewport"), v5);

}

- (BOOL)prepareForTime:(double)a3
{
  void *v4;
  NSObject *renderSemaphore;
  dispatch_time_t v6;
  NSObject *v7;
  BOOL v8;
  CFTimeInterval v9;

  -[NUNIQuad scene](self, "scene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    renderSemaphore = self->_renderSemaphore;
    v6 = dispatch_time(0, 3000000000);
    if (!dispatch_semaphore_wait(renderSemaphore, v6))
    {
      objc_msgSend(v4, "updateFromDateIfNeeded");
      v9 = CACurrentMediaTime() - self->_baseTime;
      *(float *)&v9 = v9;
      objc_msgSend(v4, "update:", v9);
      v8 = 1;
      goto LABEL_8;
    }
    NUNILoggingObjectForDomain(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NUNIQuad prepareForTime:].cold.1(v7);

  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  OS_dispatch_semaphore *v11;

  v6 = a3;
  v7 = a4;
  -[NUNIQuad scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NUNIRenderer renderWithScene:viewport:commandBuffer:passDescriptor:](self->_renderer, "renderWithScene:viewport:commandBuffer:passDescriptor:", v8, -[NUNIQuad _viewport](self, "_viewport"), v6, v7);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy_;
    v10[4] = __Block_byref_object_dispose_;
    v11 = self->_renderSemaphore;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__NUNIQuad_renderWithCommandBuffer_passDescriptor___block_invoke;
    v9[3] = &unk_24CFD7580;
    v9[4] = v10;
    objc_msgSend(v6, "addCompletedHandler:", v9);
    _Block_object_dispose(v10, 8);

  }
}

intptr_t __51__NUNIQuad_renderWithCommandBuffer_passDescriptor___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)renderFailedForReason:(unint64_t)a3
{
  int v3;
  NSObject *v5;

  v3 = a3;
  NUNILoggingObjectForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NUNIQuad renderFailedForReason:].cold.1(v3, v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_renderSemaphore);
}

- (id)spheroidAtPoint:(CGPoint)a3
{
  NUNIViewport v4;
  float64x2_t v5;
  CGFloat x;
  CGFloat y;

  x = a3.x;
  y = a3.y;
  v4 = -[NUNIQuad _viewport](self, "_viewport");
  v5.f64[0] = x;
  v5.f64[1] = y;
  return -[NUNIRenderer spheroidAtPoint:scene:viewport:](self->_renderer, "spheroidAtPoint:scene:viewport:", self->_scene, v4, COERCE_DOUBLE(vmul_n_f32(vcvt_f32_f64(v5), self->_screenScale)));
}

- (NUNIRenderer)renderer
{
  return self->_renderer;
}

- (NUNIScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_renderSemaphore, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)prepareForTime:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2134A1000, log, OS_LOG_TYPE_ERROR, "NUNIQuad timed out in prepareForTime -- dropping frame.", v1, 2u);
}

- (void)renderFailedForReason:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2134A1000, a2, OS_LOG_TYPE_ERROR, "NUNIQuad render failed (reason=%d).", (uint8_t *)v2, 8u);
}

@end
