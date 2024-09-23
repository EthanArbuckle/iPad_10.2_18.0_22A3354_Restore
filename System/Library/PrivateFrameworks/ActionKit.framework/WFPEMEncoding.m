@implementation WFPEMEncoding

- (WFPEMEncoding)initWithType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  WFPEMEncoding *v8;
  uint64_t v9;
  NSString *type;
  uint64_t v11;
  NSData *data;
  WFPEMEncoding *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPEMEncoding;
  v8 = -[WFPEMEncoding init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    type = v8->_type;
    v8->_type = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)encodedPEM
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("-----BEGIN "));
  -[WFPEMEncoding type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("-----"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  v5 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[WFPEMEncoding data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:", v7);

  v9 = objc_msgSend(CFSTR("\n"), "length");
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x3D)
  {
    v10 = v9 + 60;
    v11 = 60;
    do
    {
      objc_msgSend(v8, "insertString:atIndex:", CFSTR("\n"), v11);
      v11 += v10;
    }
    while (v11 < objc_msgSend(v8, "length"));
  }
  objc_msgSend(v3, "appendString:", v8);
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("-----END "));
  -[WFPEMEncoding type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  objc_msgSend(v3, "appendString:", CFSTR("-----"));
  return v3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)decodePEM:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  WFPEMEncoding *v9;
  int v10;
  id v11;
  int v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD17A8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithString:", v6);

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCharactersToBeSkipped:", v8);

  v9 = 0;
  if (objc_msgSend(v7, "scanString:intoString:", CFSTR("-----BEGIN "), 0))
  {
    v23 = 0;
    v10 = objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("-----"), &v23);
    v11 = v23;
    v9 = 0;
    if (v10)
    {
      objc_msgSend(v7, "scanString:intoString:", CFSTR("-----"), 0);
      v22 = 0;
      v12 = objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("-----END "), &v22);
      v13 = v22;
      v9 = 0;
      if (v12)
      {
        objc_msgSend(v7, "scanString:intoString:", CFSTR("-----END "), 0);
        v21 = 0;
        v14 = objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("-----"), &v21);
        v15 = v21;
        v9 = 0;
        if (v14)
        {
          objc_msgSend(v7, "scanString:intoString:", CFSTR("-----"), 0);
          v9 = 0;
          if (objc_msgSend(v7, "isAtEnd"))
          {
            if (objc_msgSend(v11, "isEqualToString:", v15))
            {
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v13, 1);
              if (v16)
              {
                v9 = -[WFPEMEncoding initWithType:data:]([WFPEMEncoding alloc], "initWithType:data:", v11, v16);
              }
              else
              {
                if (a4)
                {
                  v17 = (void *)MEMORY[0x24BDD1540];
                  v24 = *MEMORY[0x24BDD0FC8];
                  WFLocalizedString(CFSTR("Private key contained PEM header and footer, but was not encoded correctly."));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v25[0] = v18;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("WFPEMEncodingErrorDomain"), 1, v19);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                }
                v9 = 0;
              }

            }
            else
            {
              v9 = 0;
            }
          }
        }

      }
    }

  }
  return v9;
}

@end
