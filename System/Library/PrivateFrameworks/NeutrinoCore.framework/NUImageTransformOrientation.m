@implementation NUImageTransformOrientation

- (NUImageTransformOrientation)init
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *specific;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
      goto LABEL_8;
    }
    if (v8 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB3978];
    v11 = v9;
    objc_msgSend(v10, "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v16 = (void *)MEMORY[0x1E0CB3978];
  v17 = specific;
  v11 = v14;
  objc_msgSend(v16, "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 518, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v22, v23, v24, v25, v21);
}

- (NUImageTransformOrientation)initWithOrientation:(int64_t)a3 imageSize:(id)a4
{
  return -[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:](self, "initWithOrientation:imageSize:imageOrigin:", a3, a4.var0, a4.var1, 0, 0);
}

- (NUImageTransformOrientation)initWithOrientation:(int64_t)a3 imageSize:(id)a4 imageOrigin:(id)a5
{
  int64_t var1;
  int64_t var0;
  int64_t v7;
  int64_t v8;
  NUImageTransformOrientation *result;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) >= 8)
  {
    NUAssertLogger_16917();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(orientation)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16917();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 527, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"NUOrientationIsValid(orientation)");
  }
  var1 = a5.var1;
  var0 = a5.var0;
  v7 = a4.var1;
  v8 = a4.var0;
  v27.receiver = self;
  v27.super_class = (Class)NUImageTransformOrientation;
  result = -[NUImageTransformOrientation init](&v27, sel_init);
  result->_inputImageSize.width = v8;
  result->_inputImageSize.height = v7;
  result->_inputImageOrigin.x = var0;
  result->_inputImageOrigin.y = var1;
  result->_orientation = a3;
  return result;
}

- (id)inverseTransform
{
  int64_t orientation;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t y;
  int64_t x;
  int64_t v10;
  int64_t v11;

  orientation = self->_orientation;
  v4 = 6;
  if (orientation != 8)
    v4 = self->_orientation;
  if (orientation == 6)
    v5 = 8;
  else
    v5 = v4;
  v7 = NUOrientationTransformImageSize(v5, self->_inputImageSize.width, self->_inputImageSize.height);
  x = self->_inputImageOrigin.x;
  y = self->_inputImageOrigin.y;
  if ((unint64_t)(v5 - 5) >= 4)
    v10 = self->_inputImageOrigin.x;
  else
    v10 = self->_inputImageOrigin.y;
  if ((unint64_t)(v5 - 5) >= 4)
    v11 = y;
  else
    v11 = x;
  return -[NUImageTransformOrientation initWithOrientation:imageSize:imageOrigin:]([NUImageTransformOrientation alloc], "initWithOrientation:imageSize:imageOrigin:", v5, v7, v6, v10, v11);
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  int64_t width;
  int64_t height;
  int64_t orientation;
  int64_t v6;
  int64_t v7;
  float64x2_t v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double y;
  double x;
  float64x2_t buf[2];
  float64x2_t v30;
  uint64_t v31;
  CGPoint result;

  v31 = *MEMORY[0x1E0C80C00];
  width = self->_inputImageSize.width;
  if (width < 1 || (height = self->_inputImageSize.height, height <= 0))
  {
    NUAssertLogger_16917();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid image size"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].f64[0]) = 138543362;
      *(_QWORD *)((char *)buf[0].f64 + 4) = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16917();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].f64[0]) = 138543618;
        *(_QWORD *)((char *)buf[0].f64 + 4) = v17;
        WORD2(buf[0].f64[1]) = 2114;
        *(_QWORD *)((char *)&buf[0].f64[1] + 6) = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0].f64[0]) = 138543362;
      *(_QWORD *)((char *)buf[0].f64 + 4) = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation transformPoint:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 551, CFSTR("invalid image size"), v22, v23, v24, v25, v26);
  }
  y = a3.y;
  x = a3.x;
  orientation = self->_orientation;
  v6 = self->_inputImageOrigin.x;
  v7 = self->_inputImageOrigin.y;
  v30 = 0u;
  memset(buf, 0, sizeof(buf));
  NUOrientationMakeTransformWithSizeAndOrigin(orientation, width, height, v6, v7, (uint64_t)buf);
  v8 = vaddq_f64(v30, vmlaq_n_f64(vmulq_n_f64(buf[1], y), buf[0], x));
  v9 = v8.f64[1];
  result.x = v8.f64[0];
  result.y = v9;
  return result;
}

- (CGAffineTransform)transformMatrix:(_OWORD *)a3@<X8>
{
  CGAffineTransform *result;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  __int128 v19;
  __int128 v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t *v23;
  _OWORD v24[8];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  result = NUOrientationMakeTransformWithSizeAndOrigin(a1[5], a1[1], a1[2], a1[3], a1[4], (uint64_t)&v25);
  v6 = 0;
  *(_QWORD *)&v8 = *((_QWORD *)&v25 + 1);
  *(_QWORD *)&v7 = v25;
  *((_QWORD *)&v7 + 1) = v26;
  *(_QWORD *)&v9 = 0;
  *((_QWORD *)&v9 + 1) = v27;
  *((_QWORD *)&v8 + 1) = *((_QWORD *)&v26 + 1);
  *(_QWORD *)&v10 = 0;
  *((_QWORD *)&v10 + 1) = *((_QWORD *)&v27 + 1);
  v12 = *a2;
  v11 = a2[1];
  v14 = a2[2];
  v13 = a2[3];
  v16 = a2[4];
  v15 = a2[5];
  v18 = a2[6];
  v17 = a2[7];
  v24[0] = v7;
  v24[1] = v9;
  v24[2] = v8;
  v24[3] = v10;
  v19 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
  v24[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
  v24[5] = v19;
  v20 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 112);
  v24[6] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 96);
  v24[7] = v20;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  do
  {
    v22 = (float64x2_t)v24[v6];
    v21 = (float64x2_t)v24[v6 + 1];
    v23 = (float64x2_t *)&a3[v6];
    *v23 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v12, v22.f64[0]), v14, v22, 1), v16, v21.f64[0]), v18, v21, 1);
    v23[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v11, v22.f64[0]), v13, v22, 1), v15, v21.f64[0]), v17, v21, 1);
    v6 += 2;
  }
  while (v6 != 8);
  return result;
}

- (BOOL)isIdentityImageTransform
{
  CGAffineTransform v3;
  CGAffineTransform v4;

  memset(&v4, 0, sizeof(v4));
  NUOrientationMakeTransformWithSizeAndOrigin(self->_orientation, self->_inputImageSize.width, self->_inputImageSize.height, self->_inputImageOrigin.x, self->_inputImageOrigin.y, (uint64_t)&v4);
  v3 = v4;
  return CGAffineTransformIsIdentity(&v3);
}

- (unint64_t)hash
{
  return 0xF012E5E162C2FLL * self->_orientation;
}

- (BOOL)isEqual:(id)a3
{
  NUImageTransformOrientation *v4;
  BOOL v5;

  v4 = (NUImageTransformOrientation *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NUImageTransformOrientation isEqualToGeometryTransformOrientation:](self, "isEqualToGeometryTransformOrientation:", v4);
  }

  return v5;
}

- (BOOL)isEqualToGeometryTransformOrientation:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  NSObject *v7;
  void *v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_16917();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_error_impl(&dword_1A6553000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_16917();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformOrientation isEqualToGeometryTransformOrientation:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 594, CFSTR("Invalid parameter not satisfying: %s"), v19, v20, v21, v22, (uint64_t)"other != nil");
  }
  v5 = self->_orientation == v4[5];

  return v5;
}

- (void)nu_updateDigest:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addCString:", "NUImageTransformOrientation");
  objc_msgSend(v4, "addBytes:length:", &self->_orientation, 8);

}

- (id)description
{
  void *v2;
  int64_t orientation;
  __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  orientation = self->_orientation;
  if ((unint64_t)(orientation - 9) < 0xFFFFFFFFFFFFFFF8)
    orientation = 0;
  v4 = NUOrientationName_names[orientation];
  objc_msgSend(v2, "stringWithFormat:", CFSTR("NUImageTransformOrientation: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end
