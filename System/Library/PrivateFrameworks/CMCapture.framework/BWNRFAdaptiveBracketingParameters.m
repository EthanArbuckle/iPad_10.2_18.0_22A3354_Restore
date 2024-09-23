@implementation BWNRFAdaptiveBracketingParameters

- (_DWORD)initWithProgressiveBracketingParameters:(uint64_t)a3 progressiveBracketingStatisticsClass:
{
  _DWORD *v5;
  _DWORD *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)BWNRFAdaptiveBracketingParameters;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[2] = 0;
    *((_QWORD *)v5 + 2) = a2;
    *((_QWORD *)v6 + 4) = a3;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);
  self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider = 0;
  os_unfair_lock_unlock(&self->_adaptiveBracketingParametersLock);
  v3.receiver = self;
  v3.super_class = (Class)BWNRFAdaptiveBracketingParameters;
  -[BWNRFAdaptiveBracketingParameters dealloc](&v3, sel_dealloc);
}

- (void)stopAdaptiveBracketing
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(_BYTE *)(a1 + 24) = 1;
    os_unfair_lock_unlock(v2);
  }
}

- (id)adaptiveBracketingFrameParametersForGroup:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  os_unfair_lock_s *p_adaptiveBracketingParametersLock;
  _BOOL4 stopAdaptiveBracketing;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)-[NRFProgressiveBracketingParameters currentBracketingParametersForGroup:](self->_progressiveBracketingParameters, "currentBracketingParametersForGroup:", v3);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "integrationTime");
        v13 = v12;
        objc_msgSend(v11, "gain");
        v15 = v14;
        v16 = objc_msgSend(v11, "AGC");
        LODWORD(v17) = v15;
        objc_msgSend(v5, "addObject:", +[BWAdaptiveBracketingFrameParameters frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:](BWAdaptiveBracketingFrameParameters, "frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:", v16, v13, v17));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  p_adaptiveBracketingParametersLock = &self->_adaptiveBracketingParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);
  stopAdaptiveBracketing = self->_stopAdaptiveBracketing;
  os_unfair_lock_unlock(p_adaptiveBracketingParametersLock);
  if (stopAdaptiveBracketing)
    return 0;
  else
    return v5;
}

- (BOOL)generateWhiteBalanceParameters
{
  return -[NRFProgressiveBracketingParameters recomputeAWBCCM](self->_progressiveBracketingParameters, "recomputeAWBCCM");
}

- (float)evZeroTargetGain
{
  float result;

  -[NRFProgressiveBracketingParameters evZeroTargetGain](self->_progressiveBracketingParameters, "evZeroTargetGain");
  return result;
}

- (float)previewSNR
{
  float result;

  -[NRFProgressiveBracketingParameters previewSNR](self->_progressiveBracketingParameters, "previewSNR");
  return result;
}

- (double)totalIntegrationTime
{
  double result;

  -[NRFProgressiveBracketingParameters totalIntegrationTime](self->_progressiveBracketingParameters, "totalIntegrationTime");
  return result;
}

- (BOOL)stationary
{
  return objc_msgSend((id)-[NRFProgressiveBracketingParameters statistics](self->_progressiveBracketingParameters, "statistics"), "stationary");
}

- (double)totalIntegrationTimeForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 detectedObjects:(id)a6
{
  NRFProgressiveBracketingStatistics *NRFStatisticsFromFrameStatistics;
  double v9;
  uint64_t v10;
  double v11;

  if (!a4)
  {
    FigDebugAssert3();
    v9 = 0.0;
    return round(v9 * 100.0) / 100.0;
  }
  NRFStatisticsFromFrameStatistics = (NRFProgressiveBracketingStatistics *)nfrp_createNRFStatisticsFromFrameStatistics(self->_progressiveBracketingStatisticsClass, a4, a5, a6);
  if (a3 == 1)
  {
    v10 = 0;
    goto LABEL_6;
  }
  v9 = 0.0;
  if (a3 == 2)
  {
    v10 = 1;
LABEL_6:
    -[NRFProgressiveBracketingParameters computeTotalIntegrationTimeWithStatistics:forMode:](self->_progressiveBracketingParameters, "computeTotalIntegrationTimeWithStatistics:forMode:", NRFStatisticsFromFrameStatistics, v10);
    v9 = v11;
  }
  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);

  self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider = NRFStatisticsFromFrameStatistics;
  os_unfair_lock_unlock(&self->_adaptiveBracketingParametersLock);
  return round(v9 * 100.0) / 100.0;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 sphereOffsetEnabled:(BOOL)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_adaptiveBracketingParametersLock;
  NRFProgressiveBracketingStatistics *v8;
  id v9;
  _DWORD *v10;

  if (!a3)
    return 0;
  v4 = a4;
  p_adaptiveBracketingParametersLock = &self->_adaptiveBracketingParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);
  v8 = self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider;
  os_unfair_lock_unlock(p_adaptiveBracketingParametersLock);
  if (v8)
  {
    v9 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:portType:statistics:mode:sphereOffsetEnabled:", -[NRFProgressiveBracketingParameters options](self->_progressiveBracketingParameters, "options"), -[NRFProgressiveBracketingParameters portType](self->_progressiveBracketingParameters, "portType"), v8, a3 == 2, v4);

    v10 = -[BWNRFAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWNRFAdaptiveBracketingParameters alloc], v9, (uint64_t)self->_progressiveBracketingStatisticsClass);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
