@implementation PurgeExpendableDataContainerContentForContainerClass

uint64_t ___PurgeExpendableDataContainerContentForContainerClass_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  MICandidateContainer *v10;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = -[MICandidateContainer initWithContainerURL:identifier:metadata:]([MICandidateContainer alloc], "initWithContainerURL:identifier:metadata:", v9, v8, v7);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  return 1;
}

uint64_t ___PurgeExpendableDataContainerContentForContainerClass_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
