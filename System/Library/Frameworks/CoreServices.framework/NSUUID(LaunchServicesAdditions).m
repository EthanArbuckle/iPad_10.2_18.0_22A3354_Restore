@implementation NSUUID(LaunchServicesAdditions)

+ (id)_LS_nullUUID
{
  uuid_t uu;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
}

+ (id)_LS_UUIDWithData:()LaunchServicesAdditions digestType:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  const void *v9;
  CC_LONG v10;
  uint64_t v11;
  id v12;
  const void *v13;
  CC_LONG v14;
  unsigned __int8 v15;
  char v16;
  id v17;
  const void *v18;
  CC_LONG v19;
  void *v20;
  unsigned __int8 v22[24];
  unsigned __int8 md[32];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  *(_OWORD *)v22 = 0uLL;
  if (v5)
  {
    v7 = objc_retainAutorelease(v5);
    if (objc_msgSend(v7, "bytes", *(_QWORD *)v22))
    {
      if (objc_msgSend(v7, "length"))
      {
        if (a4 == 2)
        {
          v12 = objc_retainAutorelease(v7);
          v13 = (const void *)objc_msgSend(v12, "bytes");
          v14 = objc_msgSend(v12, "length");

          CC_MD5(v13, v14, v22);
          v15 = v22[6];
          v16 = 48;
        }
        else
        {
          if (a4 == 1)
          {
            v17 = objc_retainAutorelease(v7);
            v18 = (const void *)objc_msgSend(v17, "bytes");
            v19 = objc_msgSend(v17, "length");

            CC_SHA1(v18, v19, md);
          }
          else
          {
            if (a4)
            {
LABEL_13:
              v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v22);
              goto LABEL_14;
            }
            v8 = objc_retainAutorelease(v7);
            v9 = (const void *)objc_msgSend(v8, "bytes");
            v10 = objc_msgSend(v8, "length");

            CC_SHA256(v9, v10, md);
          }
          *(_OWORD *)v22 = *(_OWORD *)md;
          v15 = md[6];
          v16 = 80;
        }
        v22[6] = v16 & 0xF0 | v15 & 0xF;
        v22[8] = v22[8] & 0x3F | 0x80;
        goto LABEL_13;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_nullUUID", *(_QWORD *)v22);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v20 = (void *)v11;

  return v20;
}

@end
