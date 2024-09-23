@implementation NUChannel

- (NUChannel)init
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
    dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
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
        dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_3589);
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
  _NUAssertFailHandler((uint64_t)"-[NUChannel init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 115, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (NUChannel)initWithName:(id)a3 format:(id)a4 index:(int64_t)a5
{
  id v8;
  NUChannelFormat *v9;
  NUChannelFormat *v10;
  NUChannel *v11;
  uint64_t v12;
  NSString *name;
  NUChannelFormat *format;
  NSObject *v16;
  void *v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NUChannelFormat *)a4;
  if (!v8)
  {
    NUAssertLogger_3656();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v17;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3656();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v31 = (void *)MEMORY[0x1E0CB3978];
        v32 = v30;
        objc_msgSend(v31, "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v30;
        v51 = 2114;
        v52 = v34;
        _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUChannel initWithName:format:index:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 119, CFSTR("Invalid parameter not satisfying: %s"), v35, v36, v37, v38, (uint64_t)"name != nil");
  }
  if (a5 < 0)
  {
    NUAssertLogger_3656();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "index >= 0");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v24;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3656();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      if (v27)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E0CB3978];
        v41 = v39;
        objc_msgSend(v40, "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        v51 = 2114;
        v52 = v43;
        _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUChannel initWithName:format:index:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 120, CFSTR("Invalid parameter not satisfying: %s"), v44, v45, v46, v47, (uint64_t)"index >= 0");
  }
  v10 = v9;
  v48.receiver = self;
  v48.super_class = (Class)NUChannel;
  v11 = -[NUChannel init](&v48, sel_init);
  v12 = objc_msgSend(v8, "copy");
  name = v11->_name;
  v11->_name = (NSString *)v12;

  format = v11->_format;
  v11->_format = v10;

  v11->_index = a5;
  return v11;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[NUChannel format](self, "format");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "channelType");

  return v3;
}

- (id)subchannelForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NUChannel *v7;

  v4 = a3;
  -[NUChannel format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subchannelFormatForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[NUChannel initWithName:format:index:]([NUChannel alloc], "initWithName:format:index:", v4, v6, 0);
  else
    v7 = 0;

  return v7;
}

- (id)subchannelAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  NUChannel *v7;
  void *v8;
  NUChannel *v9;

  -[NUChannel format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subchannelFormatAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [NUChannel alloc];
    -[NUChannel name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NUChannel initWithName:format:index:](v7, "initWithName:format:index:", v8, v6, a3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = 0xAA676A18E7 * -[NSString hash](self->_name, "hash");
  return (0xA0538F1583 * -[NUChannelFormat hash](self->_format, "hash")) ^ v3 ^ (0x641F3AC4E7 * self->_index);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NUChannel isEqualToChannel:](self, "isEqualToChannel:", v4);

  return v5;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  char v13;

  v4 = a3;
  v5 = -[NUChannel type](self, "type");
  if (v5 != objc_msgSend(v4, "type"))
    goto LABEL_5;
  v6 = -[NUChannel index](self, "index");
  if (v6 != objc_msgSend(v4, "index"))
    goto LABEL_5;
  -[NUChannel name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[NUChannel format](self, "format");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "format");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToChannelFormat:", v11);

    v13 = v12 ^ 1;
  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
}

- (BOOL)isCompatibleWithChannel:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[NUChannel type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[NUChannel format](self, "format");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isCompatibleWithChannelFormat:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NUChannel name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUChannel format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NUChannel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUChannel type](self, "type") - 1;
  if (v6 > 2)
    v7 = CFSTR("???");
  else
    v7 = off_1E5061168[v6];
  -[NUChannel format](self, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p id:%@ type:%@ format:%@ idx:%ld>"), v4, self, v5, v7, v9, -[NUChannel index](self, "index"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NUChannelFormat)format
{
  return self->_format;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (NUChannel)primary
{
  NUChannelMediaFormat *v2;
  NUChannel *v3;

  v2 = -[NUChannelMediaFormat initWithMediaType:]([NUChannelMediaFormat alloc], "initWithMediaType:", 1);
  v3 = -[NUChannel initWithName:format:index:]([NUChannel alloc], "initWithName:format:index:", CFSTR("primary"), v2, 0);

  return v3;
}

+ (id)disparity
{
  NUChannelMediaFormat *v2;
  NUChannel *v3;

  v2 = -[NUChannelMediaFormat initWithMediaType:]([NUChannelMediaFormat alloc], "initWithMediaType:", 3);
  v3 = -[NUChannel initWithName:format:index:]([NUChannel alloc], "initWithName:format:index:", CFSTR("disparity"), v2, 0);

  return v3;
}

+ (id)controlChannelWithSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  void *v14;
  void *specific;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_3656();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "schema != nil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3656();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v21 = (void *)MEMORY[0x1E0CB3978];
        v22 = v20;
        objc_msgSend(v21, "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        v31 = 2114;
        v32 = v24;
        _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v19;
      _os_log_error_impl(&dword_1A6553000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUChannel controlChannelWithSchema:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 109, CFSTR("Invalid parameter not satisfying: %s"), v25, v26, v27, v28, (uint64_t)"schema != nil");
  }
  v5 = v4;
  +[NUChannelControlFormat controlFormatWithSchema:](NUChannelControlFormat, "controlFormatWithSchema:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)a1);
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:format:index:", v10, v6, 0);

  return v11;
}

@end
