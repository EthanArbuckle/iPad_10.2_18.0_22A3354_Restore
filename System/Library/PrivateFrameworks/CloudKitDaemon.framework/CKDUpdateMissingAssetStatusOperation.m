@implementation CKDUpdateMissingAssetStatusOperation

- (CKDUpdateMissingAssetStatusOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDUpdateMissingAssetStatusOperation *v9;
  uint64_t v10;
  CKRecordID *repairRecordID;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *assetSizes;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *assetPutReceipts;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDUpdateMissingAssetStatusOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v25, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_repairRecordID(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    repairRecordID = v9->_repairRecordID;
    v9->_repairRecordID = (CKRecordID *)v10;

    v9->_recovered = objc_msgSend_recovered(v6, v12, v13);
    v9->_isPackage = objc_msgSend_isPackage(v6, v14, v15);
    objc_msgSend_assetSizes(v6, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    assetSizes = v9->_assetSizes;
    v9->_assetSizes = (NSArray *)v18;

    objc_msgSend_assetPutReceipts(v6, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    assetPutReceipts = v9->_assetPutReceipts;
    v9->_assetPutReceipts = (NSArray *)v22;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/update-missing-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    objc_msgSend_error(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend__updateMissingAssetStatus(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
  {
    v5 = CFSTR("Call UpdateMissingAssetStatus");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDUpdateMissingAssetStatusOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)operationType
{
  return 260;
}

- (void)_updateMissingAssetStatus
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  char isPackage;
  CKDUpdateMissingAssetStatusURLRequest *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  CKDUpdateMissingAssetStatusURLRequest *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id v48;
  id from;
  id location;

  if ((objc_msgSend_recovered(self, a2, v2) & 1) != 0)
  {
    isPackage = objc_msgSend_isPackage(self, v4, v5);
    v7 = [CKDUpdateMissingAssetStatusURLRequest alloc];
    objc_msgSend_repairRecordID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetSizes(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if ((isPackage & 1) != 0)
    {
      objc_msgSend_assetPutReceipts(self, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_initWithOperation_recoveredPackageRepairRecordID_sizes_putReceipts_(v7, v18, (uint64_t)self, v10, v16, v17);
    }
    else
    {
      objc_msgSend_firstObject(v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_unsignedIntegerValue(v17, v24, v25);
      objc_msgSend_assetPutReceipts(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend_initWithOperation_recoveredAssetRepairRecordID_size_putReceipt_(v7, v33, (uint64_t)self, v10, v26, v32);

    }
  }
  else
  {
    v20 = [CKDUpdateMissingAssetStatusURLRequest alloc];
    objc_msgSend_repairRecordID(self, v21, v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_initWithOperation_unrecoveredRepairRecordID_(v20, v23, (uint64_t)self, v10);
  }

  objc_initWeak(&location, self);
  objc_initWeak(&from, v19);
  objc_msgSend_stateTransitionGroup(self, v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v36);

  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = sub_1BEB67190;
  v46 = &unk_1E782E468;
  objc_copyWeak(&v47, &location);
  objc_copyWeak(&v48, &from);
  objc_msgSend_setCompletionBlock_(v19, v37, (uint64_t)&v43);
  objc_msgSend_setRequest_(self, v38, (uint64_t)v19, v43, v44, v45, v46);
  objc_msgSend_container(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v41, v42, (uint64_t)v19);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_repairRecordID, a3);
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (void)setRecovered:(BOOL)a3
{
  self->_recovered = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_isPackage = a3;
}

- (NSArray)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_assetSizes, a3);
}

- (NSArray)assetPutReceipts
{
  return self->_assetPutReceipts;
}

- (void)setAssetPutReceipts:(id)a3
{
  objc_storeStrong((id *)&self->_assetPutReceipts, a3);
}

- (CKDFetchRecordsOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (CKDModifyRecordsOperation)modifyOperation
{
  return self->_modifyOperation;
}

- (void)setModifyOperation:(id)a3
{
  objc_storeStrong((id *)&self->_modifyOperation, a3);
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_modifyOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_assetPutReceipts, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
}

@end
