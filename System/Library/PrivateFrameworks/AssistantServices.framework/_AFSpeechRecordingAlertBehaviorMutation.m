@implementation _AFSpeechRecordingAlertBehaviorMutation

- (_AFSpeechRecordingAlertBehaviorMutation)initWithBase:(id)a3
{
  id v5;
  _AFSpeechRecordingAlertBehaviorMutation *v6;
  _AFSpeechRecordingAlertBehaviorMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechRecordingAlertBehaviorMutation;
  v6 = -[_AFSpeechRecordingAlertBehaviorMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getStyle
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_style;
  else
    return -[AFSpeechRecordingAlertBehavior style](self->_base, "style");
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (int64_t)getBeepSoundID
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_beepSoundID;
  else
    return -[AFSpeechRecordingAlertBehavior beepSoundID](self->_base, "beepSoundID");
}

- (void)setBeepSoundID:(int64_t)a3
{
  self->_beepSoundID = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
}

@end
