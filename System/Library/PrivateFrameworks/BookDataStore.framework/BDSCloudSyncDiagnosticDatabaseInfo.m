@implementation BDSCloudSyncDiagnosticDatabaseInfo

- (BDSCloudSyncDiagnosticDatabaseInfo)initWithAttached:(BOOL)a3 establishedSalt:(BOOL)a4 container:(id)a5
{
  id v9;
  BDSCloudSyncDiagnosticDatabaseInfo *v10;
  BDSCloudSyncDiagnosticDatabaseInfo *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BDSCloudSyncDiagnosticDatabaseInfo;
  v10 = -[BDSCloudSyncDiagnosticDatabaseInfo init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_attached = a3;
    v10->_establishedSalt = a4;
    objc_storeStrong((id *)&v10->_container, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticDatabaseInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BDSCloudSyncDiagnosticDatabaseInfo *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *container;

  v4 = a3;
  v12 = (BDSCloudSyncDiagnosticDatabaseInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
  {
    v12->_attached = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("attached"), v10, v11);
    v12->_establishedSalt = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)CFSTR("establishedSalt"), v14, v15);
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("container"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    container = v12->_container;
    v12->_container = (NSString *)v19;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  id v25;

  v4 = a3;
  v9 = objc_msgSend_attached(self, v5, v6, v7, v8);
  objc_msgSend_encodeBool_forKey_(v4, v10, v9, (uint64_t)CFSTR("attached"), v11);
  v16 = objc_msgSend_establishedSalt(self, v12, v13, v14, v15);
  objc_msgSend_encodeBool_forKey_(v4, v17, v16, (uint64_t)CFSTR("establishedSalt"), v18);
  objc_msgSend_container(self, v19, v20, v21, v22);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v25, (uint64_t)CFSTR("container"), v24);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSCloudSyncDiagnosticDatabaseInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v8 = objc_alloc_init(BDSCloudSyncDiagnosticDatabaseInfo);
  if (v8)
  {
    v9 = objc_msgSend_attached(self, v4, v5, v6, v7);
    objc_msgSend_setAttached_(v8, v10, v9, v11, v12);
    v17 = objc_msgSend_establishedSalt(self, v13, v14, v15, v16);
    objc_msgSend_setEstablishedSalt_(v8, v18, v17, v19, v20);
    objc_msgSend_container(self, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v8, v26, (uint64_t)v25, v27, v28);

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9 = objc_msgSend_attached(self, v5, v6, v7, v8);
  v14 = objc_msgSend_establishedSalt(self, v10, v11, v12, v13);
  objc_msgSend_container(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("<%@: attached:%d, establishedSalt:%d, container:%@>"), v21, v22, v4, v9, v14, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSDictionary)stateForLog
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend_attached(self, v5, v6, v7, v8);
  objc_msgSend_numberWithBool_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("attached"), v15);

  v16 = (void *)MEMORY[0x24BDD16E0];
  v21 = objc_msgSend_establishedSalt(self, v17, v18, v19, v20);
  objc_msgSend_numberWithBool_(v16, v22, v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)CFSTR("establishedSalt"), v27);

  objc_msgSend_container(self, v28, v29, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v32;
  if (v32)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v33, v32, (uint64_t)CFSTR("container"), v34);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)CFSTR("<nil>"), (uint64_t)CFSTR("container"), v34);

  return (NSDictionary *)v3;
}

- (BOOL)attached
{
  return self->_attached;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)establishedSalt
{
  return self->_establishedSalt;
}

- (void)setEstablishedSalt:(BOOL)a3
{
  self->_establishedSalt = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
