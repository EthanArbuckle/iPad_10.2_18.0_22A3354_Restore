@implementation COIDSMessageFactory

- (COIDSMessageFactory)init
{
  COIDSMessageFactory *v2;
  uint64_t v3;
  NSString *idsIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COIDSMessageFactory;
  v2 = -[COIDSMessageFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = IDSCopyLocalDeviceUniqueID();
    idsIdentifier = v2->_idsIdentifier;
    v2->_idsIdentifier = (NSString *)v3;

  }
  return v2;
}

- (id)encodeRequest:(id)a3 withIDSIdentifier:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  COIDSMessage *v7;
  NSString *idsIdentifier;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[COIDSMessage initWithRequest:]([COIDSMessage alloc], "initWithRequest:", v6);

  if (v4)
  {
    idsIdentifier = self->_idsIdentifier;
    v11 = CFSTR("IDMK");
    v12[0] = idsIdentifier;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[COIDSMessage setMetadata:](v7, "setMetadata:", v9);

  }
  return v7;
}

- (id)encodeResponse:(id)a3
{
  id v3;
  COIDSMessage *v4;

  v3 = a3;
  v4 = -[COIDSMessage initWithResponse:]([COIDSMessage alloc], "initWithResponse:", v3);

  return v4;
}

- (id)encodeError:(id)a3
{
  id v3;
  COIDSMessage *v4;

  v3 = a3;
  v4 = -[COIDSMessage initWithError:]([COIDSMessage alloc], "initWithError:", v3);

  return v4;
}

- (id)decodeDictionary:(id)a3 error:(id *)a4
{
  id v5;
  COIDSMessage *v6;

  v5 = a3;
  v6 = -[COIDSMessage initWithDictionary:error:]([COIDSMessage alloc], "initWithDictionary:error:", v5, a4);

  return v6;
}

- (NSString)meshName
{
  return self->_meshName;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
}

@end
