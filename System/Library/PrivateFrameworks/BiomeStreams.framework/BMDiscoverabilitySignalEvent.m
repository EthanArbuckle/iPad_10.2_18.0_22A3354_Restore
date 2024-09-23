@implementation BMDiscoverabilitySignalEvent

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BMDiscoverabilitySignalEvent)initWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMDiscoverabilitySignalEvent *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *bundleID;
  uint64_t v19;
  NSString *context;
  uint64_t v21;
  NSDictionary *userInfo;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BMDiscoverabilitySignalEvent;
  v14 = -[BMDiscoverabilitySignalEvent init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    bundleID = v14->_bundleID;
    v14->_bundleID = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    context = v14->_context;
    v14->_context = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    userInfo = v14->_userInfo;
    v14->_userInfo = (NSDictionary *)v21;

  }
  return v14;
}

- (BMDiscoverabilitySignalEvent)initWithIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5
{
  return -[BMDiscoverabilitySignalEvent initWithIdentifier:bundleID:context:userInfo:](self, "initWithIdentifier:bundleID:context:userInfo:", a3, a4, a5, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BMDiscoverabilitySignalEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilitySignalEvent bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilitySignalEvent context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDiscoverabilitySignalEvent userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> identifier: %@, bundleID: %@, context: %@ userInfo: %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
