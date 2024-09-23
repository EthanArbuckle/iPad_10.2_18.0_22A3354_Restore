@implementation NUViewport

- (NUViewport)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)MEMORY[0x24BE6C478];
  if (*MEMORY[0x24BE6C478] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x24BE6C468];
    v5 = (void *)*MEMORY[0x24BE6C468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C468], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_775);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x24BDD17F0];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_775);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
    {
      goto LABEL_7;
    }
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
      v20 = (void *)MEMORY[0x24BDD17F0];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_775);
  }
}

- (NUViewport)initWithSize:(CGSize)a3
{
  return -[NUViewport initWithSize:backingScaleFactor:](self, "initWithSize:backingScaleFactor:", a3.width, a3.height, 1.0);
}

- (NUViewport)initWithSize:(CGSize)a3 backingScaleFactor:(double)a4
{
  CGFloat height;
  CGFloat width;
  NUViewport *result;
  NSObject *v8;
  const void **v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  const void **v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  const void **v21;
  void *v22;
  int v23;
  void *v24;
  const void **v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  const void **v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a3.width <= 0.0)
  {
    NUAssertLogger_755();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "size.width > 0.0");
      v9 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v9;
      _os_log_error_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_755();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v26 = dispatch_get_specific(*v10);
        v27 = (void *)MEMORY[0x24BDD17F0];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v10 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v26;
        v42 = 2114;
        v43 = v29;
        _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v18 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  height = a3.height;
  if (a3.height <= 0.0)
  {
    NUAssertLogger_755();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "size.height > 0.0");
      v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v16;
      _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x24BE6C280];
    v17 = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_755();
    v12 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v17)
    {
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v10 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v10;
        _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      v23 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v18)
    {
      v30 = dispatch_get_specific(*v10);
      v31 = (void *)MEMORY[0x24BDD17F0];
      v32 = v30;
      objc_msgSend(v31, "callStackSymbols");
      v10 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v30;
      v42 = 2114;
      v43 = v33;
      _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (a4 <= 0.0)
  {
    NUAssertLogger_755();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "factor > 0.0");
      v21 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v21;
      _os_log_error_impl(&dword_20D1BC000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x24BE6C280];
    v22 = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_755();
    v12 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v22)
    {
      if (v23)
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v25 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v25;
        _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v23)
    {
      v34 = dispatch_get_specific(*v10);
      v35 = (void *)MEMORY[0x24BDD17F0];
      v36 = v34;
      objc_msgSend(v35, "callStackSymbols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("\n"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v34;
      v42 = 2114;
      v43 = v38;
      _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  width = a3.width;
  v39.receiver = self;
  v39.super_class = (Class)NUViewport;
  result = -[NUViewport init](&v39, sel_init);
  result->_size.width = width;
  result->_size.height = height;
  result->_backingScaleFactor = a4;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p size=%gx%g scale=%g position:(%g,%g) anchor:(%g,%g)>"), objc_opt_class(), self, *(_QWORD *)&self->_size.width, *(_QWORD *)&self->_size.height, *(_QWORD *)&self->_backingScaleFactor, *(_QWORD *)&self->_position.x, *(_QWORD *)&self->_position.y, *(_QWORD *)&self->_anchorPoint.x, *(_QWORD *)&self->_anchorPoint.y);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *((_OWORD *)result + 1) = self->_size;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_backingScaleFactor;
  *((_OWORD *)result + 2) = self->_position;
  *((_OWORD *)result + 3) = self->_anchorPoint;
  return result;
}

- (CGSize)backingSize
{
  double backingScaleFactor;
  double v3;
  double v4;
  CGSize result;

  backingScaleFactor = self->_backingScaleFactor;
  v3 = self->_size.width * backingScaleFactor;
  v4 = backingScaleFactor * self->_size.height;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)backingPosition
{
  double backingScaleFactor;
  double v3;
  double v4;
  CGPoint result;

  backingScaleFactor = self->_backingScaleFactor;
  v3 = self->_position.x * backingScaleFactor;
  v4 = backingScaleFactor * self->_position.y;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

@end
