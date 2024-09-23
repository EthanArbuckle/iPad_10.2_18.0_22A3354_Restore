@implementation NUViewportRegionPolicy

- (NUViewportRegionPolicy)init
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
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_824);
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
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_824);
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
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_824);
  }
}

- (NUViewportRegionPolicy)initWithViewport:(id)a3
{
  id v4;
  void *v5;
  NUViewportRegionPolicy *v6;
  uint64_t v7;
  NUViewport *viewport;
  NSObject *v10;
  void *v11;
  const void **v12;
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
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_811();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "viewport != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_20D1BC000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_811();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x24BDD17F0];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_20D1BC000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_20D1BC000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  v23.receiver = self;
  v23.super_class = (Class)NUViewportRegionPolicy;
  v6 = -[NUViewportRegionPolicy init](&v23, sel_init);
  v7 = objc_msgSend(v5, "copy");
  viewport = v6->_viewport;
  v6->_viewport = (NUViewport *)v7;

  return v6;
}

- (id)regionForGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _OWORD v20[8];
  CGRect v21;

  v4 = a3;
  objc_msgSend(v4, "scaledExtent");
  v6 = v5;
  v8 = v7;
  -[NUViewport anchorPoint](self->_viewport, "anchorPoint");
  NUAbsolutePointInRect();
  v10 = v9;
  v12 = v11;
  -[NUViewport backingPosition](self->_viewport, "backingPosition");
  v14 = v10 - v13;
  v16 = v12 - v15;
  -[NUViewport backingSize](self->_viewport, "backingSize");
  v21.size.width = v17;
  v21.size.height = v18;
  v21.origin.x = v14;
  v21.origin.y = v16;
  CGRectOffset(v21, -v6, -v8);
  objc_msgSend(v4, "roundingPolicy");
  NUPixelRectFromCGRect();
  objc_msgSend(v4, "scaledSize");

  NUPixelRectIntersection();
  NUPixelRectFlipYOrigin();
  memset(v20, 0, sizeof(v20));
  objc_msgSend(MEMORY[0x24BE6C3F0], "regionWithRect:", v20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> viewport=%@"), objc_opt_class(), self, self->_viewport);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
