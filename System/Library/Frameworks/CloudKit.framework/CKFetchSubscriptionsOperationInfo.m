@implementation CKFetchSubscriptionsOperationInfo

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
  uint64_t AllSubscriptionsOperation;
  const char *v15;
  objc_super v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v16.receiver = self;
  v16.super_class = (Class)CKFetchSubscriptionsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend_subscriptionIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("subscriptionIDs"));

  AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, AllSubscriptionsOperation, (uint64_t)CFSTR("isFetchAllSubscriptionsOperation"));
  objc_autoreleasePoolPop(v5);

}

- (CKFetchSubscriptionsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchSubscriptionsOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *subscriptionIDs;
  const char *v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKFetchSubscriptionsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("subscriptionIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionIDs = v5->_subscriptionIDs;
    v5->_subscriptionIDs = (NSArray *)v14;

    v5->_isFetchAllSubscriptionsOperation = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("isFetchAllSubscriptionsOperation"), v17);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIDs, a3);
}

- (BOOL)isFetchAllSubscriptionsOperation
{
  return self->_isFetchAllSubscriptionsOperation;
}

- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3
{
  self->_isFetchAllSubscriptionsOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
}

@end
