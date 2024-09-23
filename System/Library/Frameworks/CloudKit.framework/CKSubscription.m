@implementation CKSubscription

+ (void)initialize
{
  objc_class *v3;
  const char *v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v6, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A5CEF4C((uint64_t)a1, v3, v5, 0, 0);

}

- (id)_initWithSubscriptionID:(id)a3 subscriptionType:(int64_t)a4 recordType:(id)a5 zoneID:(id)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKSubscription *v18;
  uint64_t v19;
  NSString *subscriptionID;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *recordType;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CKRecordZoneID *zoneID;
  void *v32;
  CKException *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id v43;
  objc_super v44;
  id v45;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v45 = 0;
  v13 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 1, 0, &v45);
  v14 = v45;
  if ((v13 & 1) == 0)
  {
    v32 = v14;
    v33 = [CKException alloc];
    v37 = objc_msgSend_code(v32, v34, v35, v36);
    objc_msgSend_localizedDescription(v32, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend_initWithCode_format_(v33, v42, v37, (uint64_t)CFSTR("%@"), v41);

    objc_exception_throw(v43);
  }

  v44.receiver = self;
  v44.super_class = (Class)CKSubscription;
  v18 = -[CKSubscription init](&v44, sel_init);
  if (v18)
  {
    v19 = objc_msgSend_copy(v10, v15, v16, v17);
    subscriptionID = v18->_subscriptionID;
    v18->_subscriptionID = (NSString *)v19;

    v18->_subscriptionType = a4;
    v24 = objc_msgSend_copy(v11, v21, v22, v23);
    recordType = v18->_recordType;
    v18->_recordType = (NSString *)v24;

    v29 = objc_msgSend_copy(v12, v26, v27, v28);
    zoneID = v18->_zoneID;
    v18->_zoneID = (CKRecordZoneID *)v29;

  }
  return v18;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  v5 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend_description(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithString_(v5, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_notificationInfo(self, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend_appendString_(v9, v13, (uint64_t)CFSTR("\n{\n"), v14);
    objc_msgSend_debugDescription(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v9, v20, (uint64_t)v19, v21);

    objc_msgSend_appendString_(v9, v22, (uint64_t)CFSTR("\n}"), v23);
  }

  return v9;
}

- (id)description
{
  return (id)((uint64_t (*)(CKSubscription *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKSubscription)init
{
  CKException *v2;
  const char *v3;
  id v4;

  v2 = [CKException alloc];
  v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You must instantiate one of the CKSubscription subclasses"));
  objc_exception_throw(v4);
}

- (CKRecordZoneID)zoneID
{
  uint64_t v3;
  CKException *v5;
  const char *v6;
  id v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v5 = [CKException alloc];
    v7 = (id)objc_msgSend_initWithName_format_(v5, v6, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You may not call -zoneID on a CKSubscription"));
    objc_exception_throw(v7);
  }
  return self->_zoneID;
}

- (BOOL)isEqual:(id)a3
{
  CKSubscription *v4;
  CKSubscription *v5;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;

  v4 = (CKSubscription *)a3;
  if (self == v4)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_recordType(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordType(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (objc_msgSend_subscriptionID(self, v15, v16, v17),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_subscriptionID(v5, v19, v20, v21),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = CKObjectsAreBothNilOrEqual(v18, v22),
            v22,
            v18,
            v23))
      {
        objc_msgSend_notificationInfo(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_notificationInfo(v5, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_subscriptionID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  _QWORD *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_subscriptionID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_subscriptionType(self, v9, v10, v11);
  objc_msgSend_recordType(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (_QWORD *)objc_msgSend__initWithSubscriptionID_subscriptionType_recordType_zoneID_(v4, v21, (uint64_t)v8, v12, v16, v20);

  objc_msgSend_notificationInfo(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_copy(v26, v27, v28, v29);
  v31 = (void *)v22[3];
  v22[3] = v30;

  objc_msgSend_zoneID(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_copy(v35, v36, v37, v38);
  v40 = (void *)v22[5];
  v22[5] = v39;

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKSubscription)initWithCoder:(id)a3
{
  id v4;
  CKSubscription *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *subscriptionID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSString *recordType;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKNotificationInfo *notificationInfo;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  CKRecordZoneID *zoneID;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKSubscription;
  v5 = -[CKSubscription init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("serverID"));
    v9 = objc_claimAutoreleasedReturnValue();
    subscriptionID = v5->_subscriptionID;
    v5->_subscriptionID = (NSString *)v9;

    v5->_subscriptionType = objc_msgSend_decodeInt64ForKey_(v4, v11, (uint64_t)CFSTR("subscriptionType"), v12);
    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("recordType"));
    v15 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v15;

    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("notificationInfo"));
    v19 = objc_claimAutoreleasedReturnValue();
    notificationInfo = v5->_notificationInfo;
    v5->_notificationInfo = (CKNotificationInfo *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("ZoneID"));
    v23 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v23;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;

  v25 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_subscriptionID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, (uint64_t)CFSTR("serverID"));

  v13 = objc_msgSend_subscriptionType(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v25, v14, v13, (uint64_t)CFSTR("subscriptionType"));
  objc_msgSend_recordType(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, (uint64_t)CFSTR("recordType"));

  objc_msgSend_notificationInfo(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, (uint64_t)CFSTR("notificationInfo"));

  objc_autoreleasePoolPop(v4);
}

- (void)setSubscriptionID_modelMutation:(id)a3
{
  uint64_t v3;
  NSString *v5;
  NSString *subscriptionID;

  v5 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  subscriptionID = self->_subscriptionID;
  self->_subscriptionID = v5;

}

- (CKSubscriptionID)subscriptionID
{
  return (CKSubscriptionID)objc_getProperty(self, a2, 8, 1);
}

- (CKSubscriptionType)subscriptionType
{
  return self->_subscriptionType;
}

- (CKNotificationInfo)notificationInfo
{
  return (CKNotificationInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationInfo:(CKNotificationInfo *)notificationInfo
{
  objc_setProperty_atomic_copy(self, a2, notificationInfo, 24);
}

- (NSString)recordType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecordType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

- (CKSubscription)initWithZoneID:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  CKRecordZoneSubscription *v8;
  void *v9;
  const char *v10;
  CKSubscription *v11;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v7 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v13 = v7;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v14;
    _os_log_fault_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKRecordZoneSubscription", (uint8_t *)&v15, 0xCu);

  }
  v8 = [CKRecordZoneSubscription alloc];
  CKCreateGUID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (CKSubscription *)objc_msgSend_initWithZoneID_subscriptionID_(v8, v10, (uint64_t)v6, (uint64_t)v9);

  return v11;
}

- (CKSubscription)initWithZoneID:(id)a3 subscriptionID:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  CKRecordZoneSubscription *v11;
  const char *v12;
  CKSubscription *v13;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v10 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v15 = v10;
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v16;
    _os_log_fault_impl(&dword_18A5C5000, v15, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKRecordZoneSubscription", (uint8_t *)&v17, 0xCu);

  }
  v11 = [CKRecordZoneSubscription alloc];
  v13 = (CKSubscription *)objc_msgSend_initWithZoneID_subscriptionID_(v11, v12, (uint64_t)v8, (uint64_t)v9);

  return v13;
}

- (CKSubscription)initWithRecordType:(id)a3 predicate:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  CKQuerySubscription *v12;
  void *v13;
  const char *v14;
  CKSubscription *v15;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v11 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v17 = v11;
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v18;
    _os_log_fault_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKQuerySubscription", (uint8_t *)&v19, 0xCu);

  }
  v12 = [CKQuerySubscription alloc];
  CKCreateGUID();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CKSubscription *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(v12, v14, (uint64_t)v9, (uint64_t)v10, v13, a5);

  return v15;
}

- (CKSubscription)initWithRecordType:(id)a3 predicate:(id)a4 subscriptionID:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  CKQuerySubscription *v15;
  const char *v16;
  CKSubscription *v17;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v19 = v14;
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v20;
    _os_log_fault_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKQuerySubscription", (uint8_t *)&v21, 0xCu);

  }
  v15 = [CKQuerySubscription alloc];
  v17 = (CKSubscription *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(v15, v16, (uint64_t)v11, (uint64_t)v12, v13, a6);

  return v17;
}

- (unint64_t)subscriptionOptions
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v9 = v4;
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_fault_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to querySubscriptionOptions", (uint8_t *)&v11, 0xCu);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend_querySubscriptionOptions(self, v5, v6, v7);
  else
    return 0;
}

- (id)predicate
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v10 = v4;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_fault_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKQuerySubscription", (uint8_t *)&v12, 0xCu);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_predicate(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
