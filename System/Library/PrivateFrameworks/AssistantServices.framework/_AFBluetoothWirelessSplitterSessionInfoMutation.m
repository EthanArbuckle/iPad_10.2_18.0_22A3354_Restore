@implementation _AFBluetoothWirelessSplitterSessionInfoMutation

- (_AFBluetoothWirelessSplitterSessionInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFBluetoothWirelessSplitterSessionInfoMutation *v6;
  _AFBluetoothWirelessSplitterSessionInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothWirelessSplitterSessionInfoMutation;
  v6 = -[_AFBluetoothWirelessSplitterSessionInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getState
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_state;
  else
    return -[AFBluetoothWirelessSplitterSessionInfo state](self->_base, "state");
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getDeviceAddresses
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_deviceAddresses;
  }
  else
  {
    -[AFBluetoothWirelessSplitterSessionInfo deviceAddresses](self->_base, "deviceAddresses");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_deviceAddresses, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddresses, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
