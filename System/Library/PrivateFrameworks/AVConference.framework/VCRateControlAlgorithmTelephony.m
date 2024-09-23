@implementation VCRateControlAlgorithmTelephony

- (VCRateControlAlgorithmTelephony)init
{
  VCRateControlAlgorithmTelephony *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmTelephony;
  result = -[VCRateControlAlgorithmBase init](&v3, sel_init);
  if (result)
  {
    result->super._state = 0;
    result->super._rampUpStatus = 0;
    result->super._rampDownStatus = 0;
  }
  return result;
}

- (BOOL)setUpVTable
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  self->super._vTable.configure = _VCRateControlAlgorithmTelephony_Configure;
  self->super._vTable.doRateControl = _VCRateControlAlgorithmTelephony_DoRateControl;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmTelephony;
  return -[VCRateControlAlgorithmBase setUpVTable](&v3, sel_setUpVTable);
}

@end
