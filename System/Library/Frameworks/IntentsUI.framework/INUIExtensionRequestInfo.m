@implementation INUIExtensionRequestInfo

- (INUIExtensionRequestInfo)initWithInteraction:(id)a3
{
  id v5;
  INUIExtensionRequestInfo *v6;
  INUIExtensionRequestInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUIExtensionRequestInfo;
  v6 = -[INUIExtensionRequestInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interaction, a3);
    v7->_requiresUserConsent = 1;
  }

  return v7;
}

- (INUIExtensionRequestInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INUIExtensionRequestInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INUIExtensionRequestInfo initWithInteraction:](self, "initWithInteraction:", v5);

  if (v6)
    -[INUIExtensionRequestInfo setRequiresUserConsent:](v6, "setRequiresUserConsent:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresUserConsent")));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INUIExtensionRequestInfo interaction](self, "interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("interaction"));

  objc_msgSend(v5, "encodeBool:forKey:", -[INUIExtensionRequestInfo requiresUserConsent](self, "requiresUserConsent"), CFSTR("requiresUserConsent"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  -[INUIExtensionRequestInfo interaction](self, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithInteraction:", v7);

  objc_msgSend(v8, "setRequiresUserConsent:", -[INUIExtensionRequestInfo requiresUserConsent](self, "requiresUserConsent"));
  return v8;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
