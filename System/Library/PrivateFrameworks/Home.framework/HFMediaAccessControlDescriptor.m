@implementation HFMediaAccessControlDescriptor

+ (id)defaultAccessControl
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAccess:requiresPassword:password:", 0, 0, 0);
}

+ (id)descriptorWithAccess:(unint64_t)a3 requiresPassword:(BOOL)a4 password:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;

  v5 = a4;
  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAccess:requiresPassword:password:", a3, v5, v7);

  return v8;
}

- (HFMediaAccessControlDescriptor)initWithAccess:(unint64_t)a3 requiresPassword:(BOOL)a4 password:(id)a5
{
  id v8;
  HFMediaAccessControlDescriptor *v9;
  HFMediaAccessControlDescriptor *v10;
  uint64_t v11;
  NSString *accessPassword;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFMediaAccessControlDescriptor;
  v9 = -[HFMediaAccessControlDescriptor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_access = a3;
    v9->_accessRequiresPassword = a4;
    v11 = objc_msgSend(v8, "copy");
    accessPassword = v10->_accessPassword;
    v10->_accessPassword = (NSString *)v11;

  }
  return v10;
}

- (HFMediaAccessControlDescriptor)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccess_requiresPassword_password_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessControlDescriptor.m"), 60, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessControlDescriptor init]",
    v5);

  return 0;
}

- (BOOL)accessSupportsPassword
{
  return objc_msgSend((id)objc_opt_class(), "accessClassificationSupportsPassword:", -[HFMediaAccessControlDescriptor access](self, "access"));
}

+ (BOOL)accessClassificationSupportsPassword:(unint64_t)a3
{
  return a3 < 2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLocalizedStringFromHFMediaAccessControlClassification(-[HFMediaAccessControlDescriptor access](self, "access"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("access"));

  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFMediaAccessControlDescriptor accessRequiresPassword](self, "accessRequiresPassword"), CFSTR("accessRequiresPassword"));
  -[HFMediaAccessControlDescriptor accessPassword](self, "accessPassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("accessPassword"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_249 != -1)
    dispatch_once(&_MergedGlobals_249, &__block_literal_global_27_4);
  return (NAIdentity *)(id)qword_1ED379060;
}

void __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCharacteristic:", &__block_literal_global_30_0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_32_2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendCharacteristic:", &__block_literal_global_33_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED379060;
  qword_1ED379060 = v3;

}

uint64_t __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "access"));
}

uint64_t __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessPassword");
}

uint64_t __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "accessRequiresPassword"));
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)access
{
  return self->_access;
}

- (BOOL)accessRequiresPassword
{
  return self->_accessRequiresPassword;
}

- (NSString)accessPassword
{
  return self->_accessPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPassword, 0);
}

@end
