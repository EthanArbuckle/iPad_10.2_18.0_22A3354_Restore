@implementation _AFBluetoothDeviceBooleanSettingResponseMutation

- (_AFBluetoothDeviceBooleanSettingResponseMutation)initWithBase:(id)a3
{
  id v5;
  _AFBluetoothDeviceBooleanSettingResponseMutation *v6;
  _AFBluetoothDeviceBooleanSettingResponseMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothDeviceBooleanSettingResponseMutation;
  v6 = -[_AFBluetoothDeviceBooleanSettingResponseMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getValue
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_value;
  else
    return -[AFBluetoothDeviceBooleanSettingResponse value](self->_base, "value");
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getStatus
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_status;
  else
    return -[AFBluetoothDeviceBooleanSettingResponse status](self->_base, "status");
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
