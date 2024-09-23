@implementation BCCloudKitRecordZone

- (BCCloudKitRecordZone)initWithRecordZone:(id)a3
{
  id v5;
  BCCloudKitRecordZone *v6;
  BCCloudKitRecordZone *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCCloudKitRecordZone;
  v6 = -[BCCloudKitRecordZone init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recordZone, a3);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend_recordZone(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: %p recordZone:%@>"), v11, v12, v4, self, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZone, 0);
}

@end
