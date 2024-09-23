@implementation MSCMSAppleHashAgilityV2Attribute

- (NSDictionary)hashAgilityValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashAgilityValues, 0);
}

- (MSCMSAppleHashAgilityV2Attribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6;
  MSCMSAppleHashAgilityV2Attribute *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  MSCMSAppleHashAgilityV2Attribute *v24;
  MSCMSAppleHashAgilityV2Attribute *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSCMSAppleHashAgilityV2Attribute;
  v7 = -[MSCMSAppleHashAgilityV2Attribute init](&v33, sel_init);
  objc_msgSend(v6, "attributeValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v6, "attributeValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "attributeValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v26 = v7;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v27 = 0u;
          v28 = 0u;
          v19 = nsheim_decode_AppleAgileHash(v18);
          if (v19)
          {
            v7 = v26;
            if (a4)
            {
              +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v19, *a4, CFSTR("unable to decode Apple Hash Agility V2 Agile Hash"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_20;
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *((_QWORD *)&v28 + 1), (_QWORD)v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", &v27, a4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "OIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            v23 = v20 == 0;
          else
            v23 = 1;
          if (v23)
          {
            free_AppleAgileHash();

            v7 = v26;
LABEL_20:

            v24 = 0;
            goto LABEL_21;
          }
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v22);
          free_AppleAgileHash();

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        v7 = v26;
        if (v15)
          continue;
        break;
      }
    }

    v7 = -[MSCMSAppleHashAgilityV2Attribute initWithHashAgilityValues:](v7, "initWithHashAgilityValues:", v12);
    v24 = v7;
LABEL_21:

  }
  else if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -50, *a4, CFSTR("Apple Hash Agility V2 Attribute must have one value"));
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (MSCMSAppleHashAgilityV2Attribute)initWithHashAgilityValues:(id)a3
{
  id v5;
  MSCMSAppleHashAgilityV2Attribute *v6;
  MSCMSAppleHashAgilityV2Attribute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSCMSAppleHashAgilityV2Attribute;
  v6 = -[MSCMSAppleHashAgilityV2Attribute init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hashAgilityValues, a3);

  return v7;
}

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113635.100.9.2"), 0);
}

- (id)encodeAttributeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  int v22;
  MSCMSAttribute *v23;
  void *v24;
  MSCMSAttribute *v25;
  uint64_t v26;
  int v27;
  id *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v33;
  MSCMSAppleHashAgilityV2Attribute *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[MSCMSAppleHashAgilityV2Attribute hashAgilityValues](self, "hashAgilityValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = self;
  -[MSCMSAppleHashAgilityV2Attribute hashAgilityValues](self, "hashAgilityValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v9)
  {
    v10 = v9;
    obj = v8;
    v33 = *(_QWORD *)v36;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v33)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11);
      -[MSCMSAppleHashAgilityV2Attribute hashAgilityValues](v34, "hashAgilityValues", obj);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", v12, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_18;
      v16 = v15;
      v17 = v7;
      objc_msgSend(v15, "Asn1OID");
      v18 = objc_retainAutorelease(v14);
      objc_msgSend(v18, "bytes");
      objc_msgSend(v18, "length");
      v19 = length_AppleAgileHash();
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        break;
      v21 = objc_retainAutorelease(v20);
      objc_msgSend(v21, "mutableBytes");
      v22 = encode_AppleAgileHash();
      if (v22)
      {
        v27 = v22;

        v26 = v27;
        goto LABEL_15;
      }
      if (v19)
        asn1_abort();
      v7 = v17;
      objc_msgSend(v17, "addObject:", v21);

      if (v10 == ++v11)
      {
        v8 = obj;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v26 = 12;
LABEL_15:
    v7 = v17;
    if (a3)
    {
      v28 = a3;
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      v40 = CFSTR("Failed encoding type AppleAgileHash");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v26, v30);
      *v28 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_18:

    v25 = 0;
    v24 = obj;
    goto LABEL_19;
  }
LABEL_12:

  v23 = [MSCMSAttribute alloc];
  +[MSOID OIDWithString:error:](MSOID, "OIDWithString:error:", CFSTR("1.2.840.113635.100.9.2"), a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[MSCMSAttribute initWithAttributeType:values:](v23, "initWithAttributeType:values:", v24, v7);
LABEL_19:

  return v25;
}

@end
