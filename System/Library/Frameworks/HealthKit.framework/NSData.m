@implementation NSData

void __46__NSData_HKUUID__hk_enumerateUUIDsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  char v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;

  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  v12 = *(id *)(v6 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke_2;
  v8[3] = &unk_1E37EA3A0;
  v8[1] = 3221225472;
  v10 = a2;
  v9 = v5;
  v11 = a3;
  v7 = HKWithAutoreleasePool(&v12, v8);
  objc_storeStrong((id *)(v6 + 40), v12);
  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a3 = 1;
  }

}

uint64_t __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", *(_QWORD *)(a1 + 40));
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

@end
