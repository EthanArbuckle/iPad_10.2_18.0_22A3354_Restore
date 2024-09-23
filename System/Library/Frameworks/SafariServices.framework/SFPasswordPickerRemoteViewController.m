@implementation SFPasswordPickerRemoteViewController

+ (id)passwordServiceViewControllerName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE75D540);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE706058);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)selectedCredential:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFPasswordRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewController:selectedCredential:", self, v5);

}

- (void)fillUsername:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFPasswordRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewController:fillUsername:", self, v5);

}

- (void)fillPassword:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFPasswordRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewController:fillPassword:", self, v5);

}

- (void)fillVerificationCode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFPasswordRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewController:fillVerificationCode:", self, v5);

}

- (void)fillText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SFPasswordRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewController:fillText:", self, v5);

}

@end
