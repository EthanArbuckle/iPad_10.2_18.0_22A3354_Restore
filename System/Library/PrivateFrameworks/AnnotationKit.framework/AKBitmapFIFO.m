@implementation AKBitmapFIFO

- (AKBitmapFIFO)initWithFIFO:(id)a3
{
  AKBitmapFIFO *v3;
  AKBitmapFIFO *v4;
  __int128 v5;
  _OWORD v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKBitmapFIFO;
  v3 = -[CHPointFIFO initWithFIFO:](&v8, sel_initWithFIFO_, a3);
  v4 = v3;
  if (v3)
  {
    -[AKBitmapFIFO setBitmapSize:](v3, "setBitmapSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[AKBitmapFIFO setBitmapSizeHasBeenUpdatedOnceForLiveDraw:](v4, "setBitmapSizeHasBeenUpdatedOnceForLiveDraw:", 0);
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v7[0] = *MEMORY[0x24BDBD8B8];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[AKBitmapFIFO setViewToBitmapTransform:](v4, "setViewToBitmapTransform:", v7);
    -[AKBitmapFIFO setBitmapSizeMultiplier:](v4, "setBitmapSizeMultiplier:", 1.0);
    -[AKBitmapFIFO setLastPoint:](v4, "setLastPoint:", 0.0);
    -[AKBitmapFIFO setUnionDirtyRect:](v4, "setUnionDirtyRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
  }
  return v4;
}

- (void)teardown
{
  -[AKBitmapFIFO setView:](self, "setView:", 0);
  -[AKBitmapFIFO _clearAllBitmapData](self, "_clearAllBitmapData");
}

- (void)addPoint:(AKBitmapFIFO *)self
{
  double v2;
  double v4;

  v4 = v2;
  -[AKBitmapFIFO _clearCachedPath](self, "_clearCachedPath");
  -[AKBitmapFIFO _createBitmapContextIfNecessary](self, "_createBitmapContextIfNecessary");
  -[AKBitmapFIFO _addPointToBitmap:](self, "_addPointToBitmap:", v4);
  MEMORY[0x24BEDD108](self, sel_emitPoint_);
}

- (void)flush
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKBitmapFIFO;
  -[CHPointFIFO flush](&v3, sel_flush);
  -[AKBitmapFIFO setLastPoint:](self, "setLastPoint:", 0.0);
  -[AKBitmapFIFO resetDirtyRect](self, "resetDirtyRect");
}

- (void)clear
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKBitmapFIFO;
  -[CHPointFIFO clear](&v4, sel_clear);
  -[AKBitmapFIFO _clearCachedPath](self, "_clearCachedPath");
  -[AKBitmapFIFO _clearAllBitmapData](self, "_clearAllBitmapData");
  -[AKBitmapFIFO view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

  -[AKBitmapFIFO setLastPoint:](self, "setLastPoint:", 0.0);
  -[AKBitmapFIFO resetDirtyRect](self, "resetDirtyRect");
}

- (void)setIsInLiveDraw:(BOOL)a3
{
  if (self->_isInLiveDraw != a3)
  {
    self->_isInLiveDraw = a3;
    -[AKBitmapFIFO setBitmapSizeHasBeenUpdatedOnceForLiveDraw:](self, "setBitmapSizeHasBeenUpdatedOnceForLiveDraw:", 0);
  }
}

- (void)setView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_view != v5)
  {
    v6 = v5;
    -[AKBitmapFIFO clear](self, "clear");
    objc_storeStrong((id *)&self->_view, a3);
    -[AKBitmapFIFO _updateBitmapSizeFromViewIfNecessary](self, "_updateBitmapSizeFromViewIfNecessary");
    v5 = v6;
  }

}

- (void)resetDirtyRect
{
  -[AKBitmapFIFO setUnionDirtyRect:](self, "setUnionDirtyRect:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (CGRect)bitmapRectInView
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[AKBitmapFIFO view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    v12 = *MEMORY[0x24BDBEFB0];
    v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", 1.0, 0.0);
    v15 = v14;
    v17 = v16;
    -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", v12, v13);
    v19 = vabdd_f64(v15, v18);
    v21 = vabdd_f64(v17, v20);
    if (v19 < v21)
      v19 = v21;
    v22 = 1.0 / v19 * -200.0;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectInset(v27, v22, v22);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGImage)currentBitmap
{
  -[AKBitmapFIFO _createBitmapIfNecessary](self, "_createBitmapIfNecessary");
  return self->_bitmapImage;
}

- (CGPath)newPathFromCurrentBitmap
{
  CGPath *cachedPath;
  AKPotrace *v4;
  AKPotrace *v5;
  uint64_t v6;
  CGAffineTransform v8;
  CGAffineTransform v9;

  cachedPath = self->_cachedPath;
  if (!cachedPath)
  {
    v4 = -[AKPotrace initWithCGImage:flipped:whiteIsInside:]([AKPotrace alloc], "initWithCGImage:flipped:whiteIsInside:", -[AKBitmapFIFO currentBitmap](self, "currentBitmap"), 1, 1);
    v5 = v4;
    if (v4)
    {
      -[AKPotrace setTurdsize:](v4, "setTurdsize:", 0);
      v6 = -[AKPotrace CGPath](v5, "CGPath");
      memset(&v9, 0, sizeof(v9));
      -[AKBitmapFIFO viewToBitmapTransform](self, "viewToBitmapTransform");
      CGAffineTransformInvert(&v9, &v8);
      self->_cachedPath = (CGPath *)MEMORY[0x22E2C0A54](v6, &v9);
    }

    cachedPath = self->_cachedPath;
  }
  return CGPathCreateMutableCopy(cachedPath);
}

- (void)_clearCachedPath
{
  CGPath *cachedPath;

  cachedPath = self->_cachedPath;
  if (cachedPath)
  {
    CGPathRelease(cachedPath);
    self->_cachedPath = 0;
  }
}

- (CGPoint)_convertPointToScreenBacking:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AKBitmapFIFO view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v6, x, y);
  objc_msgSend(v6, "convertPoint:toWindow:", 0);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)_updateBitmapSizeFromViewIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat MidY;
  int64_t v13;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  __int128 v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v54;
  CGFloat v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  _QWORD v66[5];
  CGAffineTransform v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  if (!-[AKBitmapFIFO isInLiveDraw](self, "isInLiveDraw")
    || !-[AKBitmapFIFO bitmapSizeHasBeenUpdatedOnceForLiveDraw](self, "bitmapSizeHasBeenUpdatedOnceForLiveDraw"))
  {
    -[AKBitmapFIFO bitmapRectInView](self, "bitmapRectInView");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      memset(&v67, 0, sizeof(v67));
      v68.origin.x = v4;
      v68.origin.y = v6;
      v68.size.width = v8;
      v68.size.height = v10;
      v11 = -CGRectGetMidX(v68);
      v69.origin.x = v4;
      v69.origin.y = v6;
      v69.size.width = v8;
      v69.size.height = v10;
      MidY = CGRectGetMidY(v69);
      CGAffineTransformMakeTranslation(&v67, v11, -MidY);
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = sub_22904F624;
      v66[3] = &unk_24F1A7D48;
      v66[4] = self;
      v13 = +[AKGeometryHelper exifOrientationWithConversionBlock:](AKGeometryHelper, "exifOrientationWithConversionBlock:", v66);
      memset(&v65, 0, sizeof(v65));
      +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v13, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      v70.origin.x = v4;
      v70.origin.y = v6;
      v70.size.width = v8;
      v70.size.height = v10;
      MinX = CGRectGetMinX(v70);
      v71.origin.x = v4;
      v71.origin.y = v6;
      v71.size.width = v8;
      v71.size.height = v10;
      MinY = CGRectGetMinY(v71);
      v72.origin.x = v4;
      v72.origin.y = v6;
      v72.size.width = v8;
      v72.size.height = v10;
      MaxX = CGRectGetMaxX(v72);
      v73.origin.x = v4;
      v73.origin.y = v6;
      v73.size.width = v8;
      v73.size.height = v10;
      MaxY = CGRectGetMaxY(v73);
      -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", MinX, MinY);
      v19 = v18;
      v21 = v20;
      -[AKBitmapFIFO _convertPointToScreenBacking:](self, "_convertPointToScreenBacking:", MaxX, MaxY);
      v74.size.width = v22 - v19;
      v74.size.height = v23 - v21;
      v74.origin.x = v19;
      v74.origin.y = v21;
      v75 = CGRectStandardize(v74);
      x = v75.origin.x;
      y = v75.origin.y;
      width = v75.size.width;
      height = v75.size.height;
      v64 = v65;
      v75.origin.x = v4;
      v75.origin.y = v6;
      v75.size.width = v8;
      v75.size.height = v10;
      v76 = CGRectApplyAffineTransform(v75, &v64);
      v54 = v6;
      v55 = v4;
      v28 = v76.origin.x;
      v49 = v76.origin.y;
      rect = v76.origin.x;
      rect_16 = v10;
      rect_24 = v8;
      v29 = v76.size.width;
      v30 = v76.size.height;
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      v31 = CGRectGetWidth(v76);
      v77.origin.x = v28;
      v77.origin.y = v49;
      v77.size.width = v29;
      v77.size.height = v30;
      rect_8 = v31 / CGRectGetWidth(v77);
      v78.origin.x = x;
      v32 = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = height;
      v33 = CGRectGetHeight(v78);
      v79.origin.x = rect;
      v79.origin.y = v49;
      v79.size.width = v29;
      v79.size.height = v30;
      v34 = CGRectGetHeight(v79);
      memset(&v64, 0, sizeof(v64));
      CGAffineTransformMakeScale(&v64, rect_8, v33 / v34);
      memset(&v63, 0, sizeof(v63));
      v80.origin.x = v32;
      v80.origin.y = y;
      v80.size.width = width;
      v80.size.height = height;
      v35 = CGRectGetWidth(v80) * 0.5;
      v81.origin.x = v32;
      v81.origin.y = y;
      v81.size.width = width;
      v81.size.height = height;
      v36 = CGRectGetHeight(v81);
      CGAffineTransformMakeTranslation(&v63, v35, v36 * 0.5);
      memset(&v62, 0, sizeof(v62));
      -[AKBitmapFIFO bitmapSizeMultiplier](self, "bitmapSizeMultiplier");
      v38 = v37;
      -[AKBitmapFIFO bitmapSizeMultiplier](self, "bitmapSizeMultiplier");
      CGAffineTransformMakeScale(&v62, v38, v39);
      v40 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v61.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v61.c = v40;
      *(_OWORD *)&v61.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      *(_OWORD *)&t1.a = *(_OWORD *)&v61.a;
      *(_OWORD *)&t1.c = v40;
      *(_OWORD *)&t1.tx = *(_OWORD *)&v61.tx;
      t2 = v67;
      CGAffineTransformConcat(&v61, &t1, &t2);
      t2 = v61;
      v58 = v65;
      CGAffineTransformConcat(&t1, &t2, &v58);
      v61 = t1;
      t2 = t1;
      v58 = v64;
      CGAffineTransformConcat(&t1, &t2, &v58);
      v61 = t1;
      t2 = t1;
      v58 = v63;
      CGAffineTransformConcat(&t1, &t2, &v58);
      v61 = t1;
      t2 = t1;
      v58 = v62;
      CGAffineTransformConcat(&t1, &t2, &v58);
      v61 = t1;
      v82.origin.y = v54;
      v82.origin.x = v55;
      v82.size.height = rect_16;
      v82.size.width = rect_24;
      v83 = CGRectApplyAffineTransform(v82, &t1);
      v41 = v83.origin.x;
      v42 = v83.origin.y;
      v43 = v83.size.width;
      v44 = v83.size.height;
      v45 = floor(CGRectGetWidth(v83));
      v84.origin.x = v41;
      v84.origin.y = v42;
      v84.size.width = v43;
      v84.size.height = v44;
      v46 = floor(CGRectGetHeight(v84));
      if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", 0.0, 0.0, v45, v46))
      {
        -[AKBitmapFIFO bitmapSize](self, "bitmapSize");
        if (v45 != v48
          || v46 != v47
          || (-[AKBitmapFIFO viewToBitmapTransform](self, "viewToBitmapTransform"),
              t1 = v61,
              !CGAffineTransformEqualToTransform(&t1, &v57)))
        {
          -[AKBitmapFIFO setBitmapSize:](self, "setBitmapSize:", v45, v46);
          v56 = v61;
          -[AKBitmapFIFO setViewToBitmapTransform:](self, "setViewToBitmapTransform:", &v56);
          -[AKBitmapFIFO _clearAllBitmapData](self, "_clearAllBitmapData");
          if (-[AKBitmapFIFO isInLiveDraw](self, "isInLiveDraw"))
            -[AKBitmapFIFO setBitmapSizeHasBeenUpdatedOnceForLiveDraw:](self, "setBitmapSizeHasBeenUpdatedOnceForLiveDraw:", 1);
        }
      }
    }
  }
}

- (void)_addPointToBitmap:(AKBitmapFIFO *)self
{
  float32x4_t v2;
  float32x4_t v4;
  float32x4_t v5;
  double v6;
  int32x2_t v7;
  float32x2_t v8;
  double v9;
  unint64_t v10;
  float32x2_t v11;
  float v12;
  float32x2_t v13;
  unint64_t i;
  float32x4_t v15;
  double v16;
  float32x2_t v17;
  float32x2_t v18;

  v15 = v2;
  CGImageRelease(self->_bitmapImage);
  self->_bitmapImage = 0;
  -[AKBitmapFIFO lastPoint](self, "lastPoint");
  v5 = v4;
  if (v4.f32[0] != 0.0 || v4.f32[1] != 0.0 || v4.f32[2] != 0.0)
  {
    v4.i32[0] = v15.i32[2];
    if (v4.f32[2] < v15.f32[2])
      v4.f32[0] = v4.f32[2];
    v6 = fmax(v4.f32[0] * 0.25, 0.01);
    v17 = (float32x2_t)vsubq_f32(v15, v5).u64[0];
    v18 = *(float32x2_t *)v5.f32;
    *(float *)v7.i32 = hypotf(v17.f32[0], v17.f32[1]);
    v8 = v18;
    v9 = *(float *)v7.i32;
    if (v6 < *(float *)v7.i32)
    {
      v10 = vcvtmd_u64_f64(v9 / v6);
      v11 = vdiv_f32(v17, (float32x2_t)vdup_lane_s32(v7, 0));
      if (v10)
      {
        v12 = v9 / (double)(v10 + 1);
        v13 = vmul_n_f32(v11, v12);
        for (i = 1; i <= v10; ++i)
        {
          -[AKBitmapFIFO _addSinglePointToBitmap:](self, "_addSinglePointToBitmap:", COERCE_DOUBLE(vmla_n_f32(v8, v13, (float)i)), *(_OWORD *)&v15);
          v8 = v18;
        }
      }
    }
  }
  -[AKBitmapFIFO _addSinglePointToBitmap:](self, "_addSinglePointToBitmap:", *(double *)v15.i64, *(_OWORD *)&v15);
  -[AKBitmapFIFO setLastPoint:](self, "setLastPoint:", v16);
  MEMORY[0x24BEDD108](self, sel__applyDirtyRectToView);
}

- (void)_createBitmapContextIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  size_t v8;
  size_t v9;
  CGColorSpace *DeviceGray;
  CGColorSpace *v11;
  CGContext *v12;
  char *v13;

  -[AKBitmapFIFO _updateBitmapSizeFromViewIfNecessary](self, "_updateBitmapSizeFromViewIfNecessary");
  -[AKBitmapFIFO bitmapSize](self, "bitmapSize");
  v4 = v3;
  v5 = round(v3);
  -[AKBitmapFIFO bitmapSize](self, "bitmapSize");
  v7 = v6;
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", 0.0, 0.0, (double)(unint64_t)v5, (double)(unint64_t)round(v6))&& !self->_bitmapContext)
  {
    v8 = vcvtad_u64_f64(v4);
    v9 = vcvtad_u64_f64(v7);
    if (self->_bitmapDataPtr
      || is_mul_ok(v8, v9)
      && (v13 = (char *)malloc_type_calloc(v8 * v9, 1uLL, 0x100004077774924uLL), (self->_bitmapDataPtr = v13) != 0))
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      if (DeviceGray)
      {
        v11 = DeviceGray;
        if (!self->_bitmapContext)
        {
          v12 = CGBitmapContextCreate(self->_bitmapDataPtr, v8, v9, 8uLL, v8, DeviceGray, 0);
          self->_bitmapContext = v12;
          if (!v12)
            -[AKBitmapFIFO _clearAllBitmapData](self, "_clearAllBitmapData");
        }
        CGColorSpaceRelease(v11);
      }
    }
    else
    {
      -[AKBitmapFIFO _clearAllBitmapData](self, "_clearAllBitmapData");
    }
  }
}

- (void)_createBitmapIfNecessary
{
  CGContext *bitmapContext;

  if (!self->_bitmapImage)
  {
    -[AKBitmapFIFO _createBitmapContextIfNecessary](self, "_createBitmapContextIfNecessary");
    bitmapContext = self->_bitmapContext;
    if (bitmapContext)
      self->_bitmapImage = CGBitmapContextCreateImage(bitmapContext);
  }
}

- (void)_clearAllBitmapData
{
  CGImage *bitmapImage;
  CGContext *bitmapContext;
  char *bitmapDataPtr;

  bitmapImage = self->_bitmapImage;
  if (bitmapImage)
  {
    CGImageRelease(bitmapImage);
    self->_bitmapImage = 0;
  }
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    CGContextRelease(bitmapContext);
    self->_bitmapContext = 0;
  }
  bitmapDataPtr = self->_bitmapDataPtr;
  if (bitmapDataPtr)
  {
    free(bitmapDataPtr);
    self->_bitmapDataPtr = 0;
  }
}

- (void)_addSinglePointToBitmap:(AKBitmapFIFO *)self
{
  __int128 v2;
  CGContext *bitmapContext;
  id v5;
  CGContext *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  CGAffineTransform transform;
  CGRect v16;

  v14 = v2;
  bitmapContext = self->_bitmapContext;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(bitmapContext, (CGColorRef)objc_msgSend(v5, "CGColor"));

  CGContextSaveGState(self->_bitmapContext);
  v6 = self->_bitmapContext;
  -[AKBitmapFIFO viewToBitmapTransform](self, "viewToBitmapTransform");
  CGContextConcatCTM(v6, &transform);
  v16.origin.x = *(float *)&v14 - *((float *)&v14 + 2) * 0.5;
  v16.origin.y = *((float *)&v14 + 1) - *((float *)&v14 + 2) * 0.5;
  v16.size.width = *((float *)&v14 + 2);
  v16.size.height = *((float *)&v14 + 2);
  CGContextFillEllipseInRect(self->_bitmapContext, v16);
  -[AKBitmapFIFO shadowRadiusInView](self, "shadowRadiusInView");
  v8 = *(float *)&v14 - (*((float *)&v14 + 2) + v7 * 2.0) * 0.5;
  -[AKBitmapFIFO shadowRadiusInView](self, "shadowRadiusInView");
  v10 = *((float *)&v14 + 1) - (*((float *)&v14 + 2) + v9 * 2.0) * 0.5;
  -[AKBitmapFIFO shadowRadiusInView](self, "shadowRadiusInView");
  v12 = *((float *)&v14 + 2) + v11 * 2.0;
  -[AKBitmapFIFO shadowRadiusInView](self, "shadowRadiusInView");
  -[AKBitmapFIFO _addToDirtyRect:](self, "_addToDirtyRect:", v8, v10, v12, *((float *)&v14 + 2) + v13 * 2.0);
  CGContextRestoreGState(self->_bitmapContext);
}

- (void)_addToDirtyRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AKBitmapFIFO unionDirtyRect](self, "unionDirtyRect");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v9 = CGRectUnion(v8, v10);
  -[AKBitmapFIFO setUnionDirtyRect:](self, "setUnionDirtyRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (void)_applyDirtyRectToView
{
  id v3;
  CGRect v4;

  -[AKBitmapFIFO unionDirtyRect](self, "unionDirtyRect");
  if (!CGRectIsNull(v4))
  {
    -[AKBitmapFIFO view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[AKBitmapFIFO unionDirtyRect](self, "unionDirtyRect");
    objc_msgSend(v3, "setNeedsDisplayInRect:");

  }
}

- (double)bitmapSizeMultiplier
{
  return self->_bitmapSizeMultiplier;
}

- (void)setBitmapSizeMultiplier:(double)a3
{
  self->_bitmapSizeMultiplier = a3;
}

- (BOOL)isInLiveDraw
{
  return self->_isInLiveDraw;
}

- (UIView)view
{
  return self->_view;
}

- (CGAffineTransform)viewToBitmapTransform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_viewToBitmapTransform, 48, 1, 0);
  return result;
}

- (void)setViewToBitmapTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_viewToBitmapTransform, a3, 48, 1, 0);
}

- (double)shadowRadiusInView
{
  return self->_shadowRadiusInView;
}

- (void)setShadowRadiusInView:(double)a3
{
  self->_shadowRadiusInView = a3;
}

- (CGSize)bitmapSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_bitmapSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBitmapSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_bitmapSize, &v3, 16, 1, 0);
}

- (BOOL)bitmapSizeHasBeenUpdatedOnceForLiveDraw
{
  return self->_bitmapSizeHasBeenUpdatedOnceForLiveDraw;
}

- (void)setBitmapSizeHasBeenUpdatedOnceForLiveDraw:(BOOL)a3
{
  self->_bitmapSizeHasBeenUpdatedOnceForLiveDraw = a3;
}

- (double)lastPoint
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 112), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setLastPoint:(AKBitmapFIFO *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_lastPoint, &v3, 16, 1, 0);
}

- (CGRect)unionDirtyRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_unionDirtyRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUnionDirtyRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_unionDirtyRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
