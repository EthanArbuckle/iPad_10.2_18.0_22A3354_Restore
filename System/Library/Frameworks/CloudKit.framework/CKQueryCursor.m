@implementation CKQueryCursor

- (CKQueryCursor)initWithData:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKQueryCursor *v11;
  uint64_t v12;
  NSData *data;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKRecordZoneID *zoneID;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKQueryCursor;
  v11 = -[CKQueryCursor init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    data = v11->_data;
    v11->_data = (NSData *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    zoneID = v11->_zoneID;
    v11->_zoneID = (CKRecordZoneID *)v17;

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKQueryCursor)init
{
  CKException *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = [CKException alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, (uint64_t)CFSTR("You can't call init on %@"), v4);

  objc_exception_throw(v6);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;

  objc_msgSend_data(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKSHA256(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v13 = objc_msgSend_length(v9, v10, v11, v12);
    if (v13 >= 16)
      v16 = 16;
    else
      v16 = v13;
    objc_msgSend_substringToIndex_(v9, v14, v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_zoneID(self, v10, v11, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v18, v20, (uint64_t)CFSTR("id=%@, zone=%@"), v21, v17, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)description
{
  return (id)((uint64_t (*)(CKQueryCursor *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  objc_msgSend_data(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, (uint64_t)CFSTR("CursorData"));

  objc_msgSend_zoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, (uint64_t)CFSTR("ZoneID"));

  objc_autoreleasePoolPop(v4);
}

- (CKQueryCursor)initWithCoder:(id)a3
{
  id v4;
  CKQueryCursor *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *data;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  CKRecordZoneID *zoneID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKQueryCursor;
  v5 = -[CKQueryCursor init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("CursorData"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("ZoneID"));
    v13 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v13;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

@end
