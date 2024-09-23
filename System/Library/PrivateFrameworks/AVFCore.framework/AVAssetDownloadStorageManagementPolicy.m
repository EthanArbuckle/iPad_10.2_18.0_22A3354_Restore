@implementation AVAssetDownloadStorageManagementPolicy

- (AVAssetDownloadStorageManagementPolicy)init
{
  AVAssetDownloadStorageManagementPolicy *v2;
  AVAssetDownloadStorageManagementPolicyInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAssetDownloadStorageManagementPolicy;
  v2 = -[AVAssetDownloadStorageManagementPolicy init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVAssetDownloadStorageManagementPolicyInternal);
    v2->_storageManagementPolicy = v3;
    if (v3)
    {
      v2->_storageManagementPolicy->policyDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVAssetDownloadStorageManagementPolicyInternal *storageManagementPolicy;
  objc_super v4;

  storageManagementPolicy = self->_storageManagementPolicy;
  if (storageManagementPolicy)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetDownloadStorageManagementPolicy;
  -[AVAssetDownloadStorageManagementPolicy dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, ExpirationDate: %@ Priority: %@>"), NSStringFromClass(v4), self, -[AVAssetDownloadStorageManagementPolicy expirationDate](self, "expirationDate"), -[AVAssetDownloadStorageManagementPolicy priority](self, "priority"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableAssetDownloadStorageManagementPolicy *v4;
  AVMutableAssetDownloadStorageManagementPolicy *v5;

  v4 = -[AVAssetDownloadStorageManagementPolicy init](+[AVMutableAssetDownloadStorageManagementPolicy allocWithZone:](AVMutableAssetDownloadStorageManagementPolicy, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
    -[AVAssetDownloadStorageManagementPolicy _setPolicyDictionary:](v4, "_setPolicyDictionary:", self->_storageManagementPolicy->policyDictionary);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!-[AVAssetDownloadStorageManagementPolicy _policyDictionary](self, "_policyDictionary")
      || (v5 = objc_msgSend(-[AVAssetDownloadStorageManagementPolicy _policyDictionary](self, "_policyDictionary"), "isEqualToDictionary:", objc_msgSend(a3, "_policyDictionary"))) != 0)
    {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_storageManagementPolicy->policyDictionary, "hash");
}

- (void)_setPolicyDictionary:(id)a3
{
  NSMutableDictionary *policyDictionary;

  policyDictionary = self->_storageManagementPolicy->policyDictionary;
  if (policyDictionary != a3)
  {

    self->_storageManagementPolicy->policyDictionary = (NSMutableDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)_policyDictionary
{
  return self->_storageManagementPolicy->policyDictionary;
}

- (void)setExpirationDate:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_storageManagementPolicy->policyDictionary, "setValue:forKey:", a3, CFSTR("ExpirationDate"));
}

- (void)setPriority:(id)a3
{
  -[NSMutableDictionary setValue:forKey:](self->_storageManagementPolicy->policyDictionary, "setValue:forKey:", a3, CFSTR("Priority"));
}

- (NSDate)expirationDate
{
  return (NSDate *)-[NSMutableDictionary objectForKey:](self->_storageManagementPolicy->policyDictionary, "objectForKey:", CFSTR("ExpirationDate"));
}

- (AVAssetDownloadedAssetEvictionPriority)priority
{
  return (AVAssetDownloadedAssetEvictionPriority)-[NSMutableDictionary objectForKey:](self->_storageManagementPolicy->policyDictionary, "objectForKey:", CFSTR("Priority"));
}

@end
