@implementation DMFFetchActivationLockBypassCodeResultObject

- (DMFFetchActivationLockBypassCodeResultObject)initWithBypassCode:(id)a3
{
  id v4;
  DMFFetchActivationLockBypassCodeResultObject *v5;
  uint64_t v6;
  NSString *bypassCode;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchActivationLockBypassCodeResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bypassCode = v5->_bypassCode;
    v5->_bypassCode = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchActivationLockBypassCodeResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchActivationLockBypassCodeResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *bypassCode;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchActivationLockBypassCodeResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("bypassCode"));
    v7 = objc_claimAutoreleasedReturnValue();
    bypassCode = v5->_bypassCode;
    v5->_bypassCode = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchActivationLockBypassCodeResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchActivationLockBypassCodeResultObject bypassCode](self, "bypassCode", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bypassCode"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[DMFFetchActivationLockBypassCodeResultObject bypassCode](self, "bypassCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Bypass code: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bypassCode
{
  return self->_bypassCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bypassCode, 0);
}

@end
