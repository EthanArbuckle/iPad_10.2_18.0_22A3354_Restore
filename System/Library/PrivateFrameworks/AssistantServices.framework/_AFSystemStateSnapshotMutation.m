@implementation _AFSystemStateSnapshotMutation

- (_AFSystemStateSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFSystemStateSnapshotMutation *v6;
  _AFSystemStateSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSystemStateSnapshotMutation;
  v6 = -[_AFSystemStateSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getSleepState
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_sleepState;
  else
    return -[AFSystemStateSnapshot sleepState](self->_base, "sleepState");
}

- (void)setSleepState:(int64_t)a3
{
  self->_sleepState = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
