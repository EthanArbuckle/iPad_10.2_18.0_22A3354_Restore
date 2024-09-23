@implementation HMPrivacyRequestAccessForService

uint64_t ____HMPrivacyRequestAccessForService_block_invoke(uint64_t a1, int a2)
{
  char v2;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  char v11;

  v2 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = ____HMPrivacyRequestAccessForService_block_invoke_2;
    v9 = &unk_1E3AB0580;
    v10 = *(id *)(a1 + 48);
    v11 = v2;
    dispatch_async(v4, &v6);

  }
  else
  {
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2 != 0);
  }
  return objc_msgSend(*(id *)(a1 + 40), "invalidate", v6, v7, v8, v9);
}

uint64_t ____HMPrivacyRequestAccessForService_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) != 0);
}

@end
