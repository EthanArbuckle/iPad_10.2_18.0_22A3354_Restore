@implementation CKDAnonymousZoneDataObject

- (CKDAnonymousZoneDataObject)initWithEncryptedData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDAnonymousZoneDataObject *v7;
  uint64_t v8;
  NSData *encryptedTupleData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDAnonymousZoneDataObject;
  v7 = -[CKDAnonymousZoneDataObject init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    encryptedTupleData = v7->_encryptedTupleData;
    v7->_encryptedTupleData = (NSData *)v8;

  }
  return v7;
}

- (CKDAnonymousZoneDataObject)initWithEncryptedData:(id)a3 changeType:(int)a4 deleteType:(int)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  CKDAnonymousZoneDataObject *v11;
  uint64_t v12;
  NSData *encryptedTupleData;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDAnonymousZoneDataObject;
  v11 = -[CKDAnonymousZoneDataObject init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v8, v9, v10);
    encryptedTupleData = v11->_encryptedTupleData;
    v11->_encryptedTupleData = (NSData *)v12;

    v11->_changeType = a4;
    v11->_deleteType = a5;
  }

  return v11;
}

- (NSData)encryptedTupleData
{
  return self->_encryptedTupleData;
}

- (int)changeType
{
  return self->_changeType;
}

- (int)deleteType
{
  return self->_deleteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedTupleData, 0);
}

@end
