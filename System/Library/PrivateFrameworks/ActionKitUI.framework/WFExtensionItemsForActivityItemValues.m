@implementation WFExtensionItemsForActivityItemValues

void __WFExtensionItemsForActivityItemValues_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v7, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  }

  if (*(_BYTE *)(a1 + 32))
    v6 = MEMORY[0x24BDBD1C8];
  else
    v6 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE8F720]);
  objc_msgSend(v7, "setUserInfo:", v5);

}

@end
