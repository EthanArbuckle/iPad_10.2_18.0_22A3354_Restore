@implementation _AFApplicationContextSnapshotMutation

- (_AFApplicationContextSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFApplicationContextSnapshotMutation *v6;
  _AFApplicationContextSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFApplicationContextSnapshotMutation;
  v6 = -[_AFApplicationContextSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getApplicationContexts
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_applicationContexts;
  }
  else
  {
    -[AFApplicationContextSnapshot applicationContexts](self->_base, "applicationContexts");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setApplicationContexts:(id)a3
{
  objc_storeStrong((id *)&self->_applicationContexts, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationContexts, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
