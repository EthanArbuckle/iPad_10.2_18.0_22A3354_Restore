@implementation AVVoiceTriggerNotificationForwarder

- (void)speakerStateChangedNotification:(id)a3
{
  VoiceTriggerNotificationInterface **p_target;
  id v4;
  id WeakRetained;

  p_target = &self->_target;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  objc_msgSend(WeakRetained, "speakerStateChangedNotification:", v4);

}

- (void)portStateChangedNotification:(id)a3
{
  VoiceTriggerNotificationInterface **p_target;
  id v4;
  id WeakRetained;

  p_target = &self->_target;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  objc_msgSend(WeakRetained, "portStateChangedNotification:", v4);

}

- (void)voiceTriggerNotification:(id)a3
{
  VoiceTriggerNotificationInterface **p_target;
  id v4;
  id WeakRetained;

  p_target = &self->_target;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_target);
  objc_msgSend(WeakRetained, "voiceTriggerNotification:", v4);

}

- (void)speakerMuteStateChangedNotification:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "speakerMuteStateChangedNotification:", v3);

}

- (void)siriClientRecordStateChangedNotification:(BOOL)a3 recordingCount:(unint64_t)a4
{
  _BOOL8 v5;
  id WeakRetained;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "siriClientRecordStateChangedNotification:recordingCount:", v5, a4);

}

- (VoiceTriggerNotificationInterface)target
{
  return (VoiceTriggerNotificationInterface *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
