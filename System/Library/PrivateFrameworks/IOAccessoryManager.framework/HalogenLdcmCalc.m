@implementation HalogenLdcmCalc

- (HalogenLdcmCalc)initWithSize:(int)a3
{
  HalogenLdcmCalc *v4;
  HalogenLdcmCalc *v5;
  FFTSetupD fftsetupD;
  NSObject *v8;
  const char *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HalogenLdcmCalc;
  v4 = -[HalogenLdcmCalc init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_nSamples = a3;
    v4->_sizeofSample = 8;
    *(int32x2_t *)&v4->_diffWindowSize = vadd_s32(vdup_n_s32(a3), (int32x2_t)-2);
    *(_OWORD *)&v4->_sampleRate = xmmword_1D13E8190;
    *(_OWORD *)&v4->_adcGain = xmmword_1D13E81A0;
    *(_OWORD *)&v4->_hydraImpedance = xmmword_1D13E81B0;
    *(_OWORD *)&v4->_hydraR = xmmword_1D13E81C0;
    *(_OWORD *)&v4->_sanitycheckImpedanceLowerbound = xmmword_1D13E81D0;
    *(_OWORD *)&v4->_sanitycheckPhaseLowerbound = xmmword_1D13E81E0;
    *(_OWORD *)&v4->_sanitycheckVoltageGainCorrectionLowerbound = xmmword_1D13E81F0;
    *(_OWORD *)&v4->_sanitycheckCurrentGainCorrectionLowerbound = xmmword_1D13E81F0;
    *(_OWORD *)&v4->_sanitycheckCurrentPhaseCompensationLowerbound = xmmword_1D13E8200;
    if (-[HalogenLdcmCalc _allocBuffers](v4, "_allocBuffers"))
    {
      fftsetupD = vDSP_create_fftsetupD(0xCuLL, 0);
      v5->_fftContext = fftsetupD;
      if (fftsetupD)
        return v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        v8 = MEMORY[0x1E0C81028];
        v9 = "HalogenLdcmCalc:vDSP_create_fftsetupD() failed";
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v8 = MEMORY[0x1E0C81028];
      v9 = "HalogenLdcmCalc:_allocBuffers() failed";
LABEL_9:
      _os_log_impl(&dword_1D13BF000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  OpaqueFFTSetupD *fftContext;
  objc_super v4;

  fftContext = self->_fftContext;
  if (fftContext)
    vDSP_destroy_fftsetupD(fftContext);
  -[HalogenLdcmCalc _freeBuffers](self, "_freeBuffers");
  v4.receiver = self;
  v4.super_class = (Class)HalogenLdcmCalc;
  -[HalogenLdcmCalc dealloc](&v4, sel_dealloc);
}

- (BOOL)_allocBuffers
{
  NSMutableData *v3;
  NSMutableData *v4;
  NSMutableData *v5;
  BOOL result;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  self->_tmp1DataBuffSize = self->_sizeofSample * self->_nSamples;
  v3 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  self->_tmp1DataBuff = v3;
  if (!v3)
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v7)
      return result;
    v15 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "HalogenLdcmCalc:Failed to alloc _tmp1DataBuff";
    v10 = (uint8_t *)&v15;
    goto LABEL_12;
  }
  self->_tmp2DataBuffSize = self->_sizeofSample * self->_nSamples;
  v4 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  self->_tmp2DataBuff = v4;
  if (!v4)
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v14 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "HalogenLdcmCalc:Failed to alloc _tmp2DataBuff";
    v10 = (uint8_t *)&v14;
LABEL_12:
    _os_log_impl(&dword_1D13BF000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    return 0;
  }
  self->_tmp3DataBuffSize = self->_sizeofSample * self->_nSamples;
  v5 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  self->_tmp3DataBuff = v5;
  if (v5)
    return 1;
  v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v12)
  {
    v13 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = "HalogenLdcmCalc:Failed to alloc _tmp3DataBuff";
    v10 = (uint8_t *)&v13;
    goto LABEL_12;
  }
  return result;
}

- (void)_freeBuffers
{

}

- (int)doPreCalibration:(id)a3 withCurrentData:(id)a4
{
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;

  -[HalogenLdcmCalc _snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:", a3, &self->_precalVoltageSignalLevel, &self->_precalVoltageNoiseLevel, 0, self->_adcGain);
  v7 = v6;
  self->_precalVoltageSNR = v6;
  -[HalogenLdcmCalc _snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:", a4, &self->_precalCurrentSignalLevel, &self->_precalCurrentNoiseLevel, 0, self->_adcGain);
  self->_precalCurrentSNR = v8;
  v9 = v7 < 26.0 || v8 < 26.0;
  v10 = vabdd_f64(v7, v8);
  if (!v9 && v10 < 0.25)
    return 0;
  else
    return 2;
}

- (int)doCalibration:(id)a3 withCurrentData:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int result;
  double v14;
  double v15;
  double v16;
  double v17;

  -[HalogenLdcmCalc _snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:", a3, &self->_calVoltageSignalLevel, &self->_calVoltageNoiseLevel, 0, self->_adcGain);
  v8 = v7;
  self->_calVoltageSNR = v7;
  -[HalogenLdcmCalc _snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:", a4, &self->_calCurrentSignalLevel, &self->_calCurrentNoiseLevel, 0, self->_adcGain);
  v10 = v9;
  self->_calCurrentSNR = v9;
  v16 = NAN;
  v17 = NAN;
  -[HalogenLdcmCalc _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:", a3, &v17, &v16, 1);
  v14 = NAN;
  v15 = NAN;
  -[HalogenLdcmCalc _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:", a4, &v15, &v14, 1);
  v11 = (v17 + v15) * 0.5;
  v12 = v11 / v15;
  self->_voltageGainCorrection = v11 / v17;
  self->_currentGainCorrection = v12;
  self->_currentPhaseCompensation = v16 - v14;
  result = 2;
  if (v8 >= 26.0 && v10 >= 26.0 && vabdd_f64(v8, v10) < 0.25)
  {
    if (-[HalogenLdcmCalc isBoundViolation_voltageGainCorrection](self, "isBoundViolation_voltageGainCorrection"))
      return 1;
    if (-[HalogenLdcmCalc isBoundViolation_currentGainCorrection](self, "isBoundViolation_currentGainCorrection"))
      return 1;
    result = -[HalogenLdcmCalc isBoundViolation_currentPhaseCompensation](self, "isBoundViolation_currentPhaseCompensation");
    if (result)
      return 1;
  }
  return result;
}

- (int)doLiquidDetection:(id)a3 withCurrentData:(id)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v15;
  double v16;
  double v17;
  double *p_measurementCondetSNR;
  double v19;
  double v20;
  double v21;
  long double v22;
  char v23;
  int result;
  double v25;
  double v26;
  double v27;
  double v28;
  uint8_t buf[4];
  double v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v8 = a6;
  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  self->_capacitanceInNanoF = 0.0;
  *(_OWORD *)&self->_compensatedImpedance = 0u;
  *(_OWORD *)&self->_clippingScore = 0u;
  *(_OWORD *)&self->_goertzelImpedance = 0u;
  -[HalogenLdcmCalc _applyGain:toData:](self, "_applyGain:toData:", a4, self->_adcGain);
  -[HalogenLdcmCalc _applyGain:toData:](self, "_applyGain:toData:", a3, self->_adcGain);
  -[HalogenLdcmCalc _applyFractionalPhaseShift:withPhaseDelay:](self, "_applyFractionalPhaseShift:withPhaseDelay:", a4, self->_currentPhaseCompensation / -360.0 / self->_signalFrequency * self->_sampleRate);
  -[HalogenLdcmCalc _applyGain:toData:](self, "_applyGain:toData:", a4, self->_currentGainCorrection);
  -[HalogenLdcmCalc _applyGain:toData:](self, "_applyGain:toData:", a3, self->_voltageGainCorrection);
  v15 = -[HalogenLdcmCalc _isClipped:](self, "_isClipped:", a4);
  -[HalogenLdcmCalc _applyTiaGain:toCurrentData:](self, "_applyTiaGain:toCurrentData:", a3, a4);
  -[HalogenLdcmCalc _snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:", a3, &self->_measurementVoltageSignalLevel, &self->_measurementVoltageNoiseLevel, 0, 1.0);
  v17 = v16;
  self->_measurementVoltageSNR = v16;
  p_measurementCondetSNR = &self->_measurementCondetSNR;
  -[HalogenLdcmCalc _snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:hasCondetSnr:", a4, &self->_measurementCurrentSignalLevel, &self->_measurementCurrentNoiseLevel, &self->_measurementCondetSNR, 1.0);
  v20 = v19;
  self->_measurementCurrentSNR = v19;
  if (v9 && *p_measurementCondetSNR >= 1.0)
  {
    -[HalogenLdcmCalc setIsDigitalFilterTrigger:](self, "setIsDigitalFilterTrigger:", 1, *p_measurementCondetSNR);
    -[HalogenLdcmCalc _applyDigitalFilter:](self, "_applyDigitalFilter:", a4);
  }
  else
  {
    -[HalogenLdcmCalc setIsDigitalFilterTrigger:](self, "setIsDigitalFilterTrigger:", 0);
  }
  v27 = NAN;
  v28 = NAN;
  -[HalogenLdcmCalc _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:", a3, &v28, &v27, 1);
  v25 = NAN;
  v26 = NAN;
  -[HalogenLdcmCalc _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:", a4, &v26, &v25, 1);
  v21 = v28 / v26;
  self->_goertzelImpedance = v28 / v26;
  v22 = v27 - v25;
  if (v27 - v25 > 0.0)
    v22 = fmod(v27 - v25, 360.0) + -360.0;
  self->_goertzelPhase = v22;
  -[HalogenLdcmCalc _doHydraComp:withPhase:](self, "_doHydraComp:withPhase:", v21);
  -[HalogenLdcmCalc _rcSolver](self, "_rcSolver");
  v23 = v17 < 26.0 || v15;
  if (v17 >= 26.0)
    result = 3;
  else
    result = 8;
  if ((v23 & 1) == 0)
  {
    if (-[HalogenLdcmCalc isLowerBoundViolation_goertzelImpedance](self, "isLowerBoundViolation_goertzelImpedance")
      || -[HalogenLdcmCalc isUpperBoundViolation_goertzelImpedance](self, "isUpperBoundViolation_goertzelImpedance")
      || -[HalogenLdcmCalc isLowerBoundViolation_goertzelPhase](self, "isLowerBoundViolation_goertzelPhase")
      || -[HalogenLdcmCalc isUpperBoundViolation_goertzelPhase](self, "isUpperBoundViolation_goertzelPhase"))
    {
      return 0;
    }
    else if (v20 >= 7.0 || self->_isDigitalFilterTrigger)
    {
      if (!v8)
        a8 = a7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v30 = a8;
        v31 = 1024;
        v32 = v8;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenLdcmCalc:doLiquidDetection capacitanceThreshholdNanoF = %f, isReceptacleWet: %d", buf, 0x12u);
      }
      if (self->_capacitanceInNanoF <= a8)
        return 1;
      else
        return 2;
    }
    else
    {
      return 8;
    }
  }
  return result;
}

- (void)_applyGain:(double)a3 toData:(id)a4
{
  double *v7;
  unint64_t v8;
  unint64_t sizeofSample;
  unint64_t v10;

  v7 = (double *)objc_msgSend(a4, "bytes");
  v8 = objc_msgSend(a4, "length");
  sizeofSample = self->_sizeofSample;
  if (v8 >= sizeofSample)
  {
    v10 = v8 / sizeofSample;
    if (v10 <= 1)
      v10 = 1;
    do
    {
      *v7 = *v7 * a3;
      ++v7;
      --v10;
    }
    while (v10);
  }
}

- (void)_applyTiaGain:(id)a3 toCurrentData:(id)a4
{
  double *v6;
  double *v7;
  unint64_t v8;
  unint64_t sizeofSample;
  unint64_t v10;
  double v11;

  v6 = (double *)objc_msgSend(a4, "bytes");
  v7 = (double *)objc_msgSend(a3, "bytes");
  v8 = objc_msgSend(a3, "length");
  sizeofSample = self->_sizeofSample;
  if (v8 >= sizeofSample)
  {
    v10 = v8 / sizeofSample;
    if (v10 <= 1)
      v10 = 1;
    do
    {
      v11 = *v7++;
      *v6 = (*v6 - v11) / self->_tiaGain;
      ++v6;
      --v10;
    }
    while (v10);
  }
}

- (void)_applyHanningWindow:(id)a3 withSize:(int)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "bytes");
  if (a4 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      *(long double *)(v6 + 8 * v7) = (1.0 - cos((double)((int)v7 + 1) * 6.28318531 / (double)(a4 + 1)))
                                    * 0.5
                                    * *(double *)(v6 + 8 * v7);
      ++v7;
    }
    while (a4 != v7);
  }
}

- (void)_goertzelSecondOrder:(id)a3 hasFftValue:(double *)a4 hasPhase:(double *)a5 withHanning:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  unint64_t v12;
  unint64_t sizeofSample;
  unint64_t v14;
  __double2 v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v6 = a6;
  v11 = objc_msgSend(a3, "bytes");
  v12 = objc_msgSend(a3, "length");
  sizeofSample = self->_sizeofSample;
  v14 = v12 / sizeofSample;
  v15 = __sincos_stret(self->_signalFrequency / self->_sampleRate * 6.28318531);
  v16 = 0.0;
  v17 = 0.0;
  if (v12 >= sizeofSample)
  {
    v18 = 0;
    v19 = v15.__cosval + v15.__cosval;
    if (v14 <= 1)
      v20 = 1;
    else
      v20 = v14;
    v21 = 0.0;
    v22 = 0.0;
    do
    {
      if (v6)
        v23 = v19 * v22
            + *(double *)(v11 + 8 * v18) * ((1.0 - cos((double)((int)v18 + 1) * 6.28318531 / (double)(v14 + 1))) * 0.5);
      else
        v23 = *(double *)(v11 + 8 * v18) + v19 * v22;
      ++v18;
      v16 = v23 - v21;
      v17 = v22;
      v21 = v22;
      v22 = v16;
    }
    while (v18 != v20);
  }
  v24 = v16 - v17 * v15.__cosval;
  v25 = v15.__sinval * v17;
  if (a4)
  {
    v26 = sqrt(v25 * v25 + v24 * v24);
    *a4 = (v26 + v26) / (double)v14;
  }
  if (a5)
    *a5 = atan2(v25, v24) * 180.0 / 3.14159265;
}

- (void)_applyFractionalPhaseShift:(id)a3 withPhaseDelay:(double)a4
{
  uint64_t *v7;
  double v8;
  unsigned int v9;
  int v10;
  int v11;
  double *v12;
  unint64_t v13;
  unint64_t sizeofSample;
  unint64_t v15;
  double *v16;
  double v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double *v21;
  double v22;
  double v23;
  unint64_t nSamples;
  unint64_t v25;
  uint64_t v26;

  v26 = -1;
  v7 = (uint64_t *)objc_msgSend(a3, "bytes");
  v8 = -a4;
  objc_msgSend(a3, "appendBytes:length:", &v7[objc_msgSend(a3, "length") / (unint64_t)self->_sizeofSample - 1]);
  if (a4 >= 1.0)
  {
    v9 = vcvtpd_s64_f64(v8);
    v8 = (double)-v9 - a4;
    v26 = *v7;
    if ((v9 & 0x80000000) != 0)
    {
      if ((signed int)-v9 <= 1)
        v10 = 1;
      else
        v10 = -v9;
      do
      {
        objc_msgSend(a3, "replaceBytesInRange:withBytes:length:", 0, 0, &v26, self->_sizeofSample);
        --v10;
      }
      while (v10);
    }
  }
  if (v8 >= 1.0)
  {
    v11 = vcvtmd_s64_f64(v8);
    v8 = v8 - (double)v11;
    objc_msgSend(a3, "replaceBytesInRange:withBytes:length:", 0, self->_sizeofSample * (uint64_t)v11, 0, 0);
  }
  v12 = (double *)objc_msgSend(a3, "bytes");
  v13 = objc_msgSend(a3, "length");
  sizeofSample = self->_sizeofSample;
  v15 = v13 / sizeofSample;
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
    {
      v20 = v15 - 1;
      if (v15 != 1)
      {
        v21 = v12 + 1;
        v22 = *v12;
        do
        {
          v23 = *v21;
          *(v21 - 1) = (1.0 - v8) * v22 + *v21 * v8;
          ++v21;
          v22 = v23;
          --v20;
        }
        while (v20);
      }
    }
  }
  else if (v15 >= 2)
  {
    v16 = v12 + 1;
    v17 = *v12;
    v18 = v15 - 1;
    do
    {
      v19 = *v16;
      *v16 = *v16 * (v8 + 1.0) - v17 * v8;
      ++v16;
      v17 = v19;
      --v18;
    }
    while (v18);
  }
  nSamples = self->_nSamples;
  if (v15 >= nSamples)
  {
    if (v15 > nSamples)
      objc_msgSend(a3, "setLength:", (int)nSamples * (uint64_t)(int)sizeofSample);
  }
  else
  {
    v25 = v15 - 1;
    v26 = *(_QWORD *)&v12[v15 - 1];
    do
    {
      v12[v15] = v12[v25];
      objc_msgSend(a3, "appendBytes:length:", &v26, self->_sizeofSample);
      ++v15;
    }
    while (v15 < self->_nSamples);
  }
}

- (void)_doHydraComp:(double)a3 withPhase:(double)a4
{
  __double2 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  __complex_double v17;

  v6 = __sincos_stret(a4 * 3.14159265 / 180.0);
  v7 = 1.0 / self->_hydraImpedance;
  v8 = __divdc3(1.0, 0.0, v6.__cosval * a3 + v6.__sinval * a3 * 0.0, v6.__sinval * a3);
  v10 = v9;
  v11 = v8 - v7;
  v12 = __divsc3(-0.0, -1.0, 2.0, 0.0);
  v14 = __divdc3(1.0, 0.0, v11 + self->_signalFrequency * (v12 * 3.14159265) * 3.3e-11, v10 + self->_signalFrequency * (v13 * 3.14159265) * 3.3e-11);
  v16 = v15;
  self->_compensatedImpedance = MEMORY[0x1D17E7990]();
  v17.c[0] = v14;
  v17.c[1] = v16;
  self->_compensatedPhase = carg(v17) / 3.14159265 * 180.0;
}

- (BOOL)_isClipped:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t diffWindowSize;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  int v12;
  double v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  double v17;
  double *v18;
  BOOL v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  double v28;
  int v29;
  signed int v30;
  double v31;
  uint64_t v32;
  signed int v33;
  uint64_t v34;
  double v35;
  double *v36;
  uint64_t v37;
  double v38;
  double v39;

  v4 = objc_msgSend(a3, "bytes");
  v5 = -[NSMutableData bytes](self->_tmp1DataBuff, "bytes");
  v6 = -[NSMutableData bytes](self->_tmp2DataBuff, "bytes");
  v7 = -[NSMutableData bytes](self->_tmp3DataBuff, "bytes");
  diffWindowSize = self->_diffWindowSize;
  if ((int)diffWindowSize > 0)
  {
    v9 = 0;
    do
    {
      *(double *)(v5 + v9) = *(double *)(v4 + v9 + 8) - *(double *)(v4 + v9);
      v9 += 8;
    }
    while (8 * diffWindowSize != v9);
    v10 = 0;
    v11 = (double *)(v6 + 792);
    v12 = diffWindowSize - 199;
    v13 = 0.0;
    while (1)
    {
      v14 = 0;
      *(_QWORD *)(v6 + 8 * v10) = 0;
      v15 = (double *)v5;
      v16 = v10;
      v17 = 0.0;
      do
      {
        if (v14)
        {
          if (v16 <= 0x64)
          {
            v18 = v15;
            if (v14 < self->_clipDetectWindowSize)
              goto LABEL_12;
          }
        }
        else if (v16 <= 0x64)
        {
          v18 = (double *)v5;
          if (self->_clipDetectWindowSize >= 1)
          {
LABEL_12:
            v17 = v17 + fir1[v16] * *v18;
            *(double *)(v6 + 8 * v10) = v17;
          }
        }
        ++v14;
        --v16;
        ++v15;
      }
      while (v16 != -1);
      if ((unint64_t)v10 > 0x62)
      {
        v19 = v17 > v13 && v10 < self->_clipDetectWindowSize - 100;
        if (v19)
          v13 = v17;
      }
      if (++v10 == diffWindowSize)
      {
        if ((int)diffWindowSize < 200)
        {
          v21 = 0;
        }
        else
        {
          v20 = (diffWindowSize - 199);
          do
          {
            *v11 = *v11 / v13;
            ++v11;
            --v20;
          }
          while (v20);
          v21 = 1;
        }
        goto LABEL_27;
      }
    }
  }
  v21 = 0;
  v12 = diffWindowSize - 199;
LABEL_27:
  v22 = llround(self->_sampleRate / self->_signalFrequency * 0.5);
  if (v22 >= 0)
    v23 = v22;
  else
    v23 = v22 + 1;
  v24 = v23 >> 1;
  v25 = v22 - (v23 & 0xFFFFFFFE);
  if (v21)
  {
    v26 = 0;
    v27 = v24 + v25 - 1;
    v28 = (double)v22;
    v29 = -v24;
    do
    {
      v30 = v27 + v26;
      if (v27 + (int)v26 >= (int)diffWindowSize - 200)
        v30 = diffWindowSize - 200;
      v31 = 0.0;
      if (((v26 - v24) & ~(((int)v26 - v24) >> 31)) <= v30)
      {
        v32 = v29 & ~(v29 >> 31);
        do
        {
          v31 = v31 + fabs(*(double *)(v6 + 792 + 8 * v32));
          v19 = v32++ < v30;
        }
        while (v19);
      }
      *(double *)(v7 + 8 * v26++) = v31 / v28;
      ++v29;
    }
    while (v26 != v12);
  }
  v33 = v24 + v25;
  v34 = (diffWindowSize - 2 * v33 - 198);
  v35 = *(double *)(v7 + 8 * v33);
  if ((int)v34 >= 2)
  {
    v36 = (double *)(v7 + 8 * v33 + 8);
    v37 = v34 - 1;
    do
    {
      v38 = *v36++;
      v39 = v38;
      if (v35 > v38)
        v35 = v39;
      --v37;
    }
    while (v37);
  }
  self->_clippingScore = v35;
  return v35 < self->_movesumClipThreshold;
}

- (void)_rcSolver
{
  double compensatedImpedance;
  __double2 v4;
  double signalFrequency;
  double v6;
  double v7;
  double v8;
  double v9;

  compensatedImpedance = self->_compensatedImpedance;
  v4 = __sincos_stret(self->_compensatedPhase * 3.14159265 / 180.0);
  signalFrequency = self->_signalFrequency;
  v6 = signalFrequency * 6.28318531 * self->_ldcmAcCap;
  v7 = compensatedImpedance * v4.__cosval + compensatedImpedance * v4.__sinval * 0.0 - (self->_hydraR - 0.0 / v6);
  v8 = compensatedImpedance * v4.__sinval + 1.0 / v6;
  v9 = v7 + v8 * v8 / v7;
  self->_resistanceInOhms = v9;
  self->_capacitanceInNanoF = v8 / (signalFrequency * ((v7 * v9 + v7 * v9) * 3.14159265)) * -1000000000.0;
}

- (double)_snr:(id)a3 withGain:(double)a4 hasSignalLevel:(double *)a5 hasNoiseLevel:(double *)a6 hasCondetSnr:(double *)a7
{
  const void *v12;
  NSMutableData *tmp1DataBuff;
  double *v14;
  double *v15;
  uint64_t v16;
  uint64_t i;
  double v18;
  double v19;
  uint64_t j;
  double v21;
  uint64_t k;
  uint64_t v23;
  DSPDoubleSplitComplex v25;

  v12 = (const void *)objc_msgSend(a3, "bytes");
  tmp1DataBuff = self->_tmp1DataBuff;
  v14 = (double *)-[NSMutableData bytes](tmp1DataBuff, "bytes");
  v15 = (double *)-[NSMutableData bytes](self->_tmp2DataBuff, "bytes");
  v16 = -[NSMutableData bytes](self->_tmp3DataBuff, "bytes");
  v25.realp = v14;
  v25.imagp = v15;
  memcpy(v14, v12, (uint64_t)self->_sizeofSample << 11);
  bzero(v15, (uint64_t)self->_sizeofSample << 11);
  -[HalogenLdcmCalc _applyGain:toData:](self, "_applyGain:toData:", tmp1DataBuff, a4, v14, v15);
  -[HalogenLdcmCalc _applyHanningWindow:withSize:](self, "_applyHanningWindow:withSize:", tmp1DataBuff, 2048);
  vDSP_fft_zripD(self->_fftContext, &v25, 1, 0xCuLL, 1);
  for (i = 0; i != 1024; ++i)
  {
    v14[i] = v14[i] * 0.000244140625;
    v18 = v15[i] * 0.000244140625;
    v15[i] = v18;
    *(double *)(v16 + i * 8) = v18 * v18 + v14[i] * v14[i];
  }
  v19 = 0.0;
  for (j = 32; j != 56; j += 8)
    v19 = v19 + *(double *)(v16 + j);
  v21 = 2.22507386e-308;
  for (k = 56; k != 0x2000; k += 8)
    v21 = v21 + *(double *)(v16 + k);
  if (a5)
    *a5 = v19;
  if (a6)
    *a6 = v21;
  if (a7)
  {
    -[HalogenLdcmCalc _condetSnr:](self, "_condetSnr:", v16);
    *(_QWORD *)a7 = v23;
  }
  return log10(v19 / v21) * 10.0;
}

- (double)_condetSnr:(double *)a3
{
  double v4;
  double *v5;
  int v6;
  double v7;
  double v8;
  int v9;
  double v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  double v18;
  double v20;

  if (!a3)
    return 2.22507386e-308;
  v4 = self->_sampleRate * 0.00048828125;
  v5 = a3 - 2;
  v6 = 25;
  v7 = 25.0;
  v8 = 2.22507386e-308;
  do
  {
    v9 = llround(v4 * v7);
    v10 = 0.0;
    if (v9 <= 23999)
    {
      v11 = v9;
      do
      {
        v12 = llround((double)v11 / v4);
        if (v12 <= 2)
          v13 = 2;
        else
          v13 = v12;
        if (v12 >= 1021)
          v12 = 1021;
        v14 = v12 + 2;
        if ((int)v13 - 2 <= v14)
        {
          do
          {
            v10 = v10 + v5[v13];
            v15 = v13 - 2;
            ++v13;
          }
          while (v15 < v14);
        }
        v11 += v9;
      }
      while (v11 < 24000);
    }
    v16 = llround((double)v9 / v4);
    if (v16 > 1025)
    {
      v18 = 2.22507386e-308;
    }
    else
    {
      v17 = v16 - 2;
      v18 = 2.22507386e-308;
      do
        v18 = v18 + a3[v17];
      while (v17++ < 1023);
    }
    v20 = log10(v10 / (v18 - v10)) * 10.0;
    if (v20 > v8)
      v8 = v20;
    v7 = v7 + 1.0;
    ++v6;
  }
  while (v6 != 32);
  return v8;
}

- (double)_mean:(double *)a3 ofSize:(unint64_t)a4
{
  double v4;
  unint64_t v5;
  double v6;

  v4 = 0.0;
  if (a4)
  {
    v5 = a4;
    do
    {
      v6 = *a3++;
      v4 = v4 + v6;
      --v5;
    }
    while (v5);
  }
  return v4 / (double)a4;
}

- (double)_variance:(double *)a3 ofSize:(unint64_t)a4
{
  double v6;
  double v7;
  unint64_t v8;
  double v9;

  -[HalogenLdcmCalc _mean:ofSize:](self, "_mean:ofSize:");
  v7 = 0.0;
  if (a4)
  {
    v8 = a4;
    do
    {
      v9 = *a3++;
      v7 = v7 + (v9 - v6) * (v9 - v6);
      --v8;
    }
    while (v8);
  }
  return v7 / (double)(a4 - 1);
}

- (double)_stdev:(double *)a3 ofSize:(unint64_t)a4
{
  double v4;

  -[HalogenLdcmCalc _variance:ofSize:](self, "_variance:ofSize:", a3, a4);
  return sqrt(v4);
}

- (double)_median:(double *)a3 ofSize:(unint64_t)a4
{
  double result;

  qsort(a3, a4, self->_sizeofSample, (int (__cdecl *)(const void *, const void *))compare);
  result = a3[a4 >> 1];
  if ((a4 & 1) == 0)
    return (result + a3[(a4 >> 1) - 1]) * 0.5;
  return result;
}

- (void)_reconstructSignal:(id)a3
{
  char *v5;
  double *v6;
  double *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t sizeofSample;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double *v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double *v40;
  void *__dst;
  unint64_t v42;

  v5 = (char *)objc_msgSend(a3, "bytes");
  v6 = (double *)-[NSMutableData bytes](self->_tmp1DataBuff, "bytes");
  v7 = (double *)-[NSMutableData bytes](self->_tmp2DataBuff, "bytes");
  __dst = (void *)-[NSMutableData bytes](self->_tmp3DataBuff, "bytes");
  v8 = objc_msgSend(a3, "length");
  v9 = v8;
  sizeofSample = self->_sizeofSample;
  v11 = v8 / sizeofSample;
  v12 = v8 / sizeofSample - 1;
  v42 = sizeofSample;
  if (v8 >= sizeofSample)
  {
    v13 = 0;
    if (v11 <= 1)
      v14 = 1;
    else
      v14 = v8 / sizeofSample;
    do
    {
      if ((int)v13 <= 1)
        v15 = 1;
      else
        v15 = v13;
      v16 = (v15 - 1);
      v17 = v13 + 1;
      if (v11 > v13 + 1)
        v18 = v13 + 1;
      else
        v18 = v12;
      -[HalogenLdcmCalc _mean:ofSize:](self, "_mean:ofSize:", &v5[8 * v16], v18 - v16 + 1);
      v6[v13++] = v19;
    }
    while (v14 != v17);
  }
  if (v12)
  {
    v20 = v6 + 1;
    v21 = *v6;
    v22 = v12;
    do
    {
      v23 = *v20;
      *(v20 - 1) = *v20 - v21;
      ++v20;
      v21 = v23;
      --v22;
    }
    while (v22);
  }
  v6[v12] = 0.0;
  if (v9 >= v42)
  {
    v24 = 0;
    if (v11 <= 1)
      v25 = 1;
    else
      v25 = v11;
    do
    {
      if ((int)v24 <= 3)
        v26 = 3;
      else
        v26 = v24;
      v27 = (v26 - 3);
      v28 = v24 + 3;
      if (v11 <= v24 + 3)
        v28 = v12;
      -[HalogenLdcmCalc _variance:ofSize:](self, "_variance:ofSize:", &v6[v27], v28 - v27 + 1);
      v7[v24++] = v29;
    }
    while (v25 != v24);
    v30 = v7;
    do
    {
      *v30 = sqrt(*v30);
      ++v30;
      --v25;
    }
    while (v25);
  }
  memcpy(__dst, v7, v11 * self->_sizeofSample);
  -[HalogenLdcmCalc _median:ofSize:](self, "_median:ofSize:", __dst, v11);
  v32 = v31;
  -[HalogenLdcmCalc _stdev:ofSize:](self, "_stdev:ofSize:", v7, v11);
  if (v9 >= v42)
  {
    v34 = 0;
    v35 = v32 + v33 * 1.5;
    if (v11 <= 1)
      v36 = 1;
    else
      v36 = v11;
    do
    {
      if (fabs(v7[v34]) >= v35)
        v6[v34] = 0.0;
      ++v34;
    }
    while (v36 != v34);
    v37 = 0;
    v38 = 0.0;
    do
    {
      v38 = v38 + v6[v37];
      v6[v37++] = v38;
    }
    while (v36 != v37);
    -[HalogenLdcmCalc _mean:ofSize:](self, "_mean:ofSize:", v6, v11);
    v40 = v6;
    do
    {
      *v40 = *v40 - v39;
      ++v40;
      --v36;
    }
    while (v36);
  }
  else
  {
    -[HalogenLdcmCalc _mean:ofSize:](self, "_mean:ofSize:", v6, v11);
  }
  memcpy(v5, v6, v11 * self->_sizeofSample);
}

- (double)_sineExtractor:(id)a3
{
  double *v5;
  unint64_t v6;
  double *v7;
  double v8;
  unint64_t v9;
  double v10;
  double v12;

  v5 = (double *)objc_msgSend(a3, "bytes");
  v6 = objc_msgSend(a3, "length") / (unint64_t)self->_sizeofSample;
  if (v6 != 1)
  {
    v7 = v5 + 1;
    v8 = *v5;
    v9 = v6 - 1;
    do
    {
      v10 = *v7;
      *(v7 - 1) = *v7 - v8;
      ++v7;
      v8 = v10;
      --v9;
    }
    while (v9);
  }
  v5[v6 - 1] = 0.0;
  v12 = NAN;
  -[HalogenLdcmCalc _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:", a3, 0, &v12, 0);
  return (v12 + -90.0 + (double)(v6 + 2) / (self->_sampleRate / self->_signalFrequency) * -360.0) * 3.14159265 / 180.0;
}

- (void)_applyDigitalFilter:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t sizeofSample;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;

  v5 = objc_msgSend(a3, "bytes");
  v6 = objc_msgSend(a3, "length");
  sizeofSample = self->_sizeofSample;
  v8 = v6 / sizeofSample;
  -[HalogenLdcmCalc _mean:ofSize:](self, "_mean:ofSize:", v5, v6 / sizeofSample);
  v10 = v9;
  *(double *)&v15 = NAN;
  -[HalogenLdcmCalc _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:", a3, &v15, 0, 0);
  -[HalogenLdcmCalc _reconstructSignal:](self, "_reconstructSignal:", a3);
  -[HalogenLdcmCalc _sineExtractor:](self, "_sineExtractor:", a3);
  if (v6 >= sizeofSample)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(double *)&v15;
    if (v8 <= 1)
      v8 = 1;
    do
    {
      *(long double *)(v5 + 8 * v13) = v10
                                     + v14
                                     * cos(v12+ self->_signalFrequency * 6.28318531 * ((double)(int)v13 / self->_sampleRate));
      ++v13;
    }
    while (v8 != v13);
  }
}

- (BOOL)isBoundViolation_voltageGainCorrection
{
  double voltageGainCorrection;

  voltageGainCorrection = self->_voltageGainCorrection;
  return voltageGainCorrection < self->_sanitycheckVoltageGainCorrectionLowerbound
      || voltageGainCorrection > self->_sanitycheckVoltageGainCorrectionUpperbound;
}

- (BOOL)isBoundViolation_currentGainCorrection
{
  double currentGainCorrection;

  currentGainCorrection = self->_currentGainCorrection;
  return currentGainCorrection < self->_sanitycheckCurrentGainCorrectionLowerbound
      || currentGainCorrection > self->_sanitycheckCurrentGainCorrectionUpperbound;
}

- (BOOL)isBoundViolation_currentPhaseCompensation
{
  double currentPhaseCompensation;

  currentPhaseCompensation = self->_currentPhaseCompensation;
  return currentPhaseCompensation < self->_sanitycheckCurrentPhaseCompensationLowerbound
      || currentPhaseCompensation > self->_sanitycheckCurrentPhaseCompensationUpperbound;
}

- (BOOL)isLowerBoundViolation_goertzelImpedance
{
  return self->_goertzelImpedance < self->_sanitycheckImpedanceLowerbound;
}

- (BOOL)isUpperBoundViolation_goertzelImpedance
{
  return self->_goertzelImpedance > self->_sanitycheckImpedanceUpperbound;
}

- (BOOL)isLowerBoundViolation_goertzelPhase
{
  return self->_goertzelPhase < self->_sanitycheckPhaseLowerbound;
}

- (BOOL)isUpperBoundViolation_goertzelPhase
{
  return self->_goertzelPhase > self->_sanitycheckPhaseUperbound;
}

- (BOOL)isBoundViolation_measurementCondetSNR
{
  return self->_isDigitalFilterTrigger;
}

- (double)precalVoltageSignalLevel
{
  return self->_precalVoltageSignalLevel;
}

- (double)precalVoltageNoiseLevel
{
  return self->_precalVoltageNoiseLevel;
}

- (double)precalVoltageSNR
{
  return self->_precalVoltageSNR;
}

- (double)precalCurrentSignalLevel
{
  return self->_precalCurrentSignalLevel;
}

- (double)precalCurrentNoiseLevel
{
  return self->_precalCurrentNoiseLevel;
}

- (double)precalCurrentSNR
{
  return self->_precalCurrentSNR;
}

- (double)voltageGainCorrection
{
  return self->_voltageGainCorrection;
}

- (double)currentGainCorrection
{
  return self->_currentGainCorrection;
}

- (double)currentPhaseCompensation
{
  return self->_currentPhaseCompensation;
}

- (double)calVoltageSignalLevel
{
  return self->_calVoltageSignalLevel;
}

- (double)calVoltageNoiseLevel
{
  return self->_calVoltageNoiseLevel;
}

- (double)calVoltageSNR
{
  return self->_calVoltageSNR;
}

- (double)calCurrentSignalLevel
{
  return self->_calCurrentSignalLevel;
}

- (double)calCurrentNoiseLevel
{
  return self->_calCurrentNoiseLevel;
}

- (double)calCurrentSNR
{
  return self->_calCurrentSNR;
}

- (double)goertzelImpedance
{
  return self->_goertzelImpedance;
}

- (double)goertzelPhase
{
  return self->_goertzelPhase;
}

- (double)compensatedImpedance
{
  return self->_compensatedImpedance;
}

- (double)compensatedPhase
{
  return self->_compensatedPhase;
}

- (double)clippingScore
{
  return self->_clippingScore;
}

- (double)resistanceInOhms
{
  return self->_resistanceInOhms;
}

- (double)capacitanceInNanoF
{
  return self->_capacitanceInNanoF;
}

- (double)measurementVoltageSignalLevel
{
  return self->_measurementVoltageSignalLevel;
}

- (double)measurementVoltageNoiseLevel
{
  return self->_measurementVoltageNoiseLevel;
}

- (double)measurementVoltageSNR
{
  return self->_measurementVoltageSNR;
}

- (double)measurementCurrentSignalLevel
{
  return self->_measurementCurrentSignalLevel;
}

- (double)measurementCurrentNoiseLevel
{
  return self->_measurementCurrentNoiseLevel;
}

- (double)measurementCurrentSNR
{
  return self->_measurementCurrentSNR;
}

- (double)measurementCondetSNR
{
  return self->_measurementCondetSNR;
}

- (int)nSamples
{
  return self->_nSamples;
}

- (void)setNSamples:(int)a3
{
  self->_nSamples = a3;
}

- (int)diffWindowSize
{
  return self->_diffWindowSize;
}

- (void)setDiffWindowSize:(int)a3
{
  self->_diffWindowSize = a3;
}

- (int)clipDetectWindowSize
{
  return self->_clipDetectWindowSize;
}

- (void)setClipDetectWindowSize:(int)a3
{
  self->_clipDetectWindowSize = a3;
}

- (int)sizeofSample
{
  return self->_sizeofSample;
}

- (void)setSizeofSample:(int)a3
{
  self->_sizeofSample = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (double)signalFrequency
{
  return self->_signalFrequency;
}

- (void)setSignalFrequency:(double)a3
{
  self->_signalFrequency = a3;
}

- (double)adcGain
{
  return self->_adcGain;
}

- (void)setAdcGain:(double)a3
{
  self->_adcGain = a3;
}

- (double)tiaGain
{
  return self->_tiaGain;
}

- (void)setTiaGain:(double)a3
{
  self->_tiaGain = a3;
}

- (double)hydraImpedance
{
  return self->_hydraImpedance;
}

- (void)setHydraImpedance:(double)a3
{
  self->_hydraImpedance = a3;
}

- (double)movesumClipThreshold
{
  return self->_movesumClipThreshold;
}

- (void)setMovesumClipThreshold:(double)a3
{
  self->_movesumClipThreshold = a3;
}

- (double)hydraR
{
  return self->_hydraR;
}

- (void)setHydraR:(double)a3
{
  self->_hydraR = a3;
}

- (double)ldcmAcCap
{
  return self->_ldcmAcCap;
}

- (void)setLdcmAcCap:(double)a3
{
  self->_ldcmAcCap = a3;
}

- (double)sanitycheckImpedanceLowerbound
{
  return self->_sanitycheckImpedanceLowerbound;
}

- (void)setSanitycheckImpedanceLowerbound:(double)a3
{
  self->_sanitycheckImpedanceLowerbound = a3;
}

- (double)sanitycheckImpedanceUpperbound
{
  return self->_sanitycheckImpedanceUpperbound;
}

- (void)setSanitycheckImpedanceUpperbound:(double)a3
{
  self->_sanitycheckImpedanceUpperbound = a3;
}

- (double)sanitycheckPhaseLowerbound
{
  return self->_sanitycheckPhaseLowerbound;
}

- (void)setSanitycheckPhaseLowerbound:(double)a3
{
  self->_sanitycheckPhaseLowerbound = a3;
}

- (double)sanitycheckPhaseUperbound
{
  return self->_sanitycheckPhaseUperbound;
}

- (void)setSanitycheckPhaseUperbound:(double)a3
{
  self->_sanitycheckPhaseUperbound = a3;
}

- (double)sanitycheckVoltageGainCorrectionLowerbound
{
  return self->_sanitycheckVoltageGainCorrectionLowerbound;
}

- (void)setSanitycheckVoltageGainCorrectionLowerbound:(double)a3
{
  self->_sanitycheckVoltageGainCorrectionLowerbound = a3;
}

- (double)sanitycheckVoltageGainCorrectionUpperbound
{
  return self->_sanitycheckVoltageGainCorrectionUpperbound;
}

- (void)setSanitycheckVoltageGainCorrectionUpperbound:(double)a3
{
  self->_sanitycheckVoltageGainCorrectionUpperbound = a3;
}

- (double)sanitycheckCurrentGainCorrectionLowerbound
{
  return self->_sanitycheckCurrentGainCorrectionLowerbound;
}

- (void)setSanitycheckCurrentGainCorrectionLowerbound:(double)a3
{
  self->_sanitycheckCurrentGainCorrectionLowerbound = a3;
}

- (double)sanitycheckCurrentGainCorrectionUpperbound
{
  return self->_sanitycheckCurrentGainCorrectionUpperbound;
}

- (void)setSanitycheckCurrentGainCorrectionUpperbound:(double)a3
{
  self->_sanitycheckCurrentGainCorrectionUpperbound = a3;
}

- (double)sanitycheckCurrentPhaseCompensationLowerbound
{
  return self->_sanitycheckCurrentPhaseCompensationLowerbound;
}

- (void)setSanitycheckCurrentPhaseCompensationLowerbound:(double)a3
{
  self->_sanitycheckCurrentPhaseCompensationLowerbound = a3;
}

- (double)sanitycheckCurrentPhaseCompensationUpperbound
{
  return self->_sanitycheckCurrentPhaseCompensationUpperbound;
}

- (void)setSanitycheckCurrentPhaseCompensationUpperbound:(double)a3
{
  self->_sanitycheckCurrentPhaseCompensationUpperbound = a3;
}

- (BOOL)isDigitalFilterTrigger
{
  return self->_isDigitalFilterTrigger;
}

- (void)setIsDigitalFilterTrigger:(BOOL)a3
{
  self->_isDigitalFilterTrigger = a3;
}

- (NSMutableData)tmp1DataBuff
{
  return self->_tmp1DataBuff;
}

- (void)setTmp1DataBuff:(id)a3
{
  self->_tmp1DataBuff = (NSMutableData *)a3;
}

- (int)tmp1DataBuffSize
{
  return self->_tmp1DataBuffSize;
}

- (void)setTmp1DataBuffSize:(int)a3
{
  self->_tmp1DataBuffSize = a3;
}

- (NSMutableData)tmp2DataBuff
{
  return self->_tmp2DataBuff;
}

- (void)setTmp2DataBuff:(id)a3
{
  self->_tmp2DataBuff = (NSMutableData *)a3;
}

- (int)tmp2DataBuffSize
{
  return self->_tmp2DataBuffSize;
}

- (void)setTmp2DataBuffSize:(int)a3
{
  self->_tmp2DataBuffSize = a3;
}

- (NSMutableData)tmp3DataBuff
{
  return self->_tmp3DataBuff;
}

- (void)setTmp3DataBuff:(id)a3
{
  self->_tmp3DataBuff = (NSMutableData *)a3;
}

- (int)tmp3DataBuffSize
{
  return self->_tmp3DataBuffSize;
}

- (void)setTmp3DataBuffSize:(int)a3
{
  self->_tmp3DataBuffSize = a3;
}

- (OpaqueFFTSetupD)fftContext
{
  return self->_fftContext;
}

- (void)setFftContext:(OpaqueFFTSetupD *)a3
{
  self->_fftContext = a3;
}

@end
