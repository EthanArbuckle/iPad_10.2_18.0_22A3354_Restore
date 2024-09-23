@implementation HUCharacteristicEventUnknownItem

- (NSSet)services
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)accessories
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
