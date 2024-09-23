@implementation LNCATDialog

void __58__LNCATDialog_CATSupport__getResultWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "templateDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAccessingSecurityScopedResource");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__LNCATDialog_CATSupport__getResultWithCompletionHandler___block_invoke(int a1, id a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id v7;
  void *v8;
  id v9;

  *a4 = objc_retainAutorelease(a2);
  v7 = a3;
  objc_msgSend(v7, "valueType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cat_value:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *a5 = v8;
}

@end
