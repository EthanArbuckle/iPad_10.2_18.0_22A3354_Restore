@implementation _AFSiriActivationResultMutation

- (_AFSiriActivationResultMutation)initWithBase:(id)a3
{
  id v5;
  _AFSiriActivationResultMutation *v6;
  _AFSiriActivationResultMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSiriActivationResultMutation;
  v6 = -[_AFSiriActivationResultMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getActionType
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_actionType;
  else
    return -[AFSiriActivationResult actionType](self->_base, "actionType");
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
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
    -[AFSiriActivationResult error](self->_base, "error");
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
