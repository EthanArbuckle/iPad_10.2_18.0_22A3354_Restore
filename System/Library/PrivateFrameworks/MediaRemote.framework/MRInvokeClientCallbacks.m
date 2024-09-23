@implementation MRInvokeClientCallbacks

void ___onQueue_MRInvokeClientCallbacks_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2)
  {
    MRContentItemMerge(*(void **)(a1 + 32), *(void **)(a1 + 40));
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") <= 1 || !*(_BYTE *)(a1 + 88))
      goto LABEL_7;
LABEL_6:
    v3 = (id)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    _onQueue_MRInvokeClientCallbacks(*(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

    return;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") > 1)
    goto LABEL_6;
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void ___onQueue_MRInvokeClientCallbacks_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___onQueue_MRInvokeClientCallbacks_block_invoke_2;
  v7[3] = &unk_1E30CFAE0;
  v6 = *(void **)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 80);
  v15 = *(_BYTE *)(a1 + 104);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 88);
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 96);
  _onClientQueue_MRInvokeClientCallback(v2, v3, v4, v5, v6, v7);

}

@end
