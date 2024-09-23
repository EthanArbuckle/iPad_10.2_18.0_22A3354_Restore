@implementation _AFClientInfoMutation

- (_AFClientInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFClientInfoMutation *v6;
  _AFClientInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClientInfoMutation;
  v6 = -[_AFClientInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int)getProcessIdentifier
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_processIdentifier;
  else
    return -[AFClientInfo processIdentifier](self->_base, "processIdentifier");
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getProcessName
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_processName;
  }
  else
  {
    -[AFClientInfo processName](self->_base, "processName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
