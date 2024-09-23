@implementation SNSoundPrint100kSmokeAlarmModelInput

- (SNSoundPrint100kSmokeAlarmModelInput)initWithSoundprint_Placeholder:(id)a3
{
  id v5;
  SNSoundPrint100kSmokeAlarmModelInput *v6;
  SNSoundPrint100kSmokeAlarmModelInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNSoundPrint100kSmokeAlarmModelInput;
  v6 = -[SNSoundPrint100kSmokeAlarmModelInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_soundprint_Placeholder, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA6F8);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("soundprint/Placeholder")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[SNSoundPrint100kSmokeAlarmModelInput soundprint_Placeholder](self, "soundprint_Placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueWithMultiArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)soundprint_Placeholder
{
  return self->_soundprint_Placeholder;
}

- (void)setSoundprint_Placeholder:(id)a3
{
  objc_storeStrong((id *)&self->_soundprint_Placeholder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundprint_Placeholder, 0);
}

@end
