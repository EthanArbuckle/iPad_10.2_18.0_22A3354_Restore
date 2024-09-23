@implementation MSOID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OIDString, 0);
  objc_storeStrong((id *)&self->_OIDBytes, 0);
}

- (void)dealloc
{
  objc_super v3;

  der_free_oid();
  v3.receiver = self;
  v3.super_class = (Class)MSOID;
  -[MSOID dealloc](&v3, sel_dealloc);
}

- (heim_oid)Asn1OID
{
  unint64_t v2;
  unsigned int *v3;
  _QWORD v4[2];
  heim_oid result;

  objc_copyStruct(v4, &self->_Asn1OID, 16, 1, 0);
  v2 = v4[0];
  v3 = (unsigned int *)v4[1];
  result.components = v3;
  result.length = v2;
  return result;
}

- (BOOL)setAsn1OidFromOIDString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int *v15;
  unsigned int *v16;
  BOOL v17;
  uint64_t v19;
  _QWORD v20[5];
  _WORD v21[2];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ((unint64_t)objc_msgSend(v6, "length") >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invertedSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v9);
      v12 = v11;

      objc_msgSend(v7, "getCharacters:range:", v21, 0, 2);
      if (v21[1] == 46 && v21[0] - 51 > 0xFFFFFFFC && v10 == 0x7FFFFFFFFFFFFFFFLL && !v12)
      {
        objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && objc_msgSend(v13, "count"))
        {
          v15 = (unsigned int *)malloc_type_malloc(4 * objc_msgSend(v14, "count"), 0x100004052888210uLL);
          if (v15)
          {
            v16 = v15;
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __39__MSOID_setAsn1OidFromOIDString_error___block_invoke;
            v20[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
            v20[4] = v15;
            objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
            self->_Asn1OID.length = objc_msgSend(v14, "count");
            self->_Asn1OID.components = v16;
            v17 = 1;
LABEL_20:

            goto LABEL_14;
          }
          +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -108, *a4, CFSTR("could allocate OID components"), v19);
        }
        else
        {
          if (!a4)
          {
            v17 = 0;
            goto LABEL_20;
          }
          +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -108, *a4, CFSTR("could not parse OID into parts %@"), v7);
        }
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
  }
  if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -50, *a4, CFSTR("missing or invalid OID string %@"), v7);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

- (MSOID)initWithAsn1OID:(heim_oid *)a3 error:(id *)a4
{
  MSOID *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  NSData *OIDBytes;
  NSData *v14;
  uint64_t v15;
  NSString *OIDString;
  MSOID *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MSOID;
  v6 = -[MSOID init](&v19, sel_init);
  if (!v6)
    goto LABEL_7;
  v7 = der_copy_oid();
  if (v7)
  {
    if (a4)
    {
      v8 = MSErrorASN1Domain[0];
      v9 = v7;
      v10 = *a4;
      v11 = CFSTR("unable to copy OID");
LABEL_13:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v8, v9, v10, v11);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  NSDataFromIntegerArray(a3->components, a3->length);
  v12 = objc_claimAutoreleasedReturnValue();
  OIDBytes = v6->_OIDBytes;
  v6->_OIDBytes = (NSData *)v12;

  v14 = v6->_OIDBytes;
  if (!v14)
  {
    if (!a4)
      goto LABEL_14;
    v8 = MSErrorAllocationDomain[0];
    v10 = *a4;
    v11 = CFSTR("could not parse OID into data");
LABEL_12:
    v9 = -108;
    goto LABEL_13;
  }
  NSStringFromOIDData(v14);
  v15 = objc_claimAutoreleasedReturnValue();
  OIDString = v6->_OIDString;
  v6->_OIDString = (NSString *)v15;

  if (!v6->_OIDString)
  {
    if (!a4)
      goto LABEL_14;
    v8 = MSErrorAllocationDomain[0];
    v10 = *a4;
    v11 = CFSTR("could not parse OID into string");
    goto LABEL_12;
  }
LABEL_7:
  v17 = v6;
LABEL_15:

  return v17;
}

+ (id)OIDWithString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:error:", v6, a4);

  return v7;
}

- (MSOID)initWithString:(id)a3 error:(id *)a4
{
  id v7;
  MSOID *v8;
  MSOID *v9;
  uint64_t v10;
  NSData *OIDBytes;
  MSOID *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSOID;
  v8 = -[MSOID init](&v14, sel_init);
  v9 = v8;
  if (!v8
    || (objc_storeStrong((id *)&v8->_OIDString, a3),
        -[MSOID setAsn1OidFromOIDString:error:](v9, "setAsn1OidFromOIDString:error:", v7, a4))
    && (NSDataFromIntegerArray(v9->_Asn1OID.components, v9->_Asn1OID.length),
        v10 = objc_claimAutoreleasedReturnValue(),
        OIDBytes = v9->_OIDBytes,
        v9->_OIDBytes = (NSData *)v10,
        OIDBytes,
        v9->_OIDBytes))
  {
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "OIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", self->_OIDString))
    {
      objc_msgSend(v4, "OIDBytes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToData:", self->_OIDBytes);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __39__MSOID_setAsn1OidFromOIDString_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v13;
  id v14;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  if (!objc_msgSend(v14, "length"))
  {

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v10) == 0x7FFFFFFFFFFFFFFFLL && v11 == 0;

  if (!v8 || !v13)
  {

    if (v13)
      goto LABEL_14;
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  *(_DWORD *)(v8 + 4 * a3) = objc_msgSend(v14, "intValue");

LABEL_14:
}

- (NSString)OIDString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)OIDBytes
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MSOID OIDBytes](self, "OIDBytes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (__CFString)secKeyAlgorithm
{
  __CFString *v3;

  if (secKeyAlgorithm_onceToken != -1)
    dispatch_once(&secKeyAlgorithm_onceToken, &__block_literal_global_126);
  objc_msgSend((id)secKeyAlgorithm_sAlgorithmOIDToKeyAlgorithm, "objectForKeyedSubscript:", self->_OIDString);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (const)ccdigest
{
  if (-[NSString isEqual:](self->_OIDString, "isEqual:", CFSTR("1.2.840.113549.2.5")))
    return (const ccdigest_info *)ccmd5_di();
  if (-[NSString isEqual:](self->_OIDString, "isEqual:", CFSTR("1.3.14.3.2.26")))
    return (const ccdigest_info *)ccsha1_di();
  if (-[NSString isEqual:](self->_OIDString, "isEqual:", CFSTR("2.16.840.1.101.3.4.2.4")))
    return (const ccdigest_info *)ccsha224_di();
  if (-[NSString isEqual:](self->_OIDString, "isEqual:", CFSTR("2.16.840.1.101.3.4.2.1")))
    return (const ccdigest_info *)ccsha256_di();
  if (-[NSString isEqual:](self->_OIDString, "isEqual:", CFSTR("2.16.840.1.101.3.4.2.2")))
    return (const ccdigest_info *)ccsha384_di();
  if (-[NSString isEqual:](self->_OIDString, "isEqual:", CFSTR("2.16.840.1.101.3.4.2.3")))
    return (const ccdigest_info *)ccsha512_di();
  return 0;
}

+ (id)OIDWithAsn1OID:(heim_oid *)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAsn1OID:error:", a3, a4);
}

- (BOOL)isEqualToString:(id)a3
{
  return -[NSString isEqualToString:](self->_OIDString, "isEqualToString:", a3);
}

+ (id)OIDWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:error:", v6, a4);

  return v7;
}

+ (id)digestOIDWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initDigestOIDWithSignatureAlgorithm:error:", v6, a4);

  return v7;
}

+ (id)signatureAlgorithmOIDWithSecKeyAlgorithm:(__CFString *)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initSignatureOIDWithSecKeyAlgorithm:error:", a3, a4);
}

+ (id)RSASignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initRSASignatureOIDWithDigestAlgorithm:error:", v6, a4);

  return v7;
}

+ (id)ECSignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initECSignatureOIDWithDigestAlgorithm:error:", v6, a4);

  return v7;
}

- (MSOID)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  MSOID *v8;
  MSOID *v9;
  uint64_t v10;
  NSString *OIDString;
  NSString *v12;
  MSOID *v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSOID;
  v8 = -[MSOID init](&v15, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  objc_storeStrong((id *)&v8->_OIDBytes, a3);
  NSStringFromOIDData(v7);
  v10 = objc_claimAutoreleasedReturnValue();
  OIDString = v9->_OIDString;
  v9->_OIDString = (NSString *)v10;

  v12 = v9->_OIDString;
  if (!v12)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -108, *a4, CFSTR("could not parse OID into string"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if (!-[MSOID setAsn1OidFromOIDString:error:](v9, "setAsn1OidFromOIDString:error:", v12, a4))
    goto LABEL_7;
LABEL_4:
  v13 = v9;
LABEL_8:

  return v13;
}

- (id)initDigestOIDWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;

  v6 = a3;
  if (initDigestOIDWithSignatureAlgorithm_error__onceToken != -1)
    dispatch_once(&initDigestOIDWithSignatureAlgorithm_error__onceToken, &__block_literal_global_1);
  v7 = (void *)initDigestOIDWithSignatureAlgorithm_error__sSigAlgToDigAlg;
  objc_msgSend(v6, "OIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v10 = MSErrorCryptoDomain[0];
    v11 = *a4;
    objc_msgSend(v6, "OIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v10, -50, v11, CFSTR("MSOID %@ does not indicate a digest algorithm"), v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

void __51__MSOID_initDigestOIDWithSignatureAlgorithm_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1.2.840.113549.1.1.4");
  v2[1] = CFSTR("1.2.840.113549.1.1.5");
  v3[0] = CFSTR("1.2.840.113549.2.5");
  v3[1] = CFSTR("1.3.14.3.2.26");
  v2[2] = CFSTR("1.2.840.10045.4.1");
  v2[3] = CFSTR("1.2.840.113549.1.1.14");
  v3[2] = CFSTR("1.3.14.3.2.26");
  v3[3] = CFSTR("2.16.840.1.101.3.4.2.4");
  v2[4] = CFSTR("1.2.840.10045.4.3.1");
  v2[5] = CFSTR("1.2.840.113549.1.1.11");
  v3[4] = CFSTR("2.16.840.1.101.3.4.2.4");
  v3[5] = CFSTR("2.16.840.1.101.3.4.2.1");
  v2[6] = CFSTR("1.2.840.10045.4.3.2");
  v2[7] = CFSTR("1.2.840.113549.1.1.12");
  v3[6] = CFSTR("2.16.840.1.101.3.4.2.1");
  v3[7] = CFSTR("2.16.840.1.101.3.4.2.2");
  v2[8] = CFSTR("1.2.840.10045.4.3.3");
  v2[9] = CFSTR("1.2.840.113549.1.1.13");
  v3[8] = CFSTR("2.16.840.1.101.3.4.2.2");
  v3[9] = CFSTR("2.16.840.1.101.3.4.2.3");
  v2[10] = CFSTR("1.2.840.10045.4.3.4");
  v3[10] = CFSTR("2.16.840.1.101.3.4.2.3");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initDigestOIDWithSignatureAlgorithm_error__sSigAlgToDigAlg;
  initDigestOIDWithSignatureAlgorithm_error__sSigAlgToDigAlg = v0;

}

- (id)initRSASignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;

  v6 = a3;
  if (initRSASignatureOIDWithDigestAlgorithm_error__onceToken != -1)
    dispatch_once(&initRSASignatureOIDWithDigestAlgorithm_error__onceToken, &__block_literal_global_119);
  v7 = (void *)initRSASignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  objc_msgSend(v6, "OIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v10 = MSErrorCryptoDomain[0];
    v11 = *a4;
    objc_msgSend(v6, "OIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v10, -50, v11, CFSTR("MSOID %@ does not indicate a signature algorithm"), v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

void __54__MSOID_initRSASignatureOIDWithDigestAlgorithm_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1.2.840.113549.2.5");
  v2[1] = CFSTR("1.3.14.3.2.26");
  v3[0] = CFSTR("1.2.840.113549.1.1.4");
  v3[1] = CFSTR("1.2.840.113549.1.1.5");
  v2[2] = CFSTR("2.16.840.1.101.3.4.2.4");
  v2[3] = CFSTR("2.16.840.1.101.3.4.2.1");
  v3[2] = CFSTR("1.2.840.113549.1.1.14");
  v3[3] = CFSTR("1.2.840.113549.1.1.11");
  v2[4] = CFSTR("2.16.840.1.101.3.4.2.2");
  v2[5] = CFSTR("2.16.840.1.101.3.4.2.3");
  v3[4] = CFSTR("1.2.840.113549.1.1.12");
  v3[5] = CFSTR("1.2.840.113549.1.1.13");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initRSASignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  initRSASignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg = v0;

}

- (id)initECSignatureOIDWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;

  v6 = a3;
  if (initECSignatureOIDWithDigestAlgorithm_error__onceToken != -1)
    dispatch_once(&initECSignatureOIDWithDigestAlgorithm_error__onceToken, &__block_literal_global_122);
  v7 = (void *)initECSignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  objc_msgSend(v6, "OIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v10 = MSErrorCryptoDomain[0];
    v11 = *a4;
    objc_msgSend(v6, "OIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v10, -50, v11, CFSTR("MSOID %@ does not indicate a signature algorithm"), v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

void __53__MSOID_initECSignatureOIDWithDigestAlgorithm_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1.3.14.3.2.26");
  v2[1] = CFSTR("2.16.840.1.101.3.4.2.4");
  v3[0] = CFSTR("1.2.840.10045.4.1");
  v3[1] = CFSTR("1.2.840.10045.4.3.1");
  v2[2] = CFSTR("2.16.840.1.101.3.4.2.1");
  v2[3] = CFSTR("2.16.840.1.101.3.4.2.2");
  v3[2] = CFSTR("1.2.840.10045.4.3.2");
  v3[3] = CFSTR("1.2.840.10045.4.3.3");
  v2[4] = CFSTR("2.16.840.1.101.3.4.2.3");
  v3[4] = CFSTR("1.2.840.10045.4.3.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initECSignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg;
  initECSignatureOIDWithDigestAlgorithm_error__sDigAlgToSigAlg = v0;

}

- (id)initSignatureOIDWithSecKeyAlgorithm:(__CFString *)a3 error:(id *)a4
{
  void *v7;
  void *v8;

  if (initSignatureOIDWithSecKeyAlgorithm_error__onceToken != -1)
    dispatch_once(&initSignatureOIDWithSecKeyAlgorithm_error__onceToken, &__block_literal_global_123);
  objc_msgSend((id)initSignatureOIDWithSecKeyAlgorithm_error__sKeyAlgorithmToSignatureAlgorithm, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCryptoDomain[0], -50, *a4, CFSTR("SecKeyAlgorithm %@ does not indicate a signature algorithm"), a3);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __51__MSOID_initSignatureOIDWithSecKeyAlgorithm_error___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[22];
  _QWORD v14[23];

  v14[22] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD6E80];
  v13[0] = *MEMORY[0x1E0CD6E50];
  v13[1] = v0;
  v14[0] = CFSTR("1.2.840.113549.1.1.4");
  v14[1] = CFSTR("1.2.840.113549.1.1.4");
  v1 = *MEMORY[0x1E0CD6E88];
  v13[2] = *MEMORY[0x1E0CD6E58];
  v13[3] = v1;
  v14[2] = CFSTR("1.2.840.113549.1.1.5");
  v14[3] = CFSTR("1.2.840.113549.1.1.5");
  v2 = *MEMORY[0x1E0CD6DE0];
  v13[4] = *MEMORY[0x1E0CD6DA0];
  v13[5] = v2;
  v14[4] = CFSTR("1.2.840.10045.4.1");
  v14[5] = CFSTR("1.2.840.10045.4.1");
  v3 = *MEMORY[0x1E0CD6E90];
  v13[6] = *MEMORY[0x1E0CD6E60];
  v13[7] = v3;
  v14[6] = CFSTR("1.2.840.113549.1.1.14");
  v14[7] = CFSTR("1.2.840.113549.1.1.14");
  v4 = *MEMORY[0x1E0CD6DE8];
  v13[8] = *MEMORY[0x1E0CD6DA8];
  v13[9] = v4;
  v14[8] = CFSTR("1.2.840.10045.4.3.1");
  v14[9] = CFSTR("1.2.840.10045.4.3.1");
  v5 = *MEMORY[0x1E0CD6E98];
  v13[10] = *MEMORY[0x1E0CD6E68];
  v13[11] = v5;
  v14[10] = CFSTR("1.2.840.113549.1.1.11");
  v14[11] = CFSTR("1.2.840.113549.1.1.11");
  v6 = *MEMORY[0x1E0CD6DF8];
  v13[12] = *MEMORY[0x1E0CD6DB0];
  v13[13] = v6;
  v14[12] = CFSTR("1.2.840.10045.4.3.2");
  v14[13] = CFSTR("1.2.840.10045.4.3.2");
  v7 = *MEMORY[0x1E0CD6EA0];
  v13[14] = *MEMORY[0x1E0CD6E70];
  v13[15] = v7;
  v14[14] = CFSTR("1.2.840.113549.1.1.12");
  v14[15] = CFSTR("1.2.840.113549.1.1.12");
  v8 = *MEMORY[0x1E0CD6E00];
  v13[16] = *MEMORY[0x1E0CD6DB8];
  v13[17] = v8;
  v14[16] = CFSTR("1.2.840.10045.4.3.3");
  v14[17] = CFSTR("1.2.840.10045.4.3.3");
  v9 = *MEMORY[0x1E0CD6EA8];
  v13[18] = *MEMORY[0x1E0CD6E78];
  v13[19] = v9;
  v14[18] = CFSTR("1.2.840.113549.1.1.13");
  v14[19] = CFSTR("1.2.840.113549.1.1.13");
  v10 = *MEMORY[0x1E0CD6E08];
  v13[20] = *MEMORY[0x1E0CD6DC0];
  v13[21] = v10;
  v14[20] = CFSTR("1.2.840.10045.4.3.4");
  v14[21] = CFSTR("1.2.840.10045.4.3.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 22);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)initSignatureOIDWithSecKeyAlgorithm_error__sKeyAlgorithmToSignatureAlgorithm;
  initSignatureOIDWithSecKeyAlgorithm_error__sKeyAlgorithmToSignatureAlgorithm = v11;

}

void __24__MSOID_secKeyAlgorithm__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[11];
  _QWORD v13[12];

  v13[11] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD6E50];
  v12[0] = CFSTR("1.2.840.113549.1.1.4");
  v12[1] = CFSTR("1.2.840.113549.1.1.5");
  v1 = *MEMORY[0x1E0CD6E58];
  v13[0] = v0;
  v13[1] = v1;
  v2 = *MEMORY[0x1E0CD6E60];
  v12[2] = CFSTR("1.2.840.113549.1.1.14");
  v12[3] = CFSTR("1.2.840.113549.1.1.11");
  v3 = *MEMORY[0x1E0CD6E68];
  v13[2] = v2;
  v13[3] = v3;
  v4 = *MEMORY[0x1E0CD6E70];
  v12[4] = CFSTR("1.2.840.113549.1.1.12");
  v12[5] = CFSTR("1.2.840.113549.1.1.13");
  v5 = *MEMORY[0x1E0CD6E78];
  v13[4] = v4;
  v13[5] = v5;
  v6 = *MEMORY[0x1E0CD6DA0];
  v12[6] = CFSTR("1.2.840.10045.4.1");
  v12[7] = CFSTR("1.2.840.10045.4.3.1");
  v7 = *MEMORY[0x1E0CD6DA8];
  v13[6] = v6;
  v13[7] = v7;
  v8 = *MEMORY[0x1E0CD6DB0];
  v12[8] = CFSTR("1.2.840.10045.4.3.2");
  v12[9] = CFSTR("1.2.840.10045.4.3.3");
  v9 = *MEMORY[0x1E0CD6DB8];
  v13[8] = v8;
  v13[9] = v9;
  v12[10] = CFSTR("1.2.840.10045.4.3.4");
  v13[10] = *MEMORY[0x1E0CD6DC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)secKeyAlgorithm_sAlgorithmOIDToKeyAlgorithm;
  secKeyAlgorithm_sAlgorithmOIDToKeyAlgorithm = v10;

}

@end
