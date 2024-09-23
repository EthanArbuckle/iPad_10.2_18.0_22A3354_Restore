@implementation CPSCommunicationTemplateClasses

void __CPSCommunicationTemplateClasses_block_invoke(uint64_t a1)
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
  id v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  v12 = a1;
  v11 = (id)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v1 = (id)objc_msgSend(v11, "setWithObjects:", v10, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v2 = (void *)CPSCommunicationTemplateClasses_classes;
  CPSCommunicationTemplateClasses_classes = (uint64_t)v1;

}

@end
