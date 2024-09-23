@implementation AFUITTRReport

- (AFUITTRReport)init
{
  AFUITTRReport *v2;
  AFUITTRReport *v3;
  NSString *timestamp;
  NSString *actualASRTranscript;
  NSString *observedBehavior;
  NSString *expectedBehavior;
  NSString *userSuggestedASRTranscript;
  NSString *userSuggestedDomain;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AFUITTRReport;
  v2 = -[AFUITTRReport init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_asrIsCorrect = 1;
    v2->_audioRecordingIsUnderstandable = 0;
    v2->_domainIsCorrect = 0;
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSString *)&stru_24D7A4738;

    actualASRTranscript = v3->_actualASRTranscript;
    v3->_actualASRTranscript = (NSString *)&stru_24D7A4738;

    observedBehavior = v3->_observedBehavior;
    v3->_observedBehavior = (NSString *)&stru_24D7A4738;

    expectedBehavior = v3->_expectedBehavior;
    v3->_expectedBehavior = (NSString *)&stru_24D7A4738;

    userSuggestedASRTranscript = v3->_userSuggestedASRTranscript;
    v3->_userSuggestedASRTranscript = (NSString *)&stru_24D7A4738;

    userSuggestedDomain = v3->_userSuggestedDomain;
    v3->_userSuggestedDomain = (NSString *)&stru_24D7A4738;

  }
  return v3;
}

- (id)composeRadarOutput
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(CFSTR("Siri Tap-To-Radar"), "stringByAppendingFormat:", CFSTR("\n\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUITTRReport getTimestampFormatted](self, "getTimestampFormatted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", &stru_24D7A4738) & 1) == 0)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@: %@\n"), CFSTR("Timestamp"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (!-[NSString isEqualToString:](self->_actualASRTranscript, "isEqualToString:", &stru_24D7A4738))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), self->_actualASRTranscript);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ → %@\n"), CFSTR("[Utterance]"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  if (self->_asrIsCorrect)
    -[AFUITTRReport analyzeASRIsCorrect](self, "analyzeASRIsCorrect");
  else
    -[AFUITTRReport analyzeASRIsWrong](self, "analyzeASRIsWrong");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUITTRReport composeAdditionalDetails](self, "composeAdditionalDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)analyzeASRIsCorrect
{
  void *v3;
  void *v4;
  int64_t domainIsCorrect;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ → %@\n"), CFSTR("[ASR]"), CFSTR("No issues reported"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domainIsCorrect = self->_domainIsCorrect;
  if (domainIsCorrect == 1)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ → %@\n"), CFSTR("[Domain]"), CFSTR("Reported as incorrect"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\t- %@: %@\n"), CFSTR("Siri predicted domain"), self->_actualDomain);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[NSString isEqualToString:](self->_userSuggestedDomain, "isEqualToString:", &stru_24D7A4738))
    {
      objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\t- %@: %@\n"), CFSTR("User suggested domain"), self->_userSuggestedDomain);
      goto LABEL_6;
    }
  }
  else if (domainIsCorrect == 2)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ → %@\n"), CFSTR("[Domain]"), CFSTR("No issues reported"));
LABEL_6:
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)analyzeASRIsWrong
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t audioRecordingIsUnderstandable;
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ → %@\n"), CFSTR("[ASR]"), CFSTR("Reported as incorrect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_userSuggestedASRTranscript)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), self->_userSuggestedASRTranscript);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ → %@\n"), CFSTR("[User suggested ASR Transcript]"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  audioRecordingIsUnderstandable = self->_audioRecordingIsUnderstandable;
  if (audioRecordingIsUnderstandable == 1)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@: %@\n"), CFSTR("Audio Recording"), CFSTR("Reported as incorrect"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (audioRecordingIsUnderstandable == 2)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@: %@\n"), CFSTR("Audio Recording"), CFSTR("No issues reported"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%@: %@\n"), CFSTR("Actual ASR Transcript"), self->_actualASRTranscript);
    v8 = objc_claimAutoreleasedReturnValue();
    v3 = v7;
LABEL_7:

    v3 = (void *)v8;
  }
  return v3;
}

- (id)composeAdditionalDetails
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@\n"), CFSTR("\nAdditional Details"), &stru_24D7A4738);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](self->_observedBehavior, "isEqualToString:", &stru_24D7A4738))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ → %@\n"), CFSTR("[Observed Behavior]"), self->_observedBehavior);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (!-[NSString isEqualToString:](self->_expectedBehavior, "isEqualToString:", &stru_24D7A4738))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ → %@\n"), CFSTR("[Expected Behavior]"), self->_expectedBehavior);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)getTimestampFormatted
{
  return self->_timestamp;
}

- (id)getTranscriptQuoted
{
  NSString *actualASRTranscript;
  __CFString *v3;

  actualASRTranscript = self->_actualASRTranscript;
  if (actualASRTranscript)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("“%@”"), actualASRTranscript);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24D7A4738;
  }
  return v3;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)asrIsCorrect
{
  return self->_asrIsCorrect;
}

- (void)setAsrIsCorrect:(BOOL)a3
{
  self->_asrIsCorrect = a3;
}

- (NSString)actualASRTranscript
{
  return self->_actualASRTranscript;
}

- (void)setActualASRTranscript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userSuggestedASRTranscript
{
  return self->_userSuggestedASRTranscript;
}

- (void)setUserSuggestedASRTranscript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)audioRecordingIsUnderstandable
{
  return self->_audioRecordingIsUnderstandable;
}

- (void)setAudioRecordingIsUnderstandable:(int64_t)a3
{
  self->_audioRecordingIsUnderstandable = a3;
}

- (int64_t)domainIsCorrect
{
  return self->_domainIsCorrect;
}

- (void)setDomainIsCorrect:(int64_t)a3
{
  self->_domainIsCorrect = a3;
}

- (NSString)actualDomain
{
  return self->_actualDomain;
}

- (void)setActualDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)userSuggestedDomain
{
  return self->_userSuggestedDomain;
}

- (void)setUserSuggestedDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)observedBehavior
{
  return self->_observedBehavior;
}

- (void)setObservedBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)expectedBehavior
{
  return self->_expectedBehavior;
}

- (void)setExpectedBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedBehavior, 0);
  objc_storeStrong((id *)&self->_observedBehavior, 0);
  objc_storeStrong((id *)&self->_userSuggestedDomain, 0);
  objc_storeStrong((id *)&self->_actualDomain, 0);
  objc_storeStrong((id *)&self->_userSuggestedASRTranscript, 0);
  objc_storeStrong((id *)&self->_actualASRTranscript, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
