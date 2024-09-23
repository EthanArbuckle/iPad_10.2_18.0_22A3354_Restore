@implementation CSEnhancedEndpointerFeatures

- (CSEnhancedEndpointerFeatures)initWithTrailingSilenceDuration:(int64_t)a3 clientSilenceFramesCount:(double)a4 endOfSentenceLikelihood:(double)a5 wordCount:(int64_t)a6 serverFeaturesLatency:(double)a7 clientSilenceProbability:(double)a8 rcTrailingSilenceDuration:(int64_t)a9 rcEndOfSentenceLikelihood:(double)a10 rcWordCount:(int64_t)a11 rcServerFeaturesLatency:(double)a12 silencePosterior:(double)a13 acousticEndpointerScore:(double)a14 silencePosteriorNF:(float)a15
{
  CSEnhancedEndpointerFeatures *result;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CSEnhancedEndpointerFeatures;
  result = -[CSEnhancedEndpointerFeatures init](&v28, sel_init);
  if (result)
  {
    result->_trailingSilenceDuration = a3;
    result->_clientSilenceFramesCount = a4;
    result->_endOfSentenceLikelihood = a5;
    result->_wordCount = a6;
    result->_serverFeaturesLatency = a7;
    result->_clientSilenceProbability = a8;
    result->_rcTrailingSilenceDuration = a9;
    result->_rcEndOfSentenceLikelihood = a10;
    result->_rcWordCount = a11;
    result->_rcServerFeaturesLatency = a12;
    result->_silencePosterior = a13;
    result->_acousticEndpointerScore = a14;
    result->_silencePosteriorNF = a15;
  }
  return result;
}

- (id)toFeatureArray
{
  id v3;
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
  void *v14;
  void *v15;
  double v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_trailingSilenceDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clientSilenceFramesCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endOfSentenceLikelihood);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_wordCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_serverFeaturesLatency);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clientSilenceProbability);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rcTrailingSilenceDuration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rcEndOfSentenceLikelihood);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rcWordCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rcServerFeaturesLatency);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_silencePosterior);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_acousticEndpointerScore);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  *(float *)&v16 = self->_silencePosteriorNF;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  return v3;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (double)clientSilenceFramesCount
{
  return self->_clientSilenceFramesCount;
}

- (double)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (double)serverFeaturesLatency
{
  return self->_serverFeaturesLatency;
}

- (double)clientSilenceProbability
{
  return self->_clientSilenceProbability;
}

- (int64_t)rcTrailingSilenceDuration
{
  return self->_rcTrailingSilenceDuration;
}

- (double)rcEndOfSentenceLikelihood
{
  return self->_rcEndOfSentenceLikelihood;
}

- (int64_t)rcWordCount
{
  return self->_rcWordCount;
}

- (double)rcServerFeaturesLatency
{
  return self->_rcServerFeaturesLatency;
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (double)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (float)silencePosteriorNF
{
  return self->_silencePosteriorNF;
}

@end
