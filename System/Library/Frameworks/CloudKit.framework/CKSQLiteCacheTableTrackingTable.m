@implementation CKSQLiteCacheTableTrackingTable

+ (id)dbProperties
{
  return &unk_1E1FC4CE8;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)updateEntryOldestExpireDate:(id)a3 oldestExpirationDate:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_setOldestExpireDate_(v6, v7, (uint64_t)a4, v8);
  objc_msgSend_updateProperties_usingObject_label_(self, v9, (uint64_t)&unk_1E1FC4208, (uint64_t)v6, off_1E1F63530);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
