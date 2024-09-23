@implementation CLFMessagesSettings_GeneratedCode

+ (CLFMessagesSettings)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_4);
  return (CLFMessagesSettings *)(id)sharedInstance_SharedSettings_2;
}

- (CLFMessagesSettings_GeneratedCode)init
{
  CLFMessagesSettings_GeneratedCode *v2;
  CLFMessagesSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLFMessagesSettings_GeneratedCode;
  v2 = -[CLFBaseCommunicationLimitSettings_GeneratedCode init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_conversationDetailsEnabled);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("ConversationDetailsEnabled"), v5);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emojiKeyboardEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("EmojiKeyboardEnabled"), v7);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_softwareKeyboardEnabled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("SoftwareKeyboardEnabled"), v9);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_tapToSpeakEnabled);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("TapToSpeakEnabled"), v11);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_videoRecordingEnabled);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("VideoRecordingEnabled"), v13);

  }
  return v3;
}

+ (id)domainName
{
  return CFSTR("com.apple.ClarityUI.Messages");
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___CLFMessagesSettings_GeneratedCode;
  objc_msgSendSuper2(&v11, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_conversationDetailsEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  NSStringFromSelector(sel_emojiKeyboardEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  NSStringFromSelector(sel_softwareKeyboardEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  NSStringFromSelector(sel_tapToSpeakEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  NSStringFromSelector(sel_videoRecordingEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)conversationDetailsEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("ConversationDetailsEnabled"), 0);
}

- (void)setConversationDetailsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ConversationDetailsEnabled"));

}

- (BOOL)emojiKeyboardEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("EmojiKeyboardEnabled"), 1);
}

- (void)setEmojiKeyboardEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("EmojiKeyboardEnabled"));

}

- (BOOL)softwareKeyboardEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("SoftwareKeyboardEnabled"), 1);
}

- (void)setSoftwareKeyboardEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SoftwareKeyboardEnabled"));

}

- (BOOL)tapToSpeakEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("TapToSpeakEnabled"), 0);
}

- (void)setTapToSpeakEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("TapToSpeakEnabled"));

}

- (BOOL)videoRecordingEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("VideoRecordingEnabled"), 1);
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VideoRecordingEnabled"));

}

@end
