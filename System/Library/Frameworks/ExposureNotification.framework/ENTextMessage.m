@implementation ENTextMessage

+ (id)textMessageWithMessage:(id)a3 embeddedURLs:(id)a4
{
  id v5;
  id v6;
  ENTextMessage *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ENTextMessage initWithMessage:embeddedURLs:]([ENTextMessage alloc], "initWithMessage:embeddedURLs:", v6, v5);

  return v7;
}

- (ENTextMessage)initWithMessage:(id)a3 embeddedURLs:(id)a4
{
  id v6;
  id v7;
  ENTextMessage *v8;
  ENTextMessage *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ENTextMessage;
  v8 = -[ENTextMessage init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ENTextMessage setMessage:](v8, "setMessage:", v6);
    -[ENTextMessage setEmbeddedURLs:](v9, "setEmbeddedURLs:", v7);
    v10 = -[ENTextMessage ensTestVerificationURL](v9, "ensTestVerificationURL");
  }

  return v9;
}

- (id)description
{
  id v2;
  id v3;
  id v5;

  NSAppendPrintF_safe();
  v5 = 0;
  NSAppendPrintF_safe();
  v2 = v5;

  NSAppendPrintF_safe();
  v3 = v2;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *embeddedURLs;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("textMessage"));
  embeddedURLs = self->_embeddedURLs;
  if (embeddedURLs)
    objc_msgSend(v5, "encodeObject:forKey:", embeddedURLs, CFSTR("textMessageURLs"));

}

- (ENTextMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ENTextMessage *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("textMessageURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "textMessageWithMessage:embeddedURLs:", v5, v6);
  v7 = (ENTextMessage *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMessage:embeddedURLs:", self->_message, self->_embeddedURLs);
}

- (NSURL)ensTestVerificationURL
{
  NSURL *ensTestVerificationURL;
  void *v4;
  _QWORD v6[5];

  ensTestVerificationURL = self->_ensTestVerificationURL;
  if (!ensTestVerificationURL)
  {
    -[ENTextMessage embeddedURLs](self, "embeddedURLs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__ENTextMessage_ensTestVerificationURL__block_invoke;
    v6[3] = &unk_24C38B440;
    v6[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    ensTestVerificationURL = self->_ensTestVerificationURL;
  }
  return ensTestVerificationURL;
}

void __39__ENTextMessage_ensTestVerificationURL__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a2;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__1;
      v38 = __Block_byref_object_dispose__1;
      v39 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      v33 = 0;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __39__ENTextMessage_ensTestVerificationURL__block_invoke_9;
      v27[3] = &unk_24C38B418;
      v27[4] = &v34;
      v27[5] = &v28;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v27);
      v11 = (void *)v29[5];
      if (v11)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v11);
        if (!v35[5])
        {
          objc_msgSend(v8, "scheme");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("https"));

          if (v13)
          {
            objc_msgSend(v8, "host");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("."));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            +[ENRegion regionWithCode:](ENRegion, "regionWithCode:", v16);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "regionCode");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v35[5];
            v35[5] = v20;

          }
        }
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("ens://v?c=%@"), v29[5]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v35[5])
          objc_msgSend(v22, "appendFormat:", CFSTR("&r=%@"), v35[5]);
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 24);
        *(_QWORD *)(v25 + 24) = v24;

        *a4 = 1;
      }
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v34, 8);
    }

  }
}

void __39__ENTextMessage_ensTestVerificationURL__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("r")))
    {
      v5 = *(_QWORD *)(a1 + 32);
LABEL_7:
      objc_storeStrong((id *)(*(_QWORD *)(v5 + 8) + 40), v4);
      goto LABEL_8;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("c")))
    {
      v5 = *(_QWORD *)(a1 + 40);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (NSString)verificationString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[ENTextMessage message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:options:", CFSTR("Authentication:"), 4);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "substringToIndex:", v3 + v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (NSString)signature
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[ENTextMessage message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:options:", CFSTR(":"), 4);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "substringFromIndex:", v3 + v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)embeddedURLs
{
  return self->_embeddedURLs;
}

- (void)setEmbeddedURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEnsTestVerificationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)testVerificationCode
{
  return self->_testVerificationCode;
}

- (void)setTestVerificationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ENRegion)testVerificationRegion
{
  return self->_testVerificationRegion;
}

- (void)setTestVerificationRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testVerificationRegion, 0);
  objc_storeStrong((id *)&self->_testVerificationCode, 0);
  objc_storeStrong((id *)&self->_ensTestVerificationURL, 0);
  objc_storeStrong((id *)&self->_embeddedURLs, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
