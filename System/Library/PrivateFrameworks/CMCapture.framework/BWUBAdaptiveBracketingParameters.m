@implementation BWUBAdaptiveBracketingParameters

- (_QWORD)initWithProgressiveBracketingParameters:(uint64_t)a3 progressiveBracketingStatisticsClass:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)BWUBAdaptiveBracketingParameters;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[5] = a3;
    *((_DWORD *)v5 + 4) = 0;
    -[BWUBAdaptiveBracketingParameters updateAdaptiveBracketingFrameParametersUsingGroup:]((uint64_t)v5, 1);
  }
  return v5;
}

- (void)updateAdaptiveBracketingFrameParametersUsingGroup:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  int v13;
  int v14;
  uint64_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_msgSend(*(id *)(a1 + 8), "currentBracketingParametersForGroup:", a2);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "integrationTime");
          v12 = v11;
          objc_msgSend(v10, "gain");
          v14 = v13;
          v15 = objc_msgSend(v10, "AGC");
          LODWORD(v16) = v14;
          objc_msgSend(v4, "addObject:", +[BWAdaptiveBracketingFrameParameters frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:](BWAdaptiveBracketingFrameParameters, "frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:", v15, v12, v16));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(_BYTE *)(a1 + 32))
    {

      *(_QWORD *)(a1 + 24) = objc_msgSend(v4, "copy");
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWUBAdaptiveBracketingParameters;
  -[BWUBAdaptiveBracketingParameters dealloc](&v3, sel_dealloc);
}

- (void)stopAdaptiveBracketing
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    *(_BYTE *)(a1 + 32) = 1;

    *(_QWORD *)(a1 + 24) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (id)adaptiveBracketingFrameParametersForGroup:(int)a3
{
  os_unfair_lock_s *p_adaptiveBracketingFrameParametersLock;
  NSArray *v5;

  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  v5 = self->_adaptiveBracketingFrameParameters;
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return v5;
}

- (BOOL)generateWhiteBalanceParameters
{
  BWUBAdaptiveBracketingParameters *v2;
  os_unfair_lock_s *p_adaptiveBracketingFrameParametersLock;

  v2 = self;
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  LOBYTE(v2) = -[UBProgressiveBracketingParameters recomputeAWBCCM](v2->_progressiveBracketingParameters, "recomputeAWBCCM");
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return (char)v2;
}

- (float)evZeroTargetGain
{
  return 0.0;
}

- (float)previewSNR
{
  return 0.0;
}

- (double)totalIntegrationTime
{
  os_unfair_lock_s *p_adaptiveBracketingFrameParametersLock;
  double v4;
  double v5;

  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  -[UBProgressiveBracketingParameters totalIntegrationTime](self->_progressiveBracketingParameters, "totalIntegrationTime");
  v5 = v4;
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return v5;
}

- (BOOL)stationary
{
  BWUBAdaptiveBracketingParameters *v2;
  os_unfair_lock_s *p_adaptiveBracketingFrameParametersLock;

  v2 = self;
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  LOBYTE(v2) = objc_msgSend((id)-[UBProgressiveBracketingParameters statistics](v2->_progressiveBracketingParameters, "statistics"), "stationary");
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return (char)v2;
}

- (double)totalIntegrationTimeForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 detectedObjects:(id)a6
{
  _BOOL8 v6;
  os_unfair_lock_s *p_adaptiveBracketingFrameParametersLock;
  UBProgressiveBracketingStatistics *UBStatisticsFromFrameStatistics;
  UBProgressiveBracketingParameters *progressiveBracketingParameters;
  UBProgressiveBracketingStatistics *v13;
  uint64_t v14;
  double v15;
  double v16;

  if (!a4)
  {
    FigDebugAssert3();
    return 0.0;
  }
  v6 = a5;
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  if (a3 == 2)
  {
    UBStatisticsFromFrameStatistics = (UBProgressiveBracketingStatistics *)udp_createUBStatisticsFromFrameStatistics(self->_progressiveBracketingStatisticsClass, a4, v6);
    progressiveBracketingParameters = self->_progressiveBracketingParameters;
    v13 = UBStatisticsFromFrameStatistics;
    v14 = 1;
  }
  else
  {
    if (a3 != 1)
    {
      UBStatisticsFromFrameStatistics = 0;
      v16 = 0.0;
      goto LABEL_8;
    }
    UBStatisticsFromFrameStatistics = (UBProgressiveBracketingStatistics *)udp_createUBStatisticsFromFrameStatistics(self->_progressiveBracketingStatisticsClass, a4, v6);
    progressiveBracketingParameters = self->_progressiveBracketingParameters;
    v13 = UBStatisticsFromFrameStatistics;
    v14 = 0;
  }
  -[UBProgressiveBracketingParameters computeTotalIntegrationTimeWithStatistics:forMode:](progressiveBracketingParameters, "computeTotalIntegrationTimeWithStatistics:forMode:", v13, v14);
  v16 = v15;
LABEL_8:

  self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider = UBStatisticsFromFrameStatistics;
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return v16;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 sphereOffsetEnabled:(BOOL)a4
{
  id v5;

  if (!a3)
    return 0;
  v5 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:portType:statistics:mode:", -[UBProgressiveBracketingParameters options](self->_progressiveBracketingParameters, "options"), -[UBProgressiveBracketingParameters portType](self->_progressiveBracketingParameters, "portType"), self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider, a3 == 2);
  return -[BWUBAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWUBAdaptiveBracketingParameters alloc], v5, (uint64_t)self->_progressiveBracketingStatisticsClass);
}

@end
