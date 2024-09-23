@implementation NUBrushStrokeMaskIntersector

- (NUBrushStrokeMaskIntersector)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14842);
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_14842);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14842);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUBrushStrokeMaskIntersector init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUBrushStrokeMaskIntersector.m", 46, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUBrushStrokeMaskIntersector)initWithBrushMask:(id)a3 mask:(id)a4 strokeScale:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v10;
  id v11;
  NUBrushStrokeMaskIntersector *v12;
  void **p_brushStrokeMaskImage;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CIImage *brushStrokeMaskImage;
  uint64_t v26;
  CIImage *maskImage;
  void *v28;
  uint64_t v29;
  CIImage *intersectionImage;
  void *v31;
  uint64_t v32;
  CIImage *brushMinusMaskImage;
  NUHistogramCalculator *v34;
  NUHistogramCalculator *histogramCalculator;
  CGAffineTransform v37;
  CGAffineTransform v38;
  objc_super v39;

  var1 = a5.var1;
  var0 = a5.var0;
  v10 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NUBrushStrokeMaskIntersector;
  v11 = a4;
  v12 = -[NUBrushStrokeMaskIntersector init](&v39, sel_init);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  v12->_signpost = os_signpost_id_make_with_pointer((os_log_t)_NULogger, v12);
  p_brushStrokeMaskImage = (void **)&v12->_brushStrokeMaskImage;
  objc_storeStrong((id *)&v12->_brushStrokeMaskImage, a3);
  if (!NUScaleEqual(var0, var1, NUScaleOne, *((uint64_t *)&NUScaleOne + 1)))
  {
    v14 = NUScaleToDouble(var0, var1);
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformMakeScale(&v38, v14, v14);
    v15 = *p_brushStrokeMaskImage;
    v37 = v38;
    objc_msgSend(v15, "imageByApplyingTransform:", &v37);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *p_brushStrokeMaskImage;
    *p_brushStrokeMaskImage = (void *)v16;

  }
  v18 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithColor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[CIImage imageByCompositingOverImage:](v12->_brushStrokeMaskImage, "imageByCompositingOverImage:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v11, "size");
  objc_msgSend(v21, "imageByCroppingToRect:", 0.0, 0.0, (double)v22, (double)v23);
  v24 = objc_claimAutoreleasedReturnValue();
  brushStrokeMaskImage = v12->_brushStrokeMaskImage;
  v12->_brushStrokeMaskImage = (CIImage *)v24;

  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithNUImageBuffer:", v11);
  v26 = objc_claimAutoreleasedReturnValue();

  maskImage = v12->_maskImage;
  v12->_maskImage = (CIImage *)v26;

  objc_msgSend(MEMORY[0x1E0C9DDB8], "multiplyCompositingFilter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInputImage:", v12->_maskImage);
  objc_msgSend(v28, "setBackgroundImage:", v12->_brushStrokeMaskImage);
  objc_msgSend(v28, "outputImage");
  v29 = objc_claimAutoreleasedReturnValue();
  intersectionImage = v12->_intersectionImage;
  v12->_intersectionImage = (CIImage *)v29;

  objc_msgSend(MEMORY[0x1E0C9DDB8], "subtractBlendModeFilter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setInputImage:", v12->_maskImage);
  objc_msgSend(v31, "setBackgroundImage:", v12->_brushStrokeMaskImage);
  objc_msgSend(v31, "outputImage");
  v32 = objc_claimAutoreleasedReturnValue();
  brushMinusMaskImage = v12->_brushMinusMaskImage;
  v12->_brushMinusMaskImage = (CIImage *)v32;

  v34 = objc_alloc_init(NUHistogramCalculator);
  histogramCalculator = v12->_histogramCalculator;
  v12->_histogramCalculator = v34;

  return v12;
}

- (NUHistogram)brushHistogram
{
  NUHistogram *brushHistogram;
  void *v4;
  void *v5;
  NUHistogram *v6;
  NUHistogram *v7;

  brushHistogram = self->_brushHistogram;
  if (!brushHistogram)
  {
    -[NUBrushStrokeMaskIntersector histogramCalculator](self, "histogramCalculator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUBrushStrokeMaskIntersector brushStrokeMaskImage](self, "brushStrokeMaskImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "computeHistogramFromMatte:", v5);
    v6 = (NUHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = self->_brushHistogram;
    self->_brushHistogram = v6;

    brushHistogram = self->_brushHistogram;
  }
  return brushHistogram;
}

- (NUHistogram)maskHistogram
{
  NUHistogram *maskHistogram;
  void *v4;
  void *v5;
  NUHistogram *v6;
  NUHistogram *v7;

  maskHistogram = self->_maskHistogram;
  if (!maskHistogram)
  {
    -[NUBrushStrokeMaskIntersector histogramCalculator](self, "histogramCalculator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUBrushStrokeMaskIntersector maskImage](self, "maskImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "computeHistogramFromMatte:", v5);
    v6 = (NUHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = self->_maskHistogram;
    self->_maskHistogram = v6;

    maskHistogram = self->_maskHistogram;
  }
  return maskHistogram;
}

- (NUHistogram)intersectionHistogram
{
  NUHistogram *intersectionHistogram;
  void *v4;
  void *v5;
  NUHistogram *v6;
  NUHistogram *v7;

  intersectionHistogram = self->_intersectionHistogram;
  if (!intersectionHistogram)
  {
    -[NUBrushStrokeMaskIntersector histogramCalculator](self, "histogramCalculator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUBrushStrokeMaskIntersector intersectionImage](self, "intersectionImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "computeHistogramFromMatte:", v5);
    v6 = (NUHistogram *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intersectionHistogram;
    self->_intersectionHistogram = v6;

    intersectionHistogram = self->_intersectionHistogram;
  }
  return intersectionHistogram;
}

- (double)calculateOverlapOfHistogram:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v14;
  void *v15;
  void *specific;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_14830();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "imageHistogram != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_14830();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v22 = (void *)MEMORY[0x1E0CB3978];
        v23 = v21;
        objc_msgSend(v22, "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v25;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBrushStrokeMaskIntersector calculateOverlapOfHistogram:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUBrushStrokeMaskIntersector.m", 107, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"imageHistogram != nil");
  }
  v5 = v4;
  -[NUBrushStrokeMaskIntersector histogramCalculator](self, "histogramCalculator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1.0 / (double)objc_msgSend(v6, "binCount");

  -[NUBrushStrokeMaskIntersector intersectionHistogram](self, "intersectionHistogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threshold:", v7);
  v10 = v9;

  objc_msgSend(v5, "threshold:", v7);
  v12 = v11;

  return v10 / v12;
}

- (double)brushPercentInsideMask
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpost;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  v3 = (id)_NULogger;
  v4 = v3;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "NUBrushStrokeMaskIntersector.brushPercentInsideMask", (const char *)&unk_1A6745721, buf, 2u);
  }

  -[NUBrushStrokeMaskIntersector brushHistogram](self, "brushHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUBrushStrokeMaskIntersector calculateOverlapOfHistogram:](self, "calculateOverlapOfHistogram:", v6);
  v8 = v7;

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  v9 = (id)_NULogger;
  v10 = v9;
  v11 = self->_signpost;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NUBrushStrokeMaskIntersector.brushPercentInsideMask", (const char *)&unk_1A6745721, v13, 2u);
  }

  return v8;
}

- (double)maskPercentInsideBrush
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpost;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  v3 = (id)_NULogger;
  v4 = v3;
  signpost = self->_signpost;
  if (signpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v4, OS_SIGNPOST_INTERVAL_BEGIN, signpost, "NUBrushStrokeMaskIntersector.maskPercentInsideBrush", (const char *)&unk_1A6745721, buf, 2u);
  }

  -[NUBrushStrokeMaskIntersector maskHistogram](self, "maskHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUBrushStrokeMaskIntersector calculateOverlapOfHistogram:](self, "calculateOverlapOfHistogram:", v6);
  v8 = v7;

  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  v9 = (id)_NULogger;
  v10 = v9;
  v11 = self->_signpost;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NUBrushStrokeMaskIntersector.maskPercentInsideBrush", (const char *)&unk_1A6745721, v13, 2u);
  }

  return v8;
}

- (CIImage)intersectionImage
{
  return self->_intersectionImage;
}

- (CIImage)brushMinusMaskImage
{
  return self->_brushMinusMaskImage;
}

- (NUHistogramCalculator)histogramCalculator
{
  return self->_histogramCalculator;
}

- (CIImage)brushStrokeMaskImage
{
  return self->_brushStrokeMaskImage;
}

- (CIImage)maskImage
{
  return self->_maskImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_brushStrokeMaskImage, 0);
  objc_storeStrong((id *)&self->_histogramCalculator, 0);
  objc_storeStrong((id *)&self->_brushMinusMaskImage, 0);
  objc_storeStrong((id *)&self->_intersectionImage, 0);
  objc_storeStrong((id *)&self->_intersectionHistogram, 0);
  objc_storeStrong((id *)&self->_maskHistogram, 0);
  objc_storeStrong((id *)&self->_brushHistogram, 0);
}

@end
