@implementation VCRateControlAlgorithmStabilizedNOWRD

- (VCRateControlAlgorithmStabilizedNOWRD)init
{
  VCRateControlAlgorithmStabilizedNOWRD *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmStabilizedNOWRD;
  result = -[VCRateControlAlgorithmBase init](&v3, sel_init);
  if (result)
  {
    result->super._state = 0;
    result->super._rampUpStatus = 0;
    result->super._rampDownStatus = 0;
    result->super._shouldConsiderCongestionLevelForBIF = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmStabilizedNOWRD;
  -[VCRateControlAlgorithmBase dealloc](&v3, sel_dealloc);
}

- (BOOL)setUpVTable
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!self->super._vTable.configure)
    self->super._vTable.configure = VCRateControlAlgorithmStabilizedNOWRDPriv_Configure;
  if (!self->super._vTable.doRateControl)
    self->super._vTable.doRateControl = _VCRateControlAlgorithmStabilizedNOWRD_DoRateControl;
  if (!self->super._vTable.stateEnter)
    self->super._vTable.stateEnter = _VCRateControlAlgorithmStabilizedNOWRD_StateEnter;
  if (!self->super._vTable.stateExit)
    self->super._vTable.stateExit = _VCRateControlAlgorithmStabilizedNOWRD_StateExit;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmStabilizedNOWRD;
  return -[VCRateControlAlgorithmBase setUpVTable](&v3, sel_setUpVTable);
}

- (void)setLocalBandwidthEstimation:(unsigned int)a3
{
  self->super._localBandwidthEstimation = a3 / 0x3E8;
}

- (double)worstRecentRoundTripTime
{
  double result;

  result = self->super._worstRecentRoundTripTime;
  self->super._worstRecentRoundTripTime = 0.0;
  return result;
}

- (unsigned)worstRecentBurstLoss
{
  unsigned int worstRecentBurstLoss;

  worstRecentBurstLoss = self->super._worstRecentBurstLoss;
  self->super._worstRecentBurstLoss = 0;
  return worstRecentBurstLoss;
}

@end
