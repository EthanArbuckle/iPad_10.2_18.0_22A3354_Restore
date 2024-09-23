@implementation CARenderer

- (id)_initWithOptions:(id)a3
{
  CARenderer *v4;
  _OWORD *v5;
  CFTypeRef v6;
  char *priv;
  __int128 v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  __int16 v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CARenderer;
  v4 = -[CARenderer init](&v14, sel_init);
  if (v4)
  {
    v5 = malloc_type_malloc(0x1000uLL, 0xF7042BBEuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5[6] = 0u;
      v5[7] = 0u;
      v5[4] = 0u;
      v5[5] = 0u;
      v5[2] = 0u;
      v5[3] = 0u;
      *v5 = 0u;
      v5[1] = 0u;
      *((_QWORD *)v4->_priv + 1) = 0;
      v6 = CFRetain(+[CAContext localContext](CAContext, "localContext"));
      priv = (char *)v4->_priv;
      *(_QWORD *)priv = v6;
      v8 = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(priv + 56) = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(priv + 40) = v8;
      v9 = v4->_priv;
      v9[15] = 3968;
      *((_DWORD *)v9 + 27) = 1;
      if (a3)
      {
        *((_QWORD *)v4->_priv + 9) = objc_msgSend(a3, "objectForKey:", CFSTR("kCARendererColorSpace"));
        v9 = v4->_priv;
      }
      v10 = (void *)*v9;
      if (v9[9])
        objc_msgSend(v10, "setColorSpace:");
      else
        *((_QWORD *)v4->_priv + 9) = objc_msgSend(v10, "colorSpace");
      CGColorSpaceRetain(*((CGColorSpaceRef *)v4->_priv + 9));
      v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("kCARendererFlags"));
      if (v11)
        *((_DWORD *)v4->_priv + 22) = objc_msgSend(v11, "unsignedIntValue");
      if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCARendererClearsDestination")), "BOOLValue"))v12 = 256;
      else
        v12 = 0;
      *((_WORD *)v4->_priv + 56) = *((_WORD *)v4->_priv + 56) & 0xFEFF | v12;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)_initWithMTLTexture:(id)a3 options:(id)a4
{
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  malloc_zone_t *malloc_zone;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  if (!a3)
  {

    return 0;
  }
  v6 = -[CARenderer _initWithOptions:](self, "_initWithOptions:", a4);
  if (!v6)
    return v6;
  v7 = (void *)objc_msgSend(a3, "device");
  v8 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCARendererMetalCommandQueue"));
  v9 = v6[1];
  if (v8)
  {
    *(_WORD *)(v9 + 112) |= 0x200u;
    v9 = v6[1];
  }
  *(_QWORD *)(v6[1] + 24) = CA::OGL::new_metal_context(v7, v8, 0, *(_DWORD *)(v9 + 88), 0, CFSTR("com.apple.coreanimation.CARenderer"));
  v10 = *(_QWORD *)(v6[1] + 24);
  if (!v10)
  {

    return 0;
  }
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(*(_QWORD *)v10 + 16))(v10, 0, a3, 0);
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v12 = malloc_type_zone_malloc(malloc_zone, 0x68uLL, 0x8BB15036uLL);
  v13 = v12;
  if (v12)
  {
    v14 = *(_QWORD *)(v6[1] + 24);
    v12[1] = 0;
    v12[2] = 0;
    *v12 = v14;
    v12[6] = malloc_type_malloc(0x40000uLL, 0xA44586FDuLL);
    v13[7] = 0;
    *((_DWORD *)v13 + 24) = 1;
    *((_WORD *)v13 + 50) = 0;
  }
  *(_QWORD *)(v6[1] + 32) = v13;
  CA::OGL::Context::set_colorspace(*(CA::OGL::Context **)(v6[1] + 24), *(CGColorSpace **)(v6[1] + 72));
  *(_WORD *)(*(_QWORD *)(v6[1] + 24) + 816) |= 2u;
  *(_WORD *)(*(_QWORD *)(v6[1] + 24) + 816) |= 4u;
  return v6;
}

- (void)setDestination:(id)tex
{
  (*(void (**)(_QWORD, _QWORD, id, _QWORD))(**((_QWORD **)self->_priv + 3) + 16))(*((_QWORD *)self->_priv + 3), 0, tex, 0);
}

- (id)_initWithEAGLContext:(id)a3 options:(id)a4
{
  _QWORD *v5;
  int v6;
  malloc_zone_t *malloc_zone;
  CA::OGL::GLESContext *v8;
  malloc_zone_t *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  CA::OGL::Context *v14;
  int v15;
  int v16;
  NSObject *v17;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    return 0;
  }
  v5 = -[CARenderer _initWithOptions:](self, "_initWithOptions:", a4);
  if (!v5)
    return v5;
  v6 = objc_msgSend(a3, "API");
  if (v6 != 3)
  {
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v17 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v20 = v6;
        _os_log_impl(&dword_184457000, v17, OS_LOG_TYPE_FAULT, "CoreAnimation: GLES%d not supported by CARenderer on this device", buf, 8u);
      }
    }

    return 0;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v8 = (CA::OGL::GLESContext *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x898uLL, 0x743898A5uLL);
  if (v8)
    v8 = CA::OGL::GLESContext::GLESContext(v8, a3);
  *(_QWORD *)(v5[1] + 24) = v8;
  v9 = (malloc_zone_t *)get_malloc_zone();
  v10 = malloc_type_zone_malloc(v9, 0x68uLL, 0x8BB15036uLL);
  v11 = v10;
  if (v10)
  {
    v12 = *(_QWORD *)(v5[1] + 24);
    v10[1] = 0;
    v10[2] = 0;
    *v10 = v12;
    v10[6] = malloc_type_malloc(0x40000uLL, 0xA44586FDuLL);
    v11[7] = 0;
    *((_DWORD *)v11 + 24) = 1;
    *((_WORD *)v11 + 50) = 0;
  }
  *(_QWORD *)(v5[1] + 32) = v11;
  v13 = v5[1];
  v14 = *(CA::OGL::Context **)(v13 + 24);
  v15 = *(_DWORD *)(v13 + 88);
  v16 = *((_DWORD *)v14 + 52);
  *((_DWORD *)v14 + 52) = v15;
  *((_DWORD *)v14 + 104) = global_feature_flags | v15;
  if (((v16 ^ v15) & 0x2000200) != 0)
  {
    CA::OGL::Context::update_color_program_cache((uint64_t)v14);
    v13 = v5[1];
    v14 = *(CA::OGL::Context **)(v13 + 24);
  }
  CA::OGL::Context::set_colorspace(v14, *(CGColorSpace **)(v13 + 72));
  *(_WORD *)(*(_QWORD *)(v5[1] + 24) + 816) |= 2u;
  *(_WORD *)(*(_QWORD *)(v5[1] + 24) + 816) |= 4u;
  *(_QWORD *)(v5[1] + 16) = a3;
  CFRetain(a3);
  return v5;
}

- (void)dealloc
{
  CGColorSpaceRef *priv;
  CGColorSpaceRef v4;
  malloc_zone_t *malloc_zone;
  CGColorSpaceRef v6;
  CGColorSpaceRef v7;
  CGColorSpaceRef v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  priv = (CGColorSpaceRef *)self->_priv;
  if (priv)
  {
    remove_observer(self);
    CGColorSpaceRelease(priv[9]);
    if (priv[10])
      -[CARenderer endFrame](self, "endFrame");
    v4 = priv[4];
    if (v4)
    {
      CA::OGL::Renderer::~Renderer(priv[4]);
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      malloc_zone_free(malloc_zone, v4);
    }
    v6 = priv[3];
    if (v6)
    {
      (*(void (**)(CGColorSpaceRef, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v6 + 16))(v6, 0, 0, 0);
      v7 = priv[3];
      (*(void (**)(CGColorSpaceRef, uint64_t))(*(_QWORD *)v7 + 224))(v7, 1);
      (*(void (**)(CGColorSpaceRef))(*(_QWORD *)v7 + 8))(v7);
    }
    if (*priv)
      CFRelease(*priv);
    v8 = priv[2];
    if (v8)
      CFRelease(v8);
    free(priv);
    self->_priv = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CARenderer;
  -[CARenderer dealloc](&v9, sel_dealloc);
}

- (void)setLayer:(CALayer *)layer
{
  objc_msgSend(*(id *)self->_priv, "setLayer:", layer);
}

- (CALayer)layer
{
  return (CALayer *)objc_msgSend(*(id *)self->_priv, "layer");
}

- (void)setBounds:(CGRect)bounds
{
  *(CGRect *)((char *)self->_priv + 40) = bounds;
}

- (CGRect)bounds
{
  double *priv;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  priv = (double *)self->_priv;
  v3 = priv[5];
  v4 = priv[6];
  v5 = priv[7];
  v6 = priv[8];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)beginFrameAtTime:(CFTimeInterval)t timeStamp:(CVTimeStamp *)ts
{
  float64x2_t v4;
  char *priv;
  char *v9;
  _DWORD *v10;
  int v11;
  int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  float64x2_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  float64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  float64x2_t v26;
  int32x4_t v27;
  CA::Render::Update *v28;
  id *v29;
  uint64_t v30;
  CA::Render::LayerNode *v31;
  CA::Render::Context *v32;
  pthread_mutex_t *v33;
  CA::Render::LayerNode *v34;
  const CA::Shape *v35;
  int64x2_t v36;
  void *v37;
  CA::Render::Update *v38;
  int32x4_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  priv = (char *)self->_priv;
  if (*((_QWORD *)priv + 10))
  {
    -[CARenderer endFrame](self, "endFrame");
    priv = (char *)self->_priv;
  }
  v9 = &priv[4 * priv[112]];
  v12 = *((_DWORD *)v9 + 25);
  v10 = v9 + 100;
  v11 = v12;
  if (v12)
  {
    *((_DWORD *)priv + 27) = v11;
    *v10 = 0;
  }
  v13 = *(int8x16_t *)(priv + 56);
  v4.f64[0] = 0.0;
  v14 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v4, (float64x2_t)v13).i64[0], 0);
  v15.i64[1] = *((_QWORD *)priv + 8);
  *(double *)v15.i64 = -*(double *)v13.i64;
  v16 = vbslq_s8(v14, v15, v13);
  v17 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v4, (float64x2_t)vdupq_laneq_s64((int64x2_t)v13, 1)).i64[0], 0);
  v18.i64[0] = v16.i64[0];
  v18.i64[1] = *(_QWORD *)&vnegq_f64(*(float64x2_t *)&v13).f64[1];
  v19 = (float64x2_t)vbslq_s8(v17, v18, v16);
  v20 = (int8x16_t)vceqzq_f64(v19);
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)v20, 1), v20).u64[0] & 0x8000000000000000) != 0
    || (v21 = vorrq_s8((int8x16_t)vcltzq_f64(v19), (int8x16_t)vcgezq_f64(v19)),
        v22 = (int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v21), 1),
        (vornq_s8(v22, v21).u64[0] & 0x8000000000000000) != 0))
  {
    v39 = 0uLL;
  }
  else
  {
    v23 = *(float64x2_t *)(priv + 40);
    v22.i64[0] = 0x8000000000000000;
    v24.i64[0] = *(_OWORD *)&vaddq_f64(v23, (float64x2_t)vbslq_s8(v14, v13, v22));
    v25.i64[0] = v24.i64[0];
    v25.i64[1] = *((_QWORD *)priv + 6);
    v24.i64[1] = *(_QWORD *)&vaddq_f64(*(float64x2_t *)&v13, v23).f64[1];
    v26 = (float64x2_t)vbslq_s8(v17, v24, v25);
    v27 = (int32x4_t)vcvtmq_s64_f64(vmaxnmq_f64(v26, (float64x2_t)vdupq_n_s64(0xC1BFFFFFFF000000)));
    v39 = vuzp1q_s32(v27, (int32x4_t)vsubq_s64(vcvtpq_s64_f64(vminnmq_f64(vaddq_f64(v26, v19), (float64x2_t)vdupq_n_s64(0x41C0000000000000uLL))), (int64x2_t)v27));
  }
  v28 = (CA::Render::Update *)operator new();
  *((_QWORD *)self->_priv + 10) = CA::Render::Update::Update(v28, (const CA::Bounds *)((char *)self->_priv + 128), *((_QWORD *)self->_priv + 15), t, ts, 0, *((_DWORD *)self->_priv + 27), *((_DWORD *)self->_priv + 27), (const CA::Bounds *)&v39, *((_DWORD *)self->_priv + 22));
  v29 = (id *)self->_priv;
  if (v29[10])
  {
    v30 = objc_msgSend(*v29, "renderContext");
    if (v30)
    {
      v32 = (CA::Render::Context *)v30;
      v33 = (pthread_mutex_t *)(v30 + 72);
      pthread_mutex_lock((pthread_mutex_t *)(v30 + 72));
      CA::Render::Update::add_context(*((CA::Render::Update **)self->_priv + 10), v32);
      pthread_mutex_unlock(v33);
      CA::Render::Update::added_all_contexts(*((CA::Render::Update **)self->_priv + 10), v34, v35, v36);
    }
    else
    {
      v37 = self->_priv;
      v38 = (CA::Render::Update *)*((_QWORD *)v37 + 10);
      if (v38)
      {
        CA::Render::Update::~Update(v38, v31);
        MEMORY[0x186DBD990]();
        v37 = self->_priv;
      }
      *((_QWORD *)v37 + 10) = 0;
    }
  }
}

- (CGRect)updateBounds
{
  uint64_t v2;
  uint64_t v3;
  int8x16_t v4;
  double v5;
  double v6;
  int32x4_t v7;
  int32x4_t v8;
  int v9;
  int64x2_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGRect result;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)self->_priv + 10);
  if (!v2)
    goto LABEL_4;
  v3 = *(_QWORD *)(v2 + 16);
  if ((v3 & 1) != 0)
  {
    if (v3 == 1)
      goto LABEL_4;
  }
  else if (*(_DWORD *)(v3 + 4) == 6)
  {
LABEL_4:
    v4 = *(int8x16_t *)MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_14;
  }
  v12 = 0;
  v13 = 0;
  CA::Shape::get_bounds(v3, (int *)&v12);
  if ((int)v13 <= SHIDWORD(v13))
    v9 = HIDWORD(v13);
  else
    v9 = v13;
  v7.i32[0] = 1073741822;
  v8.i32[0] = v9;
  v10.i64[0] = (int)v12;
  v10.i64[1] = SHIDWORD(v12);
  v4 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v8, v7), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v10));
  v6 = (double)SHIDWORD(v13);
  if (v9 <= 1073741822)
    v5 = (double)(int)v13;
  else
    v5 = 1.79769313e308;
  if (v9 > 1073741822)
    v6 = 1.79769313e308;
LABEL_14:
  v11 = *(double *)&v4.i64[1];
  result.origin.x = *(double *)v4.i64;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v11;
  return result;
}

- (void)addUpdateRect:(CGRect)r
{
  float64x2_t v3;
  uint64_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  float64x2_t v9;
  CGFloat y;
  float64x2_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int32x4_t v14;
  const CA::Shape *v15;
  int32x4_t v16;
  CA::Shape *v17[2];
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = *((_QWORD *)self->_priv + 10);
  if (v4)
  {
    v5.i64[0] = *(_QWORD *)&r.origin.x;
    v5.i64[1] = *(_QWORD *)&r.origin.y;
    v3.f64[0] = 0.0;
    v6.i64[0] = *(_QWORD *)&r.size.width;
    v6.i64[1] = *(_QWORD *)&r.size.height;
    v7 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v3, (float64x2_t)r.size).i64[0], 0);
    v8.i64[1] = *(_QWORD *)&r.size.height;
    *(double *)v8.i64 = -r.size.width;
    v9 = (float64x2_t)vbslq_s8(v7, v8, v6);
    y = r.origin.y;
    r.size.width = r.size.width + r.origin.x;
    v11 = (float64x2_t)vbslq_s8(v7, (int8x16_t)r.size, v5);
    if (r.size.height < 0.0)
    {
      v11.f64[1] = r.size.height + r.origin.y;
      v9.f64[1] = -r.size.height;
    }
    v12 = (int8x16_t)vceqzq_f64(v9);
    if ((vorrq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)v12, 1), v12).u64[0] & 0x8000000000000000) != 0
      || (v13 = vorrq_s8((int8x16_t)vcltzq_f64(v9), (int8x16_t)vcgezq_f64(v9)),
          (vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v13), 1), v13).u64[0] & 0x8000000000000000) != 0))
    {
      v16 = 0uLL;
    }
    else
    {
      v14 = (int32x4_t)vcvtmq_s64_f64(vmaxnmq_f64(v11, (float64x2_t)vdupq_n_s64(0xC1BFFFFFFF000000)));
      v16 = vuzp1q_s32(v14, (int32x4_t)vsubq_s64(vcvtpq_s64_f64(vminnmq_f64(vaddq_f64(v11, v9), (float64x2_t)vdupq_n_s64(0x41C0000000000000uLL))), (int64x2_t)v14));
    }
    v18 = 0u;
    v19 = 0u;
    *(_OWORD *)v17 = 0u;
    CA::Shape::operator=((uint64_t)v17, &v16);
    CA::shape_union((CA::Shape **)(v4 + 16), v17, v15);
  }
}

- (CFTimeInterval)nextFrameTime
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_priv + 10);
  if (v2)
    return *(double *)(v2 + 80);
  else
    return INFINITY;
}

- (void)render
{
  _QWORD *priv;
  CA::Render::Update *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CA::Render::Update *v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  _DWORD *v12;
  int v13;
  uint64_t v14;
  double v15;
  CA::Render *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  v4 = (CA::Render::Update *)priv[10];
  if (v4)
  {
    v5 = *((_QWORD *)v4 + 2);
    if ((v5 & 1) != 0)
    {
      if (v5 == 1)
        return;
    }
    else if (*(_DWORD *)(v5 + 4) == 6)
    {
      return;
    }
    if (BYTE5(ca_debug_options))
    {
      CA::Render::Update::print_trees(v4);
      priv = self->_priv;
    }
    if (priv[4])
    {
      v6 = objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
      v7 = self->_priv;
      v8 = (CA::Render::Update *)*((_QWORD *)v7 + 2);
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:");
        v7 = self->_priv;
      }
      if ((*((_WORD *)v7 + 56) & 0x100) != 0)
      {
        v9 = *((_QWORD *)v7 + 3);
        v17[0] = 0;
        (*(void (**)(uint64_t, void *, _QWORD *))(*(_QWORD *)v9 + 912))(v9, &CA::Shape::_infinite_shape, v17);
        v7 = self->_priv;
      }
      CA::OGL::render(*((CA::OGL **)v7 + 4), *((CA::OGL::Renderer **)v7 + 10), v8);
      v10 = self->_priv;
      v11 = (char *)v10 + 4 * *((unsigned __int8 *)v10 + 112);
      v13 = *((_DWORD *)v11 + 25);
      v12 = v11 + 100;
      if (!v13)
      {
        *v12 = *(_DWORD *)(v10[10] + 248);
        *((_WORD *)v10 + 56) = v10[14] & 0xFF01 ^ 1;
      }
      v14 = mach_absolute_time();
      v15 = CATimeWithHostTime(v14);
      CA::Render::collect(0, v15);
      v16 = (CA::Render *)CA::OGL::Renderer::collect(*((CA::OGL::Renderer **)self->_priv + 4), *((const CA::Render::Update **)self->_priv + 10), v15);
      if (*((_QWORD *)self->_priv + 2))
        v16 = (CA::Render *)objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v6);
      if (BYTE6(ca_debug_options))
        CA::Render::show_statistics(v16);
    }
  }
}

- (void)endFrame
{
  _QWORD **priv;
  CA::Render::LayerNode *v4;
  void *v5;
  CA::Render::Update *v6;

  priv = (_QWORD **)self->_priv;
  if (priv[10])
  {
    (*(void (**)(_QWORD *, BOOL))(*priv[3] + 408))(priv[3], ((_WORD)priv[14] & 0x200) == 0);
    v5 = self->_priv;
    v6 = (CA::Render::Update *)*((_QWORD *)v5 + 10);
    if (v6)
    {
      CA::Render::Update::~Update(v6, v4);
      MEMORY[0x186DBD990]();
      v5 = self->_priv;
    }
    *((_QWORD *)v5 + 10) = 0;
  }
}

+ (CARenderer)rendererWithMTLTexture:(id)tex options:(NSDictionary *)dict
{
  return (CARenderer *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithMTLTexture:options:", tex, dict);
}

- (CAContext)context
{
  return *(CAContext **)self->_priv;
}

- (void)setContext:(id)a3
{
  id *priv;
  id *v6;

  priv = (id *)self->_priv;
  if (*priv != a3)
  {
    if (*priv)
    {
      remove_observer(self);
      CFRelease(*(CFTypeRef *)self->_priv);
      priv = (id *)self->_priv;
    }
    *priv = a3;
    if (a3)
    {
      CFRetain(a3);
      add_observer(self);
      v6 = (id *)self->_priv;
      if (v6[9])
        objc_msgSend(*v6, "setColorSpace:");
    }
  }
}

- (CARendererDelegate)delegate
{
  return (CARendererDelegate *)*((_QWORD *)self->_priv + 1);
}

- (void)setDelegate:(id)a3
{
  if (*((id *)self->_priv + 1) != a3)
  {
    remove_observer(self);
    *((_QWORD *)self->_priv + 1) = a3;
    add_observer(self);
  }
}

+ (CARenderer)rendererWithEAGLContext:(id)a3 options:(id)a4
{
  return (CARenderer *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithEAGLContext:options:", a3, a4);
}

@end
