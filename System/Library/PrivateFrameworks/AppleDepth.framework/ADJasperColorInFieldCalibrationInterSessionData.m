@implementation ADJasperColorInFieldCalibrationInterSessionData

- (void)initIsfWithFlowType:(int)a3
{
  ADInterSessionFilter *isf;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  ADInterSessionFilter *v19;
  ADInterSessionFilter *v20;
  uint8_t v21[16];

  -[ADInterSessionFilterParameters setIsStepDetectionActive:](self->super._isfParameters, "setIsStepDetectionActive:", 1);
  -[ADInterSessionFilterParameters setMinStepIndex:](self->super._isfParameters, "setMinStepIndex:", 2);
  isf = self->super._isf;
  self->super._isf = 0;

  if (a3 == 1)
  {
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", 50);
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", 50);
    v15 = 1017370378;
    LODWORD(v16) = 1017370378;
    -[ADInterSessionFilterParameters setMinimalWeight:](self->super._isfParameters, "setMinimalWeight:", v16);
    LODWORD(v17) = 0.25;
    -[ADInterSessionFilterParameters setMaximalWeight:](self->super._isfParameters, "setMaximalWeight:", v17);
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", 11);
    v12 = &unk_24C4351E8;
    v13 = 10;
    v14 = 1084093366;
    goto LABEL_5;
  }
  if (!a3)
  {
    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyJasperColorIsfCapacity);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", objc_msgSend(v6, "unsignedIntValue"));

    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyJasperColorIsfCapacity);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", objc_msgSend(v7, "unsignedIntValue"));

    LODWORD(v8) = 1031798784;
    -[ADInterSessionFilterParameters setMinimalWeight:](self->super._isfParameters, "setMinimalWeight:", v8);
    LODWORD(v9) = 1058642330;
    -[ADInterSessionFilterParameters setMaximalWeight:](self->super._isfParameters, "setMaximalWeight:", v9);
    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyJasperColorIsfOutliers);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", objc_msgSend(v10, "unsignedIntValue"));

    v12 = &unk_24C4351D0;
    v13 = 15;
    v14 = 1092846921;
    v15 = 1031798784;
LABEL_5:
    LODWORD(v11) = v15;
    -[ADInterSessionFilterParameters setOutlierWeight:](self->super._isfParameters, "setOutlierWeight:", v11);
    -[ADInterSessionFilterParameters setMinStepSize:](self->super._isfParameters, "setMinStepSize:", v13);
    LODWORD(v18) = v14;
    -[ADInterSessionFilterParameters setStepDetectionThreshold:](self->super._isfParameters, "setStepDetectionThreshold:", v18);
    v19 = (ADInterSessionFilter *)objc_msgSend(objc_alloc(MEMORY[0x24BE05FD0]), "initWithFieldNames:parameters:", v12, self->super._isfParameters);
    v20 = self->super._isf;
    self->super._isf = v19;

    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "initIsf unknown flow type", v21, 2u);
  }
}

- (void)initIsf
{
  -[ADJasperColorInFieldCalibrationInterSessionData initIsfWithFlowType:](self, "initIsfWithFlowType:", 0);
}

- (void)initDiagnosticPipelineLogWithFlowType:(int)a3
{
  vector<ADJasperColorInFieldCalibrationDiagnosticPipelineEntry, std::allocator<ADJasperColorInFieldCalibrationDiagnosticPipelineEntry>> *p_diagnosticPipelineLog;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *end;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  int64_t v7;
  unint64_t v8;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *value;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *v15;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *v16;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *v25;

  if (!a3 && +[ADDeviceConfiguration isInternalBuild](ADDeviceConfiguration, "isInternalBuild"))
  {
    p_diagnosticPipelineLog = &self->_diagnosticPipelineLog;
    begin = self->_diagnosticPipelineLog.__begin_;
    end = self->_diagnosticPipelineLog.__end_;
    v7 = (char *)end - (char *)begin;
    v8 = 0x2FC962FC962FC963 * (((char *)end - (char *)begin) >> 1);
    if (v8 >> 3 > 0x270)
    {
      if (v7 == 750000)
      {
LABEL_20:
        self->_diagnosticPipelineLogIndex = 0;
        return;
      }
      v25 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)begin + 750000);
    }
    else
    {
      value = self->_diagnosticPipelineLog.__end_cap_.__value_;
      if (0x2FC962FC962FC963 * (((char *)value - (char *)end) >> 1) < 5000 - v8)
      {
        v10 = 0x2FC962FC962FC963 * (((char *)value - (char *)begin) >> 1);
        v11 = 0x5F92C5F92C5F92C6 * (((char *)value - (char *)begin) >> 1);
        if (v11 <= 0x1388)
          v11 = 5000;
        if (v10 >= 0xDA740DA740DA74)
          v12 = 0x1B4E81B4E81B4E8;
        else
          v12 = v11;
        if (v12 > 0x1B4E81B4E81B4E8)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v13 = 150 * v12;
        v14 = (char *)operator new(150 * v12);
        v15 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[2 * (((char *)end - (char *)begin) >> 1)];
        v16 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[v13];
        bzero(v15, 150 * ((749850 - v7) / 0x96uLL) + 150);
        v17 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)(&v15->var12 + 150 * ((749850 - v7) / 0x96uLL));
        if (end != begin)
        {
          do
          {
            v18 = *(_OWORD *)((char *)&end[-1].var0 + 2);
            *(_OWORD *)((char *)&v15[-1].var6 + 2) = *(_OWORD *)((char *)&end[-1].var6 + 2);
            *(_OWORD *)((char *)&v15[-1].var0 + 2) = v18;
            v19 = *(_OWORD *)((char *)&end[-1].var8[0][2] + 2);
            v20 = *(_OWORD *)((char *)&end[-1].var8[2][0] + 2);
            v21 = *(_OWORD *)((char *)&end[-1].var8[3][1] + 2);
            *(_OWORD *)((char *)&v15[-1].var8[4][2] + 2) = *(_OWORD *)((char *)&end[-1].var8[4][2] + 2);
            *(_OWORD *)((char *)&v15[-1].var8[3][1] + 2) = v21;
            *(_OWORD *)((char *)&v15[-1].var8[2][0] + 2) = v20;
            *(_OWORD *)((char *)&v15[-1].var8[0][2] + 2) = v19;
            v22 = *(_OWORD *)((char *)&end[-1].var9[1][0] + 2);
            v23 = *(_OWORD *)((char *)&end[-1].var9[2][1] + 2);
            v24 = *(_OWORD *)((char *)&end[-1].var9[3][2] + 2);
            *(_QWORD *)v15[-1].var10 = *(_QWORD *)end[-1].var10;
            *(_OWORD *)((char *)&v15[-1].var9[3][2] + 2) = v24;
            *(_OWORD *)((char *)&v15[-1].var9[2][1] + 2) = v23;
            *(_OWORD *)((char *)&v15[-1].var9[1][0] + 2) = v22;
            v15 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)v15 - 150);
            end = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)end - 150);
          }
          while (end != begin);
          end = p_diagnosticPipelineLog->__begin_;
        }
        p_diagnosticPipelineLog->__begin_ = v15;
        self->_diagnosticPipelineLog.__end_ = v17;
        self->_diagnosticPipelineLog.__end_cap_.__value_ = v16;
        if (end)
          operator delete(end);
        goto LABEL_20;
      }
      bzero(self->_diagnosticPipelineLog.__end_, 150 * ((749850 - v7) / 0x96uLL) + 150);
      v25 = (ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)(&end->var12 + 150 * ((749850 - v7) / 0x96uLL));
    }
    self->_diagnosticPipelineLog.__end_ = v25;
    goto LABEL_20;
  }
}

- (uint64_t)initWithFactoryJasperToColorTransform:(void *)a1 currentJasperToColorTransform:(const char *)a2
{
  return objc_msgSend(a1, "initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andDeviceName:", CFSTR("N301"));
}

- (uint64_t)initWithFactoryJasperToColorTransform:(double)a3 currentJasperToColorTransform:(double)a4 andDeviceName:(double)a5
{
  id v12;
  uint64_t v13;

  v12 = a11;
  v13 = objc_msgSend(a1, "initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andFlowType:", objc_msgSend(v12, "hasPrefix:", CFSTR("N301")) ^ 1, a2, a3, a4, a5, a6, a7, a8, a9);

  return v13;
}

- (unsigned)isfCapacity
{
  return -[ADInterSessionFilterParameters capacity](self->super._isfParameters, "capacity");
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithFactoryJasperToColorTransform:(__n128)a3 currentJasperToColorTransform:(__n128)a4 andFlowType:(double)a5
{
  ADJasperColorInFieldCalibrationInterSessionData *v11;
  ADJasperColorInFieldCalibrationInterSessionData *v12;
  ADJasperColorInFieldCalibrationTelemetryData *v13;
  ADJasperColorInFieldCalibrationTelemetryData *inFieldCalibrationTelemetryData;
  __int128 v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  ADInterSessionFilter *isf;
  void *v20;
  uint64_t v21;
  ADJasperColorInFieldCalibrationInterSessionData *v22;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  objc_super v36;

  v36.receiver = a1;
  v36.super_class = (Class)ADJasperColorInFieldCalibrationInterSessionData;
  v11 = -[ADInFieldCalibrationInterSessionData init](&v36, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_5;
  -[ADInFieldCalibrationInterSessionData setVersion:](v11, "setVersion:", 7);
  -[ADJasperColorInFieldCalibrationInterSessionData initIsfWithFlowType:](v12, "initIsfWithFlowType:", a10);
  if (!v12->super._isf)
    goto LABEL_4;
  -[ADJasperColorInFieldCalibrationInterSessionData initDiagnosticPipelineLogWithFlowType:](v12, "initDiagnosticPipelineLogWithFlowType:", a10);
  v13 = objc_alloc_init(ADJasperColorInFieldCalibrationTelemetryData);
  inFieldCalibrationTelemetryData = v12->_inFieldCalibrationTelemetryData;
  v12->_inFieldCalibrationTelemetryData = v13;

  v33 = 0u;
  v34 = 0u;
  v33.i32[2] = a2.n128_i32[2];
  v35 = 0u;
  v34.i32[2] = a3.n128_i32[2];
  v33.i64[0] = a2.n128_u64[0];
  v34.i64[0] = a3.n128_u64[0];
  v35.i32[2] = a4.n128_i32[2];
  v35.i64[0] = a4.n128_u64[0];
  +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v33);
  *(_OWORD *)v12->_jasperToColorRotationAngles = v15;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a6, v33.f32[0]), a7, v34.f32[0]), a8, v35.f32[0]);
  v17 = vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(a6, *(float32x2_t *)v33.f32, 1), a7, *(float32x2_t *)v34.f32, 1), a8, *(float32x2_t *)v35.f32, 1);
  v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(a6, v33, 2), a7, v34, 2), a8, v35, 2);
  DWORD2(v30) = v16.i32[2];
  DWORD2(v31) = v17.i32[2];
  *(_QWORD *)&v30 = v16.i64[0];
  *(_QWORD *)&v31 = v17.i64[0];
  DWORD2(v32) = v18.i32[2];
  *(_QWORD *)&v32 = v18.i64[0];
  +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v30);
  isf = v12->super._isf;
  -[ADJasperColorInFieldCalibrationInterSessionData convertExtrinsicsAnglesToDict:](v12, "convertExtrinsicsAnglesToDict:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ADInterSessionFilter fillWithEntry:](isf, "fillWithEntry:", v20);

  if (v21)
LABEL_4:
    v22 = 0;
  else
LABEL_5:
    v22 = v12;

  return v22;
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3
{
  return -[ADJasperColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andDeviceName:](self, "initWithDictionaryRepresentation:andDeviceName:", a3, CFSTR("N301"));
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andDeviceName:(id)a4
{
  id v6;
  id v7;
  ADJasperColorInFieldCalibrationInterSessionData *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[ADJasperColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andFlowType:](self, "initWithDictionaryRepresentation:andFlowType:", v6, objc_msgSend(v7, "hasPrefix:", CFSTR("N301")) ^ 1);

  return v8;
}

- (ADJasperColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andFlowType:(int)a4
{
  uint64_t v4;
  id v6;
  ADJasperColorInFieldCalibrationInterSessionData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  ADInterSessionFilter *isf;
  void *v21;
  uint64_t v22;
  ADJasperColorInFieldCalibrationTelemetryData *v23;
  ADJasperColorInFieldCalibrationTelemetryData *inFieldCalibrationTelemetryData;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  uint64_t v31;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  id v33;
  ADJasperColorInFieldCalibrationInterSessionData *v34;
  objc_super v36;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ADJasperColorInFieldCalibrationInterSessionData;
  v7 = -[ADInFieldCalibrationInterSessionData init](&v36, sel_init);
  if (!v7)
    goto LABEL_21;
  objc_msgSend(v6, "objectForKey:", CFSTR("interSessionDataVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADInFieldCalibrationInterSessionData setVersion:](v7, "setVersion:", objc_msgSend(v8, "unsignedIntValue"));

  if (-[ADInFieldCalibrationInterSessionData version](v7, "version") < 5
    || -[ADInFieldCalibrationInterSessionData version](v7, "version") > 7
    || (-[ADJasperColorInFieldCalibrationInterSessionData initIsfWithFlowType:](v7, "initIsfWithFlowType:", v4),
        !v7->super._isf))
  {
LABEL_23:
    v34 = 0;
    goto LABEL_24;
  }
  -[ADJasperColorInFieldCalibrationInterSessionData initDiagnosticPipelineLogWithFlowType:](v7, "initDiagnosticPipelineLogWithFlowType:", v4);
  objc_msgSend(v6, "objectForKey:", CFSTR("telemetryKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("isfHistoryKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("depthToMcamFactoryExtrinsics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("featursHistoryDataKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("featuresHistoryCountKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedLongLongValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("successfulResultCountKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("diagnosticPipelineLog"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_intersessionFeaturesHistoryCount = v14;
  if (v12)
  {
    v18 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  objc_storeStrong((id *)&v7->_intersessionFeaturesHistory, v18);

  v7->_successfulResultCount = v16;
  isf = v7->super._isf;
  if (!v10)
  {
    -[ADJasperColorInFieldCalibrationInterSessionData convertExtrinsicsAnglesToDict:](v7, "convertExtrinsicsAnglesToDict:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ADInterSessionFilter fillWithEntry:](isf, "fillWithEntry:", v21);

    if (!v22)
      goto LABEL_12;
LABEL_22:

    goto LABEL_23;
  }
  if (-[ADInterSessionFilter fillWithDictionaryRepresentation:](v7->super._isf, "fillWithDictionaryRepresentation:", v10))
  {
    goto LABEL_22;
  }
LABEL_12:
  if (v9)
    v23 = -[ADJasperColorInFieldCalibrationTelemetryData initWithDictionaryRepresentation:]([ADJasperColorInFieldCalibrationTelemetryData alloc], "initWithDictionaryRepresentation:", v9);
  else
    v23 = objc_alloc_init(ADJasperColorInFieldCalibrationTelemetryData);
  inFieldCalibrationTelemetryData = v7->_inFieldCalibrationTelemetryData;
  v7->_inFieldCalibrationTelemetryData = v23;

  if (!v7->_inFieldCalibrationTelemetryData || !v11)
    goto LABEL_22;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rotX"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  *(_DWORD *)v7->_jasperToColorRotationAngles = v26;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rotY"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  *(_DWORD *)&v7->_jasperToColorRotationAngles[4] = v28;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rotZ"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  *(_DWORD *)&v7->_jasperToColorRotationAngles[8] = v30;

  if (v17)
  {
    v31 = objc_msgSend(v17, "length");
    begin = v7->_diagnosticPipelineLog.__begin_;
    if (v31 == (char *)v7->_diagnosticPipelineLog.__end_ - (char *)begin)
    {
      v33 = objc_retainAutorelease(v17);
      memcpy(begin, (const void *)objc_msgSend(v33, "bytes"), objc_msgSend(v33, "length"));
      goto LABEL_20;
    }
    goto LABEL_22;
  }
LABEL_20:
  -[ADInFieldCalibrationInterSessionData setVersion:](v7, "setVersion:", 7);

LABEL_21:
  v34 = v7;
LABEL_24:

  return v34;
}

- (id)persistenceData
{
  double v2;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSData *intersessionFeaturesHistory;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[3];
  _QWORD v28[5];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v27[0] = CFSTR("rotX");
  LODWORD(v2) = *(_DWORD *)self->_jasperToColorRotationAngles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v4;
  v27[1] = CFSTR("rotY");
  LODWORD(v5) = *(_DWORD *)&self->_jasperToColorRotationAngles[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  v27[2] = CFSTR("rotZ");
  LODWORD(v7) = *(_DWORD *)&self->_jasperToColorRotationAngles[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCED8];
  v25[0] = CFSTR("isfHistoryKey");
  -[ADInterSessionFilter persistenceData](self->super._isf, "persistenceData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  v25[1] = CFSTR("telemetryKey");
  -[ADJasperColorInFieldCalibrationInterSessionData inFieldCalibrationTelemetryData](self, "inFieldCalibrationTelemetryData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistenceData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  v26[2] = v24;
  v25[2] = CFSTR("depthToMcamFactoryExtrinsics");
  v25[3] = CFSTR("interSessionDataVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[ADInFieldCalibrationInterSessionData version](self, "version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  v25[4] = CFSTR("featuresHistoryCountKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_intersessionFeaturesHistoryCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v13;
  v25[5] = CFSTR("featursHistoryDataKey");
  intersessionFeaturesHistory = self->_intersessionFeaturesHistory;
  v15 = intersessionFeaturesHistory;
  if (!intersessionFeaturesHistory)
    v15 = (void *)objc_opt_new();
  v26[5] = v15;
  v25[6] = CFSTR("successfulResultCountKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_successfulResultCount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!intersessionFeaturesHistory)
  begin = self->_diagnosticPipelineLog.__begin_;
  v20 = (char *)self->_diagnosticPipelineLog.__end_ - (char *)begin;
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", (char *)begin + 150 * self->_diagnosticPipelineLogIndex, 150 * (0x2FC962FC962FC963 * (v20 >> 1) - self->_diagnosticPipelineLogIndex));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendBytes:length:", self->_diagnosticPipelineLog.__begin_, 150 * self->_diagnosticPipelineLogIndex);
    objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("diagnosticPipelineLog"));

  }
  return v18;
}

- (id)convertExtrinsicsAnglesToDict:(ADJasperColorInFieldCalibrationInterSessionData *)self
{
  __int128 v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("rotX");
  v9 = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("rotY");
  HIDWORD(v4) = DWORD1(v9);
  LODWORD(v4) = DWORD1(v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("rotZ");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v9), DWORD2(v9))));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (__n128)convertDictToExtrinsicsAngles:(void *)a3
{
  id v3;
  void *v4;
  unsigned __int32 v5;
  void *v6;
  unsigned __int32 v7;
  void *v8;
  unsigned __int32 v9;
  __n128 result;
  unsigned __int32 v11;
  unsigned __int32 v12;
  unsigned __int32 v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rotX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v13 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rotY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v12 = v7;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rotZ"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v11 = v9;

  result.n128_u32[0] = v13;
  result.n128_u32[1] = v12;
  result.n128_u32[2] = v11;
  return result;
}

- (BOOL)insertEntryToDiagnosticPipelineLog:(ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *)a3
{
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *end;
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  begin = self->_diagnosticPipelineLog.__begin_;
  end = self->_diagnosticPipelineLog.__end_;
  if (end != begin)
  {
    v5 = (char *)begin + 150 * self->_diagnosticPipelineLogIndex;
    v6 = *(_OWORD *)&a3->var6;
    *(_OWORD *)v5 = *(_OWORD *)&a3->var0;
    *((_OWORD *)v5 + 1) = v6;
    v7 = *(_OWORD *)&a3->var8[4][2];
    v9 = *(_OWORD *)&a3->var8[0][2];
    v8 = *(_OWORD *)&a3->var8[2][0];
    *((_OWORD *)v5 + 4) = *(_OWORD *)&a3->var8[3][1];
    *((_OWORD *)v5 + 5) = v7;
    *((_OWORD *)v5 + 2) = v9;
    *((_OWORD *)v5 + 3) = v8;
    v11 = *(_OWORD *)&a3->var9[2][1];
    v10 = *(_OWORD *)&a3->var9[3][2];
    v12 = *(_OWORD *)&a3->var9[1][0];
    *(_QWORD *)(v5 + 142) = *(_QWORD *)((char *)&a3->var9[4][2] + 2);
    *((_OWORD *)v5 + 7) = v11;
    *((_OWORD *)v5 + 8) = v10;
    *((_OWORD *)v5 + 6) = v12;
    self->_diagnosticPipelineLogIndex = (self->_diagnosticPipelineLogIndex + 1)
                                      % (0x2FC962FC962FC963
                                       * (((char *)self->_diagnosticPipelineLog.__end_
                                         - (char *)self->_diagnosticPipelineLog.__begin_) >> 1));
  }
  return end != begin;
}

- (NSData)intersessionFeaturesHistory
{
  return self->_intersessionFeaturesHistory;
}

- (void)setIntersessionFeaturesHistory:(id)a3
{
  objc_storeStrong((id *)&self->_intersessionFeaturesHistory, a3);
}

- (unsigned)intersessionFeaturesHistoryCount
{
  return self->_intersessionFeaturesHistoryCount;
}

- (void)setIntersessionFeaturesHistoryCount:(unsigned int)a3
{
  self->_intersessionFeaturesHistoryCount = a3;
}

- (unsigned)successfulResultCount
{
  return self->_successfulResultCount;
}

- (void)setSuccessfulResultCount:(unsigned int)a3
{
  self->_successfulResultCount = a3;
}

- (ADJasperColorInFieldCalibrationTelemetryData)inFieldCalibrationTelemetryData
{
  return self->_inFieldCalibrationTelemetryData;
}

- (void)setInFieldCalibrationTelemetryData:(id)a3
{
  objc_storeStrong((id *)&self->_inFieldCalibrationTelemetryData, a3);
}

- (__n128)jasperToColorRotationAngles
{
  return a1[6];
}

- (void).cxx_destruct
{
  ADJasperColorInFieldCalibrationDiagnosticPipelineEntry *begin;

  objc_storeStrong((id *)&self->_inFieldCalibrationTelemetryData, 0);
  objc_storeStrong((id *)&self->_intersessionFeaturesHistory, 0);
  begin = self->_diagnosticPipelineLog.__begin_;
  if (begin)
  {
    self->_diagnosticPipelineLog.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
