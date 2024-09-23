@implementation NPKUpdateTransitPassPropertiesForPass

void __NPKUpdateTransitPassPropertiesForPass_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(v6, "setTransitProperties:", *(_QWORD *)(a1 + 40));

}

@end
