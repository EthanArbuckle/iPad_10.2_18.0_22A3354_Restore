@implementation CALNNotificationIdentifierComponents

- (CALNNotificationIdentifierComponents)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  id v7;
  CALNNotificationIdentifierComponents *v8;
  uint64_t v9;
  NSString *sourceIdentifier;
  uint64_t v11;
  NSString *sourceClientIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNNotificationIdentifierComponents;
  v8 = -[CALNNotificationIdentifierComponents init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sourceIdentifier = v8->_sourceIdentifier;
    v8->_sourceIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    sourceClientIdentifier = v8->_sourceClientIdentifier;
    v8->_sourceClientIdentifier = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNNotificationIdentifierComponents sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationIdentifierComponents sourceClientIdentifier](self, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(sourceIdentifier = %@, sourceClientIdentifier = %@)"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end
