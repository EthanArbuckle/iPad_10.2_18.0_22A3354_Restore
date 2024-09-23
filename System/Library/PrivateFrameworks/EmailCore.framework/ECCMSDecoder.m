@implementation ECCMSDecoder

- (ECCMSDecoder)initWithContentInfo:(id)a3 detachedContentData:(id)a4
{
  id v7;
  id v8;
  ECCMSDecoder *v9;
  ECCMSDecoder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ECCMSDecoder;
  v9 = -[ECCMSDecoder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentInfo, a3);
    objc_storeStrong((id *)&v10->_detachedContentData, a4);
  }

  return v10;
}

+ (id)decoderForEncodedData:(id)a3 detachedContentData:(id)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D4D770], "decodeMessageSecurityObject:options:error:", a3, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContentInfo:detachedContentData:", v9, v8);
  else
    v10 = 0;

  return v10;
}

+ (id)decoderForEncodedData:(id)a3 outError:(id *)a4
{
  objc_msgSend(a1, "decoderForEncodedData:detachedContentData:outError:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEncrypted
{
  void *v2;
  char v3;

  -[MSCMSContentInfo contentType](self->_contentInfo, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D4D6D8]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D4D6C8]);

  return v3;
}

- (BOOL)isSigned
{
  void *v2;
  char v3;

  -[MSCMSContentInfo contentType](self->_contentInfo, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D4D6E0]);

  return v3;
}

- (NSData)decryptedContentData
{
  void *v3;
  void *v4;

  if (-[ECCMSDecoder isEncrypted](self, "isEncrypted"))
  {
    -[MSCMSContentInfo embeddedContent](self->_contentInfo, "embeddedContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSData *)v4;
}

- (id)extractSignatureInfoAndSignedData:(id *)a3 outError:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSData *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[ECCMSDecoder isSigned](self, "isSigned"))
    return 0;
  -[MSCMSContentInfo embeddedContent](self->_contentInfo, "embeddedContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  if (!self->_detachedContentData)
  {
    objc_msgSend(v7, "dataContent");
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(v8, "signers", v12);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
LABEL_11:
      v17 = 0;
      v18 = v14;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
        v22 = v18;
        v20 = objc_msgSend(v19, "verifySignature:", &v22);
        v14 = v22;

        if ((v20 & 1) == 0)
          break;
        ++v17;
        v18 = v14;
        if (v15 == v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v15)
            goto LABEL_11;
          break;
        }
      }
    }

    if (a3)
      *a3 = objc_retainAutorelease(v21);
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    objc_msgSend(v13, "ef_map:", &__block_literal_global_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  objc_msgSend(v7, "dataContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = self->_detachedContentData;
    objc_msgSend(v8, "setDataContent:", self->_detachedContentData);
    goto LABEL_9;
  }
LABEL_5:
  v10 = 0;
LABEL_22:

  return v10;
}

ECSignatureInfo *__59__ECCMSDecoder_extractSignatureInfoAndSignedData_outError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ECSignatureInfo *v3;

  v2 = a2;
  v3 = -[ECSignatureInfo initWithSignerInfo:]([ECSignatureInfo alloc], "initWithSignerInfo:", v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detachedContentData, 0);
  objc_storeStrong((id *)&self->_contentInfo, 0);
}

@end
