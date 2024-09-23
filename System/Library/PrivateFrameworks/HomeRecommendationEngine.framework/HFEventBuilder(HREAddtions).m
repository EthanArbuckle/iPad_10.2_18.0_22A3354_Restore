@implementation HFEventBuilder(HREAddtions)

- (uint64_t)recommendableObjectsInvolved
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

@end
