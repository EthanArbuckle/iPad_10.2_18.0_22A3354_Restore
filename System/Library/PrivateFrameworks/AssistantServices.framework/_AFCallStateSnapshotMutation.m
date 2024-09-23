@implementation _AFCallStateSnapshotMutation

- (_AFCallStateSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFCallStateSnapshotMutation *v6;
  _AFCallStateSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCallStateSnapshotMutation;
  v6 = -[_AFCallStateSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getCallState
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_callState;
  else
    return -[AFCallStateSnapshot callState](self->_base, "callState");
}

- (void)setCallState:(unint64_t)a3
{
  self->_callState = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (BOOL)getOnSpeaker
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_onSpeaker;
  else
    return -[AFCallStateSnapshot onSpeaker](self->_base, "onSpeaker");
}

- (void)setOnSpeaker:(BOOL)a3
{
  self->_onSpeaker = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsDropInCall
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_isDropInCall;
  else
    return -[AFCallStateSnapshot isDropInCall](self->_base, "isDropInCall");
}

- (void)setIsDropInCall:(BOOL)a3
{
  self->_isDropInCall = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
