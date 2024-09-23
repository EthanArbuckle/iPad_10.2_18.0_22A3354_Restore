@implementation HKUnit(Workflow)

+ (id)wf_safeUnitFromString:()Workflow
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
