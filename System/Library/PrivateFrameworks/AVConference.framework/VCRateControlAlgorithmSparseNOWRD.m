@implementation VCRateControlAlgorithmSparseNOWRD

- (VCRateControlAlgorithmSparseNOWRD)init
{
  VCRateControlAlgorithmSparseNOWRD *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmSparseNOWRD;
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
  self->super._vTable.configure = _VCRateControlAlgorithmSparseNOWRD_Configure;
  self->super._vTable.doRateControl = _VCRateControlAlgorithmSparseNOWRD_DoRateControl;
  v3.receiver = self;
  v3.super_class = (Class)VCRateControlAlgorithmSparseNOWRD;
  return -[VCRateControlAlgorithmBase setUpVTable](&v3, sel_setUpVTable);
}

- (BOOL)basebandAdaptationEnabled
{
  return self->_basebandAdaptationEnabled;
}

@end
