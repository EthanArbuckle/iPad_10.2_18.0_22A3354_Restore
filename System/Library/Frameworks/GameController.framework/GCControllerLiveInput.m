@implementation GCControllerLiveInput

- (GCControllerLiveInput)unmappedInput
{
  return (GCControllerLiveInput *)-[_GCDevicePhysicalInputFacade alternatePhysicalInputWithAttribute:](self, "alternatePhysicalInputWithAttribute:", CFSTR("unmapped"));
}

@end
