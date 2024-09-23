@implementation ATXAnchorModelActionDetails

- (ATXAnchorModelActionDetails)initWithBundleId:(id)a3 actionType:(id)a4 paramHash:(int64_t)a5
{
  id v8;
  id v9;
  ATXAnchorModelActionDetails *v10;
  uint64_t v11;
  NSString *bundleId;
  uint64_t v13;
  NSString *actionType;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXAnchorModelActionDetails;
  v10 = -[ATXAnchorModelActionDetails init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    actionType = v10->_actionType;
    v10->_actionType = (NSString *)v13;

    v10->_paramHash = a5;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (int64_t)paramHash
{
  return self->_paramHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
