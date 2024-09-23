@implementation _MSRemoteViewController

- (void)requestDismiss
{
  id v2;

  -[_MSRemoteViewController host](self, "host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDismiss");

}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550BCD08);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550CD650);
}

- (MSViewServiceHostProtocol)host
{
  return (MSViewServiceHostProtocol *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
}

@end
