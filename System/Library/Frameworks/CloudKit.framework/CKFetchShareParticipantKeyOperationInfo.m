@implementation CKFetchShareParticipantKeyOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  objc_super v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v21.receiver = self;
  v21.super_class = (Class)CKFetchShareParticipantKeyOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v21, sel_encodeWithCoder_, v4);
  objc_msgSend_shareIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("ShareIDs"));

  objc_msgSend_baseTokensByShareID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("BaseTokensByShareID"));

  objc_msgSend_childRecordIDsByShareID(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("ChildRecordIDsByShareID"));

  objc_autoreleasePoolPop(v5);
}

- (CKFetchShareParticipantKeyOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchShareParticipantKeyOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *shareIDs;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSDictionary *baseTokensByShareID;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSDictionary *childRecordIDsByShareID;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CKFetchShareParticipantKeyOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("ShareIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    shareIDs = v5->_shareIDs;
    v5->_shareIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v20, v17, v21, v18, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("BaseTokensByShareID"));
    v24 = objc_claimAutoreleasedReturnValue();
    baseTokensByShareID = v5->_baseTokensByShareID;
    v5->_baseTokensByShareID = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend_setWithObjects_(v26, v29, v27, v30, v28, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, (uint64_t)CFSTR("ChildRecordIDsByShareID"));
    v33 = objc_claimAutoreleasedReturnValue();
    childRecordIDsByShareID = v5->_childRecordIDsByShareID;
    v5->_childRecordIDsByShareID = (NSDictionary *)v33;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSDictionary)baseTokensByShareID
{
  return self->_baseTokensByShareID;
}

- (void)setBaseTokensByShareID:(id)a3
{
  objc_storeStrong((id *)&self->_baseTokensByShareID, a3);
}

- (NSDictionary)childRecordIDsByShareID
{
  return self->_childRecordIDsByShareID;
}

- (void)setChildRecordIDsByShareID:(id)a3
{
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, a3);
}

- (NSArray)shareIDs
{
  return self->_shareIDs;
}

- (void)setShareIDs:(id)a3
{
  objc_storeStrong((id *)&self->_shareIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIDs, 0);
  objc_storeStrong((id *)&self->_childRecordIDsByShareID, 0);
  objc_storeStrong((id *)&self->_baseTokensByShareID, 0);
}

@end
