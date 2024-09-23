@implementation VCRateControlBandwidthEstimator

- (VCRateControlBandwidthEstimator)init
{
  VCRateControlBandwidthEstimator *v2;
  SuddenChangeParameters *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCRateControlBandwidthEstimator;
  v2 = -[VCRateControlBandwidthEstimator init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SuddenChangeParameters);
    v2->_suddenChangeParameters = v3;
    -[SuddenChangeParameters setPercentage:](v3, "setPercentage:", 0.5);
    -[SuddenChangeParameters setMinSamplesCountFastBandwidthEstimation:](v2->_suddenChangeParameters, "setMinSamplesCountFastBandwidthEstimation:", 10);
    v2->_minProbingSequenceSize = 250;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlBandwidthEstimator;
  -[VCRateControlBandwidthEstimator dealloc](&v3, sel_dealloc);
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
  _VCRateControlBandwidthEstimator_UpdateQualificationParameters((uint64_t)self);
}

- (void)setServerBag:(id)a3
{
  VCRateControlServerBag *serverBag;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  VCRateControlServerBag *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _BOOL4 fastSuddenBandwidthDetectionEnabled;
  unsigned int minProbingSequenceSize;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  VCRateControlBandwidthEstimator *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  serverBag = self->_serverBag;
  if (serverBag == a3
    || -[NSDictionary isEqualToDictionary:](-[VCRateControlServerBag serverBagDictionary](serverBag, "serverBagDictionary"), "isEqualToDictionary:", objc_msgSend(a3, "serverBagDictionary")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136316162;
        v22 = v6;
        v23 = 2080;
        v24 = "-[VCRateControlBandwidthEstimator setServerBag:]";
        v25 = 1024;
        v26 = 169;
        v27 = 2048;
        v28 = a3;
        v29 = 2048;
        v30 = self;
        v8 = "VCRC [%s] %s:%d Same serverbag=%p is set to the bandwidthEstimator=%p";
        v9 = v7;
        v10 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v21, v10);
      }
    }
  }
  else
  {

    v11 = (VCRateControlServerBag *)a3;
    self->_serverBag = v11;
    v12 = -[VCRateControlServerBag containsAllSecondaryKeysWithPrimaryKey:](v11, "containsAllSecondaryKeysWithPrimaryKey:", CFSTR("bwEstimation"));
    if (v12)
    {
      self->_fastSuddenBandwidthDetectionEnabled = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("bwEstimation"), CFSTR("aggModeEnabled"), 0), "BOOLValue");
      self->_minProbingSequenceSize = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("bwEstimation"), CFSTR("minProbingSequenceSize"), 0), "integerValue");
      objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("bwEstimation"), CFSTR("suddenBWDPercentage"), 2), "doubleValue");
      -[SuddenChangeParameters setPercentage:](self->_suddenChangeParameters, "setPercentage:");
      -[SuddenChangeParameters setMinSamplesCountFastBandwidthEstimation:](self->_suddenChangeParameters, "setMinSamplesCountFastBandwidthEstimation:", objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("bwEstimation"), CFSTR("minFastBWDSampleCount"), 0), "integerValue"));
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(CFSTR("bwEstimation"), "UTF8String");
        fastSuddenBandwidthDetectionEnabled = self->_fastSuddenBandwidthDetectionEnabled;
        minProbingSequenceSize = self->_minProbingSequenceSize;
        -[SuddenChangeParameters percentage](self->_suddenChangeParameters, "percentage");
        v19 = v18;
        v20 = -[SuddenChangeParameters minSamplesCountFastBandwidthEstimation](self->_suddenChangeParameters, "minSamplesCountFastBandwidthEstimation");
        v21 = 136317442;
        v22 = v13;
        v23 = 2080;
        v24 = "-[VCRateControlBandwidthEstimator setServerBag:]";
        v25 = 1024;
        v26 = 182;
        v27 = 2048;
        v28 = self;
        v29 = 2080;
        v30 = (VCRateControlBandwidthEstimator *)v15;
        v31 = 1024;
        v32 = v12;
        v33 = 1024;
        v34 = fastSuddenBandwidthDetectionEnabled;
        v35 = 1024;
        v36 = minProbingSequenceSize;
        v37 = 2048;
        v38 = v19;
        v39 = 1024;
        v40 = v20;
        v8 = "VCRC [%s] %s:%d [%p] config for key=%s serverBagContainsGroup=%d fastSuddenBandwidthDetectionEnabled=%d min"
             "ProbingSequenceSize=%d suddenBWDPercentage=%f minFastBWDSampleCount=%d";
        v9 = v14;
        v10 = 82;
        goto LABEL_11;
      }
    }
  }
}

- (void)enableBWELogDump:(void *)a3
{
  self->_logBWEDump = a3;
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_radioAccessTechnology = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (int)bandwidthEstimationState
{
  return self->_bandwidthEstimationState;
}

- (BOOL)fastSuddenBandwidthDetectionEnabled
{
  return self->_fastSuddenBandwidthDetectionEnabled;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

- (double)lastProbingArrivalTime
{
  return self->_referencePacketArrivalTime;
}

- (double)estimatedBandwidth
{
  return self->_estimatedBandwidth;
}

- (void)setEstimatedBandwidth:(double)a3
{
  self->_estimatedBandwidth = a3;
}

- (double)estimatedBandwidthUncapped
{
  return self->_estimatedBandwidthUncapped;
}

- (void)setEstimatedBandwidthUncapped:(double)a3
{
  self->_estimatedBandwidthUncapped = a3;
}

@end
