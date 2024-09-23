@implementation MSAlgorithmIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_asn1AlgId)
  {
    free_AlgorithmIdentifier();
    free(self->_asn1AlgId);
    self->_asn1AlgId = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)MSAlgorithmIdentifier;
  -[MSAlgorithmIdentifier dealloc](&v3, sel_dealloc);
}

+ (MSAlgorithmIdentifier)algorithmIdentifierWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4
{
  return (MSAlgorithmIdentifier *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAsn1AlgId:error:", a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSData *parameters;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "algorithm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", self->_algorithm))
    {
      v11 = 0;
      goto LABEL_16;
    }
    parameters = self->_parameters;
    if (parameters)
    {
LABEL_4:
      objc_msgSend(v5, "parameters");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "parameters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToData:", self->_parameters);

        if (!parameters)
          goto LABEL_15;
      }
      else
      {
        v11 = 0;
        if (!parameters)
          goto LABEL_15;
      }
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v5, "parameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_parameters)
        goto LABEL_4;
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }
LABEL_15:

    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (NSData)parameters
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)hash
{
  NSData *parameters;
  void *v4;
  unint64_t v5;
  void *v6;

  parameters = self->_parameters;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  if (parameters)
  {
    -[MSAlgorithmIdentifier parameters](self, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(v6, "hash");

  }
  return v5;
}

- (MSOID)algorithm
{
  return (MSOID *)objc_getProperty(self, a2, 8, 1);
}

- (MSAlgorithmIdentifier)initWithAsn1AlgId:(AlgorithmIdentifier *)a3 error:(id *)a4
{
  MSAlgorithmIdentifier *v6;
  AlgorithmIdentifier *v7;
  int v8;
  MSAlgorithmIdentifier *v9;
  uint64_t v10;
  MSOID *algorithm;
  heim_base_data *var1;
  void *v13;
  uint64_t v14;
  NSData *parameters;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MSAlgorithmIdentifier;
  v6 = -[MSAlgorithmIdentifier init](&v17, sel_init);
  if (!v6)
  {
LABEL_14:
    v9 = v6;
    goto LABEL_16;
  }
  v7 = (AlgorithmIdentifier *)malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  v6->_asn1AlgId = v7;
  if (!v7)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -108, *a4, CFSTR("unable to allocate Algorithm Identifier"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v8 = copy_AlgorithmIdentifier();
  if (!v8)
  {
    +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", v6->_asn1AlgId, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    algorithm = v6->_algorithm;
    v6->_algorithm = (MSOID *)v10;

    if (v6->_algorithm)
    {
      var1 = v6->_asn1AlgId->var1;
      if (var1)
      {
        if (var1->var0)
        {
          v13 = var1->var1;
          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, a3->var1->var0);
            v14 = objc_claimAutoreleasedReturnValue();
            parameters = v6->_parameters;
            v6->_parameters = (NSData *)v14;

          }
        }
      }
      goto LABEL_14;
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v8, *a4, CFSTR("unable to copy Algorithm Identifier"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  free(v6->_asn1AlgId);
  v9 = 0;
  v6->_asn1AlgId = 0;
LABEL_16:

  return v9;
}

- (AlgorithmIdentifier)encode
{
  AlgorithmIdentifier *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (AlgorithmIdentifier *)malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  if (v3)
  {
    -[MSAlgorithmIdentifier algorithm](self, "algorithm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "Asn1OID");
    v15 = v5;

    der_copy_oid();
    -[MSAlgorithmIdentifier parameters](self, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v3->var1 = (heim_base_data *)malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      -[MSAlgorithmIdentifier parameters](self, "parameters", 0, 0, v14, v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        -[MSAlgorithmIdentifier parameters](self, "parameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "length");

        -[MSAlgorithmIdentifier parameters](self, "parameters", v12);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = (void *)objc_msgSend(v10, "bytes");

      }
      else
      {
        v12 = 2;
        v13 = &asn1NULL;
      }
      MEMORY[0x1DF0F2414](&v12, v3->var1);
    }
    else
    {
      v3->var1 = 0;
    }
  }
  return v3;
}

+ (MSAlgorithmIdentifier)algorithmIdentifierWithOID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOID:", v4);

  return (MSAlgorithmIdentifier *)v5;
}

+ (id)digestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initDigestAlgorithmWithSignatureAlgorithm:error:", v6, a4);

  return v7;
}

- (MSAlgorithmIdentifier)initWithOID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  MSAlgorithmIdentifier *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (algorithmOIDToParameters_onceToken != -1)
    dispatch_once(&algorithmOIDToParameters_onceToken, &__block_literal_global_68);
  objc_msgSend(v4, "OIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
    v9 = 0;
  else
    v9 = v5;

  v10 = -[MSAlgorithmIdentifier initWithOID:parameters:](self, "initWithOID:parameters:", v4, v9);
  return v10;
}

- (MSAlgorithmIdentifier)initWithOID:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  MSAlgorithmIdentifier *v9;
  MSAlgorithmIdentifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSAlgorithmIdentifier;
  v9 = -[MSAlgorithmIdentifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_algorithm, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
    v10->_asn1AlgId = -[MSAlgorithmIdentifier encode](v10, "encode");
  }

  return v10;
}

- (id)decode:(id)a3 error:(id *)a4
{
  MSAlgorithmIdentifier *v7;
  _QWORD v8[3];

  memset(v8, 0, sizeof(v8));
  if (nsheim_decode_AlgorithmIdentifier(a3))
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -26275, *a4, CFSTR("unable to decode Algorithm Identifier"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v7 = -[MSAlgorithmIdentifier initWithAsn1AlgId:error:](self, "initWithAsn1AlgId:error:", v8, a4);
    free_AlgorithmIdentifier();
    return v7;
  }
}

- (id)initDigestAlgorithmWithSignatureAlgorithm:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  MSAlgorithmIdentifier *v8;

  objc_msgSend(a3, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID digestOIDWithSignatureAlgorithm:error:](MSOID, "digestOIDWithSignatureAlgorithm:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[MSAlgorithmIdentifier initWithOID:](self, "initWithOID:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)signatureAlgorithmWithDigestAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id *v10;
  void *v11;
  int v12;
  __CFString *v14;
  id v15;
  void *v16;

  v6 = a3;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("1.2.840.113549.1.1.1"));

  if (v8)
  {
    objc_msgSend(v6, "algorithm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOID RSASignatureOIDWithDigestAlgorithm:error:](MSOID, "RSASignatureOIDWithDigestAlgorithm:error:", v9, a4);
    v10 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a4 = v10;
    goto LABEL_6;
  }
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("1.2.840.10045.2.1"));

  if (v12)
  {
    objc_msgSend(v6, "algorithm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOID ECSignatureOIDWithDigestAlgorithm:error:](MSOID, "ECSignatureOIDWithDigestAlgorithm:error:", v9, a4);
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a4)
    goto LABEL_7;
  v14 = MSErrorCryptoDomain[0];
  v15 = *a4;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v14, -50, v15, CFSTR("Algorithm Identifier %@ does not indicate a public key algorithm"), v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  a4 = 0;
LABEL_6:

LABEL_7:
  return a4;
}

- (unsigned)ccAlgorithm:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  if (ccAlgorithm__onceToken != -1)
    dispatch_once(&ccAlgorithm__onceToken, &__block_literal_global_2);
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)ccAlgorithm__knownEncryptionAlgs;
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v11, "unsignedIntValue");
    if (!a3)
      goto LABEL_13;
  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("unknown ccAlg -- unexpected encryption algorithm: %@"), v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v5 = (void *)v13;
    if (!a3)
      goto LABEL_13;
  }
  if (v5)
    *a3 = objc_retainAutorelease(v5);
LABEL_13:

  return v12;
}

void __37__MSAlgorithmIdentifier_ccAlgorithm___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[19];
  _QWORD v22[21];

  v22[19] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("1.3.14.3.2.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("1.3.14.3.2.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("1.2.840.113549.3.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = CFSTR("1.2.840.113549.3.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("2.16.840.1.101.3.4.1.1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = CFSTR("2.16.840.1.101.3.4.1.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = CFSTR("2.16.840.1.101.3.4.1.21");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("2.16.840.1.101.3.4.1.22");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = CFSTR("2.16.840.1.101.3.4.1.41");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = CFSTR("2.16.840.1.101.3.4.1.42");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = CFSTR("2.16.840.1.101.3.4.1.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = CFSTR("2.16.840.1.101.3.4.1.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = CFSTR("2.16.840.1.101.3.4.1.47");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = CFSTR("2.16.840.1.101.3.4.1.46");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = CFSTR("2.16.840.1.101.3.4.1.27");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = CFSTR("2.16.840.1.101.3.4.1.26");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = CFSTR("2.16.840.1.101.3.4.1.5");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = CFSTR("2.16.840.1.101.3.4.1.25");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = CFSTR("2.16.840.1.101.3.4.1.45");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 19);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)ccAlgorithm__knownEncryptionAlgs;
  ccAlgorithm__knownEncryptionAlgs = v10;

}

- (unsigned)ccMode:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  if (ccMode__onceToken != -1)
    dispatch_once(&ccMode__onceToken, &__block_literal_global_15);
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)ccMode__knownEncryptionAlgs, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntValue");
    if (!a3)
      goto LABEL_13;
  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("unknown ccMode -- unexpected encryption algorithm: %@"), v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v5 = (void *)v11;
    if (!a3)
      goto LABEL_13;
  }
  if (v5)
    *a3 = objc_retainAutorelease(v5);
LABEL_13:

  return v10;
}

void __32__MSAlgorithmIdentifier_ccMode___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];
  _QWORD v19[18];

  v19[16] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("1.3.14.3.2.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("1.3.14.3.2.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("1.2.840.113549.3.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("1.2.840.113549.3.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = CFSTR("2.16.840.1.101.3.4.1.1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v13;
  v18[5] = CFSTR("2.16.840.1.101.3.4.1.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v12;
  v18[6] = CFSTR("2.16.840.1.101.3.4.1.21");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v0;
  v18[7] = CFSTR("2.16.840.1.101.3.4.1.22");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v1;
  v18[8] = CFSTR("2.16.840.1.101.3.4.1.41");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v2;
  v18[9] = CFSTR("2.16.840.1.101.3.4.1.42");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v3;
  v18[10] = CFSTR("2.16.840.1.101.3.4.1.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v4;
  v18[11] = CFSTR("2.16.840.1.101.3.4.1.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v5;
  v18[12] = CFSTR("2.16.840.1.101.3.4.1.47");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v6;
  v18[13] = CFSTR("2.16.840.1.101.3.4.1.46");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[13] = v7;
  v18[14] = CFSTR("2.16.840.1.101.3.4.1.27");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[14] = v8;
  v18[15] = CFSTR("2.16.840.1.101.3.4.1.26");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[15] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 16);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)ccMode__knownEncryptionAlgs;
  ccMode__knownEncryptionAlgs = v10;

}

- (unint64_t)blockSize:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  if (blockSize__onceToken != -1)
    dispatch_once(&blockSize__onceToken, &__block_literal_global_18);
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)blockSize__knownEncryptionAlgs, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntValue");
    if (!a3)
      goto LABEL_13;
  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("unknown blockSize -- unexpected encryption algorithm: %@"), v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v5 = (void *)v11;
    if (!a3)
      goto LABEL_13;
  }
  if (v5)
    *a3 = objc_retainAutorelease(v5);
LABEL_13:

  return v10;
}

void __35__MSAlgorithmIdentifier_blockSize___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[19];
  _QWORD v22[21];

  v22[19] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("1.3.14.3.2.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("1.3.14.3.2.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("1.2.840.113549.3.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = CFSTR("1.2.840.113549.3.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("2.16.840.1.101.3.4.1.1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = CFSTR("2.16.840.1.101.3.4.1.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = CFSTR("2.16.840.1.101.3.4.1.21");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("2.16.840.1.101.3.4.1.22");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = CFSTR("2.16.840.1.101.3.4.1.41");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = CFSTR("2.16.840.1.101.3.4.1.42");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = CFSTR("2.16.840.1.101.3.4.1.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = CFSTR("2.16.840.1.101.3.4.1.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = CFSTR("2.16.840.1.101.3.4.1.47");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = CFSTR("2.16.840.1.101.3.4.1.46");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = CFSTR("2.16.840.1.101.3.4.1.27");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = CFSTR("2.16.840.1.101.3.4.1.26");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = CFSTR("2.16.840.1.101.3.4.1.5");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = CFSTR("2.16.840.1.101.3.4.1.25");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = CFSTR("2.16.840.1.101.3.4.1.45");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 19);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)blockSize__knownEncryptionAlgs;
  blockSize__knownEncryptionAlgs = v10;

}

- (unint64_t)keySize:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  if (a3 && *a3)
    v5 = (void *)objc_msgSend(*a3, "copy");
  else
    v5 = 0;
  if (keySize__onceToken != -1)
    dispatch_once(&keySize__onceToken, &__block_literal_global_21);
  -[MSAlgorithmIdentifier algorithm](self, "algorithm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)keySize__knownEncryptionAlgs, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "unsignedIntValue");
    if (!a3)
      goto LABEL_13;
  }
  else
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26275, v5, CFSTR("unknown keySize -- unexpected encryption algorithm: %@"), v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v5 = (void *)v11;
    if (!a3)
      goto LABEL_13;
  }
  if (v5)
    *a3 = objc_retainAutorelease(v5);
LABEL_13:

  return v10;
}

void __33__MSAlgorithmIdentifier_keySize___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[19];
  _QWORD v22[21];

  v22[19] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("1.3.14.3.2.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("1.3.14.3.2.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("1.2.840.113549.3.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = CFSTR("1.2.840.113549.3.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 128);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("2.16.840.1.101.3.4.1.1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = CFSTR("2.16.840.1.101.3.4.1.2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  v21[6] = CFSTR("2.16.840.1.101.3.4.1.21");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  v21[7] = CFSTR("2.16.840.1.101.3.4.1.22");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  v21[8] = CFSTR("2.16.840.1.101.3.4.1.41");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  v21[9] = CFSTR("2.16.840.1.101.3.4.1.42");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 32);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v0;
  v21[10] = CFSTR("2.16.840.1.101.3.4.1.7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v1;
  v21[11] = CFSTR("2.16.840.1.101.3.4.1.6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v2;
  v21[12] = CFSTR("2.16.840.1.101.3.4.1.47");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v3;
  v21[13] = CFSTR("2.16.840.1.101.3.4.1.46");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v4;
  v21[14] = CFSTR("2.16.840.1.101.3.4.1.27");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v5;
  v21[15] = CFSTR("2.16.840.1.101.3.4.1.26");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v6;
  v21[16] = CFSTR("2.16.840.1.101.3.4.1.5");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[16] = v7;
  v21[17] = CFSTR("2.16.840.1.101.3.4.1.25");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[17] = v8;
  v21[18] = CFSTR("2.16.840.1.101.3.4.1.45");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[18] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 19);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)keySize__knownEncryptionAlgs;
  keySize__knownEncryptionAlgs = v10;

}

- (AlgorithmIdentifier)asn1AlgId
{
  return self->_asn1AlgId;
}

@end
