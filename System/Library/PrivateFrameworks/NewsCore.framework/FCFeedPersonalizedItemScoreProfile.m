@implementation FCFeedPersonalizedItemScoreProfile

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_pbScoreProfile;
}

- (NTPBScoreProfileDebug)debugFields
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[FCFeedPersonalizedItemScoreProfile pbScoreProfile](self, "pbScoreProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D62810]);
    -[FCFeedPersonalizedItemScoreProfile pbScoreProfile](self, "pbScoreProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDebugFields:", v5);

  }
  -[FCFeedPersonalizedItemScoreProfile pbScoreProfile](self, "pbScoreProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NTPBScoreProfileDebug *)v8;
}

- (NTPBScoreProfile)pbScoreProfile
{
  return self->_pbScoreProfile;
}

- (void)setHasShadowScores:(BOOL)a3
{
  self->_hasShadowScores = a3;
}

- (void)setGlobalCohort:(id)a3
{
  objc_storeStrong((id *)&self->_globalCohort, a3);
}

- (void)setCoefficients:(id)a3
{
  objc_storeStrong((id *)&self->_coefficients, a3);
}

- (FCFeedPersonalizedItemScoreProfile)init
{
  void *v3;
  FCFeedPersonalizedItemScoreProfile *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[FCFeedPersonalizedItemScoreProfile initWithPBScoreProfile:](self, "initWithPBScoreProfile:", v3);

  return v4;
}

- (FCFeedPersonalizedItemScoreProfile)initWithPBScoreProfile:(id)a3
{
  id v5;
  FCFeedPersonalizedItemScoreProfile *v6;
  FCFeedPersonalizedItemScoreProfile *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCFeedPersonalizedItemScoreProfile;
  v6 = -[FCFeedPersonalizedItemScoreProfile init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pbScoreProfile, a3);

  return v7;
}

- (double)sortingScore
{
  double result;

  if (qword_1ED0F85D8 != -1)
    dispatch_once(&qword_1ED0F85D8, &__block_literal_global_137);
  if (_MergedGlobals_193)
  {
    -[FCFeedPersonalizedItemScoreProfile embeddingScore](self, "embeddingScore");
  }
  else if (byte_1ED0F85D1)
  {
    -[FCFeedPersonalizedItemScoreProfile tabiScore](self, "tabiScore");
  }
  else
  {
    -[FCFeedPersonalizedItemScoreProfile agedPersonalizationScore](self, "agedPersonalizationScore");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbScoreProfile, 0);
  objc_storeStrong((id *)&self->_globalCohort, 0);
  objc_storeStrong((id *)&self->_coefficients, 0);
}

void __50__FCFeedPersonalizedItemScoreProfile_sortingScore__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NewsCoreUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_193 = objc_msgSend(v0, "BOOLForKey:", CFSTR("news.features.scoreExclusivelyUsingEmbeddings"));

  NewsCoreUserDefaults();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ED0F85D1 = objc_msgSend(v1, "BOOLForKey:", CFSTR("news.features.scoreExclusivelyUsingTabi"));

  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109376;
    v3[1] = _MergedGlobals_193;
    v4 = 1024;
    v5 = byte_1ED0F85D1;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Configuring sortingScore with scoreExclusivelyUsingEmbeddings=%d scoreExclusivelyUsingTabi=%d", (uint8_t *)v3, 0xEu);
  }
}

- (void)setDebugFields:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCFeedPersonalizedItemScoreProfile pbScoreProfile](self, "pbScoreProfile");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDebugFields:", v4);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NTPBScoreProfile methodSignatureForSelector:](self->_pbScoreProfile, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_pbScoreProfile);
}

- (BOOL)isCoread
{
  return self->_isCoread;
}

- (void)setIsCoread:(BOOL)a3
{
  self->_isCoread = a3;
}

- (BOOL)hasShadowScores
{
  return self->_hasShadowScores;
}

- (NTPBCoefficients)coefficients
{
  return self->_coefficients;
}

- (NTPBScoringCohort)globalCohort
{
  return self->_globalCohort;
}

- (void)setPbScoreProfile:(id)a3
{
  objc_storeStrong((id *)&self->_pbScoreProfile, a3);
}

@end
