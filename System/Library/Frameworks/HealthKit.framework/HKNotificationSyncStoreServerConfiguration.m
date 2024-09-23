@implementation HKNotificationSyncStoreServerConfiguration

- (HKNotificationSyncStoreServerConfiguration)initWithClientIdentifier:(id)a3
{
  id v4;
  HKNotificationSyncStoreServerConfiguration *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKNotificationSyncStoreServerConfiguration;
  v5 = -[HKNotificationSyncStoreServerConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNotificationSyncStoreServerConfiguration)initWithCoder:(id)a3
{
  id v5;
  HKNotificationSyncStoreServerConfiguration *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  void *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKNotificationSyncStoreServerConfiguration;
  v6 = -[HKTaskConfiguration initWithCoder:](&v11, sel_initWithCoder_, v5);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v7;

    if (!v6->_clientIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("HKNotificationSyncStoreInterfaces.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clientIdentifier"));

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKNotificationSyncStoreServerConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"), v5.receiver, v5.super_class);

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
