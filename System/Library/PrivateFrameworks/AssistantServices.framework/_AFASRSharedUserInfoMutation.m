@implementation _AFASRSharedUserInfoMutation

- (_AFASRSharedUserInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFASRSharedUserInfoMutation *v6;
  _AFASRSharedUserInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFASRSharedUserInfoMutation;
  v6 = -[_AFASRSharedUserInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getSharedUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_sharedUserId;
  }
  else
  {
    -[AFASRSharedUserInfo sharedUserId](self->_base, "sharedUserId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSharedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserId, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getLoggableSharedUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_loggableSharedUserId;
  }
  else
  {
    -[AFASRSharedUserInfo loggableSharedUserId](self->_base, "loggableSharedUserId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLoggableSharedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_loggableSharedUserId, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
