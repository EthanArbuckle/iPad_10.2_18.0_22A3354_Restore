@implementation CRSServiceBundleManager

void __42___CRSServiceBundleManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sServiceBundleManager;
  sharedInstance_sServiceBundleManager = (uint64_t)v1;

}

void __60___CRSServiceBundleManager_getServiceBundlesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "filteredSetUsingPredicate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __60___CRSServiceBundleManager_getServiceBundlesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
