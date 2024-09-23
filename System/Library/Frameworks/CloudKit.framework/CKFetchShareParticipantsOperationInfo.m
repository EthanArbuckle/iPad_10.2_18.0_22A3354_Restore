@implementation CKFetchShareParticipantsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_userIdentityLookupInfos, (uint64_t)CFSTR("UserIdentityInfos"));
  v7.receiver = self;
  v7.super_class = (Class)CKFetchShareParticipantsOperationInfo;
  -[CKOperationInfo encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_autoreleasePoolPop(v5);

}

- (CKFetchShareParticipantsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchShareParticipantsOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKFetchShareParticipantsOperationInfo;
  v5 = -[CKOperationInfo initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("UserIdentityInfos"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserIdentityLookupInfos_(v5, v15, (uint64_t)v14, v16);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
}

@end
