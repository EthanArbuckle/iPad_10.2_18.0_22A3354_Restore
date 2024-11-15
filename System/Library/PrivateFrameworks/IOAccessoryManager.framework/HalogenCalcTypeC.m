@implementation HalogenCalcTypeC

- (HalogenCalcTypeC)initWithParams:(int)a3 signalFrequency:(double)a4 sampleRate:(unint64_t)a5 tiaGain:(double)a6 adcGain:(double)a7 parasiticCap:(double)a8
{
  HalogenCalcTypeC *v14;
  HalogenCalcTypeC *v15;
  FFTSetupD fftsetupD;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  NSObject *v21;
  const char *v22;
  objc_super v23;
  uint8_t buf[4];
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)HalogenCalcTypeC;
  v14 = -[HalogenCalcTypeC init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_nSamples = a3;
    if (a3)
    {
      v14->_sizeofSample = 8;
      v14->_signalFrequency = a4;
      if (a4 == 0.0)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          return v15;
        *(_DWORD *)buf = 134217984;
        v25 = a4;
        v18 = MEMORY[0x1E0C81028];
        v19 = "HalogenCalcTypeC:Invalid signalFrequency provided. (signalFrequency: %f)";
      }
      else
      {
        v14->_sampleRate = (double)a5;
        if (a5)
        {
          v14->_tiaGain = a6;
          v14->_adcGain = a7;
          v14->_parasiticCap = a8;
          if (-[HalogenCalcTypeC _allocBuffers](v14, "_allocBuffers"))
          {
            fftsetupD = vDSP_create_fftsetupD(0xCuLL, 0);
            v15->_fftContext = fftsetupD;
            if (fftsetupD)
            {
              v15->_seriesResistance = 4990.0;
              *(_OWORD *)&v15->_seriesRCResistance = xmmword_1D13E8590;
              return v15;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v21 = MEMORY[0x1E0C81028];
              v22 = "HalogenCalcTypeC:vDSP_create_fftsetupD() failed";
              goto LABEL_21;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v21 = MEMORY[0x1E0C81028];
            v22 = "HalogenCalcTypeC:_allocBuffers() failed";
LABEL_21:
            _os_log_impl(&dword_1D13BF000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
          }

          return 0;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          return v15;
        *(_DWORD *)buf = 134217984;
        v25 = 0.0;
        v18 = MEMORY[0x1E0C81028];
        v19 = "HalogenCalcTypeC:Invalid sampleRate provided. (sampleRate: %llu)";
      }
      v20 = 12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        return v15;
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      v18 = MEMORY[0x1E0C81028];
      v19 = "HalogenCalcTypeC:Invalid sample value provided. (samples: %d)";
      v20 = 8;
    }
    _os_log_impl(&dword_1D13BF000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
  }
  return v15;
}

- (void)dealloc
{
  OpaqueFFTSetupD *fftContext;
  objc_super v4;

  fftContext = self->_fftContext;
  if (fftContext)
    vDSP_destroy_fftsetupD(fftContext);
  -[HalogenCalcTypeC _freeBuffers](self, "_freeBuffers");
  v4.receiver = self;
  v4.super_class = (Class)HalogenCalcTypeC;
  -[HalogenCalcTypeC dealloc](&v4, sel_dealloc);
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
    v9 = "HalogenCalcTypeC:Failed to alloc _tmp1DataBuff";
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
    v9 = "HalogenCalcTypeC:Failed to alloc _tmp2DataBuff";
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
    v9 = "HalogenCalcTypeC:Failed to alloc _tmp3DataBuff";
    v10 = (uint8_t *)&v13;
    goto LABEL_12;
  }
  return result;
}

- (void)_freeBuffers
{

}

- (void)setWetTooLong:(BOOL)a3
{
  self->_wetTooLong = a3;
}

- (int)doCalibration:(id)a3 withCurrentData:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double calVoltageSNR;
  int result;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v18 = NAN;
  v19 = NAN;
  -[HalogenCalcTypeC _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:", a3, &v19, &v18, 1, 1.0);
  v16 = NAN;
  v17 = NAN;
  -[HalogenCalcTypeC _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:", a4, &v17, &v16, 1, 1.0);
  v7 = v19;
  v8 = v17;
  self->_calVoltageAmplitude = v19;
  self->_calCurrentAmplitude = v8;
  if (v7 < 0.07 || v8 < 0.07)
  {
    NSLog(CFSTR("Unexpected calibration current or voltage amplitude. calibrationCurrentAmplitude: %f, calibrationVoltageAmplitude: %f"), *(_QWORD *)&v8, *(_QWORD *)&v7);
    return 3;
  }
  else
  {
    -[HalogenCalcTypeC _snr:withGain:hasSignalLevel:hasNoiseLevel:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:", a3, &self->_calVoltageSignalLevel, &self->_calVoltageNoiseLevel, 1.0);
    self->_calVoltageSNR = v9;
    -[HalogenCalcTypeC _snr:withGain:hasSignalLevel:hasNoiseLevel:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:", a4, &self->_calCurrentSignalLevel, &self->_calCurrentNoiseLevel, 1.0);
    self->_calCurrentSNR = v10;
    calVoltageSNR = self->_calVoltageSNR;
    if (calVoltageSNR < 24.0 || v10 < 24.0)
    {
      NSLog(CFSTR("Unexpected calibration current or voltage SNR. calibrationCurrentSNR: %f, calibrationVoltageSNR: %f"), *(_QWORD *)&v10, *(_QWORD *)&calVoltageSNR);
      return 2;
    }
    else
    {
      result = 0;
      v14 = (v19 + v17) * 0.5;
      v15 = v14 / v17;
      self->_voltageGainCorrection = v14 / v19;
      self->_currentGainCorrection = v15;
      self->_currentPhaseCompensation = v18 - v16;
    }
  }
  return result;
}

- (int)doLiquidDetection:(id)a3 withCurrentData:(id)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8 pinParasitics:(double)a9 measurementType:(int)a10
{
  _BOOL4 v11;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double capacitanceInNanoF;
  double resistanceInOhms;
  int v24;
  double v25;
  double loadImpedanceInOhms;
  double v27;
  double v29;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;

  v11 = a6;
  self->_pinParasitics = a9;
  -[HalogenCalcTypeC _applyGain:toData:](self, "_applyGain:toData:", a4, self->_adcGain, a8);
  -[HalogenCalcTypeC _applyGain:toData:](self, "_applyGain:toData:", a3, self->_adcGain);
  *(double *)&v34 = NAN;
  v35 = NAN;
  v32 = -1;
  v33 = NAN;
  -[HalogenCalcTypeC _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:", a3, &v34, &v33, 1, 2.0);
  -[HalogenCalcTypeC _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:", a4, &v35, &v32, 1, 2.0);
  v15 = *(double *)&v34;
  v16 = v35;
  self->_measurementCurrentAmplitude = v35;
  self->_measurementVoltageAmplitude = v15;
  self->_measurementVoltagePhase = v33;
  if (v15 < 0.14 || v16 < 0.14)
  {
    NSLog(CFSTR("Unexpected measurement current or voltage amplitude. beforeTIACurrentAmplitude: %f, beforeTIAVoltageAmplitude: %f"), *(_QWORD *)&v16, *(_QWORD *)&v15);
    return 9;
  }
  -[HalogenCalcTypeC _applyFractionalPhaseShift:withPhaseDelay:](self, "_applyFractionalPhaseShift:withPhaseDelay:", a4, self->_currentPhaseCompensation / -360.0 / self->_signalFrequency * self->_sampleRate);
  -[HalogenCalcTypeC _applyGain:toData:](self, "_applyGain:toData:", a4, self->_currentGainCorrection);
  -[HalogenCalcTypeC _applyGain:toData:](self, "_applyGain:toData:", a3, self->_voltageGainCorrection);
  -[HalogenCalcTypeC _snr:withGain:hasSignalLevel:hasNoiseLevel:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:", a4, &self->_measurementCurrentSignalLevel, &self->_measurementCurrentNoiseLevel, 1.0);
  self->_measurementCurrentSNR = v17;
  -[HalogenCalcTypeC _applyTiaGain:toCurrentData:](self, "_applyTiaGain:toCurrentData:", a3, a4);
  -[HalogenCalcTypeC _snr:withGain:hasSignalLevel:hasNoiseLevel:](self, "_snr:withGain:hasSignalLevel:hasNoiseLevel:", a3, &self->_measurementVoltageSignalLevel, &self->_measurementVoltageNoiseLevel, 1.0);
  self->_measurementVoltageSNR = v18;
  if (v18 < 24.0 || self->_measurementCurrentSNR < 6.0)
  {
    NSLog(CFSTR("Unexpected measurement current or voltage SNR. measurementCurrentSNR: %f, measurementVoltageSNR: %f"), *(_QWORD *)&self->_measurementCurrentSNR, *(_QWORD *)&v18);
    return 8;
  }
  -[HalogenCalcTypeC _goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:](self, "_goertzelSecondOrder:hasFftValue:hasPhase:withHanning:amplitudeCorrectionFactor:", a4, &self->_measurementCurrentAmplitude, &self->_measurementCurrentPhase, 1, 2.0);
  v19 = self->_measurementVoltagePhase - self->_measurementCurrentPhase;
  self->_goertzelImpedance = self->_measurementVoltageAmplitude / self->_measurementCurrentAmplitude;
  self->_goertzelPhase = v19;
  -[HalogenCalcTypeC _rcSolver](self, "_rcSolver");
  capacitanceInNanoF = self->_capacitanceInNanoF;
  if (capacitanceInNanoF <= -2.0)
  {
    NSLog(CFSTR("Negative measurement capacitance recorded. capacitanceInNanoF:%.12f"), *(_QWORD *)&self->_capacitanceInNanoF);
    return 10;
  }
  if (a10)
  {
    if (a10 != 1)
    {
      if (a10 == 2)
      {
        resistanceInOhms = self->_resistanceInOhms;
        if (resistanceInOhms <= 6039.0 && resistanceInOhms >= 4941.0 && capacitanceInNanoF <= 10.0)
          return 17;
        else
          return 18;
      }
      return 0;
    }
    v27 = self->_resistanceInOhms;
    if (v27 > 29880.0 || v27 < 0.0)
      return 16;
    else
      return 15;
  }
  else
  {
    v25 = self->_resistanceInOhms;
    if (v11)
    {
      if (v25 <= 0.0)
        return 11;
      loadImpedanceInOhms = self->_loadImpedanceInOhms;
      if (loadImpedanceInOhms <= 600.0)
      {
        return 11;
      }
      else if (self->_wetTooLong)
      {
        if (capacitanceInNanoF >= 1.0)
        {
          if (loadImpedanceInOhms >= 10000.0)
          {
            return 2;
          }
          else if (-[HalogenCalcTypeC _isResistiveOnly:resistanceInOhms:loadPhase:](self, "_isResistiveOnly:resistanceInOhms:loadPhase:"))
          {
            return 1;
          }
          else
          {
            return 2;
          }
        }
        else
        {
          return 1;
        }
      }
      else if (loadImpedanceInOhms > 400000.0 && capacitanceInNanoF < 1.0)
      {
        return 1;
      }
      else
      {
        return 2;
      }
    }
    else
    {
      if (v25 <= 0.0)
        return 0;
      v24 = 0;
      v29 = self->_loadImpedanceInOhms;
      if (v29 > 600.0 && capacitanceInNanoF > 3.5 && v29 < 400000.0)
      {
        v24 = 2;
        if (v29 < 10000.0)
        {
          if (-[HalogenCalcTypeC _isResistiveOnly:resistanceInOhms:loadPhase:](self, "_isResistiveOnly:resistanceInOhms:loadPhase:"))
          {
            return 0;
          }
          else
          {
            return 2;
          }
        }
      }
    }
  }
  return v24;
}

- (BOOL)_isResistiveOnly:(double)a3 resistanceInOhms:(double)a4 loadPhase:(double)a5
{
  return self->_resistanceInOhms == 0.0 || fabs((a3 - a4) / a4 * 100.0) < 1.0 && pow(a4, -0.696) * -605.1 + -0.48 < a5;
}

- (void)_goertzelSecondOrder:(id)a3 hasFftValue:(double *)a4 hasPhase:(double *)a5 withHanning:(BOOL)a6 amplitudeCorrectionFactor:(double)a7
{
  _BOOL4 v8;
  uint64_t v13;
  unint64_t v14;
  unint64_t sizeofSample;
  unint64_t v16;
  __double2 v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v8 = a6;
  v13 = objc_msgSend(a3, "bytes");
  v14 = objc_msgSend(a3, "length");
  sizeofSample = self->_sizeofSample;
  v16 = v14 / sizeofSample;
  v17 = __sincos_stret(self->_signalFrequency / self->_sampleRate * 6.28318531);
  v18 = 0.0;
  v19 = 0.0;
  if (v14 >= sizeofSample)
  {
    v20 = 0;
    v21 = v17.__cosval + v17.__cosval;
    if (v16 <= 1)
      v22 = 1;
    else
      v22 = v16;
    v23 = 0.0;
    v24 = 0.0;
    do
    {
      if (v8)
        v25 = v21 * v24
            + (1.0 - cos((double)(int)v20 * 6.28318531 / (double)v16)) * 0.5 * *(double *)(v13 + 8 * v20) * a7;
      else
        v25 = *(double *)(v13 + 8 * v20) + v21 * v24;
      ++v20;
      v18 = v25 - v23;
      v19 = v24;
      v23 = v24;
      v24 = v18;
    }
    while (v22 != v20);
  }
  v26 = v18 - v19 * v17.__cosval;
  v27 = v17.__sinval * v19;
  if (a4)
  {
    v28 = sqrt(v27 * v27 + v26 * v26);
    *a4 = (v28 + v28) / (double)v16;
  }
  if (a5)
    *a5 = atan2(v27, v26) * 180.0 / 3.14159265;
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
  double v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  unint64_t nSamples;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v30 = -1;
  v7 = (uint64_t *)objc_msgSend(a3, "bytes");
  v8 = -a4;
  objc_msgSend(a3, "appendBytes:length:", &v7[objc_msgSend(a3, "length") / (unint64_t)self->_sizeofSample - 1]);
  if (a4 >= 1.0)
  {
    v9 = vcvtpd_s64_f64(v8);
    v8 = (double)-v9 - a4;
    v30 = *v7;
    if ((v9 & 0x80000000) != 0)
    {
      if ((signed int)-v9 <= 1)
        v10 = 1;
      else
        v10 = -v9;
      do
      {
        objc_msgSend(a3, "replaceBytesInRange:withBytes:length:", 0, 0, &v30, self->_sizeofSample);
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
      v21 = v15 - 1;
      if (v15 != 1)
      {
        v23 = *v12;
        v22 = v12 + 1;
        v24 = v23;
        do
        {
          v25 = *v22;
          *(v22 - 1) = (1.0 - v8) * v24 + *v22 * v8;
          ++v22;
          v24 = v25;
          --v21;
        }
        while (v21);
      }
    }
  }
  else if (v15 >= 2)
  {
    v17 = *v12;
    v16 = v12 + 1;
    v18 = v17;
    v19 = v15 - 1;
    do
    {
      v20 = *v16;
      *v16 = *v16 * (v8 + 1.0) - v18 * v8;
      ++v16;
      v18 = v20;
      --v19;
    }
    while (v19);
  }
  nSamples = self->_nSamples;
  if (nSamples <= v15)
  {
    if (nSamples < v15)
      objc_msgSend(a3, "setLength:", (int)nSamples * (int)sizeofSample);
  }
  else
  {
    objc_msgSend(a3, "increaseLengthBy:", (nSamples - v15) * sizeofSample);
    v27 = objc_msgSend(a3, "bytes");
    v28 = v15 - 1;
    v30 = *(_QWORD *)(v27 + 8 * (v15 - 1));
    v29 = self->_nSamples;
    if (v15 < v29)
    {
      do
        *(_QWORD *)(v27 + 8 * v15++) = *(_QWORD *)(v27 + 8 * v28);
      while (v15 != v29);
    }
  }
}

- (double)_snr:(id)a3 withGain:(double)a4 hasSignalLevel:(double *)a5 hasNoiseLevel:(double *)a6
{
  const void *v10;
  NSMutableData *tmp1DataBuff;
  double *v12;
  double *v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t j;
  DSPDoubleSplitComplex v22;

  v10 = (const void *)objc_msgSend(a3, "bytes");
  tmp1DataBuff = self->_tmp1DataBuff;
  v12 = (double *)-[NSMutableData bytes](tmp1DataBuff, "bytes");
  v13 = (double *)-[NSMutableData bytes](self->_tmp2DataBuff, "bytes");
  v14 = -[NSMutableData bytes](self->_tmp3DataBuff, "bytes");
  v22.realp = v12;
  v22.imagp = v13;
  memcpy(v12, v10, (uint64_t)self->_sizeofSample << 11);
  bzero(v13, (uint64_t)self->_sizeofSample << 11);
  -[HalogenCalcTypeC _applyGain:toData:](self, "_applyGain:toData:", tmp1DataBuff, a4, v12, v13);
  -[HalogenCalcTypeC _applyHanningWindow:withSize:](self, "_applyHanningWindow:withSize:", tmp1DataBuff, 2048);
  vDSP_fft_zripD(self->_fftContext, &v22, 1, 0xCuLL, 1);
  for (i = 0; i != 1024; ++i)
  {
    v12[i] = v12[i] * 0.000244140625;
    v16 = v13[i] * 0.000244140625;
    v13[i] = v16;
    *(double *)(v14 + i * 8) = v16 * v16 + v12[i] * v12[i];
  }
  v17 = 0;
  v18 = 0.0;
  do
  {
    v18 = v18 + *(double *)(v14 + 32 + v17);
    v17 += 8;
  }
  while (v17 != 24);
  v19 = 2.22507386e-308;
  for (j = 56; j != 0x2000; j += 8)
    v19 = v19 + *(double *)(v14 + j);
  if (a5)
    *a5 = v18;
  if (a6)
    *a6 = v19;
  return log10(v18 / v19) * 10.0;
}

- (void)_doMuxComp:(double)a3 withPhase:(double)a4
{
  __double2 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __complex_double v13;

  v6 = __sincos_stret(a4 * 3.14159265 / 180.0);
  v7 = __divdc3(1.0, 0.0, v6.__cosval * a3 + v6.__sinval * a3 * 0.0, v6.__sinval * a3);
  v8 = self->_parasiticCap + self->_pinParasitics;
  v10 = __divdc3(1.0, 0.0, v7 - self->_signalFrequency * 0.0 * v8, v9 + self->_signalFrequency * -6.28318531 * v8);
  v12 = v11;
  self->_compensatedImpedance = MEMORY[0x1D17E7990]();
  v13.c[0] = v10;
  v13.c[1] = v12;
  self->_compensatedPhase = carg(v13) / 3.14159265 * 180.0;
}

- (void)_rcSolver
{
  double goertzelImpedance;
  __double2 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double seriesRCResistance;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double compensatedImpedance;
  double compensatedPhase;
  __double2 v20;
  double v21;
  double v22;
  double v23;
  __complex_double v24;

  goertzelImpedance = self->_goertzelImpedance;
  v4 = __sincos_stret(self->_goertzelPhase * 3.14159265 / 180.0);
  v5 = goertzelImpedance * v4.__cosval;
  v6 = goertzelImpedance * v4.__sinval;
  v7 = __divdc3(self->_seriesRCResistance, 0.0, self->_signalFrequency * 0.0 * self->_LDCMACCapacitance, self->_signalFrequency * 6.28318531 * self->_LDCMACCapacitance);
  v9 = v8;
  seriesRCResistance = self->_seriesRCResistance;
  v11 = __divdc3(1.0, 0.0, self->_signalFrequency * 0.0 * self->_LDCMACCapacitance, self->_signalFrequency * 6.28318531 * self->_LDCMACCapacitance);
  v13 = self->_seriesResistance + __divdc3(v7, v9, seriesRCResistance + v11, v12);
  *(double *)self->_seriesTotalImpedance = v13;
  *(double *)&self->_seriesTotalImpedance[8] = v14;
  v15 = v5 + v6 * 0.0 - v13;
  v16 = v6 - v14;
  v17 = MEMORY[0x1D17E7990](v15, v6 - v14);
  v24.c[0] = v15;
  v24.c[1] = v16;
  -[HalogenCalcTypeC _doMuxComp:withPhase:](self, "_doMuxComp:withPhase:", v17, carg(v24) * 180.0 / 3.14159265);
  compensatedImpedance = self->_compensatedImpedance;
  compensatedPhase = self->_compensatedPhase;
  v20 = __sincos_stret(compensatedPhase * 3.14159265 / 180.0);
  v21 = compensatedImpedance * v20.__cosval;
  self->_loadImpedanceInOhms = compensatedImpedance;
  self->_loadPhase = compensatedPhase;
  v22 = v21 + compensatedImpedance * v20.__sinval * (compensatedImpedance * v20.__sinval) / v21;
  v23 = compensatedImpedance * v20.__sinval / (self->_signalFrequency * ((v21 * v22 + v21 * v22) * 3.14159265));
  self->_resistanceInOhms = v22;
  self->_capacitanceInNanoF = v23 * -1000000000.0;
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

- (double)calCurrentSignalLevel
{
  return self->_calCurrentSignalLevel;
}

- (double)calCurrentNoiseLevel
{
  return self->_calCurrentNoiseLevel;
}

- (double)calVoltageSNR
{
  return self->_calVoltageSNR;
}

- (double)calCurrentSNR
{
  return self->_calCurrentSNR;
}

- (double)calVoltageAmplitude
{
  return self->_calVoltageAmplitude;
}

- (double)calCurrentAmplitude
{
  return self->_calCurrentAmplitude;
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

- (double)measurementVoltageAmplitude
{
  return self->_measurementVoltageAmplitude;
}

- (double)measurementCurrentAmplitude
{
  return self->_measurementCurrentAmplitude;
}

- (double)measurementVoltagePhase
{
  return self->_measurementVoltagePhase;
}

- (double)measurementCurrentPhase
{
  return self->_measurementCurrentPhase;
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

- (double)loadImpedanceInOhms
{
  return self->_loadImpedanceInOhms;
}

- (double)loadPhase
{
  return self->_loadPhase;
}

- (double)resistanceInOhms
{
  return self->_resistanceInOhms;
}

- (double)capacitanceInNanoF
{
  return self->_capacitanceInNanoF;
}

- (BOOL)wetTooLong
{
  return self->_wetTooLong;
}

- (int)nSamples
{
  return self->_nSamples;
}

- (void)setNSamples:(int)a3
{
  self->_nSamples = a3;
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

- (double)tiaGain
{
  return self->_tiaGain;
}

- (void)setTiaGain:(double)a3
{
  self->_tiaGain = a3;
}

- (double)adcGain
{
  return self->_adcGain;
}

- (void)setAdcGain:(double)a3
{
  self->_adcGain = a3;
}

- (double)parasiticCap
{
  return self->_parasiticCap;
}

- (void)setParasiticCap:(double)a3
{
  self->_parasiticCap = a3;
}

- (double)pinParasitics
{
  return self->_pinParasitics;
}

- (void)setPinParasitics:(double)a3
{
  self->_pinParasitics = a3;
}

- (double)seriesResistance
{
  return self->_seriesResistance;
}

- (void)setSeriesResistance:(double)a3
{
  self->_seriesResistance = a3;
}

- (double)seriesRCResistance
{
  return self->_seriesRCResistance;
}

- (void)setSeriesRCResistance:(double)a3
{
  self->_seriesRCResistance = a3;
}

- (double)LDCMACCapacitance
{
  return self->_LDCMACCapacitance;
}

- (void)setLDCMACCapacitance:(double)a3
{
  self->_LDCMACCapacitance = a3;
}

- (double)seriesTotalImpedance
{
  double v2;

  objc_copyStruct(&v2, (const void *)(a1 + 368), 16, 1, 0);
  return v2;
}

- (void)setSeriesTotalImpedance:(HalogenCalcTypeC *)self
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v2;
  v5 = v3;
  objc_copyStruct(self->_seriesTotalImpedance, &v4, 16, 1, 0);
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
