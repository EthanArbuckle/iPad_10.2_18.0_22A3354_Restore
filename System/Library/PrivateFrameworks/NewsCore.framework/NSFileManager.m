@implementation NSFileManager

uint64_t __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v23 = 0;
  v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v23);
  v5 = v23;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
LABEL_2:
    v7 = (void *)a1[7];
    if (v7)
    {
      v8 = a1[6];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_4;
      v16[3] = &unk_1E4646488;
      v9 = &v18;
      v18 = v7;
      v19 = 1;
      v10 = &v17;
      v17 = v6;
      v11 = v16;
LABEL_9:
      dispatch_async(v8, v11);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v5, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v14 = objc_msgSend(v6, "code");

    if (v14 == 4)
      goto LABEL_2;
  }
  else
  {

  }
  v15 = (void *)a1[7];
  if (v15)
  {
    v8 = a1[6];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_3;
    block[3] = &unk_1E463B2D0;
    v9 = &v22;
    v22 = v15;
    v10 = &v21;
    v21 = v6;
    v11 = block;
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
