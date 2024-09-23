@implementation SwitchToAUApp

void __SwitchToAUApp_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("openApplication returned %@"), a2);
}

@end
