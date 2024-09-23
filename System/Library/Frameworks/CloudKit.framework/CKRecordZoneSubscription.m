@implementation CKRecordZoneSubscription

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKRecordZoneSubscription)initWithZoneID:(CKRecordZoneID *)zoneID subscriptionID:(CKSubscriptionID)subscriptionID
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKRecordZoneSubscription;
  return (CKRecordZoneSubscription *)-[CKSubscription _initWithSubscriptionID:subscriptionType:recordType:zoneID:](&v5, sel__initWithSubscriptionID_subscriptionType_recordType_zoneID_, subscriptionID, 2, 0, zoneID);
}

- (CKRecordZoneSubscription)initWithZoneID:(CKRecordZoneID *)zoneID
{
  CKRecordZoneID *v4;
  void *v5;
  const char *v6;
  CKRecordZoneSubscription *v7;

  v4 = zoneID;
  CKCreateGUID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CKRecordZoneSubscription *)objc_msgSend_initWithZoneID_subscriptionID_(self, v6, (uint64_t)v4, (uint64_t)v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordZoneSubscription)initWithCoder:(NSCoder *)aDecoder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKRecordZoneSubscription;
  return -[CKSubscription initWithCoder:](&v4, sel_initWithCoder_, aDecoder);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  CKException *v12;
  const char *v13;
  id v14;
  objc_super v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v15.receiver = self;
  v15.super_class = (Class)CKRecordZoneSubscription;
  -[CKSubscription encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend_zoneID(self, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = [CKException alloc];
    v14 = (id)objc_msgSend_initWithName_format_(v12, v13, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("RecordZone subscriptions must have a valid zoneID"));
    objc_exception_throw(v14);
  }
  v11 = (void *)v9;
  objc_msgSend_encodeObject_forKey_(v4, v10, v9, (uint64_t)CFSTR("ZoneID"));

  objc_autoreleasePoolPop(v5);
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
    v11 = (id)objc_msgSend_initWithName_format_(v9, v10, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Subscriptions must not have a zero-length record type (did you mean to set nil?)"));
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKRecordZoneSubscription;
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
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_zoneID(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordType(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("; RecordZone Subscription: zoneID=%@, recordType=%@, subscriptionID=%@"),
    v16,
    v6,
    v10,
    v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CKRecordZoneSubscription *v4;
  CKRecordZoneSubscription *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = (CKRecordZoneSubscription *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CKRecordZoneSubscription;
    if (-[CKSubscription isEqual:](&v16, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      objc_msgSend_zoneID(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = CKObjectsAreBothNilOrEqual(v9, v13);
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKRecordZoneSubscription;
  return -[CKSubscription copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
