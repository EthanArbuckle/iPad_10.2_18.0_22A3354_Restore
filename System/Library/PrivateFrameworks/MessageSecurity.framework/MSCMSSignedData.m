@implementation MSCMSSignedData

void __36__MSCMSSignedData_verifySignatures___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if ((id)a1[4] != v3)
  {
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(_QWORD *)(v4 + 24);
    if (v5)
    {
      v9 = v3;
      v6 = (void *)a1[5];
      *(_QWORD *)(v4 + 24) = v5 - 1;
      objc_msgSend(v6, "objectAtIndex:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calculateSignedAttributesDigest:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSignedAttrsHash:", v8);

      v3 = v9;
    }
  }

}

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

- (BOOL)verifySignatures:(id *)a3
{
  id v5;
  uint64_t v6;
  NSArray *signers;
  NSArray *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  if (a3)
  {
    v5 = *a3;
    if (*a3)
      v5 = (id)objc_msgSend(v5, "copy");
  }
  else
  {
    v5 = 0;
  }
  v19 = v5;
  v6 = MEMORY[0x1E0C809B0];
  signers = self->_signers;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__MSCMSSignedData_verifySignatures___block_invoke;
  v13[3] = &unk_1EA961C80;
  v13[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v13);
  v8 = self->_signers;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __36__MSCMSSignedData_verifySignatures___block_invoke_3;
  v12[3] = &unk_1EA961D70;
  v12[4] = &v14;
  v12[5] = &v20;
  v12[6] = a3;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v12);
  if (a3)
  {
    v9 = (void *)v15[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = *((_BYTE *)v21 + 24) == 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_digestAlgorithms, 0);
  objc_storeStrong((id *)&self->_signers, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_embeddedContent, 0);
  objc_storeStrong((id *)&self->_dataContent, 0);
}

void __36__MSCMSSignedData_verifySignatures___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "protectedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.2.51"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAttributesWithType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v15 = objc_msgSend(v6, "count");
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__MSCMSSignedData_verifySignatures___block_invoke_2;
  v10[3] = &unk_1EA961D48;
  v8 = v3;
  v11 = v8;
  v13 = v14;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

void __36__MSCMSSignedData_verifySignatures___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(v16, "verifySignature:", a1[6]) & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("signature verification failed for signer %lu"), a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if ((objc_msgSend(v16, "verifyCountersignatures:", a1[6]) & 1) == 0)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("countersignature verification failed for signer %lu"), a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[4] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) && (objc_msgSend(v16, "verifyTimestamps:", a1[6]) & 1) == 0)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40), CFSTR("timestamp verification failed for signer %lu"), a3);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[4] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    }
  }

}

- (NSArray)signers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)detached
{
  return self->_detached;
}

- (NSMutableSet)certificates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (MSOID)contentType
{
  return (MSOID *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)dataContent
{
  return self->_dataContent;
}

- (id)calculateContentDigestWithAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = (_QWORD *)objc_msgSend(v6, "ccdigest");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", *v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSData length](self->_dataContent, "length");
    -[NSData bytes](self->_dataContent, "bytes");
    a4 = objc_retainAutorelease(v8);
    objc_msgSend(a4, "mutableBytes");
    ccdigest();
  }
  else if (a4)
  {
    v9 = MSErrorCryptoDomain[0];
    v10 = *a4;
    objc_msgSend(v6, "OIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v9, -4, v10, CFSTR("%@ is not a supported digest algorithm"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  MSCMSSignedData *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  MSCMSSignedData *v21;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  BOOL v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[16];
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v62 = a4;
  v57 = a5;
  if (a5 && *a5)
    v8 = (void *)objc_msgSend(*a5, "copy");
  else
    v8 = 0;
  v9 = [MSCMSSignedData alloc];
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v59 = v7;
  v10 = nsheim_decode_CMSSignedData(v7);
  if (v10)
  {
    v11 = MSErrorASN1Domain[0];
    if (v7)
      v12 = objc_msgSend(v7, "length");
    else
      v12 = -1;
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v11, v10, v8, CFSTR("unable to decode signedData (%ld bytes)"), v12);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    dumpNSData("CMSSignedData", v7);
    v20 = 0;
    v60 = 0;
    v61 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v71);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignedData setVersion:](v9, "setVersion:", v13);

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", DWORD2(v71));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (DWORD2(v71))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      memset(buf, 0, sizeof(buf));
      v77 = 0;
      v16 = *(_QWORD *)(v72 + v14 + 16);
      *(_OWORD *)buf = *(_OWORD *)(v72 + v14);
      v77 = v16;
      v70 = v8;
      +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", buf, &v70);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v70;

      if (v17)
        objc_msgSend(v60, "addObject:", v17);

      ++v15;
      v14 += 24;
      v8 = v18;
    }
    while (v15 < DWORD2(v71));
  }
  else
  {
    v18 = v8;
  }
  -[MSCMSSignedData setDigestAlgorithms:](v9, "setDigestAlgorithms:", v60);
  v69 = v18;
  +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", (char *)&v72 + 8, &v69);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v69;

  if (!v58)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v23, CFSTR("unable to get contentType from signedData"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v61 = 0;
LABEL_16:
    v56 = 0;
    v58 = 0;
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  -[MSCMSSignedData setContentType:](v9, "setContentType:");
  v24 = *((_QWORD *)&v73 + 1);
  if (*((_QWORD *)&v73 + 1))
  {
    NSDataFromAny(*((_QWORD **)&v73 + 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSCMSSignedData setDataContent:](v9, "setDataContent:", v25);

  }
  -[MSCMSSignedData setDetached:](v9, "setDetached:", v24 == 0);
  if ((objc_msgSend(v58, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")) & 1) != 0)
  {
    v56 = 0;
  }
  else
  {
    -[MSCMSSignedData dataContent](v9, "dataContent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v23;
    decodeEmbeddedCMSContent(v58, v26, v62, (uint64_t)&v68);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v68;

    if (v56)
      -[MSCMSSignedData setEmbeddedContent:](v9, "setEmbeddedContent:");
    else
      v56 = 0;
    v23 = v27;
  }
  -[MSCMSSignedData setContentChanged:](v9, "setContentChanged:", 0);
  if ((_QWORD)v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", *(unsigned int *)v74);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v74;
    if (*(_DWORD *)v74)
    {
      v29 = 0;
      v30 = 0;
      while (*(_DWORD *)(*(_QWORD *)(v28 + 8) + v29) == 1)
      {
        v31 = (void *)SecCertificateCreateWithBytes();
        if (!v31)
        {
          if (MS_DEFAULT_LOG_BLOCK != -1)
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_84);
          v35 = MS_DEFAULT_LOG_INTERNAL;
          if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
            goto LABEL_47;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v30;
          v33 = v35;
          v34 = "unable to parse certificate at %u";
          goto LABEL_46;
        }
        objc_msgSend(v20, "addObject:", v31);

LABEL_47:
        ++v30;
        v28 = v74;
        v29 += 24;
        if (v30 >= *(unsigned int *)v74)
          goto LABEL_54;
      }
      if (MS_DEFAULT_LOG_BLOCK != -1)
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_82);
      v32 = MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v30;
      v33 = v32;
      v34 = "skipping non-certificate CertificateChoice at %u";
LABEL_46:
      _os_log_impl(&dword_1DEED9000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 8u);
      goto LABEL_47;
    }
  }
  else
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_86);
    v36 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DEED9000, v36, OS_LOG_TYPE_INFO, "No certificates in SignedData", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_54:
  objc_msgSend(v62, "additionalCertificates");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v62, "additionalCertificates");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v38);

  }
  -[MSCMSSignedData setCertificates:](v9, "setCertificates:", v20);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v75);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v75)
  {
    v39 = 0;
    v40 = 0;
    do
    {
      v41 = *((_QWORD *)&v75 + 1);
      objc_msgSend(v20, "allObjects");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "LAContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v23;
      +[MSCMSSignerInfo decodeSignerInfo:certificates:LAContext:error:](MSCMSSignerInfo, "decodeSignerInfo:certificates:LAContext:error:", v41 + v39, v42, v43, &v67);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v67;

      if (v44)
      {
        objc_msgSend(v44, "setContainingSignedData:", v9);
        objc_msgSend(v61, "addObject:", v44);
        -[MSCMSSignedData addDigestAlgorithmFromSigner:](v9, "addDigestAlgorithmFromSigner:", v44);
        v23 = v45;
      }
      else
      {
        +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:](MSError, "MSErrorWithDomain:code:errorLevel:underlyingError:description:", MSErrorCMSDomain[0], -26275, 2, v45, CFSTR("failed to create signerInfo object for signer %u"), v40);
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      ++v40;
      v39 += 104;
    }
    while (v40 < v75);
  }
  -[MSCMSSignedData setSigners:](v9, "setSigners:", v61);
  v66 = v23;
  v46 = -[MSCMSSignedData checkSignedPerRFC5652:](v9, "checkSignedPerRFC5652:", &v66);
  v47 = v66;

  if (!v46)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v47, CFSTR("decode failed for signedData due to RFC 5652 violation"));
    v19 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  -[MSCMSSignedData setOptions:](v9, "setOptions:", v62);
  if (objc_msgSend(v62, "verifySigners"))
  {
    objc_msgSend(v62, "signerPolicies");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "verifyTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "anchorCertificates");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v47;
    v51 = -[MSCMSSignedData verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:](v9, "verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:", v48, v49, v50, &v65);
    v19 = v65;

    if (!v51)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorTrustDomain, -67808, v19, CFSTR("decode failed due to signer verification failure"));
      v52 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      v19 = (id)v52;
    }
  }
  else if ((objc_msgSend(v62, "verifySignatures") & 1) != 0 || objc_msgSend(v62, "verifyTimestamps"))
  {
    v64 = v47;
    v53 = -[MSCMSSignedData verifySignatures:](v9, "verifySignatures:", &v64);
    v19 = v64;

    if (!v53)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCryptoDomain[0], -67808, v19, CFSTR("decode failed due to signature verification failure"));
      v54 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
      v19 = (id)v54;
    }
    if (objc_msgSend(v62, "verifyTimestamps"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      v77 = 0x3032000000;
      v78 = __Block_byref_object_copy__0;
      v79 = __Block_byref_object_dispose__0;
      v80 = 0;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_96;
      v63[3] = &unk_1EA961CA8;
      v63[4] = buf;
      objc_msgSend(v61, "enumerateObjectsUsingBlock:", v63);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) || !objc_msgSend(v61, "count"))
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCryptoDomain[0], -67808, v19, CFSTR("decode failed due to timestamp verification failure"));
        v55 = objc_claimAutoreleasedReturnValue();

        v9 = 0;
        v19 = (id)v55;
      }
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    v19 = v47;
  }
LABEL_18:
  if (v57 && v19)
    *v57 = objc_retainAutorelease(v19);
  free_CMSSignedData();
  v21 = v9;

  return v21;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setSigners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
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

- (void)setContentChanged:(BOOL)a3
{
  self->_contentChanged = a3;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)checkSignedPerRFC5652:(id *)a3
{
  void *v5;
  NSData *dataContent;
  BOOL v7;
  uint64_t v9;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  if (!-[NSArray count](self->_signers, "count")
    && (!-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1"))
     || (dataContent = self->_dataContent) != 0 && -[NSData length](dataContent, "length")))
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("signedData contains content but has no signers"));
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = 0;
    v5 = (void *)v9;
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  if (!-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")))
    -[NSArray enumerateObjectsUsingBlock:](self->_signers, "enumerateObjectsUsingBlock:", &__block_literal_global_38);
  v7 = 1;
  if (a3)
  {
LABEL_12:
    if (v5)
      *a3 = objc_retainAutorelease(v5);
  }
LABEL_14:

  return v7;
}

- (void)addDigestAlgorithmFromSigner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "digestAlgorithm");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    -[MSCMSSignedData digestAlgorithms](self, "digestAlgorithms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v7);
    -[MSCMSSignedData setDigestAlgorithms:](self, "setDigestAlgorithms:", v6);

  }
}

- (void)setDigestAlgorithms:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)digestAlgorithms
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
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

- (void)addCounterSignerCertificates:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "unprotectedAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.6"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getAttributesWithType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v10;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v11)
      goto LABEL_25;
    v12 = v11;
    v13 = *(_QWORD *)v36;
    v14 = &off_1EA960000;
    v28 = *(_QWORD *)v36;
    while (1)
    {
      v15 = 0;
      v29 = v12;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = (id)objc_msgSend(objc_alloc((Class)v14[28]), "initWithAttribute:certificates:LAContext:containingSignerInfo:error:", v16, 0, 0, 0, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_23;
          v17 = v16;
        }
        v18 = v17;
        if (v17)
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v17, "signers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v32 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                v25 = objc_msgSend(v18, "chainMode", v27);
                if (v25 <= a4)
                  v26 = a4;
                else
                  v26 = v25;
                -[MSCMSSignedData addCertificatesForSigner:mode:error:](self, "addCertificatesForSigner:mode:error:", v24, v26, a5);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v21);
          }

          v13 = v28;
          v12 = v29;
          v14 = &off_1EA960000;
        }
LABEL_23:
        ++v15;
      }
      while (v15 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (!v12)
      {
LABEL_25:

        v10 = v27;
        break;
      }
    }
  }

}

- (BOOL)addCertificatesForSigner:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  __SecTrust *v10;
  BOOL v11;
  id v12;
  CFStringRef v13;
  CFStringRef v14;
  NSObject *v15;
  CFErrorRef v16;
  CFArrayRef v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  CFErrorRef err;
  id v27;
  uint8_t buf[4];
  CFStringRef v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 && *a5)
    v9 = (void *)objc_msgSend(*a5, "copy");
  else
    v9 = 0;
  if (a4 - 2 < 2)
  {
    if (v8 && objc_msgSend(v8, "signerCertificate"))
    {
      v27 = v9;
      v10 = MSSecTrustCreateWithError(objc_msgSend(v8, "signerCertificate"), 0, 0, 0, &v27);
      v12 = v27;

      if (v10)
      {
        err = 0;
        if (!SecTrustEvaluateWithError(v10, &err))
        {
          if (err)
            v13 = CFErrorCopyDescription(err);
          else
            v13 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "Error Unavailable", 0x8000100u);
          v14 = v13;
          if (MS_DEFAULT_LOG_BLOCK != -1)
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_3);
          v15 = MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v14;
            _os_log_impl(&dword_1DEED9000, v15, OS_LOG_TYPE_DEFAULT, "MSCMSChainMode with chain specified, but no trusted chain found (%@), continuing with untrusted chain", buf, 0xCu);
          }
          v16 = err;
          if (err)
          {
            err = 0;
            CFRelease(v16);
          }
        }
        v17 = SecTrustCopyCertificateChain(v10);
        v18 = (void *)-[__CFArray mutableCopy](v17, "mutableCopy");

        v19 = objc_msgSend(v18, "count");
        v20 = v19 - 1;
        if (v19 <= 1)
        {
          if (MS_DEFAULT_LOG_BLOCK != -1)
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_13);
          v21 = MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DEED9000, v21, OS_LOG_TYPE_DEFAULT, "MSCMSChainMode with chain specified, but could not build chain beyond leaf, continuing with single certificate", buf, 2u);
          }
        }
        if (a4 == 2)
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", v20);

          buf[0] = 0;
          if (!SecCertificateIsSelfSigned())
          {
            if (buf[0])
              objc_msgSend(v18, "removeLastObject");
          }
        }
        -[NSMutableSet addObjectsFromArray:](self->_certificates, "addObjectsFromArray:", v18);

        v11 = 1;
      }
      else
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorTrustDomain, -25245, v12, CFSTR("unable to build chain according to mode; could not evaluate trust"));
        v25 = objc_claimAutoreleasedReturnValue();

        v11 = 0;
        v12 = (id)v25;
      }
      goto LABEL_37;
    }
    v23 = MSErrorCMSDomain[0];
    v24 = CFSTR("unable to build chain according to mode; missing signer info or signer certificate missing from signer info");
  }
  else
  {
    if (!a4)
    {
      v11 = 1;
      goto LABEL_43;
    }
    if (a4 != 1)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_19;
    }
    if (v8 && objc_msgSend(v8, "signerCertificate"))
    {
      -[NSMutableSet addObject:](self->_certificates, "addObject:", objc_msgSend(v8, "signerCertificate"));
      v10 = 0;
      v11 = 1;
LABEL_19:
      v12 = v9;
      goto LABEL_37;
    }
    v23 = MSErrorCMSDomain[0];
    v24 = CFSTR("unable to add signer cert to certificates; missing signer info or signer certificate missing from signer info");
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v23, -50, v9, v24);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = 0;
LABEL_37:
  if (a5 && v12)
    *a5 = objc_retainAutorelease(v12);
  if (v10)
    CFRelease(v10);
  v9 = v12;
LABEL_43:

  return v11;
}

void __55__MSCMSSignedData_addCertificatesForSigner_mode_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __55__MSCMSSignedData_addCertificatesForSigner_mode_error___block_invoke_12()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  MSCMSSignedData *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *digestAlgorithms;
  MSCMSMessage *embeddedContent;
  uint64_t v22;
  NSArray *signers;
  uint64_t v24;
  MSOID *contentType;
  uint64_t v26;
  NSMutableSet *certificates;
  MSCMSSignedData *v28;
  objc_super v30;

  v11 = a3;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MSCMSSignedData;
  v13 = -[MSCMSSignedData init](&v30, sel_init);
  if (v13)
  {
    objc_msgSend(v12, "signatureAlgorithm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "algorithm");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOID digestOIDWithSignatureAlgorithm:error:](MSOID, "digestOIDWithSignatureAlgorithm:error:", v15, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_6;
    v17 = (void *)MEMORY[0x1E0C99E60];
    +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObject:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    digestAlgorithms = v13->_digestAlgorithms;
    v13->_digestAlgorithms = (NSSet *)v19;

    objc_storeStrong((id *)&v13->_dataContent, a3);
    v13->_contentChanged = 1;
    embeddedContent = v13->_embeddedContent;
    v13->_embeddedContent = 0;

    v13->_detached = a4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
    v22 = objc_claimAutoreleasedReturnValue();
    signers = v13->_signers;
    v13->_signers = (NSArray *)v22;

    objc_msgSend(v12, "setContainingSignedData:", v13);
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.7.1"), a6);
    v24 = objc_claimAutoreleasedReturnValue();
    contentType = v13->_contentType;
    v13->_contentType = (MSOID *)v24;

    if (!objc_msgSend(v12, "signerCertificate"))
    {
LABEL_6:

      v28 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", objc_msgSend(v12, "signerCertificate"));
    v26 = objc_claimAutoreleasedReturnValue();
    certificates = v13->_certificates;
    v13->_certificates = (NSMutableSet *)v26;

    -[MSCMSSignedData addCounterSignerCertificates:mode:error:](v13, "addCounterSignerCertificates:mode:error:", v12, 1, 0);
  }
  v28 = v13;
LABEL_7:

  return v28;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 additionalCertificates:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  MSCMSSignedData *v13;
  MSCMSSignedData *v14;

  v9 = a4;
  v12 = a6;
  v13 = -[MSCMSSignedData initWithDataContent:isDetached:signer:error:](self, "initWithDataContent:isDetached:signer:error:", a3, v9, a5, a7);
  v14 = v13;
  if (v12 && v13)
    -[NSMutableSet addObjectsFromArray:](v13->_certificates, "addObjectsFromArray:", v12);

  return v14;
}

- (MSCMSSignedData)initWithDataContent:(id)a3 isDetached:(BOOL)a4 signer:(id)a5 signerChainMode:(unint64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  MSCMSSignedData *v13;
  MSCMSSignedData *v14;
  MSCMSSignedData *v15;

  v9 = a4;
  v12 = a5;
  v13 = -[MSCMSSignedData initWithDataContent:isDetached:signer:error:](self, "initWithDataContent:isDetached:signer:error:", a3, v9, v12, a7);
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (!a6)
  {
    -[NSMutableSet removeAllObjects](v13->_certificates, "removeAllObjects");
    goto LABEL_6;
  }
  if (-[MSCMSSignedData addCertificatesForSigner:mode:error:](v13, "addCertificatesForSigner:mode:error:", v12, a6, a7))
  {
LABEL_6:
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:](v14, "addCounterSignerCertificates:mode:error:", v12, a6, 0);
LABEL_7:
    v15 = v14;
    goto LABEL_8;
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  MSCMSSignedData *v11;
  void *v12;
  void *v13;
  MSCMSSignedData *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *digestAlgorithms;
  NSData *dataContent;
  uint64_t v20;
  NSArray *signers;
  uint64_t v22;
  MSOID *contentType;
  uint64_t v24;
  NSMutableSet *certificates;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MSCMSSignedData;
  v11 = -[MSCMSSignedData init](&v27, sel_init);
  if (!v11)
    goto LABEL_4;
  objc_msgSend(v10, "signatureAlgorithm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "algorithm");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID digestOIDWithSignatureAlgorithm:error:](MSOID, "digestOIDWithSignatureAlgorithm:error:", v13, a5);
  v14 = (MSCMSSignedData *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99E60];
    +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObject:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    digestAlgorithms = v11->_digestAlgorithms;
    v11->_digestAlgorithms = (NSSet *)v17;

    dataContent = v11->_dataContent;
    v11->_dataContent = 0;

    objc_storeStrong((id *)&v11->_embeddedContent, a3);
    v11->_detached = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
    v20 = objc_claimAutoreleasedReturnValue();
    signers = v11->_signers;
    v11->_signers = (NSArray *)v20;

    objc_msgSend(v10, "setContainingSignedData:", v11);
    objc_msgSend(v9, "type");
    v22 = objc_claimAutoreleasedReturnValue();
    contentType = v11->_contentType;
    v11->_contentType = (MSOID *)v22;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", objc_msgSend(v10, "signerCertificate"));
    v24 = objc_claimAutoreleasedReturnValue();
    certificates = v11->_certificates;
    v11->_certificates = (NSMutableSet *)v24;

    -[MSCMSSignedData addCounterSignerCertificates:mode:error:](v11, "addCounterSignerCertificates:mode:error:", v10, 1, 0);
LABEL_4:
    v14 = v11;
  }

  return v14;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 additionalCertificates:(id)a5 error:(id *)a6
{
  id v10;
  MSCMSSignedData *v11;
  MSCMSSignedData *v12;

  v10 = a5;
  v11 = -[MSCMSSignedData initWithEmbeddedContent:signer:error:](self, "initWithEmbeddedContent:signer:error:", a3, a4, a6);
  v12 = v11;
  if (v10 && v11)
    -[NSMutableSet addObjectsFromArray:](v11->_certificates, "addObjectsFromArray:", v10);

  return v12;
}

- (MSCMSSignedData)initWithEmbeddedContent:(id)a3 signer:(id)a4 signerChainMode:(unint64_t)a5 error:(id *)a6
{
  id v10;
  MSCMSSignedData *v11;
  MSCMSSignedData *v12;
  MSCMSSignedData *v13;

  v10 = a4;
  v11 = -[MSCMSSignedData initWithEmbeddedContent:signer:error:](self, "initWithEmbeddedContent:signer:error:", a3, v10, a6);
  v12 = v11;
  if (!v11)
    goto LABEL_7;
  if (!a5)
  {
    -[NSMutableSet removeAllObjects](v11->_certificates, "removeAllObjects");
    goto LABEL_6;
  }
  if (-[MSCMSSignedData addCertificatesForSigner:mode:error:](v11, "addCertificatesForSigner:mode:error:", v10, a5, a6))
  {
LABEL_6:
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:](v12, "addCounterSignerCertificates:mode:error:", v10, a5, 0);
LABEL_7:
    v13 = v12;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)initCertsOnlyWithCertificates:(id)a3 error:(id *)a4
{
  id v6;
  MSCMSSignedData *v7;
  uint64_t v8;
  NSSet *digestAlgorithms;
  NSData *dataContent;
  MSCMSMessage *embeddedContent;
  uint64_t v12;
  NSArray *signers;
  uint64_t v14;
  MSOID *contentType;
  uint64_t v16;
  NSMutableSet *certificates;
  MSCMSSignedData *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSCMSSignedData;
  v7 = -[MSCMSSignedData init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    digestAlgorithms = v7->_digestAlgorithms;
    v7->_digestAlgorithms = (NSSet *)v8;

    dataContent = v7->_dataContent;
    v7->_dataContent = 0;

    embeddedContent = v7->_embeddedContent;
    v7->_embeddedContent = 0;

    v7->_detached = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    signers = v7->_signers;
    v7->_signers = (NSArray *)v12;

    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.7.1"), a4);
    v14 = objc_claimAutoreleasedReturnValue();
    contentType = v7->_contentType;
    v7->_contentType = (MSOID *)v14;

    if (!v7->_contentType)
    {
      v18 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    certificates = v7->_certificates;
    v7->_certificates = (NSMutableSet *)v16;

  }
  v18 = v7;
LABEL_6:

  return v18;
}

- (void)addSigner:(id)a3
{
  void *v4;
  NSArray *signers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    signers = self->_signers;
    v8 = a3;
    objc_msgSend(v4, "arrayWithArray:", signers);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v6, "addObject:", v8);
    -[MSCMSSignedData addDigestAlgorithmFromSigner:](self, "addDigestAlgorithmFromSigner:", v8);
    -[NSMutableSet addObject:](self->_certificates, "addObject:", objc_msgSend(v8, "signerCertificate"));
    v7 = self->_signers;
    self->_signers = v6;

    objc_msgSend(v8, "setContainingSignedData:", self);
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:](self, "addCounterSignerCertificates:mode:error:", v8, 1, 0);

  }
}

- (void)addSigner:(id)a3 withCertificates:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    -[MSCMSSignedData addSigner:](self, "addSigner:", v7);
    if (v6)
      -[NSMutableSet addObjectsFromArray:](self->_certificates, "addObjectsFromArray:", v6);
    -[MSCMSSignedData addCounterSignerCertificates:mode:error:](self, "addCounterSignerCertificates:mode:error:", v7, 1, 0);
  }

}

- (BOOL)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _BOOL4 v10;

  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_signers);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);
    -[MSCMSSignedData addDigestAlgorithmFromSigner:](self, "addDigestAlgorithmFromSigner:", v8);
    v10 = -[MSCMSSignedData addCertificatesForSigner:mode:error:](self, "addCertificatesForSigner:mode:error:", v8, a4, a5);
    if (v10)
    {
      -[MSCMSSignedData addCounterSignerCertificates:mode:error:](self, "addCounterSignerCertificates:mode:error:", v8, a4, 0);
      objc_storeStrong((id *)&self->_signers, v9);
      objc_msgSend(v8, "setContainingSignedData:", self);
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)removeSignerCertificatesWithIndexes:(id)a3
{
  NSArray *signers;
  _QWORD v4[5];

  signers = self->_signers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__MSCMSSignedData_removeSignerCertificatesWithIndexes___block_invoke;
  v4[3] = &unk_1EA961C80;
  v4[4] = self;
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](signers, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v4);
}

uint64_t __55__MSCMSSignedData_removeSignerCertificatesWithIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "setContainingSignedData:", 0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = objc_msgSend(v3, "signerCertificate");

  return objc_msgSend(v4, "removeObject:", v5);
}

- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSArray *signers;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_signers);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsAtIndexes:", v6);
    -[MSCMSSignedData removeSignerCertificatesWithIndexes:](self, "removeSignerCertificatesWithIndexes:", v6);
    objc_storeStrong((id *)&self->_signers, v7);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    signers = self->_signers;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__MSCMSSignedData_removeSignersWithIndexes_error___block_invoke;
    v11[3] = &unk_1EA961CA8;
    v11[4] = &v12;
    -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v11);
    objc_storeStrong((id *)&self->_digestAlgorithms, (id)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    if (a4 && *a4)
      v9 = (void *)objc_msgSend(*a4, "copy");
    else
      v9 = 0;
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v9, CFSTR("no signer with input certificate hash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && v10)
      *a4 = objc_retainAutorelease(v10);

  }
}

void __50__MSCMSSignedData_removeSignersWithIndexes_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "digestAlgorithm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  NSArray *signers;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  signers = self->_signers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MSCMSSignedData_removeSignersWithCertificate_error___block_invoke;
  v8[3] = &unk_1EA961CD0;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v8);
  -[MSCMSSignedData removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v10[5], a4);
  _Block_object_dispose(&v9, 8);

}

uint64_t __54__MSCMSSignedData_removeSignersWithCertificate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)objc_msgSend(a2, "signerCertificate"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addIndex:", a3);
  return result;
}

- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *signers;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  signers = self->_signers;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke;
  v12 = &unk_1EA961D20;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", &v9);
  -[MSCMSSignedData removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v16[5], a4, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
}

void __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a2, "signerCertificate");
  v7 = (id)SecCertificateCopyRFC822Names();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke_2;
  v8[3] = &unk_1EA961CF8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = a3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __55__MSCMSSignedData_removeSignersWithEmailAddress_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2);
  if (!result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  void *v7;
  SecCertificateRef v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  v12 = v7;
  v8 = MSSecIdentityCopyCertificateWithError(a3, &v12);
  v9 = v12;

  if (v8)
  {
    v11 = v9;
    -[MSCMSSignedData removeSignersWithCertificate:error:](self, "removeSignersWithCertificate:error:", v8, &v11);
    v10 = v11;

    v9 = v10;
  }
  if (a4 && v9)
    *a4 = objc_retainAutorelease(v9);
  if (v8)
    CFRelease(v8);

}

- (__SecCertificate)getSignerCertificate:(unint64_t)a3 error:(id *)a4
{
  void *v8;
  __SecCertificate *v9;

  if (-[NSArray count](self->_signers, "count") - 1 >= a3)
  {
    -[NSArray objectAtIndex:](self->_signers, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__SecCertificate *)objc_msgSend(v8, "signerCertificate");

    return v9;
  }
  else
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, *a4, CFSTR("signer index, %lu, out of range of signer count, %lu"), a3, -[NSArray count](self->_signers, "count"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *signers;
  id v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  id *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  if (a6)
  {
    v13 = *a6;
    if (*a6)
      v13 = (id)objc_msgSend(v13, "copy");
  }
  else
  {
    v13 = 0;
  }
  v33 = v13;
  signers = self->_signers;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__MSCMSSignedData_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke;
  v21[3] = &unk_1EA961D98;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v25 = &v28;
  v26 = &v34;
  v27 = a6;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v21);
  if (a6)
  {
    v18 = (void *)v29[5];
    if (v18)
      *a6 = objc_retainAutorelease(v18);
  }
  v19 = *((_BYTE *)v35 + 24) == 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __94__MSCMSSignedData_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(v16, "verifySignatureAndSignerWithPolicies:verifyTime:anchorCertificates:error:", a1[4], a1[5], a1[6], a1[9]) & 1) == 0)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("signer verification failed for signer %lu"), a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    if ((objc_msgSend(v16, "verifyCountersignaturesAndCountersignersWithPolicies:verifyTime:anchorCertificates:error:", a1[4], a1[5], a1[6], a1[9]) & 1) == 0)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("countersigner verification failed for signer %lu"), a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[7] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    }
    if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) && (objc_msgSend(v16, "verifyTimestamps:", a1[9]) & 1) == 0)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -67808, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), CFSTR("countersignature verification failed for signer %lu"), a3);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[7] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    }
  }

}

- (BOOL)verifySignaturesAndSignersWithPolicies:(id)a3 verifyTime:(id)a4 error:(id *)a5
{
  return -[MSCMSSignedData verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:](self, "verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:", a3, a4, 0, a5);
}

void __41__MSCMSSignedData_checkSignedPerRFC5652___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "protectedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    if (MS_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_39);
    v6 = MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_1DEED9000, v6, OS_LOG_TYPE_DEFAULT, "signedData contains embedded content but signer %lu does not have signed attributes.", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __41__MSCMSSignedData_checkSignedPerRFC5652___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

- (id)encodeMessageSecurityObject:(id *)a3
{
  id v4;
  NSSet *digestAlgorithms;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  NSSet *v10;
  MSOID *contentType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger *v15;
  NSData *dataContent;
  uint64_t v17;
  id v18;
  MSCMSMessage *embeddedContent;
  id *v20;
  NSData *v21;
  NSData *v22;
  NSMutableSet *certificates;
  void *v24;
  void *v25;
  char *v26;
  NSArray *signers;
  NSArray *v28;
  unsigned int v29;
  NSNumber *v30;
  NSNumber *version;
  uint64_t v32;
  void *v33;
  id v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  unint64_t v42;
  char *i;
  void *v44;
  BOOL v45;
  id result;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  id *v67;
  _QWORD v68[7];
  _QWORD v69[5];
  _QWORD v70[5];
  id obj;
  _QWORD v72[6];
  _QWORD v73[4];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  void *v79;
  NSUInteger v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  id *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  _QWORD v94[4];

  v94[1] = *MEMORY[0x1E0C80C00];
  v87 = 0;
  v88 = (id *)&v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__0;
  v91 = __Block_byref_object_dispose__0;
  v67 = a3;
  if (a3)
  {
    v4 = *a3;
    if (*a3)
      v4 = (id)objc_msgSend(v4, "copy");
  }
  else
  {
    v4 = 0;
  }
  v92 = v4;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v82 = 0u;
  v80 = 0;
  v81 = 0;
  v78 = 0;
  v79 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v73[3] = 0;
  digestAlgorithms = self->_digestAlgorithms;
  if (!digestAlgorithms)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: missing digest algorithms"));
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v88[5];
    v88[5] = (id)v51;

    goto LABEL_70;
  }
  v6 = -[NSSet count](digestAlgorithms, "count");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v8 = -[NSSet count](self->_digestAlgorithms, "count");
    v9 = malloc_type_malloc(24 * -[NSSet count](self->_digestAlgorithms, "count"), 0x10300406712BA52uLL);
    if (v9)
    {
      v10 = self->_digestAlgorithms;
      v72[0] = v7;
      v72[1] = 3221225472;
      v72[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke;
      v72[3] = &unk_1EA961E00;
      v72[4] = v73;
      v72[5] = v9;
      -[NSSet enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v72);
      goto LABEL_13;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -67672, v88[5], CFSTR("Unable to encode signedData: unable to allocate digest algorithm array"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v88[5];
    v88[5] = (id)v55;

LABEL_70:
    v34 = 0;
    v9 = 0;
LABEL_78:
    v24 = 0;
    goto LABEL_79;
  }
  if (-[NSArray count](self->_signers, "count") || self->_dataContent || self->_embeddedContent)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: missing digest algorithm and not certs-only message"), v67);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v88[5];
    v88[5] = (id)v47;

    goto LABEL_70;
  }
  v8 = 0;
  v9 = 0;
LABEL_13:
  contentType = self->_contentType;
  if (!contentType)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: missing content type"));
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v88[5];
    v88[5] = (id)v53;

    goto LABEL_77;
  }
  if (!self->_detached && !self->_dataContent && !self->_embeddedContent)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: content is not detached and no content specified"));
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v88[5];
    v88[5] = (id)v63;

    goto LABEL_77;
  }
  v12 = -[MSOID Asn1OID](contentType, "Asn1OID", v67);
  v14 = v13;
  if (!self->_detached)
  {
    if (-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")))
    {
      dataContent = self->_dataContent;
      if (!dataContent)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: id-data content type and no data content"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v88[5];
        v88[5] = (id)v17;

LABEL_77:
        v34 = 0;
        goto LABEL_78;
      }
    }
    else if (self->_contentType)
    {
      embeddedContent = self->_embeddedContent;
      if (!embeddedContent)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: embedded content type specified and no embedded content"));
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = v88[5];
        v88[5] = (id)v65;

        goto LABEL_77;
      }
      v20 = v88;
      obj = v88[5];
      -[MSCMSMessage encodeMessageSecurityObject:](embeddedContent, "encodeMessageSecurityObject:", &obj);
      v21 = (NSData *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v20 + 5, obj);
      v22 = self->_dataContent;
      self->_dataContent = v21;

      self->_contentChanged = 1;
      dataContent = self->_dataContent;
      if (!dataContent)
        goto LABEL_77;
    }
    else
    {
      dataContent = self->_dataContent;
    }
    v81 = -[NSData bytes](dataContent, "bytes");
    v80 = -[NSData length](self->_dataContent, "length");
    v15 = &v80;
    goto LABEL_28;
  }
  v15 = 0;
LABEL_28:
  certificates = self->_certificates;
  if (certificates)
  {
    certificates = (NSMutableSet *)-[NSMutableSet count](certificates, "count");
    if (certificates)
    {
      v24 = malloc_type_malloc(24 * -[NSMutableSet count](self->_certificates, "count"), 0x10800404ACF7207uLL);
      if (v24)
      {
        -[NSMutableSet allObjects](self->_certificates, "allObjects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v7;
        v70[1] = 3221225472;
        v70[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_2;
        v70[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
        v70[4] = v24;
        objc_msgSend(v25, "enumerateObjectsUsingBlock:", v70);

        LODWORD(certificates) = -[NSMutableSet count](self->_certificates, "count");
        goto LABEL_33;
      }
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -67672, v88[5], CFSTR("Unable to encode signedData: unable to allocate certificates array"));
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v88[5];
      v88[5] = (id)v61;

      goto LABEL_77;
    }
  }
  v24 = 0;
LABEL_33:
  LODWORD(v78) = (_DWORD)certificates;
  v79 = v24;
  if (!-[NSArray count](self->_signers, "count"))
  {
    if (!-[NSSet count](self->_digestAlgorithms, "count") && !self->_embeddedContent && !self->_dataContent)
    {
      v29 = 0;
      v26 = 0;
      goto LABEL_41;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: no signers and not certs-only message"));
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v88[5];
    v88[5] = (id)v49;

    goto LABEL_72;
  }
  v26 = (char *)malloc_type_malloc(104 * -[NSArray count](self->_signers, "count"), 0x10B00404EF9CE24uLL);
  if (!v26)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -67672, v88[5], CFSTR("Unable to encode signedData: unable to allocate signerInfos array"));
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = v88[5];
    v88[5] = (id)v57;

LABEL_72:
    v34 = 0;
LABEL_79:
    v26 = 0;
    goto LABEL_52;
  }
  signers = self->_signers;
  v69[0] = v7;
  v69[1] = 3221225472;
  v69[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_3;
  v69[3] = &unk_1EA961C80;
  v69[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v69);
  v28 = self->_signers;
  v68[0] = v7;
  v68[1] = 3221225472;
  v68[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_5;
  v68[3] = &unk_1EA961D70;
  v68[4] = &v87;
  v68[5] = &v74;
  v68[6] = v26;
  -[NSArray enumerateObjectsUsingBlock:](v28, "enumerateObjectsUsingBlock:", v68);
  if (!*((_BYTE *)v75 + 24))
  {
    v29 = -[NSArray count](self->_signers, "count");
LABEL_41:
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v82 = 0u;
    if (-[NSArray indexOfObjectPassingTest:](self->_signers, "indexOfObjectPassingTest:", &__block_literal_global_67) == 0x7FFFFFFFFFFFFFFFLL
      && -[MSOID isEqualToString:](self->_contentType, "isEqualToString:", CFSTR("1.2.840.113549.1.7.1")))
    {
      LODWORD(v82) = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LODWORD(v82) = 3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
      v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    version = self->_version;
    self->_version = v30;

    *((_QWORD *)&v82 + 1) = v8;
    *(_QWORD *)&v83 = v9;
    *((_QWORD *)&v83 + 1) = v12;
    *(_QWORD *)&v84 = v14;
    *((_QWORD *)&v84 + 1) = v15;
    *(_QWORD *)&v85 = &v78;
    *(_QWORD *)&v86 = v29;
    *((_QWORD *)&v86 + 1) = v26;
    v32 = length_CMSSignedData();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = objc_retainAutorelease(v33);
      objc_msgSend(v34, "mutableBytes");
      v35 = encode_CMSSignedData();
      if (!v35)
      {
        if (v32)
        {
          result = (id)asn1_abort();
          __break(1u);
          return result;
        }
        goto LABEL_51;
      }

      v36 = v35;
    }
    else
    {
      v36 = 12;
    }
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v93 = *MEMORY[0x1E0CB2D50];
    v94[0] = CFSTR("Failed encoding type CMSSignedData");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v36, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v88[5];
    v88[5] = (id)v39;

    v34 = 0;
LABEL_51:
    self->_contentChanged = 0;
    goto LABEL_52;
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, v88[5], CFSTR("Unable to encode signedData: failed to encode a SignerInfo"));
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = v88[5];
  v88[5] = (id)v59;

  v34 = 0;
LABEL_52:
  if (v67)
  {
    v41 = v88[5];
    if (v41)
      *v67 = objc_retainAutorelease(v41);
  }
  if (v9)
    free(v9);
  if (v24)
    free(v24);
  if (v26)
  {
    v42 = 0;
    for (i = v26; ; i += 104)
    {
      -[MSCMSSignedData signers](self, "signers", v67);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v42 < objc_msgSend(v44, "count");

      if (!v45)
        break;
      free_SignerInfo();
      ++v42;
    }
    free(v26);
  }
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v87, 8);

  return v34;
}

__n128 __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke(uint64_t a1, void *a2)
{
  __n128 *v3;
  __n128 *v4;
  __n128 result;

  v3 = (__n128 *)(*(_QWORD *)(a1 + 40) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v4 = (__n128 *)objc_msgSend(a2, "asn1AlgId");
  result = *v4;
  v3[1].n128_u64[0] = v4[1].n128_u64[0];
  *v3 = result;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  uint64_t Length;

  v4 = 3 * a3;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24 * a3) = 1;
  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v4 + 16) = SecCertificateGetBytePtr();
  Length = SecCertificateGetLength();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v4 + 8) = Length;
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "protectedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.2.51"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAttributesWithType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v15 = objc_msgSend(v6, "count");
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_4;
  v10[3] = &unk_1EA961D48;
  v8 = v3;
  v11 = v8;
  v13 = v14;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if ((id)a1[4] != v3)
  {
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(_QWORD *)(v4 + 24);
    if (v5)
    {
      v9 = v3;
      v6 = (void *)a1[5];
      *(_QWORD *)(v4 + 24) = v5 - 1;
      objc_msgSend(v6, "objectAtIndex:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calculateSignedAttributesDigest:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSignedAttrsHash:", v8);

      v3 = v9;
    }
  }

}

void __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_5(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  v6 = a1[6] + 104 * a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(a2, "encodeSignerInfo:error:", v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
}

BOOL __47__MSCMSSignedData_encodeMessageSecurityObject___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") > 1;

  return v3;
}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_83()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_85()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MessageSecurity", "default");
  v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_96(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  char v6;
  id obj;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(a2, "verifyTimestamps:error:", 1, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0)
    *a4 = 1;
}

- (MSOID)type
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.7.2"), 0);
}

+ (BOOL)isImplementedInObjectiveC
{
  return 1;
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (MSDecodeOptions)options
{
  return (MSDecodeOptions *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)contentChanged
{
  return self->_contentChanged;
}

@end
