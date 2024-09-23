@implementation CRKRenewAppleIDCredentialsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CRKRenewAppleIDCredentialsRequest force](self, "force"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("force"));

  -[CRKRenewAppleIDCredentialsRequest reason](self, "reason");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("reason"));

}

- (CRKRenewAppleIDCredentialsRequest)initWithCoder:(id)a3
{
  id v4;
  CRKRenewAppleIDCredentialsRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *reason;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKRenewAppleIDCredentialsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("force"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_force = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("reason"));
    v8 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v8;

  }
  return v5;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
