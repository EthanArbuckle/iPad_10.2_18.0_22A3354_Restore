@implementation _AFBluetoothHeadGestureConfigurationMutation

- (_AFBluetoothHeadGestureConfigurationMutation)initWithBase:(id)a3
{
  id v5;
  _AFBluetoothHeadGestureConfigurationMutation *v6;
  _AFBluetoothHeadGestureConfigurationMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothHeadGestureConfigurationMutation;
  v6 = -[_AFBluetoothHeadGestureConfigurationMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (BOOL)getIsEnabled
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_isEnabled;
  else
    return -[AFBluetoothHeadGestureConfiguration isEnabled](self->_base, "isEnabled");
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (BOOL)getIsSupported
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_isSupported;
  else
    return -[AFBluetoothHeadGestureConfiguration isSupported](self->_base, "isSupported");
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getAcceptGesture
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_acceptGesture;
  else
    return -[AFBluetoothHeadGestureConfiguration acceptGesture](self->_base, "acceptGesture");
}

- (void)setAcceptGesture:(int64_t)a3
{
  self->_acceptGesture = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (int64_t)getRejectGesture
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_rejectGesture;
  else
    return -[AFBluetoothHeadGestureConfiguration rejectGesture](self->_base, "rejectGesture");
}

- (void)setRejectGesture:(int64_t)a3
{
  self->_rejectGesture = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
