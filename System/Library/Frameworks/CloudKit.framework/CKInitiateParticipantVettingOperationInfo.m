@implementation CKInitiateParticipantVettingOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  objc_super v20;

  v4 = a3;
  objc_msgSend_shareMetadata(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("ShareMetadata"));

  objc_msgSend_participantID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("ParticipantID"));

  objc_msgSend_address(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("Address"));

  v20.receiver = self;
  v20.super_class = (Class)CKInitiateParticipantVettingOperationInfo;
  -[CKOperationInfo encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);

}

- (CKInitiateParticipantVettingOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKInitiateParticipantVettingOperationInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKShareMetadata *shareMetadata;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *participantID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *address;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKInitiateParticipantVettingOperationInfo;
  v5 = -[CKOperationInfo initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("ShareMetadata"));
    v8 = objc_claimAutoreleasedReturnValue();
    shareMetadata = v5->_shareMetadata;
    v5->_shareMetadata = (CKShareMetadata *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("ParticipantID"));
    v12 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("Address"));
    v16 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v16;

  }
  return v5;
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadata, a3);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
}

@end
