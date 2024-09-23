@implementation CKModifySubscriptionsOperationInfo

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
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v16.receiver = self;
  v16.super_class = (Class)CKModifySubscriptionsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend_subscriptionsToSave(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("subscriptions"));

  objc_msgSend_subscriptionIDsToDelete(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("subscriptionIDs"));

  objc_autoreleasePoolPop(v5);
}

- (CKModifySubscriptionsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKModifySubscriptionsOperationInfo *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *subscriptionsToSave;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSArray *subscriptionIDsToDelete;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKModifySubscriptionsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v28, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v7, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("subscriptions"));
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionsToSave = v5->_subscriptionsToSave;
    v5->_subscriptionsToSave = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v27, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v16, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("subscriptionIDs"));
    v23 = objc_claimAutoreleasedReturnValue();
    subscriptionIDsToDelete = v5->_subscriptionIDsToDelete;
    v5->_subscriptionIDsToDelete = (NSArray *)v23;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)subscriptionsToSave
{
  return self->_subscriptionsToSave;
}

- (void)setSubscriptionsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionsToSave, a3);
}

- (NSArray)subscriptionIDsToDelete
{
  return self->_subscriptionIDsToDelete;
}

- (void)setSubscriptionIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
}

@end
