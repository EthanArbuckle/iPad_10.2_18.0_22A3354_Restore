@implementation HKQuery(FIUIQuerySupport)

+ (uint64_t)fiui_predicateForWorkoutsWithMetadataIndoor:()FIUIQuerySupport
{
  uint64_t v3;

  if (a3)
    v3 = 4;
  else
    v3 = 5;
  return objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsWithMetadataKey:operatorType:value:", *MEMORY[0x24BDD31C0], v3, MEMORY[0x24BDBD1C8]);
}

+ (id)fiui_predicateForWorkoutsWithMetadataSwimmingLocationType:()FIUIQuerySupport
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDD3E88];
  v1 = *MEMORY[0x24BDD3200];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateForObjectsWithMetadataKey:operatorType:value:", v1, 4, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
