@implementation _AFSetAudioSessionActiveContextMutation

- (_AFSetAudioSessionActiveContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFSetAudioSessionActiveContextMutation *v6;
  _AFSetAudioSessionActiveContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSetAudioSessionActiveContextMutation;
  v6 = -[_AFSetAudioSessionActiveContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getOptions
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_options;
  else
    return -[AFSetAudioSessionActiveContext options](self->_base, "options");
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getReason
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_reason;
  else
    return -[AFSetAudioSessionActiveContext reason](self->_base, "reason");
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getSpeechRequestOptions
{
  AFSpeechRequestOptions *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_speechRequestOptions;
  }
  else
  {
    -[AFSetAudioSessionActiveContext speechRequestOptions](self->_base, "speechRequestOptions");
    v2 = (AFSpeechRequestOptions *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpeechRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequestOptions, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
