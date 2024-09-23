@implementation HMAction(HFDebugging)

- (HFStateDumpBuilder)hf_stateDumpBuilderWithContext:()HFDebugging
{
  return +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, a3);
}

@end
