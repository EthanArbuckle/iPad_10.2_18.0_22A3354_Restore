@implementation CKMovePhotosChange

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_destinationRecord(self, a2, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v9, v10, v7, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("sourceID");
  objc_msgSend_sourceRecordID(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("dest");
  v20[0] = v15;
  v20[1] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v20, (uint64_t)v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)description
{
  return (id)((uint64_t (*)(CKMovePhotosChange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)objc_opt_new();
  objc_msgSend_sourceRecordID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("sourceRecordID"));

  objc_msgSend_destinationRecord(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, (uint64_t)CFSTR("destinationRecord"));

  objc_msgSend_properties(v3, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_sourceRecordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sourceRecordID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_sourceRecordChangeTag(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sourceRecordChangeTag);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_destinationRecord(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_destinationRecord);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v20, (uint64_t)v21);

  objc_autoreleasePoolPop(v4);
}

- (CKMovePhotosChange)initWithCoder:(id)a3
{
  id v4;
  CKMovePhotosChange *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  CKRecordID *sourceRecordID;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSString *sourceRecordChangeTag;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  CKRecord *destinationRecord;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKMovePhotosChange;
  v5 = -[CKMovePhotosChange init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    NSStringFromSelector(sel_sourceRecordID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    sourceRecordID = v5->_sourceRecordID;
    v5->_sourceRecordID = (CKRecordID *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_sourceRecordChangeTag);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    sourceRecordChangeTag = v5->_sourceRecordChangeTag;
    v5->_sourceRecordChangeTag = (NSString *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_destinationRecord);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    v20 = objc_claimAutoreleasedReturnValue();
    destinationRecord = v5->_destinationRecord;
    v5->_destinationRecord = (CKRecord *)v20;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKRecordID)sourceRecordID
{
  return self->_sourceRecordID;
}

- (void)setSourceRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceRecordID, a3);
}

- (NSString)sourceRecordChangeTag
{
  return self->_sourceRecordChangeTag;
}

- (void)setSourceRecordChangeTag:(id)a3
{
  objc_storeStrong((id *)&self->_sourceRecordChangeTag, a3);
}

- (CKRecord)destinationRecord
{
  return self->_destinationRecord;
}

- (void)setDestinationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_destinationRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRecord, 0);
  objc_storeStrong((id *)&self->_sourceRecordChangeTag, 0);
  objc_storeStrong((id *)&self->_sourceRecordID, 0);
}

@end
