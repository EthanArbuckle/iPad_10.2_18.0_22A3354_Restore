@implementation LDCMMeasurementV4

- (double)ldcmVoltageAmp
{
  return self->ldcmVoltageAmp;
}

- (double)ldcmTIACurrentAmp
{
  return self->ldcmTIACurrentAmp;
}

- (double)ldcmLeakageCurrentAmp
{
  return self->ldcmLeakageCurrentAmp;
}

- (unsigned)ldcmIncompTimeoutCnt
{
  return self->ldcmIncompTimeoutCnt;
}

- (unsigned)ldcmIncompSNRAmpCnt
{
  return self->ldcmIncompSNRAmpCnt;
}

- (unsigned)ldcmIncompOVPCnt
{
  return self->ldcmIncompOVPCnt;
}

- (double)ldcmCalVoltageAmp
{
  return self->ldcmCalVoltageAmp;
}

- (double)ldcmCalTIAAmp
{
  return self->ldcmCalTIAAmp;
}

- (unsigned)ldcmWetStateDuration
{
  return self->ldcmWetStateDuration;
}

- (unsigned)ldcmLowImp
{
  return self->ldcmLowImp;
}

- (unsigned)ldcmWet
{
  return self->ldcmWet;
}

- (unsigned)ldcmWetStateTooLong
{
  return self->ldcmWetStateTooLong;
}

- (double)ldcmVoltageGainCorrection
{
  return self->ldcmVoltageGainCorrection;
}

- (double)ldcmTIAGainCorrection
{
  return self->ldcmTIAGainCorrection;
}

- (double)ldcmPhaseComp
{
  return self->ldcmPhaseComp;
}

- (unsigned)ldcmMitigationsStatus
{
  return self->ldcmMitigationsStatus;
}

- (double)ldcmMeasureVoltageSNR
{
  return self->ldcmMeasureVoltageSNR;
}

- (double)ldcmMeasureTIASNR
{
  return self->ldcmMeasureTIASNR;
}

- (unsigned)ldcmMeasurePin
{
  return self->ldcmMeasurePin;
}

- (double)ldcmLoadImpPhase
{
  return self->ldcmLoadImpPhase;
}

- (double)ldcmLoadImpMag
{
  return self->ldcmLoadImpMag;
}

- (unsigned)ldcmFeatureStatus
{
  return self->ldcmFeatureStatus;
}

- (double)ldcmCalculatedRes
{
  return self->ldcmCalculatedRes;
}

- (double)ldcmCalculatedCap
{
  return self->ldcmCalculatedCap;
}

- (double)ldcmCalVoltageSNR
{
  return self->ldcmCalVoltageSNR;
}

- (double)ldcmCalTIASNR
{
  return self->ldcmCalTIASNR;
}

- (unsigned)ldcmWetTooLongLDCMDisabled
{
  return self->_ldcmWetTooLongLDCMDisabled;
}

- (unsigned)ldcmRREFGated
{
  return self->ldcmRREFGated;
}

- (unsigned)ldcmCompletion
{
  return self->ldcmCompletion;
}

- (unsigned)ldcmPortStatus
{
  return self->ldcmPortStatus;
}

- (LDCMMeasurementV4)initWithParams:(void *)a3 :(unint64_t)a4
{
  LDCMMeasurementV4 *v5;

  if (a4 == 55)
  {
    -[LDCMMeasurementV4 parseData:](self, "parseData:", a3);
    v5 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[LDCMMeasurementV4 initWithParams::].cold.1();
    v5 = 0;
  }

  return v5;
}

- (void)parseData:(char *)a3
{
  unint64_t v3;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  LODWORD(v3) = *(_DWORD *)(a3 + 2);
  self->ldcmLoadImpMag = (double)v3;
  self->ldcmLoadImpPhase = (double)*(int *)(a3 + 6) * 0.000001;
  self->ldcmCalculatedRes = (double)*(int *)(a3 + 10);
  self->ldcmCalculatedCap = (double)*(int *)(a3 + 14) * 0.001;
  self->ldcmTIACurrentAmp = (double)(25 * *((unsigned __int16 *)a3 + 10));
  v6 = (double)(25 * *((unsigned __int16 *)a3 + 11));
  self->ldcmVoltageAmp = v6;
  LOWORD(v6) = *((_WORD *)a3 + 12);
  v7 = (double)*(unint64_t *)&v6;
  self->ldcmLeakageCurrentAmp = v7;
  LOWORD(v7) = *((_WORD *)a3 + 13);
  v8 = (double)*(unint64_t *)&v7 * 0.005;
  self->ldcmMeasureTIASNR = v8;
  LOWORD(v8) = *((_WORD *)a3 + 14);
  self->ldcmMeasureVoltageSNR = (double)*(unint64_t *)&v8 * 0.005;
  self->ldcmCalTIAAmp = (double)(25 * *((unsigned __int16 *)a3 + 15));
  v9 = (double)(25 * *((unsigned __int16 *)a3 + 16));
  self->ldcmCalVoltageAmp = v9;
  LOWORD(v9) = *((_WORD *)a3 + 17);
  v10 = (double)*(unint64_t *)&v9 * 0.005;
  self->ldcmCalTIASNR = v10;
  LOWORD(v10) = *((_WORD *)a3 + 18);
  v11 = (double)*(unint64_t *)&v10 * 0.005;
  self->ldcmCalVoltageSNR = v11;
  LODWORD(v11) = *(_DWORD *)(a3 + 38);
  v12 = (double)*(unint64_t *)&v11 * 0.0000000023283;
  self->ldcmTIAGainCorrection = v12;
  LODWORD(v12) = *(_DWORD *)(a3 + 42);
  self->ldcmVoltageGainCorrection = (double)*(unint64_t *)&v12 * 0.0000000023283;
  self->ldcmPhaseComp = (double)*(int *)(a3 + 46) * 0.00000025;
  self->ldcmRREFGated = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", *a3, 0, 1);
  self->ldcmPortStatus = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", *a3, 2, 1);
  self->ldcmMitigationsStatus = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", *a3, 3, 1);
  self->ldcmFeatureStatus = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", *a3, 4, 7);
  self->ldcmLowImp = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", a3[1], 0, 1);
  self->ldcmCompletion = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", a3[1], 1, 7);
  self->ldcmWet = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", a3[1], 4, 3);
  self->ldcmMeasurePin = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", a3[1], 6, 3);
  self->ldcmWetStateDuration = 60
                             * -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", *((unsigned __int16 *)a3 + 9), 0, 0x3FFFLL);
  self->ldcmWetStateTooLong = -[LDCMMeasurementV4 getBits:shift:mask:](self, "getBits:shift:mask:", *((unsigned __int16 *)a3 + 9), 14, 1);
  self->ldcmIncompSNRAmpCnt = a3[50];
  self->ldcmIncompOVPCnt = a3[51];
  self->ldcmIncompTimeoutCnt = a3[52];
  self->ldcmSuccessfulCnt = *(_WORD *)(a3 + 53);
}

- (unsigned)getBits:(unsigned int)a3 shift:(unsigned __int8)a4 mask:(unsigned int)a5
{
  return (a3 >> a4) & a5;
}

- (unsigned)ldcmSuccessfulCnt
{
  return self->ldcmSuccessfulCnt;
}

- (void)initWithParams::.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "LDCM - Data size mismatch!", v0, 2u);
}

@end
