@implementation NSData(HKUUID)

- (void)hk_enumerateUUIDsUsingBlock:()HKUUID
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NSData_HKUUID__hk_enumerateUUIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E37EA378;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "hk_enumerateUUIDBytesUsingBlock:", v6);

}

- (void)hk_enumerateUUIDBytesUsingBlock:()HKUUID
{
  void (**v4)(id, unint64_t, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  char v11;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if ((v5 & 0xF) == 0)
  {
    v6 = v5;
    v7 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
    v8 = v7 + v6;
    v11 = 0;
    if (v7 < v8)
    {
      v9 = v7;
      do
      {
        v4[2](v4, v9, &v11);
        v9 += 16;
        if (v11)
          v10 = 1;
        else
          v10 = v9 >= v8;
      }
      while (!v10);
    }
  }

}

- (unint64_t)hk_countOfUUIDs
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "length");
  if ((v1 & 0xF) != 0)
    return 0;
  else
    return v1 >> 4;
}

- (uint64_t)hk_enumerateUUIDsWithError:()HKUUID block:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke;
  v12[3] = &unk_1E37EA3C8;
  v14 = &v16;
  v7 = v6;
  v13 = v7;
  v15 = &v22;
  objc_msgSend(a1, "hk_enumerateUUIDBytesUsingBlock:", v12);
  v8 = (id)v17[5];
  v9 = v8;
  if (v8)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    else
      _HKLogDroppedError(v8);
  }

  v10 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

@end
