@implementation BCSQuery

- (BCSQuery)initWithItemIdentifier:(id)a3 config:(id)a4 clientBundleId:(id)a5 shardType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  BCSQuery *v14;
  BCSQuery *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BCSQuery;
  v14 = -[BCSQuery init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemIdentifier, a3);
    objc_storeStrong((id *)&v15->_config, a4);
    objc_storeStrong((id *)&v15->_clientBundleId, a5);
    v15->_shardType = a6;
  }

  return v15;
}

- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5 skipRegistrationCheck:(BOOL)a6
{
  id v11;
  id v12;
  BCSQuery *v13;
  BCSQuery *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSQuery;
  v13 = -[BCSQuery init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_itemIdentifier, a3);
    objc_storeStrong((id *)&v14->_clientBundleId, a4);
    v14->_shardType = a5;
    v14->_skipRegistrationCheck = a6;
  }

  return v14;
}

- (BCSQuery)initWithItemIdentifier:(id)a3 clientBundleId:(id)a4 shardType:(int64_t)a5
{
  return -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:](self, "initWithItemIdentifier:clientBundleId:shardType:skipRegistrationCheck:", a3, a4, a5, 0);
}

- (void)updateConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (BCSItemIdentifying)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (BCSBusinessConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (int64_t)shardType
{
  return self->_shardType;
}

- (void)setShardType:(int64_t)a3
{
  self->_shardType = a3;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleId, a3);
}

- (BOOL)skipRegistrationCheck
{
  return self->_skipRegistrationCheck;
}

- (void)setSkipRegistrationCheck:(BOOL)a3
{
  self->_skipRegistrationCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
