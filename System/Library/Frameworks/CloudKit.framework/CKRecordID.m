@implementation CKRecordID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  CKRecordID *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("RecordName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("ZoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  v13 = (CKRecordID *)objc_msgSend_initWithRecordName_zoneID_(self, v12, (uint64_t)v8, (uint64_t)v11);

  return v13;
}

- (CKRecordID)initWithRecordName:(NSString *)recordName
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  CKRecordID *v14;

  v4 = recordName;
  objc_msgSend_defaultRecordZone(CKRecordZone, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CKRecordID *)objc_msgSend_initWithRecordName_zoneID_(self, v13, (uint64_t)v4, (uint64_t)v12);

  return v14;
}

- (CKRecordID)initWithRecordName:(NSString *)recordName zoneID:(CKRecordZoneID *)zoneID
{
  NSString *v7;
  CKRecordZoneID *v8;
  char v9;
  id v10;
  char v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CKRecordID *v21;
  uint64_t v22;
  NSString *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CKRecordZoneID *v28;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  CKException *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;
  objc_super v46;
  id v47;
  id v48;

  v7 = recordName;
  v8 = zoneID;
  v48 = 0;
  v9 = _CKCheckArgument((uint64_t)"recordName", v7, 0, 1, 0, &v48);
  v10 = v48;
  if ((v9 & 1) == 0
    || (v10,
        v47 = 0,
        v11 = _CKCheckArgument((uint64_t)"zoneID", v8, 0, 1, 0, &v47),
        v10 = v47,
        (v11 & 1) == 0))
  {
    v34 = v10;
    v35 = [CKException alloc];
    v39 = objc_msgSend_code(v34, v36, v37, v38);
    objc_msgSend_localizedDescription(v34, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (id)objc_msgSend_initWithCode_format_(v35, v44, v39, (uint64_t)CFSTR("%@"), v43);

    objc_exception_throw(v45);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecordID.m"), 44, CFSTR("Record identifier should be a string"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v15, v16, v17);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, CFSTR("CKRecordID.m"), 45, CFSTR("Zone identifier should be a CKRecordZoneID"));

  }
  v46.receiver = self;
  v46.super_class = (Class)CKRecordID;
  v21 = -[CKRecordID init](&v46, sel_init);
  if (v21)
  {
    v22 = objc_msgSend_copy(v7, v18, v19, v20);
    v23 = v21->_recordName;
    v21->_recordName = (NSString *)v22;

    v27 = objc_msgSend_copy(v8, v24, v25, v26);
    v28 = v21->_zoneID;
    v21->_zoneID = (CKRecordZoneID *)v27;

  }
  return v21;
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKRecordID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
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
  unint64_t v17;

  objc_msgSend_recordName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_zoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (BOOL)isEqual:(id)a3
{
  CKRecordID *v4;
  CKRecordID *v5;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;

  v4 = (CKRecordID *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_recordName(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v9, v13))
      {
        objc_msgSend_zoneID(self, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v5, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CKObjectsAreBothNilOrEqual(v17, v21);

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (id)ckShortDescription
{
  uint64_t v2;

  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
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
  objc_msgSend_recordName(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("%@:(%@)"), v16, v6, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)CKDescribePropertiesUsing:(id)a3
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
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_recordName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("recordName"), (uint64_t)v8, 0);

  objc_msgSend_zoneID(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v13, (uint64_t)CFSTR("zoneID"), (uint64_t)v14, 0);

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
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_recordName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, (uint64_t)CFSTR("RecordName"));

  objc_msgSend_zoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, (uint64_t)CFSTR("ZoneID"));

  objc_autoreleasePoolPop(v4);
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
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

- (CKRecordID)init
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
  v6 = (id)objc_msgSend_initWithName_format_(v4, v5, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("You must call -[%@ initWithRecordName:] or -[%@ initWithRecordName:zoneID:]"), v3, v3);
  objc_exception_throw(v6);
}

- (id)copyWithAnonymousCKUserID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  CKRecordID *v14;
  id v15;
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
  void *v26;
  const char *v27;

  v4 = a3;
  objc_msgSend_zoneID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CKObjectsAreBothNilOrEqual(v12, v4);

  if (v13)
  {
    v14 = self;
  }
  else
  {
    v15 = objc_alloc((Class)objc_opt_class());
    objc_msgSend_recordName(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v23, v24, (uint64_t)v4, v25);
    v14 = (CKRecordID *)objc_msgSend_initWithRecordName_zoneID_(v15, v27, (uint64_t)v19, (uint64_t)v26);

  }
  return v14;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordName(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sqliteRepresentation(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("%@:%@"), v16, v6, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CKRecordID)initWithSqliteRepresentation:(id)a3
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
  CKRecordZoneID *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  CKRecordID *v32;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_componentsSeparatedByString_(v4, v8, (uint64_t)CFSTR(":"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend_count(v10, v11, v12, v13) < 2)
    {
      v32 = 0;
    }
    else
    {
      v14 = [CKRecordZoneID alloc];
      objc_msgSend_objectAtIndexedSubscript_(v10, v15, 0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_length(v17, v18, v19, v20);
      objc_msgSend_substringFromIndex_(v4, v22, v21 + 1, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend_initWithSqliteRepresentation_(v14, v25, (uint64_t)v24, v26);

      objc_msgSend_objectAtIndexedSubscript_(v10, v28, 0, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      self = (CKRecordID *)(id)objc_msgSend_initWithRecordName_zoneID_(self, v31, (uint64_t)v30, (uint64_t)v27);

      v32 = self;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
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
  return (NSString *)((uint64_t (*)(CKRecordID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (BOOL)isEqualIgnoringAnonymousUserIDsToRecordID:(id)a3
{
  CKRecordID *v4;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v46;
  void *v47;

  v4 = (CKRecordID *)a3;
  if (self == v4)
  {
    v44 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_recordName(self, v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v4, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v8, v12))
      {
        objc_msgSend_zoneID(self, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneName(v16, v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v4, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneName(v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (CKObjectsAreBothNilOrEqual(v20, v28))
        {
          objc_msgSend_zoneID(self, v29, v30, v31);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ownerName(v46, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v4, v36, v37, v38);
          v47 = v16;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ownerName(v39, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = CKObjectsAreBothNilOrEqual(v35, v43);

          v16 = v47;
        }
        else
        {
          v44 = 0;
        }

      }
      else
      {
        v44 = 0;
      }

    }
    else
    {
      v44 = 0;
    }
  }

  return v44;
}

- (void)_nilOutRecordName
{
  NSString *recordName;

  recordName = self->_recordName;
  self->_recordName = 0;

}

- (unint64_t)size
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  objc_msgSend_recordName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  v10 = v9 + 2;
  if (v9 >= 0x80)
  {
    do
    {
      ++v10;
      v11 = v9 >> 14;
      v9 >>= 7;
    }
    while (v11);
  }

  objc_msgSend_zoneID(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_length(v19, v20, v21, v22);
  v24 = v23 + 2;
  if (v23 >= 0x80)
  {
    do
    {
      ++v24;
      v25 = v23 >> 14;
      v23 >>= 7;
    }
    while (v25);
  }

  return v10 + v24 + 37;
}

- (int64_t)compareToRecordID:(id)a3
{
  CKRecordID *v4;
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

  v4 = (CKRecordID *)a3;
  objc_msgSend_recordName(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_compare_(v8, v13, (uint64_t)v12, v14);

  if (!v15)
  {
    objc_msgSend_zoneID(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v4, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_compareToRecordZoneID_(v19, v24, (uint64_t)v23, v25);

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

+ (BOOL)isValidRecordName:(id)a3 outError:(id *)a4
{
  return _CKCheckArgument((uint64_t)"recordName", a3, 0, 1, 0, a4);
}

@end
