@implementation MKTileOverlayRenderer

+ (BOOL)_externalSubclassOverridesDrawingMethods
{
  uint64_t v3;

  v3 = objc_opt_class();
  if ((objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_drawMapRect_zoomScale_inContext_, v3) & 1) != 0)return 1;
  else
    return objc_msgSend(a1, "_mapkit_instanceImplementationOfSelector:isFromSubclassOfClass:", sel_canDrawMapRect_zoomScale_, v3);
}

- (MKTileOverlayRenderer)initWithOverlay:(id)a3
{
  id v4;
  MKTileOverlayRenderer *v5;
  uint64_t v6;
  GEOTileKeyList *pendingRequests;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *pendingRequestsLock;
  MKTileOverlayRenderer *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)MKTileOverlayRenderer;
    v5 = -[MKOverlayRenderer initWithOverlay:](&v17, sel_initWithOverlay_, v4);

    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D275C8]), "initWithMaxCapacity:", 512);
      pendingRequests = v5->_pendingRequests;
      v5->_pendingRequests = (GEOTileKeyList *)v6;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create(0, v8);
      pendingRequestsLock = v5->_pendingRequestsLock;
      v5->_pendingRequestsLock = (OS_dispatch_queue *)v9;

      v5->_externalSubclassOverridesDrawingMethods = objc_msgSend((id)objc_opt_class(), "_externalSubclassOverridesDrawingMethods");
    }
    self = v5;
    v11 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected a MKTileOverlay but got %@"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise");

    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_loopsRemaining)
    -[VKRasterTileOverlayProviderData removeObserver:forKeyPath:context:](self->_rasterProvider, "removeObserver:forKeyPath:context:", self, CFSTR("visibleKeyframeIndex"), VisibleKeyframeIndexContext);
  v3.receiver = self;
  v3.super_class = (Class)MKTileOverlayRenderer;
  -[MKOverlayRenderer dealloc](&v3, sel_dealloc);
}

- (BOOL)_mayExtendOutsideBounds
{
  return 0;
}

- (void)setAlpha:(double)a3
{
  VKRasterTileOverlayProviderData *rasterProvider;
  uint64_t v6;
  _QWORD v7[7];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKTileOverlayRenderer;
  -[MKOverlayRenderer setAlpha:](&v8, sel_setAlpha_);
  rasterProvider = self->_rasterProvider;
  if (rasterProvider)
  {
    -[VKRasterTileOverlayProviderData alpha](rasterProvider, "alpha");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__MKTileOverlayRenderer_setAlpha___block_invoke;
    v7[3] = &unk_1E20DB2B0;
    v7[4] = self;
    v7[5] = v6;
    *(double *)&v7[6] = a3;
    -[MKOverlayRenderer _animateIfNecessaryForKey:withStepHandler:](self, "_animateIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v7);
  }
}

uint64_t __34__MKTileOverlayRenderer_setAlpha___block_invoke(uint64_t a1, float a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setAlpha:", *(double *)(a1 + 48) * a2 + *(double *)(a1 + 40) * (float)(1.0 - a2));
}

- (void)setColorMap:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_colorMap != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_colorMap, a3);
    -[MKTileOverlayRenderer _updateColorMap](self, "_updateColorMap");
    v5 = v6;
  }

}

+ (id)keyPathsForValuesAffectingVisibleKeyframeIndex
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("rasterProvider.visibleKeyframeIndex"));
}

- (unint64_t)_visibleKeyframeIndex
{
  unint64_t result;

  result = (unint64_t)self->_rasterProvider;
  if (result)
    return objc_msgSend((id)result, "visibleKeyframeIndex");
  return result;
}

- (void)setVisibleKeyframeOverride:(id)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  int v8;
  id v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_visibleKeyframeOverride, a3);
  if (v10)
  {
    -[MKOverlayRenderer overlay](self, "overlay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MKOverlayRenderer overlay](self, "overlay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "intValue");
      if (v8 >= (int)objc_msgSend(v7, "keyframesCount"))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Invalid index"), 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v9);
      }
      -[VKRasterTileOverlayProviderData setKeyframeIndexOverride:](self->_rasterProvider, "setKeyframeIndexOverride:", objc_msgSend(v10, "intValue"));

    }
  }
  else
  {
    -[VKRasterTileOverlayProviderData setKeyframeIndexOverride:](self->_rasterProvider, "setKeyframeIndexOverride:", 0xFFFFFFFFLL);
  }

}

- (void)_playWithLoopCount:(unint64_t)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  VKRasterTileOverlayProviderData *rasterProvider;

  -[MKOverlayRenderer overlay](self, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (a3)
  {
    if ((isKindOfClass & 1) != 0)
    {
      -[MKOverlayRenderer overlay](self, "overlay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "keyframesCount");

      if (v8)
      {
        self->_loopsRemaining = a3;
        -[MKTileOverlayRenderer setVisibleKeyframeOverride:](self, "setVisibleKeyframeOverride:", 0);
        rasterProvider = self->_rasterProvider;
        if (rasterProvider)
          -[VKRasterTileOverlayProviderData addObserver:forKeyPath:options:context:](rasterProvider, "addObserver:forKeyPath:options:context:", self, CFSTR("visibleKeyframeIndex"), 3, VisibleKeyframeIndexContext);
      }
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t loopsRemaining;
  unint64_t v20;
  objc_super v21;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  if ((void *)VisibleKeyframeIndexContext == a6)
  {
    v13 = *MEMORY[0x1E0CB2CC8];
    v14 = a5;
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "unsignedIntegerValue");
    if (v18 < v16)
    {
      if ((loopsRemaining = self->_loopsRemaining) == 0
        && (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
         || (*(_WORD *)buf = 0,
             _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _loopsRemaining > 0", buf, 2u), (loopsRemaining = self->_loopsRemaining) == 0))|| (v20 = loopsRemaining - 1, (self->_loopsRemaining = v20) == 0))
      {
        objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, v10, a6);
        -[MKTileOverlayRenderer setVisibleKeyframeOverride:](self, "setVisibleKeyframeOverride:", &unk_1E21594D8);
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MKTileOverlayRenderer;
    v12 = a5;
    -[MKTileOverlayRenderer observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);

  }
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1;
  double var0;
  double v7;
  double v8;
  void *v10;
  double v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *pendingRequestsLock;
  void *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[6];
  __int128 v35;
  _QWORD block[6];
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v7 = a3.var0.var1;
  v8 = a3.var0.var0;
  v40 = *MEMORY[0x1E0C80C00];
  -[MKOverlayRenderer overlay](self, "overlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKOverlayRenderer contentScaleFactor](self, "contentScaleFactor");
  objc_msgSend(v10, "_tilesInMapRect:zoomScale:contentScale:", v8, v7, var0, var1, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v12;
  v14 = 0;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v18, "image");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v14 = 1;
        }
        else
        {
          v38 = 0uLL;
          -[MKOverlayRenderer overlay](self, "overlay");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v18, "path");
          else
            memset(v29, 0, sizeof(v29));
          *(_QWORD *)&v38 = objc_msgSend(v20, "_keyForPath:", v29);
          *((_QWORD *)&v38 + 1) = v21;

          v25 = 0;
          v26 = &v25;
          v27 = 0x2020000000;
          v28 = 0;
          pendingRequestsLock = self->_pendingRequestsLock;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke;
          block[3] = &unk_1E20DF568;
          v37 = v38;
          block[4] = self;
          block[5] = &v25;
          dispatch_sync(pendingRequestsLock, block);
          if (!*((_BYTE *)v26 + 24))
          {
            -[MKOverlayRenderer overlay](self, "overlay");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_2;
            v34[3] = &unk_1E20DF590;
            v34[4] = v18;
            v34[5] = self;
            v35 = v38;
            objc_msgSend(v23, "_loadTile:result:", &v38, v34);

          }
          _Block_object_dispose(&v25, 8);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }

  return v14 & 1;
}

uint64_t __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "containsKey:", a1 + 48);
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addKey:", a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  long double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[5];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "frame");
    objc_msgSend(*(id *)(a1 + 40), "_renderer", v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scale");
    v9 = vcvtmd_s64_f64(log2(v8) + 0.5);
    if (v9 >= -21)
      v10 = v9 + 19;
    else
      v10 = -2;
    objc_msgSend(v7, "setNeedsDisplayInRect:level:reason:", &v13, v10, 3);

  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(v11 + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_3;
  block[3] = &unk_1E20DA7C0;
  block[4] = v11;
  v15 = *(_OWORD *)(a1 + 48);
  dispatch_sync(v12, block);
}

uint64_t __50__MKTileOverlayRenderer_canDrawMapRect_zoomScale___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeKey:", a1 + 40);
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v9;
  double v10;
  void *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFData *v23;
  CGImageSource *v24;
  CGImage *ImageAtIndex;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat MinX;
  CGFloat MinY;
  size_t Height;
  CGFloat Width;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v9 = a3.var0.var1;
  v10 = a3.var0.var0;
  v43 = *MEMORY[0x1E0C80C00];
  -[MKOverlayRenderer overlay](self, "overlay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKOverlayRenderer contentScaleFactor](self, "contentScaleFactor");
  objc_msgSend(v12, "_tilesInMapRect:zoomScale:contentScale:", v10, v9, var0, var1, a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    v19 = 1.0 / a4;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v21, "image", (_QWORD)v38);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v21, "image");
          v23 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          v24 = CGImageSourceCreateWithData(v23, 0);

          if (v24)
          {
            if (CGImageSourceGetCount(v24))
            {
              ImageAtIndex = CGImageSourceCreateImageAtIndex(v24, 0, 0);
              CFRelease(v24);
              if (ImageAtIndex)
              {
                objc_msgSend(v21, "frame");
                -[MKOverlayRenderer rectForMapRect:](self, "rectForMapRect:");
                v27 = v26;
                v29 = v28;
                v31 = v30;
                v33 = v32;
                CGContextSaveGState(a5);
                v44.origin.x = v27;
                v44.origin.y = v29;
                v44.size.width = v31;
                v44.size.height = v33;
                MinX = CGRectGetMinX(v44);
                v45.origin.x = v27;
                v45.origin.y = v29;
                v45.size.width = v31;
                v45.size.height = v33;
                MinY = CGRectGetMinY(v45);
                CGContextTranslateCTM(a5, MinX, MinY);
                CGContextScaleCTM(a5, v19, v19);
                Height = CGImageGetHeight(ImageAtIndex);
                CGContextTranslateCTM(a5, 0.0, (double)Height);
                CGContextScaleCTM(a5, 1.0, -1.0);
                Width = (double)CGImageGetWidth(ImageAtIndex);
                v46.size.height = (double)CGImageGetHeight(ImageAtIndex);
                v46.origin.x = 0.0;
                v46.origin.y = 0.0;
                v46.size.width = Width;
                CGContextDrawImage(a5, v46, ImageAtIndex);
                CGContextRestoreGState(a5);
                CGImageRelease(ImageAtIndex);
              }
            }
            else
            {
              CFRelease(v24);
            }
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v17);
  }

}

- (void)reloadData
{
  void *v3;

  -[MKOverlayRenderer overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flushCaches");

  -[MKOverlayRenderer setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)overlayCanProvideRasterTileData:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  double v12;

  if (self->_externalSubclassOverridesDrawingMethods)
    return 0;
  -[MKOverlayRenderer overlay](self, "overlay", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tileSize");
  v6 = v5;
  -[MKOverlayRenderer overlay](self, "overlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tileSize");
  v9 = vabdd_f64(v6, v8);

  if (v9 >= 0.000001)
    return 0;
  -[MKOverlayRenderer overlay](self, "overlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tileSize");
  v10 = v12 <= 512.0;

  return v10;
}

- (id)rasterTileProviderForOverlay:(id)a3
{
  VKRasterTileOverlayProviderData *rasterProvider;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  unsigned __int16 v15;
  uint64_t v16;
  double v17;
  double v18;
  NSNumber *visibleKeyframeOverride;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  VKRasterTileOverlayProviderData *v25;
  VKRasterTileOverlayProviderData *v26;
  unsigned int v28;
  unsigned int v29;

  rasterProvider = self->_rasterProvider;
  if (!rasterProvider)
  {
    -[MKOverlayRenderer overlay](self, "overlay", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "minimumZ");

    -[MKOverlayRenderer overlay](self, "overlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumZ");

    v9 = 0xFFFFFFFFLL;
    if (v6 >= 0xFFFFFFFFLL)
      v10 = 0xFFFFFFFFLL;
    else
      v10 = v6;
    v29 = v10 & ~(v10 >> 63);
    if (v8 >= 0xFFFFFFFFLL)
      v11 = 0xFFFFFFFFLL;
    else
      v11 = v8;
    v28 = v11 & ~(v11 >> 63);
    -[MKOverlayRenderer overlay](self, "overlay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MKOverlayRenderer overlay](self, "overlay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "keyframesCount");
      if ((unint64_t)objc_msgSend(v14, "keyframesCount") > 0xFFFE)
        v15 = -1;
      else
        v15 = objc_msgSend(v14, "keyframesCount");
      objc_msgSend(v14, "duration");
      v17 = v18;
      v16 = objc_msgSend(v14, "shouldCrossfade");
      visibleKeyframeOverride = self->_visibleKeyframeOverride;
      if (visibleKeyframeOverride)
        v9 = -[NSNumber intValue](visibleKeyframeOverride, "intValue");
      else
        v9 = 0xFFFFFFFFLL;

    }
    else
    {
      v16 = 0;
      v15 = 1;
      v17 = 0.0;
    }
    -[MKTileOverlayRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rasterProvider"));
    v20 = objc_alloc(MEMORY[0x1E0DC6550]);
    -[MKOverlayRenderer overlay](self, "overlay");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_providerID");
    -[MKOverlayRenderer overlay](self, "overlay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tileSize");
    v25 = (VKRasterTileOverlayProviderData *)objc_msgSend(v20, "initWithProviderID:tileSize:minimumZ:maximumZ:keyframesCount:duration:crossfadeKeyframes:", v22, v24, v29, v28, v15, v16, v17);
    v26 = self->_rasterProvider;
    self->_rasterProvider = v25;

    -[MKOverlayRenderer alpha](self, "alpha");
    -[VKRasterTileOverlayProviderData setAlpha:](self->_rasterProvider, "setAlpha:");
    -[VKRasterTileOverlayProviderData setKeyframeIndexOverride:](self->_rasterProvider, "setKeyframeIndexOverride:", v9);
    -[MKTileOverlayRenderer _updateColorMap](self, "_updateColorMap");
    -[MKTileOverlayRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rasterProvider"));
    rasterProvider = self->_rasterProvider;
    if (self->_loopsRemaining)
    {
      -[VKRasterTileOverlayProviderData addObserver:forKeyPath:options:context:](rasterProvider, "addObserver:forKeyPath:options:context:", self, CFSTR("visibleKeyframeIndex"), 3, VisibleKeyframeIndexContext);
      rasterProvider = self->_rasterProvider;
    }
  }
  return rasterProvider;
}

- (void)_updateRenderColors
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  if (self->_rasterProvider)
  {
    -[MKOverlayRenderer _mapView](self, "_mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__MKTileOverlayRenderer__updateRenderColors__block_invoke;
    v5[3] = &unk_1E20D7D98;
    v5[4] = self;
    objc_msgSend(v3, "_withEffectiveTraitCollection:", v5);

  }
  v4.receiver = self;
  v4.super_class = (Class)MKTileOverlayRenderer;
  -[MKOverlayRenderer _updateRenderColors](&v4, sel__updateRenderColors);
}

uint64_t __44__MKTileOverlayRenderer__updateRenderColors__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateColorMap");
}

- (void)_updateColorMap
{
  if (self->_rasterProvider)
    -[VKRasterTileOverlayProviderData setColorMap:](self->_rasterProvider, "setColorMap:", -[UIImage CGImage](self->_colorMap, "CGImage"));
}

- (UIImage)colorMap
{
  return self->_colorMap;
}

- (NSNumber)visibleKeyframeOverride
{
  return self->_visibleKeyframeOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleKeyframeOverride, 0);
  objc_storeStrong((id *)&self->_colorMap, 0);
  objc_storeStrong((id *)&self->_rasterProvider, 0);
  objc_storeStrong((id *)&self->_pendingRequestsLock, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
