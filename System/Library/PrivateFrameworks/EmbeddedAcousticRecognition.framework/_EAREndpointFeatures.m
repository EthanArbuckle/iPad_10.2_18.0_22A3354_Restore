@implementation _EAREndpointFeatures

- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 clientSilenceFramesCountMs:(double)a8 clientSilenceProbability:(double)a9 silencePosteriorNF:(float)a10 serverFeaturesLatency:(float)a11
{
  double v11;
  double v12;

  *(float *)&v11 = a11;
  *(float *)&v12 = a10;
  return -[_EAREndpointFeatures initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:](self, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", a3, a4, a6, 0, a5, 0.0, a7, a8, a9, v12, v11);
}

- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 clientSilenceFramesCountMs:(double)a8 clientSilenceProbability:(double)a9 silencePosteriorNF:(float)a10 serverFeaturesLatency:(float)a11 eagerResultEndTime:(int64_t)a12
{
  double v12;
  double v13;

  *(float *)&v12 = a11;
  *(float *)&v13 = a10;
  return -[_EAREndpointFeatures initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:](self, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", a3, a4, a6, a12, a5, 0.0, a7, a8, a9, v13, v12);
}

- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 acousticEndpointerScore:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 clientSilenceFramesCountMs:(double)a9 clientSilenceProbability:(double)a10 silencePosteriorNF:(float)a11 serverFeaturesLatency:(float)a12 eagerResultEndTime:(int64_t)a13
{
  id v25;
  _EAREndpointFeatures *v26;
  _EAREndpointFeatures *v27;
  objc_super v29;

  v25 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_EAREndpointFeatures;
  v26 = -[_EAREndpointFeatures init](&v29, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_wordCount = a3;
    v26->_trailingSilenceDuration = a4;
    v26->_endOfSentenceLikelihood = a5;
    v26->_acousticEndpointerScore = a6;
    objc_storeStrong((id *)&v26->_pauseCounts, a7);
    v27->_silencePosterior = a8;
    v27->_clientSilenceFramesCountMs = a9;
    v27->_clientSilenceProbability = a10;
    v27->_silencePosteriorNF = a11;
    v27->_serverFeaturesLatency = a12;
    v27->_eagerResultEndTime = a13;
  }

  return v27;
}

- (id)description
{
  void *v3;
  int64_t wordCount;
  int64_t trailingSilenceDuration;
  double endOfSentenceLikelihood;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  wordCount = self->_wordCount;
  trailingSilenceDuration = self->_trailingSilenceDuration;
  endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
  -[NSArray componentsJoinedByString:](self->_pauseCounts, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ wordCount: %ld, trailingSilenceDuration: %ld, endOfSentenceLikelihood: %f, pauseCounts:(%@), silencePosterior: %f, clientSilenceFramesCountMs: %f, clientSilenceProbability: %f, silencePosteriorNF: %f, serverFeaturesLatency: %f, eagerResultEndTime: %ld }"), wordCount, trailingSilenceDuration, *(_QWORD *)&endOfSentenceLikelihood, v7, *(_QWORD *)&self->_silencePosterior, *(_QWORD *)&self->_clientSilenceFramesCountMs, *(_QWORD *)&self->_clientSilenceProbability, self->_silencePosteriorNF, self->_serverFeaturesLatency, self->_eagerResultEndTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(int64_t)a3
{
  self->_wordCount = a3;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
  self->_trailingSilenceDuration = a3;
}

- (double)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (void)setEndOfSentenceLikelihood:(double)a3
{
  self->_endOfSentenceLikelihood = a3;
}

- (double)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (void)setAcousticEndpointerScore:(double)a3
{
  self->_acousticEndpointerScore = a3;
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (void)setPauseCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setSilencePosterior:(double)a3
{
  self->_silencePosterior = a3;
}

- (double)clientSilenceFramesCountMs
{
  return self->_clientSilenceFramesCountMs;
}

- (void)setClientSilenceFramesCountMs:(double)a3
{
  self->_clientSilenceFramesCountMs = a3;
}

- (double)clientSilenceProbability
{
  return self->_clientSilenceProbability;
}

- (void)setClientSilenceProbability:(double)a3
{
  self->_clientSilenceProbability = a3;
}

- (float)silencePosteriorNF
{
  return self->_silencePosteriorNF;
}

- (void)setSilencePosteriorNF:(float)a3
{
  self->_silencePosteriorNF = a3;
}

- (float)serverFeaturesLatency
{
  return self->_serverFeaturesLatency;
}

- (void)setServerFeaturesLatency:(float)a3
{
  self->_serverFeaturesLatency = a3;
}

- (int64_t)eagerResultEndTime
{
  return self->_eagerResultEndTime;
}

- (void)setEagerResultEndTime:(int64_t)a3
{
  self->_eagerResultEndTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseCounts, 0);
}

@end
