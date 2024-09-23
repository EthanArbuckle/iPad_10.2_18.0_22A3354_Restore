@implementation CKSyncEngineFetchedZoneDeletion

- (CKSyncEngineFetchedZoneDeletion)initWithZoneID:(id)a3 reason:(int64_t)a4
{
  id v7;
  char v8;
  id v9;
  CKSyncEngineFetchedZoneDeletion *v10;
  CKSyncEngineFetchedZoneDeletion *v11;
  void *v13;
  CKException *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  objc_super v25;
  id v26;

  v7 = a3;
  v26 = 0;
  v8 = _CKCheckArgument((uint64_t)"zoneID", v7, 0, 0, 0, &v26);
  v9 = v26;
  if ((v8 & 1) == 0)
  {
    v13 = v9;
    v14 = [CKException alloc];
    v18 = objc_msgSend_code(v13, v15, v16, v17);
    objc_msgSend_localizedDescription(v13, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend_initWithCode_format_(v14, v23, v18, (uint64_t)CFSTR("%@"), v22);

    objc_exception_throw(v24);
  }

  v25.receiver = self;
  v25.super_class = (Class)CKSyncEngineFetchedZoneDeletion;
  v10 = -[CKSyncEngineFetchedZoneDeletion init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_zoneID, a3);
    v11->_reason = a4;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchedZoneDeletion *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchedZoneDeletion *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("FetchedZoneDeletion");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v4 = a3;
  v8 = objc_msgSend_reason(self, v5, v6, v7);
  if (v8 > 2)
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("reason"), (uint64_t)CFSTR("Unknown"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("reason"), (uint64_t)off_1E1F5FC88[v8], 0);
  objc_msgSend_zoneID(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, (uint64_t)CFSTR("zoneID"), (uint64_t)v14, 0);

}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKSyncEngineZoneDeletionReason)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
