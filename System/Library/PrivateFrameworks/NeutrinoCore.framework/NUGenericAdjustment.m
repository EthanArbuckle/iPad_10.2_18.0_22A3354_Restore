@implementation NUGenericAdjustment

- (NUGenericAdjustment)initWithAdjustmentSchema:(id)a3
{
  NUGenericAdjustment *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *settings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUGenericAdjustment;
  v3 = -[NUAdjustment initWithAdjustmentSchema:](&v7, sel_initWithAdjustmentSchema_, a3);
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  settings = v3->_settings;
  v3->_settings = v4;

  return v3;
}

- (NSDictionary)settings
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_settings, "copy");
}

- (void)setSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *specific;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_13590();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "settings != nil");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_13590();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v13 = (void *)MEMORY[0x1E0CB3978];
        v14 = v12;
        objc_msgSend(v13, "callStackSymbols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v11;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUGenericAdjustment setSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUAdjustment.m", 223, CFSTR("Invalid parameter not satisfying: %s"), v17, v18, v19, v20, (uint64_t)"settings != nil");
  }
  v21 = v4;
  -[NSMutableDictionary setDictionary:](self->_settings, "setDictionary:", v4);

}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_settings, "objectForKey:", a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *settings;

  settings = self->_settings;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](settings, "removeObjectForKey:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
