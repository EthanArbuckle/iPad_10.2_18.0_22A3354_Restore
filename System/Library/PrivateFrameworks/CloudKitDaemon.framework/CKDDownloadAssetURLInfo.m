@implementation CKDDownloadAssetURLInfo

- (void)dealloc
{
  _OpaquePCSShareProtection *recordPCS;
  objc_super v4;

  recordPCS = self->_recordPCS;
  if (recordPCS)
  {
    CFRelease(recordPCS);
    self->_recordPCS = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDDownloadAssetURLInfo;
  -[CKDDownloadAssetURLInfo dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_asset(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_hash(v3, v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqual;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_asset(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_asset(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v7, v11, (uint64_t)v10);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (void)setRecordPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *recordPCS;

  recordPCS = self->_recordPCS;
  if (recordPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      recordPCS = self->_recordPCS;
    }
    self->_recordPCS = a3;
    if (recordPCS)
      CFRelease(recordPCS);
  }
}

- (CKAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (_OpaquePCSShareProtection)recordPCS
{
  return self->_recordPCS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
