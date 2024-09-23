@implementation COSE_Mac0

- (COSE_Mac0)initWithCBOR:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  COSE_Mac0 *v16;
  COSE_Mac0 *v17;
  uint64_t v18;
  NSData *mac;
  COSE_Mac0 *v20;
  objc_super v22;

  v4 = a3;
  if (objc_msgSend(v4, "type") != 4)
    goto LABEL_11;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 4)
    goto LABEL_11;
  objc_msgSend(v4, "tag");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  objc_msgSend(v4, "tag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numeric");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 == 17)
  {
LABEL_5:
    objc_msgSend(v4, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "type") == 2 || objc_msgSend(v13, "type") == 11)
    {
      objc_msgSend(v4, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "type") == 2)
      {
        v22.receiver = self;
        v22.super_class = (Class)COSE_Mac0;
        v16 = -[COSE initWithCBOR:](&v22, sel_initWithCBOR_, v4);
        v17 = v16;
        if (v16)
        {
          -[COSE setType:]((uint64_t)v16, 17);
          objc_msgSend(v15, "data");
          v18 = objc_claimAutoreleasedReturnValue();
          mac = v17->_mac;
          v17->_mac = (NSData *)v18;

        }
        self = v17;
        v20 = self;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
LABEL_11:
    v20 = 0;
  }

  return v20;
}

- (COSE_Mac0)initWithProtectedHeaders:(id)a3 unprotectedHeaders:(id)a4 payload:(id)a5 tag:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  COSE_Mac0 *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[CBOR cborWithData:](CBOR, "cborWithData:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (COSE_Mac0 *)-[COSE initWithProtectedHeaders:unprotectedHeaders:payload:type:additionalCBORs:](self, v12, v11, v10, 17, v14);

  return v15;
}

- (id)generateMessageForMACWithApplicationProtectedAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[CBOR cborWithUTF8String:](CBOR, "cborWithUTF8String:", CFSTR("MAC0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)objc_opt_new();
  -[COSE protectedHeaderParameters](self, "protectedHeaderParameters");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = v7;
  +[CBOR cborWithData:](CBOR, "cborWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  if (v4)
  {
    +[CBOR cborWithData:](CBOR, "cborWithData:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  else
  {
    objc_msgSend(v5, "addObject:", v7);
  }
  -[COSE content](self, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBOR cborWithData:](CBOR, "cborWithData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);

  +[CBOR cborWithArray:](CBOR, "cborWithArray:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[COSE protectedHeadererDictionary](self, "protectedHeadererDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSE_Mac0 mac](self, "mac");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ProtectedHeaders: %@, mac: %@"), v4, v5);

  return v6;
}

- (NSData)mac
{
  return self->_mac;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mac, 0);
}

@end
