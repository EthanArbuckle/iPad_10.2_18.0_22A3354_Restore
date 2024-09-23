@implementation CSKeywordAnalyzerNDEAPIResult

- (CSKeywordAnalyzerNDEAPIResult)init
{
  CSKeywordAnalyzerNDEAPIResult *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSKeywordAnalyzerNDEAPIResult;
  result = -[CSKeywordAnalyzerNDEAPIResult init](&v3, sel_init);
  if (result)
    result->_bestScore = -1000000.0;
  return result;
}

- (CSKeywordAnalyzerNDEAPIResult)initWithBlob:(id)a3 isEarlyDetected:(BOOL)a4
{
  id v6;
  CSKeywordAnalyzerNDEAPIResult *v7;
  CSKeywordAnalyzerNDEAPIResult *v8;
  uint64_t v9;
  __int128 v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSKeywordAnalyzerNDEAPIResult;
  v7 = -[CSKeywordAnalyzerNDEAPIResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
      *(_QWORD *)&v10 = *(_QWORD *)v9;
      *((_QWORD *)&v10 + 1) = HIDWORD(*(_QWORD *)v9);
      *(_OWORD *)&v8->_samplesFed = v10;
      v8->_bestEnd = *(unsigned int *)(v9 + 8);
      v8->_bestScore = *(float *)(v9 + 12);
      v8->_isSecondChance = *(_BYTE *)(v9 + 16);
      v8->_isEarlyDetect = a4;
    }
    else
    {
      v7->_bestScore = -1000000.0;
    }
  }

  return v8;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("samples_fed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_samplesFed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("best_start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bestStart);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("best_end");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bestEnd);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("best_score");
  *(float *)&v6 = self->_bestScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("is_secondchance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSecondChance);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("isEarlyDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEarlyDetect);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (unint64_t)samplesFed
{
  return self->_samplesFed;
}

- (void)setSamplesFed:(unint64_t)a3
{
  self->_samplesFed = a3;
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

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setIsSecondChance:(BOOL)a3
{
  self->_isSecondChance = a3;
}

- (BOOL)isEarlyDetect
{
  return self->_isEarlyDetect;
}

- (void)setIsEarlyDetect:(BOOL)a3
{
  self->_isEarlyDetect = a3;
}

@end
