@implementation _LTServerEndpointerFeatures

- (_LTServerEndpointerFeatures)initWithCoder:(id)a3
{
  id v4;
  _LTServerEndpointerFeatures *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *pauseCounts;
  double v12;
  _LTServerEndpointerFeatures *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTServerEndpointerFeatures;
  v5 = -[_LTServerEndpointerFeatures init](&v15, sel_init);
  if (v5)
  {
    v5->_wordCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wordCount"));
    v5->_trailingSilenceDuration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trailingSilenceDuration"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("eosLikelihood"));
    v5->_eosLikelihood = v6;
    v7 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("pauseCounts"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    pauseCounts = v5->_pauseCounts;
    v5->_pauseCounts = v10;

    objc_storeStrong((id *)&v5->_pauseCounts, v10);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("silencePosterior"));
    v5->_silencePosterior = v12;
    v5->_processedAudioDurationInMilliseconds = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("processedAudioDurationInMilliseconds"));
    v13 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t wordCount;
  id v5;

  wordCount = self->_wordCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", wordCount, CFSTR("wordCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_trailingSilenceDuration, CFSTR("trailingSilenceDuration"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("eosLikelihood"), self->_eosLikelihood);
  objc_msgSend(v5, "encodeObject:forKey:", self->_pauseCounts, CFSTR("pauseCounts"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("silencePosterior"), self->_silencePosterior);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_processedAudioDurationInMilliseconds, CFSTR("processedAudioDurationInMilliseconds"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseCounts, 0);
}

@end
