@implementation CSNovDetectorResult

- (CSNovDetectorResult)initWithResult:(id)a3
{
  id v4;
  CSNovDetectorResult *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSNovDetectorResult;
  v5 = -[CSNovDetectorResult init](&v8, sel_init);
  if (v5)
  {
    v5->_sampleFed = objc_msgSend(v4, "sampleFed");
    v5->_bestPhrase = objc_msgSend(v4, "bestPhrase");
    v5->_bestStart = objc_msgSend(v4, "bestStart");
    v5->_bestEnd = objc_msgSend(v4, "bestEnd");
    objc_msgSend(v4, "bestScore");
    v5->_bestScore = v6;
    v5->_earlyWarning = objc_msgSend(v4, "earlyWarning");
  }

  return v5;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("samples_fed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sampleFed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("best_phrase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bestPhrase);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("best_start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bestStart);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("best_end");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bestEnd);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("best_score");
  *(float *)&v7 = self->_bestScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v13[5] = CFSTR("early_warning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_earlyWarning);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  v13[6] = CFSTR("is_rescoring");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRescoring);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (unint64_t)sampleFed
{
  return self->_sampleFed;
}

- (void)setSampleFed:(unint64_t)a3
{
  self->_sampleFed = a3;
}

- (unint64_t)bestPhrase
{
  return self->_bestPhrase;
}

- (void)setBestPhrase:(unint64_t)a3
{
  self->_bestPhrase = a3;
}

- (unint64_t)bestStart
{
  return self->_bestStart;
}

- (void)setBestStart:(unint64_t)a3
{
  self->_bestStart = a3;
}

- (unint64_t)bestEnd
{
  return self->_bestEnd;
}

- (void)setBestEnd:(unint64_t)a3
{
  self->_bestEnd = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (BOOL)earlyWarning
{
  return self->_earlyWarning;
}

- (void)setEarlyWarning:(BOOL)a3
{
  self->_earlyWarning = a3;
}

- (BOOL)isRescoring
{
  return self->_isRescoring;
}

- (void)setIsRescoring:(BOOL)a3
{
  self->_isRescoring = a3;
}

@end
