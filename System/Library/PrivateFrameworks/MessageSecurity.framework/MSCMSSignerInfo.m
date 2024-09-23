@implementation MSCMSSignerInfo

- (void)dealloc
{
  __SecCertificate *signerCertificate;
  __SecKey *signerPrivKey;
  objc_super v5;

  signerCertificate = self->_signerCertificate;
  if (signerCertificate)
  {
    self->_signerCertificate = 0;
    CFRelease(signerCertificate);
  }
  signerPrivKey = self->_signerPrivKey;
  if (signerPrivKey)
  {
    self->_signerPrivKey = 0;
    CFRelease(signerPrivKey);
  }
  if (self->_encodedSignerInfo)
  {
    free_SignerInfo();
    free(self->_encodedSignerInfo);
    self->_encodedSignerInfo = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MSCMSSignerInfo;
  -[MSCMSSignerInfo dealloc](&v5, sel_dealloc);
}

- (MSCMSMutableAttributeArray)protectedAttributes
{
  return (MSCMSMutableAttributeArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestAlgorithm, 0);
  objc_destroyWeak((id *)&self->_containingSignedData);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifierData, 0);
  objc_storeStrong((id *)&self->_unsignedAttrsData, 0);
  objc_storeStrong((id *)&self->_signedAttrsData, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_unprotectedAttributes, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_protectedAttributes, 0);
  objc_storeStrong((id *)&self->_signatureAlgorithm, 0);
}

- (BOOL)verifyCountersignatures:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  _QWORD v13[7];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.6"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAttributesWithType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__4;
    v18 = __Block_byref_object_dispose__4;
    if (a3)
    {
      v8 = *a3;
      if (*a3)
        v8 = (id)objc_msgSend(v8, "copy");
    }
    else
    {
      v8 = 0;
    }
    v19 = v8;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke_56;
    v13[3] = &unk_1EA962408;
    v13[4] = self;
    v13[5] = buf;
    v13[6] = &v20;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
    if (a3)
    {
      v11 = (void *)*((_QWORD *)v15 + 5);
      if (v11)
        *a3 = objc_retainAutorelease(v11);
    }
    v10 = *((_BYTE *)v21 + 24) == 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_55);
    v9 = MS_DEFAULT_LOG_INTERNAL;
    v10 = 1;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DEED9000, v9, OS_LOG_TYPE_INFO, "no countersignatures, returning successful verification", buf, 2u);
    }
  }

  return v10;
}

- (MSCMSMutableAttributeArray)unprotectedAttributes
{
  return (MSCMSMutableAttributeArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)verifyTimestamps:(id *)a3
{
  return -[MSCMSSignerInfo verifyTimestamps:error:](self, "verifyTimestamps:error:", 0, a3);
}

+ (id)decodeSignerInfo:(SignerInfo *)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *CertificateForIdentifier;
  id v18;
  id v19;
  id v20;
  heim_base_data *var3;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  heim_base_data *var6;
  void *v33;
  id v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v10 = a4;
  v11 = a5;
  if (a6 && *a6)
    v12 = (id)objc_msgSend(*a6, "copy");
  else
    v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3->var0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSCMSIdentifier decodeIdentifier:error:](MSCMSIdentifier, "decodeIdentifier:error:", &a3->var1, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v41 = v13;
  v42 = v11;
  if (v14)
  {
    v16 = objc_msgSend(v14, "type");
    if (v16 == 1)
    {
      if (objc_msgSend(v13, "intValue") == 1)
      {
LABEL_9:
        v47 = v12;
        CertificateForIdentifier = (void *)findCertificateForIdentifier((uint64_t)&a3->var1, v10, v11, &v47);
        v18 = v47;

        if (CertificateForIdentifier)
        {
          v39 = v10;
          v19 = objc_alloc((Class)a1);
          objc_msgSend(v19, "setSignerCertificate:", CertificateForIdentifier);
          v46 = v18;
          +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", &a3->var2, &v46);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v46;

          var3 = a3->var3;
          v22 = &off_1EA960000;
          if (var3)
          {
            v45 = v20;
            +[MSCMSMutableAttributeArray createAttributeArrayFromAttributeSetRaw:error:](MSCMSMutableAttributeArray, "createAttributeArrayFromAttributeSetRaw:error:", var3, &v45);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v45;

            if (v23)
            {
              +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.15"), 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "getAttributesWithType:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if ((unint64_t)objc_msgSend(v25, "count") >= 2)
              {

              }
              else
              {
                +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.2.11"), 0);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "getAttributesWithType:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)objc_msgSend(v27, "count") <= 1)
                {

                  v20 = v12;
                  v22 = &off_1EA960000;
                  goto LABEL_19;
                }

              }
            }
            else
            {

            }
            v30 = 0;
            CertificateForIdentifier = 0;
            v31 = 0;
            v19 = 0;
            goto LABEL_27;
          }
          v23 = 0;
LABEL_19:
          v44 = v20;
          +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", &a3->var4, &v44);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v44;

          NSDataFromOctetString(&a3->var5.var0);
          CertificateForIdentifier = (void *)objc_claimAutoreleasedReturnValue();
          var6 = a3->var6;
          if (var6)
          {
            v33 = v22[33];
            v43 = v12;
            objc_msgSend(v33, "createAttributeArrayFromAttributeSetRaw:error:", var6, &v43);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v43;

            if (!v31)
            {

              v19 = 0;
              v12 = v34;
              goto LABEL_27;
            }
            v12 = v34;
          }
          else
          {
            v31 = 0;
          }
          objc_msgSend(v19, "setVersion:", v41);
          objc_msgSend(v19, "setDigestAlgorithm:", v40);
          objc_msgSend(v19, "setProtectedAttributes:", v23);
          objc_msgSend(v19, "setSignatureAlgorithm:", v30);
          objc_msgSend(v19, "setUnprotectedAttributes:", v31);
          objc_msgSend(v19, "setSignature:", CertificateForIdentifier);
          objc_msgSend(v19, "setLAContext:", v42);
          v35 = malloc_type_malloc(0x68uLL, 0x10B00404EF9CE24uLL);
          if (v35)
          {
            v36 = v35;
            v35[12] = 0;
            *((_OWORD *)v35 + 4) = 0u;
            *((_OWORD *)v35 + 5) = 0u;
            *((_OWORD *)v35 + 2) = 0u;
            *((_OWORD *)v35 + 3) = 0u;
            *(_OWORD *)v35 = 0u;
            *((_OWORD *)v35 + 1) = 0u;
            copy_SignerInfo();
            if (objc_msgSend(v19, "encodedSignerInfo"))
            {
              objc_msgSend(v19, "encodedSignerInfo");
              free_SignerInfo();
              free((void *)objc_msgSend(v19, "encodedSignerInfo"));
              objc_msgSend(v19, "setEncodedSignerInfo:", 0);
            }
            objc_msgSend(v19, "setEncodedSignerInfo:", v36);
          }
LABEL_27:
          v10 = v39;
          if (!a6)
            goto LABEL_30;
          goto LABEL_28;
        }
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorKeychainDomain[0], -25300, v18, CFSTR("unable to find a certificate matching the signer"));
        v12 = (id)objc_claimAutoreleasedReturnValue();

        v40 = 0;
        v23 = 0;
        v30 = 0;
        goto LABEL_33;
      }
    }
    else if (v16 == 2 && objc_msgSend(v13, "intValue") == 3)
    {
      goto LABEL_9;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v12, CFSTR("decode failed for signerInfo due to RFC 5652 violation (version)"));
    v28 = v10;
    v29 = objc_claimAutoreleasedReturnValue();

    v40 = 0;
    v23 = 0;
    v30 = 0;
    CertificateForIdentifier = 0;
    v31 = 0;
    v19 = 0;
    v12 = (id)v29;
    v10 = v28;
    if (!a6)
      goto LABEL_30;
    goto LABEL_28;
  }
  v40 = 0;
  v23 = 0;
  v30 = 0;
  CertificateForIdentifier = 0;
LABEL_33:
  v31 = 0;
  v19 = 0;
  if (!a6)
    goto LABEL_30;
LABEL_28:
  if (v12)
    *a6 = objc_retainAutorelease(v12);
LABEL_30:
  v37 = v19;

  return v37;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setUnprotectedAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setSignerCertificate:(__SecCertificate *)a3
{
  self->_signerCertificate = a3;
}

- (void)setSignatureAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
  self->_signatureCalculated = 0;
}

- (void)setProtectedAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setLAContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setEncodedSignerInfo:(SignerInfo *)a3
{
  self->_encodedSignerInfo = a3;
}

- (void)setDigestAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (SignerInfo)encodedSignerInfo
{
  return self->_encodedSignerInfo;
}

uint64_t __61__MSCMSSignerInfo_getAttributesWithType_protectedAttributes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "encodeAttributeWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (__SecTrust)createTrustObjectWithPolicies:(id)a3 error:(id *)a4
{
  return -[MSCMSSignerInfo createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:](self, "createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:", a3, 0, 0, a4);
}

- (BOOL)verifySignature:(id *)a3
{
  void *v5;
  const __CFData *v6;
  id v7;
  __SecKey *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  MSAlgorithmIdentifier *signatureAlgorithm;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MSAlgorithmIdentifier *v18;
  MSAlgorithmIdentifier *digestAlgorithm;
  void *v20;
  id v21;
  NSObject *v22;
  CFTypeRef v23;
  BOOL v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *log;
  void *v35;
  id v36;
  id v37;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  v37 = v5;
  cf = 0;
  -[MSCMSSignerInfo calculateSignerInfoDigest:](self, "calculateSignerInfoDigest:", &v37);
  v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v7 = v37;

  if (!v6)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCryptoDomain[0], -26276, v7, CFSTR("unable to compute digest for signature"));
    v25 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_27;
  }
  v8 = SecCertificateCopyKey(-[MSCMSSignerInfo signerCertificate](self, "signerCertificate"));
  if (!v8)
  {
    v29 = MSErrorCryptoDomain[0];
    v30 = CFSTR("failed to get public key from certificate");
    v31 = -26275;
LABEL_37:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v29, v31, v7, v30);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  -[MSCMSSignerInfo signature](self, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v29 = MSErrorCMSDomain[0];
    v30 = CFSTR("signer is missing signature");
    v31 = -50;
    goto LABEL_37;
  }
  -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const __CFString *)objc_msgSend(v10, "secKeyAlgorithm");

  if (!v11)
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_43);
    v12 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      signatureAlgorithm = self->_signatureAlgorithm;
      log = v12;
      -[MSAlgorithmIdentifier algorithm](signatureAlgorithm, "algorithm");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "OIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "OIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "algorithm");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "OIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v32;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v17;
      _os_log_impl(&dword_1DEED9000, log, OS_LOG_TYPE_INFO, "Bad signature algorithm %@. Trying to compose signature algorithm from %@ and digest %@", buf, 0x20u);

    }
    v18 = self->_signatureAlgorithm;
    digestAlgorithm = self->_digestAlgorithm;
    v36 = v7;
    -[MSAlgorithmIdentifier signatureAlgorithmWithDigestAlgorithm:error:](v18, "signatureAlgorithmWithDigestAlgorithm:error:", digestAlgorithm, &v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v36;

    v11 = (const __CFString *)objc_msgSend(v20, "secKeyAlgorithm");
    if (v11)
    {
      v7 = v21;
      goto LABEL_15;
    }
    v26 = MSErrorCryptoDomain[0];
    -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "OIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v26, -4, v21, CFSTR("%@ is not a supported signature algorithm"), v27);
    v25 = objc_claimAutoreleasedReturnValue();

LABEL_27:
    v24 = 0;
    goto LABEL_28;
  }
LABEL_15:
  if (self->_LAContext && !SecKeySetParameter())
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_47_0);
    v22 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = cf;
      _os_log_impl(&dword_1DEED9000, v22, OS_LOG_TYPE_ERROR, "failed to set credential reference on signer public key: %@", buf, 0xCu);
    }
    v23 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v23);
    }
  }
  v24 = SecKeyVerifySignature(v8, v11, v6, (CFDataRef)-[MSCMSSignerInfo signature](self, "signature"), (CFErrorRef *)&cf) != 0;
  v25 = (uint64_t)cf;
  if (!cf)
  {
    if (!a3)
      goto LABEL_31;
    goto LABEL_29;
  }
LABEL_28:

  v7 = (id)v25;
  if (!a3)
    goto LABEL_31;
LABEL_29:
  if (v7)
    *a3 = objc_retainAutorelease(v7);
LABEL_31:
  if (v8)
    CFRelease(v8);

  return v24;
}

- (NSData)signature
{
  return self->_signature;
}

- (__SecTrust)createTrustObjectWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10;
  const __CFDate *v11;
  const __CFArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OSStatus v17;
  OSStatus v18;
  OSStatus v19;
  __SecTrust *v20;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  SecTrustRef trust;

  v10 = a3;
  v11 = (const __CFDate *)a4;
  v12 = (const __CFArray *)a5;
  v13 = (void *)MEMORY[0x1E0C99DE8];
  -[MSCMSSignerInfo certificates](self, "certificates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  trust = 0;
  if (a6 && *a6)
    v16 = (void *)objc_msgSend(*a6, "copy");
  else
    v16 = 0;
  if (-[MSCMSSignerInfo signerCertificate](self, "signerCertificate"))
  {
    objc_msgSend(v15, "insertObject:atIndex:", self->_signerCertificate, 0);
    v17 = SecTrustCreateWithCertificates(v15, v10, &trust);
    if (v17)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", *MEMORY[0x1E0CB2F90], v17, v16, CFSTR("unable to create trust object due to security error"));
      v25 = objc_claimAutoreleasedReturnValue();

      trust = 0;
      goto LABEL_20;
    }
    if (v11 && (v18 = SecTrustSetVerifyDate(trust, v11)) != 0)
    {
      v22 = (__CFString *)*MEMORY[0x1E0CB2F90];
      v24 = v18;
      v23 = CFSTR("failed to set verification time");
    }
    else
    {
      if (!v12 || (v19 = SecTrustSetAnchorCertificates(trust, v12)) == 0)
      {
        if (!a6)
          goto LABEL_14;
        goto LABEL_12;
      }
      v22 = (__CFString *)*MEMORY[0x1E0CB2F90];
      v24 = v19;
      v23 = CFSTR("failed to set anchor certificates");
    }
  }
  else
  {
    v22 = MSErrorCMSDomain[0];
    v23 = CFSTR("no certificates found in signerInfo for trust evaluation");
    v24 = -50;
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v22, v24, v16, v23);
  v25 = objc_claimAutoreleasedReturnValue();

LABEL_20:
  v16 = (void *)v25;
  if (!a6)
    goto LABEL_14;
LABEL_12:
  if (v16)
    *a6 = objc_retainAutorelease(v16);
LABEL_14:
  v20 = trust;

  return v20;
}

- (__SecCertificate)signerCertificate
{
  return self->_signerCertificate;
}

- (NSArray)certificates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "certificates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (MSCMSSignedData)containingSignedData
{
  return (MSCMSSignedData *)objc_loadWeakRetained((id *)&self->_containingSignedData);
}

- (id)calculateSignerInfoDigest:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  MSAlgorithmIdentifier *signatureAlgorithm;
  MSAlgorithmIdentifier *v11;
  id v12;
  MSAlgorithmIdentifier *digestAlgorithm;
  id v14;
  void *v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);
  if (!WeakRetained
    || (v7 = WeakRetained,
        v8 = objc_loadWeakRetained((id *)&self->_containingSignedData),
        objc_msgSend(v8, "dataContent"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v7,
        !v9))
  {
    v22 = MSErrorCMSDomain[0];
    v23 = CFSTR("signer has no reference to a signedData with content");
LABEL_19:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v22, -50, v5, v23);
    v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  if (self->_digestAlgorithm)
    goto LABEL_11;
  signatureAlgorithm = self->_signatureAlgorithm;
  if (!signatureAlgorithm)
  {
    v22 = MSErrorCMSDomain[0];
    v23 = CFSTR("signer has no signature algorithm");
    goto LABEL_19;
  }
  v29 = v5;
  +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:](MSAlgorithmIdentifier, "digestAlgorithmWithSignatureAlgorithm:error:", signatureAlgorithm, &v29);
  v11 = (MSAlgorithmIdentifier *)objc_claimAutoreleasedReturnValue();
  v12 = v29;

  digestAlgorithm = self->_digestAlgorithm;
  self->_digestAlgorithm = v11;

  if (!self->_digestAlgorithm)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v12, CFSTR("No digest algorithm specified"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  v5 = v12;
LABEL_11:
  v14 = objc_loadWeakRetained((id *)&self->_containingSignedData);
  -[MSAlgorithmIdentifier algorithm](self->_digestAlgorithm, "algorithm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  objc_msgSend(v14, "calculateContentDigestWithAlgorithm:error:", v15, &v28);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v28;

  if (v16)
  {
    if (!-[MSCMSMutableAttributeArray count](self->_protectedAttributes, "count"))
    {
      v16 = v16;
      v21 = v16;
      if (!a3)
        goto LABEL_26;
      goto LABEL_24;
    }
    v27 = v17;
    v18 = -[MSCMSSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", &v27);
    v19 = v27;

    if (!v18)
    {
      v21 = 0;
LABEL_16:
      v17 = v19;
      if (!a3)
        goto LABEL_26;
      goto LABEL_24;
    }
    v26 = v19;
    v20 = -[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v16, &v26);
    v17 = v26;

    if (v20)
    {
      v25 = v17;
      -[MSCMSSignerInfo calculateSignedAttributesDigest:](self, "calculateSignedAttributesDigest:", &v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;

      goto LABEL_16;
    }
  }
LABEL_21:
  v21 = 0;
  if (!a3)
    goto LABEL_26;
LABEL_24:
  if (v17)
    *a3 = objc_retainAutorelease(v17);
LABEL_26:

  return v21;
}

- (BOOL)verifyContentTypeAttribute:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  MSCMSContentTypeAttribute *v11;
  void *v12;
  MSCMSContentTypeAttribute *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  id v26;
  id v27;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  v27 = v5;
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;

  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || objc_msgSend(v8, "count") != 1)
  {
    v22 = MSErrorCMSDomain[0];
    v23 = CFSTR("Missing or too many content-type attribute(s)");
    goto LABEL_16;
  }
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v11 = [MSCMSContentTypeAttribute alloc];
    objc_msgSend(v8, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v13 = -[MSCMSContentTypeAttribute initWithAttribute:error:](v11, "initWithAttribute:error:", v12, &v26);
    v14 = v26;

    v7 = v14;
    if (!v13)
    {
LABEL_15:
      v22 = MSErrorCMSDomain[0];
      v23 = CFSTR("Could not decode content-type attribute");
LABEL_16:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v22, -26275, v7, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
      goto LABEL_15;
    objc_msgSend(v8, "objectAtIndex:", 0);
    v13 = (MSCMSContentTypeAttribute *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_15;
  }
  -[MSCMSContentTypeAttribute contentType](v13, "contentType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, v7, CFSTR("Signed content-type attribute does not match content-type in signedData"));
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:

    v21 = 0;
    v7 = (id)v24;
    if (!a3)
      goto LABEL_20;
    goto LABEL_18;
  }
  v21 = 1;
  if (!a3)
    goto LABEL_20;
LABEL_18:
  if (v7)
    *a3 = objc_retainAutorelease(v7);
LABEL_20:

  return v21;
}

- (BOOL)verifyMessageDigestAttribute:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  MSCMSMessageDigestAttribute *v13;
  void *v14;
  MSCMSMessageDigestAttribute *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  BOOL v21;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  id v26;
  id v27;

  v6 = a3;
  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  v27 = v7;
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.4"), &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;

  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || objc_msgSend(v10, "count") != 1)
  {
    v22 = MSErrorCMSDomain[0];
    v23 = CFSTR("Missing or too many message-digest attribute(s)");
    goto LABEL_16;
  }
  objc_msgSend(v10, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v13 = [MSCMSMessageDigestAttribute alloc];
    objc_msgSend(v10, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    v15 = -[MSCMSMessageDigestAttribute initWithAttribute:error:](v13, "initWithAttribute:error:", v14, &v26);
    v16 = v26;

    v9 = v16;
    if (!v15)
    {
LABEL_15:
      v22 = MSErrorCMSDomain[0];
      v23 = CFSTR("Could not decode message-digest attribute");
LABEL_16:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v22, -26275, v9, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
      goto LABEL_15;
    objc_msgSend(v10, "objectAtIndex:", 0);
    v15 = (MSCMSMessageDigestAttribute *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_15;
  }
  -[MSCMSMessageDigestAttribute messageDigest](v15, "messageDigest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v6);

  if ((v20 & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, v9, CFSTR("Message-digest attribute failed to verify"));
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:

    v21 = 0;
    v9 = (id)v24;
    if (!a4)
      goto LABEL_20;
    goto LABEL_18;
  }
  v21 = 1;
  if (!a4)
    goto LABEL_20;
LABEL_18:
  if (v9)
    *a4 = objc_retainAutorelease(v9);
LABEL_20:

  return v21;
}

- (id)getAttributesWithType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MSCMSSignerInfo getAttributesWithType:protectedAttributes:](self, "getAttributesWithType:protectedAttributes:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[MSCMSSignerInfo getAttributesWithType:protectedAttributes:](self, "getAttributesWithType:protectedAttributes:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "addObjectsFromArray:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

- (id)getAttributesWithType:(id)a3 protectedAttributes:(BOOL)a4
{
  id v6;
  MSCMSMutableAttributeArray *v7;
  MSCMSMutableAttributeArray *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = self->_protectedAttributes;
  if (!a4)
  {
    v8 = self->_unprotectedAttributes;

    v7 = v8;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__MSCMSSignerInfo_getAttributesWithType_protectedAttributes___block_invoke;
  v15[3] = &unk_1EA9624C0;
  v9 = v6;
  v16 = v9;
  -[MSCMSMutableAttributeArray indexesOfObjectsPassingTest:](v7, "indexesOfObjectsPassingTest:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    -[MSCMSMutableAttributeArray objectsAtIndexes:](v7, "objectsAtIndexes:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)calculateSignedAttributesDigest:(id *)a3
{
  void *v5;
  MSAlgorithmIdentifier *signatureAlgorithm;
  MSAlgorithmIdentifier *v7;
  id v8;
  MSAlgorithmIdentifier *digestAlgorithm;
  void *v10;
  id v11;
  id v13;
  id v14;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  if (self->_digestAlgorithm)
  {
LABEL_9:
    -[MSCMSMutableAttributeArray calculateAttributesWithDigest:error:](self->_protectedAttributes, "calculateAttributesWithDigest:error:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    if (!a3)
      goto LABEL_12;
    goto LABEL_10;
  }
  signatureAlgorithm = self->_signatureAlgorithm;
  if (signatureAlgorithm)
  {
    v14 = v5;
    +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:](MSAlgorithmIdentifier, "digestAlgorithmWithSignatureAlgorithm:error:", signatureAlgorithm, &v14);
    v7 = (MSAlgorithmIdentifier *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    digestAlgorithm = self->_digestAlgorithm;
    self->_digestAlgorithm = v7;

    if (self->_digestAlgorithm)
    {
      v5 = v8;
      goto LABEL_9;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v8, CFSTR("No digest algorithm specified"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v5, CFSTR("signer has no signature algorithm"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  if (!a3)
    goto LABEL_12;
LABEL_10:
  if (v11)
    *a3 = objc_retainAutorelease(v11);
LABEL_12:

  return v10;
}

- (void)setContainingSignedData:(id)a3
{
  objc_storeWeak((id *)&self->_containingSignedData, a3);
}

- (MSAlgorithmIdentifier)digestAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 120, 1);
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  return -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:](self, "initWithCertificate:signatureAlgorithm:error:", a3, 0, a4);
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  return -[MSCMSSignerInfo initWithIdentity:signatureAlgorithm:error:](self, "initWithIdentity:signatureAlgorithm:error:", a3, 0, a4);
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  return -[MSCMSSignerInfo initWithEmail:signatureAlgorithm:LAContext:error:](self, "initWithEmail:signatureAlgorithm:LAContext:error:", a3, 0, a4, a5);
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 error:(id *)a5
{
  id v7;
  MSCMSSignerInfo *v8;
  uint64_t v9;
  MSCMSMutableAttributeArray *protectedAttributes;
  uint64_t v11;
  MSCMSMutableAttributeArray *unprotectedAttributes;
  NSData *signature;
  uint64_t KeyTypeForCertificate;
  void *v15;
  void **p_signatureAlgorithm;
  void *v17;
  int v18;
  uint64_t v19;
  MSAlgorithmIdentifier *signatureAlgorithm;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  MSAlgorithmIdentifier *digestAlgorithm;
  MSCMSSignerInfo *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MSCMSSignerInfo;
  v8 = -[MSCMSSignerInfo init](&v32, sel_init);
  if (!v8)
    goto LABEL_24;
  if (a3)
    CFRetain(a3);
  v8->_signerCertificate = a3;
  +[MSCMSMutableAttributeArray array](MSCMSMutableAttributeArray, "array");
  v9 = objc_claimAutoreleasedReturnValue();
  protectedAttributes = v8->_protectedAttributes;
  v8->_protectedAttributes = (MSCMSMutableAttributeArray *)v9;

  +[MSCMSMutableAttributeArray array](MSCMSMutableAttributeArray, "array");
  v11 = objc_claimAutoreleasedReturnValue();
  unprotectedAttributes = v8->_unprotectedAttributes;
  v8->_unprotectedAttributes = (MSCMSMutableAttributeArray *)v11;

  signature = v8->_signature;
  v8->_signature = 0;

  v8->_signatureCalculated = 0;
  v8->_signerPrivKey = 0;
  v8->_encodedSignerInfo = 0;
  if (!v7)
  {
    p_signatureAlgorithm = (void **)&v8->_signatureAlgorithm;
    goto LABEL_21;
  }
  KeyTypeForCertificate = getKeyTypeForCertificate(a3);
  if (KeyTypeForCertificate == 3)
  {
    if (initWithCertificate_signatureAlgorithm_error__onceToken_4 != -1)
      dispatch_once(&initWithCertificate_signatureAlgorithm_error__onceToken_4, &__block_literal_global_5_1);
    v15 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs;
    goto LABEL_14;
  }
  if (KeyTypeForCertificate == 1)
  {
    if (initWithCertificate_signatureAlgorithm_error__onceToken != -1)
      dispatch_once(&initWithCertificate_signatureAlgorithm_error__onceToken, &__block_literal_global_8);
    v15 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs;
LABEL_14:
    objc_msgSend(v7, "OIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "containsObject:", v17);

    if (v18)
    {
      +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v7);
      v19 = objc_claimAutoreleasedReturnValue();
      signatureAlgorithm = v8->_signatureAlgorithm;
      v8->_signatureAlgorithm = (MSAlgorithmIdentifier *)v19;

    }
  }
  p_signatureAlgorithm = (void **)&v8->_signatureAlgorithm;
  if (v8->_signatureAlgorithm)
    goto LABEL_23;
  if (MS_DEFAULT_LOG_BLOCK != -1)
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6_0);
  v21 = (void *)MS_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    objc_msgSend(v7, "OIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = getKeyTypeForCertificate(a3);
    *(_DWORD *)buf = 138412546;
    v34 = v23;
    v35 = 2048;
    v36 = v24;
    _os_log_impl(&dword_1DEED9000, v22, OS_LOG_TYPE_DEFAULT, "MSCMSSignerInfo init signature aglorithm %@ not permitted for certificate key type %ld", buf, 0x16u);

  }
LABEL_21:
  if (!*p_signatureAlgorithm)
  {
    findBestMutuallySupportedSignatureAlgorithm(a3, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *p_signatureAlgorithm;
    *p_signatureAlgorithm = (void *)v26;

  }
LABEL_23:
  +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:](MSAlgorithmIdentifier, "digestAlgorithmWithSignatureAlgorithm:error:");
  v28 = objc_claimAutoreleasedReturnValue();
  digestAlgorithm = v8->_digestAlgorithm;
  v8->_digestAlgorithm = (MSAlgorithmIdentifier *)v28;

  if (!v8->_digestAlgorithm)
  {
    v30 = 0;
    goto LABEL_26;
  }
LABEL_24:
  v30 = v8;
LABEL_26:

  return v30;
}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("1.2.840.113549.1.1.4");
  v4[1] = CFSTR("1.2.840.113549.1.1.5");
  v4[2] = CFSTR("1.2.840.113549.1.1.14");
  v4[3] = CFSTR("1.2.840.113549.1.1.11");
  v4[4] = CFSTR("1.2.840.113549.1.1.12");
  v4[5] = CFSTR("1.2.840.113549.1.1.13");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs;
  initWithCertificate_signatureAlgorithm_error__sAllowedRSASigAlgs = v2;

}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("1.2.840.10045.4.1");
  v4[1] = CFSTR("1.2.840.10045.4.3.1");
  v4[2] = CFSTR("1.2.840.10045.4.3.2");
  v4[3] = CFSTR("1.2.840.10045.4.3.3");
  v4[4] = CFSTR("1.2.840.10045.4.3.4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs;
  initWithCertificate_signatureAlgorithm_error__sAllowedECSigAlgs = v2;

}

void __64__MSCMSSignerInfo_initWithCertificate_signatureAlgorithm_error___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  MSCMSSignerInfo *v7;
  MSCMSSignerInfo *v8;

  v6 = a5;
  v7 = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:](self, "initWithCertificate:signatureAlgorithm:error:", a3, a4, a6);
  v8 = v7;
  if (v7)
    -[MSCMSSignerInfo setUseIssuerAndSerialNumber:](v7, "setUseIssuerAndSerialNumber:", v6);

  return v8;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 useIssuerAndSerialNumber:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  MSCMSSignerInfo *v7;
  MSCMSSignerInfo *v8;

  v6 = a5;
  v7 = -[MSCMSSignerInfo initWithIdentity:signatureAlgorithm:error:](self, "initWithIdentity:signatureAlgorithm:error:", a3, a4, a6);
  v8 = v7;
  if (v7)
    -[MSCMSSignerInfo setUseIssuerAndSerialNumber:](v7, "setUseIssuerAndSerialNumber:", v6);

  return v8;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 signatureAlgorithm:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  SecCertificateRef v10;
  id v11;
  id v12;
  SecKeyRef v13;
  id v15;
  id v16;
  id v17;

  v8 = a4;
  if (a5 && *a5)
    v9 = (void *)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  v17 = v9;
  v10 = MSSecIdentityCopyCertificateWithError(a3, &v17);
  v11 = v17;

  if (!v10)
  {
    v13 = 0;
    if (!a5)
      goto LABEL_14;
    goto LABEL_12;
  }
  v16 = v11;
  self = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:](self, "initWithCertificate:signatureAlgorithm:error:", v10, v8, &v16);
  v12 = v16;

  if (!self)
  {
    v13 = 0;
    v11 = v12;
    if (!a5)
      goto LABEL_14;
    goto LABEL_12;
  }
  v15 = v12;
  v13 = MSSecIdentityCopyKeyWithError(a3, &v15);
  v11 = v15;

  if (v13)
    CFRetain(v13);
  self->_signerPrivKey = v13;
  if (a5)
  {
LABEL_12:
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
LABEL_14:
  if (v10)
    CFRelease(v10);
  if (v13)
    CFRelease(v13);

  return self;
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 signatureAlgorithm:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  const void *IdentityByEmailAddress;
  void *v15;
  id v16;
  id v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 && *a6)
    v13 = (void *)objc_msgSend(*a6, "copy");
  else
    v13 = 0;
  v19 = v13;
  IdentityByEmailAddress = (const void *)findIdentityByEmailAddress(v10, v12, &v19);
  v15 = v19;

  if (IdentityByEmailAddress)
  {
    v18 = v15;
    self = -[MSCMSSignerInfo initWithIdentity:signatureAlgorithm:error:](self, "initWithIdentity:signatureAlgorithm:error:", IdentityByEmailAddress, v11, &v18);
    v16 = v18;

    -[MSCMSSignerInfo setLAContext:](self, "setLAContext:", v12);
    if (!a6)
      goto LABEL_11;
  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorKeychainDomain[0], -25300, v15, CFSTR("unable to find identity matching %@"), v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!a6)
      goto LABEL_11;
  }
  if (v16)
    *a6 = objc_retainAutorelease(v16);
LABEL_11:
  if (IdentityByEmailAddress)
    CFRelease(IdentityByEmailAddress);

  return self;
}

- (MSCMSSignerInfo)initWithCertificate:(__SecCertificate *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5
{
  void *v8;
  MSCMSSignerInfo *v9;

  findBestMutuallySupportedSignatureAlgorithm(a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:](self, "initWithCertificate:signatureAlgorithm:error:", a3, v8, a5);

  return v9;
}

- (MSCMSSignerInfo)initWithIdentity:(__SecIdentity *)a3 recipientsAlgorithmCapabilities:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  __SecCertificate *v10;
  id v11;
  void *v12;
  id v13;
  SecKeyRef v14;
  id v16;
  id v17;
  id v18;

  v8 = a4;
  if (a5 && *a5)
    v9 = (void *)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  v18 = v9;
  v10 = MSSecIdentityCopyCertificateWithError(a3, &v18);
  v11 = v18;

  if (!v10)
  {
    v14 = 0;
    v12 = 0;
    if (!a5)
      goto LABEL_14;
    goto LABEL_12;
  }
  findBestMutuallySupportedSignatureAlgorithm(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  self = -[MSCMSSignerInfo initWithCertificate:signatureAlgorithm:error:](self, "initWithCertificate:signatureAlgorithm:error:", v10, v12, &v17);
  v13 = v17;

  if (!self)
  {
    v14 = 0;
    v11 = v13;
    if (!a5)
      goto LABEL_14;
    goto LABEL_12;
  }
  v16 = v13;
  v14 = MSSecIdentityCopyKeyWithError(a3, &v16);
  v11 = v16;

  if (v14)
    CFRetain(v14);
  self->_signerPrivKey = v14;
  if (a5)
  {
LABEL_12:
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
LABEL_14:
  if (v10)
    CFRelease(v10);
  if (v14)
    CFRelease(v14);

  return self;
}

- (MSCMSSignerInfo)initWithEmail:(id)a3 recipientsAlgorithmCapabilities:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  const void *IdentityByEmailAddress;
  id v15;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 && *a6)
    v13 = (void *)objc_msgSend(*a6, "copy");
  else
    v13 = 0;
  IdentityByEmailAddress = (const void *)findIdentityByEmailAddress(v10, v12, a6);
  if (IdentityByEmailAddress)
  {
    v17 = v13;
    self = -[MSCMSSignerInfo initWithIdentity:recipientsAlgorithmCapabilities:error:](self, "initWithIdentity:recipientsAlgorithmCapabilities:error:", IdentityByEmailAddress, v11, &v17);
    v15 = v17;

    -[MSCMSSignerInfo setLAContext:](self, "setLAContext:", v12);
    if (!a6)
      goto LABEL_11;
  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorKeychainDomain[0], -25300, v13, CFSTR("unable to find identity matching %@"), v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!a6)
      goto LABEL_11;
  }
  if (v15)
    *a6 = objc_retainAutorelease(v15);
LABEL_11:
  if (IdentityByEmailAddress)
    CFRelease(IdentityByEmailAddress);

  return self;
}

- (void)addCounterSignerAttribute:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    objc_msgSend(v11, "setContainingSignerInfo:", self);
    -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addCounterSignerCertificates:mode:error:", self, objc_msgSend(v11, "chainMode"), 0);

      objc_msgSend(v11, "additionalCertificates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "certificates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "additionalCertificates");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v10);

      }
    }
  }

}

- (void)addMultipleSignaturesAttribute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  MSCMSMultipleSignaturesAttribute *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[MSCMSMutableAttributeArray array](MSCMSMutableAttributeArray, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__MSCMSSignerInfo_addMultipleSignaturesAttribute__block_invoke;
    v12[3] = &unk_1EA9623C0;
    v11 = v4;
    v13 = v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

    -[MSCMSSignerInfo setProtectedAttributes:](self, "setProtectedAttributes:", v11);
    -[MSCMSSignerInfo containingSignedData](self, "containingSignedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") != 1)
    {
      v8 = 0;
      do
      {
        v9 = [MSCMSMultipleSignaturesAttribute alloc];
        -[MSCMSMultipleSignaturesAttribute setSignedAttrsHashAlgorithm:](v9, "setSignedAttrsHashAlgorithm:", self->_digestAlgorithm);
        -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v9);

        ++v8;
      }
      while (v8 < objc_msgSend(v7, "count") - 1);
    }

  }
}

void __49__MSCMSSignerInfo_addMultipleSignaturesAttribute__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "attributeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("1.2.840.113549.1.9.2.51"));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)addSMIMECapabilitiesAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if (a3)
  {
    v4 = a3;
    +[MSCMSMutableAttributeArray array](MSCMSMutableAttributeArray, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__MSCMSSignerInfo_addSMIMECapabilitiesAttribute___block_invoke;
    v8[3] = &unk_1EA9623C0;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

    objc_msgSend(v7, "addObject:", v4);
    -[MSCMSSignerInfo setProtectedAttributes:](self, "setProtectedAttributes:", v7);

  }
}

void __49__MSCMSSignerInfo_addSMIMECapabilitiesAttribute___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "attributeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("1.2.840.113549.1.9.15"));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)addSMIMEEncryptionKeyPreferenceAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if (a3)
  {
    v4 = a3;
    +[MSCMSMutableAttributeArray array](MSCMSMutableAttributeArray, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__MSCMSSignerInfo_addSMIMEEncryptionKeyPreferenceAttribute___block_invoke;
    v8[3] = &unk_1EA9623C0;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

    objc_msgSend(v7, "addObject:", v4);
    -[MSCMSSignerInfo setProtectedAttributes:](self, "setProtectedAttributes:", v7);

  }
}

void __60__MSCMSSignerInfo_addSMIMEEncryptionKeyPreferenceAttribute___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "attributeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("1.2.840.113549.1.9.16.2.11"));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)addProtectedAttribute:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[MSCMSSignerInfo createRequiredAttributes:](self, "createRequiredAttributes:", 0);
}

void __35__MSCMSSignerInfo_verifySignature___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __35__MSCMSSignerInfo_verifySignature___block_invoke_46()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (id)verifyTime:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  MSCMSTimestampAttribute *v11;
  void *v12;
  MSCMSTimestampAttribute *v13;
  void *v14;
  char v15;
  void *v16;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.2.14"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v11 = [MSCMSTimestampAttribute alloc];
      objc_msgSend(v8, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MSCMSTimestampAttribute initWithAttribute:error:](v11, "initWithAttribute:error:", v12, 0);

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();

      v13 = 0;
      if ((v15 & 1) == 0)
        goto LABEL_11;
      objc_msgSend(v8, "objectAtIndex:", 0);
      v13 = (MSCMSTimestampAttribute *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_11;
    }
    -[MSCMSTimestampAttribute timestampTime](v13, "timestampTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[MSCMSTimestampAttribute timestampTime](v13, "timestampTime");
      v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  v6 = v4;
LABEL_14:

  return v6;
}

- (BOOL)verifySignatureAndSignerWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  CFErrorRef v15;
  void *v16;
  __SecTrust *v17;
  _BOOL4 v18;
  CFErrorRef v19;
  BOOL v20;
  __CFError *v21;
  CFIndex Code;
  CFErrorRef v24;
  CFErrorRef v25;
  id v26;
  CFErrorRef error;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 && *a6)
    v13 = (void *)objc_msgSend(*a6, "copy");
  else
    v13 = 0;
  v26 = v13;
  error = 0;
  v14 = -[MSCMSSignerInfo verifySignature:](self, "verifySignature:", &v26);
  v15 = (CFErrorRef)v26;

  if (!v14)
  {
    v17 = 0;
    goto LABEL_18;
  }
  -[MSCMSSignerInfo verifyTime:](self, "verifyTime:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MSCMSSignerInfo createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:](self, "createTrustObjectWithPolicies:verifyTime:anchorCertificates:error:", v10, v16, v12, a6);

  if (!v17)
  {
LABEL_18:
    v20 = 0;
    goto LABEL_11;
  }
  if (SecTrustEvaluateWithError(v17, &error))
  {
    v25 = v15;
    v18 = -[MSCMSSignerInfo verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:error:](self, "verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:error:", v10, v11, v12, &v25);
    v19 = v25;

    if (!v18)
    {
      v20 = 0;
      v15 = v19;
      goto LABEL_11;
    }
    v24 = v19;
    v20 = -[MSCMSSignerInfo verifyTimestamps:](self, "verifyTimestamps:", &v24);
    v21 = v24;
  }
  else
  {
    if (error)
    {
      Code = CFErrorGetCode(error);
      v19 = error;
    }
    else
    {
      v19 = 0;
      Code = -1;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", *MEMORY[0x1E0CB2F90], Code, v19, CFSTR("trust evaluation of signer failed"));
    v21 = (__CFError *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
  }

  v15 = v21;
LABEL_11:
  if (a6 && v15)
    *a6 = objc_retainAutorelease(v15);
  if (v17)
    CFRelease(v17);

  return v20;
}

- (id)calculateSignatureDigestWithAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  __CFString *v12;
  id v13;

  v6 = a3;
  v7 = (_QWORD *)objc_msgSend(v6, "ccdigest");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", *v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignerInfo signature](self, "signature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "length");
    -[MSCMSSignerInfo signature](self, "signature");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "bytes");
    v11 = objc_retainAutorelease(v8);
    objc_msgSend(v11, "mutableBytes");
    ccdigest();

  }
  else
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v12 = MSErrorCryptoDomain[0];
    v13 = *a4;
    objc_msgSend(v6, "OIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v12, -4, v13, CFSTR("%@ is not a supported digest algorithm"), v9);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v11;
}

void __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __43__MSCMSSignerInfo_verifyCountersignatures___block_invoke_56(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  MSCMSCountersignatureAttribute *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MSCMSCountersignatureAttribute *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id obj;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [MSCMSCountersignatureAttribute alloc];
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    objc_msgSend(WeakRetained, "certificates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[4];
    v13 = *(_QWORD *)(v12 + 56);
    v14 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v14 + 40);
    v15 = -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:containingSignerInfo:error:](v8, "initWithAttribute:certificates:LAContext:containingSignerInfo:error:", v7, v11, v13, v12, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if (!v15)
    {
LABEL_8:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -108, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("unable to create countersignature attribute for countersigner %lu"), a3);
      v19 = objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    v15 = (MSCMSCountersignatureAttribute *)v7;
    if (!v15)
      goto LABEL_8;
  }
  v16 = *(_QWORD *)(a1[4] + 40);
  v17 = *(_QWORD *)(a1[5] + 8);
  v22 = *(id *)(v17 + 40);
  v18 = -[MSCMSCountersignatureAttribute verifyCountersignatures:error:](v15, "verifyCountersignatures:error:", v16, &v22);
  objc_storeStrong((id *)(v17 + 40), v22);
  if (!v18)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("unable to verify countersignature(s) for countersigner %lu"), a3);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v20 = *(_QWORD *)(a1[5] + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t *v25;
  uint64_t *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.6"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getAttributesWithType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    *(_QWORD *)buf = 0;
    v28 = buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4;
    v31 = __Block_byref_object_dispose__4;
    if (a6)
    {
      v16 = *a6;
      if (*a6)
        v16 = (id)objc_msgSend(v16, "copy");
    }
    else
    {
      v16 = 0;
    }
    v32 = v16;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke_63;
    v21[3] = &unk_1EA962450;
    v21[4] = self;
    v25 = buf;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v26 = &v33;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);
    if (a6)
    {
      v19 = (void *)*((_QWORD *)v28 + 5);
      if (v19)
        *a6 = objc_retainAutorelease(v19);
    }
    v18 = *((_BYTE *)v34 + 24) == 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_62);
    v17 = MS_DEFAULT_LOG_INTERNAL;
    v18 = 1;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DEED9000, v17, OS_LOG_TYPE_INFO, "no countersignatures, returning successful verification", buf, 2u);
    }
  }

  return v18;
}

void __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __108__MSCMSSignerInfo_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke_63(uint64_t *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  MSCMSCountersignatureAttribute *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MSCMSCountersignatureAttribute *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id obj;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [MSCMSCountersignatureAttribute alloc];
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    objc_msgSend(WeakRetained, "certificates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[4];
    v13 = *(_QWORD *)(v12 + 56);
    v14 = *(_QWORD *)(a1[8] + 8);
    obj = *(id *)(v14 + 40);
    v15 = -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:containingSignerInfo:error:](v8, "initWithAttribute:certificates:LAContext:containingSignerInfo:error:", v7, v11, v13, v12, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if (!v15)
    {
LABEL_8:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -108, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), CFSTR("unable to create countersignature attribute for countersigner %lu"), a3);
      v21 = objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    v15 = (MSCMSCountersignatureAttribute *)v7;
    if (!v15)
      goto LABEL_8;
  }
  v16 = a1[5];
  objc_msgSend((id)a1[4], "verifyTime:", a1[6]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1[4] + 40);
  v19 = a1[7];
  v20 = *(_QWORD *)(a1[8] + 8);
  v24 = *(id *)(v20 + 40);
  LOBYTE(v16) = -[MSCMSCountersignatureAttribute verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:signature:error:](v15, "verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:signature:error:", v16, v17, v19, v18, &v24);
  objc_storeStrong((id *)(v20 + 40), v24);

  if ((v16 & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), CFSTR("unable to verify countersigner %lu"), a3);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v22 = *(_QWORD *)(a1[8] + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }

}

- (BOOL)verifyTimestamps:(BOOL)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v15;
  _QWORD v16[8];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];
  id v28;

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__4;
  v27[4] = __Block_byref_object_dispose__4;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  if (a4)
  {
    v7 = *a4;
    if (*a4)
      v7 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v7 = 0;
  }
  v26 = v7;
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.16.2.14"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_8;
  if (a3)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, v22[5], CFSTR("unable to verify timestamp signature because there are no timestamps"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v22[5];
    v22[5] = v10;

LABEL_8:
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke_69;
    v16[3] = &unk_1EA962498;
    v16[4] = self;
    v16[5] = &v21;
    v16[6] = v27;
    v16[7] = buf;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
    if (a4)
    {
      v12 = (void *)v22[5];
      if (v12)
        *a4 = objc_retainAutorelease(v12);
    }
    v13 = v18[24] == 0;
    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }
  if (MS_DEFAULT_LOG_BLOCK != -1)
    dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_66);
  v15 = MS_DEFAULT_LOG_INTERNAL;
  v13 = 1;
  if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DEED9000, v15, OS_LOG_TYPE_INFO, "no timestamps, returning successful verification", buf, 2u);
  }
LABEL_12:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);

  return v13;
}

void __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __42__MSCMSSignerInfo_verifyTimestamps_error___block_invoke_69(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  MSCMSTimestampAttribute *v8;
  uint64_t v9;
  MSCMSTimestampAttribute *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [MSCMSTimestampAttribute alloc];
    v9 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v9 + 40);
    v10 = -[MSCMSTimestampAttribute initWithAttribute:error:](v8, "initWithAttribute:error:", v7, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if (!v10)
    {
LABEL_8:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -108, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("unable to create timestamp attribute for timestamp %lu"), a3);
      v18 = objc_claimAutoreleasedReturnValue();
      v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    v10 = (MSCMSTimestampAttribute *)v7;
    if (!v10)
      goto LABEL_8;
  }
  v11 = (id *)a1[4];
  objc_msgSend(v11[15], "algorithm");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calculateSignatureDigestWithAlgorithm:error:", v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v17 = *(_QWORD *)(a1[5] + 8);
  v21 = *(id *)(v17 + 40);
  LOBYTE(v12) = -[MSCMSTimestampAttribute verifyTimestamps:error:](v10, "verifyTimestamps:error:", v16, &v21);
  objc_storeStrong((id *)(v17 + 40), v21);
  if ((v12 & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("unable to verify timestamp signature for timestamp %lu"), a3);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v19 = *(_QWORD *)(a1[5] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (BOOL)sign:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  __SecCertificate *signerCertificate;
  NSData *LAContext;
  __SecIdentity *IdentityByCertificate;
  id v12;
  __SecKey *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  CFTypeRef v19;
  __SecKey *signerPrivKey;
  void *v21;
  NSData *Signature;
  NSData *v23;
  CFTypeRef v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  cf = 0;
  if (!self->_signature || !-[MSCMSSignerInfo verifySignature:](self, "verifySignature:", 0))
  {
    if (!self->_signatureAlgorithm)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v5, CFSTR("Could not sign data: no signature algorithm"));
      v29 = objc_claimAutoreleasedReturnValue();

      v6 = 0;
      v5 = (void *)v29;
      if (a3)
      {
LABEL_31:
        if (v5)
          *a3 = objc_retainAutorelease(v5);
      }
LABEL_33:
      self->_signatureCalculated = v6;
      goto LABEL_34;
    }
    v35 = v5;
    -[MSCMSSignerInfo calculateSignerInfoDigest:](self, "calculateSignerInfoDigest:", &v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v35;

    if (!v7)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v8, CFSTR("Could not sign data: no digest"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
      v6 = 0;
      if (a3)
        goto LABEL_31;
      goto LABEL_33;
    }
    if (!self->_signerPrivKey)
    {
      signerCertificate = self->_signerCertificate;
      if (!signerCertificate)
      {
        v30 = MSErrorCMSDomain[0];
        v31 = CFSTR("Could not sign data: no key or certificate specified");
LABEL_41:
        v32 = -50;
        goto LABEL_42;
      }
      LAContext = self->_LAContext;
      v34 = v8;
      IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate(signerCertificate, LAContext, &v34);
      v12 = v34;

      if (!IdentityByCertificate)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorKeychainDomain[0], -25300, v12, CFSTR("Could not sign data: no identity in keychain for certificate"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      }
      v33 = v12;
      v13 = MSSecIdentityCopyKeyWithError(IdentityByCertificate, &v33);
      v8 = v33;

      self->_signerPrivKey = v13;
      CFRelease(IdentityByCertificate);
      if (!self->_signerPrivKey)
      {
        v30 = MSErrorKeychainDomain[0];
        v31 = CFSTR("Could not sign data: no private key");
        v32 = -25300;
LABEL_42:
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v30, v32, v8, v31);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      }
    }
    -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "secKeyAlgorithm");

    if (!v15)
    {
      v25 = MSErrorCryptoDomain[0];
      -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "OIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v25, -4, v8, CFSTR("%@ is not a supported signature algorithm"), v27);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
      goto LABEL_30;
    }
    -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("1.2.840.113549.1.1.4"));

    if (!v17)
    {
      if (self->_LAContext && !SecKeySetParameter())
      {
        if (MS_DEFAULT_LOG_BLOCK != -1)
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_96);
        v18 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = cf;
          _os_log_impl(&dword_1DEED9000, v18, OS_LOG_TYPE_ERROR, "failed to set credential reference on signer private key: %@", buf, 0xCu);
        }
        v19 = cf;
        if (cf)
        {
          cf = 0;
          CFRelease(v19);
        }
      }
      signerPrivKey = self->_signerPrivKey;
      -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      Signature = (NSData *)SecKeyCreateSignature(signerPrivKey, (SecKeyAlgorithm)objc_msgSend(v21, "secKeyAlgorithm"), (CFDataRef)v7, (CFErrorRef *)&cf);
      v23 = self->_signature;
      self->_signature = Signature;

      v24 = cf;
      if (cf)
      {

        v8 = (id)v24;
      }
      v6 = self->_signature != 0;

      v5 = v8;
      if (!a3)
        goto LABEL_33;
      goto LABEL_31;
    }
    v30 = MSErrorCryptoDomain[0];
    v31 = CFSTR("MD5 is not supported for signing");
    goto LABEL_41;
  }
  v6 = 1;
LABEL_34:

  return v6;
}

void __24__MSCMSSignerInfo_sign___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (BOOL)createRequiredAttributes:(id *)a3
{
  MSCMSMutableAttributeArray *protectedAttributes;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  MSCMSMutableAttributeArray *v29;
  void *v30;
  id v31;
  MSCMSMutableAttributeArray *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id *v39;
  id *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  protectedAttributes = self->_protectedAttributes;
  if (!protectedAttributes || !-[MSCMSMutableAttributeArray count](protectedAttributes, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignedData);
    if (!WeakRetained)
      goto LABEL_5;
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    objc_msgSend(v8, "contentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1"));

    if ((v10 & 1) != 0)
    {
LABEL_5:
      v11 = 0;
      v12 = 1;
      goto LABEL_25;
    }
  }
  v13 = objc_loadWeakRetained((id *)&self->_containingSignedData);
  if (v13
    && (v14 = v13,
        v15 = objc_loadWeakRetained((id *)&self->_containingSignedData),
        objc_msgSend(v15, "contentType"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v14,
        v16))
  {
    v39 = a3;
    v17 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    -[MSAlgorithmIdentifier algorithm](self->_digestAlgorithm, "algorithm");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v17, "calculateContentDigestWithAlgorithm:error:", v18, &v45);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v45;

    v44 = v20;
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), &v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v44;

    -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v22;
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.4"), &v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v43;

    -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)v19;
    if (v23 && v25)
    {
      v27 = objc_loadWeakRetained((id *)&self->_containingSignedData);
      if ((objc_msgSend(v27, "contentChanged") & 1) != 0
        || -[MSCMSSignerInfo contentChanged](self, "contentChanged")
        || !-[MSCMSSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", 0))
      {

      }
      else
      {
        v28 = -[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v19, 0);

        if (v28)
        {
          a3 = v39;
          goto LABEL_22;
        }
      }
    }
    v29 = self->_protectedAttributes;
    v42 = v11;
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), &v42, v39);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v42;

    -[MSCMSMutableAttributeArray removeAttributes:](v29, "removeAttributes:", v30);
    v32 = self->_protectedAttributes;
    v41 = v31;
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.4"), &v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v41;

    -[MSCMSMutableAttributeArray removeAttributes:](v32, "removeAttributes:", v33);
    v34 = objc_loadWeakRetained((id *)&self->_containingSignedData);
    objc_msgSend(v34, "contentType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSCMSContentTypeAttribute contentTypeAttributeWithOID:](MSCMSContentTypeAttribute, "contentTypeAttributeWithOID:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    +[MSCMSMessageDigestAttribute messageDigestAttributeWithDigest:](MSCMSMessageDigestAttribute, "messageDigestAttributeWithDigest:", v19);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = v40;
    if (v36)
    {
      -[MSCMSMutableAttributeArray addObject:](self->_protectedAttributes, "addObject:", v36);
      if (v37)
      {
        -[MSCMSMutableAttributeArray addObject:](self->_protectedAttributes, "addObject:", v37);

LABEL_22:
        v12 = 1;
        if (!a3)
          goto LABEL_25;
        goto LABEL_23;
      }
    }

  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, 0, CFSTR("Cannot encode signed attributes: no SignedData"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
  if (!a3)
    goto LABEL_25;
LABEL_23:
  if (v11)
  {
    v11 = objc_retainAutorelease(v11);
    *a3 = v11;
  }
LABEL_25:

  return v12;
}

- (BOOL)encodeSignerInfo:(SignerInfo *)a3 error:(id *)a4
{
  id v7;
  void *v8;
  MSCMSIdentifier *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  CFDataRef v15;
  void *v16;
  NSNumber *v17;
  NSNumber *version;
  void *v19;
  id v20;
  void *v21;
  id v22;
  MSAlgorithmIdentifier *signatureAlgorithm;
  MSAlgorithmIdentifier *digestAlgorithm;
  MSAlgorithmIdentifier *v25;
  MSAlgorithmIdentifier *v26;
  id v27;
  MSAlgorithmIdentifier *v28;
  _BOOL4 v29;
  MSCMSMutableAttributeArray *protectedAttributes;
  MSCMSMutableAttributeArray *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  MSCMSMutableAttributeArray *unprotectedAttributes;
  MSCMSMutableAttributeArray *v38;
  id v39;
  id v40;
  BOOL v41;
  __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  __CFString *v46;
  const __CFString *v47;
  id v48[3];
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54[3];
  id v55;

  if (a4 && *a4)
    v7 = (id)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  if (!a3)
  {
    v43 = MSErrorAllocationDomain[0];
    v44 = CFSTR("Unable to encode SignerInfo: missing destination address");
LABEL_46:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v43, -50, v7, v44);
    v45 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v36) = 0;
    v9 = 0;
    v12 = 0;
    v7 = (id)v45;
    goto LABEL_37;
  }
  a3->var6 = 0;
  *(_OWORD *)&a3->var4.var0.components = 0u;
  a3->var5 = 0u;
  *(_OWORD *)&a3->var2.var0.components = 0u;
  *(_OWORD *)&a3->var3 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var1.var1 = 0u;
  if (self->_encodedSignerInfo
    && !copy_SignerInfo()
    && -[MSCMSSignerInfo verifySignature:](self, "verifySignature:", 0))
  {
    if (!self->_encodedSignerInfo->var6)
    {
      -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (MSCMSIdentifier *)objc_msgSend(v8, "count");

      if (!v9)
        goto LABEL_14;
    }
    -[MSCMSSignerInfo unprotectedAttributes](self, "unprotectedAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeImplicitAttributesWithError:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && objc_msgSend(v11, "length") == self->_encodedSignerInfo->var6->var0)
    {

      v9 = 0;
LABEL_14:
      v12 = 0;
      goto LABEL_41;
    }

  }
  free_SignerInfo();
  if (!self->_signerCertificate)
  {
    v43 = MSErrorCMSDomain[0];
    v44 = CFSTR("Unable to encode SignerInfo: missing signer certificate");
    goto LABEL_46;
  }
  SecCertificateGetSubjectKeyID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && !-[MSCMSSignerInfo useIssuerAndSerialNumber](self, "useIssuerAndSerialNumber"))
  {
    a3->var0 = 3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v17;

    v9 = -[MSCMSIdentifier initWithSkid:]([MSCMSIdentifier alloc], "initWithSkid:", v12);
  }
  else
  {
    a3->var0 = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = self->_version;
    self->_version = v13;

    v15 = SecCertificateCopySerialNumberData(self->_signerCertificate, 0);
    v16 = (void *)SecCertificateCopyIssuerSequence();
    v9 = -[MSCMSIdentifier initWithIssuerName:serialNumber:]([MSCMSIdentifier alloc], "initWithIssuerName:serialNumber:", v16, v15);

  }
  v55 = v7;
  -[MSCMSIdentifier encodeMessageSecurityObject:](v9, "encodeMessageSecurityObject:", &v55);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v55;

  -[MSCMSSignerInfo setIdentifierData:](self, "setIdentifierData:", v19);
  -[MSCMSSignerInfo identifierData](self, "identifierData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = (id)objc_msgSend(v21, "length");
  -[MSCMSSignerInfo identifierData](self, "identifierData");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54[2] = (id)objc_msgSend(v22, "bytes");

  copy_SignerIdentifier();
  signatureAlgorithm = self->_signatureAlgorithm;
  if (!signatureAlgorithm)
  {
    v46 = MSErrorCMSDomain[0];
    v47 = CFSTR("Signer has no signature algorithm");
LABEL_50:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v46, -50, v20, v47);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_51;
  }
  -[MSAlgorithmIdentifier asn1AlgId](signatureAlgorithm, "asn1AlgId");
  copy_AlgorithmIdentifier();
  digestAlgorithm = self->_digestAlgorithm;
  if (digestAlgorithm)
    goto LABEL_26;
  v25 = self->_signatureAlgorithm;
  if (!v25)
  {
    v46 = MSErrorCMSDomain[0];
    v47 = CFSTR("signer has no signature algorithm");
    goto LABEL_50;
  }
  v54[0] = v20;
  +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:](MSAlgorithmIdentifier, "digestAlgorithmWithSignatureAlgorithm:error:", v25, v54);
  v26 = (MSAlgorithmIdentifier *)objc_claimAutoreleasedReturnValue();
  v27 = v54[0];

  v28 = self->_digestAlgorithm;
  self->_digestAlgorithm = v26;

  digestAlgorithm = self->_digestAlgorithm;
  if (!digestAlgorithm)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v27, CFSTR("No digest algorithm specified"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_51;
  }
  v20 = v27;
LABEL_26:
  -[MSAlgorithmIdentifier asn1AlgId](digestAlgorithm, "asn1AlgId");
  copy_AlgorithmIdentifier();
  v53 = v20;
  v29 = -[MSCMSSignerInfo createRequiredAttributes:](self, "createRequiredAttributes:", &v53);
  v7 = v53;

  if (!v29)
  {
LABEL_51:
    LOBYTE(v36) = 0;
    goto LABEL_37;
  }
  protectedAttributes = self->_protectedAttributes;
  if (protectedAttributes && -[MSCMSMutableAttributeArray count](protectedAttributes, "count"))
  {
    a3->var3 = (heim_base_data *)malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
    v31 = self->_protectedAttributes;
    v52 = v7;
    -[MSCMSMutableAttributeArray encodeImplicitAttributesWithError:](v31, "encodeImplicitAttributesWithError:", &v52);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v52;

    -[MSCMSSignerInfo setSignedAttrsData:](self, "setSignedAttrsData:", v32);
    v50 = objc_msgSend(v32, "length");
    v34 = objc_retainAutorelease(v32);
    v51 = objc_msgSend(v34, "bytes");
    MEMORY[0x1DF0F2420](&v50, a3->var3);

    v7 = v33;
  }
  v35 = v7;
  v49 = v7;
  LODWORD(v36) = -[MSCMSSignerInfo sign:](self, "sign:", &v49);
  v7 = v49;

  if ((_DWORD)v36)
  {
    v48[1] = (id)-[NSData length](self->_signature, "length");
    v48[2] = (id)-[NSData bytes](self->_signature, "bytes");
    copy_SignatureValue();
    unprotectedAttributes = self->_unprotectedAttributes;
    if (unprotectedAttributes && -[MSCMSMutableAttributeArray count](unprotectedAttributes, "count"))
    {
      a3->var6 = (heim_base_data *)malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      v38 = self->_unprotectedAttributes;
      v48[0] = v7;
      -[MSCMSMutableAttributeArray encodeImplicitAttributesWithError:](v38, "encodeImplicitAttributesWithError:", v48);
      v36 = objc_claimAutoreleasedReturnValue();
      v39 = v48[0];

      -[MSCMSSignerInfo setUnsignedAttrsData:](self, "setUnsignedAttrsData:", v36);
      v50 = objc_msgSend((id)v36, "length");
      v40 = objc_retainAutorelease((id)v36);
      v51 = objc_msgSend(v40, "bytes");
      MEMORY[0x1DF0F2420](&v50, a3->var6);

      LOBYTE(v36) = 1;
      v7 = v39;
    }
    else
    {
      if (a3->var6)
        a3->var6 = 0;
      LOBYTE(v36) = 1;
    }
  }
LABEL_37:
  if (a4 && v7)
    *a4 = objc_retainAutorelease(v7);
  if ((v36 & 1) == 0)
  {
    free_SignerInfo();
    v41 = 0;
    a3->var6 = 0;
    *(_OWORD *)&a3->var4.var0.components = 0u;
    a3->var5 = 0u;
    *(_OWORD *)&a3->var2.var0.components = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    *(_OWORD *)&a3->var0 = 0u;
    *(_OWORD *)&a3->var1.var1 = 0u;
    goto LABEL_43;
  }
LABEL_41:
  v41 = 1;
LABEL_43:

  return v41;
}

- (MSAlgorithmIdentifier)signatureAlgorithm
{
  return (MSAlgorithmIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)LAContext
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (__SecKey)signerPrivKey
{
  return self->_signerPrivKey;
}

- (void)setSignerPrivKey:(__SecKey *)a3
{
  self->_signerPrivKey = a3;
}

- (BOOL)useIssuerAndSerialNumber
{
  return self->_useIssuerAndSerialNumber;
}

- (void)setUseIssuerAndSerialNumber:(BOOL)a3
{
  self->_useIssuerAndSerialNumber = a3;
}

- (NSData)signedAttrsData
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignedAttrsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)unsignedAttrsData
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUnsignedAttrsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)identifierData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdentifierData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (BOOL)signatureCalculated
{
  return self->_signatureCalculated;
}

@end
