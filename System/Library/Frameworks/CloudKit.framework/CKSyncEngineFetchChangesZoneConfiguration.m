@implementation CKSyncEngineFetchChangesZoneConfiguration

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;

  v20 = a3;
  if ((objc_msgSend_shouldFetchAssetContents(self, v4, v5, v6) & 1) == 0)
    objc_msgSend_addProperty_value_shouldRedact_(v20, v7, (uint64_t)CFSTR("fetchAssetContents"), MEMORY[0x1E0C9AAA0], 0);
  v10 = objc_msgSend_resultsLimit(self, v7, v8, v9);
  v13 = v20;
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend_resultsLimit(self, (const char *)v20, v11, v12);
    objc_msgSend_numberWithUnsignedInteger_(v14, v16, v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v20, v19, (uint64_t)CFSTR("resultsLimit"), (uint64_t)v18, 0);

    v13 = v20;
  }

}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (CKSyncEngineFetchChangesZoneConfiguration)init
{
  CKSyncEngineFetchChangesZoneConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSyncEngineFetchChangesZoneConfiguration;
  result = -[CKSyncEngineFetchChangesZoneConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_shouldFetchAssetContents = 1;
    result->_resultsLimit = 0;
  }
  return result;
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("ZoneConfiguration");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKSyncEngineFetchChangesZoneConfiguration *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v4 = objc_alloc_init(CKSyncEngineFetchChangesZoneConfiguration);
  objc_msgSend_setShouldFetchAssetContents_(v4, v5, self->_shouldFetchAssetContents, v6);
  objc_msgSend_setResultsLimit_(v4, v7, self->_resultsLimit, v8);
  return v4;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchChangesZoneConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchChangesZoneConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

@end
