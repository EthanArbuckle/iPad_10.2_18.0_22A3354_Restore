@implementation MXExtensionProvider

void __38___MXExtensionProvider_sharedProvider__block_invoke()
{
  _MXExtensionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(_MXExtensionProvider);
  v1 = (void *)qword_1ECE2DA58;
  qword_1ECE2DA58 = (uint64_t)v0;

}

void __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_extensionsByFilteringBlacklistedExtensionsFromArray:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "merger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receiveExtensions:withIndex:", v13, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "serviceCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receivedExtensions:error:", v9, v5);

  objc_msgSend(WeakRetained, "dispatchCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_currentExtensions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchExtensions:error:", v12, v5);

}

void __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_extensionsByFilteringBlacklistedExtensionsFromArray:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "merger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receiveExtensions:withIndex:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "serviceCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receivedExtensions:error:", v9, v5);

  objc_msgSend(WeakRetained, "dispatchCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_currentExtensions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchExtensions:error:", v12, v5);

}

void __56___MXExtensionProvider__beginMatchingExtensionsIfNeeded__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_extensionsByFilteringBlacklistedExtensionsFromArray:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "merger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receiveExtensions:withIndex:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "serviceCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receivedExtensions:error:", v9, v5);

  objc_msgSend(WeakRetained, "dispatchCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_currentExtensions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchExtensions:error:", v12, v5);

}

void __43___MXExtensionProvider__intentClassFilter___block_invoke(uint64_t a1, void *a2)
{
  NSString *v3;

  v3 = a2;
  if (NSClassFromString(v3))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __47___MXExtensionProvider_imageForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v4 = a2;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  else
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v3();

}

void __50___MXExtensionProvider_loadImageForKey_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "assetStorage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAsset:forKey:", v2, *(_QWORD *)(a1 + 40));

}

@end
