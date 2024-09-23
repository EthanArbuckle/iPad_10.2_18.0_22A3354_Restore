@implementation HKQuantity(Workflow)

- (void)wf_normalizedDoubleValueForUnit:()Workflow
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD4048];
  v5 = a3;
  objc_msgSend(v4, "unitFromString:", CFSTR("%"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isEqual:", v6);

  objc_msgSend(a1, "doubleValueForUnit:", v5);
}

@end
