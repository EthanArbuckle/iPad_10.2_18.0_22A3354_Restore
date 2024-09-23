@implementation CPSPublicSafetyTemplateClasses

void __CPSPublicSafetyTemplateClasses_block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v13 = a1;
  v12 = (id)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v1 = (id)objc_msgSend(v12, "setWithObjects:", v11, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v2 = (void *)CPSPublicSafetyTemplateClasses_classes;
  CPSPublicSafetyTemplateClasses_classes = (uint64_t)v1;

}

@end
