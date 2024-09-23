@implementation HMDConfigurationMessagePolicy

- (HMDConfigurationMessagePolicy)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)__initWithOperationTypes:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDConfigurationMessagePolicy;
  result = -[HMDConfigurationMessagePolicy init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HMDConfigurationMessagePolicy *v4;
  HMDConfigurationMessagePolicy *v5;
  HMDConfigurationMessagePolicy *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMDConfigurationMessagePolicy *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = -[HMDConfigurationMessagePolicy operationTypes](self, "operationTypes");
      v8 = v7 == -[HMDConfigurationMessagePolicy operationTypes](v6, "operationTypes");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)operationTypes
{
  return self->_operationTypes;
}

+ (id)policyWithOperationTypes:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "__initWithOperationTypes:", a3);
}

@end
