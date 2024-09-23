@implementation MSCMSContentTypeAttribute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (MSCMSContentTypeAttribute)initWithAttribute:(id)a3 error:(id *)a4
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
  MSCMSContentTypeAttribute *v18;
  void *v19;
  uint64_t v21;

  v6 = a3;
  objc_msgSend(v6, "attributeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.9.3"));

  if ((v8 & 1) == 0)
  {
    if (!a4)
      goto LABEL_12;
    v14 = MSErrorCMSDomain[0];
    v16 = *a4;
    v17 = CFSTR("Not a ContentType attribute according to AttributeType");
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
    v17 = CFSTR("ContentType attribute contains more than one value");
    goto LABEL_10;
  }
  objc_msgSend(v6, "attributeValues", 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = nsheim_decode_ContentType(v12);

  if (v13)
  {
    if (a4)
    {
      v14 = MSErrorASN1Domain[0];
      v15 = v13;
      v16 = *a4;
      v17 = CFSTR("unable to decode ContentType");
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
  +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", &v21, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    free_ContentType();
    self = -[MSCMSContentTypeAttribute initWithOID:](self, "initWithOID:", v19);
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

LABEL_17:
  return v18;
}

- (MSCMSContentTypeAttribute)initWithOID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  MSCMSContentTypeAttribute *v7;
  MSCMSContentTypeAttribute *v8;
  MSCMSContentTypeAttribute *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (initWithOID__onceToken != -1)
    dispatch_once(&initWithOID__onceToken, &__block_literal_global_4);
  v5 = initWithOID__sKnownContentTypes;
  objc_msgSend(v4, "OIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)MSCMSContentTypeAttribute;
    v7 = -[MSCMSContentTypeAttribute init](&v14, sel_init);
    v8 = v7;
    if (v7)
      -[MSCMSContentTypeAttribute setContentType:](v7, "setContentType:", v4);
    self = v8;
    v9 = self;
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_130);
    v10 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v4, "OIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1DEED9000, v11, OS_LOG_TYPE_ERROR, "Found unknown content type: %@", buf, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 8, 1);
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), 0);
}

- (id)encodeAttributeWithError:(id *)a3
{
  uint64_t v4;
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
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v20 = -[MSOID Asn1OID](self->_contentType, "Asn1OID");
  v21 = v4;
  v19 = 0;
  v5 = length_ContentType();
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
  v8 = encode_ContentType();
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
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Failed encoding type ContentType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1, 0, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v10, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (v5)
  {
    v18 = asn1_abort();
    return (id)__41__MSCMSContentTypeAttribute_initWithOID___block_invoke(v18);
  }
LABEL_9:
  if (objc_msgSend(v7, "length", v19))
  {
    v13 = [MSCMSAttribute alloc];
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), a3);
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

void __41__MSCMSContentTypeAttribute_initWithOID___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("1.2.840.113549.1.7.1");
  v4[1] = CFSTR("1.2.840.113549.1.7.2");
  v4[2] = CFSTR("1.2.840.113549.1.7.3");
  v4[3] = CFSTR("1.2.840.113549.1.7.5");
  v4[4] = CFSTR("1.2.840.113549.1.7.6");
  v4[5] = CFSTR("1.2.840.113549.1.9.16.1.2");
  v4[6] = CFSTR("1.2.840.113549.1.9.16.1.23");
  v4[7] = CFSTR("1.2.840.113549.1.9.16.1.9");
  v4[8] = CFSTR("1.2.840.113549.1.9.16.1.4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithOID__sKnownContentTypes;
  initWithOID__sKnownContentTypes = v2;

}

void __41__MSCMSContentTypeAttribute_initWithOID___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

+ (id)contentTypeAttributeWithOID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOID:", v4);

  return v5;
}

@end
