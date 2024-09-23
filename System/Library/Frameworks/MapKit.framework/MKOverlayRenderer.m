@implementation MKOverlayRenderer

- (void)dealloc
{
  objc_super v3;

  -[VKOverlay setDelegate:](self->_renderer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MKOverlayRenderer;
  -[MKOverlayRenderer dealloc](&v3, sel_dealloc);
}

- (MKOverlayRenderer)init
{
  return -[MKOverlayRenderer initWithOverlay:](self, "initWithOverlay:", 0);
}

- (MKOverlayRenderer)initWithOverlay:(id)overlay
{
  id v5;
  MKOverlayRenderer *v6;
  MKOverlayRenderer *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *isolationQueue;
  objc_super v16;

  v5 = overlay;
  v16.receiver = self;
  v16.super_class = (Class)MKOverlayRenderer;
  v6 = -[MKOverlayRenderer init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_alpha = 1.0;
    v6->_contentScaleFactor = 1.0;
    objc_storeStrong((id *)&v6->_overlay, overlay);
    objc_msgSend(v5, "boundingMapRect");
    v7->_boundingMapRect.origin.x = v8;
    v7->_boundingMapRect.origin.y = v9;
    v7->_boundingMapRect.size.width = v10;
    v7->_boundingMapRect.size.height = v11;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.MapKit.MKOverlayRenderer.isolation", v12);
    isolationQueue = v7->_isolationQueue;
    v7->_isolationQueue = (OS_dispatch_queue *)v13;

    v7->_runningAnimationsLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)setAlpha:(CGFloat)alpha
{
  if (vabdd_f64(alpha, self->_alpha) >= 0.00000011920929)
  {
    -[MKOverlayRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("alpha"));
    self->_alpha = alpha;
    -[VKOverlay setNeedsDisplayForReason:](self->_renderer, "setNeedsDisplayForReason:", 2);
    -[MKOverlayRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("alpha"));
  }
}

- (CGFloat)alpha
{
  return self->_alpha;
}

- (void)setBlendMode:(CGBlendMode)blendMode
{
  uint64_t v5;

  if (self->_blendMode != blendMode)
  {
    -[MKOverlayRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("blendMode"));
    self->_blendMode = blendMode;
    if ((blendMode - 1) > 0x1A)
      v5 = 0;
    else
      v5 = qword_18B2AF718[blendMode - 1];
    -[VKOverlay setBlendMode:](self->_renderer, "setBlendMode:", v5);
    -[MKOverlayRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("blendMode"));
  }
}

- (void)_setExtendedBlendMode:(int64_t)a3
{
  int v3;

  if (a3 == 1000)
    v3 = 26;
  else
    v3 = 0;
  self->_blendMode = v3;
  -[VKOverlay setBlendMode:](self->_renderer, "setBlendMode:", 16 * (a3 == 1000));
}

- (int64_t)_extendedBlendMode
{
  if (self->_blendMode == 26)
    return 1000;
  else
    return 0;
}

- (void)set_renderer:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_renderer, a3);
  v5 = self->_blendMode - 1;
  if (v5 > 0x1A)
    v6 = 0;
  else
    v6 = qword_18B2AF718[v5];
  -[VKOverlay setBlendMode:](self->_renderer, "setBlendMode:", v6);

}

- (void)setContentScaleFactor:(double)a3
{
  self->_contentScaleFactor = a3;
}

- (CGFloat)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_originMapPoint
{
  double x;
  double y;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  x = self->_boundingMapRect.origin.x;
  y = self->_boundingMapRect.origin.y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (id)_mk_overlayView
{
  return 0;
}

- (id)_mk_overlayLayer
{
  return 0;
}

- (void)_animateIfNecessaryForKey:(id)a3 withStepHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD, float);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *runningAnimations;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  MKOverlayRenderer *v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD, float))a4;
  -[MKOverlayRenderer _mapView](self, "_mapView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_unfair_lock_lock(&self->_runningAnimationsLock);
    -[NSMutableDictionary objectForKey:](self->_runningAnimations, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_runningAnimations, "removeObjectForKey:", v6);
    objc_msgSend(MEMORY[0x1E0DC6570], "animationMatchingCurrentAnimationParametersWithName:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      runningAnimations = self->_runningAnimations;
      if (!runningAnimations)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v14 = self->_runningAnimations;
        self->_runningAnimations = v13;

        runningAnimations = self->_runningAnimations;
      }
      -[NSMutableDictionary setObject:forKey:](runningAnimations, "setObject:forKey:", v11, v6);
      objc_msgSend(v11, "setStepHandler:", v7);
      objc_initWeak(&location, v11);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __63__MKOverlayRenderer__animateIfNecessaryForKey_withStepHandler___block_invoke;
      v18 = &unk_1E20DF280;
      v19 = self;
      v20 = v6;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v11, "setCompletionHandler:", &v15);
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
      os_unfair_lock_unlock(&self->_runningAnimationsLock);
      objc_msgSend(v10, "stop", v15, v16, v17, v18, v19);
      objc_msgSend(v9, "runAnimation:", v11);
    }
    else
    {
      os_unfair_lock_unlock(&self->_runningAnimationsLock);
      objc_msgSend(v10, "stop");
      v7[2](v7, 1.0);
    }

  }
  else
  {
    v7[2](v7, 1.0);
  }

}

void __63__MKOverlayRenderer__animateIfNecessaryForKey_withStepHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (v3 == WeakRetained)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));

}

- (void)_decodePropertiesWithCoder:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayRendererAlpha"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    self->_alpha = v6;
  }
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MKOverlayRendererBlendMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    self->_blendMode = objc_msgSend(v7, "integerValue");

}

- (void)_encodePropertiesWithCoder:(id)a3
{
  void *v4;
  double alpha;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  alpha = self->_alpha;
  v6 = a3;
  objc_msgSend(v4, "numberWithDouble:", alpha);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("MKOverlayRendererAlpha"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_blendMode);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("MKOverlayRendererBlendMode"));

}

- (id)_mapView
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__MKOverlayRenderer__mapView__block_invoke;
  v5[3] = &unk_1E20D7E10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__MKOverlayRenderer__mapView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_setMapView:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MKOverlayRenderer__setMapView___block_invoke;
  block[3] = &unk_1E20D7E58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

id __33__MKOverlayRenderer__setMapView___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (CGPoint)pointForMapPoint:(MKMapPoint)mapPoint
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = mapPoint.y;
  x = mapPoint.x;
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v6 = x - v5;
  v8 = y - v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (MKMapPoint)mapPointForPoint:(CGPoint)point
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  MKMapPoint result;

  y = point.y;
  x = point.x;
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v6 = x + v5;
  v8 = y + v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGRect)rectForMapRect:(MKMapRect)mapRect
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = mapRect.size.height;
  width = mapRect.size.width;
  y = mapRect.origin.y;
  x = mapRect.origin.x;
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v8 = -v7;
  v10 = -v9;
  v11 = x == INFINITY;
  v12 = y == INFINITY;
  if (v11 && v12)
    v8 = -0.0;
  v13 = x + v8;
  if (v11 && v12)
    v10 = -0.0;
  v14 = y + v10;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (MKMapRect)mapRectForRect:(CGRect)rect
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MKMapRect result;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  -[MKOverlayRenderer _originMapPoint](self, "_originMapPoint");
  v9 = x == INFINITY;
  v10 = y == INFINITY;
  if (v9 && v10)
    v7 = -0.0;
  v11 = x + v7;
  if (v9 && v10)
    v8 = -0.0;
  v12 = y + v8;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setNeedsDisplay
{
  -[VKOverlay setNeedsDisplayForReason:](self->_renderer, "setNeedsDisplayForReason:", 1);
}

- (void)setNeedsDisplayInMapRect:(MKMapRect)mapRect
{
  MKMapRect v3;

  v3 = mapRect;
  -[VKOverlay setNeedsDisplayInRect:level:reason:](self->_renderer, "setNeedsDisplayInRect:level:reason:", &v3, -1, 1);
}

- (void)setNeedsDisplayInMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale
{
  VKOverlay *renderer;
  uint64_t v5;
  uint64_t v6;
  MKMapRect v7;

  v7 = mapRect;
  renderer = self->_renderer;
  v5 = vcvtmd_s64_f64(log2(zoomScale) + 0.5);
  if (v5 >= -21)
    v6 = v5 + 19;
  else
    v6 = -2;
  -[VKOverlay setNeedsDisplayInRect:level:reason:](renderer, "setNeedsDisplayInRect:level:reason:", &v7, v6, 1);
}

- (void)set_boundingMapRect:(id)a3
{
  self->_boundingMapRect = ($8D326A409DE759287A73E3EC6ECA4C4F)a3;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_boundingMapRect
{
  double x;
  double y;
  double width;
  double height;
  $FD2884BA735A6398BD92EEF91FE53E55 result;

  x = self->_boundingMapRect.origin.x;
  y = self->_boundingMapRect.origin.y;
  width = self->_boundingMapRect.size.width;
  height = self->_boundingMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (id)_renderer
{
  return self->_renderer;
}

- (BOOL)_mayExtendOutsideBounds
{
  if (qword_1ECE2DD60 != -1)
    dispatch_once(&qword_1ECE2DD60, &__block_literal_global_92);
  return _MergedGlobals_165;
}

BOOL __44__MKOverlayRenderer__mayExtendOutsideBounds__block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(1540);
  _MergedGlobals_165 = result;
  return result;
}

- (void)_forEachMapRectForKey:(id *)a3 withContext:(CGContext *)a4 performBlock:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  int v14;
  int v15;
  _QWORD v16[2];
  void (*v17)(uint64_t, int);
  void *v18;
  id v19;
  const $5E5F304956FB491AF6F034FDF0808287 *v20;
  CGContext *v21;

  v7 = a5;
  -[MKOverlayRenderer _boundingMapRect](self, "_boundingMapRect");
  v9 = v8;
  v11 = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __68__MKOverlayRenderer__forEachMapRectForKey_withContext_performBlock___block_invoke;
  v18 = &unk_1E20D9940;
  v20 = a3;
  v21 = a4;
  v12 = v7;
  v19 = v12;
  LODWORD(a3) = vcvtmd_s64_f64(v9 * 0.0000000037252903);
  v14 = vcvtpd_s64_f64((v9 + v11) * 0.0000000037252903);
  if ((int)a3 + 1 > v14)
    v15 = (_DWORD)a3 + 1;
  else
    v15 = v14;
  do
  {
    v17((uint64_t)v16, (int)a3);
    a3 = (const $5E5F304956FB491AF6F034FDF0808287 *)((_DWORD)a3 + 1);
  }
  while (v15 != (_DWORD)a3);

}

void __68__MKOverlayRenderer__forEachMapRectForKey_withContext_performBlock___block_invoke(uint64_t a1, int a2)
{
  _DWORD *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  CGContext *v14;
  double width;
  double height;
  double v17;
  double v18;
  _QWORD v19[2];
  _OWORD v20[7];
  _QWORD v21[4];
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  CGRect ClipBoundingBox;
  CGRect v36;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD **)(a1 + 40);
  v4 = v3[2];
  v5 = 268435456.0 / (double)(1 << v4);
  v6 = v5 * (double)(*v3 + (a2 << v4));
  v7 = v5 * (double)(int)v3[1];
  if (_MKLinkedOnOrAfterReleaseSet(2310))
  {
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v6, v7, v5, v5);
  }
  else
  {
    v8 = 0;
    *(double *)v21 = v6;
    *(double *)&v21[1] = v7;
    *(double *)&v21[2] = v5 * 0.5;
    *(double *)&v21[3] = v5 * 0.5;
    v22 = v5 * 0.5 + v6;
    v23 = v7;
    v24 = v5 * 0.5;
    v25 = v5 * 0.5;
    v26 = v6;
    v27 = v5 * 0.5 + v7;
    v28 = v5 * 0.5;
    v29 = v5 * 0.5;
    v30 = v22;
    v31 = v27;
    v32 = v5 * 0.5;
    v33 = v5 * 0.5;
    v19[0] = 0;
    v19[1] = 0;
    __asm { FMOV            V0.2D, #0.5 }
    v20[0] = _Q0;
    v20[1] = xmmword_18B2A9840;
    v20[2] = _Q0;
    v20[3] = xmmword_18B2A9850;
    v20[4] = _Q0;
    v20[5] = _Q0;
    v20[6] = _Q0;
    do
    {
      v14 = *(CGContext **)(a1 + 48);
      if (v14)
      {
        CGContextSaveGState(v14);
        ClipBoundingBox = CGContextGetClipBoundingBox((CGContextRef)*(_QWORD *)(a1 + 48));
        width = ClipBoundingBox.size.width;
        height = ClipBoundingBox.size.height;
        v17 = *(double *)&v19[v8 / 8];
        v18 = *(double *)&v19[v8 / 8 + 1];
        CGContextTranslateCTM(*(CGContextRef *)(a1 + 48), ClipBoundingBox.size.width * v17, ClipBoundingBox.size.height * v18);
        v36.size.width = width * *(double *)&v19[v8 / 8 + 2];
        v36.size.height = height * *((double *)&v20[v8 / 0x10] + 1);
        v36.origin.x = 0.0;
        v36.origin.y = 0.0;
        CGContextClipToRect(*(CGContextRef *)(a1 + 48), v36);
        (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)&v21[v8 / 8], *(double *)&v21[v8 / 8 + 1], *(double *)&v21[v8 / 8 + 2], *(double *)&v21[v8 / 8 + 3]);
        CGContextTranslateCTM(*(CGContextRef *)(a1 + 48), -(width * v17), -(height * v18));
        CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
      }
      else
      {
        (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)&v21[v8 / 8], *(double *)&v21[v8 / 8 + 1], *(double *)&v21[v8 / 8 + 2], *(double *)&v21[v8 / 8 + 3]);
      }
      v8 += 32;
    }
    while (v8 != 128);
  }
}

- (BOOL)overlay:(id)a3 canPossiblyDrawKey:(id *)a4
{
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v6 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MKOverlayRenderer_overlay_canPossiblyDrawKey___block_invoke;
  v8[3] = &unk_1E20D9968;
  v8[5] = &v9;
  v8[6] = a4;
  v8[4] = self;
  -[MKOverlayRenderer _forEachMapRectForKey:withContext:performBlock:](self, "_forEachMapRectForKey:withContext:performBlock:", a4, 0, v8);
  LOBYTE(a4) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)a4;
}

uint64_t __48__MKOverlayRenderer_overlay_canPossiblyDrawKey___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  BOOL v10;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "_mayExtendOutsideBounds"))
  {
    v10 = a2 == INFINITY && a3 == INFINITY;
    a2 = v10 ? INFINITY : a2 - a4;
    a3 = v10 ? INFINITY : a3 - a5;
    if (!v10)
    {
      a4 = a4 + a4 * 2.0;
      a5 = a5 + a5 * 2.0;
    }
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_canPossiblyDrawMapRect:zoomScale:", a2, a3, a4, a5, (double)(1.0/ exp2((double)(uint64_t)(21- (unint64_t)(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 12)+ *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8))))));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)overlay:(id)a3 canDrawKey:(id *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v15[9];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = exp2((double)(21 - (a4->var3 + a4->var2)));
  objc_opt_class();
  v8 = 1.0 / v7;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[MKOverlayRenderer lineWidth](self, "lineWidth"), v10 = v9 / v8, v10 == 0.0))
  {
    v11 = vcvtmd_s64_f64(log2(v8) + 0.5);
    if (v11 >= -21)
      v12 = (v11 & (v11 >> 63)) + 21;
    else
      v12 = 0;
    v10 = __const_MKRoadWidthAtZoomScale_kLineWidthForZoomLevel[v12] / v8;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__MKOverlayRenderer_overlay_canDrawKey___block_invoke;
  v15[3] = &unk_1E20D9990;
  *(double *)&v15[6] = v10;
  *(double *)&v15[7] = v8;
  v15[4] = self;
  v15[5] = &v16;
  v15[8] = a4;
  -[MKOverlayRenderer _forEachMapRectForKey:withContext:performBlock:](self, "_forEachMapRectForKey:withContext:performBlock:", a4, 0, v15);
  v13 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __40__MKOverlayRenderer_overlay_canDrawKey___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t result;
  uint64_t i;
  uint64_t j;

  v10 = INFINITY;
  v11 = a2 == INFINITY && a3 == INFINITY;
  v12 = INFINITY;
  v13 = a4;
  v14 = a5;
  if (!v11)
  {
    v15 = *(double *)(a1 + 48);
    v12 = a2 - v15;
    v10 = a3 - v15;
    v13 = a4 + v15 * 2.0;
    v14 = a5 + v15 * 2.0;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_canPossiblyDrawMapRect:zoomScale:", v12, v10, v13, v14, *(double *)(a1 + 56));
  if ((_DWORD)result)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_mayExtendOutsideBounds"))
    {
      if (_MKLinkedOnOrAfterReleaseSet(2567))
      {
        for (i = -1; i != 2; ++i)
        {
          for (j = -1; j != 2; ++j)
          {
            result = objc_msgSend(*(id *)(a1 + 32), "canDrawMapRect:zoomScale:", a2 + (double)i * a4, a3 + (double)j * a5, a4, a5, *(double *)(a1 + 56));
            if ((_DWORD)result)
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          }
        }
        return result;
      }
      result = objc_msgSend(*(id *)(a1 + 32), "canDrawMapRect:zoomScale:", v12, v10, v13, v14, *(double *)(a1 + 56));
      if ((result & 1) == 0)
        return result;
    }
    else
    {
      result = objc_msgSend(*(id *)(a1 + 32), "canDrawMapRect:zoomScale:", a2, a3, a4, a5, (double)(1.0/ exp2((double)(uint64_t)(21- (unint64_t)(*(_DWORD *)(*(_QWORD *)(a1 + 64) + 12)+ *(_DWORD *)(*(_QWORD *)(a1 + 64) + 8))))));
      if (!(_DWORD)result)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)overlay:(id)a3 drawKey:(id *)a4 inContext:(CGContext *)a5
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD v11[7];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v17 = 0u;
  v15 = 0u;
  v16 = 0u;
  CGContextGetBaseCTM();
  v11[1] = 3221225472;
  v12 = 0u;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __47__MKOverlayRenderer_overlay_drawKey_inContext___block_invoke;
  v11[3] = &unk_1E20D82D0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a5;
  v13 = 0u;
  v14 = 0u;
  v8 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v11);
  -[MKOverlayRenderer _mapView](self, "_mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "_withEffectiveTraitCollection:", v8);
  else
    v8[2](v8);

}

uint64_t __47__MKOverlayRenderer_overlay_drawKey_inContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, double, double, double, double);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __47__MKOverlayRenderer_overlay_drawKey_inContext___block_invoke_2;
  v9 = &unk_1E20D99B8;
  v11 = v3;
  v12 = v1;
  v10 = v2;
  v4 = *(_OWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 56);
  v14 = v4;
  v15 = *(_OWORD *)(a1 + 88);
  return objc_msgSend(v2, "_forEachMapRectForKey:withContext:performBlock:");
}

void __47__MKOverlayRenderer_overlay_drawKey_inContext___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  CGContext *v17;
  CGFloat v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  CGContextSaveGState(*(CGContextRef *)(a1 + 40));
  v10 = 1.0
      / exp2((double)(21
                    - (*(_DWORD *)(*(_QWORD *)(a1 + 48) + 12) + *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8))));
  objc_msgSend(*(id *)(a1 + 32), "rectForMapRect:", a2, a3, a4, a5);
  v12 = -(v11 * v10);
  v14 = -(v13 * v10);
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 40), v12, v14);
  CGContextScaleCTM(*(CGContextRef *)(a1 + 40), v10, v10);
  v15 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v21.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v21.c = v15;
  *(_OWORD *)&v21.tx = *(_OWORD *)(a1 + 88);
  v16 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v20.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v20.c = v16;
  *(_OWORD *)&v20.tx = *(_OWORD *)(a1 + 88);
  CGAffineTransformTranslate(&v21, &v20, v12, v14);
  v19 = v21;
  CGAffineTransformScale(&v20, &v19, v10, v10);
  v21 = v20;
  CGContextSetBaseCTM();
  v17 = *(CGContext **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  CGContextSetAlpha(v17, v18);
  objc_msgSend(*(id *)(a1 + 32), "drawMapRect:zoomScale:inContext:", *(_QWORD *)(a1 + 40), a2, a3, a4, a5, v10);
  CGContextRestoreGState(*(CGContextRef *)(a1 + 40));
}

- (BOOL)canDrawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  BOOL v9;
  MKMapRect v11;
  MKMapRect v12;

  height = mapRect.size.height;
  width = mapRect.size.width;
  y = mapRect.origin.y;
  x = mapRect.origin.x;
  -[MKOverlayRenderer overlay](self, "overlay", mapRect.origin.x, mapRect.origin.y, mapRect.size.width, mapRect.size.height, zoomScale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingMapRect");
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = MKMapRectIntersectsRect(v11, v12);

  return v9;
}

- (BOOL)_canPossiblyDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  MKMapRect v9;
  MKMapRect v10;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v6 = a3.var0.var1;
  v7 = a3.var0.var0;
  -[MKOverlayRenderer _boundingMapRect](self, "_boundingMapRect", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, a4);
  v10.origin.x = v7;
  v10.origin.y = v6;
  v10.size.width = var0;
  v10.size.height = var1;
  return MKMapRectIntersectsRect(v9, v10);
}

- (BOOL)overlayCanProvideVectorData:(id)a3
{
  return 0;
}

- (id)vectorDataForOverlay:(id)a3
{
  return 0;
}

- (BOOL)overlayCanProvideRasterTileData:(id)a3
{
  return 0;
}

- (id)rasterTileProviderForOverlay:(id)a3
{
  return 0;
}

- (BOOL)overlayCanProvideCustomTileData:(id)a3
{
  return 0;
}

- (BOOL)areOverlayResourcesRequired:(id)a3
{
  return 0;
}

- (BOOL)shouldUseMetalTexture:(id)a3
{
  return 0;
}

- (id)customTileProviderForOverlay:(id)a3
{
  return 0;
}

- (void)_updateRenderColors
{
  -[VKOverlay setNeedsDisplayForReason:](self->_renderer, "setNeedsDisplayForReason:", 2);
}

- (id)overlay
{
  return self->_overlay;
}

- (CGBlendMode)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAnimations, 0);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
}

@end
