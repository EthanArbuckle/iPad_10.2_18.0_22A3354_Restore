@implementation CKDatabaseSubscription

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKDatabaseSubscription)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  CKDatabaseSubscription *v6;

  CKCreateGUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CKDatabaseSubscription *)objc_msgSend_initWithSubscriptionID_(self, v4, (uint64_t)v3, v5);

  return v6;
}

+ (CKDatabaseSubscription)new
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  CKDatabaseSubscription *v6;

  v2 = objc_alloc((Class)a1);
  CKCreateGUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CKDatabaseSubscription *)objc_msgSend_initWithSubscriptionID_(v2, v4, (uint64_t)v3, v5);

  return v6;
}

- (CKDatabaseSubscription)initWithSubscriptionID:(CKSubscriptionID)subscriptionID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDatabaseSubscription;
  return (CKDatabaseSubscription *)-[CKSubscription _initWithSubscriptionID:subscriptionType:recordType:zoneID:](&v4, sel__initWithSubscriptionID_subscriptionType_recordType_zoneID_, subscriptionID, 3, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDatabaseSubscription)initWithCoder:(NSCoder *)aDecoder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDatabaseSubscription;
  return -[CKSubscription initWithCoder:](&v4, sel_initWithCoder_, aDecoder);
}

- (void)setRecordType:(CKRecordType)recordType
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  CKException *v9;
  const char *v10;
  id v11;
  objc_super v12;

  v4 = recordType;
  v8 = v4;
  if (v4 && !objc_msgSend_length(v4, v5, v6, v7))
  {
    v9 = [CKException alloc];
    v11 = (id)objc_msgSend_initWithName_format_(v9, v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Subscriptions must not have a nil or valid record type"));
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKDatabaseSubscription;
  -[CKSubscription setRecordType:](&v12, sel_setRecordType_, v8);

}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordType(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("; Database Subscription: recordType=%@, subscriptionID=%@"),
    v12,
    v6,
    v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
