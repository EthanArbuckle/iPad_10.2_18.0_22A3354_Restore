@implementation CKDAnonymousShareTuple

- (CKDAnonymousShareTuple)initWithZoneID:(id)a3 shareID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDAnonymousShareTuple *v10;
  uint64_t v11;
  CKRecordZoneID *zoneID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKRecordID *shareID;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDAnonymousShareTuple;
  v10 = -[CKDAnonymousShareTuple init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    zoneID = v10->_zoneID;
    v10->_zoneID = (CKRecordZoneID *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    shareID = v10->_shareID;
    v10->_shareID = (CKRecordID *)v15;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v4 = a3;
  objc_msgSend_zoneID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("CKDAnonymousShareZoneID"));

  objc_msgSend_shareID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, CFSTR("CKDAnonymousShareShareID"));

  objc_msgSend_ckAnonymousShareHashIdentifier(self, v13, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v16, CFSTR("CKDAnonymousShareHashIdentifier"));

}

- (CKDAnonymousShareTuple)initWithCoder:(id)a3
{
  id v4;
  CKDAnonymousShareTuple *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKRecordZoneID *zoneID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKRecordID *shareID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *ckAnonymousShareHashIdentifier;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKDAnonymousShareTuple;
  v5 = -[CKDAnonymousShareTuple init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("CKDAnonymousShareZoneID"));
    v8 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("CKDAnonymousShareShareID"));
    v12 = objc_claimAutoreleasedReturnValue();
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("CKDAnonymousShareHashIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    ckAnonymousShareHashIdentifier = v5->_ckAnonymousShareHashIdentifier;
    v5->_ckAnonymousShareHashIdentifier = (NSString *)v16;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKDAnonymousShareTuple *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKRecordZoneID *zoneID;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKRecordID *shareID;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *ckAnonymousShareHashIdentifier;

  v4 = objc_alloc_init(CKDAnonymousShareTuple);
  objc_msgSend_zoneID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_copy(v7, v8, v9);
  zoneID = v4->_zoneID;
  v4->_zoneID = (CKRecordZoneID *)v10;

  objc_msgSend_shareID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_copy(v14, v15, v16);
  shareID = v4->_shareID;
  v4->_shareID = (CKRecordID *)v17;

  objc_msgSend_ckAnonymousShareHashIdentifier(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v21, v22, v23);
  ckAnonymousShareHashIdentifier = v4->_ckAnonymousShareHashIdentifier;
  v4->_ckAnonymousShareHashIdentifier = (NSString *)v24;

  return v4;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (NSString)ckAnonymousShareHashIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCkAnonymousShareHashIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAnonymousShareHashIdentifier, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
