@implementation NUImageTransformAffine

- (NUImageTransformAffine)initWithAffineTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 *v6;
  __int128 v7;
  _BOOL4 v8;
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *specific;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v6 = (__int128 *)MEMORY[0x1E0C9BAA8];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v8 = CGAffineTransformEqualToTransform(&t1, &t2);
  v40.receiver = self;
  v40.super_class = (Class)NUImageTransformAffine;
  v9 = -[NUImageTransformAffine init](&v40, sel_init);
  v10 = v9;
  if (v9)
  {
    v12 = *(_OWORD *)&a3->c;
    v11 = *(_OWORD *)&a3->tx;
    *(_OWORD *)(v9 + 56) = *(_OWORD *)&a3->a;
    *(_OWORD *)(v9 + 72) = v12;
    *(_OWORD *)(v9 + 88) = v11;
    v13 = v9 + 8;
    if (v8)
    {
      v14 = *v6;
      v15 = v6[2];
      *(_OWORD *)(v9 + 24) = v6[1];
      *(_OWORD *)(v9 + 40) = v15;
      *v13 = v14;
      return (NUImageTransformAffine *)v10;
    }
    v16 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformInvert(&t1, &t2);
    v17 = *(_OWORD *)&t1.a;
    v18 = *(_OWORD *)&t1.tx;
    *(_OWORD *)(v10 + 24) = *(_OWORD *)&t1.c;
    *(_OWORD *)(v10 + 40) = v18;
    *v13 = v17;
    if (fabs(*((double *)v10 + 1) * *((double *)v10 + 4) - *((double *)v10 + 2) * *((double *)v10 + 3)) > 1.0e-12)
      return (NUImageTransformAffine *)v10;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
    v19 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = v19;
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Supplied transform is not invertible"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(t1.a) = 138543362;
      *(_QWORD *)((char *)&t1.a + 4) = v22;
      _os_log_impl(&dword_1A6553000, v21, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&t1, 0xCu);

      v23 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v23 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
LABEL_12:
        v24 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v30 = (void *)MEMORY[0x1E0CB3978];
          v31 = specific;
          v32 = v24;
          objc_msgSend(v30, "callStackSymbols");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(t1.a) = 138543618;
          *(_QWORD *)((char *)&t1.a + 4) = specific;
          WORD2(t1.b) = 2114;
          *(_QWORD *)((char *)&t1.b + 6) = v34;
          _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&t1, 0x16u);

LABEL_20:
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v23 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_12;
    }
    v35 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)MEMORY[0x1E0CB3978];
      v32 = v35;
      objc_msgSend(v37, "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(t1.a) = 138543362;
      *(_QWORD *)((char *)&t1.a + 4) = v39;
      _os_log_error_impl(&dword_1A6553000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&t1, 0xCu);

      goto LABEL_20;
    }
LABEL_17:
    _NUAssertContinueHandler((uint64_t)"-[NUImageTransformAffine initWithAffineTransform:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 154, CFSTR("Supplied transform is not invertible"), v25, v26, v27, v28, (uint64_t)v40.receiver);
  }
  return (NUImageTransformAffine *)v10;
}

- (NUImageTransformAffine)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_16879);
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
  _NUAssertFailHandler((uint64_t)"-[NUImageTransformAffine init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 163, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (id)inverseTransform
{
  NUImageTransformAffine *v3;
  __int128 v4;
  _OWORD v6[3];

  v3 = [NUImageTransformAffine alloc];
  v4 = *(_OWORD *)&self->_transformInv.c;
  v6[0] = *(_OWORD *)&self->_transformInv.a;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&self->_transformInv.tx;
  return -[NUImageTransformAffine initWithAffineTransform:](v3, "initWithAffineTransform:", v6);
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  CGPoint result;

  v3 = vaddq_f64(*(float64x2_t *)&self->_transform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transform.c, a3.y), *(float64x2_t *)&self->_transform.a, a3.x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (BOOL)isIdentityImageTransform
{
  __int128 v2;
  CGAffineTransform v4;

  v2 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v4.c = v2;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformIsIdentity(&v4);
}

- (_QWORD)transformMatrix:(_OWORD *)a3@<X8>
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  __int128 v14;
  __int128 v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t *v18;
  _OWORD v19[8];

  v3 = 0;
  *(_QWORD *)&v4 = result[8];
  *((_QWORD *)&v4 + 1) = result[10];
  *(_QWORD *)&v5 = 0;
  *((_QWORD *)&v5 + 1) = result[12];
  v7 = *a2;
  v6 = a2[1];
  v9 = a2[2];
  v8 = a2[3];
  v11 = a2[4];
  v10 = a2[5];
  v13 = a2[6];
  v12 = a2[7];
  v19[2] = v4;
  v19[3] = v5;
  v14 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 64);
  v19[5] = v14;
  v15 = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E0C83FD8] + 96);
  v19[7] = v15;
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
    v17 = (float64x2_t)v19[v3];
    v16 = (float64x2_t)v19[v3 + 1];
    v18 = (float64x2_t *)&a3[v3];
    *v18 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v7, v17.f64[0]), v9, v17, 1), v11, v16.f64[0]), v13, v16, 1);
    v18[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v6, v17.f64[0]), v8, v17, 1), v10, v16.f64[0]), v12, v16, 1);
    v3 += 2;
  }
  while (v3 != 8);
  return result;
}

- (id)transformByScaleX:(double)a3 scaleY:(double)a4
{
  __int128 v4;
  NUImageTransformAffine *v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformScale(&v8, &v7, a3, a4);
  v5 = [NUImageTransformAffine alloc];
  v7 = v8;
  return -[NUImageTransformAffine initWithAffineTransform:](v5, "initWithAffineTransform:", &v7);
}

- (id)transformByTranslateX:(double)a3 translateY:(double)a4
{
  __int128 v4;
  NUImageTransformAffine *v5;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v4 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformTranslate(&v8, &v7, a3, a4);
  v5 = [NUImageTransformAffine alloc];
  v7 = v8;
  return -[NUImageTransformAffine initWithAffineTransform:](v5, "initWithAffineTransform:", &v7);
}

- (id)transformByRotateZ:(double)a3
{
  __int128 v3;
  NUImageTransformAffine *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v6.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tx = *(_OWORD *)&self->_transform.tx;
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformRotate(&v7, &v6, a3 * 3.14159265 / 180.0);
  v4 = [NUImageTransformAffine alloc];
  v6 = v7;
  return -[NUImageTransformAffine initWithAffineTransform:](v4, "initWithAffineTransform:", &v6);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NUImageTransformAffine  a=%f b=%f c=%f d=%f tx=%f ty=%f"), *(_QWORD *)&self->_transform.a, *(_QWORD *)&self->_transform.b, *(_QWORD *)&self->_transform.c, *(_QWORD *)&self->_transform.d, *(_QWORD *)&self->_transform.tx, *(_QWORD *)&self->_transform.ty);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_transform.a+ self->_transform.b+ self->_transform.b+ self->_transform.c * 3.0+ self->_transform.d * 5.0+ self->_transform.tx * 7.0+ self->_transform.ty * 11.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NUImageTransformAffine *v4;
  BOOL v5;

  v4 = (NUImageTransformAffine *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NUImageTransformAffine isEqualToGeometryTransformAffine:](self, "isEqualToGeometryTransformAffine:", v4);
  }

  return v5;
}

- (BOOL)isEqualToGeometryTransformAffine:(id)a3
{
  char *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  BOOL v9;
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
  CGAffineTransform t2;
  CGAffineTransform t1;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (!v4)
  {
    NUAssertLogger_16917();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "other != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(t1.a) = 138543362;
      *(_QWORD *)((char *)&t1.a + 4) = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&t1, 0xCu);

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
        LODWORD(t1.a) = 138543618;
        *(_QWORD *)((char *)&t1.a + 4) = v18;
        WORD2(t1.b) = 2114;
        *(_QWORD *)((char *)&t1.b + 6) = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&t1, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(t1.a) = 138543362;
      *(_QWORD *)((char *)&t1.a + 4) = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&t1, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransformAffine isEqualToGeometryTransformAffine:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 242, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"other != nil");
  }
  v5 = v4;
  v6 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  v7 = *(_OWORD *)(v4 + 56);
  v8 = *(_OWORD *)(v4 + 88);
  *(_OWORD *)&t2.c = *(_OWORD *)(v4 + 72);
  *(_OWORD *)&t2.tx = v8;
  *(_OWORD *)&t2.a = v7;
  v9 = CGAffineTransformEqualToTransform(&t1, &t2);

  return v9;
}

- (void)nu_updateDigest:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addCString:", "NUImageTransformAffine");
  objc_msgSend(v4, "addBytes:length:", &self->_transform, 48);

}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

@end
