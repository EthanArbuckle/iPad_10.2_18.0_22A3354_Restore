@implementation BTDevicePickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25591CFE8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25590C130);
}

- (void)didDismissWithResult:(int64_t)a3 deviceAddress:(id)a4
{
  BTDevicePickerRemoteViewControllerHost **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didDismissWithResult:deviceAddress:", a3, v6);

}

- (void)discoveredDevice:(id)a3 deviceAddress:(id)a4
{
  BTDevicePickerRemoteViewControllerHost **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "discoveredDevice:deviceAddress:", v7, v6);

}

- (BTDevicePickerRemoteViewControllerHost)_delegate
{
  return (BTDevicePickerRemoteViewControllerHost *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
