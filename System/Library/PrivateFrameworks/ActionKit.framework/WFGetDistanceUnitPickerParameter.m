@implementation WFGetDistanceUnitPickerParameter

- (id)defaultSerializedRepresentation
{
  const __CFString *v2;

  if (objc_msgSend(MEMORY[0x24BEC1540], "usesMetricSystemForUnitType:", *MEMORY[0x24BEC19E8]))
    v2 = CFSTR("Kilometers");
  else
    v2 = CFSTR("Miles");
  return (id)objc_msgSend(MEMORY[0x24BEC40C8], "serializedRepresentationFromValue:", v2);
}

@end
