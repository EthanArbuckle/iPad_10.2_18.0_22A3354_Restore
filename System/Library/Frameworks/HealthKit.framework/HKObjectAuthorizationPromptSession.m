@implementation HKObjectAuthorizationPromptSession

- (id)initForBundleIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v7;
  id v8;
  HKObjectAuthorizationPromptSession *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKObjectAuthorizationPromptSession;
  v9 = -[HKObjectAuthorizationPromptSession init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionIdentifier, a4);
    objc_storeStrong(p_isa + 2, a3);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationPromptSession)initWithCoder:(id)a3
{
  id v4;
  HKObjectAuthorizationPromptSession *v5;
  uint64_t v6;
  NSUUID *sessionIdentifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKObjectAuthorizationPromptSession;
  v5 = -[HKObjectAuthorizationPromptSession init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bid"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bid"));

}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
