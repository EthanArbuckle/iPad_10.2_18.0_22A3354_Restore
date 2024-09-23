@implementation CKSyncEngineSentDatabaseChangesEvent

- (CKSyncEngineSentDatabaseChangesEvent)initWithSavedZones:(id)a3 failedZoneSaves:(id)a4 deletedZoneIDs:(id)a5 failedZoneDeletes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  char v16;
  char v17;
  char v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  CKSyncEngineSentDatabaseChangesEvent *v22;
  uint64_t v23;
  NSArray *savedZones;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *failedZoneSaves;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *deletedZoneIDs;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSDictionary *failedZoneDeletes;
  void *v41;
  CKException *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  id v52;
  objc_super v53;
  id v54;
  id v55;
  id v56;
  id v57;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v57 = 0;
  v14 = _CKCheckArgument((uint64_t)"savedZones", v10, 0, 0, 0, &v57);
  v15 = v57;
  if ((v14 & 1) == 0)
    goto LABEL_8;

  v56 = 0;
  v16 = _CKCheckArgument((uint64_t)"failedZoneSaves", v11, 0, 0, 0, &v56);
  v15 = v56;
  if ((v16 & 1) == 0)
    goto LABEL_8;

  v55 = 0;
  v17 = _CKCheckArgument((uint64_t)"deletedZoneIDs", v12, 0, 0, 0, &v55);
  v15 = v55;
  if ((v17 & 1) == 0
    || (v15,
        v54 = 0,
        v18 = _CKCheckArgument((uint64_t)"failedZoneDeletes", v13, 0, 0, 0, &v54),
        v15 = v54,
        (v18 & 1) == 0))
  {
LABEL_8:
    v41 = v15;
    v42 = [CKException alloc];
    v46 = objc_msgSend_code(v41, v43, v44, v45);
    objc_msgSend_localizedDescription(v41, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (id)objc_msgSend_initWithCode_format_(v42, v51, v46, (uint64_t)CFSTR("%@"), v50);

    objc_exception_throw(v52);
  }

  v53.receiver = self;
  v53.super_class = (Class)CKSyncEngineSentDatabaseChangesEvent;
  v22 = -[CKSyncEngineEvent initInternal](&v53, sel_initInternal);
  if (v22)
  {
    v23 = objc_msgSend_copy(v10, v19, v20, v21);
    savedZones = v22->_savedZones;
    v22->_savedZones = (NSArray *)v23;

    v28 = objc_msgSend_copy(v11, v25, v26, v27);
    failedZoneSaves = v22->_failedZoneSaves;
    v22->_failedZoneSaves = (NSArray *)v28;

    v33 = objc_msgSend_copy(v12, v30, v31, v32);
    deletedZoneIDs = v22->_deletedZoneIDs;
    v22->_deletedZoneIDs = (NSArray *)v33;

    v38 = objc_msgSend_copy(v13, v35, v36, v37);
    failedZoneDeletes = v22->_failedZoneDeletes;
    v22->_failedZoneDeletes = (NSDictionary *)v38;

  }
  return v22;
}

- (int64_t)type
{
  return 4;
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CKSyncEngineSentDatabaseChangesEvent;
  v4 = a3;
  -[CKSyncEngineEvent CKDescribePropertiesUsing:](&v25, sel_CKDescribePropertiesUsing_, v4);
  objc_msgSend_savedZones(self, v5, v6, v7, v25.receiver, v25.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("savedZones"), (uint64_t)v8, 0);

  objc_msgSend_failedZoneSaves(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("failedZoneSaves"), (uint64_t)v13, 0);

  objc_msgSend_deletedZoneIDs(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v19, (uint64_t)CFSTR("deletedZoneIDs"), (uint64_t)v18, 0);

  objc_msgSend_failedZoneDeletes(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v24, (uint64_t)CFSTR("failedZoneDeletes"), (uint64_t)v23, 0);

}

- (NSArray)savedZones
{
  return self->_savedZones;
}

- (NSArray)failedZoneSaves
{
  return self->_failedZoneSaves;
}

- (NSArray)deletedZoneIDs
{
  return self->_deletedZoneIDs;
}

- (NSDictionary)failedZoneDeletes
{
  return self->_failedZoneDeletes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedZoneDeletes, 0);
  objc_storeStrong((id *)&self->_deletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_failedZoneSaves, 0);
  objc_storeStrong((id *)&self->_savedZones, 0);
}

@end
