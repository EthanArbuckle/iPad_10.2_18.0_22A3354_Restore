@implementation NUGenericComposition

- (NSDictionary)contents
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_contents, "copy");
}

- (void)setContents:(id)a3
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
    NUAssertLogger_79();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "contents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_error_impl(&dword_1A6553000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_79();
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
    _NUAssertFailHandler((uint64_t)"-[NUGenericComposition setContents:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Adjustments/NUComposition.m", 199, CFSTR("Invalid parameter not satisfying: %s"), v17, v18, v19, v20, (uint64_t)"contents");
  }
  v21 = v4;
  -[NSMutableDictionary setDictionary:](self->_contents, "setDictionary:", v4);

}

- (NUGenericComposition)initWithCompositionSchema:(id)a3
{
  NUGenericComposition *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *contents;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUGenericComposition;
  v3 = -[NUComposition initWithCompositionSchema:](&v7, sel_initWithCompositionSchema_, a3);
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  contents = v3->_contents;
  v3->_contents = v4;

  return v3;
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *contents;

  contents = self->_contents;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](contents, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](contents, "removeObjectForKey:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
