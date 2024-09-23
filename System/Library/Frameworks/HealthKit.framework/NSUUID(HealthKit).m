@implementation NSUUID(HealthKit)

- (id)hk_dataForUUIDBytes
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hk_UUIDWithData:()HealthKit
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 16)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v3), "bytes"));
  else
    v4 = 0;

  return v4;
}

+ (id)hk_v3UUIDWithNameSpace:()HealthKit name:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;

  v5 = (objc_class *)MEMORY[0x1E0C99DF0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithData:", v7);

  objc_msgSend(v8, "appendData:", v6);
  objc_msgSend(v8, "hk_MD5");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 16);
  v20 = 0;
  objc_msgSend(v9, "getBytes:range:", &v20, 0, 6);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 0, 6, &v20, 6);
  v19 = 0;
  objc_msgSend(v9, "getBytes:range:", &v19, 6, 1);
  v19 = v19 & 0xF | 0x30;
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 6, 1, &v19, 1);
  v18 = 0;
  objc_msgSend(v9, "getBytes:range:", &v18, 7, 1);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 7, 1, &v18, 1);
  v17 = 0;
  objc_msgSend(v9, "getBytes:range:", &v17, 8, 1);
  v17 = v17 & 0x3F | 0x80;
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 8, 1, &v17, 1);
  v16 = 0;
  objc_msgSend(v9, "getBytes:range:", &v16, 9, 1);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 9, 1, &v16, 1);
  v15 = 0;
  objc_msgSend(v9, "getBytes:range:", &v15, 10, 6);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 10, 6, &v15, 6);
  v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v12 = objc_retainAutorelease(v10);
  v13 = (void *)objc_msgSend(v11, "initWithUUIDBytes:", objc_msgSend(v12, "bytes"));

  return v13;
}

- (uint64_t)hk_compare:()HealthKit
{
  id v4;
  int v5;
  unsigned __int8 uu2[8];
  uint64_t v8;
  unsigned __int8 uu1[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu1 = 0;
  v10 = 0;
  *(_QWORD *)uu2 = 0;
  v8 = 0;
  v4 = a3;
  objc_msgSend(a1, "getUUIDBytes:", uu1);
  objc_msgSend(v4, "getUUIDBytes:", uu2);

  v5 = uuid_compare(uu1, uu2);
  if (v5 < 0)
    return -1;
  else
    return v5 != 0;
}

- (id)hk_shortRepresentation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
