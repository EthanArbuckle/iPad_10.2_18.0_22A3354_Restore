@implementation CN

void __53__CN_ABSExtensions__contactPropertiesByABSPropertyID__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "allContactProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_filter:", &__block_literal_global_53);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_cn_indexBy:", &__block_literal_global_55);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)contactPropertiesByABSPropertyID_cn_once_object_1;
  contactPropertiesByABSPropertyID_cn_once_object_1 = v3;

}

uint64_t __53__CN_ABSExtensions__contactPropertiesByABSPropertyID__block_invoke_2(uint64_t a1, void *a2)
{
  int v3;

  v3 = 0;
  return objc_msgSend(a2, "absPropertyID:", &v3);
}

id __53__CN_ABSExtensions__contactPropertiesByABSPropertyID__block_invoke_3(uint64_t a1, void *a2)
{
  unsigned int v3;

  v3 = 0;
  objc_msgSend(a2, "absPropertyID:", &v3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
