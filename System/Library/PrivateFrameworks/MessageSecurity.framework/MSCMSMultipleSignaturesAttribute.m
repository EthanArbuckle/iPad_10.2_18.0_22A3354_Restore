@implementation MSCMSMultipleSignaturesAttribute

- (void)setBodyHashAlgorithm:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bodyHashAlgorithm, a3);
    v5 = v6;
  }

}

- (void)setSignatureAlgorithm:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_signatureAlgorithm, a3);
    v5 = v6;
  }

}

- (void)setSignedAttrsHashAlgorithm:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_signedAttrsHashAlgorithm, a3);
    v5 = v6;
  }

}

- (MSCMSMultipleSignaturesAttribute)init
{
  MSCMSMultipleSignaturesAttribute *v2;
  void *v3;
  uint64_t v4;
  MSAlgorithmIdentifier *bodyHashAlgorithm;
  void *v6;
  uint64_t v7;
  MSAlgorithmIdentifier *signatureAlgorithm;
  void *v9;
  uint64_t v10;
  MSAlgorithmIdentifier *signedAttrsHashAlgorithm;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSCMSMultipleSignaturesAttribute;
  v2 = -[MSCMSMultipleSignaturesAttribute init](&v13, sel_init);
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.2.1"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  bodyHashAlgorithm = v2->_bodyHashAlgorithm;
  v2->_bodyHashAlgorithm = (MSAlgorithmIdentifier *)v4;

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.10045.4.3.2"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  signatureAlgorithm = v2->_signatureAlgorithm;
  v2->_signatureAlgorithm = (MSAlgorithmIdentifier *)v7;

  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("2.16.840.1.101.3.4.2.1"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSAlgorithmIdentifier algorithmIdentifierWithOID:](MSAlgorithmIdentifier, "algorithmIdentifierWithOID:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  signedAttrsHashAlgorithm = v2->_signedAttrsHashAlgorithm;
  v2->_signedAttrsHashAlgorithm = (MSAlgorithmIdentifier *)v10;

  objc_storeWeak((id *)&v2->_signedAttrsHash, 0);
  return v2;
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.2.51"), 0);
}

- (id)encodeAttributeWithError:(id *)a3
{
  NSData **p_signedAttrsHash;
  id WeakRetained;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MSCMSAttribute *v17;
  void *v18;
  void *v19;
  MSCMSAttribute *v20;
  MSCMSMultipleSignaturesAttribute *v22;
  SEL v23;
  id v24;
  id *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[MSAlgorithmIdentifier asn1AlgId](self->_bodyHashAlgorithm, "asn1AlgId");
  -[MSAlgorithmIdentifier asn1AlgId](self->_signatureAlgorithm, "asn1AlgId");
  -[MSAlgorithmIdentifier asn1AlgId](self->_signedAttrsHashAlgorithm, "asn1AlgId");
  p_signedAttrsHash = &self->_signedAttrsHash;
  WeakRetained = objc_loadWeakRetained((id *)p_signedAttrsHash);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_signedAttrsHash);
    objc_msgSend(v7, "length");

    v8 = objc_retainAutorelease(objc_loadWeakRetained((id *)p_signedAttrsHash));
    objc_msgSend(v8, "bytes");

  }
  v9 = length_MultipleSignatures();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v14 = 12;
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "mutableBytes");
  v12 = encode_MultipleSignatures();
  if (v12)
  {
    v13 = v12;

    v14 = v13;
    if (!a3)
    {
LABEL_7:
      v11 = 0;
LABEL_11:
      v17 = [MSCMSAttribute alloc];
      +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.2.51"), a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[MSCMSAttribute initWithAttributeType:values:](v17, "initWithAttributeType:values:", v18, v19);

      return v20;
    }
LABEL_6:
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Failed encoding type MultipleSignatures");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v14, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (!v9)
    goto LABEL_11;
  v22 = (MSCMSMultipleSignaturesAttribute *)asn1_abort();
  return -[MSCMSMultipleSignaturesAttribute initWithAttribute:error:](v22, v23, v24, v25);
}

- (MSCMSMultipleSignaturesAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6;
  MSCMSMultipleSignaturesAttribute *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  MSCMSMultipleSignaturesAttribute *v19;
  uint64_t v20;
  id v21;
  MSAlgorithmIdentifier *bodyHashAlgorithm;
  uint64_t v23;
  id v24;
  MSAlgorithmIdentifier *signatureAlgorithm;
  uint64_t v26;
  MSAlgorithmIdentifier *signedAttrsHashAlgorithm;
  id v29;
  id v30;
  id v31;
  _OWORD v32[3];
  _OWORD v33[2];
  uint64_t v34;
  objc_super v35;

  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MSCMSMultipleSignaturesAttribute;
  v7 = -[MSCMSMultipleSignaturesAttribute init](&v35, sel_init);
  objc_msgSend(v6, "attributeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("1.2.840.113549.1.9.2.51"));

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      v17 = *a4;
      v18 = CFSTR("Not a Multiple Signatures attribute according to AttributeType");
      v16 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    v19 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v6, "attributeValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      v17 = *a4;
      v18 = CFSTR("Missing value for Multiple Signatures attribute");
      v16 = -50;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v34 = 0;
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  objc_msgSend(v6, "attributeValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)nsheim_decode_MultipleSignatures(v13);

  if (!(_DWORD)v14)
  {
    v31 = 0;
    +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", v32, &v31);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v31;
    bodyHashAlgorithm = v7->_bodyHashAlgorithm;
    v7->_bodyHashAlgorithm = (MSAlgorithmIdentifier *)v20;

    if (v7->_bodyHashAlgorithm)
    {
      v30 = v21;
      +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", (char *)&v32[1] + 8, &v30);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v30;

      signatureAlgorithm = v7->_signatureAlgorithm;
      v7->_signatureAlgorithm = (MSAlgorithmIdentifier *)v23;

      if (!v7->_signatureAlgorithm)
      {
        v21 = v24;
        if (a4)
        {
LABEL_17:
          if (v21)
            *a4 = objc_retainAutorelease(v21);
        }
LABEL_19:
        free_MultipleSignatures();
        v19 = v7;

        goto LABEL_20;
      }
      v29 = v24;
      +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:](MSAlgorithmIdentifier, "algorithmIdentifierWithAsn1AlgId:error:", v33, &v29);
      v26 = objc_claimAutoreleasedReturnValue();
      v21 = v29;

      signedAttrsHashAlgorithm = v7->_signedAttrsHashAlgorithm;
      v7->_signedAttrsHashAlgorithm = (MSAlgorithmIdentifier *)v26;

      if (v7->_signedAttrsHashAlgorithm)
        objc_storeWeak((id *)&v7->_signedAttrsHash, 0);
    }
    if (a4)
      goto LABEL_17;
    goto LABEL_19;
  }
  if (!a4)
    goto LABEL_11;
  asn1ErrorToNSError(v14, a4);
  v15 = MSErrorASN1Domain[0];
  v16 = (int)v14;
  v17 = *a4;
  v18 = CFSTR("unable to decode Multiple Signatures attribute");
LABEL_10:
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v15, v16, v17, v18);
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v19;
}

- (MSCMSSignerInfo)containingSignerInfo
{
  return (MSCMSSignerInfo *)objc_loadWeakRetained((id *)&self->_containingSignerInfo);
}

- (void)setContainingSignerInfo:(id)a3
{
  objc_storeWeak((id *)&self->_containingSignerInfo, a3);
}

- (MSAlgorithmIdentifier)bodyHashAlgorithm
{
  return self->_bodyHashAlgorithm;
}

- (MSAlgorithmIdentifier)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (MSAlgorithmIdentifier)signedAttrsHashAlgorithm
{
  return self->_signedAttrsHashAlgorithm;
}

- (NSData)signedAttrsHash
{
  return (NSData *)objc_loadWeakRetained((id *)&self->_signedAttrsHash);
}

- (void)setSignedAttrsHash:(id)a3
{
  objc_storeWeak((id *)&self->_signedAttrsHash, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signedAttrsHash);
  objc_storeStrong((id *)&self->_signedAttrsHashAlgorithm, 0);
  objc_storeStrong((id *)&self->_signatureAlgorithm, 0);
  objc_storeStrong((id *)&self->_bodyHashAlgorithm, 0);
  objc_destroyWeak((id *)&self->_containingSignerInfo);
}

@end
