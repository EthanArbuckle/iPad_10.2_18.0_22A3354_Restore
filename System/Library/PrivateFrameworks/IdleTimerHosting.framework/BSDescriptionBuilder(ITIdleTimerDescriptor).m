@implementation BSDescriptionBuilder(ITIdleTimerDescriptor)

- (void)itidletimerdescriptor_appendTimeInterval:()ITIdleTimerDescriptor withName:
{
  id v6;
  id v7;

  v7 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0)
    v6 = (id)objc_msgSend(a1, "appendTimeInterval:withName:decomposeUnits:", v7, 0, a2);

}

@end
