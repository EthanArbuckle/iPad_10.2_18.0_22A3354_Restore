@implementation HMDXPCMessageSendPolicy

- (BOOL)canSendWithPolicyParameters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)isEqual:(id)a3
{
  HMDXPCMessageSendPolicy *v4;
  _BOOL4 v5;

  v4 = (HMDXPCMessageSendPolicy *)a3;
  if (self == v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    v5 = objc_opt_isKindOfClass() & (v4 != 0);
  }

  return v5;
}

@end
