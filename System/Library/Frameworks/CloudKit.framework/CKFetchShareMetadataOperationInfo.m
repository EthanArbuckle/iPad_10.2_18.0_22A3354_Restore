@implementation CKFetchShareMetadataOperationInfo

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
  uint64_t RootRecord;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  objc_super v36;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v36.receiver = self;
  v36.super_class = (Class)CKFetchShareMetadataOperationInfo;
  -[CKOperationInfo encodeWithCoder:](&v36, sel_encodeWithCoder_, v4);
  objc_msgSend_shareURLsToFetch(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("URLsToFetch"));

  RootRecord = objc_msgSend_shouldFetchRootRecord(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, RootRecord, (uint64_t)CFSTR("ShouldFetchRootRecord"));
  objc_msgSend_rootRecordDesiredKeys(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("RootRecordDesiredKeys"));

  objc_msgSend_shareInvitationTokensByShareURL(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, (uint64_t)CFSTR("ShareInvitationTokensByShareURL"));

  v29 = objc_msgSend_overwriteContainerPCSServiceIfManatee(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, v29, (uint64_t)CFSTR("OverwriteContainerPCSServiceIfManatee"));
  v34 = objc_msgSend_skipShareDecryption(self, v31, v32, v33);
  objc_msgSend_encodeBool_forKey_(v4, v35, v34, (uint64_t)CFSTR("SkipShareDecryption"));
  objc_autoreleasePoolPop(v5);

}

- (CKFetchShareMetadataOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchShareMetadataOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *shareURLsToFetch;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSArray *rootRecordDesiredKeys;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSDictionary *shareInvitationTokensByShareURL;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  objc_super v41;
  _QWORD v42[3];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CKFetchShareMetadataOperationInfo;
  v5 = -[CKOperationInfo initWithCoder:](&v41, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v43, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("URLsToFetch"));
    v14 = objc_claimAutoreleasedReturnValue();
    shareURLsToFetch = v5->_shareURLsToFetch;
    v5->_shareURLsToFetch = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("RootRecordDesiredKeys"));
    v23 = objc_claimAutoreleasedReturnValue();
    rootRecordDesiredKeys = v5->_rootRecordDesiredKeys;
    v5->_rootRecordDesiredKeys = (NSArray *)v23;

    v5->_shouldFetchRootRecord = objc_msgSend_decodeBoolForKey_(v4, v25, (uint64_t)CFSTR("ShouldFetchRootRecord"), v26);
    v27 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v42, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v27, v30, (uint64_t)v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, (uint64_t)CFSTR("ShareInvitationTokensByShareURL"));
    v34 = objc_claimAutoreleasedReturnValue();
    shareInvitationTokensByShareURL = v5->_shareInvitationTokensByShareURL;
    v5->_shareInvitationTokensByShareURL = (NSDictionary *)v34;

    v5->_overwriteContainerPCSServiceIfManatee = objc_msgSend_decodeBoolForKey_(v4, v36, (uint64_t)CFSTR("OverwriteContainerPCSServiceIfManatee"), v37);
    v5->_skipShareDecryption = objc_msgSend_decodeBoolForKey_(v4, v38, (uint64_t)CFSTR("SkipShareDecryption"), v39);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)shareURLsToFetch
{
  return self->_shareURLsToFetch;
}

- (void)setShareURLsToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLsToFetch, a3);
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchRootRecord = a3;
}

- (NSArray)rootRecordDesiredKeys
{
  return self->_rootRecordDesiredKeys;
}

- (void)setRootRecordDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, a3);
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  return self->_shareInvitationTokensByShareURL;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, a3);
}

- (BOOL)overwriteContainerPCSServiceIfManatee
{
  return self->_overwriteContainerPCSServiceIfManatee;
}

- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3
{
  self->_overwriteContainerPCSServiceIfManatee = a3;
}

- (BOOL)skipShareDecryption
{
  return self->_skipShareDecryption;
}

- (void)setSkipShareDecryption:(BOOL)a3
{
  self->_skipShareDecryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareURLsToFetch, 0);
}

@end
