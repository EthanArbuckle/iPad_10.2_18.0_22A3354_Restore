@implementation BWPreviewGyroStabilizationPanningDetection

- (BOOL)detectPanningUsingTranslation:(float *)a3 maxAvgTranslationOut:
{
  int v5;

  -[BWPreviewGyroStabilizationPanningDetection _updateWithTranslation:](self, "_updateWithTranslation:");
  -[BWPreviewGyroStabilizationPanningDetection _computePanningStatistics](self, "_computePanningStatistics");
  if (a3)
    *(_DWORD *)a3 = v5;
  return self->_isPanning;
}

- (void)_updateWithTranslation:(BWPreviewGyroStabilizationPanningDetection *)self
{
  uint64_t v2;
  int ringCount;
  int inputIndex;
  signed int v5;
  unsigned int v6;

  *(_QWORD *)&self->_translationVector[8 * self->_inputIndex] = v2;
  ringCount = self->_ringCount;
  if (ringCount <= 9)
    self->_ringCount = ringCount + 1;
  inputIndex = self->_inputIndex;
  v5 = inputIndex
     + 1
     + 10
     * ((~inputIndex + ((inputIndex + 1) >> 31) + ((inputIndex + 1) & ~((inputIndex + 1) >> 31))) / 0xA
      + ((inputIndex + 1) >> 31));
  v6 = inputIndex
     + 10
     * ((~inputIndex + ((inputIndex + 1) >> 31) + ((inputIndex + 1) & ~((inputIndex + 1) >> 31))) / 0xA
      + ((inputIndex + 1) >> 31));
  if (v5 >= 9)
    v5 = 9;
  self->_inputIndex = (v6 - v5 + 10) % 0xA - (10 - v5) + 1;
}

- (float)_computePanningStatistics
{
  int inputIndex;
  float32x2_t v3;
  int v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  signed int v13;
  unsigned int v14;
  int v15;
  float32x2_t v17;
  int8x8_t v18;
  float *p_panningSpeedThreshold;
  float32x2_t v20;
  uint32x2_t v21;
  float result;

  if (self->_ringCount == 10)
  {
    inputIndex = self->_inputIndex;
    v3 = 0;
    __asm { FMOV            V2.2S, #1.0 }
    v9 = 10;
    v10 = 0;
    do
    {
      v11 = *(float32x2_t *)&self->_translationVector[8 * inputIndex];
      v12 = (float32x2_t)vand_s8(vorr_s8(vand_s8((int8x8_t)v11, (int8x8_t)0x8000000080000000), _D2), vorr_s8((int8x8_t)vcltz_f32(v11), (int8x8_t)vcgtz_f32(v11)));
      v13 = inputIndex
          - 1
          + 10
          * ((((inputIndex - 1) & ~((inputIndex - 1) >> 31)) - inputIndex + ((inputIndex - 1) >> 31) + 1)
           / 0xA
           + ((inputIndex - 1) >> 31));
      v14 = inputIndex
          + 10
          * ((((inputIndex - 1) & ~((inputIndex - 1) >> 31)) - inputIndex + ((inputIndex - 1) >> 31) + 1)
           / 0xA
           + ((inputIndex - 1) >> 31));
      if (v13 >= 9)
        v15 = 9;
      else
        v15 = v13;
      v3 = vadd_f32(v3, v11);
      v10 = vadd_f32(v10, v12);
      inputIndex = v13 - 10 * ((v14 - v15 + 8) / 0xA);
      --v9;
    }
    while (v9);
    __asm { FMOV            V2.2S, #10.0 }
    v17 = vdiv_f32(vabs_f32(v3), _D2);
    v18 = (int8x8_t)vceq_f32(vabs_f32(v10), _D2);
    p_panningSpeedThreshold = &self->_panningSpeedThreshold;
    v20 = vld1_dup_f32(p_panningSpeedThreshold);
    v21 = (uint32x2_t)vand_s8((int8x8_t)vcge_f32(v17, v20), v18);
    LODWORD(p_panningSpeedThreshold) = vpmax_u32(v21, v21).u32[0];
    self->_isPanning = (int)p_panningSpeedThreshold < 0;
    result = 0.0;
    if ((p_panningSpeedThreshold & 0x80000000) != 0)
    {
      if (v21.i32[0])
        result = v17.f32[0];
      if (v21.i32[1])
      {
        if (result <= v17.f32[1])
          return v17.f32[1];
      }
    }
  }
  else
  {
    self->_isPanning = 0;
    return 0.0;
  }
  return result;
}

- (BWPreviewGyroStabilizationPanningDetection)initWithPanningThreshold:(float)a3
{
  BWPreviewGyroStabilizationPanningDetection *v4;
  BWPreviewGyroStabilizationPanningDetection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWPreviewGyroStabilizationPanningDetection;
  v4 = -[BWPreviewGyroStabilizationPanningDetection init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[BWPreviewGyroStabilizationPanningDetection reset](v4, "reset");
    v5->_panningSpeedThreshold = a3;
  }
  return v5;
}

- (void)reset
{
  *(_QWORD *)&self->_inputIndex = 0;
}

- (BOOL)isPanning
{
  return self->_isPanning;
}

@end
