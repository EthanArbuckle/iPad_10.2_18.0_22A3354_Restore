@implementation MLComputePlanDeviceUsageSupportStatePattern

- (MLComputePlanDeviceUsageSupportStatePattern)initWithPattern:(id)a3 supportState:(int64_t)a4
{
  id v6;
  MLComputePlanDeviceUsageSupportStatePattern *v7;
  uint64_t v8;
  id v9;
  NSRegularExpression *regex;
  NSObject *v11;
  uint8_t v13[8];
  id v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLComputePlanDeviceUsageSupportStatePattern;
  v7 = -[MLComputePlanDeviceUsageSupportStatePattern init](&v15, sel_init);
  if (v7)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v6, 1, &v14);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v14;
    regex = v7->_regex;
    v7->_regex = (NSRegularExpression *)v8;

    if (v9 || !v7->_regex)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Encountered an unexpected internal state when creating the support state pattern.", v13, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Encountered an unexpected internal state when creating the support state pattern."));
    }
    v7->_supportState = a4;

  }
  return v7;
}

- (BOOL)isMatchForValidationMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "length");
    -[MLComputePlanDeviceUsageSupportStatePattern regex](self, "regex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

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
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Support state: %zd"), v5, self, -[MLComputePlanDeviceUsageSupportStatePattern supportState](self, "supportState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)supportState
{
  return self->_supportState;
}

- (NSRegularExpression)regex
{
  return self->_regex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
}

+ (id)deviceUsageSupportStatePatternWithPattern:(id)a3 supportState:(int64_t)a4
{
  id v5;
  MLComputePlanDeviceUsageSupportStatePattern *v6;

  v5 = a3;
  v6 = -[MLComputePlanDeviceUsageSupportStatePattern initWithPattern:supportState:]([MLComputePlanDeviceUsageSupportStatePattern alloc], "initWithPattern:supportState:", v5, a4);

  return v6;
}

@end
