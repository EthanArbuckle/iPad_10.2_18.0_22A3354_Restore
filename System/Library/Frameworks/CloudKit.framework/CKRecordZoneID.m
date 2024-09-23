@implementation CKRecordZoneID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousCKUserID, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordZoneID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  CKRecordZoneID *v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("ZoneName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("ownerName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("anonymousCKUserID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("databaseScopeKey"), v16);
  objc_autoreleasePoolPop(v5);
  v19 = (CKRecordZoneID *)objc_msgSend__initWithZoneName_ownerName_anonymousCKUserID_databaseScope_(self, v18, (uint64_t)v8, (uint64_t)v11, v14, v17);

  return v19;
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
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  id v25;

  v25 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_zoneName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, (uint64_t)CFSTR("ZoneName"));

  objc_msgSend_ownerName(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v14, (uint64_t)v13, (uint64_t)CFSTR("ownerName"));

  objc_msgSend_anonymousCKUserID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, (uint64_t)CFSTR("anonymousCKUserID"));

  v23 = objc_msgSend_databaseScope(self, v20, v21, v22);
  objc_msgSend_encodeInteger_forKey_(v25, v24, v23, (uint64_t)CFSTR("databaseScopeKey"));
  objc_autoreleasePoolPop(v4);

}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (id)sqliteRepresentation
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
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  objc_msgSend_anonymousCKUserID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_zoneName(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(self, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v14;
  if (v5)
    objc_msgSend_stringWithFormat_(v6, v15, (uint64_t)CFSTR("%@:%@%@%@"), v16, v10, v14, CFSTR(":"), v5);
  else
    objc_msgSend_stringWithFormat_(v6, v15, (uint64_t)CFSTR("%@:%@%@%@"), v16, v10, v14, &stru_1E1F66ED0, &stru_1E1F66ED0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_zoneName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_ownerName(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_anonymousCKUserID(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (NSString)anonymousCKUserID
{
  return self->_anonymousCKUserID;
}

- (CKRecordZoneID)initWithZoneName:(NSString *)zoneName ownerName:(NSString *)ownerName
{
  NSString *v6;
  NSString *v7;
  char v8;
  id v9;
  char v10;
  void *v11;
  const char *v12;
  CKRecordZoneID *v13;
  void *v15;
  CKException *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  id v27;
  id v28;

  v6 = zoneName;
  v7 = ownerName;
  v28 = 0;
  v8 = _CKCheckArgument((uint64_t)"zoneName", v6, 0, 1, 0, &v28);
  v9 = v28;
  if ((v8 & 1) == 0
    || (v9,
        v27 = 0,
        v10 = _CKCheckArgument((uint64_t)"ownerName", v7, 0, 1, 0, &v27),
        v9 = v27,
        (v10 & 1) == 0))
  {
    v15 = v9;
    v16 = [CKException alloc];
    v20 = objc_msgSend_code(v15, v17, v18, v19);
    objc_msgSend_localizedDescription(v15, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend_initWithCode_format_(v16, v25, v20, (uint64_t)CFSTR("%@"), v24);

    objc_exception_throw(v26);
  }

  v11 = (void *)objc_opt_class();
  objc_msgSend_cachedRecordZoneIDWithName_ownerName_anonymousCKUserID_databaseScope_(v11, v12, (uint64_t)v6, (uint64_t)v7, 0, 0);
  v13 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)cachedRecordZoneIDWithName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6
{
  id v10;
  id v11;
  __CFString *v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  const char *v28;
  CKException *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;
  id v41;
  id v42;

  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  v42 = 0;
  v13 = _CKCheckArgument((uint64_t)"zoneName", v10, 0, 1, 0, &v42);
  v14 = v42;
  v15 = v14;
  if ((v13 & 1) == 0
    || (v14,
        v41 = 0,
        v16 = _CKCheckArgument((uint64_t)"ownerName", v11, 0, 1, 0, &v41),
        v17 = v41,
        v15 = v17,
        (v16 & 1) == 0))
  {
    v30 = [CKException alloc];
    v34 = objc_msgSend_code(v15, v31, v32, v33);
    objc_msgSend_localizedDescription(v15, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend_initWithCode_format_(v30, v39, v34, (uint64_t)CFSTR("%@"), v38);

    objc_exception_throw(v40);
  }

  if (qword_1ECD96A80 != -1)
    dispatch_once(&qword_1ECD96A80, &unk_1E1F582B8);
  v20 = &stru_1E1F66ED0;
  if (v12)
    v20 = v12;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("%@%@%@%ld"), v19, v10, v11, v20, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)qword_1ECD96A78;
  objc_sync_enter(v22);
  objc_msgSend_objectForKey_((void *)qword_1ECD96A78, v23, (uint64_t)v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = objc_alloc((Class)a1);
    v25 = (void *)objc_msgSend__initWithZoneName_ownerName_anonymousCKUserID_databaseScope_(v26, v27, (uint64_t)v10, (uint64_t)v11, v12, a6);
    objc_msgSend_setObject_forKey_((void *)qword_1ECD96A78, v28, (uint64_t)v25, (uint64_t)v21);
  }
  objc_sync_exit(v22);

  return v25;
}

- (id)_initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKRecordZoneID *v16;
  uint64_t v17;
  NSString *zoneName;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *ownerName;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *anonymousCKUserID;
  objc_super v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CKRecordZoneID;
  v16 = -[CKRecordZoneID init](&v30, sel_init);
  if (v16)
  {
    v17 = objc_msgSend_copy(v10, v13, v14, v15);
    zoneName = v16->_zoneName;
    v16->_zoneName = (NSString *)v17;

    v22 = objc_msgSend_copy(v11, v19, v20, v21);
    ownerName = v16->_ownerName;
    v16->_ownerName = (NSString *)v22;

    v27 = objc_msgSend_copy(v12, v24, v25, v26);
    anonymousCKUserID = v16->_anonymousCKUserID;
    v16->_anonymousCKUserID = (NSString *)v27;

    v16->_databaseScope = a6;
  }

  return v16;
}

- (id)ckShortDescription
{
  uint64_t v2;

  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordZoneID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)isEqual:(id)a3
{
  CKRecordZoneID *v4;
  CKRecordZoneID *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  v4 = (CKRecordZoneID *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend_databaseScope(self, v6, v7, v8) && objc_msgSend_databaseScope(v5, v9, v10, v11))
      {
        v12 = objc_msgSend_databaseScope(self, v9, v10, v11);
        v16 = v12 == objc_msgSend_databaseScope(v5, v13, v14, v15);
      }
      else
      {
        v16 = 1;
      }
      objc_msgSend_zoneName(self, v9, v10, v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v18, v22))
      {
        objc_msgSend_ownerName(self, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ownerName(v5, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (CKObjectsAreBothNilOrEqual(v26, v30))
        {
          objc_msgSend_anonymousCKUserID(self, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v5, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = CKObjectsAreBothNilOrEqual(v34, v38) & v16;

        }
        else
        {
          LOBYTE(v17) = 0;
        }

      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5 databaseScope:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  CKRecordZoneID *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_class();
  objc_msgSend_cachedRecordZoneIDWithName_ownerName_anonymousCKUserID_databaseScope_(v13, v14, (uint64_t)v12, (uint64_t)v11, v10, a6);
  v15 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;

  v30 = a3;
  objc_msgSend_zoneName(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v30, v8, (uint64_t)CFSTR("zoneName"), (uint64_t)v7, 0);

  objc_msgSend_ownerName(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v30, v13, (uint64_t)CFSTR("ownerName"), (uint64_t)v12, 0);

  objc_msgSend_anonymousCKUserID(self, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend_addProperty_value_shouldRedact_(v30, v17, (uint64_t)CFSTR("anonymousCKUserID"), (uint64_t)v20, 0);
  if (objc_msgSend_databaseScope(self, v17, v18, v19))
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = objc_msgSend_databaseScope(self, v21, v22, v23);
    objc_msgSend_numberWithInteger_(v24, v26, v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v30, v29, (uint64_t)CFSTR("databaseScope"), (uint64_t)v28, 0);

  }
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKRecordZoneID)init
{
  objc_class *v2;
  uint64_t v3;
  CKException *v4;
  const char *v5;
  id v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = [CKException alloc];
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You must call -[%@ initWithZoneName:ownerName:]"), v3);
  objc_exception_throw(v6);
}

- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 databaseScope:(int64_t)a5
{
  return (CKRecordZoneID *)MEMORY[0x1E0DE7D20](self, sel_initWithZoneName_ownerName_anonymousCKUserID_databaseScope_, a3, a4);
}

- (CKRecordZoneID)initWithZoneName:(id)a3 ownerName:(id)a4 anonymousCKUserID:(id)a5
{
  return (CKRecordZoneID *)MEMORY[0x1E0DE7D20](self, sel_initWithZoneName_ownerName_anonymousCKUserID_databaseScope_, a3, a4);
}

- (id)copyWithAnonymousCKUserID:(id)a3
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_zoneName(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_databaseScope(self, v14, v15, v16);
  objc_msgSend_cachedRecordZoneIDWithName_ownerName_anonymousCKUserID_databaseScope_(v5, v18, (uint64_t)v9, (uint64_t)v13, v4, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (CKRecordZoneID)initWithSqliteRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  CKRecordZoneID *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_componentsSeparatedByString_(v4, v8, (uint64_t)CFSTR(":"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend_count(v10, v11, v12, v13) < 3)
    {
      if ((unint64_t)objc_msgSend_count(v10, v14, v15, v16) < 2)
      {
        v25 = 0;
        goto LABEL_9;
      }
      objc_msgSend_objectAtIndexedSubscript_(v10, v26, 1, v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v10, v28, 0, v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      self = (CKRecordZoneID *)(id)objc_msgSend_initWithZoneName_ownerName_(self, v30, (uint64_t)v20, (uint64_t)v17);
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v10, v14, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v10, v18, 1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v10, v21, 2, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      self = (CKRecordZoneID *)(id)objc_msgSend_initWithZoneName_ownerName_anonymousCKUserID_(self, v24, (uint64_t)v17, (uint64_t)v20, v23);

    }
    v25 = self;
LABEL_9:

    goto LABEL_10;
  }
  v25 = 0;
LABEL_10:

  return v25;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_sqliteRepresentation(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("sqliteRepresentation"));

  objc_msgSend_properties(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v12;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKRecordZoneID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (int64_t)compareToRecordZoneID:(id)a3
{
  CKRecordZoneID *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = (CKRecordZoneID *)a3;
  objc_msgSend_zoneName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_compare_(v8, v13, (uint64_t)v12, v14);

  if (!v15)
  {
    objc_msgSend_ownerName(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ownerName(v4, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_compare_(v19, v24, (uint64_t)v23, v25);

    v27 = -1;
    if (self >= v4)
      v27 = self > v4;
    if (v26)
      v15 = v26;
    else
      v15 = v27;
  }

  return v15;
}

- (BOOL)isDefaultRecordZoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  char isEqualToString;

  objc_msgSend_zoneName(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("_defaultZone"), v6);

  return isEqualToString;
}

- (BOOL)isSystemRecordZoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  char isEqualToString;

  objc_msgSend_zoneName(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("_systemZone"), v6);

  return isEqualToString;
}

- (BOOL)hasSameOwnerAs:(id)a3
{
  uint64_t v3;

  if (self->_databaseScope == *((_QWORD *)a3 + 4))
    return objc_msgSend_isEqualToString_(self->_ownerName, a2, *((_QWORD *)a3 + 2), v3);
  else
    return 0;
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);

}

@end
