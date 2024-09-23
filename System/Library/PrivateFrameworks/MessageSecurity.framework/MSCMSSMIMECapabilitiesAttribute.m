@implementation MSCMSSMIMECapabilitiesAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.15"), 0);
}

- (MSCMSSMIMECapabilitiesAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6;
  MSCMSSMIMECapabilitiesAttribute *v7;
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
  MSCMSSMIMECapabilitiesAttribute *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MSCMSSMIMECapabilitiesAttribute;
  v7 = -[MSCMSSMIMECapabilitiesAttribute init](&v24, sel_init);
  objc_msgSend(v6, "attributeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("1.2.840.113549.1.9.15"));

  if ((v9 & 1) == 0)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      v17 = *a4;
      v18 = CFSTR("Not an SMIMECapabilities attribute according to AttributeType");
      v16 = -26275;
      goto LABEL_10;
    }
LABEL_11:
    v19 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "attributeValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 != 1)
  {
    if (a4)
    {
      v15 = MSErrorCMSDomain[0];
      v17 = *a4;
      v18 = CFSTR("SMIME Capabilities Attribute should only have one value");
      v16 = -50;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v22 = 0;
  v23 = 0;
  objc_msgSend(v6, "attributeValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)nsheim_decode_SMIMECapabilities(v13);

  if (!(_DWORD)v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_capabilities, v20);
    free_SMIMECapabilities();
    v19 = v7;

    goto LABEL_13;
  }
  if (!a4)
    goto LABEL_11;
  asn1ErrorToNSError(v14, a4);
  v15 = MSErrorASN1Domain[0];
  v16 = (int)v14;
  v17 = *a4;
  v18 = CFSTR("unable to decode SMIME Capabilities Attribute");
LABEL_10:
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v15, v16, v17, v18);
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v19;
}

- (MSCMSSMIMECapabilitiesAttribute)init
{
  MSCMSSMIMECapabilitiesAttribute *v2;
  NSSet *v3;
  uint64_t i;
  MSOID *v5;
  uint64_t v6;
  MSOID *v7;
  id v8;
  NSSet *capabilities;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MSCMSSMIMECapabilitiesAttribute;
  v2 = -[MSCMSSMIMECapabilitiesAttribute init](&v12, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 56; i += 8)
  {
    v5 = [MSOID alloc];
    v6 = *(uint64_t *)((char *)&off_1EA961FA0 + i);
    v11 = 0;
    v7 = -[MSOID initWithAsn1OID:error:](v5, "initWithAsn1OID:error:", v6, &v11);
    v8 = v11;
    -[NSSet addObject:](v3, "addObject:", v7);

  }
  capabilities = v2->_capabilities;
  v2->_capabilities = v3;

  return v2;
}

- (MSCMSSMIMECapabilitiesAttribute)initWithCapabilities:(id)a3
{
  NSSet *v4;
  MSCMSSMIMECapabilitiesAttribute *v5;
  NSSet *capabilities;
  objc_super v8;

  v4 = (NSSet *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MSCMSSMIMECapabilitiesAttribute;
  v5 = -[MSCMSSMIMECapabilitiesAttribute init](&v8, sel_init);
  capabilities = v5->_capabilities;
  v5->_capabilities = v4;

  return v5;
}

- (id)copyAttributeData:(id *)a3
{
  NSSet *capabilities;
  void *v6;
  NSSet *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id result;
  _QWORD v17[6];
  _QWORD v18[4];
  __int128 v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  capabilities = self->_capabilities;
  if (!capabilities)
    return 0;
  v19 = -[NSSet count](capabilities, "count");
  v6 = malloc_type_malloc(24 * v19, 0x10300406712BA52uLL);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v7 = self->_capabilities;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__MSCMSSMIMECapabilitiesAttribute_copyAttributeData___block_invoke;
  v17[3] = &unk_1EA961FE0;
  v17[4] = v18;
  v17[5] = v6;
  -[NSSet enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v17);
  *((_QWORD *)&v19 + 1) = v6;
  v8 = length_SMIMECapabilities();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = 12;
    if (!a3)
    {
LABEL_9:
      v10 = 0;
LABEL_11:
      free(v6);
      *((_QWORD *)&v19 + 1) = 0;
      v13 = v10;
      _Block_object_dispose(v18, 8);

      return v13;
    }
LABEL_8:
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("Failed encoding type SMIMECapabilities");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v12, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "mutableBytes");
  v11 = encode_SMIMECapabilities();
  if (v11)
  {

    v12 = v11;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (!v8)
    goto LABEL_11;
  result = (id)asn1_abort();
  __break(1u);
  return result;
}

uint64_t __53__MSCMSSMIMECapabilitiesAttribute_copyAttributeData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;

  v3 = (uint64_t *)(*(_QWORD *)(a1 + 40) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  result = objc_msgSend(a2, "Asn1OID");
  *v3 = result;
  v3[1] = v5;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)encodeAttributeWithError:(id *)a3
{
  id v4;
  MSCMSAttribute *v5;
  void *v6;
  void *v7;
  MSCMSAttribute *v8;

  v4 = -[MSCMSSMIMECapabilitiesAttribute copyAttributeData:](self, "copyAttributeData:");
  if (v4)
  {
    v5 = [MSCMSAttribute alloc];
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113549.1.9.15"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MSCMSAttribute initWithAttributeType:values:](v5, "initWithAttributeType:values:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSSet)capabilities
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
