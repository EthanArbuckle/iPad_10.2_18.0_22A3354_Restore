@implementation FLHostViewController

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E47148);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E617C0);
}

- (id)serviceViewControllerInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serviceViewControllerInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "exportedInterface");
}

@end
