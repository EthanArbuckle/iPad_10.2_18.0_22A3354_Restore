@implementation COCapabilityReadRequest

+ (id)acceptableResponses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

@end
