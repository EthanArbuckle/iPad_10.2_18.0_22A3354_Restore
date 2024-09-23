@implementation VCRateControlAlgorithmLayeredContinuousTier

- (VCRateControlAlgorithmLayeredContinuousTier)init
{
  VCRateControlAlgorithmLayeredContinuousTier *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLayeredContinuousTier;
  result = -[VCRateControlAlgorithmStabilizedNOWRD init](&v3, sel_init);
  if (result)
  {
    result->super.super._state = 0;
    result->super.super._rampUpStatus = 0;
    result->super.super._rampDownStatus = 0;
    *(&result->super._abnormalNetworkDetected + 1) = 1;
    result->_congestionSeverity = 1.0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCRateControlAlgorithmLayeredContinuousTier;
  -[VCRateControlAlgorithmStabilizedNOWRD dealloc](&v2, sel_dealloc);
}

- (BOOL)setUpVTable
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  self->super.super._vTable.configure = _VCRateControlAlgorithmLayeredContinuousTier_Configure;
  self->super.super._vTable.doRateControl = _VCRateControlAlgorithmLayeredContinuousTier_DoRateControl;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmLayeredContinuousTier;
  return -[VCRateControlAlgorithmStabilizedNOWRD setUpVTable](&v3, sel_setUpVTable);
}

@end
