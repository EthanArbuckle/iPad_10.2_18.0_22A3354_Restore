@implementation NUImageGeometry

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (NUImageGeometry)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_17349);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_17349);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_17349);
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
  _NUAssertFailHandler((uint64_t)"-[NUImageGeometry init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUImageGeometry.m", 29, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v6[2];

  var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](self, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v6, a4.var0, a4.var1, 1, 0, 0);
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v7[2];

  var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](self, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v7, a4.var0, a4.var1, a5, 0, 0);
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5 spaceMap:(id)a6
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  _OWORD v8[2];

  var1 = a3->var1;
  v8[0] = a3->var0;
  v8[1] = var1;
  return -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](self, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", v8, a4.var0, a4.var1, a5, a6, 0);
}

- (NUImageGeometry)initWithExtent:(id *)a3 renderScale:(id)a4 orientation:(int64_t)a5 spaceMap:(id)a6 roundingPolicy:(int64_t)a7
{
  int64_t var1;
  int64_t var0;
  id v14;
  void *v15;
  NUImageGeometry *v16;
  NUImageGeometry *v17;
  $0AC6E346AE4835514AAA8AC86D8F4844 v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  var1 = a4.var1;
  var0 = a4.var0;
  v41 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  if (var0 < 1 || var1 <= 0)
  {
    NUAssertLogger_17335();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(renderScale)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17335();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        v39 = 2114;
        v40 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUImageGeometry.m", 49, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"NUScaleIsValid(renderScale)");
  }
  v15 = v14;
  v36.receiver = self;
  v36.super_class = (Class)NUImageGeometry;
  v16 = -[NUImageGeometry init](&v36, sel_init);
  v17 = v16;
  if (v16)
  {
    v18 = a3->var1;
    v16->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
    v16->_extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v18;
    v16->_renderScale.numerator = var0;
    v16->_renderScale.denominator = var1;
    objc_storeStrong((id *)&v16->_spaceMap, a6);
    v17->_orientation = a5;
    v17->_roundingPolicy = a7;
  }

  return v17;
}

- (id)transformWithSourceSpace:(id)a3 destinationSpace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NUTaggedSpaceMapping *spaceMap;
  void *v12;
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
  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    NUAssertLogger_17335();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v15;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_17335();
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
    _NUAssertFailHandler((uint64_t)"-[NUImageGeometry transformWithSourceSpace:destinationSpace:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/NUImageGeometry.m", 64, CFSTR("Invalid parameter not satisfying: %s"), v26, v27, v28, v29, (uint64_t)"error != NULL");
  }
  v10 = v9;
  spaceMap = self->_spaceMap;
  if (spaceMap)
  {
    -[NUTaggedSpaceMapping transformWithSourceSpace:destinationSpace:error:](spaceMap, "transformWithSourceSpace:destinationSpace:error:", v8, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NUError errorWithCode:reason:object:](NUError, "errorWithCode:reason:object:", 3, CFSTR("no space map present"), 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (CGRect)scaledExtent
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGRect v10;

  v3 = -[NUImageGeometry renderScale](self, "renderScale");
  v5 = NUScaleToDouble(v3, v4);
  -[NUImageGeometry extent](self, "extent");
  v10.origin.x = v5 * (double)v6;
  v10.origin.y = v5 * (double)v7;
  v10.size.width = v5 * (double)v8;
  v10.size.height = v5 * (double)v9;
  return CGRectStandardize(v10);
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)physicalScaledExtent
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  $209B98C1CDF2DEBD503CBDE3C0ED7C90 *result;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10;
  _OWORD v11[2];
  CGRect v12;

  retstr->var0 = 0u;
  retstr->var1 = 0u;
  -[NUImageGeometry scaledExtent](self, "scaledExtent");
  v12.origin.x = v5;
  v12.origin.y = v6;
  v12.size.width = v7;
  v12.size.height = v8;
  result = ($209B98C1CDF2DEBD503CBDE3C0ED7C90 *)NU::RectT<long>::RectT(v11, &v12, -[NUImageGeometry roundingPolicy](self, "roundingPolicy"));
  v10 = ($0AC6E346AE4835514AAA8AC86D8F4844)v11[1];
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v11[0];
  retstr->var1 = v10;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaledSize
{
  int64_t v2;
  int64_t v3;
  __int128 v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v4 = 0u;
  -[NUImageGeometry physicalScaledExtent](self, "physicalScaledExtent", 0, 0);
  v3 = *((_QWORD *)&v4 + 1);
  v2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height;
  int64_t width;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  height = self->_extent.size.height;
  width = self->_extent.size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  __CFString *v11;
  int64_t v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  -[NUImageGeometry scaledExtent](self, "scaledExtent");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f, %f  %f, %f"), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld, %ld  %ld, %ld"), self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUImageGeometry orientation](self, "orientation");
  if ((unint64_t)(v9 - 9) >= 0xFFFFFFFFFFFFFFF8)
    v10 = v9;
  else
    v10 = 0;
  v11 = NUOrientationName_names[v10];
  v12 = -[NUImageGeometry roundingPolicy](self, "roundingPolicy");
  if ((unint64_t)(v12 - 1) > 3)
    v13 = CFSTR("Out");
  else
    v13 = off_1E5060D70[v12 - 1];
  v14 = v13;
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = -[NUImageGeometry scaledSize](self, "scaledSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("scaledImageSize : %@   scaledExtent : %@   extent, : %@   scale : %f   orientation : %@   rounding: %@"), v18, v7, v8, NUScaleToDouble(self->_renderScale.numerator, self->_renderScale.denominator), v11, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var0;

  var0 = self[2].var0;
  retstr->var0 = self[1].var1;
  retstr->var1 = var0;
  return self;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  int64_t denominator;
  int64_t numerator;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  denominator = self->_renderScale.denominator;
  numerator = self->_renderScale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NUTaggedSpaceMapping)spaceMap
{
  return self->_spaceMap;
}

- (int64_t)roundingPolicy
{
  return self->_roundingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaceMap, 0);
}

@end
