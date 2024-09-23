@implementation _AFMyriadContextMutation

- (_AFMyriadContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFMyriadContextMutation *v6;
  _AFMyriadContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadContextMutation;
  v6 = -[_AFMyriadContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getTimestamp
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_timestamp;
  else
    return -[AFMyriadContext timestamp](self->_base, "timestamp");
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getPerceptualAudioHash
{
  AFMyriadPerceptualAudioHash *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_perceptualAudioHash;
  }
  else
  {
    -[AFMyriadContext perceptualAudioHash](self->_base, "perceptualAudioHash");
    v2 = (AFMyriadPerceptualAudioHash *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPerceptualAudioHash:(id)a3
{
  objc_storeStrong((id *)&self->_perceptualAudioHash, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getOverrideState
{
  AFMyriadGoodnessScoreOverrideState *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_overrideState;
  }
  else
  {
    -[AFMyriadContext overrideState](self->_base, "overrideState");
    v2 = (AFMyriadGoodnessScoreOverrideState *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOverrideState:(id)a3
{
  objc_storeStrong((id *)&self->_overrideState, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (int64_t)getActivationSource
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
    return self->_activationSource;
  else
    return -[AFMyriadContext activationSource](self->_base, "activationSource");
}

- (void)setActivationSource:(int64_t)a3
{
  self->_activationSource = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getActivationExpirationTime
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_activationExpirationTime;
  else
    return -[AFMyriadContext activationExpirationTime](self->_base, "activationExpirationTime");
}

- (void)setActivationExpirationTime:(unint64_t)a3
{
  self->_activationExpirationTime = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_perceptualAudioHash, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
