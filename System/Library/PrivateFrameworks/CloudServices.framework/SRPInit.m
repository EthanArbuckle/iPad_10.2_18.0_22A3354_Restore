@implementation SRPInit

- (SRPInit)initWithSecureBackup:(id)a3
{
  id v5;
  SRPInit *v6;
  SRPInit *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRPInit;
  v6 = -[SRPInit init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sb, a3);

  return v7;
}

- (id)validateInput
{
  return 0;
}

- (NSString)dsid
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sb(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)recoveryPassphrase
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sb(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_passphrase(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)recordLabel
{
  return self->_recordLabel;
}

- (void)setRecordLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (void)setEscrowRecord:(id)a3
{
  objc_storeStrong((id *)&self->_escrowRecord, a3);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SecureBackup)sb
{
  return self->_sb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sb, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);
  objc_storeStrong((id *)&self->_recordLabel, 0);
}

@end
