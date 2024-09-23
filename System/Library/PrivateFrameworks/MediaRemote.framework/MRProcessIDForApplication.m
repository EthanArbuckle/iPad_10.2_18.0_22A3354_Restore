@implementation MRProcessIDForApplication

uint64_t __MRProcessIDForApplication_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __MRProcessIDForApplication_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  int v11;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CFE2C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  v5 = *(NSObject **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __MRProcessIDForApplication_block_invoke_3;
  v9 = &unk_1E30C66D0;
  v10 = *(id *)(a1 + 48);
  v11 = v4;
  dispatch_async(v5, &v6);
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v6, v7, v8, v9);

}

uint64_t __MRProcessIDForApplication_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

@end
