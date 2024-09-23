@implementation CRKProviderBundle

void __85___CRKProviderBundle_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _CRKBundleIdentifiedCardSectionViewProvider *v8;

  v5 = a3;
  v6 = a2;
  v8 = objc_alloc_init(_CRKBundleIdentifiedCardSectionViewProvider);
  -[_CRKBundleIdentifiedCardSectionViewProvider setRealCardSectionViewProvider:](v8, "setRealCardSectionViewProvider:", v5);

  objc_msgSend(*(id *)(a1 + 32), "providerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CRKBundleIdentifiedCardSectionViewProvider setProviderIdentifier:](v8, "setProviderIdentifier:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
