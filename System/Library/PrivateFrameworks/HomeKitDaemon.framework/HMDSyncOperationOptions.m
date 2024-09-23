@implementation HMDSyncOperationOptions

- (HMDSyncOperationOptions)initWithOperationType:(unint64_t)a3 zoneName:(id)a4 cloudConflict:(BOOL)a5 delayRespected:(BOOL)a6
{
  id v11;
  HMDSyncOperationOptions *v12;
  HMDSyncOperationOptions *v13;
  HMDSyncOperationOptions *v14;
  objc_super v16;

  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDSyncOperationOptions;
  v12 = -[HMDSyncOperationOptions init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_operationType = a3;
    objc_storeStrong((id *)&v12->_zoneName, a4);
    v13->_cloudConflict = a5;
    v13->_delayRespected = a6;
    v14 = v13;
  }

  return v13;
}

- (HMDSyncOperationOptions)initWithOperationType:(unint64_t)a3 zoneName:(id)a4 delayRespected:(BOOL)a5
{
  return -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:](self, "initWithOperationType:zoneName:cloudConflict:delayRespected:", a3, a4, 0, a5);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMDSyncOperationOptions operationType](self, "operationType") - 1;
  if (v4 > 8)
    v5 = CFSTR("unknown");
  else
    v5 = off_24E787548[v4];
  -[HMDSyncOperationOptions zoneName](self, "zoneName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5")))
  {
    v7 = CFSTR("HomeManagerZone: ");
    v8 = CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("CCF7D3D1-0C20-4207-97D0-9E565EB5E323")))
    {
      v9 = v6;
      goto LABEL_10;
    }
    v7 = CFSTR("MetadataZone: ");
    v8 = CFSTR("CCF7D3D1-0C20-4207-97D0-9E565EB5E323");
  }
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = v9;

  -[HMDSyncOperationOptions isCloudConflict](self, "isCloudConflict");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSyncOperationOptions isDelayRespected](self, "isDelayRespected");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Operation Type = %@, <options: zone=%@/cloudConflict=%@/delayRespected=%@>"), v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (BOOL)isCloudConflict
{
  return self->_cloudConflict;
}

- (void)setCloudConflict:(BOOL)a3
{
  self->_cloudConflict = a3;
}

- (BOOL)isDelayRespected
{
  return self->_delayRespected;
}

- (void)setDelayRespected:(BOOL)a3
{
  self->_delayRespected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
