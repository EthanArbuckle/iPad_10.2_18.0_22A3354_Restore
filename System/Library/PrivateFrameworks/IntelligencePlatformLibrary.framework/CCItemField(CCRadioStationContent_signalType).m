@implementation CCItemField(CCRadioStationContent_signalType)

- (uint64_t)radioStationContentSignalType
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "uint32Value");
  if (result >= 6)
    return 0;
  else
    return result;
}

@end
