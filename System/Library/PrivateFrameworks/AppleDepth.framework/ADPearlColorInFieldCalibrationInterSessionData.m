@implementation ADPearlColorInFieldCalibrationInterSessionData

- (void)initIsfWithFlowType:(int)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  ADInterSessionFilter *isf;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ADInterSessionFilter *v16;
  ADInterSessionFilter *v17;
  uint8_t v18[16];

  -[ADInterSessionFilterParameters setIsStepDetectionActive:](self->super._isfParameters, "setIsStepDetectionActive:", 1);
  -[ADInterSessionFilterParameters setMinStepIndex:](self->super._isfParameters, "setMinStepIndex:", 2);
  LODWORD(v5) = 1053609165;
  -[ADInterSessionFilterParameters setMinimalWeight:](self->super._isfParameters, "setMinimalWeight:", v5);
  LODWORD(v6) = 4.0;
  -[ADInterSessionFilterParameters setMaximalWeight:](self->super._isfParameters, "setMaximalWeight:", v6);
  LODWORD(v7) = 1053609165;
  -[ADInterSessionFilterParameters setOutlierWeight:](self->super._isfParameters, "setOutlierWeight:", v7);
  LODWORD(v8) = 1092691385;
  -[ADInterSessionFilterParameters setStepDetectionThreshold:](self->super._isfParameters, "setStepDetectionThreshold:", v8);
  isf = self->super._isf;
  self->super._isf = 0;

  if ((a3 - 1) < 2)
  {
    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyPearlColorIsfCapacity_iOS);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", objc_msgSend(v10, "unsignedIntValue"));

    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyPearlColorIsfCapacity_iOS);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", objc_msgSend(v11, "unsignedIntValue"));

    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyPearlColorIsfOutliers_iOS);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = 10;
LABEL_5:

    -[ADInterSessionFilterParameters setMinStepSize:](self->super._isfParameters, "setMinStepSize:", v13);
    v16 = (ADInterSessionFilter *)objc_msgSend(objc_alloc(MEMORY[0x24BE05FD0]), "initWithFieldNames:parameters:", &unk_24C435188, self->super._isfParameters);
    v17 = self->super._isf;
    self->super._isf = v16;

    return;
  }
  if (!a3)
  {
    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyPearlColorIsfCapacity);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setMinimalEntriesForResult:](self->super._isfParameters, "setMinimalEntriesForResult:", objc_msgSend(v14, "unsignedIntValue"));

    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyPearlColorIsfCapacity);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setCapacity:](self->super._isfParameters, "setCapacity:", objc_msgSend(v15, "unsignedIntValue"));

    +[ADDeviceConfiguration numberForKey:](ADDeviceConfiguration, "numberForKey:", kADDeviceConfigurationKeyPearlColorIsfOutliers);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADInterSessionFilterParameters setOutlierNumber:](self->super._isfParameters, "setOutlierNumber:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = 30;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v18 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "initIsf unknown flow type", v18, 2u);
  }
}

- (void)initIsf
{
  -[ADPearlColorInFieldCalibrationInterSessionData initIsfWithFlowType:](self, "initIsfWithFlowType:", 0);
}

- (void)initDiagnosticPipelineLogWithFlowType:(int)a3
{
  vector<ADPearlColorInFieldCalibrationDiagnosticPipelineEntry, std::allocator<ADPearlColorInFieldCalibrationDiagnosticPipelineEntry>> *p_diagnosticPipelineLog;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *end;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  int64_t v7;
  unint64_t v8;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *value;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *v15;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *v16;
  uint64_t v17;
  size_t v18;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *v23;
  uint64_t v24;
  size_t v25;

  if (!a3 && +[ADDeviceConfiguration isInternalBuild](ADDeviceConfiguration, "isInternalBuild"))
  {
    p_diagnosticPipelineLog = &self->_diagnosticPipelineLog;
    begin = self->_diagnosticPipelineLog.__begin_;
    end = self->_diagnosticPipelineLog.__end_;
    v7 = (char *)end - (char *)begin;
    v8 = 0x21CFB2B78C13521DLL * ((char *)end - (char *)begin);
    if (v8 >> 3 > 0x270)
    {
      if (v7 == 265000)
      {
LABEL_20:
        self->_diagnosticPipelineLogIndex = 0;
        return;
      }
      v23 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)begin + 265000);
    }
    else
    {
      value = self->_diagnosticPipelineLog.__end_cap_.__value_;
      if (0x21CFB2B78C13521DLL * ((char *)value - (char *)end) < 5000 - v8)
      {
        v10 = 0x21CFB2B78C13521DLL * ((char *)value - (char *)begin);
        v11 = 0x439F656F1826A43ALL * ((char *)value - (char *)begin);
        if (v11 <= 0x1388)
          v11 = 5000;
        if (v10 >= 0x26A439F656F1826)
          v12 = 0x4D4873ECADE304DLL;
        else
          v12 = v11;
        if (v12 > 0x4D4873ECADE304DLL)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v13 = 53 * v12;
        v14 = (char *)operator new(53 * v12);
        v15 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[(char *)end - (char *)begin];
        v16 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)&v14[v13];
        v17 = ((unint64_t)(264947 - v7) * (unsigned __int128)0x3521CFB2B78C1353uLL) >> 64;
        v18 = 53 * ((v17 + ((unint64_t)(264947 - v7 - v17) >> 1)) >> 5) + 53;
        bzero(v15, v18);
        v19 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)v15 + v18);
        if (end != begin)
        {
          do
          {
            v20 = *(_OWORD *)((char *)&end[-1].var0 + 3);
            v21 = *(_OWORD *)((char *)&end[-1].var7 + 3);
            v22 = *(_OWORD *)((char *)&end[-1].var9[2] + 3);
            *(_QWORD *)&v15[-1].var11 = *(_QWORD *)&end[-1].var11;
            *(_OWORD *)((char *)&v15[-1].var9[2] + 3) = v22;
            *(_OWORD *)((char *)&v15[-1].var7 + 3) = v21;
            *(_OWORD *)((char *)&v15[-1].var0 + 3) = v20;
            v15 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)v15 - 53);
            end = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)end - 53);
          }
          while (end != begin);
          end = p_diagnosticPipelineLog->__begin_;
        }
        p_diagnosticPipelineLog->__begin_ = v15;
        self->_diagnosticPipelineLog.__end_ = v19;
        self->_diagnosticPipelineLog.__end_cap_.__value_ = v16;
        if (end)
          operator delete(end);
        goto LABEL_20;
      }
      v24 = ((unint64_t)(264947 - v7) * (unsigned __int128)0x3521CFB2B78C1353uLL) >> 64;
      v25 = 53 * ((v24 + ((unint64_t)(264947 - v7 - v24) >> 1)) >> 5) + 53;
      bzero(self->_diagnosticPipelineLog.__end_, v25);
      v23 = (ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)((char *)end + v25);
    }
    self->_diagnosticPipelineLog.__end_ = v23;
    goto LABEL_20;
  }
}

- (uint64_t)initWithFactoryPearlToColorTransform:(void *)a1 currentPearlToColorTransform:(const char *)a2
{
  return objc_msgSend(a1, "initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andDeviceName:", CFSTR("N301"));
}

- (uint64_t)initWithFactoryPearlToColorTransform:(double)a3 currentPearlToColorTransform:(double)a4 andDeviceName:(double)a5
{
  id v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a11;
  if ((objc_msgSend(v12, "hasPrefix:", CFSTR("N301")) & 1) != 0)
  {
    v13 = 0;
  }
  else if (objc_msgSend(v12, "hasPrefix:", CFSTR("J7")))
  {
    v13 = 2;
  }
  else
  {
    v13 = 1;
  }

  v14 = objc_msgSend(a1, "initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andFlowType:", v13, a2, a3, a4, a5, a6, a7, a8, a9);
  return v14;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3
{
  return -[ADPearlColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andDeviceName:](self, "initWithDictionaryRepresentation:andDeviceName:", a3, CFSTR("N301"));
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andDeviceName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  ADPearlColorInFieldCalibrationInterSessionData *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("N301")) & 1) != 0)
  {
    v8 = 0;
  }
  else if (objc_msgSend(v7, "hasPrefix:", CFSTR("J7")))
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }

  v9 = -[ADPearlColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andFlowType:](self, "initWithDictionaryRepresentation:andFlowType:", v6, v8);
  return v9;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3 andFlowType:(int)a4
{
  uint64_t v4;
  id v6;
  ADPearlColorInFieldCalibrationInterSessionData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ADInterSessionFilter *isf;
  void *v14;
  uint64_t v15;
  ADPearlColorInFieldCalibrationTelemetryData *v16;
  ADPearlColorInFieldCalibrationTelemetryData *inFieldCalibrationTelemetryData;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  id v26;
  ADPearlColorInFieldCalibrationInterSessionData *v27;
  objc_super v29;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ADPearlColorInFieldCalibrationInterSessionData;
  v7 = -[ADInFieldCalibrationInterSessionData init](&v29, sel_init);
  if (!v7)
    goto LABEL_18;
  objc_msgSend(v6, "objectForKey:", CFSTR("interSessionDataVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADInFieldCalibrationInterSessionData setVersion:](v7, "setVersion:", objc_msgSend(v8, "unsignedIntValue"));

  if (-[ADInFieldCalibrationInterSessionData version](v7, "version") < 5
    || -[ADInFieldCalibrationInterSessionData version](v7, "version") > 6
    || (-[ADPearlColorInFieldCalibrationInterSessionData initIsfWithFlowType:](v7, "initIsfWithFlowType:", v4),
        !v7->super._isf))
  {
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
  -[ADPearlColorInFieldCalibrationInterSessionData initDiagnosticPipelineLogWithFlowType:](v7, "initDiagnosticPipelineLogWithFlowType:", v4);
  objc_msgSend(v6, "objectForKey:", CFSTR("telemetryKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("isfHistoryKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("depthToMcamFactoryExtrinsics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("diagnosticPipelineLog"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isf = v7->super._isf;
  if (!v10)
  {
    -[ADPearlColorInFieldCalibrationInterSessionData convertExtrinsicsAnglesToDict:](v7, "convertExtrinsicsAnglesToDict:", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ADInterSessionFilter fillWithEntry:](isf, "fillWithEntry:", v14);

    if (!v15)
      goto LABEL_9;
LABEL_19:

    goto LABEL_20;
  }
  if (-[ADInterSessionFilter fillWithDictionaryRepresentation:](v7->super._isf, "fillWithDictionaryRepresentation:", v10))
  {
    goto LABEL_19;
  }
LABEL_9:
  if (v9)
    v16 = -[ADPearlColorInFieldCalibrationTelemetryData initWithDictionaryRepresentation:]([ADPearlColorInFieldCalibrationTelemetryData alloc], "initWithDictionaryRepresentation:", v9);
  else
    v16 = objc_alloc_init(ADPearlColorInFieldCalibrationTelemetryData);
  inFieldCalibrationTelemetryData = v7->_inFieldCalibrationTelemetryData;
  v7->_inFieldCalibrationTelemetryData = v16;

  if (!v7->_inFieldCalibrationTelemetryData || !v11)
    goto LABEL_19;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rotX"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  *(_DWORD *)v7->_pearlToColorRotationAngles = v19;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rotY"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  *(_DWORD *)&v7->_pearlToColorRotationAngles[4] = v21;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("rotZ"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  *(_DWORD *)&v7->_pearlToColorRotationAngles[8] = v23;

  if (v12)
  {
    v24 = objc_msgSend(v12, "length");
    begin = v7->_diagnosticPipelineLog.__begin_;
    if (v24 == (char *)v7->_diagnosticPipelineLog.__end_ - (char *)begin)
    {
      v26 = objc_retainAutorelease(v12);
      memcpy(begin, (const void *)objc_msgSend(v26, "bytes"), objc_msgSend(v26, "length"));
      goto LABEL_17;
    }
    goto LABEL_19;
  }
LABEL_17:
  -[ADInFieldCalibrationInterSessionData setVersion:](v7, "setVersion:", 6);

LABEL_18:
  v27 = v7;
LABEL_21:

  return v27;
}

- (ADPearlColorInFieldCalibrationInterSessionData)initWithFactoryPearlToColorTransform:(__n128)a3 currentPearlToColorTransform:(__n128)a4 andFlowType:(double)a5
{
  ADPearlColorInFieldCalibrationInterSessionData *v11;
  ADPearlColorInFieldCalibrationInterSessionData *v12;
  ADPearlColorInFieldCalibrationTelemetryData *v13;
  ADPearlColorInFieldCalibrationTelemetryData *inFieldCalibrationTelemetryData;
  __int128 v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  ADInterSessionFilter *isf;
  void *v20;
  uint64_t v21;
  ADPearlColorInFieldCalibrationInterSessionData *v22;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  objc_super v36;

  v36.receiver = a1;
  v36.super_class = (Class)ADPearlColorInFieldCalibrationInterSessionData;
  v11 = -[ADInFieldCalibrationInterSessionData init](&v36, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_5;
  -[ADInFieldCalibrationInterSessionData setVersion:](v11, "setVersion:", 6);
  -[ADPearlColorInFieldCalibrationInterSessionData initIsfWithFlowType:](v12, "initIsfWithFlowType:", a10);
  if (!v12->super._isf)
    goto LABEL_4;
  -[ADPearlColorInFieldCalibrationInterSessionData initDiagnosticPipelineLogWithFlowType:](v12, "initDiagnosticPipelineLogWithFlowType:", a10);
  v13 = objc_alloc_init(ADPearlColorInFieldCalibrationTelemetryData);
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
  *(_OWORD *)v12->_pearlToColorRotationAngles = v15;
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
  -[ADPearlColorInFieldCalibrationInterSessionData convertExtrinsicsAnglesToDict:](v12, "convertExtrinsicsAnglesToDict:");
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
  void *v14;
  void *v15;
  void *v16;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  int64_t v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("rotX");
  LODWORD(v2) = *(_DWORD *)self->_pearlToColorRotationAngles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  v23[1] = CFSTR("rotY");
  LODWORD(v5) = *(_DWORD *)&self->_pearlToColorRotationAngles[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  v23[2] = CFSTR("rotZ");
  LODWORD(v7) = *(_DWORD *)&self->_pearlToColorRotationAngles[8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCED8];
  v21[0] = CFSTR("isfHistoryKey");
  -[ADInterSessionFilter persistenceData](self->super._isf, "persistenceData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v21[1] = CFSTR("telemetryKey");
  -[ADPearlColorInFieldCalibrationInterSessionData inFieldCalibrationTelemetryData](self, "inFieldCalibrationTelemetryData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "persistenceData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  v22[2] = v9;
  v21[2] = CFSTR("depthToMcamFactoryExtrinsics");
  v21[3] = CFSTR("interSessionDataVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[ADInFieldCalibrationInterSessionData version](self, "version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  begin = self->_diagnosticPipelineLog.__begin_;
  v18 = (char *)self->_diagnosticPipelineLog.__end_ - (char *)begin;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", (char *)begin + 53 * self->_diagnosticPipelineLogIndex, 53 * (0x21CFB2B78C13521DLL * v18 - self->_diagnosticPipelineLogIndex));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendBytes:length:", self->_diagnosticPipelineLog.__begin_, 53 * self->_diagnosticPipelineLogIndex);
    objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("diagnosticPipelineLog"));

  }
  return v16;
}

- (id)convertExtrinsicsAnglesToDict:(ADPearlColorInFieldCalibrationInterSessionData *)self
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

- (BOOL)insertEntryToDiagnosticPipelineLog:(ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *)a3
{
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *end;
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *begin;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  begin = self->_diagnosticPipelineLog.__begin_;
  end = self->_diagnosticPipelineLog.__end_;
  if (end != begin)
  {
    v5 = (char *)begin + 53 * self->_diagnosticPipelineLogIndex;
    v7 = *(_OWORD *)&a3->var7;
    v6 = *(_OWORD *)&a3->var9[2];
    v8 = *(_OWORD *)&a3->var0;
    *(_QWORD *)(v5 + 45) = *(_QWORD *)((char *)&a3->var10[2] + 1);
    *((_OWORD *)v5 + 1) = v7;
    *((_OWORD *)v5 + 2) = v6;
    *(_OWORD *)v5 = v8;
    self->_diagnosticPipelineLogIndex = (self->_diagnosticPipelineLogIndex + 1)
                                      % (0x21CFB2B78C13521DLL
                                       * ((char *)self->_diagnosticPipelineLog.__end_
                                        - (char *)self->_diagnosticPipelineLog.__begin_));
  }
  return end != begin;
}

- (ADPearlColorInFieldCalibrationTelemetryData)inFieldCalibrationTelemetryData
{
  return self->_inFieldCalibrationTelemetryData;
}

- (void)setInFieldCalibrationTelemetryData:(id)a3
{
  objc_storeStrong((id *)&self->_inFieldCalibrationTelemetryData, a3);
}

- (__n128)pearlToColorRotationAngles
{
  return a1[5];
}

- (void).cxx_destruct
{
  ADPearlColorInFieldCalibrationDiagnosticPipelineEntry *begin;

  objc_storeStrong((id *)&self->_inFieldCalibrationTelemetryData, 0);
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
