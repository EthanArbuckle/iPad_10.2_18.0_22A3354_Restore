@implementation NIDeviceCapabilities

- (NIDeviceCapabilities)initWithFineRangingSupport:(BOOL)a3 aoaSupport:(BOOL)a4 extendedDistanceMeasurementSupport:(BOOL)a5 syntheticApertureSupport:(BOOL)a6
{
  return -[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:](self, "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", a3, 0, a4, a5, a6);
}

- (NIDeviceCapabilities)initWithFineRangingSupport:(BOOL)a3 coarseRangingSupport:(BOOL)a4 aoaSupport:(BOOL)a5 extendedDistanceMeasurementSupport:(BOOL)a6 syntheticApertureSupport:(BOOL)a7
{
  NIDeviceCapabilities *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NIDeviceCapabilities;
  result = -[NIDeviceCapabilities init](&v13, sel_init);
  if (result)
  {
    result->_supportsPreciseDistanceMeasurement = a3;
    result->_supportsDirectionMeasurement = a5;
    result->_supportsCameraAssistance = a7;
    result->_supportsCoarseDistanceMeasurement = a4;
    result->_supportsExtendedDistanceMeasurement = a6;
  }
  return result;
}

- (NIDeviceCapabilities)initWithBitmap:(unsigned __int8)a3
{
  return -[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:](self, "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:", a3 & 1, (a3 >> 1) & 1, (a3 >> 2) & 1, (a3 >> 4) & 1, (a3 >> 3) & 1);
}

- (unsigned)toBitmap
{
  uint8x8_t v2;
  int8x8_t v3;

  v2.i32[0] = *(_DWORD *)&self->_supportsDirectionMeasurement;
  v3 = vbic_s8((int8x8_t)0x10000200080004, (int8x8_t)vceqz_s16((int16x4_t)*(_OWORD *)&vmovl_u8(v2)));
  return v3.i8[0] | v3.i8[4] | ((v3.i32[0] | v3.i32[1]) >> 16) | self->_supportsPreciseDistanceMeasurement;
}

- (NIDeviceCapabilities)init
{
  __assert_rtn("-[NIDeviceCapabilities init]", "NIDeviceCapabilities.m", 110, "NO");
}

+ (id)new
{
  __assert_rtn("+[NIDeviceCapabilities new]", "NIDeviceCapabilities.m", 115, "NO");
}

- (BOOL)supportsPreciseDistanceMeasurement
{
  return self->_supportsPreciseDistanceMeasurement;
}

- (BOOL)supportsDirectionMeasurement
{
  return self->_supportsDirectionMeasurement;
}

- (BOOL)supportsCameraAssistance
{
  return self->_supportsCameraAssistance;
}

- (BOOL)supportsCoarseDistanceMeasurement
{
  return self->_supportsCoarseDistanceMeasurement;
}

- (BOOL)supportsExtendedDistanceMeasurement
{
  return self->_supportsExtendedDistanceMeasurement;
}

@end
