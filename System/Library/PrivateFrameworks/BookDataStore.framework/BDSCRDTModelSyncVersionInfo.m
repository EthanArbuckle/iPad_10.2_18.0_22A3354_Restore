@implementation BDSCRDTModelSyncVersionInfo

- (BDSCRDTModelSyncVersionInfo)initWithData:(id)a3
{
  id v5;
  BDSCRDTModelSyncVersionInfo *v6;
  BDSCRDTModelSyncVersionInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BDSCRDTModelSyncVersionInfo;
  v6 = -[BDSCRDTModelSyncVersionInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCRDTModelSyncVersionInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSCRDTModelSyncVersionInfo *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *data;

  v4 = a3;
  v9 = (BDSCRDTModelSyncVersionInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("data"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    data = v9->_data;
    v9->_data = (NSData *)v13;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend_data(self, v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v11, (uint64_t)CFSTR("data"), v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSCRDTModelSyncVersionInfo *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = objc_alloc_init(BDSCRDTModelSyncVersionInfo);
  if (v8)
  {
    objc_msgSend_data(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setData_(v8, v10, (uint64_t)v9, v11, v12);

  }
  return v8;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
