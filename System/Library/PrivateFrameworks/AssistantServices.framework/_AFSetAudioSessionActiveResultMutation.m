@implementation _AFSetAudioSessionActiveResultMutation

- (_AFSetAudioSessionActiveResultMutation)initWithBase:(id)a3
{
  id v5;
  _AFSetAudioSessionActiveResultMutation *v6;
  _AFSetAudioSessionActiveResultMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSetAudioSessionActiveResultMutation;
  v6 = -[_AFSetAudioSessionActiveResultMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unsigned)getAudioSessionID
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_audioSessionID;
  else
    return -[AFSetAudioSessionActiveResult audioSessionID](self->_base, "audioSessionID");
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getError
{
  NSError *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_error;
  }
  else
  {
    -[AFSetAudioSessionActiveResult error](self->_base, "error");
    v2 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
