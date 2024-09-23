@implementation NUSettingNode

- (NUSettingNode)initWithSetting:(id)a3
{
  id v4;
  void *v5;
  NUSettingNode *v6;
  NSObject *v8;
  void *v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4813();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "setting != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4813();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUSettingNode initWithSetting:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUPipeline.m", 1039, CFSTR("Invalid parameter not satisfying: %s"), v20, v21, v22, v23, (uint64_t)"setting != nil");
  }
  v5 = v4;
  v24.receiver = self;
  v24.super_class = (Class)NUSettingNode;
  v6 = -[NUControlNode initWithModel:](&v24, sel_initWithModel_, v4);

  return v6;
}

- (id)childNodeForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NUSettingNode *v10;

  v4 = a3;
  -[NUSettingNode setting](self, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
  {
    -[NUSettingNode setting](self, "setting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = -[NUSettingNode initWithSetting:]([NUSettingNode alloc], "initWithSetting:", v9);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }
  -[NUControlNode setParentNode:](v10, "setParentNode:", self);
  -[NUControlNode setChildKey:](v10, "setChildKey:", v4);

  return v10;
}

- (id)childNodeAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NUSettingNode *v9;

  -[NUSettingNode setting](self, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 5)
  {
    -[NUSettingNode setting](self, "setting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[NUSettingNode initWithSetting:]([NUSettingNode alloc], "initWithSetting:", v8);
  }
  else
  {
    v9 = 0;
  }
  -[NUControlNode setParentNode:](v9, "setParentNode:", self);
  -[NUControlNode setChildIndex:](v9, "setChildIndex:", a3);
  return v9;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NUSettingNode setting](self, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
  {
    -[NUControlNode value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)valueAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[NUSettingNode setting](self, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 5)
  {
    -[NUControlNode value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
