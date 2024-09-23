@implementation CKSyncEngineFetchedDatabaseChangesEvent

- (int64_t)type
{
  return 2;
}

- (NSArray)modifications
{
  return self->_modifications;
}

- (CKSyncEngineFetchedDatabaseChangesEvent)initWithModifications:(id)a3 deletions:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKSyncEngineFetchedDatabaseChangesEvent *v14;
  uint64_t v15;
  NSArray *modifications;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *deletions;
  void *v23;
  CKException *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;
  objc_super v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v37 = 0;
  v8 = _CKCheckArgument((uint64_t)"modifications", v6, 0, 0, 0, &v37);
  v9 = v37;
  if ((v8 & 1) == 0
    || (v9,
        v36 = 0,
        v10 = _CKCheckArgument((uint64_t)"deletions", v7, 0, 0, 0, &v36),
        v9 = v36,
        (v10 & 1) == 0))
  {
    v23 = v9;
    v24 = [CKException alloc];
    v28 = objc_msgSend_code(v23, v25, v26, v27);
    objc_msgSend_localizedDescription(v23, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend_initWithCode_format_(v24, v33, v28, (uint64_t)CFSTR("%@"), v32);

    objc_exception_throw(v34);
  }

  v35.receiver = self;
  v35.super_class = (Class)CKSyncEngineFetchedDatabaseChangesEvent;
  v14 = -[CKSyncEngineEvent initInternal](&v35, sel_initInternal);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    modifications = v14->_modifications;
    v14->_modifications = (NSArray *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    deletions = v14->_deletions;
    v14->_deletions = (NSArray *)v20;

  }
  return v14;
}

- (NSArray)deletions
{
  return self->_deletions;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKSyncEngineFetchedDatabaseChangesEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v15, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_modifications(self, v5, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("modifications"), (uint64_t)v8, 0);

  objc_msgSend_deletions(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("deletions"), (uint64_t)v13, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_modifications, 0);
}

@end
