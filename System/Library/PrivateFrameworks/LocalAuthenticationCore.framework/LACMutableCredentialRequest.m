@implementation LACMutableCredentialRequest

- (LACMutableCredentialRequest)init
{
  LACMutableCredentialRequest *result;
  unsigned int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LACMutableCredentialRequest;
  result = -[LACMutableCredentialRequest init](&v4, sel_init);
  if (result)
  {
    v3 = identifierCounter_0++;
    result->_identifier = v3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  int64_t v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_25708BC70))
  {
    v15 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = -[LACMutableCredentialRequest identifier](self, "identifier");
  if (v6 != objc_msgSend(v5, "identifier"))
    goto LABEL_7;
  v7 = -[LACMutableCredentialRequest credential](self, "credential");
  if (v7 != objc_msgSend(v5, "credential"))
    goto LABEL_7;
  v8 = -[LACMutableCredentialRequest userID](self, "userID");
  if (v8 != objc_msgSend(v5, "userID"))
    goto LABEL_7;
  -[LACMutableCredentialRequest externalizedContext](self, "externalizedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalizedContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v10)
  {

    goto LABEL_12;
  }
  v11 = (void *)v10;
  -[LACMutableCredentialRequest externalizedContext](self, "externalizedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalizedContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToData:", v13);

  if (v14)
  {
LABEL_12:
    -[LACMutableCredentialRequest contextID](self, "contextID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {
      v15 = 1;
      v19 = v17;
    }
    else
    {
      v19 = (void *)v18;
      -[LACMutableCredentialRequest contextID](self, "contextID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v20, "isEqual:", v21);

    }
    goto LABEL_8;
  }
LABEL_7:
  v15 = 0;
LABEL_8:

LABEL_10:
  return v15;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v14[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[LACMutableCredentialRequest identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("credential");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[LACMutableCredentialRequest credential](self, "credential"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("userID");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[LACMutableCredentialRequest userID](self, "userID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("contextID");
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[LACMutableCredentialRequest contextID](self, "contextID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (int64_t)credential
{
  return self->_credential;
}

- (void)setCredential:(int64_t)a3
{
  self->_credential = a3;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedContext, a3);
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end
