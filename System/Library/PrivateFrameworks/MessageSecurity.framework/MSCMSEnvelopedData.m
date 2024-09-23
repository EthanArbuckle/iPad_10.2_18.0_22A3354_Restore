@implementation MSCMSEnvelopedData

- (void)setDataContent:(id)a3
{
  NSData *v5;
  NSData *dataContent;
  NSData *v7;

  v5 = (NSData *)a3;
  dataContent = self->_dataContent;
  if (dataContent != v5)
  {
    self->_dataContent = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_dataContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }

}

- (void)setEmbeddedContent:(id)a3
{
  MSCMSMessage *v5;
  MSCMSMessage *embeddedContent;
  MSCMSMessage *v7;

  v5 = (MSCMSMessage *)a3;
  embeddedContent = self->_embeddedContent;
  if (embeddedContent != v5)
  {
    self->_embeddedContent = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_embeddedContent, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }

}

- (void)setContentType:(id)a3
{
  MSOID *v5;
  MSOID *contentType;
  MSOID *v7;

  v5 = (MSOID *)a3;
  contentType = self->_contentType;
  if (contentType != v5)
  {
    self->_contentType = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_contentType, a3);
    v5 = v7;
    self->_contentChanged = 1;
  }

}

- (id)getRecipients
{
  return self->_recipients;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MSCMSEnvelopedData *v10;

  v6 = a4;
  v7 = a3;
  -[MSCMSEnvelopedData findBestEncryptionAlgorithmForNewRecipient:](self, "findBestEncryptionAlgorithmForNewRecipient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "algorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MSCMSEnvelopedData initWithDataContent:recipient:encryptionAlgorithm:](self, "initWithDataContent:recipient:encryptionAlgorithm:", v7, v6, v9);

  return v10;
}

- (MSCMSEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSOID *v11;
  MSCMSEnvelopedData *v12;
  MSAlgorithmIdentifier *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[MSCMSEnvelopedData setDataContent:](self, "setDataContent:", v8);
    v11 = -[MSOID initWithString:error:]([MSOID alloc], "initWithString:error:", CFSTR("1.2.840.113549.1.7.1"), 0);
    -[MSCMSEnvelopedData setContentType:](self, "setContentType:", v11);

    -[MSCMSEnvelopedData addRecipient:](self, "addRecipient:", v9);
    -[MSCMSEnvelopedData recipients](self, "recipients");
    v12 = (MSCMSEnvelopedData *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[MSAlgorithmIdentifier initWithOID:]([MSAlgorithmIdentifier alloc], "initWithOID:", v10);
      -[MSCMSEnvelopedData setEncryptionAlgorithm:](self, "setEncryptionAlgorithm:", v13);

      v12 = self;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MSCMSEnvelopedData *v10;

  v6 = a4;
  v7 = a3;
  -[MSCMSEnvelopedData findBestEncryptionAlgorithmForNewRecipient:](self, "findBestEncryptionAlgorithmForNewRecipient:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "algorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MSCMSEnvelopedData initWithEmbeddedContent:recipient:encryptionAlgorithm:](self, "initWithEmbeddedContent:recipient:encryptionAlgorithm:", v7, v6, v9);

  return v10;
}

- (MSCMSEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MSCMSEnvelopedData *v12;
  MSAlgorithmIdentifier *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[MSCMSEnvelopedData setEmbeddedContent:](self, "setEmbeddedContent:", v8);
    objc_msgSend(v8, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSEnvelopedData setContentType:](self, "setContentType:", v11);

    -[MSCMSEnvelopedData addRecipient:](self, "addRecipient:", v9);
    -[MSCMSEnvelopedData recipients](self, "recipients");
    v12 = (MSCMSEnvelopedData *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[MSAlgorithmIdentifier initWithOID:]([MSAlgorithmIdentifier alloc], "initWithOID:", v10);
      -[MSCMSEnvelopedData setEncryptionAlgorithm:](self, "setEncryptionAlgorithm:", v13);

      v12 = self;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findBestEncryptionAlgorithmForNewRecipient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSArray *recipients;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  MSAlgorithmIdentifier *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v5;
  recipients = self->_recipients;
  if (recipients)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__MSCMSEnvelopedData_findBestEncryptionAlgorithmForNewRecipient___block_invoke;
    v19[3] = &unk_1EA962378;
    v20 = v5;
    -[NSArray enumerateObjectsUsingBlock:](recipients, "enumerateObjectsUsingBlock:", v19);

  }
  if (v4)
  {
    objc_msgSend(v4, "algorithmCapabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "algorithmCapabilities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

    }
  }
  findBestMutuallySupportedEncryptionAlgorithm(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!v4)
      goto LABEL_10;
    objc_msgSend(v4, "algorithmCapabilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
    v13 = (void *)v12;
    objc_msgSend(v4, "algorithmCapabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v11);

    v17 = 0;
    if (v16)
LABEL_10:
      v17 = -[MSAlgorithmIdentifier initWithOID:]([MSAlgorithmIdentifier alloc], "initWithOID:", v11);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __65__MSCMSEnvelopedData_findBestEncryptionAlgorithmForNewRecipient___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "algorithmCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "algorithmCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
}

- (BOOL)addRecipient:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  -[MSCMSEnvelopedData recipients](self, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MSCMSEnvelopedData recipients](self, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = v10 + 1;
  }
  else
  {
    v11 = 1;
  }
  -[MSCMSEnvelopedData addRecipient:](self, "addRecipient:", v6);
  -[MSCMSEnvelopedData recipients](self, "recipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (a4 && v13 != v11)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -1, v7, CFSTR("unable to add recipient"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == v11;
}

- (void)addRecipient:(id)a3
{
  id v4;
  NSArray *recipients;
  id v6;
  void *v7;
  uint64_t v8;
  MSAlgorithmIdentifier *v9;
  MSAlgorithmIdentifier *encryptionAlgorithm;
  MSAlgorithmIdentifier *v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  if (v4)
  {
    recipients = self->_recipients;
    if (recipients)
      v6 = (id)-[NSArray mutableCopy](recipients, "mutableCopy");
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = v6;
    if (v6)
    {
      -[MSCMSEnvelopedData findBestEncryptionAlgorithmForNewRecipient:](self, "findBestEncryptionAlgorithmForNewRecipient:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (MSAlgorithmIdentifier *)v8;
        objc_msgSend(v7, "addObject:", v4);
        objc_storeStrong((id *)&self->_recipients, v7);
        encryptionAlgorithm = self->_encryptionAlgorithm;
        self->_encryptionAlgorithm = v9;
        v11 = v9;

        goto LABEL_8;
      }
    }
  }
  else
  {
    v7 = 0;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1)
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_7);
  v12 = MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DEED9000, v12, OS_LOG_TYPE_ERROR, "failed to add recipient. No shared encryption algorithm with the rest of the recipients", v13, 2u);
  }
LABEL_8:

}

void __35__MSCMSEnvelopedData_addRecipient___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (id)encodeMessageSecurityObject:(id *)a3
{
  MSCMSEnvelopedDataInternal *v4;
  void *v5;

  v4 = -[MSCMSEnvelopedDataInternal initWithEnvelopedData:]([MSCMSEnvelopedDataInternal alloc], "initWithEnvelopedData:", self);
  -[MSCMSEnvelopedDataInternal encodeMessageSecurityObject:](v4, "encodeMessageSecurityObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)generateEncryptionKey:(id *)a3
{
  void *v5;
  MSAlgorithmIdentifier *encryptionAlgorithm;
  size_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  encryptionAlgorithm = self->_encryptionAlgorithm;
  v15 = 0;
  v7 = -[MSAlgorithmIdentifier keySize:](encryptionAlgorithm, "keySize:", &v15);
  v8 = v15;
  if (v8)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("unable to encrypt/decrypt the content"));
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v5 = (void *)v14;
  }
  else
  {
    v9 = malloc_type_malloc(v7, 0xC64943BBuLL);
    if (v9)
    {
      v10 = v9;
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v7, v9))
      {
        v11 = 0;
      }
      else
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v10, v7);
        objc_storeStrong((id *)&self->_encryptionKey, v11);
      }
      bzero(v10, v7);
      free(v10);
    }
    else
    {
      v11 = 0;
    }
  }
  if (a3 && v5)
    *a3 = objc_retainAutorelease(v5);
  v12 = v11;

  return v12;
}

- (BOOL)encodeEncryptionParameters:(id *)a3
{
  void *v5;
  MSAlgorithmIdentifier *encryptionAlgorithm;
  size_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString **v22;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  MSAlgorithmIdentifier *v26;
  void *v27;
  MSAlgorithmIdentifier *v28;
  MSAlgorithmIdentifier *v29;
  MSAlgorithmIdentifier *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  encryptionAlgorithm = self->_encryptionAlgorithm;
  v38 = 0;
  v7 = -[MSAlgorithmIdentifier blockSize:](encryptionAlgorithm, "blockSize:", &v38);
  v8 = v38;
  if (v8)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("unable to encrypt/decrypt the content"));
    v32 = objc_claimAutoreleasedReturnValue();
    v31 = 0;
LABEL_26:

    v5 = (void *)v32;
    if (!a3)
      goto LABEL_29;
    goto LABEL_27;
  }
  v9 = malloc_type_malloc(v7, 0xD7CD908DuLL);
  if (v9)
  {
    v10 = v9;
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v7, v9))
    {
      v13 = 0;
      goto LABEL_34;
    }
    if (-[MSAlgorithmIdentifier ccAlgorithm:](self->_encryptionAlgorithm, "ccAlgorithm:", 0) == 5)
    {
      v36 = (void *)v7;
      v35 = 58;
      v37 = v10;
      v34 = 0;
      v11 = length_CMSRC2CBCParameter();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_17:
        v16 = 12;
        goto LABEL_18;
      }
      v13 = objc_retainAutorelease(v12);
      objc_msgSend(v13, "mutableBytes");
      v14 = encode_CMSRC2CBCParameter();
      if (v14)
      {
        v15 = v14;

        v16 = v15;
LABEL_18:
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v41 = *MEMORY[0x1E0CB2D50];
        v42[0] = CFSTR("Failed encoding type CMSRC2CBCParameter");
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = (const __CFString **)v42;
        v23 = &v41;
LABEL_21:
        objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1, 0, v35, v36, v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v16, v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v13 = 0;
        v5 = (void *)v25;
        goto LABEL_22;
      }
LABEL_15:
      if (!v11)
      {
LABEL_22:
        if (objc_msgSend(v13, "length", v34))
        {
          v26 = [MSAlgorithmIdentifier alloc];
          -[MSAlgorithmIdentifier algorithm](self->_encryptionAlgorithm, "algorithm");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[MSAlgorithmIdentifier initWithOID:parameters:](v26, "initWithOID:parameters:", v27, v13);

          if (v28)
          {
            v29 = self->_encryptionAlgorithm;
            self->_encryptionAlgorithm = v28;
            v30 = v28;

            v31 = 1;
LABEL_25:
            v32 = (uint64_t)v5;
            free(v10);
            v5 = v13;
            goto LABEL_26;
          }
        }
LABEL_34:
        v31 = 0;
        goto LABEL_25;
      }
      asn1_abort();
      goto LABEL_17;
    }
    v35 = v7;
    v36 = v10;
    v34 = 0;
    v11 = length_CMSCBCParameter();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v13 = objc_retainAutorelease(v17);
      objc_msgSend(v13, "mutableBytes");
      v18 = encode_CMSCBCParameter();
      if (!v18)
        goto LABEL_15;
      v19 = v18;

      v16 = v19;
    }
    else
    {
      v16 = 12;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Failed encoding type CMSCBCParameter");
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = &v40;
    v23 = &v39;
    goto LABEL_21;
  }
  v31 = 0;
  if (!a3)
    goto LABEL_29;
LABEL_27:
  if (v5)
    *a3 = objc_retainAutorelease(v5);
LABEL_29:

  return v31;
}

- (id)bulkEncryptDecrypt:(unsigned int)a3 algorithm:(unsigned int)a4 mode:(unsigned int)a5 key:(id)a6 iv:(id)a7 error:(id *)a8
{
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  const void *v22;
  id v23;
  NSData *encryptedContent;
  NSData *v25;
  NSData *v26;
  id v27;
  char *v28;
  size_t v29;
  _CCCryptor *v30;
  char *v31;
  size_t v32;
  uint64_t v34;
  id v35;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;
  _QWORD v38[3];
  _QWORD v39[2];

  v35 = a6;
  v14 = a7;
  if (a8 && *a8)
    v15 = (void *)objc_msgSend(*a8, "copy");
  else
    v15 = 0;
  v39[0] = 0;
  v39[1] = 0;
  memset(v38, 0, sizeof(v38));
  dataOutMoved = 0;
  cryptorRef = 0;
  v16 = -[MSAlgorithmIdentifier ccAlgorithm:](self->_encryptionAlgorithm, "ccAlgorithm:", 0);
  -[MSAlgorithmIdentifier parameters](self->_encryptionAlgorithm, "parameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 == 5)
  {
    v19 = nsheim_decode_CMSRC2CBCParameter(v17);

    if (!v19)
    {
      NSDataFromOctetString(v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      free_CMSRC2CBCParameter();
      goto LABEL_10;
    }
LABEL_32:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v15, CFSTR("unable to encrypt/decrypt the content"));
    v34 = objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v26 = 0;
    v15 = (void *)v34;
    goto LABEL_24;
  }
  v21 = nsheim_decode_CMSCBCParameter(v17);

  if (v21)
    goto LABEL_32;
  NSDataFromOctetString(v38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  free_CMSCBCParameter();
LABEL_10:
  v14 = v20;
  if (v20)
    v22 = (const void *)objc_msgSend(objc_retainAutorelease(v20), "bytes");
  else
    v22 = 0;
  v23 = objc_retainAutorelease(v35);
  if (CCCryptorCreateWithMode(a3, a5, a4, 1u, v22, (const void *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"), 0, 0, 0, 0, &cryptorRef))
  {
    v27 = 0;
    v26 = 0;
    goto LABEL_24;
  }
  if (a3 == 1)
  {
    encryptedContent = self->_encryptedContent;
  }
  else
  {
    if (!-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")))
    {
      -[MSCMSMessage encodeMessageSecurityObject:](self->_embeddedContent, "encodeMessageSecurityObject:", 0);
      v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    encryptedContent = self->_dataContent;
  }
  v25 = encryptedContent;
LABEL_20:
  v26 = v25;
  if (v25)
  {
    v27 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", CCCryptorGetOutputLength(cryptorRef, -[NSData length](v25, "length"), 1)));
    v28 = (char *)objc_msgSend(v27, "mutableBytes");
    v29 = objc_msgSend(v27, "length");
    v30 = cryptorRef;
    v26 = objc_retainAutorelease(v26);
    if (!CCCryptorUpdate(v30, -[NSData bytes](v26, "bytes"), -[NSData length](v26, "length"), v28, v29, &dataOutMoved))
    {
      v31 = &v28[dataOutMoved];
      v32 = v29 - dataOutMoved;
      if (!CCCryptorFinal(cryptorRef, v31, v29 - dataOutMoved, &dataOutMoved))
      {
        objc_msgSend(v27, "setLength:", dataOutMoved - v32 + objc_msgSend(v27, "length"));
        goto LABEL_24;
      }
    }

  }
  v27 = 0;
LABEL_24:
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);
  if (a8 && v15)
    *a8 = objc_retainAutorelease(v15);

  return v27;
}

- (BOOL)checkDecryptionResult:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  id v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v13 = *MEMORY[0x1E0CB31B8];
    v14[0] = MEMORY[0x1E0C9AAA0];
    v5 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v11 = 0;
    if (objc_msgSend(MEMORY[0x1E0CB3940], "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:", v4, v6, &v11, &v12))
    {
      v7 = v11 == 0;
    }
    else
    {
      v7 = 1;
    }
    if (v7 || v12 != 0)
    {
      v9 = objc_retainAutorelease(v4);
      objc_msgSend(v9, "bytes");
      objc_msgSend(v9, "length");
      v5 = 0;
      if (!der_get_tag())
      {
        objc_msgSend(v9, "length");
        v5 = 0;
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)encryptDecryptContent:(id)a3 ccOperation:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  MSAlgorithmIdentifier *encryptionAlgorithm;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  MSAlgorithmIdentifier *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (a5 && *a5)
    v9 = (void *)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  encryptionAlgorithm = self->_encryptionAlgorithm;
  v36 = 0;
  v11 = -[MSAlgorithmIdentifier ccAlgorithm:](encryptionAlgorithm, "ccAlgorithm:", &v36);
  v12 = v36;
  if (v12)
  {
    v23 = v12;
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v9, CFSTR("unable to encrypt/decrypt the content"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    goto LABEL_28;
  }
  if ((_DWORD)v6)
  {
    objc_msgSend(v8, "key:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_8;
    goto LABEL_17;
  }
  v35 = v9;
  -[MSCMSEnvelopedData generateEncryptionKey:](self, "generateEncryptionKey:", &v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v35;

  v9 = v24;
  if (!v13)
  {
LABEL_17:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v9, CFSTR("unable to access the content encryption key"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
LABEL_28:
    v19 = 0;
LABEL_23:

    if (!a5)
      goto LABEL_26;
    goto LABEL_24;
  }
LABEL_8:
  v30 = a5;
  v14 = v8;
  v15 = self->_encryptionAlgorithm;
  v34 = 0;
  v16 = -[MSAlgorithmIdentifier ccMode:](v15, "ccMode:", &v34);
  v17 = v34;
  if (v17)
  {
    v23 = v17;
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v9, CFSTR("unable to encrypt/decrypt the content"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
LABEL_22:
    v8 = v14;
    a5 = v30;
    goto LABEL_23;
  }
  if (!(_DWORD)v6)
  {
    v33 = v9;
    -[MSCMSEnvelopedData encodeEncryptionParameters:](self, "encodeEncryptionParameters:", &v33);
    v18 = v33;

    v9 = v18;
  }
  v32 = v9;
  -[MSCMSEnvelopedData bulkEncryptDecrypt:algorithm:mode:key:iv:error:](self, "bulkEncryptDecrypt:algorithm:mode:key:iv:error:", v6, v11, v16, v13, 0, &v32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v32;

  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(v14, "keyEncryptionAlgorithm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "algorithm");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("1.3.133.16.840.63.0.2")) & 1) != 0)
    {
      v22 = -[MSCMSEnvelopedData checkDecryptionResult:](self, "checkDecryptionResult:", v19);

      if (v22)
        goto LABEL_14;
      objc_msgSend(v14, "key:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v20;
      -[MSCMSEnvelopedData bulkEncryptDecrypt:algorithm:mode:key:iv:error:](self, "bulkEncryptDecrypt:algorithm:mode:key:iv:error:", 1, v11, v16, v9, 0, &v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v31;

      if (-[MSCMSEnvelopedData checkDecryptionResult:](self, "checkDecryptionResult:", v25))
      {
        v27 = v25;

        v19 = v27;
      }

      v23 = 0;
      v20 = v26;
    }
    else
    {

      v23 = 0;
    }
    goto LABEL_22;
  }
LABEL_14:
  v23 = 0;
  v8 = v14;
  a5 = v30;
  if (!v30)
    goto LABEL_26;
LABEL_24:
  if (v20)
    *a5 = objc_retainAutorelease(v20);
LABEL_26:
  v28 = v19;

  return v28;
}

- (id)encryptContent:(id *)a3
{
  return -[MSCMSEnvelopedData encryptDecryptContent:ccOperation:error:](self, "encryptDecryptContent:ccOperation:error:", 0, 0, a3);
}

- (id)decryptContent:(id)a3 error:(id *)a4
{
  return -[MSCMSEnvelopedData encryptDecryptContent:ccOperation:error:](self, "encryptDecryptContent:ccOperation:error:", a3, 1, a4);
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  int v11;
  __CFString *v12;
  uint64_t v13;
  MSCMSEnvelopedData *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  SecKeyRef v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  char v56;
  void *v57;
  uint64_t v58;
  id v59;
  _DWORD *v60;
  uint64_t v61;
  unint64_t v62;
  __int128 *v63;
  __int128 v64;
  void *v65;
  id v66;
  MSCMSEnvelopedData *v67;
  uint64_t v69;
  void *v70;
  id v71;
  id *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _DWORD *v95;
  uint8_t buf[8];
  __int16 v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a5 && *a5)
    v9 = (id)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  v95 = 0;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v90 = 0u;
  v10 = nsheim_decode_EnvelopedData(v7);
  if (v10)
  {
    v11 = v10;
    if (nsheim_decode_SecCMS_EnvelopedData(v7))
    {
      v12 = MSErrorASN1Domain[0];
      if (v7)
        v13 = objc_msgSend(v7, "length");
      else
        v13 = -1;
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v12, v11, v9, CFSTR("unable to decode envelopedData (%ld bytes)"), v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      dumpNSData("EnvelopedData", v7);
      v14 = 0;
      v76 = 0;
      goto LABEL_53;
    }
  }
  v14 = [MSCMSEnvelopedData alloc];
  if (!v14)
  {
    v76 = 0;
    v74 = 0;
    v75 = 0;
    v40 = 0;
    v28 = 0;
    v50 = 0;
    v53 = 0;
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v90);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSEnvelopedData setVersion:](v14, "setVersion:", v15);

  v72 = a5;
  v73 = v8;
  if (*((_QWORD *)&v90 + 1))
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = v9;
    v83 = 0uLL;
    NSDataFromAny(*((_QWORD **)&v90 + 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = nsheim_decode_OriginatorInfo(v18);

    v76 = v16;
    if (v19)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v19, v17, CFSTR("unable to decode envelopedData.originatorInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = v17;
      if (v16)
      {
        v20 = v17;
        if ((_QWORD)v83)
        {
          v20 = v17;
          if (*(_DWORD *)v83)
          {
            v21 = 0;
            v22 = 0;
            do
            {
              if (*(_DWORD *)(*(_QWORD *)(v83 + 8) + v21) == 1)
              {
                v23 = SecCertificateCreateWithBytes();
                if (v23)
                {
                  v24 = (void *)v23;
                  objc_msgSend(v16, "addObject:", v23);

                }
              }
              ++v22;
              v21 += 24;
            }
            while (v22 < *(unsigned int *)v83);
            v20 = v17;
            a5 = v72;
          }
        }
      }
    }
    free_OriginatorInfo();

    if (v19)
    {

      v14 = 0;
LABEL_53:
      v74 = 0;
      v75 = 0;
      v40 = 0;
      v28 = 0;
      v50 = 0;
      v53 = 0;
      v9 = v17;
      goto LABEL_68;
    }
    v25 = v16;
  }
  else
  {
    v25 = 0;
  }
  v71 = v7;
  v76 = v25;
  -[MSCMSEnvelopedData setOriginatorCertificates:](v14, "setOriginatorCertificates:");
  if ((_DWORD)v91)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    do
    {
      v29 = v28;
      v30 = v9;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v83 = 0u;
      v32 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26 + 16);
      v31 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26 + 32);
      v83 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26);
      v84 = v32;
      v85 = v31;
      v33 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26 + 96);
      v35 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26 + 48);
      v34 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26 + 64);
      v88 = *(_OWORD *)(*((_QWORD *)&v91 + 1) + v26 + 80);
      v89 = v33;
      v86 = v35;
      v87 = v34;
      v82 = v9;
      +[MSCMSRecipientInfo decodeRecipientInfo:certificates:LAContext:error:](MSCMSRecipientInfo, "decodeRecipientInfo:certificates:LAContext:error:", &v83, v76, 0, &v82);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v82;

      if (v28)
      {
        if (v76 && objc_msgSend(v76, "count"))
        {
          *(_QWORD *)buf = 0;
          v36 = SecCertificateCopyKey((SecCertificateRef)objc_msgSend(v76, "objectAtIndex:", 0));
          SecKeyCopyPublicBytes();
          if (v36)
            CFRelease(v36);
          v37 = *(void **)buf;
          objc_msgSend(v28, "setOriginatorPubKey:", *(_QWORD *)buf);

        }
        -[MSCMSEnvelopedData addRecipient:](v14, "addRecipient:", v28);
      }
      else
      {
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_31);
        v38 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v27;
          v97 = 2112;
          v98 = v9;
          _os_log_impl(&dword_1DEED9000, v38, OS_LOG_TYPE_ERROR, "failed to decode recipient %u: %@", buf, 0x12u);
        }
      }
      ++v27;
      v26 += 112;
    }
    while (v27 < v91);
  }
  else
  {
    v28 = 0;
  }
  -[MSCMSEnvelopedData recipients](v14, "recipients");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "count");

  if (!v40)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], 0, v9, CFSTR("unable to decode envelopedData.recipientInfos"));
    v69 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v74 = 0;
    v75 = 0;
    v50 = 0;
    v53 = 0;
    v9 = (id)v69;
    v7 = v71;
    a5 = v72;
    v8 = v73;
    goto LABEL_68;
  }
  NSDataFromOctetString(*((_QWORD **)&v94 + 1));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSEnvelopedData setEncryptedContent:](v14, "setEncryptedContent:", v41);

  v81 = v9;
  +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", &v93, &v81);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = v81;

  v70 = (void *)v42;
  -[MSCMSEnvelopedData setEncryptionAlgorithm:](v14, "setEncryptionAlgorithm:", v42);
  -[MSCMSEnvelopedData recipients](v14, "recipients");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  v7 = v71;
  if (!v45)
  {
LABEL_45:

    v14 = 0;
    v75 = 0;
    v50 = 0;
LABEL_46:
    v74 = 0;
    v53 = 0;
    v9 = v43;
    goto LABEL_47;
  }
  v46 = 0;
  while (1)
  {
    v47 = v28;
    v48 = v43;
    -[MSCMSEnvelopedData recipients](v14, "recipients");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndex:", v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = v48;
    -[MSCMSEnvelopedData decryptContent:error:](v14, "decryptContent:error:", v28, &v80);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v80;

    if (v50)
      break;
    ++v46;
    -[MSCMSEnvelopedData recipients](v14, "recipients");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (v46 >= v52)
      goto LABEL_45;
  }
  v79 = v43;
  +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", &v92, &v79);
  v54 = objc_claimAutoreleasedReturnValue();
  v9 = v79;

  if (!v54)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v9, CFSTR("unable to get contentType from envelopedData.encryptedContentnInfo"));
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v75 = 0;
    goto LABEL_46;
  }
  v75 = (void *)v54;
  -[MSCMSEnvelopedData setContentType:](v14, "setContentType:", v54);
  -[MSCMSEnvelopedData contentType](v14, "contentType");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1"));

  v8 = v73;
  if ((v56 & 1) != 0)
  {
    -[MSCMSEnvelopedData setDataContent:](v14, "setDataContent:", v50);
    v74 = 0;
  }
  else
  {
    -[MSCMSEnvelopedData contentType](v14, "contentType");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v9;
    decodeEmbeddedCMSContent(v57, v50, v73, (uint64_t)&v78);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = v78;

    v74 = (void *)v58;
    -[MSCMSEnvelopedData setEmbeddedContent:](v14, "setEmbeddedContent:", v58);
    v9 = v59;
  }
  a5 = v72;
  v40 = v70;
  if (!v95)
  {
    v53 = 0;
    goto LABEL_67;
  }
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v53 && (v60 = v95, *v95))
  {
    v61 = 0;
    v62 = 0;
    do
    {
      v83 = 0u;
      v84 = 0u;
      v63 = (__int128 *)(*((_QWORD *)v60 + 1) + v61);
      v64 = v63[1];
      v83 = *v63;
      v84 = v64;
      v77 = v9;
      +[MSCMSAttribute decodeAttribute:error:](MSCMSAttribute, "decodeAttribute:error:", &v83, &v77);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v77;

      if (v65)
        objc_msgSend(v53, "addObject:", v65);

      ++v62;
      v60 = v95;
      v61 += 32;
      v9 = v66;
    }
    while (v62 < *v95);
  }
  else
  {
    v66 = v9;
  }
  if (objc_msgSend(v53, "count"))
  {
    v9 = v66;
    v7 = v71;
    a5 = v72;
    v8 = v73;
    v40 = v70;
LABEL_67:
    -[MSCMSEnvelopedData setUnprotectedAttributes:](v14, "setUnprotectedAttributes:", v53);
    goto LABEL_68;
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], 0, v66, CFSTR("unable to decode envelopedData.unprotectedAttrs"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v7 = v71;
LABEL_47:
  a5 = v72;
  v8 = v73;
  v40 = v70;
LABEL_68:
  free_EnvelopedData();
  if (a5 && v9)
    *a5 = objc_retainAutorelease(v9);
  v67 = v14;

  return v67;
}

void __64__MSCMSEnvelopedData_decodeMessageSecurityObject_options_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

+ (id)encodeOriginatorInfoCertificates:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  CFDataRef v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  int v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  MSCMSEnvelopedData *v28;
  SEL v29;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 && *a4)
    v6 = (void *)objc_msgSend(*a4, "copy");
  else
    v6 = 0;
  v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  if (v5)
  {
    v32 = v6;
    LODWORD(v37) = objc_msgSend(v5, "count");
    v7 = (char *)malloc_type_malloc(24 * v37, 0x10800404ACF7207uLL);
    v38 = v7;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v31 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v9);
          v15 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v33 + 1) + 8 * i));
          if (v15)
          {
            objc_msgSend(v8, "addObject:", v15);
            v16 = &v7[24 * v12];
            *(_DWORD *)v16 = 1;
            *((_QWORD *)v16 + 1) = -[__CFData length](v15, "length");
            v17 = -[__CFData bytes](objc_retainAutorelease(v15), "bytes");
            v7 = (char *)v38;
            *((_QWORD *)v38 + 3 * v12++ + 2) = v17;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v11);
    }

    v39 = &v37;
    v40 = 0;
    v18 = length_OriginatorInfo();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = objc_retainAutorelease(v19);
      objc_msgSend(v20, "mutableBytes");
      v21 = encode_OriginatorInfo();
      if (!v21)
      {
        v27 = v18 == 0;
        v6 = v32;
        if (!v27)
        {
          v28 = (MSCMSEnvelopedData *)asn1_abort();
          return -[MSCMSEnvelopedData type](v28, v29);
        }
        goto LABEL_23;
      }
      v22 = v21;

      v23 = v22;
    }
    else
    {
      v23 = 12;
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v42 = CFSTR("Failed encoding type OriginatorInfo");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v23, v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
LABEL_23:
    free(v38);
    if (a4)
    {
      if (v6)
        *a4 = objc_retainAutorelease(v6);
    }
    v24 = v20;

    v5 = v31;
    goto LABEL_27;
  }
  v24 = 0;
LABEL_27:

  return v24;
}

- (MSOID)type
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.7.3"), 0);
}

- (NSData)dataContent
{
  return self->_dataContent;
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 32, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MSAlgorithmIdentifier)encryptionAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEncryptionAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableArray)unprotectedAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnprotectedAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableArray)originatorCertificates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOriginatorCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)legacyASN1Encoding
{
  return self->_legacyASN1Encoding;
}

- (void)setLegacyASN1Encoding:(BOOL)a3
{
  self->_legacyASN1Encoding = a3;
}

- (NSData)encryptedContent
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEncryptedContent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_encryptedContent, 0);
  objc_storeStrong((id *)&self->_originatorCertificates, 0);
  objc_storeStrong((id *)&self->_unprotectedAttributes, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_embeddedContent, 0);
  objc_storeStrong((id *)&self->_dataContent, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
