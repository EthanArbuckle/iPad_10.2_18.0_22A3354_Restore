@implementation DMFSetAppAllowUserToLockRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4838;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppAllowUserToLockRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetAppAllowUserToLockRequest *v5;
  void *v6;
  uint64_t v7;
  NSNumber *allowUserToLock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppAllowUserToLockRequest;
  v5 = -[DMFAppRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("allowUserToLock"));
    v7 = objc_claimAutoreleasedReturnValue();
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppAllowUserToLockRequest;
  v4 = a3;
  -[DMFAppRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFSetAppAllowUserToLockRequest allowUserToLock](self, "allowUserToLock", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("allowUserToLock"));

}

- (NSNumber)allowUserToLock
{
  return self->_allowUserToLock;
}

- (void)setAllowUserToLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowUserToLock, 0);
}

@end
