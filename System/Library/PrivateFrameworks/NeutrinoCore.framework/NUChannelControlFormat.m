@implementation NUChannelControlFormat

- (NUChannelControlFormat)init
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
  _NUAssertFailHandler((uint64_t)"-[NUChannelControlFormat init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 311, CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v24, v25, v26, v27, v23);
}

- (int64_t)channelType
{
  return 2;
}

- (NUChannelControlFormat)initWithControlType:(int64_t)a3 dataModel:(id)a4
{
  NUModel *v6;
  NUModel *v7;
  NUChannelControlFormat *v8;
  NUModel *dataModel;
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
  v6 = (NUModel *)a4;
  if (!v6)
  {
    NUAssertLogger_3656();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dataModel != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_3656();
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
    _NUAssertFailHandler((uint64_t)"-[NUChannelControlFormat initWithControlType:dataModel:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/API/NUChannel.m", 319, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"dataModel != nil");
  }
  v7 = v6;
  v27.receiver = self;
  v27.super_class = (Class)NUChannelControlFormat;
  v8 = -[NUChannelControlFormat init](&v27, sel_init);
  v8->_controlType = a3;
  dataModel = v8->_dataModel;
  v8->_dataModel = v7;

  return v8;
}

- (id)subchannelFormatForKey:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NUChannelControlFormat controlType](self, "controlType");
  if (v5 == 1)
  {
    -[NUChannelControlFormat dataModel](self, "dataModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "type");
    if (v8 <= 6)
    {
      if (v8 == 4)
      {
        objc_msgSend(v6, "properties");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
        v15 = v7;
        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          +[NUChannelControlFormat controlFormatWithSetting:](NUChannelControlFormat, "controlFormatWithSetting:", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_22:
          v10 = 0;
        }
LABEL_25:

        goto LABEL_26;
      }
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_326);
      v9 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
LABEL_28:
        v17 = v9;
        -[NUChannelControlFormat description](self, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v18;
        v21 = 2112;
        v22 = v4;
        _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Unsupported subchannel format %@:%@", (uint8_t *)&v19, 0x16u);

      }
    }
LABEL_15:
    v10 = 0;
LABEL_26:

    goto LABEL_27;
  }
  if (v5 == 2)
  {
    -[NUChannelControlFormat dataModel](self, "dataModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v6, "type"))
    {
      case 0:
      case 2:
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_326);
        v9 = (void *)_NULogger;
        if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        goto LABEL_28;
      case 1:
      case 3:
        objc_msgSend(v6, "settings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 4:
        objc_msgSend(v6, "contents");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_22;
        +[NUSchemaRegistry sharedRegistry](NUSchemaRegistry, "sharedRegistry");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "schemaWithIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          +[NUChannelControlFormat controlFormatWithSchema:](NUChannelControlFormat, "controlFormatWithSchema:", v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        break;
      default:
        goto LABEL_15;
    }
    goto LABEL_25;
  }
  v10 = 0;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUChannelControlFormat;
  v3 = -[NUChannelFormat hash](&v6, sel_hash);
  v4 = 0x98D1398391 * self->_controlType;
  return v4 ^ v3 ^ (0xD97BDCE34BLL * -[NUModel hash](self->_dataModel, "hash"));
}

- (BOOL)isEqualToChannelFormat:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(v4, "controlType"), v5 == -[NUChannelControlFormat controlType](self, "controlType")))
  {
    objc_msgSend(v4, "dataModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUChannelControlFormat dataModel](self, "dataModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCompatibleWithChannelFormat:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v5 = objc_msgSend(v4, "controlType");
  if (v5 != -[NUChannelControlFormat controlType](self, "controlType"))
    goto LABEL_11;
  v6 = -[NUChannelControlFormat controlType](self, "controlType");
  if (v6 != 1)
  {
    if (v6 == 2)
    {
      -[NUChannelControlFormat dataModel](self, "dataModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
      {
        +[NUSourceSchema sharedSourceSchema](NUSourceSchema, "sharedSourceSchema");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v9))
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            goto LABEL_8;
        }
        else
        {

        }
        v11 = 0;
        goto LABEL_15;
      }
LABEL_8:
      v11 = 1;
LABEL_15:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  -[NUChannelControlFormat dataModel](self, "dataModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");
  objc_msgSend(v4, "dataModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "type");

  if (v13 != v15)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
LABEL_10:
  v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)validateChannelData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NUChannelControlFormat;
  if (-[NUChannelFormat validateChannelData:error:](&v12, sel_validateChannelData_error_, v6, a4))
  {
    v7 = v6;
    -[NUChannelControlFormat dataModel](self, "dataModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "validate:error:", v9, a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  int64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;

  v3 = -[NUChannelControlFormat controlType](self, "controlType");
  if (v3 == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = -[NUModel type](self->_dataModel, "type");
    if ((unint64_t)(v9 - 1) > 5)
      v10 = CFSTR("???");
    else
      v10 = off_1E50633E8[v9 - 1];
    v5 = v10;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("setting:%@"), v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[NUModel identifier](self->_dataModel, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString name](v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("schema:%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    return v7;
  }
  v7 = CFSTR("???");
  return v7;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NUChannelControlFormat controlType](self, "controlType");
  v6 = CFSTR("???");
  if (v5 == 2)
    v6 = CFSTR("schema");
  if (v5 == 1)
    v6 = CFSTR("setting");
  v7 = v6;
  -[NUChannelControlFormat dataModel](self, "dataModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%@ model:%@>"), v4, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (NUModel)dataModel
{
  return self->_dataModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModel, 0);
}

+ (id)controlFormatWithSchema:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithControlType:dataModel:", 2, v4);

  return v5;
}

+ (id)controlFormatWithSetting:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithControlType:dataModel:", 1, v4);

  return v5;
}

@end
