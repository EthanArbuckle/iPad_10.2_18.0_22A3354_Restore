@implementation NviDirectionalitySignalData

- (NviDirectionalitySignalData)initWithStartSample:(unint64_t)a3 endSample:(unint64_t)a4 confidence:(float)a5 azimuth:(float)a6 estimatedAzimuth:(float)a7
{
  uint64_t v13;
  NviDirectionalitySignalData *v14;
  NviDirectionalitySignalData *v15;
  NSArray *v16;
  NSArray *spatialSpectrumData;
  objc_super v19;

  v13 = mach_absolute_time();
  v19.receiver = self;
  v19.super_class = (Class)NviDirectionalitySignalData;
  v14 = -[NviSignalData initWithSignalType:timestamp:](&v19, sel_initWithSignalType_timestamp_, 4, v13);
  v15 = v14;
  if (v14)
  {
    v14->_startSample = a3;
    v14->_endSample = a4;
    v14->_confidence = a5;
    v14->_azimuth = a6;
    v14->_estimatedAzimuth = a7;
    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    spatialSpectrumData = v15->_spatialSpectrumData;
    v15->_spatialSpectrumData = v16;

  }
  return v15;
}

- (float)mostSampledAzimuth
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  float v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_azDistribution;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_azDistribution, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        if (v12 > v6)
        {
          objc_msgSend(v10, "floatValue");
          v8 = v13;
          v6 = v12;
        }
      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)stringForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu,%f,%lu,%lu,%f,%f,%f,"), -[NviSignalData sigGenTs](self, "sigGenTs"), *(_QWORD *)&self->_processedAudioDurMs, self->_startSample, self->_endSample, self->_azimuth, self->_estimatedAzimuth, self->_confidence);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NviDirectionalitySignalData;
  -[NviSignalData description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@, {start=%lu, end=%lu, conf=%f, az=%f, estAz=%fdist=%@}"), v3, self->_startSample, self->_endSample, self->_confidence, self->_azimuth, self->_estimatedAzimuth, self->_azDistribution);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_spatialSpectrumLogStr
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  float v8;
  void *v9;

  v3 = -[NSArray count](self->_spatialSpectrumData, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(",%d, "), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[NSArray objectAtIndex:](self->_spatialSpectrumData, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%f, "), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v9;
    }
  }
  else
  {
    v9 = (void *)v4;
  }
  return v9;
}

- (unint64_t)startSample
{
  return self->_startSample;
}

- (void)setStartSample:(unint64_t)a3
{
  self->_startSample = a3;
}

- (unint64_t)endSample
{
  return self->_endSample;
}

- (void)setEndSample:(unint64_t)a3
{
  self->_endSample = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)estimatedAzimuth
{
  return self->_estimatedAzimuth;
}

- (void)setEstimatedAzimuth:(float)a3
{
  self->_estimatedAzimuth = a3;
}

- (double)processedAudioDurMs
{
  return self->_processedAudioDurMs;
}

- (void)setProcessedAudioDurMs:(double)a3
{
  self->_processedAudioDurMs = a3;
}

- (NSArray)spatialSpectrumData
{
  return self->_spatialSpectrumData;
}

- (void)setSpatialSpectrumData:(id)a3
{
  objc_storeStrong((id *)&self->_spatialSpectrumData, a3);
}

- (NSDictionary)azDistribution
{
  return self->_azDistribution;
}

- (void)setAzDistribution:(id)a3
{
  objc_storeStrong((id *)&self->_azDistribution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_azDistribution, 0);
  objc_storeStrong((id *)&self->_spatialSpectrumData, 0);
}

+ (id)headerString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SignalTs, ProcessedAudioMs, StartSample, EndSample, Azimuth, EmaAzimuth, Confidence, SpatialSpreadSpectrum\n"));
}

@end
