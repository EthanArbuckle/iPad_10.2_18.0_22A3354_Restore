@implementation ADAdaptiveCorrectionDualCameraCalibrationModel

- (int64_t)computeStereoRectificationHomographiesMappingRectTeleToTele:(id *)a3 rectTeleToWide:(id *)a4 teleToRectTele:(id *)a5
{
  CGFloat x;
  int8x16_t v6;
  CGPoint opticalCenterRef;
  CGPoint opticalCenterAux;
  __int128 v9;
  float32x4_t v10;
  float32x2_t v11;
  int64_t v12;
  uint8_t v14[16];
  uint8_t buf[16];
  CGFloat v16;
  int8x16_t v17;
  CGFloat y;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  double v26;

  if (a3 && a4 && a5)
  {
    x = self->_opticalCenterRef.x;
    *(float64x2_t *)buf = vcvtq_f64_f32(*(float32x2_t *)&self->_focalLengthPixRef);
    v16 = x;
    v17 = vextq_s8(*(int8x16_t *)&self->_opticalCenterRef.y, *(int8x16_t *)&self->_opticalCenterRef.y, 8uLL);
    v6 = *(int8x16_t *)&self[1].super.isa;
    opticalCenterRef = self[1]._opticalCenterRef;
    y = self->_opticalCenterAux.y;
    v19 = *(float *)v6.i32;
    opticalCenterAux = self[1]._opticalCenterAux;
    v9 = *(_OWORD *)&self[2].super.isa;
    v20 = *(float *)&opticalCenterRef.x;
    v21 = *(float *)&opticalCenterAux.x;
    v23 = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)&opticalCenterRef.x, *(int32x2_t *)&opticalCenterAux.x));
    v10 = (float32x4_t)vextq_s8((int8x16_t)opticalCenterRef, (int8x16_t)opticalCenterRef, 8uLL);
    v25 = vcvtq_f64_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v10.f32, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)opticalCenterAux, (int8x16_t)opticalCenterAux, 8uLL)));
    v11 = (float32x2_t)vext_s8(*(int8x8_t *)&v9, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL), 4uLL);
    v10.i32[0] = DWORD2(v9);
    DWORD1(v9) = v6.i32[1];
    v22 = vcvtq_f64_f32(*(float32x2_t *)&v9);
    v24 = vcvtq_f64_f32(v11);
    v26 = *((float *)&v9 + 2);
    v12 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", AdaptiveCorrection_computeStereoRectificationHomographies((uint64_t)buf, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, *((float *)&v9 + 2), v22.f64[0], v10));
    if (v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed compute Stereo Rectification Homographies", v14, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Null argument for computeStereoRectificationHomographiesMappingRectTeleToTele", buf, 2u);
    }
    return -22953;
  }
  return v12;
}

- (float)focalLengthPixRef
{
  return self->_focalLengthPixRef;
}

- (void)setFocalLengthPixRef:(float)a3
{
  self->_focalLengthPixRef = a3;
}

- (float)focalLengthPixAux
{
  return self->_focalLengthPixAux;
}

- (void)setFocalLengthPixAux:(float)a3
{
  self->_focalLengthPixAux = a3;
}

- (CGPoint)opticalCenterRef
{
  double x;
  double y;
  CGPoint result;

  x = self->_opticalCenterRef.x;
  y = self->_opticalCenterRef.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOpticalCenterRef:(CGPoint)a3
{
  self->_opticalCenterRef = a3;
}

- (CGPoint)opticalCenterAux
{
  double x;
  double y;
  CGPoint result;

  x = self->_opticalCenterAux.x;
  y = self->_opticalCenterAux.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOpticalCenterAux:(CGPoint)a3
{
  self->_opticalCenterAux = a3;
}

- (__n128)refToAuxExtrinsic
{
  return a1[3];
}

- (__n128)setRefToAuxExtrinsic:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

@end
