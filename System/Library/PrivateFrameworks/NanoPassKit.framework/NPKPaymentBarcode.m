@implementation NPKPaymentBarcode

- (NPKPaymentBarcode)initWithBarcodeIdentifier:(id)a3 decryptedBarcodeCredential:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKPaymentBarcode *v12;
  NPKPaymentBarcode *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NPKPaymentBarcode;
  v12 = -[NPKPaymentBarcode init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_barcodeIdentifier, a3);
    objc_storeStrong((id *)&v13->_decryptedBarcodeCredential, a4);
    if (v10)
    {
      v14 = 1;
    }
    else if (v11)
    {
      objc_msgSend(v11, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDD1398]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "code");
      if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD1308]) & (((v18 + 1009) & 0xFFFFFFFFFFFFFFF7) == 0)) != 0)
        v14 = 2;
      else
        v14 = 3;

    }
    else
    {
      v14 = 0;
    }
    v13->_state = v14;
  }

  return v13;
}

- (NSArray)barcodes
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSArray *v10;
  NSArray *barcodes;
  NSArray *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_barcodes)
  {
    if (-[NPKPaymentBarcode state](self, "state") == 1)
    {
      v3 = objc_alloc_init(MEMORY[0x24BE6EA48]);
      -[NPKPaymentBarcode decryptedBarcodeCredential](self, "decryptedBarcodeCredential");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setMessageData:", v4);

      objc_msgSend(v3, "setFormat:", 1);
      v5 = objc_alloc_init(MEMORY[0x24BE6EA48]);
      -[NPKPaymentBarcode decryptedBarcodeCredential](self, "decryptedBarcodeCredential");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMessageData:", v6);

      objc_msgSend(v5, "setFormat:", 4);
      v7 = (void *)MEMORY[0x24BDD17C8];
      -[NPKPaymentBarcode decryptedBarcodeCredential](self, "decryptedBarcodeCredential");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "stringWithUTF8String:", objc_msgSend(v8, "bytes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAltText:", v9);

      v14[0] = v3;
      v14[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      barcodes = self->_barcodes;
      self->_barcodes = v10;

    }
    else
    {
      v12 = self->_barcodes;
      self->_barcodes = (NSArray *)MEMORY[0x24BDBD1A8];

    }
  }
  return self->_barcodes;
}

- (BOOL)isEqual:(id)a3
{
  NPKPaymentBarcode *v4;
  NPKPaymentBarcode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;

  v4 = (NPKPaymentBarcode *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NPKPaymentBarcode barcodeIdentifier](self, "barcodeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentBarcode barcodeIdentifier](v5, "barcodeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (NPKIsEqual(v6, v7))
      {
        -[NPKPaymentBarcode decryptedBarcodeCredential](self, "decryptedBarcodeCredential");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPaymentBarcode decryptedBarcodeCredential](v5, "decryptedBarcodeCredential");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (NPKIsEqual(v8, v9))
        {
          v10 = -[NPKPaymentBarcode state](self, "state");
          v11 = v10 == -[NPKPaymentBarcode state](v5, "state");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentBarcode barcodeIdentifier](self, "barcodeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - barcodeIdentifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_barcodeIdentifier, a3);
}

- (void)setBarcodes:(id)a3
{
  objc_storeStrong((id *)&self->_barcodes, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSData)decryptedBarcodeCredential
{
  return self->_decryptedBarcodeCredential;
}

- (void)setDecryptedBarcodeCredential:(id)a3
{
  objc_storeStrong((id *)&self->_decryptedBarcodeCredential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptedBarcodeCredential, 0);
  objc_storeStrong((id *)&self->_barcodes, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
}

@end
