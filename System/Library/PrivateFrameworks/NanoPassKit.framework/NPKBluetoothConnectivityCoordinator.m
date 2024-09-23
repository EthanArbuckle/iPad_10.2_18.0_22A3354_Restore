@implementation NPKBluetoothConnectivityCoordinator

- (NPKBluetoothConnectivityCoordinator)init
{
  NPKBluetoothConnectivityCoordinator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NPKBluetoothConnectivityCoordinator;
  result = -[NPKBluetoothConnectivityCoordinator init](&v3, sel_init);
  if (result)
    result->_bluetoothAvailableAndEnabled = 0;
  return result;
}

- (BOOL)isBluetoothEnabled
{
  return 1;
}

- (NPKBluetoothConnectivityCoordinatorDelegate)delegate
{
  return (NPKBluetoothConnectivityCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)bluetoothAvailableAndEnabled
{
  return self->_bluetoothAvailableAndEnabled;
}

- (void)setBluetoothAvailableAndEnabled:(unint64_t)a3
{
  self->_bluetoothAvailableAndEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
