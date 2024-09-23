@implementation NSItemProvider

void __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(_QWORD *, uint64_t, _QWORD, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageFileLoader");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_2;
  v8[3] = &unk_1E35DD990;
  v9 = v3;
  v6 = (void (*)(_QWORD *, uint64_t, _QWORD, _QWORD *))v4[2];
  v7 = v3;
  v6(v4, v5, 0, v8);

}

void __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_3(uint64_t a1, void *a2, objc_class *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(unsigned __int8 *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_4;
    v11[3] = &unk_1E35DB6B0;
    v13 = v5;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v6, "_loadConstituentURLsWithNetworkAccessAllowed:completionHandler:", v7, v11);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unexpected value class (%@)"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v10);
  }

}

uint64_t __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a5);
}

uint64_t __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
