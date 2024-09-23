@implementation NSDate(WFNaming)

- (uint64_t)wfName
{
  return objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", a1, 2, 1);
}

@end
