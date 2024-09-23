@implementation WDGetProfileNameForHealthStore

void __WDGetProfileNameForHealthStore_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (objc_class *)MEMORY[0x24BDD1730];
  v8 = a3;
  v9 = a2;
  v12 = objc_alloc_init(v7);
  objc_msgSend(v12, "setGivenName:", v9);

  objc_msgSend(v12, "setFamilyName:", v8);
  objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v12, 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!a4 && objc_msgSend(v10, "length"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
