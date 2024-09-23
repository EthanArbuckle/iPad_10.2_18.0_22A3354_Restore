@implementation CKDRecordResponse

- (CKDRecordResponse)initWithRecordID:(id)a3 record:(id)a4 etag:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  CKDRecordResponse *v13;
  uint64_t v14;
  CKRecordID *recordID;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *etag;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CKDRecordResponse;
  v13 = -[CKDRecordResponse init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    recordID = v13->_recordID;
    v13->_recordID = (CKRecordID *)v14;

    objc_storeStrong((id *)&v13->_record, a4);
    v18 = objc_msgSend_copy(v10, v16, v17);
    etag = v13->_etag;
    v13->_etag = (NSString *)v18;

  }
  return v13;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(self, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("true");
  if (!v12)
    v13 = CFSTR("false");
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("recordID=%@, etag=%@, hasRecord=%@"), v5, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDRecordResponse *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecord)record
{
  return self->_record;
}

- (NSString)etag
{
  return self->_etag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
