@implementation _AFAccessibilityStateMutation

- (_AFAccessibilityStateMutation)initWithBase:(id)a3
{
  id v5;
  _AFAccessibilityStateMutation *v6;
  _AFAccessibilityStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAccessibilityStateMutation;
  v6 = -[_AFAccessibilityStateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getIsVoiceOverTouchEnabled
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_isVoiceOverTouchEnabled;
  else
    return -[AFAccessibilityState isVoiceOverTouchEnabled](self->_base, "isVoiceOverTouchEnabled");
}

- (void)setIsVoiceOverTouchEnabled:(int64_t)a3
{
  self->_isVoiceOverTouchEnabled = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getIsVibrationDisabled
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_isVibrationDisabled;
  else
    return -[AFAccessibilityState isVibrationDisabled](self->_base, "isVibrationDisabled");
}

- (void)setIsVibrationDisabled:(int64_t)a3
{
  self->_isVibrationDisabled = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
