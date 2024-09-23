@implementation _AFSpeechRecordingAlertPolicyMutation

- (_AFSpeechRecordingAlertPolicyMutation)initWithBase:(id)a3
{
  id v5;
  _AFSpeechRecordingAlertPolicyMutation *v6;
  _AFSpeechRecordingAlertPolicyMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechRecordingAlertPolicyMutation;
  v6 = -[_AFSpeechRecordingAlertPolicyMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getStartingAlertBehavior
{
  AFSpeechRecordingAlertBehavior *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_startingAlertBehavior;
  }
  else
  {
    -[AFSpeechRecordingAlertPolicy startingAlertBehavior](self->_base, "startingAlertBehavior");
    v2 = (AFSpeechRecordingAlertBehavior *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setStartingAlertBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_startingAlertBehavior, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getStoppedAlertBehavior
{
  AFSpeechRecordingAlertBehavior *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_stoppedAlertBehavior;
  }
  else
  {
    -[AFSpeechRecordingAlertPolicy stoppedAlertBehavior](self->_base, "stoppedAlertBehavior");
    v2 = (AFSpeechRecordingAlertBehavior *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setStoppedAlertBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_stoppedAlertBehavior, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getStoppedWithErrorAlertBehavior
{
  AFSpeechRecordingAlertBehavior *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_stoppedWithErrorAlertBehavior;
  }
  else
  {
    -[AFSpeechRecordingAlertPolicy stoppedWithErrorAlertBehavior](self->_base, "stoppedWithErrorAlertBehavior");
    v2 = (AFSpeechRecordingAlertBehavior *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setStoppedWithErrorAlertBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_stoppedWithErrorAlertBehavior, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppedWithErrorAlertBehavior, 0);
  objc_storeStrong((id *)&self->_stoppedAlertBehavior, 0);
  objc_storeStrong((id *)&self->_startingAlertBehavior, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
