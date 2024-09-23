@implementation CSASRFeatures

- (CSASRFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v19;
  id v20;
  CSASRFeatures *v21;
  CSASRFeatures *v22;
  objc_super v24;

  v19 = a6;
  v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSASRFeatures;
  v21 = -[CSASRFeatures init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_wordCount = a3;
    v21->_trailingSilenceDuration = a4;
    v21->_eosLikelihood = a5;
    objc_storeStrong((id *)&v21->_pauseCounts, a6);
    v22->_silencePosterior = a7;
    objc_storeStrong((id *)&v22->_taskName, a8);
    v22->_processedAudioDurationInMilliseconds = a9;
    v22->_acousticEndpointerScore = a10;
  }

  return v22;
}

- (id)description
{
  void *v3;
  int64_t wordCount;
  int64_t trailingSilenceDuration;
  double eosLikelihood;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  wordCount = self->_wordCount;
  trailingSilenceDuration = self->_trailingSilenceDuration;
  eosLikelihood = self->_eosLikelihood;
  -[NSArray componentsJoinedByString:](self->_pauseCounts, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{wordCount: %ld, trailingSilDuration: %ld, eosLikelihood: %f, pauseCounts: (%@), silencePosterior: %f, taskName: %@, processedAudioDurationInMilliseconds: %ld, acousticEndpointerScore: %f}"), wordCount, trailingSilenceDuration, *(_QWORD *)&eosLikelihood, v7, *(_QWORD *)&self->_silencePosterior, self->_taskName, self->_processedAudioDurationInMilliseconds, *(_QWORD *)&self->_acousticEndpointerScore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *pauseCounts;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("WordCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_wordCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("TrailingSilDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_trailingSilenceDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("EOSLikelihood");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eosLikelihood);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  pauseCounts = self->_pauseCounts;
  if (!pauseCounts)
    pauseCounts = (NSArray *)MEMORY[0x1E0C9AA60];
  v14[2] = v5;
  v14[3] = pauseCounts;
  v13[3] = CFSTR("PauseCounts");
  v13[4] = CFSTR("SilencePosterior");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_silencePosterior);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v13[5] = CFSTR("ProcessedAudioDurationInMilliseconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_processedAudioDurationInMilliseconds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  v13[6] = CFSTR("AcousticEndpointerScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_acousticEndpointerScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

- (double)eosLikelihood
{
  return self->_eosLikelihood;
}

- (void)setEosLikelihood:(double)a3
{
  self->_eosLikelihood = a3;
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (void)setPauseCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setSilencePosterior:(double)a3
{
  self->_silencePosterior = a3;
}

- (int64_t)processedAudioDurationInMilliseconds
{
  return self->_processedAudioDurationInMilliseconds;
}

- (void)setProcessedAudioDurationInMilliseconds:(int64_t)a3
{
  self->_processedAudioDurationInMilliseconds = a3;
}

- (double)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (void)setAcousticEndpointerScore:(double)a3
{
  self->_acousticEndpointerScore = a3;
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_pauseCounts, 0);
}

+ (id)initialASRFeatures
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:", 0, 0, MEMORY[0x1E0C9AA60], CFSTR("SearchOrMessaging"), 0, 8.98999977, 0.997685015, 0.0);
}

+ (id)initialResultCandidateFeatures
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:", 0, 50, MEMORY[0x1E0C9AA60], CFSTR("SearchOrMessaging"), 10, 8.98999977, 0.0, 0.0);
}

@end
