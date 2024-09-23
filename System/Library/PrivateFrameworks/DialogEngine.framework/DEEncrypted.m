@implementation DEEncrypted

+ (id)getKey:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 1 > 3)
    return 0;
  +[DEVersionWriter dataWithHexString:](DEVersionWriter, "dataWithHexString:", off_1E7931E30[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isSymmetric:(unint64_t)a3
{
  return a3 == 2;
}

+ (BOOL)isPrivateKey:(id)a3 publicKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  char v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = CFSTR("Invalid private key: nil");
  if (!v5 || !v6)
    goto LABEL_8;
  v9 = objc_msgSend(v5, "length", CFSTR("Invalid private key: nil"));
  if (v9 != objc_msgSend(v7, "length") + 32)
  {
    v8 = CFSTR("Invalid private key: wrong length");
LABEL_8:
    +[DELogging error:](DELogging, "error:", v8);
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "subdataWithRange:", 0, objc_msgSend(v7, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToData:", v7);

  if ((v11 & 1) == 0)
  {
    v8 = CFSTR("Invalid private key: invalid prefix");
    goto LABEL_8;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

+ (id)getKeyWithVersion:(id)a3 symmetric:(BOOL *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_14;
  if (a4)
    *a4 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(&unk_1E79447A0, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(&unk_1E79447A0);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedIntegerValue");
        +[DEEncrypted getKey:](DEEncrypted, "getKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[DEVersionWriter versionData:](DEVersionWriter, "versionData:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToData:", v5);

          if (v12)
          {
            if (a4)
              *a4 = +[DEEncrypted isSymmetric:](DEEncrypted, "isSymmetric:", v9);
            goto LABEL_17;
          }
        }

      }
      v6 = objc_msgSend(&unk_1E79447A0, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v10 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
LABEL_14:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

+ (id)getKeyWithVersion:(id)a3
{
  +[DEEncrypted getKeyWithVersion:symmetric:](DEEncrypted, "getKeyWithVersion:symmetric:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getSymmetricSrc:(id)a3 publicKey:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v5);

  return v6;
}

+ (id)getSymmetricKey:(id)a3 symmetricKeyIV:(id)a4 signature:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    +[DEEncrypted getSymmetricSrc:publicKey:](DEEncrypted, "getSymmetricSrc:publicKey:", v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[DESecurityUtils verify:expected:publicKey:](DESecurityUtils, "verify:expected:publicKey:", v10, v12, v7))
    {
      +[DESecurityUtils getKeyFromData:](DESecurityUtils, "getKeyFromData:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

+ (id)getSymmetricKey:(id)a3 publicKey:(id)a4 symmetricKeyIV:(id *)a5 signature:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10 && a5 && a6)
  {
    *a5 = 0;
    *a6 = 0;
    +[DESecurityUtils getRandomIV](DESecurityUtils, "getRandomIV");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[DEEncrypted getSymmetricSrc:publicKey:](DEEncrypted, "getSymmetricSrc:publicKey:", v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[DESecurityUtils sign:privateKey:](DESecurityUtils, "sign:privateKey:", v14, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        +[DESecurityUtils getKeyFromData:](DESecurityUtils, "getKeyFromData:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          *a5 = objc_retainAutorelease(v13);
          *a6 = objc_retainAutorelease(v15);
          v16 = v12;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

+ (BOOL)decryptFrom:(id)a3 to:(id)a4 allowAllKeys:(BOOL)a5 keyVersion:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  DEMultipartReader *v13;
  DEDataReader *v14;
  DEDataReader *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  DEDecompressWriter *v24;
  DEDecompressWriter *v25;
  DECryptor *v26;
  DEHmac *v27;
  DEMultiWriter *v28;
  void *v29;
  DEMultiWriter *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  __int128 __dst;
  uint64_t v40;
  void *__p[2];
  uint64_t v42;
  void (**v43)(siri::dialogengine::CatUpdater::Encrypted *__hidden);
  uint64_t v44;
  unsigned __int8 v45;
  _QWORD v46[4];

  v7 = a5;
  v46[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (!v9 || !v10)
    goto LABEL_46;
  if ((objc_msgSend(v9, "isRewindable") & 1) == 0)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a6)
    *a6 = 0;
  v13 = -[DEMultipartReader initWithReader:]([DEMultipartReader alloc], "initWithReader:", v9);
  siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v43);
  __p[0] = 0;
  __p[1] = 0;
  v42 = 0;
  if (v13)
  {
    -[DEMultipartReader readData](v13, "readData");
    v14 = (DEDataReader *)objc_claimAutoreleasedReturnValue();
    if (!v14 || !-[DEMultipartReader nextPart](v13, "nextPart"))
    {
      v12 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v15 = objc_retainAutorelease(v14);
    std::string::basic_string[abi:ne180100](&__dst, (void *)-[DEDataReader bytes](v15, "bytes"), -[DEDataReader length](v15, "length"));
  }
  else
  {
    objc_msgSend(v9, "readData");
    v15 = (DEDataReader *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100](&__dst, (void *)-[DEDataReader bytes](v15, "bytes"), -[DEDataReader length](v15, "length"));
  }
  if (SHIBYTE(v42) < 0)
    operator delete(__p[0]);
  *(_OWORD *)__p = __dst;
  v42 = v40;

  if ((google::protobuf::MessageLite::ParseFromString(&v43, __p) & 1) != 0)
  {
    if (v13)
    {
      v14 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[DEDataReader initWithData:]([DEDataReader alloc], "initWithData:", v16);

    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v45;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v18 = objc_claimAutoreleasedReturnValue();
    LOBYTE(__dst) = 0;
    v36 = (id)v18;
    +[DEEncrypted getKeyWithVersion:symmetric:](DEEncrypted, "getKeyWithVersion:symmetric:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[DEVersionWriter versionToString:](DEVersionWriter, "versionToString:", v36);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to find key with version %@"), v19);
      v12 = 0;
LABEL_38:

      v32 = v37;
LABEL_41:

      goto LABEL_42;
    }
    if ((_BYTE)__dst)
    {
      if (v7)
      {
        v34 = v37;
        goto LABEL_30;
      }
      v20 = CFSTR("Found unsupported key");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7
        && !+[DESecurityUtils verify:expected:publicKey:](DESecurityUtils, "verify:expected:publicKey:", v34, v35, v37))
      {
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to verify hmac"));
        v12 = 0;
LABEL_37:
        v19 = v34;
        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[DEEncrypted getSymmetricKey:symmetricKeyIV:signature:](DEEncrypted, "getSymmetricKey:symmetricKeyIV:signature:", v37, v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v34 = (id)v23;
      if (v23)
      {
LABEL_30:
        v24 = v11;
        if (v17)
        {
          v25 = -[DEDecompressWriter initWithWriter:]([DEDecompressWriter alloc], "initWithWriter:", v24);

          v24 = v25;
        }
        v26 = -[DECryptor initWithWriter:operation:key:iv:]([DECryptor alloc], "initWithWriter:operation:key:iv:", v24, 1, v34, v38);

        v27 = -[DEHmac initWithKey:iv:]([DEHmac alloc], "initWithKey:iv:", v34, v38);
        v28 = [DEMultiWriter alloc];
        v46[0] = v26;
        v46[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[DEMultiWriter initWithWriters:](v28, "initWithWriters:", v29);

        +[DEIO copyTo:from:](DEIO, "copyTo:from:", v30, v14);
        -[DEHmac hmac](v27, "hmac");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[DEHmac verify:computed:](DEHmac, "verify:computed:", v35, v31);

        if (v12)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v36);
        }
        else
        {
          +[DELogging error:](DELogging, "error:", CFSTR("Failed to verify payload"));
        }

        goto LABEL_37;
      }
      v20 = CFSTR("Failed to find key for symmetric decryption");
    }
    v32 = v37;
    +[DELogging error:](DELogging, "error:", v20);
    v12 = 0;
    goto LABEL_41;
  }
  +[DELogging error:](DELogging, "error:", CFSTR("Failed to parse protobuf"));
  v12 = 0;
LABEL_43:
  if (SHIBYTE(v42) < 0)
    operator delete(__p[0]);
  v43 = &off_1E7935760;
  siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v43);
  google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v44);

LABEL_46:
  return v12;
}

+ (id)decrypt:(id)a3 allowAllKeys:(BOOL)a4 keyVersion:(id *)a5
{
  _BOOL8 v6;
  id v7;
  DERewindableReader *v8;
  DEDataReader *v9;
  DERewindableReader *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = [DERewindableReader alloc];
  v9 = -[DEDataReader initWithData:]([DEDataReader alloc], "initWithData:", v7);
  v10 = -[DERewindableReader initWithReader:](v8, "initWithReader:", v9);

  v11 = (void *)objc_opt_new();
  if (+[DEEncrypted decryptFrom:to:allowAllKeys:keyVersion:](DEEncrypted, "decryptFrom:to:allowAllKeys:keyVersion:", v10, v11, v6, a5))
  {
    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)decrypt:(id)a3 keyVersion:(id *)a4
{
  +[DEEncrypted decrypt:allowAllKeys:keyVersion:](DEEncrypted, "decrypt:allowAllKeys:keyVersion:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)decrypt:(id)a3
{
  +[DEEncrypted decrypt:allowAllKeys:keyVersion:](DEEncrypted, "decrypt:allowAllKeys:keyVersion:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)encryptFrom:(id)a3 to:(id)a4 keyId:(unint64_t)a5 privateKey:(id)a6 encryptedPb:(void *)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  DEMultiWriter *v16;
  void *v17;
  DEMultiWriter *v18;
  DECryptor *v19;
  DECompressWriter *v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  size_t v25;
  id v26;
  void *v27;
  size_t v28;
  id v29;
  void *v30;
  size_t v31;
  id v32;
  void *v33;
  size_t v34;
  id v35;
  void *v36;
  size_t v37;
  id v38;
  void *v39;
  size_t v40;
  id v42;
  id v43;
  id v44;
  id v45;
  DEHmac *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __n128 __p;
  char v52;
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = 0;
  if (v11 && v12 && a7)
  {
    +[DEEncrypted getKey:](DEEncrypted, "getKey:", a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (+[DEEncrypted isSymmetric:](DEEncrypted, "isSymmetric:", a5)
        || +[DEEncrypted isPrivateKey:publicKey:](DEEncrypted, "isPrivateKey:publicKey:", v13, v15))
      {
        if (+[DEEncrypted isSymmetric:](DEEncrypted, "isSymmetric:", a5))
        {
          v47 = v15;
          v44 = 0;
          v45 = 0;
        }
        else
        {
          v49 = 0;
          v50 = 0;
          +[DEEncrypted getSymmetricKey:publicKey:symmetricKeyIV:signature:](DEEncrypted, "getSymmetricKey:publicKey:symmetricKeyIV:signature:", v13, v15, &v50, &v49);
          v47 = (id)objc_claimAutoreleasedReturnValue();
          v45 = v50;
          v44 = v49;
        }
        +[DESecurityUtils getRandomIV](DESecurityUtils, "getRandomIV");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v46 = -[DEHmac initWithKey:iv:]([DEHmac alloc], "initWithKey:iv:", v47, v48);
        v16 = [DEMultiWriter alloc];
        v53[0] = v12;
        v53[1] = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[DEMultiWriter initWithWriters:](v16, "initWithWriters:", v17);

        v19 = -[DECryptor initWithWriter:operation:key:iv:]([DECryptor alloc], "initWithWriter:operation:key:iv:", v18, 0, v47, v48);
        v20 = -[DECompressWriter initWithWriter:]([DECompressWriter alloc], "initWithWriter:", v19);

        +[DEIO copyTo:from:](DEIO, "copyTo:from:", v20, v11);
        v21 = -[DECompressWriter compressed](v20, "compressed");
        -[DEHmac hmac](v46, "hmac");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if (+[DEEncrypted isSymmetric:](DEEncrypted, "isSymmetric:", a5))
        {
          v22 = 0;
        }
        else
        {
          +[DESecurityUtils sign:privateKey:](DESecurityUtils, "sign:privateKey:", v43, v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v14 = 0;
LABEL_31:

            goto LABEL_32;
          }
        }
        +[DEVersionWriter versionData:](DEVersionWriter, "versionData:", v15);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        *((_DWORD *)a7 + 4) |= 0x80u;
        *((_BYTE *)a7 + 80) = v21;
        v23 = objc_retainAutorelease(v48);
        v24 = (void *)objc_msgSend(v23, "bytes");
        v25 = objc_msgSend(v23, "length");
        *((_DWORD *)a7 + 4) |= 2u;
        std::string::basic_string[abi:ne180100](&__p, v24, v25);
        google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 4, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
        if (v52 < 0)
          operator delete((void *)__p.n128_u64[0]);
        v26 = objc_retainAutorelease(v43);
        v27 = (void *)objc_msgSend(v26, "bytes");
        v28 = objc_msgSend(v26, "length");
        *((_DWORD *)a7 + 4) |= 4u;
        std::string::basic_string[abi:ne180100](&__p, v27, v28);
        google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 5, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
        if (v52 < 0)
          operator delete((void *)__p.n128_u64[0]);
        v29 = objc_retainAutorelease(v42);
        v30 = (void *)objc_msgSend(v29, "bytes");
        v31 = objc_msgSend(v29, "length");
        *((_DWORD *)a7 + 4) |= 8u;
        std::string::basic_string[abi:ne180100](&__p, v30, v31);
        google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 6, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
        if (v52 < 0)
          operator delete((void *)__p.n128_u64[0]);
        if (v45)
        {
          v32 = objc_retainAutorelease(v45);
          v33 = (void *)objc_msgSend(v32, "bytes");
          v34 = objc_msgSend(v32, "length");
          *((_DWORD *)a7 + 4) |= 0x10u;
          std::string::basic_string[abi:ne180100](&__p, v33, v34);
          google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 7, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
          if (v52 < 0)
            operator delete((void *)__p.n128_u64[0]);
        }
        if (v44)
        {
          v35 = objc_retainAutorelease(v44);
          v36 = (void *)objc_msgSend(v35, "bytes");
          v37 = objc_msgSend(v35, "length");
          *((_DWORD *)a7 + 4) |= 0x20u;
          std::string::basic_string[abi:ne180100](&__p, v36, v37);
          google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 8, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
          if (v52 < 0)
            operator delete((void *)__p.n128_u64[0]);
        }
        if (v22)
        {
          v38 = objc_retainAutorelease(v22);
          v39 = (void *)objc_msgSend(v38, "bytes");
          v40 = objc_msgSend(v38, "length");
          *((_DWORD *)a7 + 4) |= 0x40u;
          std::string::basic_string[abi:ne180100](&__p, v39, v40);
          google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a7 + 9, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &__p);
          if (v52 < 0)
            operator delete((void *)__p.n128_u64[0]);
        }

        v14 = 1;
        goto LABEL_31;
      }
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Can't encrypt with nil key"));
    }
    v14 = 0;
LABEL_32:

  }
  return v14;
}

+ (BOOL)wrapFrom:(id)a3 to:(id)a4 encryptedPb:(void *)a5 multipart:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  size_t v13;
  BOOL v14;
  std::string *p_p;
  std::string::size_type size;
  void *v17;
  DEMultipartWriter *v18;
  std::string __p;

  v9 = a3;
  v10 = a4;
  if (!a6)
  {
    objc_msgSend(v9, "readData");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (void *)objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    *((_DWORD *)a5 + 4) |= 1u;
    std::string::basic_string[abi:ne180100](&__p, v12, v13);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 3, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  memset(&__p, 0, sizeof(__p));
  v14 = google::protobuf::MessageLite::SerializeToString((const char *)a5, &__p);
  if (v14)
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", p_p, size);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      v18 = -[DEMultipartWriter initWithWriter:]([DEMultipartWriter alloc], "initWithWriter:", v10);
      -[DEMultipartWriter writeData:](v18, "writeData:", v17);
      -[DEMultipartWriter newPart](v18, "newPart");
      +[DEIO copyTo:from:](DEIO, "copyTo:from:", v18, v9);
      -[DEMultipartWriter closeMessage](v18, "closeMessage");

    }
    else
    {
      objc_msgSend(v10, "writeData:", v17);
      objc_msgSend(v10, "close");
    }

  }
  else
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to serialize data to write encrypted blob"));
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v14;
}

+ (id)encrypt:(id)a3 keyId:(unint64_t)a4 privateKey:(id)a5 multipart:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  DEDataReader *v11;
  void *v12;
  DEDataReader *v13;
  void *v14;
  DEDataReader *v15;
  void *v16;
  void *v17;
  void (**v19)(siri::dialogengine::CatUpdater::Encrypted *__hidden);
  uint64_t v20[10];

  v6 = a6;
  v9 = a3;
  v10 = a5;
  v11 = -[DEDataReader initWithData:]([DEDataReader alloc], "initWithData:", v9);
  v12 = (void *)objc_opt_new();
  siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v19);
  if (+[DEEncrypted encryptFrom:to:keyId:privateKey:encryptedPb:](DEEncrypted, "encryptFrom:to:keyId:privateKey:encryptedPb:", v11, v12, a4, v10, &v19))
  {
    v13 = [DEDataReader alloc];
    objc_msgSend(v12, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[DEDataReader initWithData:](v13, "initWithData:", v14);

    v16 = (void *)objc_opt_new();
    if (+[DEEncrypted wrapFrom:to:encryptedPb:multipart:](DEEncrypted, "wrapFrom:to:encryptedPb:multipart:", v15, v16, &v19, v6))
    {
      objc_msgSend(v16, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  v19 = &off_1E7935760;
  siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v19);
  google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v20);

  return v17;
}

+ (id)encryptFrom:(id)a3 name:(id)a4 base:(id)a5 keyId:(unint64_t)a6 privateKey:(id)a7 multipart:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  DEFileWriter *v22;
  void *v23;
  char v24;
  const std::__fs::filesystem::path *v25;
  id v26;
  const std::__fs::filesystem::path *v27;
  std::error_code *v28;
  int v29;
  BOOL v30;
  uint64_t v31;
  int *v32;
  void *v34;
  void *v35;
  DEFileWriter *v36;
  DEFileReader *v37;
  id v38;
  id v39;
  DEFileWriter *v40;
  void *v41;
  void *v42;
  DEFileReader *v43;
  void *v44;
  void (**v45)(siri::dialogengine::CatUpdater::Encrypted *__hidden);
  uint64_t v46[10];
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[7];

  v8 = a8;
  v51[5] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = 0;
  if (v13 && v14 && v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      v17 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v50 = 0;
    objc_msgSend(v18, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v15, 1, &v50);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v50;
    if (v21)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@: %@"), v13, v21);
LABEL_7:
      v17 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (!v20)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@"), v13);
      v20 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v20, "URLByStandardizingPath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "URLByAppendingPathComponent:isDirectory:", CFSTR("wrapped"), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __64__DEEncrypted_encryptFrom_name_base_keyId_privateKey_multipart___block_invoke;
    v47[3] = &unk_1E7931E10;
    v38 = v19;
    v48 = v38;
    v20 = v41;
    v49 = v20;
    v51[0] = v47;
    v51[4] = 0;
    v43 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v13);
    if (!v43)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v13);
      v17 = 0;
LABEL_34:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v51);
      goto LABEL_35;
    }
    v40 = -[DEFileWriter initWithURL:]([DEFileWriter alloc], "initWithURL:", v44);
    if (!v40)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create writer to %@"), v44);
      v17 = 0;
LABEL_33:

      goto LABEL_34;
    }
    siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v45);
    if (!+[DEEncrypted encryptFrom:to:keyId:privateKey:encryptedPb:](DEEncrypted, "encryptFrom:to:keyId:privateKey:encryptedPb:", v43, v40, a6, v16, &v45))
    {
      v17 = 0;
LABEL_32:
      v45 = &off_1E7935760;
      siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v45);
      google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v46);
      goto LABEL_33;
    }
    v37 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v44);
    if (!v37)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v44);
      v17 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v22 = -[DEFileWriter initWithURL:]([DEFileWriter alloc], "initWithURL:", v42);
    v36 = v22;
    if (v22)
    {
      if (+[DEEncrypted wrapFrom:to:encryptedPb:multipart:](DEEncrypted, "wrapFrom:to:encryptedPb:multipart:", v37, v22, &v45, v8))
      {
        +[DEVersionWriter versionFile:](DEVersionWriter, "versionFile:", v42);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[DEVersionWriter getURLFor:version:base:](DEVersionWriter, "getURLFor:version:base:", v14);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v38, "fileExistsAtPath:isDirectory:", v23, 0);

        if ((v24 & 1) != 0)
        {
LABEL_17:
          v17 = v34;
LABEL_29:

          goto LABEL_30;
        }
        if (+[DEVersionWriter prepareDirsFor:](DEVersionWriter, "prepareDirsFor:", v35))
        {
          objc_msgSend(v42, "path");
          v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v25 = (const std::__fs::filesystem::path *)objc_msgSend(v39, "UTF8String");
          objc_msgSend(v35, "path");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v27 = (const std::__fs::filesystem::path *)objc_msgSend(v26, "UTF8String");
          rename(v25, v27, v28);
          v30 = v29 == 0;

          if (v30)
            goto LABEL_17;
          v31 = *__error();
          v32 = __error();
          +[DELogging error:](DELogging, "error:", CFSTR("Failed to rename encrypted file from \"%@\" to \"%@\": %d (%s)"), v42, v35, v31, strerror(*v32));
        }
        v17 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create writer no %@"), v42);
    }
    v17 = 0;
LABEL_30:

    goto LABEL_31;
  }
LABEL_37:

  return v17;
}

+ (id)decryptFrom:(id)a3 name:(id)a4 base:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  DERewindableReader *v18;
  DEFileReader *v19;
  DERewindableReader *v20;
  DEFileWriter *v21;
  void *v22;
  char v23;
  const std::__fs::filesystem::path *v24;
  id v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  uint64_t v29;
  int *v30;
  id v32;
  void *v33;
  void *v34;
  DEFileWriter *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v11 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v13 = v10;
    v40 = 0;
    objc_msgSend(v12, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v13, 1, &v40);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v40;
    if (v15)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@: %@"), v7, v15);
LABEL_7:
      v11 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (!v14)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@"), v7);
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v14, "URLByStandardizingPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __37__DEEncrypted_decryptFrom_name_base___block_invoke;
    v37[3] = &unk_1E7931E10;
    v17 = v12;
    v38 = v17;
    v14 = v16;
    v39 = v14;
    v41[0] = v37;
    v41[4] = 0;
    v18 = [DERewindableReader alloc];
    v19 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v7);
    v20 = -[DERewindableReader initWithReader:](v18, "initWithReader:", v19);

    if (!v20)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v7);
      v11 = 0;
LABEL_27:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v41);
      goto LABEL_28;
    }
    v21 = -[DEFileWriter initWithURL:]([DEFileWriter alloc], "initWithURL:", v36);
    v35 = v21;
    if (v21)
    {
      if (+[DEEncrypted decryptFrom:to:allowAllKeys:keyVersion:](DEEncrypted, "decryptFrom:to:allowAllKeys:keyVersion:", v20, v21, 0, 0))
      {
        +[DEVersionWriter versionFile:](DEVersionWriter, "versionFile:", v36);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[DEVersionWriter getURLFor:version:base:](DEVersionWriter, "getURLFor:version:base:", v8);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v22, 0);

        if ((v23 & 1) != 0)
        {
LABEL_14:
          v11 = v33;
LABEL_25:

          goto LABEL_26;
        }
        if (+[DEVersionWriter prepareDirsFor:](DEVersionWriter, "prepareDirsFor:", v34))
        {
          objc_msgSend(v36, "path");
          v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = (const std::__fs::filesystem::path *)objc_msgSend(v32, "UTF8String");
          objc_msgSend(v34, "path");
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v26 = (const std::__fs::filesystem::path *)objc_msgSend(v25, "UTF8String");
          rename(v24, v26, v27);
          LOBYTE(v24) = v28 == 0;

          if ((v24 & 1) != 0)
            goto LABEL_14;
          v29 = *__error();
          v30 = __error();
          +[DELogging error:](DELogging, "error:", CFSTR("Failed to rename decrypted file from \"%@\" to \"%@\": %d (%s)"), v36, v34, v29, strerror(*v30));
        }
        else
        {
          +[DELogging error:](DELogging, "error:", CFSTR("Failed to prepare dirs for %@"), v34);
        }
        v11 = 0;
        goto LABEL_25;
      }
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to decrypt from %@ to %@"), v7, v36);
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create writer no %@"), v36);
    }
    v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
LABEL_30:

  return v11;
}

+ (BOOL)decryptFrom:(id)a3 to:(id)a4 version:(id)a5 allowAllKeys:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  id v17;
  DERewindableReader *v18;
  DEFileReader *v19;
  DERewindableReader *v20;
  void *v21;
  char v22;
  id v23;
  const std::__fs::filesystem::path *v24;
  id v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  uint64_t v29;
  int *v30;
  const __CFString *v31;
  id v32;
  void *v34;
  DEFileWriter *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v40 = 0;
    objc_msgSend(v11, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v9, 1, &v40);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    if (v14)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@: %@"), v8, v14);
LABEL_4:
      v15 = 0;
LABEL_26:

      goto LABEL_27;
    }
    if (!v13)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@"), v8);
      v13 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v13, "URLByStandardizingPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __51__DEEncrypted_decryptFrom_to_version_allowAllKeys___block_invoke;
    v37[3] = &unk_1E7931E10;
    v17 = v12;
    v38 = v17;
    v13 = v16;
    v39 = v13;
    v41[0] = v37;
    v41[4] = 0;
    v18 = [DERewindableReader alloc];
    v19 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v8);
    v20 = -[DERewindableReader initWithReader:](v18, "initWithReader:", v19);

    if (!v20)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v8);
      v15 = 0;
LABEL_25:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v41);
      goto LABEL_26;
    }
    v35 = -[DEFileWriter initWithURL:]([DEFileWriter alloc], "initWithURL:", v36);
    if (!+[DEEncrypted decryptFrom:to:allowAllKeys:keyVersion:](DEEncrypted, "decryptFrom:to:allowAllKeys:keyVersion:", v20))
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to decrypt from %@ to %@"), v8, v36);
      v15 = 0;
LABEL_24:

      goto LABEL_25;
    }
    +[DEVersionWriter versionFile:](DEVersionWriter, "versionFile:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_msgSend(v10, "isEqualToData:", v34) & 1) == 0)
    {
      v31 = CFSTR("Failed get expected version in decrypt of file from \"%@\");
      v32 = v8;
    }
    else
    {
      objc_msgSend(v9, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v21, 0);

      if ((v22 & 1) != 0)
      {
LABEL_12:
        v15 = 1;
LABEL_23:

        goto LABEL_24;
      }
      if (+[DEVersionWriter prepareDirsFor:](DEVersionWriter, "prepareDirsFor:", v9))
      {
        objc_msgSend(v36, "path");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = (const std::__fs::filesystem::path *)objc_msgSend(v23, "UTF8String");
        objc_msgSend(v9, "path");
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v26 = (const std::__fs::filesystem::path *)objc_msgSend(v25, "UTF8String");
        rename(v24, v26, v27);
        LOBYTE(v24) = v28 == 0;

        if ((v24 & 1) != 0)
          goto LABEL_12;
        v29 = *__error();
        v30 = __error();
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to rename decrypted file from \"%@\" to \"%@\": %d (%s)"), v36, v9, v29, strerror(*v30));
LABEL_22:
        v15 = 0;
        goto LABEL_23;
      }
      v31 = CFSTR("Failed to prepare dirs for %@");
      v32 = v9;
    }
    +[DELogging error:](DELogging, "error:", v31, v32);
    goto LABEL_22;
  }
  v15 = 0;
LABEL_27:

  return v15;
}

+ (BOOL)decryptFrom:(id)a3 to:(id)a4 version:(id)a5
{
  return +[DEEncrypted decryptFrom:to:version:allowAllKeys:](DEEncrypted, "decryptFrom:to:version:allowAllKeys:", a3, a4, a5, 0);
}

+ (BOOL)encryptFrom:(id)a3 to:(id)a4 keyId:(unint64_t)a5 privateKey:(id)a6 multipart:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  void *v19;
  id v20;
  DEFileReader *v21;
  DEFileWriter *v22;
  void *v23;
  char v24;
  id v26;
  const std::__fs::filesystem::path *v27;
  id v28;
  const std::__fs::filesystem::path *v29;
  std::error_code *v30;
  int v31;
  uint64_t v32;
  int *v33;
  DEFileWriter *v34;
  DEFileWriter *v35;
  void *v36;
  DEFileReader *v37;
  void *v38;
  void (**v39)(siri::dialogengine::CatUpdater::Encrypted *__hidden);
  uint64_t v40[10];
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[7];

  v7 = a7;
  v45[5] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v44 = 0;
    objc_msgSend(v14, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v12, 1, &v44);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v44;
    if (v17)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@: %@"), v11, v17);
LABEL_4:
      v18 = 0;
LABEL_27:

      goto LABEL_28;
    }
    if (!v16)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed create tmp dir for %@"), v11);
      v16 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v16, "URLByStandardizingPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", CFSTR("wrapped"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __57__DEEncrypted_encryptFrom_to_keyId_privateKey_multipart___block_invoke;
    v41[3] = &unk_1E7931E10;
    v20 = v15;
    v42 = v20;
    v16 = v19;
    v43 = v16;
    v45[0] = v41;
    v45[4] = 0;
    v37 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v11);
    if (!v37)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v11);
      v18 = 0;
LABEL_26:

      siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v45);
      goto LABEL_27;
    }
    v35 = -[DEFileWriter initWithURL:]([DEFileWriter alloc], "initWithURL:", v38);
    if (!v35)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create writer to %@"), v38);
      v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v39);
    if (!+[DEEncrypted encryptFrom:to:keyId:privateKey:encryptedPb:](DEEncrypted, "encryptFrom:to:keyId:privateKey:encryptedPb:", v37, v35, a5, v13, &v39))
    {
      v18 = 0;
LABEL_24:
      v39 = &off_1E7935760;
      siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v39);
      google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v40);
      goto LABEL_25;
    }
    v21 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v38);
    if (!v21)
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v38);
      v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v22 = -[DEFileWriter initWithURL:]([DEFileWriter alloc], "initWithURL:", v36);
    v34 = v22;
    if (v22)
    {
      if (+[DEEncrypted wrapFrom:to:encryptedPb:multipart:](DEEncrypted, "wrapFrom:to:encryptedPb:multipart:", v21, v22, &v39, v7))
      {
        objc_msgSend(v12, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v23, 0);

        if ((v24 & 1) != 0)
        {
LABEL_14:
          v18 = 1;
LABEL_22:

          goto LABEL_23;
        }
        if (+[DEVersionWriter prepareDirsFor:](DEVersionWriter, "prepareDirsFor:", v12))
        {
          objc_msgSend(v36, "path");
          v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v27 = (const std::__fs::filesystem::path *)objc_msgSend(v26, "UTF8String");
          objc_msgSend(v12, "path");
          v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v29 = (const std::__fs::filesystem::path *)objc_msgSend(v28, "UTF8String");
          rename(v27, v29, v30);
          LOBYTE(v27) = v31 == 0;

          if ((v27 & 1) != 0)
            goto LABEL_14;
          v32 = *__error();
          v33 = __error();
          +[DELogging error:](DELogging, "error:", CFSTR("Failed to rename encrypted file from \"%@\" to \"%@\": %d (%s)"), v36, v12, v32, strerror(*v33));
        }
      }
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to create writer no %@"), v36);
    }
    v18 = 0;
    goto LABEL_22;
  }
  v18 = 0;
LABEL_28:

  return v18;
}

+ (id)versionFile:(id)a3
{
  id v3;
  DERewindableReader *v4;
  DEFileReader *v5;
  DERewindableReader *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = [DERewindableReader alloc];
  v5 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v3);
  v6 = -[DERewindableReader initWithReader:](v4, "initWithReader:", v5);

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    if (+[DEEncrypted decryptFrom:to:allowAllKeys:keyVersion:](DEEncrypted, "decryptFrom:to:allowAllKeys:keyVersion:", v6, v7, 0, 0))
    {
      objc_msgSend(v7, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to decrypt from %@"), v3);
      v8 = 0;
    }

  }
  else
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to create reader from %@"), v3);
    v8 = 0;
  }

  return v8;
}

+ (id)toEnvelope:(BOOL)a3 iv:(id)a4 hmac:(id)a5 keyVersion:(id)a6 payload:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  size_t v17;
  id v18;
  void *v19;
  size_t v20;
  id v21;
  void *v22;
  size_t v23;
  id v24;
  void *v25;
  size_t v26;
  std::string *p_p;
  std::string::size_type size;
  void *v29;
  void (**v31)(siri::dialogengine::CatUpdater::Encrypted *__hidden);
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[4];
  BOOL v38;
  std::string __p;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  siri::dialogengine::CatUpdater::Encrypted::Encrypted((siri::dialogengine::CatUpdater::Encrypted *)&v31);
  v33 |= 0x80u;
  v38 = a3;
  v15 = objc_retainAutorelease(v11);
  v16 = (void *)objc_msgSend(v15, "bytes");
  v17 = objc_msgSend(v15, "length");
  v33 |= 2u;
  std::string::basic_string[abi:ne180100](&__p, v16, v17);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v35, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v18 = objc_retainAutorelease(v12);
  v19 = (void *)objc_msgSend(v18, "bytes");
  v20 = objc_msgSend(v18, "length");
  v33 |= 4u;
  std::string::basic_string[abi:ne180100](&__p, v19, v20);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v36, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v21 = objc_retainAutorelease(v13);
  v22 = (void *)objc_msgSend(v21, "bytes");
  v23 = objc_msgSend(v21, "length");
  v33 |= 8u;
  std::string::basic_string[abi:ne180100](&__p, v22, v23);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v37, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v24 = objc_retainAutorelease(v14);
  v25 = (void *)objc_msgSend(v24, "bytes");
  v26 = objc_msgSend(v24, "length");
  v33 |= 1u;
  std::string::basic_string[abi:ne180100](&__p, v25, v26);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v34, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  memset(&__p, 0, sizeof(__p));
  if (google::protobuf::MessageLite::SerializeToString((const char *)&v31, &__p))
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", p_p, size);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v31 = &off_1E7935760;
  siri::dialogengine::CatUpdater::Encrypted::SharedDtor(&v31);
  google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(&v32);

  return v29;
}

+ (id)decryptAll:(id)a3
{
  +[DEEncrypted decrypt:allowAllKeys:keyVersion:](DEEncrypted, "decrypt:allowAllKeys:keyVersion:", a3, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)decryptAllFrom:(id)a3 to:(id)a4
{
  return +[DEEncrypted decryptFrom:to:version:allowAllKeys:](DEEncrypted, "decryptFrom:to:version:allowAllKeys:", a3, a4, 0, 1);
}

void __57__DEEncrypted_encryptFrom_to_keyId_privateKey_multipart___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  char v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;
  if (v5)
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to remove tmp dir \"%@\": %@"), *(_QWORD *)(a1 + 40), v5);

}

void __51__DEEncrypted_decryptFrom_to_version_allowAllKeys___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  char v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;
  if (v5)
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to remove tmp dir \"%@\": %@"), *(_QWORD *)(a1 + 40), v5);

}

void __37__DEEncrypted_decryptFrom_name_base___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  char v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;
  if (v5)
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to remove tmp dir \"%@\": %@"), *(_QWORD *)(a1 + 40), v5);

}

void __64__DEEncrypted_encryptFrom_name_base_keyId_privateKey_multipart___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  char v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;
  if (v5)
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    +[DELogging error:](DELogging, "error:", CFSTR("Failed to remove tmp dir \"%@\": %@"), *(_QWORD *)(a1 + 40), v5);

}

@end
