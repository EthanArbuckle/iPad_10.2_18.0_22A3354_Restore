@implementation DMFSetAppTapToPayScreenLockRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4B08;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppTapToPayScreenLockRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetAppTapToPayScreenLockRequest *v5;
  void *v6;
  uint64_t v7;
  NSNumber *tapToPayScreenLock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppTapToPayScreenLockRequest;
  v5 = -[DMFAppRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("tapToPayScreenLock"));
    v7 = objc_claimAutoreleasedReturnValue();
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppTapToPayScreenLockRequest;
  v4 = a3;
  -[DMFAppRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFSetAppTapToPayScreenLockRequest tapToPayScreenLock](self, "tapToPayScreenLock", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tapToPayScreenLock"));

}

- (NSNumber)tapToPayScreenLock
{
  return self->_tapToPayScreenLock;
}

- (void)setTapToPayScreenLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToPayScreenLock, 0);
}

@end
