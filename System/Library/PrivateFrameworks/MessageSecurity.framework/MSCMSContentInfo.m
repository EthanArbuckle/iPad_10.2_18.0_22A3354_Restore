@implementation MSCMSContentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_embeddedContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 16, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 24, 1);
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  MSCMSContentInfo *v19;
  void *v20;
  uint64_t v21;
  MSCMSContentInfo *v22;
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD *v27;

  v7 = a3;
  v8 = a4;
  if (a5 && *a5)
    v9 = (void *)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  v26[0] = 0;
  v26[1] = 0;
  v27 = 0;
  v10 = nsheim_decode_ContentInfo(v7);
  if (v10)
  {
    v11 = MSErrorASN1Domain[0];
    v12 = v10;
    if (v7)
      v13 = objc_msgSend(v7, "length");
    else
      v13 = -1;
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v11, v12, v9, CFSTR("unable to decode content info (%ld bytes)"), v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    dumpNSData("ContentInfo", v7);
    v19 = 0;
    v14 = 0;
    v16 = 0;
LABEL_14:
    v20 = 0;
    if (!a5)
      goto LABEL_25;
    goto LABEL_23;
  }
  v25 = v9;
  +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", v26, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;

  NSDataFromAny(v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")) & 1) != 0)
    {
      v17 = nsheim_decode_DataContent(v16);
      if (v17)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v17, v15, CFSTR("unable to decode data content (%ld bytes)"), objc_msgSend(v16, "length"));
        v18 = (id)objc_claimAutoreleasedReturnValue();

        dumpNSData("DataContent", v16);
        v19 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
      v21 = objc_claimAutoreleasedReturnValue();

      free_DataContent();
      v20 = 0;
      v16 = (void *)v21;
    }
    else
    {
      v24 = v15;
      decodeEmbeddedCMSContent(v14, v16, v8, (uint64_t)&v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v24;

      if (!v20)
      {
        v19 = 0;
        if (!a5)
          goto LABEL_25;
        goto LABEL_23;
      }
      v15 = v18;
    }
  }
  else
  {
    v20 = 0;
  }
  v19 = [MSCMSContentInfo alloc];
  -[MSCMSContentInfo setContentType:](v19, "setContentType:", v14);
  -[MSCMSContentInfo setContent:](v19, "setContent:", v16);
  if (v20)
    -[MSCMSContentInfo setEmbeddedContent:](v19, "setEmbeddedContent:", v20);
  v18 = v15;
  if (a5)
  {
LABEL_23:
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
LABEL_25:
  free_ContentInfo();
  v22 = v19;

  return v22;
}

- (void)setEmbeddedContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  void *v5;
  MSOID *contentType;
  MSCMSMessage *embeddedContent;
  NSData **p_content;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  NSData *v15;
  id v16;
  void *v17;
  void *v18;
  NSData *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  MSCMSContentInfo *v31;
  SEL v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v35 = 0;
  v36 = 0;
  contentType = self->_contentType;
  if (!contentType)
    goto LABEL_36;
  embeddedContent = self->_embeddedContent;
  p_content = &self->_content;
  if (!self->_content)
  {
    if (embeddedContent)
    {
      v37 = 0;
      v38 = 0;
      v39 = &v35;
      goto LABEL_14;
    }
LABEL_36:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v5, CFSTR("Unable to encode content info: missing content type or content"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  v37 = 0;
  v38 = 0;
  v39 = &v35;
  if (!embeddedContent)
  {
    if (!-[MSOID isEqualToString:](contentType, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")))
    {
      v15 = *p_content;
LABEL_24:
      v16 = v5;
      goto LABEL_25;
    }
    -[NSData length](*p_content, "length");
    -[NSData bytes](*p_content, "bytes");
    v9 = length_DataContent();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "mutableBytes");
      v12 = encode_DataContent();
      if (!v12)
      {
        if (v9)
          goto LABEL_41;
        goto LABEL_22;
      }
      v13 = v12;

      v14 = v13;
    }
    else
    {
      v14 = 12;
    }
    if (a3)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2D50];
      v43[0] = CFSTR("Failed encoding type DataContent");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v14, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
LABEL_22:
    if (objc_msgSend(v11, "length", 0))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v11);
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();

      goto LABEL_24;
    }

    v23 = 0;
    v16 = v5;
LABEL_38:
    v19 = 0;
    if (!a3)
      goto LABEL_35;
    goto LABEL_33;
  }
LABEL_14:
  v34 = v5;
  -[MSCMSMessage encodeMessageSecurityObject:](embeddedContent, "encodeMessageSecurityObject:", &v34);
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  v16 = v34;

  if (!v15)
  {
LABEL_37:
    v23 = 0;
    goto LABEL_38;
  }
  objc_storeStrong((id *)&self->_content, v15);
LABEL_25:
  v19 = objc_retainAutorelease(v15);
  v36 = -[NSData bytes](v19, "bytes");
  v35 = -[NSData length](v19, "length");
  v37 = -[MSOID Asn1OID](self->_contentType, "Asn1OID");
  v38 = v20;
  v21 = length_ContentInfo();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v26 = 12;
LABEL_29:
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("Failed encoding type ContentInfo");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v26, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v16 = (id)v29;
    if (!a3)
      goto LABEL_35;
    goto LABEL_33;
  }
  v23 = objc_retainAutorelease(v22);
  objc_msgSend(v23, "mutableBytes");
  v24 = encode_ContentInfo();
  if (v24)
  {
    v25 = v24;

    v26 = v25;
    goto LABEL_29;
  }
  if (!v21)
  {
    if (!a3)
    {
LABEL_35:

      return v23;
    }
LABEL_33:
    if (v16)
      *a3 = objc_retainAutorelease(v16);
    goto LABEL_35;
  }
LABEL_41:
  v31 = (MSCMSContentInfo *)asn1_abort();
  return -[MSCMSContentInfo initWithEmbeddedContent:](v31, v32, v33);
}

- (MSCMSContentInfo)initWithEmbeddedContent:(id)a3
{
  id v5;
  MSCMSContentInfo *v6;
  MSCMSContentInfo *v7;
  uint64_t v8;
  MSOID *contentType;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSCMSContentInfo;
  v6 = -[MSCMSContentInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_embeddedContent, a3);
    objc_msgSend(v5, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v8;

  }
  return v7;
}

- (MSCMSContentInfo)initWithDataContent:(id)a3
{
  id v5;
  MSCMSContentInfo *v6;
  MSCMSContentInfo *v7;
  uint64_t v8;
  MSOID *contentType;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSCMSContentInfo;
  v6 = -[MSCMSContentInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_content, a3);
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.7.1"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v8;

  }
  return v7;
}

- (NSData)content
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

@end
