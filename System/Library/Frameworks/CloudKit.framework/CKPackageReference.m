@implementation CKPackageReference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKPackageReference)initWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 signature:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKPackageReference *v14;
  CKPackageReference *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKPackageReference;
  v14 = -[CKPackageReference init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recordID, a3);
    v15->_databaseScope = a4;
    objc_storeStrong((id *)&v15->_fieldName, a5);
    objc_storeStrong((id *)&v15->_signature, a6);
  }

  return v15;
}

- (CKPackageReference)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  CKPackageReference *v18;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)CFSTR("databaseScope"), v9);
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("fieldName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("signature"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (CKPackageReference *)objc_msgSend_initWithRecordID_databaseScope_fieldName_signature_(self, v17, (uint64_t)v7, v10, v13, v16);
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  CKRecordID *recordID;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;

  recordID = self->_recordID;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)recordID, (uint64_t)CFSTR("recordID"));
  objc_msgSend_encodeInteger_forKey_(v9, v6, self->_databaseScope, (uint64_t)CFSTR("databaseScope"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_fieldName, (uint64_t)CFSTR("fieldName"));
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_signature, (uint64_t)CFSTR("signature"));

}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
