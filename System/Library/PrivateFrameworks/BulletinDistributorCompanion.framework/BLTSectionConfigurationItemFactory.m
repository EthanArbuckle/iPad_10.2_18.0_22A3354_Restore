@implementation BLTSectionConfigurationItemFactory

+ (id)itemForSection:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (itemForSection_dictionary__onceToken != -1)
    dispatch_once(&itemForSection_dictionary__onceToken, &__block_literal_global_3);
  v7 = (objc_class *)(id)objc_msgSend((id)itemForSection_dictionary___sectionToItemClassMap, "objectForKeyedSubscript:", v5);
  if (!v7)
    v7 = (objc_class *)objc_opt_class();
  v8 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v6);

  return v8;
}

void __64__BLTSectionConfigurationItemFactory_itemForSection_dictionary___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.cmas");
  v2[1] = CFSTR("com.apple.MobileSMS");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)itemForSection_dictionary___sectionToItemClassMap;
  itemForSection_dictionary___sectionToItemClassMap = v0;

}

@end
