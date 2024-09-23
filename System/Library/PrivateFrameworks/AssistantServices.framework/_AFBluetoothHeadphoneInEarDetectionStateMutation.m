@implementation _AFBluetoothHeadphoneInEarDetectionStateMutation

- (_AFBluetoothHeadphoneInEarDetectionStateMutation)initWithBase:(id)a3
{
  id v5;
  _AFBluetoothHeadphoneInEarDetectionStateMutation *v6;
  _AFBluetoothHeadphoneInEarDetectionStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBluetoothHeadphoneInEarDetectionStateMutation;
  v6 = -[_AFBluetoothHeadphoneInEarDetectionStateMutation init](&v9, sel_init);
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
    return -[AFBluetoothHeadphoneInEarDetectionState isEnabled](self->_base, "isEnabled");
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getPrimaryEarbudSide
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_primaryEarbudSide;
  else
    return -[AFBluetoothHeadphoneInEarDetectionState primaryEarbudSide](self->_base, "primaryEarbudSide");
}

- (void)setPrimaryEarbudSide:(int64_t)a3
{
  self->_primaryEarbudSide = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getPrimaryInEarStatus
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_primaryInEarStatus;
  else
    return -[AFBluetoothHeadphoneInEarDetectionState primaryInEarStatus](self->_base, "primaryInEarStatus");
}

- (void)setPrimaryInEarStatus:(int64_t)a3
{
  self->_primaryInEarStatus = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (int64_t)getSecondaryInEarStatus
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_secondaryInEarStatus;
  else
    return -[AFBluetoothHeadphoneInEarDetectionState secondaryInEarStatus](self->_base, "secondaryInEarStatus");
}

- (void)setSecondaryInEarStatus:(int64_t)a3
{
  self->_secondaryInEarStatus = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
