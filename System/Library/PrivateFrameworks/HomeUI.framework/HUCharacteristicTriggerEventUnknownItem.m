@implementation HUCharacteristicTriggerEventUnknownItem

- (NSSet)services
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)accessories
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
