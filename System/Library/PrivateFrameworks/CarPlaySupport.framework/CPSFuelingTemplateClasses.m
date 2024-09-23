@implementation CPSFuelingTemplateClasses

void __CPSFuelingTemplateClasses_block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  v9 = (id)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v1 = (id)objc_msgSend(v9, "setWithObjects:", v8, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v2 = (void *)CPSFuelingTemplateClasses_classes;
  CPSFuelingTemplateClasses_classes = (uint64_t)v1;

}

@end
