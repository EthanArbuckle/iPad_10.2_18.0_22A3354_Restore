@implementation FIUIBreathingPetalRingMetalRenderer

- (FIUIBreathingPetalRingMetalRenderer)initWithMetalKitView:(id)a3 petalColor:(int64_t)a4 numberOfPetals:(int64_t)a5 showBlurTrails:(BOOL)a6
{
  id v11;
  FIUIBreathingPetalRingMetalRenderer *v12;
  FIUIBreathingPetalRingMetalRenderer *v13;
  uint64_t v14;
  MTLDevice *device;
  uint64_t v16;
  MTLCommandQueue *commandQueue;
  double v18;
  double v19;
  objc_super v21;

  v11 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FIUIBreathingPetalRingMetalRenderer;
  v12 = -[FIUIBreathingPetalRingMetalRenderer init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mtkView, a3);
    -[MTKView setColorPixelFormat:](v13->_mtkView, "setColorPixelFormat:", 80);
    -[MTKView setClearColor:](v13->_mtkView, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    -[MTKView device](v13->_mtkView, "device");
    v14 = objc_claimAutoreleasedReturnValue();
    device = v13->_device;
    v13->_device = (MTLDevice *)v14;

    v16 = -[MTLDevice newCommandQueue](v13->_device, "newCommandQueue");
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v16;

    v13->_petalColor = a4;
    v13->_numberOfPetals = a5;
    v13->_showBlurTrails = a6;
    -[FIUIBreathingPetalRingMetalRenderer _createBuffers](v13, "_createBuffers");
    -[FIUIBreathingPetalRingMetalRenderer _loadTextures](v13, "_loadTextures");
    -[FIUIBreathingPetalRingMetalRenderer _setupIndexes](v13, "_setupIndexes");
    -[FIUIBreathingPetalRingMetalRenderer _setupVertices](v13, "_setupVertices");
    objc_msgSend(v11, "bounds");
    -[FIUIBreathingPetalRingMetalRenderer _setupProjectionMatrixForSize:](v13, "_setupProjectionMatrixForSize:", v18, v19);
    -[FIUIBreathingPetalRingMetalRenderer _setupRenderPipeline](v13, "_setupRenderPipeline");
  }

  return v13;
}

- (void)_loadTextures
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MTLTexture *v8;
  id v9;
  MTLTexture *circleGradient;
  id v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDDB48]), "initWithDevice:", self->_device);
  v4 = *MEMORY[0x24BDDDB08];
  v12[0] = *MEMORY[0x24BDDDB00];
  v12[1] = v4;
  v5 = *MEMORY[0x24BDDDB28];
  v13[0] = MEMORY[0x24BDBD1C8];
  v13[1] = v5;
  v12[2] = *MEMORY[0x24BDDDB10];
  v13[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIDeepBreathingGradientImageDataForPetalColor(self->_petalColor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = (MTLTexture *)objc_msgSend(v3, "newTextureWithData:options:error:", v7, v6, &v11);
  v9 = v11;
  circleGradient = self->_circleGradient;
  self->_circleGradient = v8;

}

- (void)_createBuffers
{
  MTLBuffer *v3;
  MTLBuffer *indexBuffer;

  v3 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 144, 0);
  indexBuffer = self->_indexBuffer;
  self->_indexBuffer = v3;

}

- (void)_setupIndexes
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  _WORD *v5;

  v2 = -[MTLBuffer contents](self->_indexBuffer, "contents");
  v3 = 0;
  v4 = 1;
  do
  {
    v5 = (_WORD *)(v2 + v3);
    *v5 = 0;
    v5[1] = v4;
    if (v4 == 24)
      v4 = 1;
    else
      ++v4;
    v5[2] = v4;
    v3 += 6;
  }
  while ((_DWORD)v3 != 144);
}

- (void)_setupProjectionMatrixForSize:(CGSize)a3
{
  float v3;
  unint64_t v4;
  __int128 v5;

  v3 = a3.height / a3.width;
  LODWORD(v4) = 0;
  *((float *)&v4 + 1) = 2.0 / (float)((float)-v3 - v3);
  LODWORD(v5) = 0x80000000;
  *((float *)&v5 + 1) = (float)(v3 - v3) / (float)(v3 + v3);
  *((_QWORD *)&v5 + 1) = __PAIR64__(1.0, 0.5);
  *(_OWORD *)self->_anon_3b0 = xmmword_21310E100;
  *(_OWORD *)&self->_anon_3b0[16] = v4;
  *(_OWORD *)&self->_anon_3b0[32] = xmmword_21310E110;
  *(_OWORD *)&self->_anon_3b0[48] = v5;
}

- (void)_setupVertices
{
  double v3;
  uint64_t v4;
  float32x2_t *v5;
  __float2 v6;

  -[FIUIBreathingPetalRingMetalRenderer _maxPetalRingRadius](self, "_maxPetalRingRadius");
  *(float *)&v3 = v3;
  -[FIUIBreathingPetalRingMetalRenderer setRingRadius:](self, "setRingRadius:", v3);
  v4 = 0;
  *(_QWORD *)&self->_anon_220[8] = 0;
  v5 = (float32x2_t *)&self->_anon_220[24];
  do
  {
    v6 = __sincosf_stret((float)(int)v4 * 0.2618);
    *v5 = vmul_f32((float32x2_t)__PAIR64__(LODWORD(v6.__sinval), LODWORD(v6.__cosval)), (float32x2_t)0x3F0000003F000000);
    v5 += 2;
    ++v4;
  }
  while (v4 != 24);
}

- (void)_setupRenderPipeline
{
  id v3;
  MTLDevice *device;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  MTLPixelFormat v28;
  void *v29;
  void *v30;
  MTLDevice *v31;
  MTLRenderPipelineState *v32;
  id v33;
  MTLRenderPipelineState *renderPipeline;
  void *v35;
  id v36;
  id v37;

  v3 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v3, "setLabel:", CFSTR("Petal Ring Pipeline"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.FitnessUI"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  v37 = 0;
  v5 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:", v35, &v37);
  v6 = v37;
  v7 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("petalRingVertexShader"));
  v8 = (void *)objc_msgSend(v5, "newFunctionWithName:", CFSTR("petalRingFragmentShader"));
  v9 = objc_alloc_init(MEMORY[0x24BDDD770]);
  objc_msgSend(v9, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFormat:", 29);

  objc_msgSend(v9, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOffset:", 0);

  objc_msgSend(v9, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBufferIndex:", 2);

  objc_msgSend(v9, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFormat:", 29);

  objc_msgSend(v9, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOffset:", 8);

  objc_msgSend(v9, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBufferIndex:", 2);

  objc_msgSend(v9, "layouts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setStride:", 16);

  objc_msgSend(v9, "layouts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setStepRate:", 1);

  objc_msgSend(v9, "layouts");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setStepFunction:", 1);

  objc_msgSend(v3, "setVertexDescriptor:", v9);
  objc_msgSend(v3, "setVertexFunction:", v7);
  objc_msgSend(v3, "setFragmentFunction:", v8);
  v28 = -[MTKView colorPixelFormat](self->_mtkView, "colorPixelFormat");
  objc_msgSend(v3, "colorAttachments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPixelFormat:", v28);

  v31 = self->_device;
  v36 = v6;
  v32 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v31, "newRenderPipelineStateWithDescriptor:error:", v3, &v36);
  v33 = v36;

  renderPipeline = self->_renderPipeline;
  self->_renderPipeline = v32;

}

- (void)importDataFromPetalRingMetalRenderer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[21];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    self->_numberOfVisiblePetals = objc_msgSend(v4, "numberOfVisiblePetals");
    v21 = 0u;
    memset(v22, 0, sizeof(v22));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    objc_msgSend(v5, "circleProperties");
    *(_QWORD *)&self[1]._anon_28[440] = 0;
    objc_msgSend(v5, "ringCenter");
    -[FIUIBreathingPetalRingMetalRenderer setRingCenter:](self, "setRingCenter:");
    objc_msgSend(v5, "ringRadius");
    -[FIUIBreathingPetalRingMetalRenderer setRingRadius:](self, "setRingRadius:");
    v6 = 0;
    v7 = v19;
    *(_OWORD *)&self[1]._anon_28[56] = v18;
    *(_OWORD *)&self[1]._anon_28[72] = v7;
    v8 = v21;
    *(_OWORD *)&self[1]._anon_28[88] = v20;
    *(_OWORD *)&self[1]._anon_28[104] = v8;
    v9 = v15;
    *(_OWORD *)&self[1]._uniforms.numberOfPetals = v14;
    *(_OWORD *)&self[1]._anon_28[8] = v9;
    v10 = v17;
    *(_OWORD *)&self[1]._anon_28[24] = v16;
    *(_OWORD *)&self[1]._anon_28[40] = v10;
    v11 = v13;
    *(_OWORD *)&self[1].super.isa = v12;
    *(_OWORD *)&self[1]._device = v11;
    do
    {
      *(_OWORD *)&self[1]._anon_28[v6 * 16 + 120] = v22[v6];
      ++v6;
    }
    while (v6 != 20);
  }

}

- (void)setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  int64_t v4;
  int64_t v6;

  v4 = a3;
  self->_numberOfVisiblePetals = a3;
  if (a4)
  {
    v6 = 10 - a3;
    -[FIUIBreathingPetalRingMetalRenderer _clearCirclesInRange:](self, "_clearCirclesInRange:", a3, 10 - a3);
    v4 += 10;
  }
  else
  {
    v6 = 20 - a3;
  }
  -[FIUIBreathingPetalRingMetalRenderer _clearCirclesInRange:](self, "_clearCirclesInRange:", v4, v6);
}

- (void)_clearCirclesInRange:(_NSRange)a3
{
  unsigned __int8 *v3;

  if (a3.location < a3.location + a3.length)
  {
    v3 = &self[1]._anon_28[16 * a3.location + 128];
    do
    {
      *(_DWORD *)v3 = 0;
      v3 += 16;
      --a3.length;
    }
    while (a3.length);
  }
}

- (void)setGradientRotationAngle:(float)a3
{
  __float2 v4;

  v4 = __sincosf_stret(a3);
  *(_QWORD *)&self[1]._anon_28[440] = __PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval));
}

- (void)setRingRadius:(float)a3
{
  if (!FIUIIsEqual(self->_ringRadius, a3))
  {
    self->_ringRadius = a3;
    -[FIUIBreathingPetalRingMetalRenderer _updateVertices](self, "_updateVertices");
  }
}

- (void)setRingCenter:(CGPoint)a3
{
  double y;
  double v6;
  float64x2_t v7;
  float64_t x;

  y = a3.y;
  if (self->_ringCenter.x != a3.x || self->_ringCenter.y != a3.y)
  {
    x = a3.x;
    -[MTKView bounds](self->_mtkView, "bounds");
    v7.f64[0] = x;
    self->_ringCenter.x = x;
    self->_ringCenter.y = v6 - y;
    v7.f64[1] = v6 - y;
    *(float32x2_t *)self->_ringCenterVector = vcvt_f32_f64(vaddq_f64(v7, v7));
    -[FIUIBreathingPetalRingMetalRenderer _updateVertices](self, "_updateVertices");
  }
}

- (void)setBlurTrailAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7
{
  -[FIUIBreathingPetalRingMetalRenderer _setCircleAtIndex:center:radius:blurriness:alpha:](self, "_setCircleAtIndex:center:radius:blurriness:alpha:", a3 + 10, a4.x, a4.y);
}

- (void)setPetalAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 alpha:(float)a6
{
  -[FIUIBreathingPetalRingMetalRenderer _setCircleAtIndex:center:radius:blurriness:alpha:](self, "_setCircleAtIndex:center:radius:blurriness:alpha:", a3, a4.x, a4.y);
}

- (void)_setCircleAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7
{
  CGFloat y;
  float64x2_t v8;

  y = a4.y;
  v8 = vmulq_f64((float64x2_t)a4, (float64x2_t)xmmword_21310E120);
  *((float32x2_t *)&self[1].super.isa + a3) = vadd_f32(*(float32x2_t *)self->_ringCenterVector, vcvt_f32_f64(v8));
  *(float *)v8.f64 = (float)(a5 + a5) * (float)(a5 + a5);
  *((float *)v8.f64 + 1) = 1.0 / (float)(a5 * a6);
  *(float *)&v8.f64[1] = a7;
  *(float64x2_t *)&self[1]._anon_28[16 * a3 + 120] = v8;
}

- (double)_maxPetalRingRadius
{
  return 78.0;
}

- (void)_updateVertices
{
  double ringRadius;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  float64_t v8;
  float64x2_t v9;
  float32x2_t v10;
  float32x2_t *v11;
  __float2 v12;
  float v13;

  if (_updateVertices_onceToken != -1)
    dispatch_once(&_updateVertices_onceToken, &__block_literal_global_17);
  ringRadius = self->_ringRadius;
  -[FIUIBreathingPetalRingMetalRenderer _maxPetalRingRadius](self, "_maxPetalRingRadius");
  v5 = ringRadius / v4 * 1.05;
  if (v5 <= 1.0)
    v6 = v5 * 0.8;
  else
    v6 = 0.8;
  *(float *)&v6 = v6;
  -[MTKView center](self->_mtkView, "center", *(_QWORD *)&v6);
  v7 = 0;
  v9.f64[1] = v8;
  v10 = vcvt_f32_f64(vdivq_f64(vsubq_f64((float64x2_t)self->_ringCenter, v9), v9));
  *(float32x2_t *)self->_anon_220 = v10;
  v11 = (float32x2_t *)&self->_anon_220[16];
  do
  {
    v12 = __sincosf_stret((float)(int)v7 * 0.2618);
    *v11 = vadd_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval)), v13), v10);
    v11 += 2;
    ++v7;
  }
  while (v7 != 24);
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  CGSize v16;

  height = a4.height;
  width = a4.width;
  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD2FE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v16.width = width;
    v16.height = height;
    NSStringFromCGSize(v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_21307C000, v9, OS_LOG_TYPE_DEFAULT, "mktView:%@ drawableSizeWillChange: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[FIUIBreathingPetalRingMetalRenderer _setupProjectionMatrixForSize:](self, "_setupProjectionMatrixForSize:", width, height);

}

- (void)drawInMTKView:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 showBlurTrails;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[FIUIBreathingPetalRingMetalRenderer stateUpdateBlock](self, "stateUpdateBlock");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    showBlurTrails = self->_showBlurTrails;
    self->_uniforms.numberOfPetals = self->_numberOfPetals;
    self->_uniforms.showBlurTrails = showBlurTrails;
    *(_OWORD *)&self->_anon_28[96] = *(_OWORD *)&self[1]._anon_28[56];
    *(_OWORD *)&self->_anon_28[112] = *(_OWORD *)&self[1]._anon_28[72];
    *(_OWORD *)&self->_anon_28[128] = *(_OWORD *)&self[1]._anon_28[88];
    *(_OWORD *)&self->_anon_28[144] = *(_OWORD *)&self[1]._anon_28[104];
    *(_OWORD *)&self->_anon_28[32] = *(_OWORD *)&self[1]._uniforms.numberOfPetals;
    *(_OWORD *)&self->_anon_28[48] = *(_OWORD *)&self[1]._anon_28[8];
    *(_OWORD *)&self->_anon_28[64] = *(_OWORD *)&self[1]._anon_28[24];
    *(_OWORD *)&self->_anon_28[80] = *(_OWORD *)&self[1]._anon_28[40];
    *(_OWORD *)self->_anon_28 = *(_OWORD *)&self[1].super.isa;
    *(_OWORD *)&self->_anon_28[16] = *(_OWORD *)&self[1]._device;
    memcpy(&self->_anon_28[168], &self[1]._anon_28[120], 0x148uLL);
  }
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabel:", CFSTR("Drawable Command Buffer"));
  objc_msgSend(v11, "currentRenderPassDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "renderCommandEncoderWithDescriptor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLabel:", CFSTR("Drawable Render Encoder"));
    objc_msgSend(v9, "setRenderPipelineState:", self->_renderPipeline);
    objc_msgSend(v9, "setVertexBytes:length:atIndex:", self->_anon_220, 400, 2);
    objc_msgSend(v9, "setVertexBytes:length:atIndex:", self->_anon_3b0, 64, 0);
    objc_msgSend(v9, "setFragmentBytes:length:atIndex:", &self->_uniforms, 512, 1);
    objc_msgSend(v9, "setFragmentTexture:atIndex:", self->_circleGradient, 0);
    objc_msgSend(v9, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 72, 0, self->_indexBuffer, 0);
    objc_msgSend(v9, "endEncoding");
    objc_msgSend(v11, "currentDrawable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentDrawable:", v10);

  }
  objc_msgSend(v7, "commit");
  objc_msgSend(v7, "waitUntilCompleted");

}

- (float)ringRadius
{
  return self->_ringRadius;
}

- (CGPoint)ringCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_ringCenter.x;
  y = self->_ringCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)numberOfVisiblePetals
{
  return self->_numberOfVisiblePetals;
}

- (void)circleProperties
{
  return memcpy(a2, (const void *)(a1 + 1104), 0x1F0uLL);
}

- (void)setCircleProperties:(const void *)a3
{
  return memcpy((void *)(a1 + 1104), a3, 0x1F0uLL);
}

- (id)stateUpdateBlock
{
  return self->_stateUpdateBlock;
}

- (void)setStateUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateUpdateBlock, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_circleGradient, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_mtkView, 0);
}

@end
