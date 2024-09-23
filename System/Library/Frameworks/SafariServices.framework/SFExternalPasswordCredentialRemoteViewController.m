@implementation SFExternalPasswordCredentialRemoteViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentExternalPasswordCredentialRemoteViewController
{
  id v3;

  -[SFPasswordRemoteViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentExternalPasswordCredentialRemoteViewController:", self);

}

+ (id)passwordServiceViewControllerName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE789A70);
}

+ (id)serviceViewControllerInterface
{
  return +[SFExternalPasswordCredentialServiceViewController _exportedInterface](SFExternalPasswordCredentialServiceViewController, "_exportedInterface");
}

@end
