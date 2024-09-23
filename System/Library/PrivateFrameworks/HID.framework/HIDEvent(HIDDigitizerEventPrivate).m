@implementation HIDEvent(HIDDigitizerEventPrivate)

- (uint64_t)digitizerAltitude
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerAltitude:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerAuxiliaryPressure
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerAuxiliaryPressure:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerAzimuth
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerAzimuth:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerButtonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerButtonMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerChildEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerChildEventMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerCollection
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerCollection:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerDensity
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerDensity:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerDidUpdateMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerDidUpdateMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerEventMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerGenerationCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerGenerationCount:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerIdentity
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIdentity:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerIndex
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIndex:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerIrregularity
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerIrregularity:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerIsDisplayIntegrated
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIsDisplayIntegrated:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerMajorRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerMajorRadius:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerMinorRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerMinorRadius:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerOrientationType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)digitizerPressure
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerPressure:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerQuality
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerQuality:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerQualityRadiiAccuracy
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerQualityRadiiAccuracy:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerRange
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerRange:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerRoll
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerRoll:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerTiltX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerTiltX:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerTiltY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerTiltY:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerTouch
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerTouch:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerTwist
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerTwist:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerType:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerWillUpdateMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerWillUpdateMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerX:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerY:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerZ:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end
