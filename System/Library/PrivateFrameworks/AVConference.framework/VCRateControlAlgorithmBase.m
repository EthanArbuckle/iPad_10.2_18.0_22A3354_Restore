@implementation VCRateControlAlgorithmBase

- (VCRateControlAlgorithmBase)init
{
  VCRateControlAlgorithmBase *v2;
  VCRateControlAlgorithmBase *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCRateControlAlgorithmBase;
  v2 = -[VCRateControlAlgorithmBase init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[VCRateControlAlgorithmBase setUpVTable](v2, "setUpVTable"))
    {
      v3->_paused = 0;
      *(_OWORD *)&v3->_packetLossRateThreshold = xmmword_1D910D540;
      v3->_rateSharingCount = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlAlgorithmBase init].cold.1();
      }

      return 0;
    }
  }
  return v3;
}

- (BOOL)setUpVTable
{
  _BOOL4 v2;

  if (!self->_vTable.configure)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v2 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v2)
        return v2;
      -[VCRateControlAlgorithmBase setUpVTable].cold.1();
    }
    goto LABEL_15;
  }
  if (!self->_vTable.doRateControl)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v2 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v2)
        return v2;
      -[VCRateControlAlgorithmBase setUpVTable].cold.2();
    }
LABEL_15:
    LOBYTE(v2) = 0;
    return v2;
  }
  if (!self->_vTable.stateEnter)
    self->_vTable.stateEnter = VCRateControlAlgorithmBasePriv_StateEnter;
  if (!self->_vTable.stateExit)
    self->_vTable.stateExit = VCRateControlAlgorithmBasePriv_StateExit;
  LOBYTE(v2) = 1;
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmBase;
  -[VCRateControlAlgorithmBase dealloc](&v3, sel_dealloc);
}

- (BOOL)isRampingDown
{
  return self->_state == 6;
}

- (BOOL)isLossBasedAdaptationOn
{
  return self->_firstLossEventRampDownTime > 0.0;
}

- (tagVCRateControlAlgorithmConfig)config
{
  return (tagVCRateControlAlgorithmConfig *)memcpy(retstr, &self->_config, sizeof(tagVCRateControlAlgorithmConfig));
}

- (BOOL)isCongested
{
  return self->_isCongested;
}

- (int)bytesInFlightState
{
  return self->_bytesInFlightState;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (unsigned)targetBitrateTier
{
  return self->_targetBitrateTier;
}

- (unsigned)rateChangeCounter
{
  return self->_rateChangeCounter;
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (unsigned)mostBurstLoss
{
  return self->_mostBurstLoss;
}

- (double)packetLossRate
{
  return self->_packetLossRate;
}

- (double)packetLossRateAudio
{
  return self->_packetLossRateAudio;
}

- (double)packetLossRateVideo
{
  return self->_packetLossRateVideo;
}

- (unsigned)totalPacketReceived
{
  return self->_totalPacketReceived;
}

- (double)roundTripTime
{
  return self->_roundTripTime;
}

- (double)roundTripTimeMinEnvelope
{
  return self->_roundTripTimeMinEnvelope;
}

- (double)mostRecentRoundTripTime
{
  return self->_mostRecentRoundTripTime;
}

- (double)worstRecentRoundTripTime
{
  return self->_worstRecentRoundTripTime;
}

- (unsigned)worstRecentBurstLoss
{
  return self->_worstRecentBurstLoss;
}

- (BOOL)isNewRateSentOut
{
  return self->_isNewRateSentOut;
}

- (unsigned)localBandwidthEstimation
{
  return self->_localBandwidthEstimation;
}

- (void)setLocalBandwidthEstimation:(unsigned int)a3
{
  self->_localBandwidthEstimation = a3;
}

- (unsigned)remoteBandwidthEstimation
{
  return self->_remoteBandwidthEstimation;
}

- (double)owrd
{
  return self->_owrd;
}

- (double)nowrd
{
  return self->_nowrd;
}

- (double)nowrdAcc
{
  return self->_nowrdAcc;
}

- (unsigned)actualBitrate
{
  return self->_actualBitrate;
}

- (BOOL)didMBLRampDown
{
  return self->_didMBLRampDown;
}

- (void)setDidMBLRampDown:(BOOL)a3
{
  self->_didMBLRampDown = a3;
}

- (BOOL)isSendBitrateLimited
{
  return self->_isSendBitrateLimited;
}

- (BOOL)isFirstInitialRampUpDone
{
  return self->_isFirstInitialRampUpDone;
}

- (unsigned)rateSharingCount
{
  return self->_rateSharingCount;
}

- (void)setRateSharingCount:(unsigned int)a3
{
  self->_rateSharingCount = a3;
}

- (BOOL)isFirstTimestampArrived
{
  return self->_isFirstTimestampArrived;
}

- (void)setIsFirstTimestampArrived:(BOOL)a3
{
  self->_isFirstTimestampArrived = a3;
}

- (tagVCRateControlAlgorithmReportStats)reportStatistics
{
  __int128 v3;

  v3 = *(_OWORD *)&self[161].var0.smartBrake.duration;
  *(_OWORD *)&retstr->index = *(_OWORD *)&self[160].var0.smartBrake.targetBitrateStart;
  *(_OWORD *)&retstr->var0.smartBrake.bandwidthEnd = v3;
  return self;
}

- (unsigned)bytesInFlight
{
  return self->_bytesInFlight;
}

- (double)ecnCERatio
{
  return self->_ecnCERatio;
}

- (double)rateControlTime
{
  return self->_rateControlTime;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Failed to initialize the v-table", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpVTable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Invalid v-table. doRateControl is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
