@implementation BDSCloudSyncDiagnosticSyncEngineInfo

- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithEstablishedSalt:(BOOL)a3
{
  BDSCloudSyncDiagnosticSyncEngineInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BDSCloudSyncDiagnosticSyncEngineInfo;
  result = -[BDSCloudSyncDiagnosticSyncEngineInfo init](&v5, sel_init);
  if (result)
    result->_establishedSalt = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v9 = a3;
    objc_opt_class();
    BUDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = 0;
    if (self && v4)
    {
      v10 = objc_msgSend_establishedSalt(self, v5, v6, v7, v8);
      LODWORD(v9) = v10 ^ objc_msgSend_establishedSalt(v4, v11, v12, v13, v14) ^ 1;
    }

  }
  return (char)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticSyncEngineInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BDSCloudSyncDiagnosticSyncEngineInfo *v12;

  v4 = a3;
  v12 = (BDSCloudSyncDiagnosticSyncEngineInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
    v12->_establishedSalt = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("establishedSalt"), v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v8 = objc_msgSend_establishedSalt(self, v4, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(v11, v9, v8, (uint64_t)CFSTR("establishedSalt"), v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSCloudSyncDiagnosticSyncEngineInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = objc_alloc_init(BDSCloudSyncDiagnosticSyncEngineInfo);
  if (v8)
  {
    v9 = objc_msgSend_establishedSalt(self, v4, v5, v6, v7);
    objc_msgSend_setEstablishedSalt_(v8, v10, v9, v11, v12);
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9 = objc_msgSend_establishedSalt(self, v5, v6, v7, v8);
  return (id)objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: establishedSalt:%d>"), v11, v12, v4, v9);
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

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend_establishedSalt(self, v5, v6, v7, v8);
  objc_msgSend_numberWithBool_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("establishedSalt"), v15);

  return (NSDictionary *)v3;
}

- (BOOL)establishedSalt
{
  return self->_establishedSalt;
}

- (void)setEstablishedSalt:(BOOL)a3
{
  self->_establishedSalt = a3;
}

@end
