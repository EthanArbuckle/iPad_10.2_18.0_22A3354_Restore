@implementation NSObject(EFScheduler)

- (id)ef_onScheduler:()EFScheduler
{
  objc_msgSend(a3, "performWithObject:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
