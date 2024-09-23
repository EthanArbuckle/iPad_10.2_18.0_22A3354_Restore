@implementation CKSyncEngineRecordZoneChangeBatch

- (CKSyncEngineRecordZoneChangeBatch)initWith__pendingChanges:(id)a3 recordProvider:(id)a4
{
  void *v5;
  unint64_t v6;
  CKSyncEngineRecordZoneChangeBatch *result;

  v5 = _Block_copy(a4);
  sub_18A60B8D0(0, (unint64_t *)&unk_1EDF6A450);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_18A642EE4(v6, self, v5);
  return result;
}

- (CKSyncEngineRecordZoneChangeBatch)initWithPendingChanges:(NSArray *)pendingChanges recordProvider:(void *)recordProvider
{
  return (CKSyncEngineRecordZoneChangeBatch *)MEMORY[0x1E0DE7D20](self, sel_initWith__pendingChanges_recordProvider_, pendingChanges, recordProvider);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
}

- (CKSyncEngineRecordZoneChangeBatch)initWithRecordsToSave:(NSArray *)recordsToSave recordIDsToDelete:(NSArray *)recordIDsToDelete atomicByZone:(BOOL)atomicByZone
{
  NSArray *v8;
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSyncEngineRecordZoneChangeBatch *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;

  v8 = recordsToSave;
  v9 = recordIDsToDelete;
  v25.receiver = self;
  v25.super_class = (Class)CKSyncEngineRecordZoneChangeBatch;
  v13 = -[CKSyncEngineRecordZoneChangeBatch init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v10, v11, v12);
    v15 = (void *)v14;
    v16 = (void *)MEMORY[0x1E0C9AA60];
    if (v14)
      v17 = (void *)v14;
    else
      v17 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v13->_recordsToSave, v17);

    v21 = objc_msgSend_copy(v9, v18, v19, v20);
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = v16;
    objc_storeStrong((id *)&v13->_recordIDsToDelete, v23);

    v13->_atomicByZone = atomicByZone;
  }

  return v13;
}

- (CKSyncEngineRecordZoneChangeBatch)init
{
  CKException *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = [CKException alloc];
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, (uint64_t)CFSTR("-[%@ init] is unavailable"), v5);

  objc_exception_throw(v7);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineRecordZoneChangeBatch *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineRecordZoneChangeBatch *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;

  v36 = a3;
  objc_msgSend_recordsToSave(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_recordsToSave(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v15, v16, (uint64_t)&unk_1E1F584F8, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addProperty_value_shouldRedact_(v36, v19, (uint64_t)CFSTR("recordIDsToSave"), (uint64_t)v18, 0);
  }
  objc_msgSend_recordIDsToDelete(self, v12, v13, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_recordIDsToDelete(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v36, v29, (uint64_t)CFSTR("recordIDsToDelete"), (uint64_t)v28, 0);

  }
  v30 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend_atomicByZone(self, v25, v26, v27);
  objc_msgSend_numberWithBool_(v30, v32, v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v36, v35, (uint64_t)CFSTR("atomicByZone"), (uint64_t)v34, 0);

}

- (NSArray)recordsToSave
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)atomicByZone
{
  return self->_atomicByZone;
}

- (void)setAtomicByZone:(BOOL)atomicByZone
{
  self->_atomicByZone = atomicByZone;
}

@end
