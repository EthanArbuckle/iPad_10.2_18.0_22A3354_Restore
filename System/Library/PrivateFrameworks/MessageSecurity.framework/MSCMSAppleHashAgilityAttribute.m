@implementation MSCMSAppleHashAgilityAttribute

- (NSData)hashAgilityValue
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashAgilityValue, 0);
}

- (MSCMSAppleHashAgilityAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6;
  MSCMSAppleHashAgilityAttribute *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  MSCMSAppleHashAgilityAttribute *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MSCMSAppleHashAgilityAttribute;
  v7 = -[MSCMSAppleHashAgilityAttribute init](&v20, sel_init);
  objc_msgSend(v6, "attributeValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
  {
    if (a4)
    {
      v13 = MSErrorCMSDomain[0];
      v15 = *a4;
      v16 = CFSTR("Apple Hash Agility Attribute should only have one value");
      v14 = -50;
      goto LABEL_7;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "attributeValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = nsheim_decode_AppleHashAgilityValue(v11);

  if (v12)
  {
    if (a4)
    {
      v13 = MSErrorASN1Domain[0];
      v14 = v12;
      v15 = *a4;
      v16 = CFSTR("unable to decode Apple Hash Agility Attribute");
LABEL_7:
      +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v13, v14, v15, v16);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    free_AppleHashAgilityValue();
    v7 = -[MSCMSAppleHashAgilityAttribute initWithHashAgilityValue:](v7, "initWithHashAgilityValue:", v18);
    v17 = v7;
  }
  else
  {
    v17 = 0;
  }

LABEL_13:
  return v17;
}

- (MSCMSAppleHashAgilityAttribute)initWithHashAgilityValue:(id)a3
{
  id v5;
  MSCMSAppleHashAgilityAttribute *v6;
  MSCMSAppleHashAgilityAttribute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSAppleHashAgilityAttribute;
  v6 = -[MSCMSAppleHashAgilityAttribute init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hashAgilityValue, a3);

  return v7;
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113635.100.9.1"), 0);
}

- (id)encodeAttributeWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MSCMSAttribute *v13;
  void *v14;
  void *v15;
  MSCMSAttribute *v16;
  MSCMSAppleHashAgilityV2Attribute *v18;
  SEL v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[NSData length](self->_hashAgilityValue, "length");
  -[NSData bytes](self->_hashAgilityValue, "bytes");
  v20 = 0;
  v5 = length_AppleHashAgilityValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = 12;
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "mutableBytes");
  v8 = encode_AppleHashAgilityValue();
  if (v8)
  {
    v9 = v8;

    v10 = v9;
    if (!a3)
    {
LABEL_5:
      v7 = 0;
      goto LABEL_9;
    }
LABEL_4:
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = CFSTR("Failed encoding type AppleHashAgilityValue");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v10, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (v5)
  {
    v18 = (MSCMSAppleHashAgilityV2Attribute *)asn1_abort();
    return -[MSCMSAppleHashAgilityV2Attribute attributeType](v18, v19);
  }
LABEL_9:
  if (objc_msgSend(v7, "length", v20))
  {
    v13 = [MSCMSAttribute alloc];
    +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113635.100.9.1"), a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MSCMSAttribute initWithAttributeType:values:](v13, "initWithAttributeType:values:", v14, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
