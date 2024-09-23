@implementation DNDSystemActionMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SystemAction"));
}

- (Class)dnd_settingsType
{
  return (Class)objc_opt_class();
}

@end
