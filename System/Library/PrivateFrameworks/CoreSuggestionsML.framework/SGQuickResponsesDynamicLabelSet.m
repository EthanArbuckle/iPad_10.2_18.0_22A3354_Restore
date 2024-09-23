@implementation SGQuickResponsesDynamicLabelSet

+ (id)dynamicLabelSet
{
  if (dynamicLabelSet_onceToken != -1)
    dispatch_once(&dynamicLabelSet_onceToken, &__block_literal_global_1978);
  return (id)dynamicLabelSet_dynamicLabelSet;
}

+ (BOOL)isDynamicLabel:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "dynamicLabelSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

void __50__SGQuickResponsesDynamicLabelSet_dynamicLabelSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x220753E80]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_24DDCF878);
  v2 = (void *)dynamicLabelSet_dynamicLabelSet;
  dynamicLabelSet_dynamicLabelSet = v1;

  objc_autoreleasePoolPop(v0);
}

@end
