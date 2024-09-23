@implementation CKSyncEngineFetchedRecordZoneChangesEvent

- (CKSyncEngineFetchedRecordZoneChangesEvent)initWithModifications:(id)a3 deletions:(id)a4 zoneAttributesModifications:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  char v13;
  char v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKSyncEngineFetchedRecordZoneChangesEvent *v18;
  uint64_t v19;
  NSArray *modifications;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *deletions;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *zoneAttributesModifications;
  void *v32;
  CKException *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id v43;
  objc_super v44;
  id v45;
  id v46;
  id v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v47 = 0;
  v11 = _CKCheckArgument((uint64_t)"modifications", v8, 0, 0, 0, &v47);
  v12 = v47;
  if ((v11 & 1) == 0)
    goto LABEL_7;

  v46 = 0;
  v13 = _CKCheckArgument((uint64_t)"deletions", v9, 0, 0, 0, &v46);
  v12 = v46;
  if ((v13 & 1) == 0
    || (v12,
        v45 = 0,
        v14 = _CKCheckArgument((uint64_t)"zoneAttributesModifications", v10, 0, 0, 0, &v45),
        v12 = v45,
        (v14 & 1) == 0))
  {
LABEL_7:
    v32 = v12;
    v33 = [CKException alloc];
    v37 = objc_msgSend_code(v32, v34, v35, v36);
    objc_msgSend_localizedDescription(v32, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend_initWithCode_format_(v33, v42, v37, (uint64_t)CFSTR("%@"), v41);

    objc_exception_throw(v43);
  }

  v44.receiver = self;
  v44.super_class = (Class)CKSyncEngineFetchedRecordZoneChangesEvent;
  v18 = -[CKSyncEngineEvent initInternal](&v44, sel_initInternal);
  if (v18)
  {
    v19 = objc_msgSend_copy(v8, v15, v16, v17);
    modifications = v18->_modifications;
    v18->_modifications = (NSArray *)v19;

    v24 = objc_msgSend_copy(v9, v21, v22, v23);
    deletions = v18->_deletions;
    v18->_deletions = (NSArray *)v24;

    v29 = objc_msgSend_copy(v10, v26, v27, v28);
    zoneAttributesModifications = v18->_zoneAttributesModifications;
    v18->_zoneAttributesModifications = (NSArray *)v29;

  }
  return v18;
}

- (int64_t)type
{
  return 3;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineFetchedRecordZoneChangesEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v23, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_modifications(self, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v8, v9, (uint64_t)&unk_1E1F582F8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addProperty_value_shouldRedact_(v4, v12, (uint64_t)CFSTR("modifications"), (uint64_t)v11, 0);
  objc_msgSend_deletions(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v17, (uint64_t)CFSTR("deletions"), (uint64_t)v16, 0);

  objc_msgSend_zoneAttributesModifications(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v22, (uint64_t)CFSTR("zoneAttributesModifications"), (uint64_t)v21, 0);

}

- (NSArray)modifications
{
  return self->_modifications;
}

- (NSArray)deletions
{
  return self->_deletions;
}

- (NSArray)zoneAttributesModifications
{
  return self->_zoneAttributesModifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneAttributesModifications, 0);
  objc_storeStrong((id *)&self->_deletions, 0);
  objc_storeStrong((id *)&self->_modifications, 0);
}

@end
