@implementation IDSMPDecryptionResult

- (IDSMPDecryptionResult)initWithData:(id)a3 encryptedAttributes:(id)a4 withCommitState:(id)a5 additionalDecryptionResult:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSMPDecryptionResult *v15;
  IDSMPDecryptionResult *v16;
  void *v17;
  id commitBlock;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSMPDecryptionResult;
  v15 = -[IDSMPDecryptionResult init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_decryptedData, a3);
    objc_storeStrong((id *)&v16->_encryptedAttributes, a4);
    v17 = _Block_copy(v13);
    commitBlock = v16->_commitBlock;
    v16->_commitBlock = v17;

    objc_storeStrong((id *)&v16->_additionalDecryptionResult, a6);
  }

  return v16;
}

- (NSData)decryptedData
{
  return self->_decryptedData;
}

- (void)setDecryptedData:(id)a3
{
  objc_storeStrong((id *)&self->_decryptedData, a3);
}

- (NSDictionary)encryptedAttributes
{
  return self->_encryptedAttributes;
}

- (void)setEncryptedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAttributes, a3);
}

- (id)commitBlock
{
  return self->_commitBlock;
}

- (void)setCommitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)additionalDecryptionResult
{
  return self->_additionalDecryptionResult;
}

- (void)setAdditionalDecryptionResult:(id)a3
{
  objc_storeStrong((id *)&self->_additionalDecryptionResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDecryptionResult, 0);
  objc_storeStrong(&self->_commitBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAttributes, 0);
  objc_storeStrong((id *)&self->_decryptedData, 0);
}

@end
