@implementation NSSNewsRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2555895B8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255582EF8);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  -[NSSNewsRemoteViewController dismissAnimated:](self, "dismissAnimated:", 0);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  -[NSSNewsRemoteViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSSNewsRemoteViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", v3);
  }
  else
  {
    -[NSSNewsRemoteViewController presentingViewController](self, "presentingViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v3, 0);
  }

}

@end
