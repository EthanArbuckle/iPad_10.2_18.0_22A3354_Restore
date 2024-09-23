@implementation CNBirthdayDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 17;
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 4;
}

- (uint64_t)ABSValueFromCNValue:()ABSExtentions
{
  return objc_msgSend(MEMORY[0x24BE19240], "dateFromDayComponents:");
}

- (uint64_t)CNValueFromABSValue:()ABSExtentions
{
  return objc_msgSend(MEMORY[0x24BE19240], "dayComponentsFromDate:");
}

@end
