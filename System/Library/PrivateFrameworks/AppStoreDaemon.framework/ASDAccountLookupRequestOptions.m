@implementation ASDAccountLookupRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAuthIfNeeded:", -[ASDAccountLookupRequestOptions authIfNeeded](self, "authIfNeeded"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDAccountLookupRequestOptions authIfNeeded](self, "authIfNeeded"), CFSTR("authIfNeeded"));

}

- (ASDAccountLookupRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDAccountLookupRequestOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDAccountLookupRequestOptions;
  v5 = -[ASDAccountLookupRequestOptions init](&v7, sel_init);
  if (v5)
    -[ASDAccountLookupRequestOptions setAuthIfNeeded:](v5, "setAuthIfNeeded:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authIfNeeded")));

  return v5;
}

- (BOOL)authIfNeeded
{
  return self->_authIfNeeded;
}

- (void)setAuthIfNeeded:(BOOL)a3
{
  self->_authIfNeeded = a3;
}

@end
