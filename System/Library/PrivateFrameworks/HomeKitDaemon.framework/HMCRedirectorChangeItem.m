@implementation HMCRedirectorChangeItem

- (BOOL)isObjectType:(id)a3
{
  Protocol *v4;
  Protocol *v5;
  BOOL isEqual;

  v4 = (Protocol *)a3;
  -[HMCRedirectorChangeItem modelType](self, "modelType");
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  isEqual = protocol_isEqual(v5, v4);

  return isEqual;
}

- (id)description
{
  void *v3;
  Protocol *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMCRedirectorChangeItem modelType](self, "modelType");
  v4 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCRedirectorChangeItem modelID](self, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCRedirectorChangeItem changedProperties](self, "changedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@: [%@]"), v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (Protocol)modelType
{
  return (Protocol *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)modelID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (MKFObjectDatabaseID)databaseID
{
  return (MKFObjectDatabaseID *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)changedProperties
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedProperties, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

@end
