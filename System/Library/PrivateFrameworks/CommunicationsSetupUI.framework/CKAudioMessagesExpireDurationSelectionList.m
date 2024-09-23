@implementation CKAudioMessagesExpireDurationSelectionList

- (id)expireDescription
{
  int v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = +[CKSettingsMessagesController currentMessageAutoKeepOptionForType:](CKSettingsMessagesController, "currentMessageAutoKeepOptionForType:", 1);
  if (v2 == 2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    MessagesSettingsLocalizedString(CFSTR("AUDIO_MESSAGES_EXPIRE_DESCRIPTION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("LOWER_CASE_1_YEAR");
  }
  else if (v2 == 1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    MessagesSettingsLocalizedString(CFSTR("AUDIO_MESSAGES_EXPIRE_DESCRIPTION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("LOWER_CASE_30_DAYS");
  }
  else
  {
    if (v2)
    {
      v7 = &stru_24D077260;
      return v7;
    }
    v3 = (void *)MEMORY[0x24BDD17C8];
    MessagesSettingsLocalizedString(CFSTR("AUDIO_MESSAGES_EXPIRE_DESCRIPTION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("LOWER_CASE_2_MINUTES");
  }
  MessagesSettingsLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
