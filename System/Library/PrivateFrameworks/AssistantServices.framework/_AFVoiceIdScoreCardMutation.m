@implementation _AFVoiceIdScoreCardMutation

- (_AFVoiceIdScoreCardMutation)initWithBase:(id)a3
{
  id v5;
  _AFVoiceIdScoreCardMutation *v6;
  _AFVoiceIdScoreCardMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFVoiceIdScoreCardMutation;
  v6 = -[_AFVoiceIdScoreCardMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getSpIdAudioProcessedDuration
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_spIdAudioProcessedDuration;
  }
  else
  {
    -[AFVoiceIdScoreCard spIdAudioProcessedDuration](self->_base, "spIdAudioProcessedDuration");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpIdAudioProcessedDuration:(id)a3
{
  objc_storeStrong((id *)&self->_spIdAudioProcessedDuration, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getSpIdUnknownUserScore
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_spIdUnknownUserScore;
  }
  else
  {
    -[AFVoiceIdScoreCard spIdUnknownUserScore](self->_base, "spIdUnknownUserScore");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpIdUnknownUserScore:(id)a3
{
  objc_storeStrong((id *)&self->_spIdUnknownUserScore, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getSpIdKnownUserScores
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_spIdKnownUserScores;
  }
  else
  {
    -[AFVoiceIdScoreCard spIdKnownUserScores](self->_base, "spIdKnownUserScores");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpIdKnownUserScores:(id)a3
{
  objc_storeStrong((id *)&self->_spIdKnownUserScores, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getSpIdUserScoresVersion
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_spIdUserScoresVersion;
  }
  else
  {
    -[AFVoiceIdScoreCard spIdUserScoresVersion](self->_base, "spIdUserScoresVersion");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpIdUserScoresVersion:(id)a3
{
  objc_storeStrong((id *)&self->_spIdUserScoresVersion, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getSpIdScoreThresholdingType
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_spIdScoreThresholdingType;
  }
  else
  {
    -[AFVoiceIdScoreCard spIdScoreThresholdingType](self->_base, "spIdScoreThresholdingType");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpIdScoreThresholdingType:(id)a3
{
  objc_storeStrong((id *)&self->_spIdScoreThresholdingType, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSpIdAssetVersion
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_spIdAssetVersion;
  }
  else
  {
    -[AFVoiceIdScoreCard spIdAssetVersion](self->_base, "spIdAssetVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpIdAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_spIdAssetVersion, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getUserClassified
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_userClassified;
  }
  else
  {
    -[AFVoiceIdScoreCard userClassified](self->_base, "userClassified");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserClassified:(id)a3
{
  objc_storeStrong((id *)&self->_userClassified, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (int64_t)getUserIdentityClassification
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_userIdentityClassification;
  else
    return -[AFVoiceIdScoreCard userIdentityClassification](self->_base, "userIdentityClassification");
}

- (void)setUserIdentityClassification:(int64_t)a3
{
  self->_userIdentityClassification = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getLowScoreThreshold
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_lowScoreThreshold;
  }
  else
  {
    -[AFVoiceIdScoreCard lowScoreThreshold](self->_base, "lowScoreThreshold");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLowScoreThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_lowScoreThreshold, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getHighScoreThreshold
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_highScoreThreshold;
  }
  else
  {
    -[AFVoiceIdScoreCard highScoreThreshold](self->_base, "highScoreThreshold");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHighScoreThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_highScoreThreshold, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getConfidentScoreThreshold
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_confidentScoreThreshold;
  }
  else
  {
    -[AFVoiceIdScoreCard confidentScoreThreshold](self->_base, "confidentScoreThreshold");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setConfidentScoreThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_confidentScoreThreshold, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getDeltaScoreThreshold
{
  NSNumber *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_deltaScoreThreshold;
  }
  else
  {
    -[AFVoiceIdScoreCard deltaScoreThreshold](self->_base, "deltaScoreThreshold");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeltaScoreThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_deltaScoreThreshold, a3);
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaScoreThreshold, 0);
  objc_storeStrong((id *)&self->_confidentScoreThreshold, 0);
  objc_storeStrong((id *)&self->_highScoreThreshold, 0);
  objc_storeStrong((id *)&self->_lowScoreThreshold, 0);
  objc_storeStrong((id *)&self->_userClassified, 0);
  objc_storeStrong((id *)&self->_spIdAssetVersion, 0);
  objc_storeStrong((id *)&self->_spIdScoreThresholdingType, 0);
  objc_storeStrong((id *)&self->_spIdUserScoresVersion, 0);
  objc_storeStrong((id *)&self->_spIdKnownUserScores, 0);
  objc_storeStrong((id *)&self->_spIdUnknownUserScore, 0);
  objc_storeStrong((id *)&self->_spIdAudioProcessedDuration, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
