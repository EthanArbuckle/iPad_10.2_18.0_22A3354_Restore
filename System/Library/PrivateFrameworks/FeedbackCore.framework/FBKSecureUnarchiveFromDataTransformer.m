@implementation FBKSecureUnarchiveFromDataTransformer

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__FBKSecureUnarchiveFromDataTransformer_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __51__FBKSecureUnarchiveFromDataTransformer_initialize__block_invoke(uint64_t a1)
{
  void *v1;
  FBKSecureUnarchiveFromDataTransformer *v2;

  v1 = *(void **)(a1 + 32);
  v2 = objc_alloc_init(FBKSecureUnarchiveFromDataTransformer);
  objc_msgSend(v1, "setValueTransformer:forName:", v2, CFSTR("FBKSecureUnarchiveFromDataTransformer"));

}

+ (id)allowedTopLevelClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__FBKSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedTopLevelClasses_onceToken != -1)
    dispatch_once(&allowedTopLevelClasses_onceToken, block);
  return (id)allowedTopLevelClasses_classes;
}

void __63__FBKSecureUnarchiveFromDataTransformer_allowedTopLevelClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCEB8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___FBKSecureUnarchiveFromDataTransformer;
  objc_msgSendSuper2(&v7, sel_allowedTopLevelClasses);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)allowedTopLevelClasses_classes;
  allowedTopLevelClasses_classes = v5;

}

@end
