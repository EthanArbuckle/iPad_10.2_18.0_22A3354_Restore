@implementation AMSUniversalLinksUpdateResult

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSUniversalLinksUpdateResult success](self, "success"), CFSTR("kCodingKeySuccess"));

}

- (AMSUniversalLinksUpdateResult)initWithCoder:(id)a3
{
  id v4;
  AMSUniversalLinksUpdateResult *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AMSUniversalLinksUpdateResult;
  v5 = -[AMSUniversalLinksUpdateResult init](&v7, sel_init);
  if (v5)
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeySuccess"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archiveClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

@end
