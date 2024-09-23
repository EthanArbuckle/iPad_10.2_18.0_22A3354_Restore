@implementation CIDualRedEyeRepairTuning

- (CIDualRedEyeRepairTuning)initWithTuning:(unint64_t)a3
{
  CIDualRedEyeRepairTuning *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIDualRedEyeRepairTuning;
  v4 = -[CIDualRedEyeRepairTuning init](&v6, sel_init);
  if (v4)
  {
    -[CIDualRedEyeRepairTuning setRepairTuning:](v4, "setRepairTuning:", +[CIDualRedEyeRepairTuning repairParametersForTuning:](CIDualRedEyeRepairTuning, "repairParametersForTuning:", a3));
    -[CIDualRedEyeRepairTuning setSessionTuning:](v4, "setSessionTuning:", +[CIDualRedEyeRepairTuning sessionParametersForTuning:](CIDualRedEyeRepairTuning, "sessionParametersForTuning:", a3));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIDualRedEyeRepairTuning;
  -[CIDualRedEyeRepairTuning dealloc](&v3, sel_dealloc);
}

- (unint64_t)tuningFromCameraModel:(id)a3 portType:(id)a4
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("N841")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("D321")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("D331")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("D331p")))
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("PortTypeBackTelephoto")))
      return 3;
    else
      return 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("D421")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("D431")) & 1) != 0
         || objc_msgSend(a3, "isEqualToString:", CFSTR("N104")))
  {
    return 5;
  }
  else
  {
    return 0;
  }
}

- (void)setTuningParametersByPortType:(id)a3 withCameraMetadata:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend(a4, "objectForKey:", CFSTR("Tuning"));
  v8 = objc_msgSend(a4, "objectForKey:", CFSTR("DeviceModelName"));
  v9 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("DeviceModelName"));
  v10 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("PortType"));
  if (v7)
  {
    v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("Tuning")), "unsignedIntegerValue");
    if (v8 == 999)
      return;
  }
  else if (v8)
  {
    v8 = -[CIDualRedEyeRepairTuning tuningFromCameraModel:portType:](self, "tuningFromCameraModel:portType:", v9, v10);
  }
  -[CIDualRedEyeRepairTuning setRepairTuning:](self, "setRepairTuning:", +[CIDualRedEyeRepairTuning repairParametersForTuning:](CIDualRedEyeRepairTuning, "repairParametersForTuning:", v8));
  -[CIDualRedEyeRepairTuning setSessionTuning:](self, "setSessionTuning:", +[CIDualRedEyeRepairTuning sessionParametersForTuning:](CIDualRedEyeRepairTuning, "sessionParametersForTuning:", v8));
  if (a3
    || (a3 = (id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("TuningParametersByPortType"))) != 0
    || (a3 = (id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("RedEye"))) != 0)
  {
    -[CIDualRedEyeRepairTuning updateWithCaptureSetup:portType:](self, "updateWithCaptureSetup:portType:", a3, v10);
  }
}

+ (id)defaultSessionParameters
{
  unsigned __int8 v2;
  _QWORD v4[15];
  _QWORD v5[16];

  v5[15] = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    v4[0] = CFSTR("kMinPrimaryDimension");
    v4[1] = CFSTR("kMinLandmarkConfidenceThreshold");
    v5[0] = &unk_1E2F1B7D0;
    v5[1] = &unk_1E2F19700;
    v4[2] = CFSTR("kMaxFaceJunkinessThreshold");
    v4[3] = CFSTR("kMinLandmarkArea");
    v5[2] = &unk_1E2F19710;
    v5[3] = &unk_1E2F1B7E8;
    v4[4] = CFSTR("kMinIsotropy");
    v4[5] = CFSTR("kMaxFaceCount");
    v5[4] = &unk_1E2F19720;
    v5[5] = &unk_1E2F1B800;
    v4[6] = CFSTR("kSessionTuningOutsetROILong");
    v4[7] = CFSTR("kSessionTuningOutsetROIShort");
    v5[6] = &unk_1E2F19720;
    v5[7] = &unk_1E2F19730;
    v4[8] = CFSTR("kRenderFullRect");
    v4[9] = CFSTR("kMinLaplacianVariance");
    v5[8] = MEMORY[0x1E0C9AAB0];
    v5[9] = &unk_1E2F19740;
    v4[10] = CFSTR("kRegionOutset");
    v4[11] = CFSTR("kUseFaceSegmentation");
    v5[10] = &unk_1E2F1B818;
    v5[11] = MEMORY[0x1E0C9AAA0];
    v4[12] = CFSTR("kUseFaceSegmentationMask");
    v4[13] = CFSTR("kForceFaceSegmentationPupils");
    v5[12] = MEMORY[0x1E0C9AAA0];
    v5[13] = MEMORY[0x1E0C9AAA0];
    v4[14] = CFSTR("kAutoFlashOverrideSNRThreshold");
    v5[14] = &unk_1E2F1B818;
    +[CIDualRedEyeRepairTuning defaultSessionParameters]::parms = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 15);
  }
  return (id)+[CIDualRedEyeRepairTuning defaultSessionParameters]::parms;
}

+ (id)defaultRepairParameters
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[CIDualRedEyeRepairTuning defaultRepairParameters]::parms = &unk_1E2F1D558;
  }
  return (id)+[CIDualRedEyeRepairTuning defaultRepairParameters]::parms;
}

+ (id)repairParametersForTuning:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v4 = (id)objc_msgSend(+[CIDualRedEyeRepairTuning defaultRepairParameters](CIDualRedEyeRepairTuning, "defaultRepairParameters"), "mutableCopy");
  switch(a3)
  {
    case 1uLL:
      if (CI_LOG_DUALRED())
      {
        v5 = ci_logger_api();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.4(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      return v4;
    case 2uLL:
      if (CI_LOG_DUALRED())
      {
        v21 = ci_logger_api();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.5(v21, v22, v23, v24, v25, v26, v27, v28);
      }
      return v4;
    case 3uLL:
      if (CI_LOG_DUALRED())
      {
        v29 = ci_logger_api();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.6(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F198B0, CFSTR("inputCenterSpecRad"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F1B860, CFSTR("inputCentroidGamma"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197B0, CFSTR("inputCentroidRadius"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputClosingDilation"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19720, CFSTR("inputClosingErosion"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19800, CFSTR("inputDetectRed"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197F0, CFSTR("inputDetectWhite"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197B0, CFSTR("inputFSmooth"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputGlintThreshold"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F198C0, CFSTR("inputIntersect"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F198D0, CFSTR("inputMaxInterDispersion"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19730, CFSTR("inputRadiusRepair"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F198E0, CFSTR("inputRefilterRange"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F198F0, CFSTR("inputRefilterSpace"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197B0, CFSTR("inputRepairChroma"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197B0, CFSTR("inputRepairDarken"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19770, CFSTR("inputRepairDither"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19900, CFSTR("inputScale"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19720, CFSTR("inputSkinThreshold"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197D0, CFSTR("inputSpecArea"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19910, CFSTR("inputSpecAreaScale"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F1B878, CFSTR("inputSpecIntensity"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19700, CFSTR("inputSpecMax"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19870, CFSTR("inputSpecMin"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputSpecular"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F1B890, CFSTR("inputTargetClosing"));
      v37 = &unk_1E2F19920;
      v38 = CFSTR("inputWhiteCutoff");
      goto LABEL_24;
    case 4uLL:
      if (CI_LOG_DUALRED())
      {
        v39 = ci_logger_api();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.7(v39, v40, v41, v42, v43, v44, v45, v46);
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19700, CFSTR("inputMidSpectrumWhiteOffsetsX"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19720, CFSTR("inputMidSpectrumWhiteOffsetsY"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19800, CFSTR("inputCentroidRadiusSmall"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19820, CFSTR("inputIntersect"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19930, CFSTR("inputSkinThresholdMed"));
      v37 = &unk_1E2F19710;
      v38 = CFSTR("inputScleraThreshold");
      goto LABEL_24;
    case 5uLL:
      if (CI_LOG_DUALRED())
      {
        v47 = ci_logger_api();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.2(v47, v48, v49, v50, v51, v52, v53, v54);
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197F0, CFSTR("inputAbortDensityLo"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19940, CFSTR("inputAbortDensityDiff"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19950, CFSTR("inputRadiusDensity"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputInterPeakMin"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputCircularity"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F1B830, CFSTR("inputSkinThreshold"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F1B830, CFSTR("inputSkinThresholdMed"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputMinInterDispersion"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19960, CFSTR("inputMaxInterDispersion"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19750, CFSTR("inputMinMaskDiff"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19970, CFSTR("inputIntersect"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19980, CFSTR("inputCentroidRadius"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19770, CFSTR("inputSearchLong"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19730, CFSTR("inputSearchShort"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19990, CFSTR("inputFlooding"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19700, CFSTR("inputSpecularCutoff"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197D0, CFSTR("inputClipMin"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19720, CFSTR("inputMidSpectrumWhiteOffsetsX"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19700, CFSTR("inputMidSpectrumWhiteOffsetsY"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F19760, CFSTR("inputSpecIntensity"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F197D0, CFSTR("inputSpecArea"));
      v37 = &unk_1E2F199A0;
      v38 = CFSTR("inputSpecular");
LABEL_24:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, v38);
      break;
    default:
      if (a3 == 999)
      {
        if (CI_LOG_DUALRED())
        {
          v13 = ci_logger_api();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);
        }
      }
      else if (CI_LOG_DUALRED())
      {
        v56 = ci_logger_api();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning repairParametersForTuning:].cold.1(v56, v57, v58, v59, v60, v61, v62, v63);
      }
      break;
  }
  return v4;
}

+ (id)sessionParametersForTuning:(unint64_t)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;

  v4 = (id)objc_msgSend(+[CIDualRedEyeRepairTuning defaultSessionParameters](CIDualRedEyeRepairTuning, "defaultSessionParameters"), "mutableCopy");
  v5 = v4;
  switch(a3)
  {
    case 1uLL:
      if (CI_LOG_DUALRED())
      {
        v6 = ci_logger_api();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      return v5;
    case 2uLL:
      if (CI_LOG_DUALRED())
      {
        v22 = ci_logger_api();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      v30 = &unk_1E2F199B0;
      v31 = CFSTR("kMinLaplacianVariance");
      goto LABEL_16;
    case 3uLL:
      if (CI_LOG_DUALRED())
      {
        v32 = ci_logger_api();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.4(v32, v33, v34, v35, v36, v37, v38, v39);
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E2F199B0, CFSTR("kMinLaplacianVariance"));
      v30 = &unk_1E2F19730;
      v31 = CFSTR("kRegionOutset");
LABEL_16:
      v40 = v5;
      goto LABEL_21;
    case 4uLL:
      if (CI_LOG_DUALRED())
      {
        v41 = ci_logger_api();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.5(v41, v42, v43, v44, v45, v46, v47, v48);
      }
      return v5;
    case 5uLL:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E2F1B830, CFSTR("kMaxFaceJunkinessThreshold"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E2F1B818, CFSTR("kMinLaplacianVariance"));
      v49 = (void *)MEMORY[0x1E0C9AAB0];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kUseFaceSegmentation"));
      v31 = CFSTR("kUseFaceSegmentationMask");
      v40 = v5;
      v30 = v49;
LABEL_21:
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v30, v31);
      break;
    default:
      if (CI_LOG_DUALRED())
      {
        v14 = ci_logger_api();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[CIDualRedEyeRepairTuning sessionParametersForTuning:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      break;
  }
  return v5;
}

- (void)updateWithCaptureSetup:(id)a3 portType:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;

  v7 = updatedTuningFromSetup(-[CIDualRedEyeRepairTuning sessionTuning](self, "sessionTuning"), (NSDictionary *)a3, (NSString *)a4, CFSTR("k"), CFSTR("Session"));
  if (v7)
  {
    -[CIDualRedEyeRepairTuning setSessionTuning:](self, "setSessionTuning:", v7);
  }
  else if (CI_LOG_DUALRED())
  {
    v8 = ci_logger_api();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairTuning updateWithCaptureSetup:portType:].cold.2();
  }
  v9 = updatedTuningFromSetup(-[CIDualRedEyeRepairTuning repairTuning](self, "repairTuning"), (NSDictionary *)a3, (NSString *)a4, CFSTR("input"), CFSTR("Repair"));
  if (v9)
  {
    -[CIDualRedEyeRepairTuning setRepairTuning:](self, "setRepairTuning:", v9);
  }
  else if (CI_LOG_DUALRED())
  {
    v10 = ci_logger_api();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CIDualRedEyeRepairTuning updateWithCaptureSetup:portType:].cold.1();
  }
}

- (NSDictionary)repairTuning
{
  return self->repairTuning;
}

- (void)setRepairTuning:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)sessionTuning
{
  return self->sessionTuning;
}

- (void)setSessionTuning:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning set to default", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning set to C", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning passing through", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning set to A wide", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning set to A tele", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning set to A portrait", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)repairParametersForTuning:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Repair tuning set to B", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Session tuning set to default", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Session tuning set to A wide", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Session tuning set to A tele", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Session tuning set to A portrait", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)sessionParametersForTuning:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Session tuning set to B", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateWithCaptureSetup:portType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s No CaptureSetup repair tuning for port type %@\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateWithCaptureSetup:portType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s No CaptureSetup session tuning for port type %@\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
