@implementation MSCMSMessageDigestAttribute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDigest, 0);
}

- (NSData)messageDigest
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (MSCMSMessageDigestAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  const __CFString *v17;
  MSCMSMessageDigestAttribute *v18;
  void *v19;

  v6 = a3;
  objc_msgSend(v6, "attributeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.9.4"));

  if ((v8 & 1) == 0)
  {
    if (!a4)
      goto LABEL_12;
    v14 = MSErrorCMSDomain[0];
    v16 = *a4;
    v17 = CFSTR("Not a MessageDigest attribute according to AttributeType");
LABEL_10:
    v15 = -26275;
    goto LABEL_11;
  }
  objc_msgSend(v6, "attributeValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 1)
  {
    if (!a4)
      goto LABEL_12;
    v14 = MSErrorCMSDomain[0];
    v16 = *a4;
    v17 = CFSTR("MessageDigest attribute contains more than one value");
    goto LABEL_10;
  }
  objc_msgSend(v6, "attributeValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = nsheim_decode_MessageDigest(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      v15 = v13;
      v16 = *a4;
      v17 = CFSTR("unable to decode MessageDigest");
LABEL_11:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v14, v15, v16, v17);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_12:
    v18 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    free_MessageDigest();
    self = -[MSCMSMessageDigestAttribute initWithDigest:](self, "initWithDigest:", v19);
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

LABEL_17:
  return v18;
}

- (MSCMSMessageDigestAttribute)initWithDigest:(id)a3
{
  id v4;
  MSCMSMessageDigestAttribute *v5;
  MSCMSMessageDigestAttribute *v6;
  MSCMSMessageDigestAttribute *v7;
  void *v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length") == 16
    || objc_msgSend(v4, "length") == 20
    || objc_msgSend(v4, "length") == 28
    || objc_msgSend(v4, "length") == 32
    || objc_msgSend(v4, "length") == 48
    || objc_msgSend(v4, "length") == 64)
  {
    v11.receiver = self;
    v11.super_class = (Class)MSCMSMessageDigestAttribute;
    v5 = -[MSCMSMessageDigestAttribute init](&v11, sel_init);
    v6 = v5;
    if (v5)
      -[MSCMSMessageDigestAttribute setMessageDigest:](v5, "setMessageDigest:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_153);
    v9 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v4, "length");
      _os_log_impl(&dword_1DEED9000, v10, OS_LOG_TYPE_ERROR, "Digest length %lu is not a supported length", buf, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (void)setMessageDigest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.4"), 0);
}

- (id)encodeAttributeWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MSCMSAttribute *v13;
  void *v14;
  void *v15;
  MSCMSAttribute *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[NSData length](self->_messageDigest, "length");
  -[NSData bytes](self->_messageDigest, "bytes");
  v19 = 0;
  v5 = length_MessageDigest();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = 12;
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "mutableBytes");
  v8 = encode_MessageDigest();
  if (v8)
  {
    v9 = v8;

    v10 = v9;
    if (!a3)
    {
LABEL_5:
      v7 = 0;
      goto LABEL_9;
    }
LABEL_4:
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Failed encoding type MessageDigest");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v10, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (v5)
  {
    v18 = asn1_abort();
    return (id)__46__MSCMSMessageDigestAttribute_initWithDigest___block_invoke(v18);
  }
LABEL_9:
  if (objc_msgSend(v7, "length", v19))
  {
    v13 = [MSCMSAttribute alloc];
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.4"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MSCMSAttribute initWithAttributeType:values:](v13, "initWithAttributeType:values:", v14, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __46__MSCMSMessageDigestAttribute_initWithDigest___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

+ (id)messageDigestAttributeWithDigest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDigest:", v4);

  return v5;
}

@end
