@implementation AssistantVoiceControllerVoiceSettings

+ (id)settingsWithInProgressVoice:(id)a3 currentVoice:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setInProgressVoice:", v6);

  objc_msgSend(v7, "setCurrentVoice:", v5);
  return v7;
}

- (AFVoiceInfo)inProgressVoice
{
  return self->_inProgressVoice;
}

- (void)setInProgressVoice:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressVoice, a3);
}

- (AFVoiceInfo)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
  objc_storeStrong((id *)&self->_currentVoice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_inProgressVoice, 0);
}

@end
