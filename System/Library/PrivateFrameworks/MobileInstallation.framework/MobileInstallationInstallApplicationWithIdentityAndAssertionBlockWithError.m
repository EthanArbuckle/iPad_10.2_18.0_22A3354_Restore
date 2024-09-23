@implementation MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  void (**v11)(_QWORD, _QWORD);

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v8 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Error"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v6 = (void (**)(_QWORD, _QWORD))a1[5];
    v4 = v8;
    if (v6)
    {
      v7 = a1[4];
      if (v7)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2;
        block[3] = &unk_1E6163B18;
        v11 = v6;
        v10 = v8;
        dispatch_sync(v7, block);

      }
      else
      {
        ((void (**)(_QWORD, id))v6)[2](v6, v8);
      }
      v4 = v8;
    }
  }

}

uint64_t __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3(uint64_t a1)
{
  void (**v2)(void);
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v2 = *(void (***)(void))(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4;
      block[3] = &unk_1E6163B68;
      v5 = v2;
      dispatch_sync(v3, block);

    }
    else
    {
      v2[2]();
    }
  }
}

uint64_t __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5(_QWORD *a1, char a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a5);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
  }

}

@end
