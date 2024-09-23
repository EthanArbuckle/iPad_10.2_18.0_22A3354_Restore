@implementation CKQuerySubscription

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKQuerySubscription)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate subscriptionID:(CKSubscriptionID)subscriptionID options:(CKQuerySubscriptionOptions)querySubscriptionOptions
{
  NSString *v10;
  NSPredicate *v11;
  NSString *v12;
  char v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKQuerySubscription *v18;
  uint64_t v19;
  NSPredicate *v20;
  const char *v21;
  uint64_t v22;
  void *v24;
  CKException *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;
  CKException *v36;
  const char *v37;
  id v38;
  objc_super v39;
  id v40;

  v10 = recordType;
  v11 = predicate;
  v12 = subscriptionID;
  v40 = 0;
  v13 = _CKCheckArgument((uint64_t)"recordType", v10, 1, 1, 0, &v40);
  v14 = v40;
  if ((v13 & 1) == 0)
  {
    v24 = v14;
    v25 = [CKException alloc];
    v29 = objc_msgSend_code(v24, v26, v27, v28);
    objc_msgSend_localizedDescription(v24, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)objc_msgSend_initWithCode_format_(v25, v34, v29, (uint64_t)CFSTR("%@"), v33);

    objc_exception_throw(v35);
  }

  if (!v11)
  {
    v36 = [CKException alloc];
    v38 = (id)objc_msgSend_initWithName_format_(v36, v37, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Predicate can not be nil. Use [NSPredicate predicateWithValue:YES] / NSPredicate(value: true) to query all records"));
    objc_exception_throw(v38);
  }
  v39.receiver = self;
  v39.super_class = (Class)CKQuerySubscription;
  v18 = -[CKSubscription _initWithSubscriptionID:subscriptionType:recordType:zoneID:](&v39, sel__initWithSubscriptionID_subscriptionType_recordType_zoneID_, v12, 1, v10, 0);
  if (v18)
  {
    objc_msgSend_CKDeepCopy(v11, v15, v16, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v18->_predicate;
    v18->_predicate = (NSPredicate *)v19;

    objc_msgSend__validateQuerySubscriptionOptions_(v18, v21, querySubscriptionOptions, v22);
    v18->_querySubscriptionOptions = querySubscriptionOptions;
  }

  return v18;
}

- (CKQuerySubscription)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate options:(CKQuerySubscriptionOptions)querySubscriptionOptions
{
  NSPredicate *v8;
  NSString *v9;
  void *v10;
  const char *v11;
  CKQuerySubscription *v12;

  v8 = predicate;
  v9 = recordType;
  CKCreateGUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CKQuerySubscription *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(self, v11, (uint64_t)v9, (uint64_t)v8, v10, querySubscriptionOptions);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKQuerySubscription)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CKQuerySubscription *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSPredicate *predicate;
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v4 = aDecoder;
  v14.receiver = self;
  v14.super_class = (Class)CKQuerySubscription;
  v5 = -[CKSubscription initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    CKAcceptablePredicateValueClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v8, (uint64_t)v7, (uint64_t)CFSTR("predicate"));
    v9 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v9;

    v5->_querySubscriptionOptions = objc_msgSend_decodeInt64ForKey_(v4, v11, (uint64_t)CFSTR("options"), v12);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t SubscriptionOptions;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  CKException *v29;
  const char *v30;
  id v31;
  objc_super v32;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_recordType(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v9, v10, v11, v12);

  if (!v13)
  {
    v29 = [CKException alloc];
    v31 = (id)objc_msgSend_initWithName_format_(v29, v30, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Query subscriptions must have a valid record type"));
    objc_exception_throw(v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)CKQuerySubscription;
  -[CKSubscription encodeWithCoder:](&v32, sel_encodeWithCoder_, v4);
  objc_msgSend__predicateWithoutCopy(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v17, (uint64_t)CFSTR("predicate"));

  SubscriptionOptions = objc_msgSend_querySubscriptionOptions(self, v19, v20, v21);
  objc_msgSend_encodeInt64_forKey_(v4, v23, SubscriptionOptions, (uint64_t)CFSTR("options"));
  objc_msgSend_zoneID(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v27, (uint64_t)CFSTR("ZoneID"));

  objc_autoreleasePoolPop(v5);
}

- (void)_validateQuerySubscriptionOptions:(unint64_t)a3
{
  CKException *v3;
  const char *v4;
  id v5;

  if ((a3 & 7) == 0)
  {
    v3 = [CKException alloc];
    v5 = (id)objc_msgSend_initWithName_format_(v3, v4, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Query subscriptions options must include at least one firing behavior"));
    objc_exception_throw(v5);
  }
}

- (NSPredicate)predicate
{
  uint64_t v2;
  uint64_t v3;

  return (NSPredicate *)objc_msgSend_CKDeepCopy(self->_predicate, a2, v2, v3);
}

- (id)_predicateWithoutCopy
{
  return self->_predicate;
}

- (void)setRecordType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKException *v8;
  const char *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6, v7))
  {
    v8 = [CKException alloc];
    v10 = (id)objc_msgSend_initWithName_format_(v8, v9, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Query subscriptions must have a valid record type"));
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)CKQuerySubscription;
  -[CKSubscription setRecordType:](&v11, sel_setRecordType_, v4);

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
  uint64_t SubscriptionOptions;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordType(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__predicateWithoutCopy(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SubscriptionOptions = objc_msgSend_querySubscriptionOptions(self, v11, v12, v13);
  objc_msgSend_subscriptionID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("; Query Subscription: recordType=%@, predicate=%@, subscriptionOptions=%x, subscriptionID=%@, zoneID=%@"),
    v24,
    v6,
    v10,
    SubscriptionOptions,
    v18,
    v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKQuerySubscription;
  v4 = -[CKSubscription copyWithZone:](&v14, sel_copyWithZone_, a3);
  objc_msgSend__predicateWithoutCopy(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[6];
  v4[6] = v8;

  v4[7] = objc_msgSend_querySubscriptionOptions(self, v10, v11, v12);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKQuerySubscription *v4;
  CKQuerySubscription *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t SubscriptionOptions;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  objc_super v32;

  v4 = (CKQuerySubscription *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)CKQuerySubscription;
    if (-[CKSubscription isEqual:](&v32, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      objc_msgSend__predicateWithoutCopy(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__predicateWithoutCopy(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (SubscriptionOptions = objc_msgSend_querySubscriptionOptions(self, v15, v16, v17),
            SubscriptionOptions == objc_msgSend_querySubscriptionOptions(v5, v19, v20, v21)))
      {
        objc_msgSend_zoneID(self, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v5, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CKObjectsAreBothNilOrEqual(v25, v29);

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (void)setRecordType_modelMutation:(id)a3
{
  ((void (*)(CKQuerySubscription *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_setRecordType_, a3);
}

- (void)setPredicate_modelMutation:(id)a3
{
  uint64_t v3;
  NSPredicate *v5;
  NSPredicate *predicate;

  objc_msgSend_CKDeepCopy(a3, a2, (uint64_t)a3, v3);
  v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v5;

}

- (void)setQuerySubscriptionOptions_modelMutation:(unint64_t)a3
{
  self->_querySubscriptionOptions = a3;
}

- (CKQuerySubscriptionOptions)querySubscriptionOptions
{
  return self->_querySubscriptionOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
