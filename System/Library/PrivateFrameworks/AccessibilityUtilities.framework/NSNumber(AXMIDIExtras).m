@implementation NSNumber(AXMIDIExtras)

- (uint64_t)MIDIObject
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

- (uint64_t)MIDIDevice
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

- (uint64_t)MIDIEntity
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

- (uint64_t)MIDIEndpoint
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

@end
