@implementation MSCMSRecipientInfo

- (void)setOriginator:(__SecCertificate *)a3
{
  if (a3)
    CFRetain(a3);
  self->_originator = a3;
}

- (void)setOriginatorIdentity:(__SecIdentity *)a3
{
  if (a3)
    CFRetain(a3);
  self->_originatorIdentity = a3;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3
{
  return -[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:](self, "initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:", a3, 0, 0);
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 legacyKeyWrapAlgorithm:(BOOL)a4
{
  void *v6;
  MSCMSRecipientInfo *v7;

  if (a4)
  {
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.42"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:](self, "initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:", a3, 0, v6);

  return v7;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 algorithmCapabilities:(id)a4
{
  id v6;
  void *v7;
  MSCMSRecipientInfo *v8;
  MSCMSRecipientInfo *v9;

  v6 = a4;
  findBestMutuallySupportedKeyEncryptionAlgorithm(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:](self, "initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:", a3, 0, v7);
  v9 = v8;
  if (v8)
    -[MSCMSRecipientInfo setAlgorithmCapabilities:](v8, "setAlgorithmCapabilities:", v6);

  return v9;
}

- (MSCMSRecipientInfo)initWithCertificate:(__SecCertificate *)a3 keyEncryptionAlgorithm:(id)a4 keyWrapAlgorithm:(id)a5
{
  id v8;
  id v9;
  MSCMSRecipientInfo *v10;
  MSCMSRecipientInfo *v11;
  MSCMSRecipientInfo *v12;
  id v13;
  uint64_t KeyTypeForCertificate;
  void *v15;
  void *v16;
  uint64_t v17;
  MSOID *keyEncryptionAlgorithm;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  MSOID *v26;
  uint64_t v27;
  MSAlgorithmIdentifier *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  MSAlgorithmIdentifier *v34;
  size_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  MSAlgorithmIdentifier *v45;
  uint64_t v46;
  void *v47;
  id v48;
  int v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  MSAlgorithmIdentifier *v55;
  MSAlgorithmIdentifier *v56;
  uint64_t v58;
  objc_super v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  _BYTE buf[22];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v59.receiver = self;
  v59.super_class = (Class)MSCMSRecipientInfo;
  v10 = -[MSCMSRecipientInfo init](&v59, sel_init);
  v11 = v10;
  v12 = 0;
  if (!a3 || !v10)
    goto LABEL_54;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "addObject:", a3);
  objc_storeStrong((id *)&v11->_recipientCertificates, v13);
  KeyTypeForCertificate = getKeyTypeForCertificate(a3);
  if (KeyTypeForCertificate != 3)
  {
    if (KeyTypeForCertificate != 1)
    {
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_23);
      v21 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[MSCMSRecipientInfo initWithCertificate:keyEncryptionAlgorithm:keyWrapAlgorithm:]";
        _os_log_impl(&dword_1DEED9000, v21, OS_LOG_TYPE_ERROR, "MSCMSRecipientInfo %s: Unsupported certificate key type", buf, 0xCu);
      }
      v12 = 0;
      goto LABEL_53;
    }
    if (initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken != -1)
      dispatch_once(&initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken, &__block_literal_global_0);
    if (v8)
    {
      v15 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs;
      objc_msgSend(v8, "OIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

      if ((_DWORD)v15)
      {
        +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v8);
        v17 = objc_claimAutoreleasedReturnValue();
        keyEncryptionAlgorithm = (MSOID *)v11->_keyEncryptionAlgorithm;
        v11->_keyEncryptionAlgorithm = (MSAlgorithmIdentifier *)v17;
LABEL_52:

        v12 = v11;
LABEL_53:

LABEL_54:
        return v12;
      }
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5);
      v22 = (void *)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        objc_msgSend(v8, "OIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 1;
        _os_log_impl(&dword_1DEED9000, v23, OS_LOG_TYPE_DEFAULT, "MSCMSRecipientInfo init encryption algorithm %@ not permitted for certificate key type %ld", buf, 0x16u);

      }
    }
    objc_msgSend((id)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndex:", 0);
    keyEncryptionAlgorithm = (MSOID *)objc_claimAutoreleasedReturnValue();

    v26 = -[MSOID initWithString:error:]([MSOID alloc], "initWithString:error:", keyEncryptionAlgorithm, 0);
    +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v11->_keyEncryptionAlgorithm;
    v11->_keyEncryptionAlgorithm = (MSAlgorithmIdentifier *)v27;

LABEL_51:
    goto LABEL_52;
  }
  if (initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken_8 != -1)
    dispatch_once(&initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__onceToken_8, &__block_literal_global_10_0);
  if (v8)
  {
    v19 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs;
    objc_msgSend(v8, "OIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v19, "containsObject:", v20);

    if ((_DWORD)v19)
    {
      keyEncryptionAlgorithm = (MSOID *)v8;
      if (!v9)
        goto LABEL_31;
      goto LABEL_32;
    }
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_12);
    v29 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      objc_msgSend(v8, "OIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 3;
      _os_log_impl(&dword_1DEED9000, v30, OS_LOG_TYPE_DEFAULT, "MSCMSRecipientInfo init encryption algorithm %@ not permitted for certificate key type %ld", buf, 0x16u);

    }
  }
  objc_msgSend((id)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndex:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  keyEncryptionAlgorithm = -[MSOID initWithString:error:]([MSOID alloc], "initWithString:error:", v33, 0);
  if (!v9)
  {
LABEL_31:
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.1.45"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_32:
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.42")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.22")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.2")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("1.2.840.113549.3.7")) & 1) == 0
    && !objc_msgSend(v9, "isEqualToString:", CFSTR("1.2.840.113549.3.2")))
  {
    v26 = 0;
    goto LABEL_44;
  }
  v34 = -[MSAlgorithmIdentifier initWithOID:]([MSAlgorithmIdentifier alloc], "initWithOID:", v9);
  v35 = -[MSAlgorithmIdentifier blockSize:](v34, "blockSize:", 0);

  v36 = malloc_type_malloc(v35, 0x16BC6297uLL);
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], v35, v36);
  *(_QWORD *)buf = v35;
  *(_QWORD *)&buf[8] = v36;
  v37 = length_DataContent();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v26 = objc_retainAutorelease(v38);
    -[MSOID mutableBytes](v26, "mutableBytes");
    v39 = encode_DataContent();
    if (!v39)
    {
      if (v37)
        goto LABEL_56;
      goto LABEL_43;
    }
    v40 = v39;

    v41 = v40;
  }
  else
  {
    v41 = 12;
  }
  v42 = (void *)MEMORY[0x1E0CB35C8];
  v62 = *MEMORY[0x1E0CB2D50];
  v63 = CFSTR("Failed encoding type DataContent");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v41, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
LABEL_43:
  free(v36);
LABEL_44:
  v45 = -[MSAlgorithmIdentifier initWithOID:parameters:]([MSAlgorithmIdentifier alloc], "initWithOID:parameters:", v9, v26);
  *(_QWORD *)buf = 0;
  -[MSAlgorithmIdentifier asn1AlgId](v45, "asn1AlgId");
  v46 = length_AlgorithmIdentifier();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    v51 = 12;
    goto LABEL_48;
  }
  v48 = objc_retainAutorelease(v47);
  objc_msgSend(v48, "mutableBytes");
  -[MSAlgorithmIdentifier asn1AlgId](v45, "asn1AlgId");
  v49 = encode_AlgorithmIdentifier();
  if (v49)
  {
    v50 = v49;

    v51 = v50;
LABEL_48:
    v52 = (void *)MEMORY[0x1E0CB35C8];
    v60 = *MEMORY[0x1E0CB2D50];
    v61 = CFSTR("Failed encoding type AlgorithmIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v51, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0;
LABEL_50:
    v55 = -[MSAlgorithmIdentifier initWithOID:parameters:]([MSAlgorithmIdentifier alloc], "initWithOID:parameters:", keyEncryptionAlgorithm, v48);
    v56 = v11->_keyEncryptionAlgorithm;
    v11->_keyEncryptionAlgorithm = v55;

    goto LABEL_51;
  }
  if (v46 == *(_QWORD *)buf)
    goto LABEL_50;
LABEL_56:
  v58 = asn1_abort();
  return (MSCMSRecipientInfo *)__82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke(v58);
}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("1.2.840.113549.1.1.1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs;
  initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedRSAEncAlgs = v2;

}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_9()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("1.3.133.16.840.63.0.2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs;
  initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm__sAllowedECEncAlgs = v2;

}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_2_11()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke_22()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (MSCMSRecipientInfo)initWithEmail:(id)a3
{
  id v4;
  MSCMSRecipientInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MSCMSRecipientInfo;
  v5 = -[MSCMSRecipientInfo init](&v7, sel_init);
  if (v5)
    v5 = -[MSCMSRecipientInfo initWithCertificate:](v5, "initWithCertificate:", findCertificateByEmailAddress(v4, 0, 0));

  return v5;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3 algorithmCapabilities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MSCMSRecipientInfo *v9;
  MSCMSRecipientInfo *v10;
  MSCMSRecipientInfo *v11;

  v6 = a4;
  v7 = a3;
  findBestMutuallySupportedKeyEncryptionAlgorithm(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSCMSRecipientInfo initWithEmail:keyEncryptionAlgorithm:](self, "initWithEmail:keyEncryptionAlgorithm:", v7, v8);

  v10 = v9;
  v11 = v10;
  if (v10)
    -[MSCMSRecipientInfo setAlgorithmCapabilities:](v10, "setAlgorithmCapabilities:", v6);

  return v11;
}

- (MSCMSRecipientInfo)initWithEmail:(id)a3 keyEncryptionAlgorithm:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSCMSRecipientInfo;

  return 0;
}

- (BOOL)encodeKeyTransRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  __SecCertificate *v13;
  MSCMSIdentifier *v14;
  void *v15;
  NSNumber *v16;
  NSNumber *version;
  MSCMSIdentifier *v18;
  id v19;
  NSNumber *v20;
  NSNumber *v21;
  CFDataRef v22;
  void *v23;
  void *v24;
  id v25;
  AlgorithmIdentifier *v26;
  unint64_t var1;
  id v28;
  uint64_t v30;
  id v31;
  id v32;

  v8 = a3;
  if (a5 && *a5)
    v9 = (id)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("1.2.840.113549.1.1.1"));

  if (!v11)
  {
    v15 = 0;
    v19 = 0;
    v18 = 0;
    v12 = 0;
    goto LABEL_14;
  }
  v12 = a4 != 0;
  if (!a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -50, v9, CFSTR("Unable to encode RecipientInfo: missing destination address"));
    v30 = objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v19 = 0;
    v18 = 0;
    v9 = (id)v30;
    if (!a5)
      goto LABEL_14;
    goto LABEL_12;
  }
  *(_OWORD *)&a4->var1.var1.var3.var0.components = 0u;
  a4->var1.var1.var4 = 0u;
  a4->var1.var1.var1.var1.var2.var1 = 0u;
  *(_OWORD *)&a4->var1.var1.var2 = 0u;
  *(_OWORD *)&a4->var1.var1.var1.var0 = 0u;
  *(_OWORD *)&a4->var1.var1.var1.var1.var2.var0.var0.components = 0u;
  *(_OWORD *)&a4->var0 = 0u;
  a4->var0 = 1;
  v13 = -[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0);
  v14 = [MSCMSIdentifier alloc];
  SecCertificateGetSubjectKeyID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    a4->var1.var0.var0 = 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v16;

    v18 = -[MSCMSIdentifier initWithSkid:]([MSCMSIdentifier alloc], "initWithSkid:", v15);
  }
  else
  {
    a4->var1.var0.var0 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v21 = self->_version;
    self->_version = v20;

    v31 = v8;
    v22 = SecCertificateCopySerialNumberData(v13, 0);
    v23 = (void *)SecCertificateCopyIssuerSequence();
    v18 = -[MSCMSIdentifier initWithIssuerName:serialNumber:]([MSCMSIdentifier alloc], "initWithIssuerName:serialNumber:", v23, v22);

    v14 = (MSCMSIdentifier *)v22;
    v8 = v31;
  }

  v32 = v9;
  -[MSCMSIdentifier encodeMessageSecurityObject:](v18, "encodeMessageSecurityObject:", &v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v32;

  v26 = -[MSAlgorithmIdentifier asn1AlgId](self->_keyEncryptionAlgorithm, "asn1AlgId");
  var1 = (unint64_t)v26->var1;
  *(heim_oid *)&a4->var1.var1.var1.var1.var2.var0.var0.components = v26->var0;
  a4->var1.var1.var1.var1.var2.var1.var0 = var1;
  v28 = objc_retainAutorelease(v8);
  a4->var1.var0.var3.var1 = (void *)objc_msgSend(v28, "bytes");
  a4->var1.var0.var3.var0 = objc_msgSend(v28, "length");
  v19 = objc_retainAutorelease(v24);
  a4->var1.var1.var1.var1.var0.var0.var0 = objc_msgSend(v19, "bytes");
  a4->var1.var0.var1.var0 = objc_msgSend(v19, "length");
  v9 = v25;
  if (a5)
  {
LABEL_12:
    if (v9)
    {
      v9 = objc_retainAutorelease(v9);
      *a5 = v9;
    }
  }
LABEL_14:

  return v12;
}

- (BOOL)encodeKeyAgreeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  __SecIdentity *originatorIdentity;
  __SecCertificate *originator;
  id v14;
  void *v15;
  const __CFData *v16;
  MSCMSIdentifier *v17;
  CFDataRef v18;
  void *v19;
  id v20;
  BOOL v21;
  AlgorithmIdentifier *v22;
  heim_base_data *var1;
  RecipientEncryptedKey *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  RecipientInfo *v30;
  BOOL v31;
  id v32;
  id v33;
  id v34;

  v8 = a3;
  if (a5 && *a5)
    v9 = (id)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("1.3.133.16.840.63.0.2"));

  if (!v11)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    a4 = 0;
    v16 = 0;
    v21 = 0;
    goto LABEL_20;
  }
  v31 = a4 != 0;
  v32 = v8;
  if (a4)
  {
    *(_OWORD *)&a4->var1.var1.var3.var0.components = 0u;
    a4->var1.var1.var4 = 0u;
    a4->var1.var1.var1.var1.var2.var1 = 0u;
    *(_OWORD *)&a4->var1.var1.var2 = 0u;
    *(_OWORD *)&a4->var1.var1.var1.var0 = 0u;
    *(_OWORD *)&a4->var1.var1.var1.var1.var2.var0.var0.components = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    a4->var0 = 2;
    a4->var1.var0.var0 = 3;
    originator = self->_originator;
    originatorIdentity = self->_originatorIdentity;
    if (originatorIdentity)
    {
      if (originator)
      {
        self->_originator = 0;
        CFRelease(originator);
        originatorIdentity = self->_originatorIdentity;
      }
      v34 = v9;
      originator = MSSecIdentityCopyCertificateWithError(originatorIdentity, &v34);
      v14 = v34;

      self->_originator = originator;
      v9 = v14;
    }
    if (originator)
    {
      a4->var1.var1.var1.var0 = 1;
      v15 = (void *)SecCertificateCopyIssuerSequence();
      a4->var1.var1.var1.var1.var0.var0.var0 = objc_msgSend(v15, "length");
      v30 = objc_retainAutorelease(v15);
      a4->var1.var0.var2.var0.length = -[RecipientInfo bytes](v30, "bytes");
      v16 = objc_retainAutorelease(SecCertificateCopySerialNumberData(self->_originator, 0));
      a4->var1.var1.var1.var1.var2.var1.var0 = -[__CFData bytes](v16, "bytes");
      a4->var1.var1.var1.var1.var0.var1.var0 = -[__CFData length](v16, "length");
      a4->var1.var1.var1.var1.var0.var1.var2 = 0;
    }
    else
    {
      v30 = 0;
      v16 = 0;
    }
    a4->var1.var0.var3.var1 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
    *(_QWORD *)a4->var1.var0.var3.var1 = -[NSData length](self->_userKeyingMaterial, "length");
    *((_QWORD *)a4->var1.var0.var3.var1 + 1) = -[NSData bytes](self->_userKeyingMaterial, "bytes");
    v22 = -[MSAlgorithmIdentifier asn1AlgId](self->_keyEncryptionAlgorithm, "asn1AlgId");
    var1 = v22->var1;
    a4->var1.var1.var3.var0 = v22->var0;
    a4->var1.var1.var3.var1 = var1;
    a4->var1.var1.var4.var0 = 1;
    v24 = (RecipientEncryptedKey *)malloc_type_malloc(0x20uLL, 0x10800403AF1B36BuLL);
    v18 = SecCertificateCopySerialNumberData((SecCertificateRef)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0), 0);
    v19 = (void *)SecCertificateCopyIssuerSequence();
    v17 = -[MSCMSIdentifier initWithIssuerName:serialNumber:]([MSCMSIdentifier alloc], "initWithIssuerName:serialNumber:", v19, v18);
    v33 = v9;
    -[MSCMSIdentifier encodeMessageSecurityObject:](v17, "encodeMessageSecurityObject:", &v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v33;

    v20 = objc_retainAutorelease(v25);
    *((_QWORD *)v24 + 1) = objc_msgSend(v20, "bytes");
    *(_QWORD *)v24 = objc_msgSend(v20, "length");
    v27 = objc_retainAutorelease(v32);
    *((_QWORD *)v24 + 3) = objc_msgSend(v27, "bytes");
    *((_QWORD *)v24 + 2) = objc_msgSend(v27, "length");
    a4->var1.var1.var4.var1 = v24;
    v9 = v26;
    a4 = v30;
    if (a5)
      goto LABEL_16;
LABEL_19:
    v8 = v32;
    v21 = v31;
    goto LABEL_20;
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -50, v9, CFSTR("Unable to encode RecipientInfo: missing destination address"));
  v28 = objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v16 = 0;
  v9 = (id)v28;
  if (!a5)
    goto LABEL_19;
LABEL_16:
  v8 = v32;
  v21 = v31;
  if (v9)
  {
    v9 = objc_retainAutorelease(v9);
    *a5 = v9;
  }
LABEL_20:

  return v21;
}

- (void)freeKeyTransRecipientInfo:(const RecipientInfo *)a3
{
  free(a3->var1.var0.var3.var1);
  free(a3->var1.var1.var4.var1);
}

- (BOOL)encodeRecipientInfo:(id)a3 recipientInfo:(RecipientInfo *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  int v13;
  BOOL v14;

  v8 = a3;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1.2.840.113549.1.1.1"));

  if (v10)
  {
    v11 = -[MSCMSRecipientInfo encodeKeyTransRecipientInfo:recipientInfo:error:](self, "encodeKeyTransRecipientInfo:recipientInfo:error:", v8, a4, a5);
  }
  else
  {
    -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("1.3.133.16.840.63.0.2"));

    if (!v13)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v11 = -[MSCMSRecipientInfo encodeKeyAgreeRecipientInfo:recipientInfo:error:](self, "encodeKeyAgreeRecipientInfo:recipientInfo:error:", v8, a4, a5);
  }
  v14 = v11;
LABEL_7:

  return v14;
}

- (void)freeRecipientInfo:(const RecipientInfo *)a3
{
  void *v5;
  int v6;

  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("1.3.133.16.840.63.0.2"));

  if (v6)
    -[MSCMSRecipientInfo freeKeyTransRecipientInfo:](self, "freeKeyTransRecipientInfo:", a3);
}

- (id)encryptBulkKey:(id)a3
{
  const __CFData *v4;
  void *v5;
  int v6;
  NSArray *recipientCertificates;
  __SecKey *v8;
  CFDataRef EncryptedData;
  __CFData *v10;
  void *v11;
  int v12;
  MSAlgorithmIdentifier *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const UInt8 *BytePtr;
  id v24;
  CFIndex Length;
  const __CFData *v26;
  const uint8_t *v27;
  size_t v28;
  uint8_t *v29;
  const uint8_t *v30;
  size_t v31;
  void *v33;
  char v34;
  CCAlgorithm v35;
  const UInt8 *v36;
  size_t v37;
  id v38;
  const __CFData *v39;
  size_t OutputLength;
  _CCCryptor *v41;
  const void *v42;
  size_t v43;
  _CCCryptor *v44;
  uint64_t v45;
  size_t v46;
  const uint8_t *v47;
  CCWrappingAlgorithm algorithm;
  size_t v49;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;
  uint64_t v52;
  void *iv;

  v4 = (const __CFData *)a3;
  v52 = 0;
  iv = 0;
  cryptorRef = 0;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("1.2.840.113549.1.1.1"));

  if (v6)
  {
    recipientCertificates = self->_recipientCertificates;
    if (recipientCertificates)
    {
      if (-[NSArray count](recipientCertificates, "count"))
      {
        v8 = SecCertificateCopyKey((SecCertificateRef)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0));
        if (v8)
        {
          EncryptedData = SecKeyCreateEncryptedData(v8, (SecKeyAlgorithm)*MEMORY[0x1E0CD6E48], v4, 0);
          v10 = 0;
          goto LABEL_22;
        }
      }
    }
    goto LABEL_20;
  }
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("1.3.133.16.840.63.0.2"));

  if (!v12
    || (v13 = [MSAlgorithmIdentifier alloc],
        -[MSAlgorithmIdentifier parameters](self->_keyEncryptionAlgorithm, "parameters"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MSAlgorithmIdentifier decode:error:](v13, "decode:error:", v14, 0),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v15))
  {
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v15, "parameters");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "parameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    if (!v17
      || !objc_msgSend(v17, "length")
      || (dataOutMoved = 0,
          v16 = objc_retainAutorelease(v16),
          objc_msgSend(v16, "bytes"),
          objc_msgSend(v16, "length"),
          der_get_octet_string_ber(),
          objc_msgSend(v16, "length")))
    {
      v10 = 0;
LABEL_36:
      v18 = 0;
LABEL_37:
      EncryptedData = 0;
      goto LABEL_34;
    }
    v10 = 0;
    v18 = 0;
    if (v52 != objc_msgSend(v15, "blockSize:", 0))
    {
LABEL_19:

LABEL_21:
      EncryptedData = 0;
      goto LABEL_22;
    }
  }
  v10 = -[MSCMSRecipientInfo keyEncryptionKey:forEncryption:secCMSCompatibility:](self, "keyEncryptionKey:forEncryption:secCMSCompatibility:", v15, 1, 0);
  if (!v10)
    goto LABEL_36;
  objc_msgSend(v15, "algorithm");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.5")) & 1) != 0)
  {
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v15, "algorithm");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.25")))
  {

    goto LABEL_17;
  }
  objc_msgSend(v15, "algorithm");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.45"));

  if ((v34 & 1) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", CCSymmetricWrappedSize(objc_msgSend(v15, "ccAlgorithm:", 0), -[__CFData length](v4, "length")));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    dataOutMoved = objc_msgSend(v21, "length");
    algorithm = objc_msgSend(v15, "ccAlgorithm:", 0);
    v47 = (const uint8_t *)*MEMORY[0x1E0C803C8];
    v46 = *MEMORY[0x1E0C803D0];
    v22 = v15;
    BytePtr = CFDataGetBytePtr(v10);
    v24 = v16;
    Length = CFDataGetLength(v10);
    v26 = objc_retainAutorelease(v4);
    v27 = (const uint8_t *)-[__CFData bytes](v26, "bytes");
    v28 = -[__CFData length](v26, "length");
    v18 = objc_retainAutorelease(v21);
    v29 = (uint8_t *)objc_msgSend(v18, "mutableBytes");
    v30 = BytePtr;
    v15 = v22;
    v31 = Length;
    v16 = v24;
    LODWORD(v28) = CCSymmetricKeyWrap(algorithm, v47, v46, v30, v31, v27, v28, v29, &dataOutMoved);
    objc_msgSend(v18, "setLength:", dataOutMoved);
    if ((_DWORD)v28)
      goto LABEL_19;
    goto LABEL_33;
  }
  v35 = objc_msgSend(v15, "ccAlgorithm:", 0);
  v36 = CFDataGetBytePtr(v10);
  v37 = CFDataGetLength(v10);
  if (CCCryptorCreate(0, v35, 1u, v36, v37, iv, &cryptorRef))
    goto LABEL_36;
  v38 = v16;
  v39 = v4;
  OutputLength = CCCryptorGetOutputLength(cryptorRef, -[__CFData length](v39, "length"), 1);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", OutputLength);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18
    || (dataOutMoved = 0,
        v41 = cryptorRef,
        v39 = objc_retainAutorelease(v39),
        v42 = (const void *)-[__CFData bytes](v39, "bytes"),
        v43 = -[__CFData length](v39, "length"),
        v18 = objc_retainAutorelease(v18),
        CCCryptorUpdate(v41, v42, v43, (void *)objc_msgSend(v18, "mutableBytes"), OutputLength, &dataOutMoved)))
  {

    EncryptedData = 0;
    v16 = v38;
    goto LABEL_34;
  }
  v49 = 0;
  v44 = cryptorRef;
  v18 = objc_retainAutorelease(v18);
  v45 = objc_msgSend(v18, "mutableBytes");
  v16 = v38;
  if (CCCryptorFinal(v44, (void *)(v45 + dataOutMoved), OutputLength - dataOutMoved, &v49))
  {

    goto LABEL_37;
  }
  objc_msgSend(v18, "setLength:", v49 + dataOutMoved);

LABEL_33:
  v18 = v18;
  EncryptedData = (CFDataRef)v18;
LABEL_34:

LABEL_22:
  der_free_octet_string();
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);
  if (v10)
    CFRelease(v10);

  return EncryptedData;
}

+ (id)decodeKeyTransRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  __SecCertificate *CertificateForIdentifier;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  MSCMSRecipientInfo *v21;
  MSCMSRecipientInfo *v22;
  id v23;
  MSCMSRecipientInfo *v24;
  id v26;
  id v27;
  id v28;
  uint8_t buf[16];
  id v30;
  id v31;

  v9 = a4;
  v10 = a5;
  if (a6 && *a6)
    v11 = (id)objc_msgSend(*a6, "copy");
  else
    v11 = 0;
  if (a3->var0 != 1)
  {
    v24 = 0;
    goto LABEL_29;
  }
  v31 = v11;
  +[MSCMSIdentifier decodeIdentifier:error:](MSCMSIdentifier, "decodeIdentifier:error:", &a3->var1.var1.var1, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;

  v26 = v10;
  v27 = v9;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var1.var0.var0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "type");
    if (v15 == 1)
    {
      if (!objc_msgSend(v14, "intValue"))
      {
LABEL_10:
        v30 = v13;
        CertificateForIdentifier = (__SecCertificate *)findCertificateForIdentifier((uint64_t)&a3->var1.var0.var1, v9, v10, &v30);
        v17 = v30;

        if (CertificateForIdentifier)
        {
          if (objc_msgSend(v12, "type") == 1
            && SecCertificateVersion() == 3
            && getKeyTypeForCertificate(CertificateForIdentifier) == 1
            && (SecCertificateGetKeyUsage() & 4) == 0)
          {
            if (MS_DEFAULT_LOG_BLOCK != -1)
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_33);
            v18 = MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DEED9000, v18, OS_LOG_TYPE_DEFAULT, "recipientInfo violates RFC 5652 (key usage)", buf, 2u);
            }
          }
          v28 = v17;
          +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", &a3->var1.var1.var1.var1.var2.var0.var0.components, &v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v28;

          NSDataFromOctetString(&a3->var1.var0.var3.var0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = [MSCMSRecipientInfo alloc];
          v22 = v21;
          if (v21)
          {
            -[MSCMSRecipientInfo setVersion:](v21, "setVersion:", v14);
            v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v23, "addObject:", CertificateForIdentifier);

            -[MSCMSRecipientInfo setRecipientCertificates:](v22, "setRecipientCertificates:", v23);
            -[MSCMSRecipientInfo setKeyEncryptionAlgorithm:](v22, "setKeyEncryptionAlgorithm:", v19);
            CertificateForIdentifier = (__SecCertificate *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[__SecCertificate addObject:](CertificateForIdentifier, "addObject:", v20);
            -[MSCMSRecipientInfo setEncryptedKeys:](v22, "setEncryptedKeys:", CertificateForIdentifier);
          }
          else
          {
            v23 = 0;
            CertificateForIdentifier = 0;
          }
          goto LABEL_25;
        }
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v17, CFSTR("unable to find a certificate matching the recipient"));
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v23 = 0;
        v19 = 0;
        v20 = 0;
        goto LABEL_24;
      }
    }
    else if (v15 == 2 && objc_msgSend(v14, "intValue") == 2)
    {
      goto LABEL_10;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v13, CFSTR("decode failed for recipientInfo due to RFC 5652 violation (version)"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v19 = 0;
    v20 = 0;
    CertificateForIdentifier = 0;
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  v14 = 0;
  v23 = 0;
  v19 = 0;
  v20 = 0;
  CertificateForIdentifier = 0;
  v22 = 0;
  v11 = v13;
LABEL_25:
  if (a6 && v11)
    *a6 = objc_retainAutorelease(v11);
  v24 = v22;

  v10 = v26;
  v9 = v27;
LABEL_29:

  return v24;
}

void __79__MSCMSRecipientInfo_decodeKeyTransRecipientInfo_certificates_LAContext_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

+ (id)decodeKeyAgreeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  heim_base_data v14;
  void *v15;
  id *v16;
  uint64_t CertificateBySubjectKeyID;
  MSCMSRecipientInfo *v18;
  const void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  MSCMSRecipientInfo *v28;
  MSCMSRecipientInfo *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  char *v35;
  void *CertificateForIdentifier;
  uint64_t v37;
  MSCMSRecipientInfo *v38;
  uint64_t v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  MSCMSRecipientInfo *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  CFTypeRef cf;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  heim_base_data v60;
  __int128 v61;
  __int128 v62;
  heim_oid var0;
  __int128 v64;
  RecipientEncryptedKey *var1;

  v53 = a4;
  v9 = a5;
  if (a6 && *a6)
    v10 = (id)objc_msgSend(*a6, "copy");
  else
    v10 = 0;
  if (a3->var0 == 2)
  {
    v11 = *(_OWORD *)&a3->var1.var0.var0;
    v12 = *(_OWORD *)&a3->var1.var1.var1.var1.var2.var1.var1;
    v13 = *(_OWORD *)&a3->var1.var1.var3.var1;
    var0 = a3->var1.var1.var3.var0;
    v64 = v13;
    var1 = a3->var1.var1.var4.var1;
    v14 = a3->var1.var1.var1.var1.var0.var0;
    v59 = v11;
    v60 = v14;
    v61 = *(_OWORD *)&a3->var1.var1.var1.var1.var2.var0.var1;
    v62 = v12;
    if ((_DWORD)v11 != 3)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v10, CFSTR("decode failed for recipientInfo due to RFC 5652 violation (version)"));
      v41 = objc_claimAutoreleasedReturnValue();

      v38 = 0;
      v33 = 0;
      v30 = 0;
      v29 = 0;
      v52 = 0;
      v21 = 0;
      v15 = 0;
      v10 = (id)v41;
      v26 = 0;
      if (!a6)
        goto LABEL_39;
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    switch(DWORD2(v59))
    {
      case 3:
        NSDataFromBitString((_QWORD *)&v61 + 1);
        v22 = objc_claimAutoreleasedReturnValue();
        v56 = v10;
        +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", &v60, &v56);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v56;

        if (v22 && v23)
        {
          objc_msgSend(v23, "OIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("1.2.840.10045.2.1"));

          if ((v25 & 1) != 0)
          {
            v19 = 0;
            v21 = (void *)v22;
LABEL_18:
            NSDataFromOctetString(*((_QWORD **)&v62 + 1));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v20;
            +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", &var0, &v55);
            v27 = objc_claimAutoreleasedReturnValue();
            v10 = v55;

            cf = v19;
            v52 = (void *)v27;
            if (v27)
            {
              v28 = [MSCMSRecipientInfo alloc];
              v29 = v28;
              if (v28)
              {
                v48 = v15;
                v49 = a6;
                -[MSCMSRecipientInfo setVersion:](v28, "setVersion:", v15);
                -[MSCMSRecipientInfo setOriginator:](v29, "setOriginator:", v19);
                v47 = v21;
                -[MSCMSRecipientInfo setOriginatorPubKey:](v29, "setOriginatorPubKey:", v21);
                v50 = v26;
                -[MSCMSRecipientInfo setUserKeyingMaterial:](v29, "setUserKeyingMaterial:", v26);
                v46 = v29;
                -[MSCMSRecipientInfo setKeyEncryptionAlgorithm:](v29, "setKeyEncryptionAlgorithm:", v27);
                v29 = (MSCMSRecipientInfo *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (DWORD2(v64))
                {
                  v31 = 0;
                  v32 = 0;
                  v33 = 0;
                  v34 = v10;
                  do
                  {
                    v35 = (char *)var1 + v31;
                    v54 = v34;
                    CertificateForIdentifier = (void *)findCertificateForIdentifier((uint64_t)var1 + v31, v53, v9, &v54);
                    v10 = v54;

                    if (CertificateForIdentifier)
                    {
                      -[MSCMSRecipientInfo addObject:](v29, "addObject:", CertificateForIdentifier);

                      NSDataFromOctetString((_QWORD *)v35 + 2);
                      v37 = objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v30, "addObject:", v37);
                      v33 = (void *)v37;
                    }
                    ++v32;
                    v31 += 32;
                    v34 = v10;
                  }
                  while (v32 < DWORD2(v64));
                }
                else
                {
                  v33 = 0;
                }
                if (-[MSCMSRecipientInfo count](v29, "count"))
                {
                  v38 = v46;
                  -[MSCMSRecipientInfo setRecipientCertificates:](v46, "setRecipientCertificates:", v29);
                  v39 = -[MSCMSRecipientInfo count](v29, "count");
                  v15 = v48;
                  a6 = v49;
                  v21 = v47;
                  if (v39 == objc_msgSend(v30, "count"))
                  {
                    -[MSCMSRecipientInfo setEncryptedKeys:](v46, "setEncryptedKeys:", v30);
                  }
                  else
                  {
                    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v10, CFSTR("decode failed for recipientInfo (rid vs encryptedKey count)"));
                    v45 = objc_claimAutoreleasedReturnValue();

                    v10 = (id)v45;
                  }
                }
                else
                {
                  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v10, CFSTR("decode failed for recipientInfo (rid)"));
                  v44 = objc_claimAutoreleasedReturnValue();

                  v10 = (id)v44;
                  v15 = v48;
                  a6 = v49;
                  v38 = v46;
                  v21 = v47;
                }
                v26 = v50;
LABEL_31:
                if (cf)
                {
                  CFRelease(cf);
                  if (!a6)
                    goto LABEL_39;
                  goto LABEL_37;
                }
LABEL_36:
                if (!a6)
                {
LABEL_39:
                  v18 = v38;

                  goto LABEL_40;
                }
LABEL_37:
                if (v10)
                  *a6 = objc_retainAutorelease(v10);
                goto LABEL_39;
              }
              v30 = 0;
              v33 = 0;
            }
            else
            {
              +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v10, CFSTR("decode failed for recipientInfo (keyEncryptionAlgorithm)"));
              v42 = v26;
              v43 = objc_claimAutoreleasedReturnValue();

              v29 = 0;
              v30 = 0;
              v33 = 0;
              v10 = (id)v43;
              v26 = v42;
            }
            v38 = 0;
            goto LABEL_31;
          }
        }
        else
        {

        }
        v21 = (void *)v22;
        break;
      case 2:
        v57 = v10;
        v16 = &v57;
        CertificateBySubjectKeyID = findCertificateBySubjectKeyID(&v60, v53, v9, &v57);
        goto LABEL_13;
      case 1:
        v58 = v10;
        v16 = &v58;
        CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber(&v60, v53, v9, &v58);
LABEL_13:
        v19 = (const void *)CertificateBySubjectKeyID;
        v20 = *v16;

        v21 = 0;
        goto LABEL_18;
      default:
        v21 = 0;
        v20 = v10;
        break;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v20, CFSTR("decode failed for recipientInfo (originator)"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    v33 = 0;
    v30 = 0;
    v29 = 0;
    v52 = 0;
    v26 = 0;
    goto LABEL_36;
  }
  v18 = 0;
LABEL_40:

  return v18;
}

+ (id)decodeRecipientInfo:(RecipientInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v9 = a4;
  v10 = a5;
  if (a3->var0 == 2)
  {
    +[MSCMSRecipientInfo decodeKeyAgreeRecipientInfo:certificates:LAContext:error:](MSCMSRecipientInfo, "decodeKeyAgreeRecipientInfo:certificates:LAContext:error:", a3, v9, v10, a6);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3->var0 != 1)
    {
      v12 = 0;
      goto LABEL_7;
    }
    +[MSCMSRecipientInfo decodeKeyTransRecipientInfo:certificates:LAContext:error:](MSCMSRecipientInfo, "decodeKeyTransRecipientInfo:certificates:LAContext:error:", a3, v9, v10, a6);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_7:

  return v12;
}

- (__SecCertificate)recipientCertificate
{
  __SecCertificate *result;

  result = -[NSArray count](self->_recipientCertificates, "count");
  if (result)
    return (__SecCertificate *)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0);
  return result;
}

- (__CFData)createSecCMSSharedInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  __CFData *v8;
  _QWORD v10[2];
  _BYTE v11[4];
  _QWORD *v12;
  uint64_t v13;
  _BYTE *v14;

  uint32ToNetworkByteOrder(8 * objc_msgSend(a3, "keySize:", 0), (uint64_t)v11, 4);
  v13 = 4;
  v14 = v11;
  v10[0] = -[NSData length](self->_userKeyingMaterial, "length");
  v10[1] = -[NSData bytes](self->_userKeyingMaterial, "bytes");
  v12 = v10;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", length_SecCMS_ECC_CMS_SharedInfo());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (v6 = objc_retainAutorelease(v4), objc_msgSend(v6, "bytes"), encode_SecCMS_ECC_CMS_SharedInfo()))
  {
    v8 = 0;
  }
  else
  {
    v7 = objc_retainAutorelease(v6);
    v8 = CFDataCreate(0, (const UInt8 *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }

  return v8;
}

- (__CFData)createSharedInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __CFData *v12;
  _BYTE v14[4];
  NSUInteger v15;
  const void *v16;
  __int128 v17;
  uint64_t v18;
  NSUInteger *v19;
  uint64_t v20;
  _BYTE *v21;

  v19 = 0;
  v15 = 0;
  v16 = 0;
  v4 = a3;
  v5 = objc_msgSend(v4, "asn1AlgId");
  v6 = *(_QWORD *)(v5 + 16);
  v17 = *(_OWORD *)v5;
  v18 = v6;
  v7 = objc_msgSend(v4, "keySize:", 0);

  uint32ToNetworkByteOrder((8 * v7), (uint64_t)v14, 4);
  v20 = 4;
  v21 = v14;
  if (-[NSData length](self->_userKeyingMaterial, "length"))
  {
    v15 = -[NSData length](self->_userKeyingMaterial, "length");
    v16 = -[NSData bytes](self->_userKeyingMaterial, "bytes");
    v19 = &v15;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", length_ECC_CMS_SharedInfo());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (v10 = objc_retainAutorelease(v8), objc_msgSend(v10, "bytes", 0), encode_ECC_CMS_SharedInfo()))
  {
    v12 = 0;
  }
  else
  {
    v11 = objc_retainAutorelease(v10);
    v12 = CFDataCreate(0, (const UInt8 *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
  }

  return v12;
}

- (__CFData)keyEncryptionKey:(id)a3 forEncryption:(BOOL)a4 secCMSCompatibility:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  __SecCertificate *originator;
  __SecIdentity *IdentityByCertificate;
  NSArray *recipientCertificates;
  NSData *originatorPubKey;
  uint64_t v13;
  CFIndex v14;
  CFNumberRef v15;
  CFNumberRef v16;
  void *v17;
  void *v18;
  CFDictionaryRef v19;
  const __CFDictionary *v20;
  const __CFData *v21;
  __SecKey *v22;
  NSArray *v23;
  __CFData *v24;
  __CFData *v25;
  __CFData *v26;
  CFNumberRef v27;
  CFNumberRef v28;
  void *v29;
  const __CFDictionary *v30;
  SecKeyRef v31;
  uint64_t v33;
  uint64_t valuePtr;
  SecKeyRef privateKeyRef;
  void *v36[2];
  void *v37[2];
  void *values[3];
  void *keys[4];

  v5 = a5;
  v6 = a4;
  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  privateKeyRef = 0;
  if (!v6)
  {
    recipientCertificates = self->_recipientCertificates;
    if (!recipientCertificates || !-[NSArray count](recipientCertificates, "count"))
      goto LABEL_58;
    IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate((__SecCertificate *)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0), 0, 0);
    originatorPubKey = self->_originatorPubKey;
    if (!originatorPubKey)
    {
LABEL_55:
      v16 = 0;
      goto LABEL_56;
    }
    v13 = -[NSData length](originatorPubKey, "length");
    v14 = v13;
    valuePtr = 8 * v13;
    if (v13 > 382)
    {
      if ((unint64_t)(v13 - 520) >= 2 && (unint64_t)(v13 - 383) > 1)
        goto LABEL_16;
    }
    else if (((unint64_t)(v13 - 223) > 0x21 || ((1 << (v13 + 33)) & 0x300000003) == 0)
           && (unint64_t)(v13 - 191) >= 2)
    {
LABEL_16:
      v15 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
      v16 = v15;
      if (v15)
      {
        v17 = (void *)*MEMORY[0x1E0CD69F8];
        keys[0] = *(void **)MEMORY[0x1E0CD6A38];
        keys[1] = v17;
        keys[2] = *(void **)MEMORY[0x1E0CD6A20];
        v18 = (void *)*MEMORY[0x1E0CD6A10];
        values[0] = *(void **)MEMORY[0x1E0CD6A50];
        values[1] = v18;
        values[2] = v15;
        v19 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v19)
        {
          v20 = v19;
          v21 = CFDataCreate(0, (const UInt8 *)-[NSData bytes](self->_originatorPubKey, "bytes"), v14);
          v22 = SecKeyCreateWithData(v21, v20, 0);
          goto LABEL_24;
        }
      }
LABEL_56:
      v24 = 0;
      v22 = 0;
      v20 = 0;
      v21 = 0;
      v26 = 0;
      v28 = 0;
      v30 = 0;
      if (!IdentityByCertificate)
        goto LABEL_40;
      goto LABEL_36;
    }
    valuePtr = v13;
    v14 = (unint64_t)(v13 + 7) >> 3;
    goto LABEL_16;
  }
  originator = self->_originator;
  IdentityByCertificate = self->_originatorIdentity;
  if (!originator)
  {
    if (IdentityByCertificate)
      goto LABEL_20;
LABEL_58:
    v24 = 0;
    goto LABEL_52;
  }
  if (IdentityByCertificate)
  {
LABEL_20:
    CFRetain(self->_originatorIdentity);
    goto LABEL_21;
  }
  IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate(originator, 0, 0);
LABEL_21:
  v23 = self->_recipientCertificates;
  if (!v23 || !-[NSArray count](v23, "count"))
    goto LABEL_55;
  v22 = SecCertificateCopyKey((SecCertificateRef)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0));
  v21 = 0;
  v20 = 0;
  v16 = 0;
LABEL_24:
  if (!IdentityByCertificate)
  {
    v30 = 0;
    v28 = 0;
    v26 = 0;
    v24 = 0;
    if (!v22)
      goto LABEL_40;
    goto LABEL_39;
  }
  v24 = 0;
  if (SecIdentityCopyPrivateKey(IdentityByCertificate, &privateKeyRef) || !privateKeyRef || !v22)
  {
    v26 = 0;
    v28 = 0;
    v30 = 0;
    goto LABEL_36;
  }
  if (v5)
    v25 = -[MSCMSRecipientInfo createSecCMSSharedInfo:](self, "createSecCMSSharedInfo:", v8);
  else
    v25 = -[MSCMSRecipientInfo createSharedInfo:](self, "createSharedInfo:", v8);
  v26 = v25;
  if (!v25 || (v33 = objc_msgSend(v8, "keySize:", 0), (unint64_t)(v33 - 0x7FFFFFFF) < 0xFFFFFFFF80000002))
  {
    v24 = 0;
    v28 = 0;
LABEL_62:
    v30 = 0;
    goto LABEL_36;
  }
  v27 = CFNumberCreate(0, kCFNumberSInt32Type, &v33);
  v28 = v27;
  if (!v27)
  {
    v24 = 0;
    goto LABEL_62;
  }
  v29 = (void *)*MEMORY[0x1E0CD6F00];
  v37[0] = *(void **)MEMORY[0x1E0CD6EF8];
  v37[1] = v29;
  v36[0] = v27;
  v36[1] = v26;
  v30 = CFDictionaryCreate(0, (const void **)v37, (const void **)v36, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v30)
    v24 = SecKeyCopyKeyExchangeResult(privateKeyRef, (SecKeyAlgorithm)*MEMORY[0x1E0CD6D80], v22, v30, 0);
  else
    v24 = 0;
LABEL_36:
  CFRelease(IdentityByCertificate);
  v31 = privateKeyRef;
  if (privateKeyRef)
  {
    privateKeyRef = 0;
    CFRelease(v31);
  }
  if (!v22)
    goto LABEL_40;
LABEL_39:
  CFRelease(v22);
LABEL_40:
  if (v16)
    CFRelease(v16);
  if (v20)
    CFRelease(v20);
  if (v21)
    CFRelease(v21);
  if (v26)
    CFRelease(v26);
  if (v28)
    CFRelease(v28);
  if (v30)
    CFRelease(v30);
LABEL_52:

  return v24;
}

- (id)decryptWrappedKey:(id)a3 kek:(id)a4 iv:(heim_base_data *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CCWrappingAlgorithm v14;
  const uint8_t *v15;
  size_t v16;
  id v17;
  id v18;
  const uint8_t *v19;
  size_t v20;
  void *v21;
  id v22;
  const uint8_t *v23;
  size_t v24;
  id v25;
  void *v26;
  void *v28;
  char v29;
  CCAlgorithm v30;
  id v31;
  id v32;
  size_t OutputLength;
  void *v34;
  _CCCryptor *v35;
  id v36;
  const void *v37;
  size_t v38;
  _CCCryptor *v39;
  uint64_t v40;
  id v41;
  size_t v42;
  id v43;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;

  v8 = a3;
  v9 = a4;
  -[NSArray objectAtIndex:](self->_encryptedKeys, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  cryptorRef = 0;
  objc_msgSend(v8, "algorithm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.5")) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v8, "algorithm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.25")))
  {

LABEL_4:
LABEL_5:
    dataOutMoved = CCSymmetricUnwrappedSize(objc_msgSend(v8, "ccAlgorithm:", 0), objc_msgSend(v10, "length"));
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", dataOutMoved);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v8;
    v14 = objc_msgSend(v8, "ccAlgorithm:", 0);
    v15 = (const uint8_t *)*MEMORY[0x1E0C803C8];
    v16 = *MEMORY[0x1E0C803D0];
    v17 = v9;
    v18 = objc_retainAutorelease(v9);
    v19 = (const uint8_t *)objc_msgSend(v18, "bytes");
    v20 = objc_msgSend(v18, "length");
    v21 = v10;
    v22 = objc_retainAutorelease(v10);
    v23 = (const uint8_t *)objc_msgSend(v22, "bytes");
    v24 = objc_msgSend(v22, "length");
    v25 = objc_retainAutorelease(v13);
    if (!CCSymmetricKeyUnwrap(v14, v15, v16, v19, v20, v23, v24, (uint8_t *)objc_msgSend(v25, "mutableBytes"), &dataOutMoved))
    {
      objc_msgSend(v25, "setLength:", dataOutMoved);
      v9 = v17;
      v10 = v21;
      v8 = v41;
LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v26 = 0;
    v9 = v17;
    v10 = v21;
    v8 = v41;
    goto LABEL_8;
  }
  objc_msgSend(v8, "algorithm");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("2.16.840.1.101.3.4.1.45"));

  if ((v29 & 1) != 0)
    goto LABEL_5;
  v43 = 0;
  v30 = objc_msgSend(v8, "ccAlgorithm:", &v43);
  v31 = v43;
  if (v31
    || (v32 = objc_retainAutorelease(v9),
        CCCryptorCreate(1u, v30, 1u, (const void *)objc_msgSend(v32, "bytes"), objc_msgSend(v32, "length"), a5->var1, &cryptorRef)))
  {

    v25 = 0;
  }
  else
  {
    OutputLength = CCCryptorGetOutputLength(cryptorRef, objc_msgSend(v10, "length"), 1);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", OutputLength);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    dataOutMoved = 0;
    v35 = cryptorRef;
    v36 = objc_retainAutorelease(v10);
    v37 = (const void *)objc_msgSend(v36, "bytes");
    v38 = objc_msgSend(v36, "length");
    v25 = objc_retainAutorelease(v34);
    if (!CCCryptorUpdate(v35, v37, v38, (void *)objc_msgSend(v25, "mutableBytes"), OutputLength, &dataOutMoved))
    {
      v42 = 0;
      v39 = cryptorRef;
      v25 = objc_retainAutorelease(v25);
      v40 = objc_msgSend(v25, "mutableBytes");
      if (!CCCryptorFinal(v39, (void *)(v40 + dataOutMoved), OutputLength - dataOutMoved, &v42))
      {
        objc_msgSend(v25, "setLength:", v42 + dataOutMoved);
        goto LABEL_7;
      }
    }
  }
  v26 = 0;
LABEL_8:
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);

  return v26;
}

- (id)key
{
  return -[MSCMSRecipientInfo key:](self, "key:", 0);
}

- (id)key:(BOOL)a3
{
  NSArray *recipientCertificates;
  _BOOL8 v5;
  __SecIdentity *IdentityByCertificate;
  __SecIdentity *v7;
  BOOL v8;
  void *v9;
  int v10;
  void *DecryptedData;
  __CFData *v12;
  void *v13;
  int v14;
  MSAlgorithmIdentifier *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  SecKeyRef v23;
  uint64_t v25;
  _QWORD v26[2];
  SecKeyRef privateKeyRef;

  v26[1] = 0;
  privateKeyRef = 0;
  v26[0] = 0;
  recipientCertificates = self->_recipientCertificates;
  if (!recipientCertificates
    || (v5 = a3, !-[NSArray count](recipientCertificates, "count"))
    || (IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate((__SecCertificate *)-[NSArray objectAtIndex:](self->_recipientCertificates, "objectAtIndex:", 0), 0, 0)) == 0)
  {
    der_free_octet_string();
    return 0;
  }
  v7 = IdentityByCertificate;
  if (SecIdentityCopyPrivateKey(IdentityByCertificate, &privateKeyRef))
    v8 = 1;
  else
    v8 = privateKeyRef == 0;
  if (v8)
    goto LABEL_23;
  -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1.2.840.113549.1.1.1"));

  if (!v10)
  {
    -[MSAlgorithmIdentifier algorithm](self->_keyEncryptionAlgorithm, "algorithm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("1.3.133.16.840.63.0.2"));

    if (v14)
    {
      v15 = [MSAlgorithmIdentifier alloc];
      -[MSAlgorithmIdentifier parameters](self->_keyEncryptionAlgorithm, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSAlgorithmIdentifier decode:error:](v15, "decode:error:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "parameters");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_19;
        objc_msgSend(v17, "parameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &key__asn1NULL, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if ((v21 & 1) != 0)
        {
          v18 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v17, "parameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v22;
        if (!v22
          || !objc_msgSend(v22, "length")
          || (v25 = 0,
              v18 = objc_retainAutorelease(v18),
              objc_msgSend(v18, "bytes"),
              objc_msgSend(v18, "length"),
              der_get_octet_string_ber(),
              objc_msgSend(v18, "length")))
        {
          v12 = 0;
          goto LABEL_32;
        }
        if (v26[0] == objc_msgSend(v17, "blockSize:", 0))
        {
LABEL_19:
          v12 = -[MSCMSRecipientInfo keyEncryptionKey:forEncryption:secCMSCompatibility:](self, "keyEncryptionKey:forEncryption:secCMSCompatibility:", v17, 0, v5, v25);
          if (v12)
          {
            -[MSCMSRecipientInfo decryptWrappedKey:kek:iv:](self, "decryptWrappedKey:kek:iv:", v17, v12, v26);
            DecryptedData = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

            goto LABEL_24;
          }
LABEL_32:
          DecryptedData = 0;
          goto LABEL_21;
        }

      }
    }
LABEL_23:
    v12 = 0;
    DecryptedData = 0;
    goto LABEL_24;
  }
  DecryptedData = SecKeyCreateDecryptedData(privateKeyRef, (SecKeyAlgorithm)*MEMORY[0x1E0CD6E48], (CFDataRef)-[NSArray objectAtIndex:](self->_encryptedKeys, "objectAtIndex:", 0), 0);
  v12 = 0;
LABEL_24:
  CFRelease(v7);
  v23 = privateKeyRef;
  if (privateKeyRef)
  {
    privateKeyRef = 0;
    CFRelease(v23);
  }
  der_free_octet_string();
  if (v12)
    CFRelease(v12);
  return DecryptedData;
}

- (void)dealloc
{
  __SecCertificate *originator;
  __SecIdentity *originatorIdentity;
  objc_super v5;

  originator = self->_originator;
  if (originator)
  {
    self->_originator = 0;
    CFRelease(originator);
  }
  originatorIdentity = self->_originatorIdentity;
  if (originatorIdentity)
  {
    self->_originatorIdentity = 0;
    CFRelease(originatorIdentity);
  }
  v5.receiver = self;
  v5.super_class = (Class)MSCMSRecipientInfo;
  -[MSCMSRecipientInfo dealloc](&v5, sel_dealloc);
}

- (NSArray)algorithmCapabilities
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAlgorithmCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MSAlgorithmIdentifier)keyEncryptionAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyEncryptionAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setRecipientCertificate:(__SecCertificate *)a3
{
  self->_recipientCertificate = a3;
}

- (NSArray)recipientCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecipientCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (__SecCertificate)originator
{
  return self->_originator;
}

- (__SecIdentity)originatorIdentity
{
  return self->_originatorIdentity;
}

- (NSData)originatorPubKey
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOriginatorPubKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)encryptedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncryptedKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)userKeyingMaterial
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUserKeyingMaterial:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyingMaterial, 0);
  objc_storeStrong((id *)&self->_encryptedKeys, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_originatorPubKey, 0);
  objc_storeStrong((id *)&self->_recipientCertificates, 0);
  objc_storeStrong((id *)&self->_keyEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_algorithmCapabilities, 0);
}

@end
