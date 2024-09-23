@implementation MSCMSCounterSignerInfo

- (id)certificates
{
  void *v3;
  void *v4;
  void *v5;

  -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "certificates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setContainingSignerInfo:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containingSignerInfo, 0);
    objc_storeWeak((id *)&self->_containingSignerInfo, obj);
    -[MSCMSSignerInfo setContentChanged:](self, "setContentChanged:", 1);
  }

}

- (id)calculateSignerInfoDigest:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  id v24;
  _BOOL4 v25;
  void *v26;
  __CFString *v27;
  const __CFString *v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_18;
  v7 = (void *)v6;
  -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_18:
    v27 = MSErrorCMSDomain[0];
    v28 = CFSTR("counter signer has no reference to a signer with a signature");
LABEL_19:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v27, -50, v5, v28);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    goto LABEL_20;
  }
  -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[MSCMSSignerInfo signatureAlgorithm](self, "signatureAlgorithm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v27 = MSErrorCMSDomain[0];
      v28 = CFSTR("signer has no signature algorithm");
      goto LABEL_19;
    }
    -[MSCMSSignerInfo signatureAlgorithm](self, "signatureAlgorithm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v5;
    +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:](MSAlgorithmIdentifier, "digestAlgorithmWithSignatureAlgorithm:error:", v12, &v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34;

    -[MSCMSSignerInfo setDigestAlgorithm:](self, "setDigestAlgorithm:", v13);
    v5 = v14;
  }
  -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v27 = MSErrorCMSDomain[0];
    v28 = CFSTR("No digest algorithm specified");
    goto LABEL_19;
  }
  -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "algorithm");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v5;
  objc_msgSend(v16, "calculateSignatureDigestWithAlgorithm:error:", v18, &v33);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v33;

  if (v19)
  {
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
    {
      v19 = v19;
      v26 = v19;
      if (!a3)
        goto LABEL_25;
      goto LABEL_23;
    }
    v32 = v20;
    v23 = -[MSCMSCounterSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", &v32);
    v24 = v32;

    if (!v23)
    {
      v26 = 0;
LABEL_16:
      v20 = v24;
      if (!a3)
        goto LABEL_25;
      goto LABEL_23;
    }
    v31 = v24;
    v25 = -[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v19, &v31);
    v20 = v31;

    if (v25)
    {
      v30 = v20;
      -[MSCMSSignerInfo calculateSignedAttributesDigest:](self, "calculateSignedAttributesDigest:", &v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v30;

      goto LABEL_16;
    }
  }
LABEL_20:
  v26 = 0;
  if (!a3)
    goto LABEL_25;
LABEL_23:
  if (v20)
    *a3 = objc_retainAutorelease(v20);
LABEL_25:

  return v26;
}

- (BOOL)verifyContentTypeAttribute:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  id v12;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  v12 = v5;
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  -[MSCMSSignerInfo getAttributesWithType:](self, "getAttributesWithType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "count"))
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v7, CFSTR("Content-type attribute must not be present in Countersignature"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v7 = (id)v11;
    if (!a3)
      goto LABEL_10;
  }
  else
  {
    v9 = 1;
    if (!a3)
      goto LABEL_10;
  }
  if (v7)
    *a3 = objc_retainAutorelease(v7);
LABEL_10:

  return v9;
}

- (BOOL)createRequiredAttributes:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v24;
  id v25;
  id v26;

  -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        !v8))
  {
    v13 = 0;
    v22 = 1;
    goto LABEL_12;
  }
  -[MSCMSCounterSignerInfo containingSignerInfo](self, "containingSignerInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSCMSSignerInfo digestAlgorithm](self, "digestAlgorithm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "algorithm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v9, "calculateSignatureDigestWithAlgorithm:error:", v11, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v26;

  if (!-[MSCMSCounterSignerInfo verifyContentTypeAttribute:](self, "verifyContentTypeAttribute:", 0)
    || !-[MSCMSSignerInfo verifyMessageDigestAttribute:error:](self, "verifyMessageDigestAttribute:error:", v12, 0))
  {
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.3"), &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;

    objc_msgSend(v14, "removeAttributes:", v15);
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v16;
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.4"), &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;

    objc_msgSend(v17, "removeAttributes:", v18);
    +[MSCMSMessageDigestAttribute messageDigestAttributeWithDigest:](MSCMSMessageDigestAttribute, "messageDigestAttributeWithDigest:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v22 = 0;
      goto LABEL_8;
    }
    v20 = (void *)v19;
    -[MSCMSSignerInfo protectedAttributes](self, "protectedAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v20);

  }
  v22 = 1;
LABEL_8:

  if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }
LABEL_12:

  return v22;
}

- (MSCMSSignerInfo)containingSignerInfo
{
  return (MSCMSSignerInfo *)objc_loadWeakRetained((id *)&self->_containingSignerInfo);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingSignerInfo);
}

@end
