@implementation AWBAlgorithm

- (id).cxx_construct
{
  *((_OWORD *)self + 315) = 0u;
  *((_OWORD *)self + 314) = 0u;
  *((_OWORD *)self + 313) = 0u;
  return self;
}

- (AWBAlgorithm)initWithMetalContext:(id)a3
{
  id v5;
  _DWORD *v6;
  AWBAlgorithm *v7;
  AWBAlgorithm *v8;
  CAWBAFEH14 *v9;
  AWBAlgorithm *v10;
  objc_super v12;

  v5 = a3;
  v6 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v12.receiver = self;
  v12.super_class = (Class)AWBAlgorithm;
  v7 = -[AWBAlgorithm init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v7->_metalContext, a3);
      if (!-[AWBAlgorithm _createShaders](v8, "_createShaders")
        && !-[AWBAlgorithm initFWPlatformID](v8, "initFWPlatformID"))
      {
        v9 = (CAWBAFEH14 *)operator new();
        CAWBAFEH14::CAWBAFEH14(v9, "CAWBAFE", 0);
        v8->_AWBAlgorithmObj = (CAWBAFE *)v9;
        v10 = v8;
        goto LABEL_8;
      }
    }
    else
    {
      FigSignalErrorAt();
    }
  }
  if (*v6 == 1)
    kdebug_trace();
  v10 = 0;
LABEL_8:

  return v10;
}

- (int)_createShaders
{
  return 0;
}

- (int)initFWPlatformID
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  unsigned __int8 v6;
  int v7;
  unsigned __int8 v8;
  void *v9;
  int v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;
  int v14;
  unsigned __int8 v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v2 = getFigCapturePlatformIdentifierSymbolLoc(void)::ptr;
  v22 = getFigCapturePlatformIdentifierSymbolLoc(void)::ptr;
  if (!getFigCapturePlatformIdentifierSymbolLoc(void)::ptr)
  {
    v3 = CMCaptureLibrary();
    v2 = dlsym(v3, "FigCapturePlatformIdentifier");
    v20[3] = (uint64_t)v2;
    getFigCapturePlatformIdentifierSymbolLoc(void)::ptr = v2;
  }
  _Block_object_dispose(&v19, 8);
  if (v2)
  {
    switch(((unsigned int (*)(void))v2)())
    {
      case 8u:
        soft_FigCaptureGetModelSpecificName();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(CFSTR("D49"), "isEqualToString:", v4);

        if (v5)
        {
          {
            v7 = 13;
            goto LABEL_22;
          }
          CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
          v7 = 13;
        }
        else
        {
          soft_FigCaptureGetModelSpecificName();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(&unk_24FECE300, "containsObject:", v13);

          if (v14)
          {
            {
              v7 = 231;
              goto LABEL_22;
            }
            CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
            v7 = 231;
          }
          else
          {
            {
              v7 = 19;
              goto LABEL_22;
            }
            CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
            v7 = 19;
          }
        }
        goto LABEL_39;
      case 9u:
        {
          v7 = 240;
          goto LABEL_22;
        }
        CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
        v7 = 240;
        goto LABEL_39;
      case 0xAu:
        if ((v8 & 1) != 0)
          goto LABEL_9;
        goto LABEL_25;
      case 0xBu:
        soft_FigCaptureGetModelSpecificName();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(&unk_24FECE318, "containsObject:", v9);

        if (v10)
        {
          {
            v7 = 71;
            goto LABEL_22;
          }
          CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
          v7 = 71;
        }
        else
        {
          {
            v7 = 55;
            goto LABEL_22;
          }
          CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
          v7 = 55;
        }
        break;
      default:
        return 0;
    }
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "FigCapturePlatformID soft_FigCapturePlatformIdentifier()");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("AWBAlgorithm.mm"), 51, CFSTR("%s"), dlerror());

  __break(1u);
LABEL_25:
  {
    CEnvironment::CEnvironment((CEnvironment *)&CEnvironment::Instance(void)::instance);
    v7 = 66;
LABEL_39:
    goto LABEL_22;
  }
LABEL_9:
  v7 = 66;
LABEL_22:
  dword_2540627FC = v7;
  return 0;
}

- (AWBAlgorithm)initWithAWBObject:(id)a3
{
  id v4;
  _DWORD *v5;
  AWBAlgorithm *v6;
  AWBAlgorithm *v7;
  uint64_t v8;
  AWBAlgorithm *v9;
  objc_super v11;

  v4 = a3;
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v11.receiver = self;
  v11.super_class = (Class)AWBAlgorithm;
  v6 = -[AWBAlgorithm init](&v11, sel_init);
  v7 = v6;
  if (v6
    && !-[AWBAlgorithm initFWPlatformID](v6, "initFWPlatformID")
    && (v8 = objc_msgSend(v4, "pointerValue"), (v7->_AWBAlgorithmObj = (CAWBAFE *)v8) != 0))
  {
    v9 = v7;
  }
  else
  {
    if (*v5 == 1)
      kdebug_trace();
    v9 = 0;
  }

  return v9;
}

- (int)configWithSetFile:(id)a3 metadata:(id)a4 awbParams:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSData *v11;
  NSData *setFileData;
  NSData *v13;
  NSNumber *v14;
  NSNumber *digitalFlash;
  float v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CAWBAFE *AWBAlgorithmObj;
  _DWORD *v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  void *v51;
  float v52;
  int v53;
  int v54;
  void *v56;
  CAWBAFE *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  _BYTE v67[9];

  v8 = a3;
  v9 = a4;
  v66 = a5;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (!objc_msgSend(v9, "count"))
    goto LABEL_28;
  bzero(&self->_sMetaData, 0x1310uLL);
  self->_awbGains.bGain = 0;
  *(_OWORD *)&self->_awbComboGainsNormalized.gGain = 0u;
  *(_OWORD *)&self->_awbComboGains.rGain = 0u;
  objc_msgSend(v66, "setFileDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SetFileData"));
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  setFileData = self->_setFileData;
  self->_setFileData = v11;

  v13 = self->_setFileData;
  if (!v13 || !-[NSData length](v13, "length"))
  {
LABEL_28:
    v54 = FigSignalErrorAt();
    goto LABEL_23;
  }
  objc_msgSend(v66, "digitalFlash");
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  digitalFlash = self->_digitalFlash;
  self->_digitalFlash = v14;

  *(_QWORD *)&self->_numTilesX = 0x2000000020;
  v67[0] = 0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11CF0], v67, COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x2000000000));
  self->_sMetaData.ae.luxLevel = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  *(float *)&v18 = v18;
  self->_sMetaData.ae.luxLevel = *(float *)&v18;

  if (!v67[0])
    goto LABEL_30;
  self->_sMetaData.ae.gainDigi.v16 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11A70], 1, v67);
  if (!v67[0])
    goto LABEL_30;
  self->_sMetaData.ae.gainAnal.v16 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11A60], 1, v67);
  if (!v67[0])
    goto LABEL_30;
  self->_sMetaData.ae.aeTarget = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11B60], 1, v67);
  if (!v67[0]
    || (self->_sMetaData.ae.aeAverage = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11B58], 1, v67), !v67[0])|| (LODWORD(v19) = 1.0, objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11A68], v67, v19), !v67[0])|| (self->_sMetaData.ae.exposureTime = (float)(v20 * 1000000.0), self->_sMetaData.ae.gainDigiSensor.v16 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11A78], 1, v67), !v67[0])|| (LODWORD(v21) = 1.0, objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11C20], v67, v21),
        !v67[0]))
  {
LABEL_30:
    v54 = FigSignalErrorAt();
    goto LABEL_23;
  }
  self->_sMetaData.frameRate = vcvts_n_u32_f32(v22, 8uLL);
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE11D20]);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v23, "bytes");
  if (v24 && (v25 = *(unsigned int *)(v24 + 28), (_DWORD)v25) && (v26 = *(unsigned int *)(v24 + 20), (_DWORD)v26))
  {
    v27 = v24 + v25;
    v28 = v24 + v26;
    self->_sMetaData.ae.luxLevelLow = *(_DWORD *)(v27 + 1720);
    self->_sMetaData.ae.luxLevelHigh = *(_DWORD *)(v27 + 1724);
    self->_sMetaData.maxLSgainUnadjusted = *(_DWORD *)(v27 + 180);
    self->_sMetaData.ae.sceneBrightnessForLux = *(_DWORD *)(v27 + 1696);
    *(_WORD *)&self->_sMetaData.masterCam = *(_WORD *)(v27 + 174);
    self->_sMetaData.ae.luxCalcParams = *(sLuxCalcParams *)(v27 + 124);
    self->_sMetaData.ae.inverseBinningGainFactor = *(_WORD *)(v28 + 64);
    self->_sMetaData.ae.currentEIT = *(_QWORD *)(v27 + 1668);
    self->_sMetaData.flash.flashCaptureCount = *(_WORD *)(v28 + 40);
    *(_QWORD *)&self->_sMetaData.flash.flashStatusAE = 0x100000001;
    self->_sMetaData.flash.strobeStatus = 1;
    self->_sMetaData.flash.flashCaptureSequence = *(_BYTE *)(v28 + 72);

    self->_sMetaData.isReplay = 1;
    self->_sMetaData.awb.isDefaultSetting = 1;
    -[AWBAlgorithm configPortTypeMetadata:](self, "configPortTypeMetadata:", v9);
    self->_sMetaData.ae.UBMisc.awbReflow.bGenerateReflowAWB = -[NSNumber intValue](self->_digitalFlash, "intValue") != 0;
    if ((*((unsigned int (**)(CAWBAFE *, uint64_t))self->_AWBAlgorithmObj->var0 + 2))(self->_AWBAlgorithmObj, 1))
    {
      AWBAlgorithmObj = self->_AWBAlgorithmObj;
      v30 = -[NSData bytes](self->_setFileData, "bytes");
      -[NSData length](self->_setFileData, "length");
      SetFileLoad(AWBAlgorithmObj, v30);
      v57 = self->_AWBAlgorithmObj;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AbsoluteColorCalibrationData"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("HiCCTrgAbs"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "floatValue");
      v32 = v31;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AbsoluteColorCalibrationData"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("HiCCTbgAbs"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      v34 = v33;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AbsoluteColorCalibrationData"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("LowCCTrgAbs"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "floatValue");
      v36 = v35;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AbsoluteColorCalibrationData"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("LowCCTbgAbs"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "floatValue");
      v38 = v37;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ColorCalIdeal"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("hiCCTrgIdeal"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ColorCalIdeal"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("hiCCTbgIdeal"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v45 = v44;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ColorCalIdeal"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("lowCCTrgIdeal"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      v49 = v48;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ColorCalIdeal"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("lowCCTbgIdeal"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      CAWBAFE::SensorCalSet(v57, v32, v34, v36, v38, v41, v45, v49, v52);

      v53 = -[AWBAlgorithm initTuningParameters:](self, "initTuningParameters:", v9);
      if (!v53)
      {
        v53 = -[AWBAlgorithm configFallbackMetadata:](self, "configFallbackMetadata:", v9);
        if (!v53)
        {
          v53 = -[AWBAlgorithm configFaceMetadata:awbParams:](self, "configFaceMetadata:awbParams:", v9, v66);
          if (!v53)
          {
            v53 = -[AWBAlgorithm configFlickerDetectionMetadata:moduleConfig:](self, "configFlickerDetectionMetadata:moduleConfig:", v9, 0);
            if (!v53)
            {
              v54 = -[AWBAlgorithm configFlashRFCMetadata:cameraInfo:moduleConfig:](self, "configFlashRFCMetadata:cameraInfo:moduleConfig:", v9, 0, 0);
LABEL_23:
              v53 = v54;
            }
          }
        }
      }
    }
    else
    {
      v53 = -1;
    }
  }
  else
  {
    v53 = FigSignalErrorAt();

  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v53;
}

- (int)configWithModuleConfig:(id)a3 metadata:(id)a4 cameraInfo:(id)a5 awbParams:(id)a6
{
  id v9;
  NSNumber *v10;
  NSNumber *digitalFlash;
  float v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  double v17;
  float v18;
  double v19;
  float v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  float v59;
  float v60;
  void *v61;
  float v62;
  float v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  float v68;
  float v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  _BYTE v89[9];

  v9 = a3;
  v85 = a4;
  v77 = a5;
  v78 = a6;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (!objc_msgSend(v85, "count", v9))
    goto LABEL_36;
  bzero(&self->_sMetaData, 0x1310uLL);
  self->_awbGains.bGain = 0;
  *(_OWORD *)&self->_awbComboGainsNormalized.gGain = 0u;
  *(_OWORD *)&self->_awbComboGains.rGain = 0u;
  objc_msgSend(v78, "digitalFlash");
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  digitalFlash = self->_digitalFlash;
  self->_digitalFlash = v10;

  *(_QWORD *)&self->_numTilesX = 0x2000000020;
  v89[0] = 0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11CF0], v89, COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x2000000000));
  self->_sMetaData.ae.luxLevel = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  *(float *)&v14 = v14;
  self->_sMetaData.ae.luxLevel = *(float *)&v14;

  if (!v89[0])
    goto LABEL_36;
  self->_sMetaData.ae.gainDigi.v16 = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11A70], 1, v89);
  if (!v89[0])
    goto LABEL_36;
  self->_sMetaData.ae.gainAnal.v16 = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11A60], 1, v89);
  if (!v89[0])
    goto LABEL_36;
  LODWORD(v15) = 1.0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11A68], v89, v15);
  if (!v89[0])
    goto LABEL_36;
  self->_sMetaData.ae.exposureTime = (float)(v16 * 1000000.0);
  self->_sMetaData.ae.gainDigiSensor.v16 = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11A78], 1, v89);
  if (!v89[0])
    goto LABEL_36;
  LODWORD(v17) = 1.0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11C20], v89, v17);
  if (!v89[0])
    goto LABEL_36;
  self->_sMetaData.frameRate = vcvts_n_u32_f32(v18, 8uLL);
  self->_sMetaData.flash.flashCaptureCount = objc_msgSend(v85, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x24BE11C98], 0, v89);
  if (!v89[0])
    goto LABEL_36;
  LODWORD(v19) = 1.0;
  objc_msgSend(v85, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11D18], v89, v19);
  self->_sMetaData.ae.inverseBinningGainFactor = vcvts_n_s32_f32(v20, 8uLL);
  v21 = v89[0];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Exposure"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("LuxModel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Scale"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_36;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Exposure"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("LuxModel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Scale"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sMetaData.ae.luxCalcParams.scale = objc_msgSend(v27, "intValue");

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Exposure"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("LuxModel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ScaleShift"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
LABEL_36:
    v74 = FigSignalErrorAt();
LABEL_32:
    v37 = v74;
    goto LABEL_33;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Exposure"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("LuxModel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("ScaleShift"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sMetaData.ae.luxCalcParams.scaleShift = objc_msgSend(v33, "intValue");

  objc_msgSend(v85, "objectForKeyedSubscript:", *MEMORY[0x24BE11D20]);
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v35 = objc_msgSend(v34, "bytes");
  if (v35 && (v36 = *(unsigned int *)(v35 + 20), (_DWORD)v36))
  {
    if (!v21)
      self->_sMetaData.ae.inverseBinningGainFactor = *(_WORD *)(v35 + v36 + 64);

    -[AWBAlgorithm calculateEIT:result:](self, "calculateEIT:result:", v85, &self->_sMetaData.ae.currentEIT);
    *(_QWORD *)&self->_sMetaData.flash.flashStatusAE = 0x100000001;
    self->_sMetaData.flash.strobeStatus = 1;
    self->_sMetaData.flash.flashCaptureSequence = 0;
    *(_QWORD *)&self->_sMetaData.ae.aeAverage = 0;
    *(_WORD *)&self->_sMetaData.masterCam = 257;
    self->_sMetaData.awb.isDefaultSetting = 1;
    self->_sMetaData.maxLSgainUnadjusted = 0x2000;
    self->_sMetaData.isReplay = 1;
    -[AWBAlgorithm configPortTypeMetadata:](self, "configPortTypeMetadata:", v85);
    self->_sMetaData.ae.UBMisc.awbReflow.bGenerateReflowAWB = -[NSNumber intValue](self->_digitalFlash, "intValue") != 0;
    if ((*((unsigned int (**)(CAWBAFE *, uint64_t))self->_AWBAlgorithmObj->var0 + 2))(self->_AWBAlgorithmObj, 1))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        v37 = -[AWBAlgorithm awbConfigLoad:to:](self, "awbConfigLoad:to:");
        if (v37)
        {
          v71 = 0;
          v72 = 0;
          v39 = 0;
          v41 = 0;
          v55 = 0;
          v73 = 0;
          v70 = 6;
        }
        else
        {
          objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x24BE11A28]);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v38;
          if (v38)
          {
            v81 = *MEMORY[0x24BE11B38];
            objc_msgSend(v38, "objectForKeyedSubscript:");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v84;
            if (v84)
            {
              v40 = *MEMORY[0x24BE11B40];
              objc_msgSend(v86, "objectForKeyedSubscript:", *MEMORY[0x24BE11B40]);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v83;
              if (v83)
              {
                v80 = *MEMORY[0x24BE11B30];
                objc_msgSend(v84, "objectForKeyedSubscript:");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "floatValue");
                v44 = v43;

                v79 = *MEMORY[0x24BE11B28];
                objc_msgSend(v84, "objectForKeyedSubscript:");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "floatValue");
                v47 = v46;

                objc_msgSend(v83, "objectForKeyedSubscript:", v80);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "floatValue");
                v50 = v49;

                objc_msgSend(v83, "objectForKeyedSubscript:", v79);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "floatValue");
                v53 = v52;

                objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("IdealColorCalibrations"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "objectForKeyedSubscript:", v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v82;
                if (v82)
                {
                  objc_msgSend(v54, "objectForKeyedSubscript:", v40);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (v56)
                  {
                    v57 = (void *)v56;
                    objc_msgSend(v82, "objectForKeyedSubscript:", v80);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "floatValue");
                    v60 = v59;

                    objc_msgSend(v82, "objectForKeyedSubscript:", v79);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "floatValue");
                    v63 = v62;

                    objc_msgSend(v57, "objectForKeyedSubscript:", v80);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "floatValue");
                    v66 = v65;

                    objc_msgSend(v57, "objectForKeyedSubscript:", v79);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "floatValue");
                    v69 = v68;

                    CAWBAFE::SensorCalSet(self->_AWBAlgorithmObj, v44 * 16384.0, v47 * 16384.0, v50 * 16384.0, v53 * 16384.0, v60, v63, v66, v69);
                    v37 = 0;
                    v70 = 0;
                    v71 = v86;
                    v39 = v83;
                    v72 = v84;
                    v41 = v54;
                    v55 = v82;
                    v73 = v57;
                  }
                  else
                  {
                    v73 = 0;
                    v37 = FigSignalErrorAt();
                    v70 = 6;
                    v71 = v86;
                    v39 = v83;
                    v72 = v84;
                    v41 = v54;
                    v55 = v82;
                  }
                }
                else
                {
                  v37 = FigSignalErrorAt();
                  v70 = 6;
                  v71 = v86;
                  v39 = v83;
                  v72 = v84;
                  v41 = v54;
                  v73 = 0;
                }
              }
              else
              {
                v37 = FigSignalErrorAt();
                v70 = 6;
                v71 = v86;
                v72 = v84;
                v39 = 0;
                v55 = 0;
                v73 = 0;
              }
            }
            else
            {
              v37 = FigSignalErrorAt();
              v70 = 6;
              v71 = v86;
              v72 = 0;
              v41 = 0;
              v55 = 0;
              v73 = 0;
            }
          }
          else
          {
            v72 = 0;
            v37 = FigSignalErrorAt();
            v70 = 6;
            v71 = 0;
            v39 = 0;
            v41 = 0;
            v55 = 0;
            v73 = 0;
          }
        }
      }
      else
      {
        v71 = 0;
        v37 = FigSignalErrorAt();
        v70 = 6;
        v72 = 0;
        v39 = 0;
        v41 = 0;
        v55 = 0;
        v73 = 0;
      }

      v9 = v76;
      if (v70 == 6)
        goto LABEL_33;
      CAWBAFE::SetDigitalFlashBehaviorMode((uint64_t)self->_AWBAlgorithmObj, -[NSNumber intValue](self->_digitalFlash, "intValue"));
      v37 = -[AWBAlgorithm initTuningParameters:](self, "initTuningParameters:", v85);
      if (v37)
        goto LABEL_33;
      v37 = -[AWBAlgorithm configFallbackMetadata:](self, "configFallbackMetadata:", v85);
      if (v37)
        goto LABEL_33;
      v37 = -[AWBAlgorithm configFaceMetadata:awbParams:](self, "configFaceMetadata:awbParams:", v85, v78);
      if (v37)
        goto LABEL_33;
      v37 = -[AWBAlgorithm configFlickerDetectionMetadata:moduleConfig:](self, "configFlickerDetectionMetadata:moduleConfig:", v85, v76);
      if (v37)
        goto LABEL_33;
      v74 = -[AWBAlgorithm configFlashRFCMetadata:cameraInfo:moduleConfig:](self, "configFlashRFCMetadata:cameraInfo:moduleConfig:", v85, v77, v76);
      goto LABEL_32;
    }
    v37 = -1;
  }
  else
  {
    v37 = FigSignalErrorAt();

  }
LABEL_33:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v37;
}

- (int)calculateEIT:(id)a3 result:(unint64_t *)a4
{
  id v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  int v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double v17;
  char v19;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  v19 = 0;
  if (v5 && a4)
  {
    v8 = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11D98], 0, &v19);
    if (!v19)
      goto LABEL_10;
    v9 = v8;
    v10 = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11B68], 0, &v19);
    if (!v19)
      goto LABEL_10;
    v12 = v10;
    LODWORD(v11) = 0;
    objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11DB0], &v19, v11);
    if (!v19)
      goto LABEL_10;
    v14 = *(float *)&v13;
    LODWORD(v13) = 0;
    objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x24BE11DA0], &v19, v13);
    if (v19
      && (v16 = v15, objc_msgSend(v6, "cmi_doubleValueForKey:defaultValue:found:", *MEMORY[0x24BE11C60], &v19, 0.0), v19))
    {
      v7 = 0;
      *a4 = (unint64_t)(v17
                             * 1000000.0
                             * (float)((float)((float)((float)((float)v9 * 0.0039062) * (float)((float)v12 * 0.0039062))
                                             * v14)
                                     * v16));
    }
    else
    {
LABEL_10:
      v7 = FigSignalErrorAt();
    }
  }

  return v7;
}

- (int)calculateInternalAWBMetadataForMIWB:(float)a3 bGain:(float)a4 rSkinGain:(float)a5 bSkinGain:(float)a6 cct:(float)a7 internalMetadata:(id)a8
{
  unsigned int v8;
  unsigned int v9;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  int v31;
  unsigned __int16 v33;
  unsigned __int16 v34;
  sCSensorCalGain v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v16 = a8;
  v39 = 0;
  v40[0] = 0;
  v38 = 0.0;
  v36 = 0;
  v37 = 0;
  v35 = 0;
  v34 = 4096;
  v33 = 4096;
  CAWBAFE::GetSensorCalGain(self->_AWBAlgorithmObj, &v35);
  CAWBAFE::GetNewCSensorCalGains(self->_AWBAlgorithmObj, &v34, &v33, a7, &v35);
  LOWORD(v9) = v34;
  LOWORD(v8) = v33;
  CAWBAFE::ComputeHistWPFromChannelGains(self->_AWBAlgorithmObj, a3, a4, (float *)v40, (float *)v40 + 1, v17, v18);
  LODWORD(v19) = 4.0;
  *(float *)&v20 = (float)v9;
  v21 = (float)((float)(float)(a5 * 4096.0) * 4.0) / (float)v9;
  v22 = (float)((float)(float)(a6 * 4096.0) * 4.0) / (float)v8;
  CAWBAFE::ComputeHistWPFromChannelGains(self->_AWBAlgorithmObj, v21, v22, (float *)&v39, (float *)&v39 + 1, v19, v20);
  CAWBAFE::GetDaylightScore(self->_AWBAlgorithmObj, (float *)&v36);
  CAWBAFE::CalculateSkyWhitePoint(self->_AWBAlgorithmObj, a7, (float *)v40, (float *)&v37);
  CAWBAFE::CalculateSkinWeightForSTF(self->_AWBAlgorithmObj, 0, (float *)v40, (float *)&v39, (float *)&v36 + 1);
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(float)((float)(v21 * 4096.0) + 0.5));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("MIWBSkinNonComboRGain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(float)((float)(v22 * 4096.0) + 0.5));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("MIWBSkinNonComboBGain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(float)((float)(*(float *)&v37 * 4096.0) + 0.5));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("MIWBSkyRGain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(float)((float)(v38 * 4096.0) + 0.5));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("MIWBSkyBGain"));

    LODWORD(v27) = HIDWORD(v36);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, CFSTR("MIWBSkinWeight"));

    LODWORD(v29) = v36;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("DaylightScore"));

    v31 = 0;
  }
  else
  {
    v31 = FigSignalErrorAt();
  }

  return v31;
}

- (int)translateAWBGainsToSecondaryChannelID:(unsigned int)a3[3] secondaryChannelID:(unsigned int)a4 secondaryConfig:(SensorConfigAWBParams *)a5 secondaryAWBParams:(sSlaveCameraAWBParam *)a6
{
  CAWBAFE *AWBAlgorithmObj;

  AWBAlgorithmObj = self->_AWBAlgorithmObj;
  if (!AWBAlgorithmObj)
    return FigSignalErrorAt();
  (*((void (**)(CAWBAFE *, unsigned int *__attribute__((__org_arrdim(0,3))), _QWORD, SensorConfigAWBParams *, sSlaveCameraAWBParam *, _QWORD))AWBAlgorithmObj->var0
   + 5))(AWBAlgorithmObj, a3, a4, a5, a6, 0);
  return 0;
}

- (int)encodeSetFileIDForModuleConfig:(id)a3 setFileID:(unsigned int *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v14;

  v5 = a3;
  v14 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SetFile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Origin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setScanLocation:", 0);
      objc_msgSend(v9, "scanHexInt:", (char *)&v14 + 4);
      objc_msgSend(v9, "setScanLocation:", objc_msgSend(v7, "rangeOfString:", CFSTR("_")) + 1);
      objc_msgSend(v9, "scanHexInt:", &v14);
      v10 = BYTE1(v14) << 8;
      LODWORD(v14) = v10;
      if (a4)
      {
        v11 = 0;
        *a4 = (HIDWORD(v14) >> 8) | (v10 << 8) | (BYTE4(v14) << 8);
      }
      else
      {
        v11 = FigSignalErrorAt();
      }
      v12 = v9;
    }
    else
    {
      v11 = FigSignalErrorAt();
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    v11 = FigSignalErrorAt();
  }

  return v11;
}

- (int)initTuningParameters:(id)a3
{
  id v4;
  _DWORD *v5;
  void *v6;
  BOOL v7;
  int *v8;
  BOOL v9;
  int *v10;
  unsigned int v11;
  const sWPStableZoneControlTable *v12;
  int v13;
  int v15;

  v4 = a3;
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11D08]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE11A38]) & 1) != 0
      || (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE11A40]) & 1) != 0
      || (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE11A48]) & 1) != 0)
    {
      v7 = 0;
      v8 = &lowLightWPBlendingTuningTable_RFCDefault;
      v9 = 1;
      v10 = &ccmStrengthTuningTable_RFCDefault;
      v11 = 16;
      v12 = (const sWPStableZoneControlTable *)&wpStableZoneControlTable_RFCDefault;
LABEL_8:
      CAWBAFE::SetFDAWBEnable(self->_AWBAlgorithmObj, 1);
      CAWBAFE::SetSpatialCCMEnable(self->_AWBAlgorithmObj, v7);
      CAWBAFE::SetFlickerAWBEnable(self->_AWBAlgorithmObj, v9);
      CAWBAFE::SetUnlockWPEnable(self->_AWBAlgorithmObj, 1);
      CAWBAFE::SetLowLightWPBlending(self->_AWBAlgorithmObj, *v8, (const unsigned int *)v8 + 1, (const unsigned int *)v8 + 9);
      CAWBAFE::SetCCMStrengthTuningTable(self->_AWBAlgorithmObj, *v10, (const unsigned int *)v10 + 1, (const unsigned int *)v10 + 9);
      CAWBAFE::SetCCMDesatForSkinEnable(self->_AWBAlgorithmObj, v9, v11);
      CAWBAFE::SetFaceMaskDetectionEnable(self->_AWBAlgorithmObj, 1);
      CAWBAFE::SetWPStableZoneControl(self->_AWBAlgorithmObj, v7, v12);
      CAWBAFE::SetFDAWBVersion((int32x2_t *)self->_AWBAlgorithmObj, 1u);
      v13 = 0;
      goto LABEL_9;
    }
    if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE11A50]) & 1) != 0
      || (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE11A58]) & 1) != 0)
    {
      v11 = 0;
      v9 = 0;
      v7 = 1;
      v8 = &lowLightWPBlendingTuningTable_FFCDefault;
      v10 = &ccmStrengthTuningTable_FFCDefault;
      v12 = (const sWPStableZoneControlTable *)&wpStableZoneControlTable_FFCDefault;
      goto LABEL_8;
    }
    v15 = FigSignalErrorAt();
  }
  else
  {
    v6 = 0;
    v15 = FigSignalErrorAt();
  }
  v13 = v15;
LABEL_9:
  if (*v5 == 1)
    kdebug_trace();

  return v13;
}

- (int)configFaceMetadata:(id)a3 awbParams:(id)a4
{
  unint64_t v4;
  unint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  double *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double x;
  double width;
  double v31;
  double v32;
  double height;
  double y;
  float v35;
  float v36;
  int v37;
  void *v38;
  void *v39;
  _DWORD *v40;
  float v41;
  void *v42;
  void *v43;
  __int16 v44;
  _QWORD *v45;
  unsigned int *v46;
  int v47;
  __int16 v48;
  void *v49;
  CAWBAFE *AWBAlgorithmObj;
  BOOL v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  void *v59;
  float v60;
  float v61;
  void *v62;
  void *v63;
  float v64;
  float v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  float v78;
  float v79;
  void *v80;
  void *v81;
  float v82;
  float v83;
  void *v84;
  int v85;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const __CFDictionary *v93;
  const __CFDictionary *dict;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  __int128 v101[3];
  CGRect v102;
  CGRect rect;
  _QWORD __src[192];
  CGRect v105;
  CGRect v106;

  __src[190] = *MEMORY[0x24BDAC8D0];
  v96 = a3;
  v8 = a4;
  memset(v101, 0, 44);
  bzero(__src, 0x5F0uLL);
  v92 = v8;
  objc_msgSend(v8, "validRectInBufferCoords");
  dict = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regionOfInterestRectInBufferCoords");
  v93 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "faceAssistedBehaviorMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    FigSignalErrorAt();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v9, "intValue"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  if (!objc_msgSend(v96, "count"))
  {
    v49 = 0;
    v85 = FigSignalErrorAt();
    v98 = 0;
    v99 = 0;
    v97 = 0;
    goto LABEL_73;
  }
  objc_msgSend(v96, "objectForKeyedSubscript:", *MEMORY[0x24BE11D30]);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "objectForKeyedSubscript:", *MEMORY[0x24BE11D28]);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sMetaData.sensorWidth = objc_msgSend(v97, "intValue");
  self->_sMetaData.sensorHeight = objc_msgSend(v98, "intValue");
  objc_msgSend(v96, "objectForKeyedSubscript:", *MEMORY[0x24BE11C30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v10;
  if (v10
    && (objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE11B48]),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v91 = v11;
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE11B50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && objc_msgSend(v13, "count"))
      {
        v15 = 0;
        v90 = *MEMORY[0x24BE11D50];
        v89 = *MEMORY[0x24BE11BE0];
        v88 = *MEMORY[0x24BE11C80];
        v87 = *MEMORY[0x24BE11C70];
        v16 = (double *)MEMORY[0x24BDBF070];
        while (1)
        {
          v17 = objc_msgSend(v14, "count");
          v18 = 10;
          if (v17 < 0xA)
            v18 = v17;
          if (v18 <= v15)
            goto LABEL_39;
          v100 = 0;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
            break;
          objc_msgSend(v19, "cmi_cgRectForKey:defaultValue:found:", v90, &v100, *v16, v16[1], v16[2], v16[3]);
          if (!v100)
          {
            v85 = 0;
            goto LABEL_79;
          }
          v25 = v21;
          v26 = v22;
          v27 = v23;
          v28 = v24;
          LODWORD(v4) = self->_sMetaData.sensorHeight;
          LODWORD(v5) = self->_sMetaData.sensorWidth;
          if (!CGRectMakeWithDictionaryRepresentation(dict, &rect))
            goto LABEL_84;
          x = v25 * (double)v5;
          width = v27 * (double)v5;
          v31 = v26 * (double)v4 - rect.origin.y;
          v32 = -0.0;
          if (v31 < 0.0)
            v32 = v26 * (double)v4 - rect.origin.y;
          height = v28 * (double)v4 + v32;
          if (v31 >= 0.0)
            y = v26 * (double)v4 - rect.origin.y;
          else
            y = 0.0;
          if (v93)
          {
            if (!CGRectMakeWithDictionaryRepresentation(v93, &v102))
              goto LABEL_84;
            if (CGRectContainsRect(rect, v102))
            {
              v105.origin.x = x;
              v105.origin.y = y;
              v105.size.width = width;
              v105.size.height = height;
              v106 = CGRectIntersection(v105, v102);
              x = v106.origin.x;
              y = v106.origin.y;
              width = v106.size.width;
              height = v106.size.height;
            }
            else
            {
              FigSignalErrorAt();
            }
          }
          if (-[NSNumber intValue](self->_digitalFlash, "intValue"))
            v37 = 5000;
          else
            v37 = 50000;
          v35 = width;
          v36 = height;
          if (v37 >= (int)(float)(v36 * v35))
          {

LABEL_39:
            DWORD2(v101[1]) = v15;
            goto LABEL_40;
          }
          objc_msgSend(v20, "objectForKeyedSubscript:", v89);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (!v38)
          {
LABEL_84:
            v85 = FigSignalErrorAt();

LABEL_85:
LABEL_71:

            v49 = v91;
            goto LABEL_73;
          }
          v40 = &__src[19 * v15];
          *v40 = (int)x;
          v40[1] = (int)y;
          v40[2] = width;
          v40[3] = height;
          objc_msgSend(v38, "floatValue");
          LODWORD(__src[19 * v15 + 11]) = v41;

          objc_msgSend(v20, "objectForKeyedSubscript:", v88);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v87);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42
            || (v44 = objc_msgSend(v42, "unsignedIntValue"),
                v45 = &__src[19 * v15],
                v47 = *((_DWORD *)v45 + 29),
                v46 = (unsigned int *)v45 + 29,
                *v46 = v47 & 0xFFFFFC00 | v44 & 0x3FF,
                DWORD1(v101[2]) = DWORD1(v101[2]) & 0xFFFFE007 | (8 * (v44 & 0x3FF)),
                !v43))
          {

            v85 = 0;
            goto LABEL_85;
          }
          v48 = objc_msgSend(v43, "unsignedIntValue");
          *v46 = *v46 & 0xFFF003FF | ((v48 & 0x3FF) << 10);
          LODWORD(v101[2]) = 0;
          DWORD1(v101[2]) = DWORD1(v101[2]) & 0xFF801FFF | ((v48 & 0x3FF) << 13);

          ++v15;
        }
        v85 = FigSignalErrorAt();
LABEL_79:

        goto LABEL_85;
      }
    }
    else
    {
      v14 = 0;
    }
LABEL_40:

    v49 = v91;
  }
  else
  {
    v49 = 0;
  }
  LODWORD(v101[1]) = objc_msgSend(v97, "intValue");
  DWORD1(v101[1]) = objc_msgSend(v98, "intValue");
  LODWORD(v101[0]) = 0;
  if (CAWBAFE::GetFDAWBEnable(self->_AWBAlgorithmObj))
  {
    if (DWORD2(v101[1]))
      CAWBAFE::SetFaceData((uint64_t)self->_AWBAlgorithmObj, v101, __src);
    AWBAlgorithmObj = self->_AWBAlgorithmObj;
    v51 = -[NSNumber intValue](self->_digitalFlash, "intValue") != 1
       && CAWBAFE::GetFDAWBVersion(self->_AWBAlgorithmObj) == 1;
    CAWBAFE::SetSemanticAWBEnable(AWBAlgorithmObj, v51);
    if (!DWORD2(v101[1]) && CAWBAFE::GetFDAWBVersion(self->_AWBAlgorithmObj) != 1)
      CAWBAFE::SetFDAWBEnable(self->_AWBAlgorithmObj, 0);
  }
  if (objc_msgSend(v95, "intValue") == 3)
  {
    objc_msgSend(v92, "faceAssistedSkinGainsToMatch");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v52;
    if (v52 && objc_msgSend(v52, "count"))
    {
      rect.origin.x = 0.0;
      v102.origin.x = 0.0;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpRgLogRatio"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53 == 0;

      if (v54)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpRgLogRatio"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "floatValue");
      v57 = v56;
      *(float *)&rect.origin.x = v56;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpBgLogRatio"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v55) = v58 == 0;

      if ((_DWORD)v55)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpBgLogRatio"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "floatValue");
      v61 = v60;
      *((float *)&rect.origin.x + 1) = v60;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpSkinRgLogRatio"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v59) = v62 == 0;

      if ((_DWORD)v59)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpSkinRgLogRatio"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "floatValue");
      v65 = v64;
      *(float *)&v102.origin.x = v64;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpSkinBgLogRatio"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v63) = v66 == 0;

      if ((_DWORD)v63)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("wpSkinBgLogRatio"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "floatValue");
      v69 = v68;
      *((float *)&v102.origin.x + 1) = v68;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("continuousFDTimes"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = v70 == 0;

      if ((_DWORD)v67)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("continuousFDTimes"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "intValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("skinColorSampleNum"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v71) = v73 == 0;

      if ((_DWORD)v71)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("skinColorSampleNum"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "intValue");

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("skinColorSampleVariance"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v74) = v76 == 0;

      if ((_DWORD)v74)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("skinColorSampleVariance"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "floatValue");
      v79 = v78;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("minDistSkinToWhiteMapping"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v77) = v80 == 0;

      if ((_DWORD)v77)
        FigSignalErrorAt();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("minDistSkinToWhiteMapping"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "floatValue");
      v83 = v82;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("wbLogRatios=[%.3f, %.3f], wbSkinLogRatios=[%.3f, %.3f], continuousFDTimes=%d, skinColorSampleNum=%d"), v57, v61, v65, v69, v72, v75);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      CAWBAFE::SetFaceAssistedAWBResultsForMatchProvidedSkinGains(self->_AWBAlgorithmObj, (float *)&rect, (float *)&v102, v75, v72, v79, v83);

      v85 = 0;
    }
    else
    {
      v85 = FigSignalErrorAt();
    }
    v91 = v49;
    goto LABEL_71;
  }
  v85 = 0;
LABEL_73:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v85;
}

uint64_t __45__AWBAlgorithm_configFaceMetadata_awbParams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  float v8;
  float v9;
  uint64_t v10;
  CGRect v12;
  CGRect rect;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("Rect"));
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = 0;
LABEL_10:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "valueForKey:", CFSTR("Rect"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !CGRectMakeWithDictionaryRepresentation(v6, &rect) || !CGRectMakeWithDictionaryRepresentation(v7, &v12))
    goto LABEL_10;
  v8 = rect.size.width * rect.size.height;
  v9 = v12.size.width * v12.size.height;
  if (v8 <= v9)
    v10 = 1;
  else
    v10 = -1;
LABEL_8:

  return v10;
}

- (int)configFlickerDetectionMetadata:(id)a3 moduleConfig:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _WORD *v11;
  unsigned int i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  int v38;
  int v39;
  void *v41;
  id v42;
  id v43;

  v42 = a3;
  v43 = a4;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x24BE11D00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11DD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    self->_flickerDetectionStatus = objc_msgSend(v7, "intValue");
  if (v43)
  {
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v39 = FigSignalErrorAt();
      goto LABEL_27;
    }
    v41 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DaylightProjectionPoint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = malloc_type_malloc(4 * objc_msgSend(v10, "count"), 0x100004052888210uLL);
    if (!v11)
    {
      v39 = FigSignalErrorAt();

      goto LABEL_27;
    }
    for (i = 0; objc_msgSend(v10, "count") > (unint64_t)i; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("X"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2 * i] = objc_msgSend(v14, "intValue");

      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Y"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2 * i + 1] = objc_msgSend(v16, "intValue");

    }
    CAWBAFE::SetDaylightProjectionPoint((uint64_t)self->_AWBAlgorithmObj, objc_msgSend(v10, "count"), v11);
    free(v11);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11DD0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "doubleValue");
    self->_flickerDetectionIRRatio = vcvtd_n_s64_f64(v20, 0x10uLL);
    v21 = v19;
  }
  else
  {
    v21 = 0;
  }
  v22 = *MEMORY[0x24BE11DC0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11DC0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndex:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BE11DB8];
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BE11DB8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(int)objc_msgSend(v26, "intValue"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flickerConfidence[0] = objc_msgSend(v27, "intValue");

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndex:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(int)objc_msgSend(v30, "intValue"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flickerConfidence[1] = objc_msgSend(v31, "intValue");

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE11DC8]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v32, "doubleValue");
    objc_msgSend(v33, "numberWithDouble:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    *(float *)&v35 = v35;
    self->_photometerAWBDebug_externalLux = *(float *)&v35;

  }
  if (CAWBAFE::GetFlickerAWBEnable(self->_AWBAlgorithmObj))
  {
    v38 = 3;
    do
    {
      if (v38 != 3)
        CAWBAFE::updatePhotometerDetectionOutput(self->_AWBAlgorithmObj, &self->_sMetaData.ae);
      LODWORD(v36) = 0;
      LODWORD(v37) = 0;
      CAWBAFE::SetFlickerDetectionResult((uint64_t)self->_AWBAlgorithmObj, self->_flickerDetectionStatus, v36, v37, self->_photometerAWBDebug_externalLux, 0, self->_flickerDetectionIRRatio, self->_flickerConfidence[0], 0, self->_flickerConfidence[1], 1);
      --v38;
    }
    while (v38);
  }
  v39 = 0;
  v8 = v32;
LABEL_27:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v39;
}

- (int)configFlashRFCMetadata:(id)a3 cameraInfo:(id)a4 moduleConfig:(id)a5
{
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  sPerModuleLEDCalibData *p_pmLEDCalibData;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _BYTE *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _DWORD *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  float v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  _DWORD v100[18];
  int v101;
  _BYTE v102[260];

  v99 = a3;
  v96 = a4;
  v97 = a5;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x24BE11C98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
  {
    v98 = 0;
    v20 = 0;
    v21 = 0;
    goto LABEL_49;
  }
  self->_isNominalStrobe = 1;
  objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x24BE11D80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x24BE11D88]);
  v11 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v11;
  v95 = v10;
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(v10, "floatValue");
    v14 = v13;
    objc_msgSend(v94, "floatValue");
    self->_flashRatio = 1.0 - (float)(v14 / v15);
  }
  if (v96)
  {
    objc_msgSend(v96, "objectForKeyedSubscript:", *MEMORY[0x24BE11DE0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    p_pmLEDCalibData = &self->_pmLEDCalibData;
    if (v16)
    {
      v98 = objc_retainAutorelease(v16);
      v18 = objc_msgSend(v98, "bytes");
      self->_pmLEDCalibData.isvalid = 1;
      self->_ledType = 10;
      v19 = *(_DWORD *)v18;
      if (*(_DWORD *)v18)
      {
        if (v19 == 1)
        {
          self->_pmLEDCalibData.programID = 0;
          p_pmLEDCalibData->version = 3;
          self->_pmLEDCalibData.ledWidePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledWidePtrn_bg = *(float *)(v18 + 8);
        }
        else
        {
          if (v19 != 2)
          {
            v71 = 0;
            v91 = 0;
            v73 = 0;
            v90 = -1;
            goto LABEL_66;
          }
          self->_pmLEDCalibData.programID = 1;
          p_pmLEDCalibData->version = 3;
          self->_pmLEDCalibData.ledWidePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledWidePtrn_bg = *(float *)(v18 + 8);
          self->_pmLEDCalibData.ledTelePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledTelePtrn_bg = *(float *)(v18 + 8);
          self->_pmLEDCalibData.ledSWidePtrn_rg = *(float *)(v18 + 4);
          self->_pmLEDCalibData.ledSWidePtrn_bg = *(float *)(v18 + 8);
        }
      }
      else
      {
        p_pmLEDCalibData->version = 2;
        self->_pmLEDCalibData.cw_rg = *(float *)(v18 + 4);
        self->_pmLEDCalibData.cw_bg = *(float *)(v18 + 8);
        self->_pmLEDCalibData.ww_rg = *(float *)(v18 + 12);
        self->_pmLEDCalibData.ww_bg = *(float *)(v18 + 16);
      }
    }
    else
    {
      v98 = 0;
      self->_pmLEDCalibData.isvalid = 0;
    }
  }
  else
  {
    v98 = 0;
  }
  if (!v97)
  {
LABEL_48:
    v21 = v94;
    v20 = v95;
LABEL_49:
    objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x24BE11D98]);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (!v70)
    {
      v90 = FigSignalErrorAt();
      v94 = v21;
      v95 = v20;
      v91 = 0;
      v73 = 0;
      goto LABEL_66;
    }
    self->_sMetaData.ae.gainDigiAE = vcvtms_s32_f32((float)(int)objc_msgSend(v70, "intValue") / 1.0159);
    objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x24BE11C68]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72)
    {
      objc_msgSend(v72, "floatValue");
      v75 = v74 * 256.0;
    }
    else
    {
      v75 = 1.0;
    }
    self->_sMetaData.ae.ev0Ratio = (int)v75;
    if (v97)
    {
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("Exposure"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("LuxModel"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("Scale"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v78)
        goto LABEL_73;
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("Exposure"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("LuxModel"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("Scale"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      self->_sMetaData.ae.luxCalcParams.scale = objc_msgSend(v81, "intValue");

      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("Exposure"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("LuxModel"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("ScaleShift"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v84)
      {
LABEL_73:
        v91 = 0;
        v90 = FigSignalErrorAt();
LABEL_61:
        v94 = v21;
        v95 = v20;
        goto LABEL_66;
      }
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("Exposure"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("LuxModel"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("ScaleShift"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      self->_sMetaData.ae.luxCalcParams.scaleShift = objc_msgSend(v87, "intValue");

    }
    self->_sMetaData.ae.overflowDGain = 256;
    if (v96)
    {
      objc_msgSend(v96, "objectForKeyedSubscript:", *MEMORY[0x24BE11DE8]);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v88;
      if (v88)
      {
        v90 = 0;
        self->_sensorClockFreqHz = (float)objc_msgSend(v88, "unsignedIntValue");
        v94 = v21;
        v95 = v20;
        v91 = v89;
        goto LABEL_66;
      }
    }
    v91 = 0;
    v90 = 0;
    goto LABEL_61;
  }
  objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v22;
  if (v22)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Flash"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Projection"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    while (1)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MatrixRGBToXYZ"), v93);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        break;
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MatrixRGBToXYZ"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v100[v25] = objc_msgSend(v29, "intValue");

      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MatrixXYZToRGB"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        break;
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MatrixXYZToRGB"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v100[v25 + 9] = objc_msgSend(v33, "intValue");

      if (++v25 == 9)
      {
        v34 = 0;
        v35 = &v101;
LABEL_27:
        v36 = 0;
        while (1)
        {
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MatrixRGBToXYZ"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
            goto LABEL_62;
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CCMModel"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndexedSubscript:", v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectAtIndexedSubscript:", v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v35[v36] = objc_msgSend(v41, "intValue");

          if (++v36 == 5)
          {
            ++v34;
            v35 += 5;
            if (v34 != 6)
              goto LABEL_27;
            v42 = 0;
            v43 = v102;
LABEL_32:
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("BoundingEllipsesModel"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectAtIndexedSubscript:", v42);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              v46 = 0;
              while (1)
              {
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("BoundingEllipsesModel"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectAtIndexedSubscript:", v42);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectAtIndexedSubscript:", v46);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v49)
                  break;
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("BoundingEllipsesModel"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectAtIndexedSubscript:", v42);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectAtIndexedSubscript:", v46);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)&v43[4 * v46] = objc_msgSend(v52, "intValue");

                if (++v46 == 6)
                {
                  ++v42;
                  v43 += 24;
                  if (v42 != 6)
                    goto LABEL_32;
                  v53 = 0;
                  v54 = v100;
                  do
                  {
                    objc_msgSend(&unk_24FECE330, "objectAtIndexedSubscript:", v53);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKeyedSubscript:", v55);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v56)
                    {
LABEL_63:
                      v90 = FigSignalErrorAt();

                      goto LABEL_64;
                    }
                    v57 = 0;
                    *(_WORD *)&v102[26 * v53 + 144] = objc_msgSend(v56, "count");
                    while (objc_msgSend(v56, "count") > v57)
                    {
                      objc_msgSend(v56, "objectAtIndexedSubscript:", v57);
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Index"));
                      v59 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v59)
                        goto LABEL_63;
                      objc_msgSend(v56, "objectAtIndexedSubscript:", v57);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("Index"));
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      *((_WORD *)v54 + v57 + 169) = objc_msgSend(v61, "intValue");

                      objc_msgSend(v56, "objectAtIndexedSubscript:", v57);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("Weight"));
                      v63 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v63)
                        goto LABEL_63;
                      objc_msgSend(v56, "objectAtIndexedSubscript:", v57);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("Weight"));
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      *((_WORD *)v54 + v57 + 175) = objc_msgSend(v65, "intValue");

                      ++v57;
                    }

                    ++v53;
                    v54 = (_DWORD *)((char *)v54 + 26);
                  }
                  while (v53 != 4);
                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("UseQuantileLuxLevels"));
                  v66 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v66)
                  {
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("UseQuantileLuxLevels"));
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v102[248] = objc_msgSend(v67, "intValue");

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("UseFlashCCMMixing"));
                    v68 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v68)
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("UseFlashCCMMixing"));
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v102[249] = objc_msgSend(v69, "intValue");

                      CAWBAFE::SetFlashProjectionConfig((uint64_t)self->_AWBAlgorithmObj, (unsigned __int8 *)v100);
                      goto LABEL_48;
                    }
                  }
                  goto LABEL_62;
                }
              }
            }
            goto LABEL_62;
          }
        }
      }
    }
LABEL_62:
    v90 = FigSignalErrorAt();
LABEL_64:

  }
  else
  {
    v90 = FigSignalErrorAt();
  }
  v71 = 0;
  v91 = 0;
  v73 = 0;
LABEL_66:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v90;
}

- (int)configFallbackMetadata:(id)a3
{
  id v4;
  _DWORD *v5;
  $F808423425063C3F71C747EB2583A3A7 *p_fallbackGains;
  NSNumber *v7;
  NSNumber *awbRGain;
  NSNumber *v9;
  NSNumber *awbGGain;
  NSNumber *v11;
  NSNumber *awbBGain;
  NSNumber *v13;
  NSNumber *awbComboRGain;
  NSNumber *v15;
  NSNumber *awbComboGGain;
  NSNumber *v17;
  NSNumber *awbComboBGain;

  v4 = a3;
  v5 = (_DWORD *)MEMORY[0x24BDC0B48];
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  p_fallbackGains = &self->_fallbackGains;
  self->_fallbackGains.validAWBData = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11BB0]);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  awbRGain = self->_fallbackGains.awbRGain;
  self->_fallbackGains.awbRGain = v7;

  if (!self->_fallbackGains.awbRGain)
    p_fallbackGains->validAWBData = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11BA8]);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  awbGGain = self->_fallbackGains.awbGGain;
  self->_fallbackGains.awbGGain = v9;

  if (!self->_fallbackGains.awbGGain)
    p_fallbackGains->validAWBData = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11B70]);
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  awbBGain = self->_fallbackGains.awbBGain;
  self->_fallbackGains.awbBGain = v11;

  if (!self->_fallbackGains.awbBGain)
    p_fallbackGains->validAWBData = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11B88]);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  awbComboRGain = self->_fallbackGains.awbComboRGain;
  self->_fallbackGains.awbComboRGain = v13;

  if (!self->_fallbackGains.awbComboRGain)
    p_fallbackGains->validAWBData = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11B80]);
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  awbComboGGain = self->_fallbackGains.awbComboGGain;
  self->_fallbackGains.awbComboGGain = v15;

  if (!self->_fallbackGains.awbComboGGain)
    p_fallbackGains->validAWBData = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11B78]);
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  awbComboBGain = self->_fallbackGains.awbComboBGain;
  self->_fallbackGains.awbComboBGain = v17;

  if (!self->_fallbackGains.awbComboBGain)
    p_fallbackGains->validAWBData = 0;
  if (*v5 == 1)
    kdebug_trace();

  return 0;
}

- (int)configPortTypeMetadata:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE11D08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE11A50]) & 1) != 0
    || objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE11A58]))
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE11A40]))
  {
    v6 = 4;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE11A48]))
    {
      self->_sMetaData.channel = 0;
      goto LABEL_5;
    }
    v6 = 1;
  }
  self->_sMetaData.channel = v6;
LABEL_5:

  return 0;
}

+ (int)doAWBConfigLoad:(id)a3 to:(id)a4
{
  int v5;
  void *v6;
  void *v7;
  _WORD *v8;
  unsigned int i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t k;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  signed __int16 *var2;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t m;
  void *v35;
  void *v36;
  uint64_t n;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _WORD *v45;
  unsigned int ii;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _WORD *v52;
  unsigned int jj;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _WORD *v60;
  unsigned int kk;
  uint64_t v62;
  void *v63;
  void *v64;
  _WORD *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  __int16 *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _WORD *v88;
  unsigned int mm;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t nn;
  void *v100;
  void *v101;
  uint64_t i1;
  void *v103;
  uint64_t v104;
  char v105;
  char v106;
  void *v107;
  uint64_t v108;
  char v109;
  char v110;
  void *v111;
  void *v112;
  uint64_t i2;
  void *v114;
  void *v115;
  uint64_t i3;
  void *v117;
  void *v118;
  uint64_t i4;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  unsigned int i5;
  void *v125;
  unsigned int v126;
  BOOL v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE *v132;
  _BYTE *v133;
  void *v134;
  void *v135;
  uint64_t i6;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v142;
  id v143;
  char *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  unsigned __int16 v161[32];
  unsigned __int16 v162[4];
  unsigned __int16 v163[20];
  unsigned __int16 v164[8];
  unsigned __int16 v165[2];
  __n128 v166;
  unsigned __int16 v167[4];
  __int16 v168[9];
  __int16 v169[9];
  __int16 v170[9];
  __int16 v171[9];
  __int16 v172[9];
  __n128 v173;
  sFEStatCSCConfig v174;
  _BYTE v175[112];
  sFEStatColorHistConfig v176;
  uint64_t v177;

  v177 = *MEMORY[0x24BDAC8D0];
  v154 = a3;
  v143 = a4;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  v144 = (char *)objc_msgSend(v143, "pointerValue");
  v5 = 0;
  v142 = 0;
  if (!v154)
  {
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v158 = 0;
    v159 = 0;
    v155 = 0;
    v160 = 0;
    goto LABEL_73;
  }
  v147 = 0;
  v148 = 0;
  v149 = 0;
  v150 = 0;
  v152 = 0;
  v153 = 0;
  v145 = 0;
  v146 = 0;
  v151 = 0;
  v156 = 0;
  v157 = 0;
  v158 = 0;
  v159 = 0;
  v155 = 0;
  v160 = 0;
  if (!v144)
    goto LABEL_73;
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Histogram"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WeightMasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = v7;
  v8 = malloc_type_malloc(1026 * objc_msgSend(v7, "count"), 0x100004040BEE09CuLL);
  for (i = 0; ; i = v10 + 1)
  {
    v10 = i;
    if (objc_msgSend(v7, "count") <= (unint64_t)i)
      break;
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Lux"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)&v8[513 * i + 1];
    v8[513 * v10] = objc_msgSend(v12, "intValue");

    for (j = 0; j != 1024; ++j)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WeightMask"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", j);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(v13 + j) = objc_msgSend(v17, "intValue");

    }
  }
  CAWBAFE::SetHistogramWeight(v144, objc_msgSend(v7, "count"), (uint64_t)v8);
  free(v8);
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("CSC"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v158)
  {
    v5 = FigSignalErrorAt();
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v158 = 0;
    v159 = 0;
    v155 = 0;
    v142 = 0;
    goto LABEL_73;
  }
  for (k = 0; k != 9; ++k)
  {
    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CCMCoef"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", k);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v174.var0[k] = objc_msgSend(v20, "intValue");

    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CSCCoef"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", k);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v174.var1[k] = objc_msgSend(v22, "intValue");

  }
  v23 = 0;
  var2 = v174.var2;
  do
  {
    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CSCMax"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    var2[6] = objc_msgSend(v26, "intValue");

    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CSCMin"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    var2[3] = objc_msgSend(v28, "intValue");

    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CSCOffset"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *var2++ = objc_msgSend(v30, "intValue");

    ++v23;
  }
  while (v23 != 3);
  v174.var6 = 1;
  objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CSCChromaScale0"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v174.var5[0] = objc_msgSend(v31, "intValue");

  objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("CSCChromaScale1"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v174.var5[1] = objc_msgSend(v32, "intValue");

  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Histogram"), CAWBAFE::UpdateCSCConfig((CAWBAFE *)v144, &v174).n128_f64[0]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Config"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v153)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v153 = 0;
LABEL_81:
    v145 = 0;
    v146 = 0;
    v150 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    v159 = 0;
    v155 = 0;
    v152 = 0;
    goto LABEL_73;
  }
  for (m = 0; m != 15; ++m)
  {
    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("YThd"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", m);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v176.var0[m] = objc_msgSend(v36, "intValue");

  }
  for (n = 0; n != 16; ++n)
  {
    objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("Count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", n);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v176.var1[n] = objc_msgSend(v39, "intValue");

  }
  objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("C1Offset"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v176.var2 = objc_msgSend(v40, "intValue");

  objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("C1Scale"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v176.var3 = objc_msgSend(v41, "intValue");

  objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("C2Offset"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v176.var4 = objc_msgSend(v42, "intValue");

  objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("C2Scale"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v176.var5 = objc_msgSend(v43, "intValue");

  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("ProjectionPoint"), CAWBAFE::UpdateColorHistConfig((CAWBAFE *)v144, &v176).n128_f64[0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    goto LABEL_81;
  }
  v155 = v44;
  v45 = malloc_type_malloc(4 * objc_msgSend(v44, "count"), 0x100004052888210uLL);
  for (ii = 0; objc_msgSend(v155, "count") > (unint64_t)ii; ++ii)
  {
    objc_msgSend(v155, "objectAtIndexedSubscript:", ii);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("X"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2 * ii] = objc_msgSend(v48, "intValue");

    objc_msgSend(v155, "objectAtIndexedSubscript:", ii);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Y"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2 * ii + 1] = objc_msgSend(v50, "intValue");

  }
  CAWBAFE::SetProjectionPoint((uint64_t)v144, objc_msgSend(v155, "count"), v45);
  free(v45);
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Histogram"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("XToCCT"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v156)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v152 = 0;
    v156 = 0;
    v157 = 0;
LABEL_95:
    v159 = 0;
    goto LABEL_73;
  }
  v52 = malloc_type_malloc(6 * objc_msgSend(v156, "count"), 0x1000040274DC3F3uLL);
  for (jj = 0; objc_msgSend(v156, "count") > (unint64_t)jj; ++jj)
  {
    objc_msgSend(v156, "objectAtIndexedSubscript:", jj);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("X"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3 * jj] = objc_msgSend(v55, "intValue");

    objc_msgSend(v156, "objectAtIndexedSubscript:", jj);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("Y"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3 * jj + 1] = objc_msgSend(v57, "intValue");

    objc_msgSend(v156, "objectAtIndexedSubscript:", jj);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("CCT"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3 * jj + 2] = objc_msgSend(v59, "intValue");

  }
  CAWBAFE::SetHistogramXToCCTLut((uint64_t)v144, objc_msgSend(v156, "count"), v52);
  free(v52);
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("AWBSkinToWhiteLut"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (v152 && (unint64_t)objc_msgSend(v152, "count") <= 0x96)
  {
    v60 = malloc_type_malloc(8 * objc_msgSend(v152, "count"), 0x100004000313F17uLL);
    if (!v60)
    {
LABEL_94:
      v5 = FigSignalErrorAt();
      v142 = 0;
      v147 = 0;
      v148 = 0;
      v149 = 0;
      v150 = 0;
      v145 = 0;
      v146 = 0;
      v151 = 0;
      v157 = 0;
      goto LABEL_95;
    }
    for (kk = 0; ; kk = v62 + 1)
    {
      v62 = kk;
      if (objc_msgSend(v152, "count") <= (unint64_t)kk)
        break;
      objc_msgSend(v152, "objectAtIndexedSubscript:", kk);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("Xs"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = &v60[4 * kk];
      v65[2] = objc_msgSend(v64, "unsignedIntValue");

      objc_msgSend(v152, "objectAtIndexedSubscript:", v62);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("Xw"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *v65 = objc_msgSend(v67, "unsignedIntValue");

      objc_msgSend(v152, "objectAtIndexedSubscript:", v62);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("Ys"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v60[4 * v62 + 3] = objc_msgSend(v69, "unsignedIntValue");

      objc_msgSend(v152, "objectAtIndexedSubscript:", v62);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("Yw"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v60[4 * v62 + 1] = objc_msgSend(v71, "unsignedIntValue");

    }
    CAWBAFE::SetSkinToWhiteLut((uint64_t)v144, objc_msgSend(v152, "count"), v60);
    free(v60);
  }
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("CCM"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v159)
    goto LABEL_94;
  v72 = 0;
  v73 = v171;
  do
  {
    objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("Offset"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectAtIndexedSubscript:", v72);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(v73 - 27) = objc_msgSend(v75, "intValue");

    objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("X1stOrder"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectAtIndexedSubscript:", v72);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(v73 - 18) = objc_msgSend(v77, "intValue");

    objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("Y1stOrder"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "objectAtIndexedSubscript:", v72);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(v73 - 9) = objc_msgSend(v79, "intValue");

    objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("X2ndOrder"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "objectAtIndexedSubscript:", v72);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *v73 = objc_msgSend(v81, "intValue");

    objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("Y2ndOrder"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectAtIndexedSubscript:", v72);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v73[9] = objc_msgSend(v83, "intValue");

    objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("LuxFactor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectAtIndexedSubscript:", v72);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v73[18] = objc_msgSend(v85, "intValue");

    ++v72;
    ++v73;
  }
  while (v72 != 9);
  objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("CCMLuxClipLevel"), CAWBAFE::SetCCM2DCoefficient((CAWBAFE *)v144, v168, v169, v170, v171, v172, &v173).n128_f64[0]);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  CAWBAFE::SetCCMLuxClip((CAWBAFE *)v144, objc_msgSend(v86, "intValue"));

  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("PostTint"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v87)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    v157 = 0;
    goto LABEL_73;
  }
  v157 = v87;
  v88 = malloc_type_malloc(8 * objc_msgSend(v87, "count"), 0x100004000313F17uLL);
  for (mm = 0; objc_msgSend(v157, "count") > (unint64_t)mm; ++mm)
  {
    objc_msgSend(v157, "objectAtIndexedSubscript:", mm);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("Offset"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4 * mm] = objc_msgSend(v91, "intValue");

    objc_msgSend(v157, "objectAtIndexedSubscript:", mm);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("KEst"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4 * mm + 1] = objc_msgSend(v93, "intValue");

    objc_msgSend(v157, "objectAtIndexedSubscript:", mm);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("KHist"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4 * mm + 2] = objc_msgSend(v95, "intValue");

    objc_msgSend(v157, "objectAtIndexedSubscript:", mm);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("HClip"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4 * mm + 3] = objc_msgSend(v97, "intValue");

  }
  CAWBAFE::SetPostTintParam((uint64_t)v144, objc_msgSend(v157, "count"), v88);
  free(v88);
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("MixLighting"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("XCoordinate"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v151)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
    v145 = 0;
    v146 = 0;
    v151 = 0;
    goto LABEL_73;
  }
  for (nn = 0; nn != 3; ++nn)
  {
    objc_msgSend(v151, "objectAtIndexedSubscript:", nn);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v167[nn] = objc_msgSend(v100, "intValue");

  }
  CAWBAFE::SetMixLightingXLoc((CAWBAFE *)v144, v167);
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("MixLighting"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("CCM"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v150)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v150 = 0;
LABEL_88:
    v145 = 0;
    v146 = 0;
    goto LABEL_73;
  }
  for (i1 = 0; i1 != 9; ++i1)
  {
    objc_msgSend(v150, "objectAtIndexedSubscript:", i1);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v166.n128_u16[i1] = objc_msgSend(v103, "intValue");

  }
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("YThreshold"), CAWBAFE::SetMixLightingCCM((CAWBAFE *)v144, &v166).n128_f64[0]);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v146)
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    goto LABEL_88;
  }
  v104 = 0;
  v105 = 1;
  do
  {
    v106 = v105;
    objc_msgSend(v146, "objectAtIndexedSubscript:", v104);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v164[v104 + 8] = objc_msgSend(v107, "intValue");

    v105 = 0;
    v104 = 1;
  }
  while ((v106 & 1) != 0);
  CAWBAFE::SetTileStatsYThreshold((CAWBAFE *)v144, v165);
  objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("RatioSpace2ndGainThreshold"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  if (v145)
  {
    v108 = 0;
    v109 = 1;
    do
    {
      v110 = v109;
      objc_msgSend(v145, "objectAtIndexedSubscript:", v108);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v163[v108 + 20] = objc_msgSend(v111, "intValue");

      v109 = 0;
      v108 = 1;
    }
    while ((v110 & 1) != 0);
    CAWBAFE::SetRatioSpace2ndGainThreshold((CAWBAFE *)v144, v164);
    objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Histogram"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("TrimFilterV"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (v149)
    {
      for (i2 = 0; i2 != 13; ++i2)
      {
        objc_msgSend(v149, "objectAtIndexedSubscript:", i2);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v163[i2] = objc_msgSend(v114, "intValue");

      }
      objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Histogram"), CAWBAFE::SetHistogramTrimFilterV((CAWBAFE *)v144, v163).n128_f64[0]);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("TrimFilterH"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();

      if (v148)
      {
        for (i3 = 0; i3 != 3; ++i3)
        {
          objc_msgSend(v148, "objectAtIndexedSubscript:", i3);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v162[i3] = objc_msgSend(v117, "intValue");

        }
        CAWBAFE::SetHistogramTrimFilterH((CAWBAFE *)v144, v162);
        objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Histogram"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("TrimScaleProfile"));
        v147 = (void *)objc_claimAutoreleasedReturnValue();

        if (v147)
        {
          for (i4 = 0; i4 != 32; ++i4)
          {
            objc_msgSend(v147, "objectAtIndexedSubscript:", i4);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v161[i4] = objc_msgSend(v120, "intValue");

          }
          objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("Scheme"), CAWBAFE::SetHistogramTrimScaleProfile((CAWBAFE *)v144, v161).n128_f64[0]);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = v121;
          if (v121)
          {
            CAWBAFE::SetScheme((uint64_t)v144, objc_msgSend(v121, "isEqualToString:", CFSTR("2DHistogram")));
            v142 = v122;
            objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("ColorMatchingModel"));
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "count");

            for (i5 = 0; ; i5 = v126 + 1)
            {
              objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("ColorMatchingModel"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v126 = i5;
              v127 = objc_msgSend(v125, "count") > (unint64_t)i5;

              if (!v127)
              {
                objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("ColorMatchingModel"));
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(char *, uint64_t, _BYTE *))(*(_QWORD *)v144 + 144))(v144, objc_msgSend(v140, "count"), v175);

                v5 = 0;
                goto LABEL_73;
              }
              objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("ColorMatchingModel"));
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "objectAtIndexedSubscript:", i5);
              v129 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v129)
                break;
              v130 = 0;
              v131 = 28 * i5;
              v132 = &v175[v131 + 4];
              v133 = &v175[v131 + 16];
              do
              {
                objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("BGGainMatchingModel"));
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v134, "objectAtIndexedSubscript:", v130);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)&v133[4 * v130] = objc_msgSend(v135, "intValue");

                ++v130;
              }
              while (v130 != 3);
              for (i6 = 0; i6 != 3; ++i6)
              {
                objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("RGGainMatchingModel"));
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "objectAtIndexedSubscript:", i6);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)&v132[4 * i6] = objc_msgSend(v138, "intValue");

              }
              objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("SlaveCameraID"));
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)&v175[28 * v126] = objc_msgSend(v139, "intValue");

            }
            v5 = FigSignalErrorAt();
          }
          else
          {
            v5 = FigSignalErrorAt();
            v142 = 0;
          }
        }
        else
        {
          v5 = FigSignalErrorAt();
          v142 = 0;
          v147 = 0;
        }
      }
      else
      {
        v5 = FigSignalErrorAt();
        v142 = 0;
        v147 = 0;
        v148 = 0;
      }
    }
    else
    {
      v5 = FigSignalErrorAt();
      v142 = 0;
      v147 = 0;
      v148 = 0;
      v149 = 0;
    }
  }
  else
  {
    v5 = FigSignalErrorAt();
    v142 = 0;
    v147 = 0;
    v148 = 0;
    v149 = 0;
    v145 = 0;
  }
LABEL_73:
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();

  return v5;
}

- (int)awbConfigLoad:(id)a3 to:(CAWBAFE *)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  if (v5 && a4)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[AWBAlgorithm doAWBConfigLoad:to:](AWBAlgorithm, "doAWBConfigLoad:to:", v5, v6);

  }
  else
  {
    v7 = FigSignalErrorAt();
  }

  return v7;
}

- (int)process
{
  uint64_t v2;
  int v3;
  int v4;
  float32x2_t v5;
  uint32x2_t v6;
  int32x2_t v7;
  uint32x2_t v8;
  int32x2_t v9;
  id v10;
  _DWORD *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  CAWBAFE *v21;
  id v22;
  _TILE_Stat_Elem *v23;
  id v24;
  _AEAWB_Stat_Elem *v25;
  id v26;
  unsigned __int16 v27;
  void *v28;
  BOOL v29;
  void *v30;
  BOOL v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  __int128 v50;
  unsigned int v51;
  unsigned int v52;
  unsigned __int16 v53;
  int v54;
  unsigned __int16 *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  int v59;
  char *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  void *v130;
  int v131;
  void *v132;
  int v133;
  void *v134;
  int v135;
  void *v136;
  int v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  int v143;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  int v150[2];
  _OWORD v151[3];
  int v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  sCIspFDRect v156;
  unsigned __int16 v157[4];
  uint64_t v158;
  uint64_t v159;
  _BYTE v160[36];
  _BYTE v161[36];
  _BYTE v162[36];
  int v163;
  int32x2_t v164;
  char v165;
  __int16 v166;
  char v167;
  unsigned __int16 v168;
  unsigned __int16 v169;
  __int16 v170;
  __int16 v171;
  __int16 v172;
  __int16 v173;
  __int16 v174;
  __int16 v175;
  uint64_t v176;
  uint64_t v177;

  v2 = MEMORY[0x24BDAC7A8](self);
  v177 = *MEMORY[0x24BDAC8D0];
  memset(v157, 0, 6);
  *(_QWORD *)(v2 + 5104) = 0;
  *(_QWORD *)(v2 + 5120) = 0;
  *(_QWORD *)(v2 + 5112) = 0;
  *(_QWORD *)&v156.x = 0;
  *(_QWORD *)&v156.width = 0;
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  bzero(v162, 0x4D10uLL);
  v170 = *(_DWORD *)(v2 + 5056);
  v171 = *(_DWORD *)(v2 + 5060);
  v167 = 1;
  v3 = *(_DWORD *)(v2 + 5064);
  v174 = v3;
  v4 = *(_DWORD *)(v2 + 5068);
  v175 = v4;
  v163 = v4 + (v3 << 16);
  v165 = 1;
  if (CAWBAFE::GetLargestFaceRect(*(CAWBAFE **)(v2 + 16), &v156))
  {
    v166 = 257;
    v5 = vcvt_f32_s32(*(int32x2_t *)&v156.width);
    v6 = (uint32x2_t)vcvt_s32_f32(vmul_f32(v5, (float32x2_t)0x3ECCCCCD3F19999ALL));
    v7 = vsra_n_s32((int32x2_t)0x300000003, (int32x2_t)vsra_n_u32(v6, v6, 0x1FuLL), 1uLL);
    v8 = (uint32x2_t)vcvt_s32_f32(vmul_f32(v5, (float32x2_t)0x3F19999A3ECCCCCDLL));
    v9 = vsra_n_s32((int32x2_t)0x300000003, (int32x2_t)vsra_n_u32(v8, v8, 0x1FuLL), 1uLL);
    v164 = vadd_s32((int32x2_t)vshl_u32((uint32x2_t)vshr_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v9, (uint32x2_t)vcltz_s32(v9), 0x1EuLL), 2uLL), (uint32x2_t)0x200000012), vrev64_s32((int32x2_t)vshl_u32((uint32x2_t)vshr_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v7, (uint32x2_t)vcltz_s32(v7), 0x1EuLL), 2uLL), (uint32x2_t)0x200000012)));
  }
  v176 = 0x800000008000;
  objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("tileStatsConfig"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (_DWORD *)objc_msgSend(v10, "bytes");

  v12 = v11[1];
  if (v12 >= 0)
    v13 = v11[1];
  else
    v13 = v12 + 1;
  v14 = v13 >> 1;
  v172 = v14;
  v15 = v11[2];
  if (v15 >= 0)
    v16 = v11[2];
  else
    v16 = v15 + 1;
  v17 = v16 >> 1;
  v173 = v17;
  v168 = (v11[3] - v12) >> 1;
  v169 = (v11[4] - v15) >> 1;
  v18 = v168;
  v19 = v169;
  v20 = *(_QWORD *)(v2 + 16);
  *(_DWORD *)(v2 + 3876) = (unsigned __int16)v14;
  *(_DWORD *)(v2 + 3880) = (unsigned __int16)v17;
  *(_DWORD *)(v2 + 3884) = v18;
  *(_DWORD *)(v2 + 3888) = v19;
  CAWBAFE::SetScheme(v20, 1);
  v21 = *(CAWBAFE **)(v2 + 16);
  objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("tileStats"));
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (_TILE_Stat_Elem *)objc_msgSend(v22, "bytes");
  objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("windowStats"));
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = (_AEAWB_Stat_Elem *)objc_msgSend(v24, "bytes");
  objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("histStats"));
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CAWBAFE::SetStats(v21, (_FE_3A_Stats_H15 *)v162, v23, v25, (unsigned int *)objc_msgSend(v26, "bytes"), 0);

  CAWBAFE::SetFrameRateForHistAWB(*(CAWBAFE **)(v2 + 16), *(_WORD *)(v2 + 88));
  CAWBAFE::SetSensorClockFreq(*(CAWBAFE **)(v2 + 16), *(float *)(v2 + 4988));
  CAWBAFE::EstimateCurrentSceneLuxLevels(*(CAWBAFE **)(v2 + 16), (sMetaData *)(v2 + 24));
  CAWBAFE::GetCurrentSceneLuxLevels(*(CAWBAFE **)(v2 + 16), v157);
  *(_DWORD *)(v2 + 320) = *(_DWORD *)&v157[1];
  *(_DWORD *)(v2 + 312) = CAWBAFE::GetSceneBrightnessForLux(*(CAWBAFE **)(v2 + 16));
  CAWBAFE::SetRgbColorspace(*(_QWORD *)(v2 + 16), 1);
  v27 = v157[0];
  if (!*(_DWORD *)(v2 + 4924))
  {
    *(_WORD *)(v2 + 4992) = v157[0];
    *(_DWORD *)(v2 + 4994) = *(_DWORD *)&v157[1];
  }
  *(_WORD *)(v2 + 4998) = v27;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  if (CAWBAFE::GetFDAWBEnable(*(CAWBAFE **)(v2 + 16))
    && CAWBAFE::GetFDAWBVersion(*(CAWBAFE **)(v2 + 16)) == 1)
  {
    objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("anstSkinMask"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29
      || (objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("anstSkinMask")),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v30, "length") == 49152,
          v30,
          !v31)
      && FigSignalErrorAt())
    {
      CAWBAFE::SetSemanticAWBEnable(*(CAWBAFE **)(v2 + 16), 0);
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("anstSkinMask"));
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v155 = objc_msgSend(v32, "bytes");

      CAWBAFE::SetSemanticConfidenceMap(*(_QWORD *)(v2 + 16), (uint64_t)&v153);
      *(_OWORD *)(v2 + 4868) = 0u;
      *(_OWORD *)(v2 + 4884) = 0u;
      objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("FESOutputSize"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v2 + 4860) = *(double *)(objc_msgSend(v33, "pointerValue") + 16);

      objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("FESOutputSize"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(v2 + 4864) = *(double *)(objc_msgSend(v34, "pointerValue") + 24);

    }
  }
  objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("skyMaskData"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  if (!v36)
  {
    objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11AA0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("skyMaskData"));
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v39 = objc_msgSend(v38, "bytes");

    objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("skyMaskSize"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(double *)(objc_msgSend(v40, "pointerValue") + 16);

    objc_msgSend(*(id *)(v2 + 5072), "objectForKeyedSubscript:", CFSTR("skyMaskSize"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *(double *)(objc_msgSend(v42, "pointerValue") + 24);

    objc_msgSend((id)v2, "_processSkyMask:skyMaskWidth:skyMaskHeight:cropRectFromSourceDict:", v39, (int)v41, (int)v43, v37);
  }
  v44 = 1;
  do
  {
    v45 = v44;
    if (*(int *)(v2 + 4924) >= 1)
    {
      CAWBAFE::SetSensorClockFreq(*(CAWBAFE **)(v2 + 16), *(float *)(v2 + 4988));
      CAWBAFE::SetFlashStateForHistAWB(*(CAWBAFE **)(v2 + 16), 0, 0, 0, 0);
      CAWBAFE::SetFlashStateForHistAWB(*(CAWBAFE **)(v2 + 16), 1, *(_WORD *)(v2 + 4992), *(_WORD *)(v2 + 4994), *(_WORD *)(v2 + 4996));
    }
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v2 + 16) + 32))(*(_QWORD *)(v2 + 16), v2 + 24);
    v46 = *(_DWORD *)(v2 + 4924);
    if (v46 >= 1 && *(_BYTE *)(v2 + 4937))
    {
      v47 = *(_QWORD *)(v2 + 16);
      v48 = *(float *)(v2 + 4928);
      v49 = *(unsigned int *)(v2 + 4932);
      v50 = *(_OWORD *)(v2 + 4952);
      v151[0] = *(_OWORD *)(v2 + 4936);
      v151[1] = v50;
      v151[2] = *(_OWORD *)(v2 + 4968);
      v152 = *(_DWORD *)(v2 + 4984);
      (*(void (**)(uint64_t, uint64_t, _OWORD *, float, float))(*(_QWORD *)v47 + 128))(v47, v49, v151, (float)v46, v48);
    }
    (*(void (**)(_QWORD, void *, _QWORD))(**(_QWORD **)(v2 + 16) + 64))(*(_QWORD *)(v2 + 16), &-[AWBAlgorithm process]::pstAWBMetaData, 0);
    v44 = 0;
  }
  while ((v45 & 1) != 0);
  if (byte_254062B2C && *(_BYTE *)(v2 + 5000))
  {
    *(_DWORD *)(v2 + 5104) = objc_msgSend(*(id *)(v2 + 5032), "unsignedIntValue");
    *(_DWORD *)(v2 + 5108) = objc_msgSend(*(id *)(v2 + 5040), "unsignedIntValue");
    v51 = objc_msgSend(*(id *)(v2 + 5048), "unsignedIntValue");
    *(_DWORD *)(v2 + 5112) = v51;
    v52 = *(_DWORD *)(v2 + 5108);
    if (v52 <= v51)
      v52 = v51;
    if (*(_DWORD *)(v2 + 5104) <= v52)
      v53 = v52;
    else
      v53 = *(_DWORD *)(v2 + 5104);
    *(_DWORD *)(v2 + 5116) = (objc_msgSend(*(id *)(v2 + 5032), "unsignedIntValue") << 12) / v53;
    *(_DWORD *)(v2 + 5120) = (objc_msgSend(*(id *)(v2 + 5040), "unsignedIntValue") << 12) / v53;
    *(_DWORD *)(v2 + 5124) = (objc_msgSend(*(id *)(v2 + 5048), "unsignedIntValue") << 12) / v53;
    *(_DWORD *)(v2 + 5128) = objc_msgSend(*(id *)(v2 + 5008), "unsignedIntValue");
    *(_DWORD *)(v2 + 5132) = objc_msgSend(*(id *)(v2 + 5016), "unsignedIntValue");
    v54 = objc_msgSend(*(id *)(v2 + 5024), "unsignedIntValue");
  }
  else
  {
    if (objc_msgSend(*(id *)(v2 + 5088), "BOOLValue"))
      v55 = (unsigned __int16 *)&word_254062BB8;
    else
      v55 = (unsigned __int16 *)&word_254062806;
    *(_DWORD *)(v2 + 5104) = v55[4];
    *(_DWORD *)(v2 + 5108) = v55[5];
    *(_DWORD *)(v2 + 5112) = v55[7];
    *(_DWORD *)(v2 + 5116) = v55[8];
    *(_DWORD *)(v2 + 5120) = v55[9];
    *(_DWORD *)(v2 + 5124) = v55[11];
    *(_DWORD *)(v2 + 5128) = *v55;
    *(_DWORD *)(v2 + 5132) = v55[1];
    v54 = v55[3];
  }
  *(_DWORD *)(v2 + 5136) = v54;
  v56 = *(_QWORD *)(v2 + 5096);
  if (!v56 || byte_254062B2C)
  {
    v74 = 0;
    if (v56 && byte_254062B2C)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      if (v148)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", byte_254062B2C);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v125, CFSTR("UsePrevFrameWP"));

        objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11C10]);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setObject:forKeyedSubscript:", v126, CFSTR("StrobeWhitePointCCM"));

        objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", CFSTR("AwbOutputMetadata"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v126) = v127 == 0;

        if ((_DWORD)v126)
          objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v148, CFSTR("AwbOutputMetadata"));
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        if (v128)
        {
          objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11BB0]);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v146, "intValue");
          objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11B70]);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend(v130, "intValue");
          objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11BC8]);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend(v132, "intValue");
          objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11BB8]);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = objc_msgSend(v134, "intValue");
          objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11C08]);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = objc_msgSend(v136, "intValue");
          *(float *)&v138 = (float)v129 * 0.00024414;
          *(float *)&v139 = (float)v131 * 0.00024414;
          *(float *)&v140 = (float)v133 * 0.00024414;
          *(float *)&v141 = (float)v135 * 0.00024414;
          *(float *)&v142 = (float)v137;
          v143 = objc_msgSend((id)v2, "calculateInternalAWBMetadataForMIWB:bGain:rSkinGain:bSkinGain:cct:internalMetadata:", v128, v138, v139, v140, v141, v142);

          if (v143)
            v74 = FigSignalErrorAt();
          else
            v74 = 0;
          objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v128, CFSTR("MIWBOutputMetadata"));
        }
        else
        {
          v74 = FigSignalErrorAt();
        }

      }
      else
      {
        v74 = FigSignalErrorAt();
      }
    }
  }
  else
  {
    v57 = 0;
    v58 = (char *)&unk_254062BDC;
    do
    {
      v59 = objc_msgSend(*(id *)(v2 + 5088), "BOOLValue");
      v60 = v58 - 227;
      if (v59)
        v60 = v58;
      *(float *)&v161[v57] = (float)*(__int16 *)v60 * 0.00024414;
      *(float *)&v160[v57] = (float)*(__int16 *)(v58 - 209) * 0.00024414;
      v58 += 2;
      v57 += 4;
    }
    while (v57 != 36);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v161, 36);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v160, 36);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v147, *MEMORY[0x24BE11C10]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062B2A);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v61, *MEMORY[0x24BE11BD8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_254062B20);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v62, *MEMORY[0x24BE11C08]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5128));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v63, *MEMORY[0x24BE11BA0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5132));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v64, *MEMORY[0x24BE11B98]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5136));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v65, *MEMORY[0x24BE11B90]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5128));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v66, *MEMORY[0x24BE11BB0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5132));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v67, *MEMORY[0x24BE11BA8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5136));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v68, *MEMORY[0x24BE11B70]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5104));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v69, *MEMORY[0x24BE11B88]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5108));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v70, *MEMORY[0x24BE11B80]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 5112));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v71, *MEMORY[0x24BE11B78]);

    objc_msgSend(*(id *)(v2 + 5096), "objectForKeyedSubscript:", *MEMORY[0x24BE11CA8]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "BOOLValue");

    if (v73 && (v74 = objc_msgSend((id)v2, "_updateHRGainDownRatioMetadata")) != 0)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AE1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v75, *MEMORY[0x24BE11BC8]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", ((unsigned __int16)word_254062AE5 + (unsigned __int16)word_254062AE3) >> 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v76, *MEMORY[0x24BE11BC0]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AE7);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v77, *MEMORY[0x24BE11BB8]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_254062B68);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v78, *MEMORY[0x24BE11BD0]);

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        LODWORD(v80) = dword_254062AEC;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v81, CFSTR("FlashProjMixWeighting"));

        v82 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254062BFC);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", dword_254062C00);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_254062C04);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_254062C08);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "arrayWithObjects:", v83, v84, v85, v86, 0);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v87, CFSTR("TileStatsRegionInRaw"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_254062B68);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v88, CFSTR("FdAWBChistMixFactor"));

        v89 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AE1);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AE3);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AE5);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AE7);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "arrayWithObjects:", v90, v91, v92, v93, 0);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v94, CFSTR("AwbGainsSkinOnly"));

        v95 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AF0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AF2);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AF4);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)word_254062AF6);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "arrayWithObjects:", v96, v97, v98, v99, 0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v100, CFSTR("AwbGainsFlashProj"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_254062ADC);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v101, CFSTR("AwbColorspace"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", byte_254062AEA);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v102, CFSTR("IsLEDMainFlashforAWB"));

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v103)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", byte_254062B2C);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v104, CFSTR("UsePrevFrameWP"));

          objc_msgSend(v103, "setObject:forKeyedSubscript:", v145, CFSTR("StrobeWhitePointCCM"));
          v158 = 0;
          v159 = 0;
          v149 = 0;
          *(_QWORD *)v150 = 0;
          CAWBAFE::GetFaceAssistedAWBResultsForMatchProvidedSkinGains(*(CAWBAFE **)(v2 + 16), (float *)&v159, (float *)&v158, v150, &v150[1], (float *)&v149 + 1, (float *)&v149);
          LODWORD(v105) = v159;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v106, CFSTR("wpRgLogRatio"));

          LODWORD(v107) = HIDWORD(v159);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v108, CFSTR("wpBgLogRatio"));

          LODWORD(v109) = v158;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v110, CFSTR("wpSkinRgLogRatio"));

          LODWORD(v111) = HIDWORD(v158);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v112, CFSTR("wpSkinBgLogRatio"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v150[1]);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v113, CFSTR("continuousFDTimes"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v150[0]);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v114, CFSTR("skinColorSampleNum"));

          LODWORD(v115) = HIDWORD(v149);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v116, CFSTR("skinColorSampleVariance"));

          LODWORD(v117) = v149;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "setObject:forKeyedSubscript:", v118, CFSTR("minDistSkinToWhiteMapping"));

          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          if (v119)
          {
            *(float *)&v120 = (float)*(unsigned int *)(v2 + 5128) * 0.00024414;
            *(float *)&v121 = (float)*(unsigned int *)(v2 + 5136) * 0.00024414;
            LOWORD(v122) = word_254062AE1;
            *(float *)&v122 = (float)LODWORD(v122) * 0.00024414;
            LOWORD(v124) = word_254062AE7;
            *(float *)&v123 = (float)LODWORD(v124) * 0.00024414;
            *(float *)&v124 = (float)dword_254062B20;
            if (objc_msgSend((id)v2, "calculateInternalAWBMetadataForMIWB:bGain:rSkinGain:bSkinGain:cct:internalMetadata:", v119, v120, v121, v122, v123, v124))v74 = FigSignalErrorAt();
            else
              v74 = 0;
            objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v79, CFSTR("SpatialCCMOutputMetadata"));
            objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v103, CFSTR("AwbOutputMetadata"));
            objc_msgSend(*(id *)(v2 + 5096), "setObject:forKeyedSubscript:", v119, CFSTR("MIWBOutputMetadata"));
          }
          else
          {
            v74 = FigSignalErrorAt();
          }

        }
        else
        {
          v74 = FigSignalErrorAt();

        }
      }
      else
      {
        v74 = FigSignalErrorAt();

      }
    }
  }
  if (*MEMORY[0x24BDC0B48] == 1)
    kdebug_trace();
  return v74;
}

- (int)_processSkyMask:(void *)a3 skyMaskWidth:(int)a4 skyMaskHeight:(int)a5 cropRectFromSourceDict:(id)a6
{
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  CGRect rect;
  int v28;

  v10 = (const __CFDictionary *)a6;
  v11 = v10;
  if (a3)
  {
    if (v10 && CGRectMakeWithDictionaryRepresentation(v10, &rect))
    {
      v12 = (int)(rect.size.width * (double)a4);
      v13 = (int)(rect.size.height * (double)a5);
      v14 = (int)(rect.origin.y * (double)a5);
      v15 = v13 * v12;
      if (v14 < v13)
      {
        v16 = 0;
        v17 = (int)(rect.origin.x * (double)a4);
        v18 = v14;
        v19 = (char *)a3 + v17 + v14 * (uint64_t)a4;
        do
        {
          v20 = v12 - (uint64_t)v17;
          v21 = (unsigned __int8 *)v19;
          if (v17 < v12)
          {
            do
            {
              v22 = *v21++;
              if (v22 > 0x32)
                ++v16;
              --v20;
            }
            while (v20);
          }
          ++v18;
          v19 += a4;
        }
        while (v18 != v13);
        goto LABEL_20;
      }
    }
    else
    {
      v15 = a5 * a4;
      if (a5 * a4 >= 1)
      {
        v16 = 0;
        v23 = (a5 * a4);
        do
        {
          v24 = *(unsigned __int8 *)a3;
          a3 = (char *)a3 + 1;
          if (v24 > 0x32)
            ++v16;
          --v23;
        }
        while (v23);
        goto LABEL_20;
      }
    }
    v16 = 0;
LABEL_20:
    v25 = (float)((float)v16 / (float)v15) >= 0.005;
    goto LABEL_21;
  }
  v25 = 2;
LABEL_21:
  v28 = v25;
  CAWBAFE::setUnagiSkyDetected((uint64_t)self->_AWBAlgorithmObj, &v28);

  return 0;
}

- (int)_updateHRGainDownRatioMetadata
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int32 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int32 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int32 v14;
  uint64_t v15;
  int32x4_t v16;
  unsigned int v17;
  int32x4_t v18;
  uint32x4_t v19;
  float32x4_t v20;
  float v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v3 = *MEMORY[0x24BE11B88];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", *MEMORY[0x24BE11B88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return FigSignalErrorAt();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  v7 = *MEMORY[0x24BE11B80];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", *MEMORY[0x24BE11B80]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return FigSignalErrorAt();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  v11 = *MEMORY[0x24BE11B78];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", *MEMORY[0x24BE11B78]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    return FigSignalErrorAt();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  v17 = v14 <= v6 ? v6 : v14;
  if (v10 > v17)
    v17 = v10;
  if (v17 < 0x1000)
    return FigSignalErrorAt();
  v16.i32[0] = v6;
  v18 = v16;
  v18.i32[1] = v10;
  v18.i32[2] = v14;
  v19 = (uint32x4_t)vaddq_s32(vdupq_n_s32(v17 >> 1), vshlq_n_s32(v18, 0xCuLL));
  v19.i32[0] /= v17;
  v19.i32[1] /= v17;
  v19.i32[2] /= v17;
  v20 = vcvtq_f32_u32(v19);
  v21 = fmaxf(fmaxf(v20.f32[0], v20.f32[2]), v20.f32[1]) / fminf(fminf(v20.f32[0], v20.f32[2]), v20.f32[1]);
  if (v21 < 1.0)
    return FigSignalErrorAt();
  LODWORD(v15) = llroundf(v21 * 4096.0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BE11CB0];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputMetadata, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE11CB0]);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_outputMetadata, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    return 0;
  else
    return FigSignalErrorAt();
}

+ (int)getColorCalibrationsUsingIdealColorCalbrations:(id)a3 absoluteColorCalibrations:(id)a4 colorCalibrationsOut:(id *)a5 awbConfig:(id)a6
{
  CAWBAFEH14 *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  void *v40;
  float v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  double v48;
  void *v49;
  unsigned int v50;
  double v51;
  void *v52;
  unsigned int v53;
  double v54;
  void *v55;
  unsigned int v56;
  double v57;
  void *v58;
  uint64_t i;
  void *v60;
  double v61;
  void *v62;
  uint64_t j;
  void *v64;
  double v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v76;
  id v77;
  id v78;
  unsigned __int16 v79[2];
  unsigned __int16 v80[2];
  unsigned __int16 v81[2];
  int v82[9];
  int v83[9];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v78 = a4;
  v76 = a6;
  *(_DWORD *)v80 = 0;
  *(_DWORD *)v81 = 0;
  *(_DWORD *)v79 = 0;
  v8 = (CAWBAFEH14 *)operator new();
  CAWBAFEH14::CAWBAFEH14(v8, "CAWBAFE", 0);
  v9 = 0;
  v10 = -1;
  if (v78 && v77 && a5 && v76)
  {
    if ((*(unsigned int (**)(CAWBAFEH14 *, uint64_t))(*(_QWORD *)v8 + 16))(v8, 1))
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[AWBAlgorithm doAWBConfigLoad:to:](AWBAlgorithm, "doAWBConfigLoad:to:", v76, v11);

      v12 = *MEMORY[0x24BE11B38];
      objc_msgSend(v78, "objectForKeyedSubscript:", *MEMORY[0x24BE11B38]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BE11B30];
      v74 = v13;
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE11B30]);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "floatValue");
      v16 = v15;
      objc_msgSend(v78, "objectForKeyedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BE11B28];
      v72 = v17;
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE11B28]);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "floatValue");
      v20 = v19;
      v21 = *MEMORY[0x24BE11B40];
      objc_msgSend(v78, "objectForKeyedSubscript:", *MEMORY[0x24BE11B40]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", v14);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "floatValue");
      v23 = v22;
      objc_msgSend(v78, "objectForKeyedSubscript:", v21);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "floatValue");
      v26 = v25;
      objc_msgSend(v77, "objectForKeyedSubscript:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v30 = v29;
      objc_msgSend(v77, "objectForKeyedSubscript:", v12);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v18);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v34 = v33;
      objc_msgSend(v77, "objectForKeyedSubscript:", v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v14);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v38 = v37;
      objc_msgSend(v77, "objectForKeyedSubscript:", v21);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", v18);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      CAWBAFE::SensorCalSet((CAWBAFE *)v8, v16 * 16384.0, v20 * 16384.0, v23 * 16384.0, v26 * 16384.0, v30, v34, v38, v41);

      CAWBAFE::GetCalibrationGain((CAWBAFE *)v8, &v81[1], v81, &v80[1], v80, &v79[1], v79);
      if (v81[1] != 2800)
      {
        v81[1] = 2800;
        CAWBAFE::GetInterpolatedCSensorCalGains((CAWBAFE *)v8, &v80[1], v80, 0xAF0u);
      }
      if (v81[0] != 5000)
      {
        v81[0] = 5000;
        CAWBAFE::GetInterpolatedCSensorCalGains((CAWBAFE *)v8, &v79[1], v79, 0x1388u);
      }
      CAWBAFE::GetRawRGBtoXYZCCM((CAWBAFE *)v8, v81[1], v83, v42);
      CAWBAFE::GetRawRGBtoXYZCCM((CAWBAFE *)v8, v81[0], v82, v43);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v81[1]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v45, CFSTR("CalibrationIlluminant1"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v81[0]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v46, CFSTR("CalibrationIlluminant2"));

        LOWORD(v47) = v80[1];
        *(float *)&v48 = (float)v47 * 0.000061035;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v49, CFSTR("CameraCalibration1Rg"));

        LOWORD(v50) = v80[0];
        *(float *)&v51 = (float)v50 * 0.000061035;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v52, CFSTR("CameraCalibration1Bg"));

        LOWORD(v53) = v79[1];
        *(float *)&v54 = (float)v53 * 0.000061035;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v55, CFSTR("CameraCalibration2Rg"));

        LOWORD(v56) = v79[0];
        *(float *)&v57 = (float)v56 * 0.000061035;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v58, CFSTR("CameraCalibration2Bg"));

        for (i = 0; i != 9; ++i)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ColorMatrix1_%d"), i);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v61 = (float)v83[i] * 0.00024414;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v62, v60);

        }
        for (j = 0; j != 9; ++j)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ColorMatrix2_%d"), j);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v65 = (float)v82[j] * 0.00024414;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v66, v64);

        }
        v9 = objc_retainAutorelease(v44);
        v10 = 0;
        *a5 = v9;
      }
      else
      {
        v9 = 0;
        v10 = -1;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  (*(void (**)(CAWBAFEH14 *))(*(_QWORD *)v8 + 8))(v8);

  return v10;
}

+ (int)calculateSTRBKeyFromWideCamera:(id *)a3 moduleConfig:(id)a4
{
  CAWBAFEH14 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  CAWBAFEH14 *v19;
  id v20;
  void *v21;
  __int16 v22;
  char v23;
  uint64_t v24;
  _DWORD v25[28];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = a4;
  v5 = (CAWBAFEH14 *)operator new();
  CAWBAFEH14::CAWBAFEH14(v5, "CAWBAFE", 0);
  if (!a3)
  {
    v21 = 0;
    v9 = 0;
    goto LABEL_16;
  }
  if (a3->var0 != 1)
  {
    v17 = 0;
    v21 = 0;
    v9 = 0;
    v7 = 0;
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ColorMatchingModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v21 = 0;
    v9 = 0;
    goto LABEL_18;
  }
  v21 = v7;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
LABEL_16:
    v7 = 0;
LABEL_18:
    v10 = 0;
LABEL_19:
    v17 = -1;
    goto LABEL_14;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RGGainMatchingModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v7 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BGGainMatchingModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_19;
  v19 = v5;
  v11 = 0;
  v12 = v25;
  do
  {
    for (i = 0; i != 3; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12[i + 1] = objc_msgSend(v14, "intValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12[i + 4] = objc_msgSend(v15, "intValue");

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SlaveCamID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[7 * v11] = objc_msgSend(v16, "unsignedIntValue");

    ++v11;
    v12 += 7;
  }
  while (v11 != 4);
  v23 = 0;
  v22 = 259;
  v5 = v19;
  v24 = *(_QWORD *)&a3->var1.var0.var0;
  if (!(*(unsigned int (**)(CAWBAFEH14 *, uint64_t))(*(_QWORD *)v19 + 16))(v19, 1))
    goto LABEL_19;
  (*(void (**)(CAWBAFEH14 *, uint64_t, _DWORD *))(*(_QWORD *)v19 + 144))(v19, 4, v25);
  (*(void (**)(CAWBAFEH14 *, __int16 *))(*(_QWORD *)v19 + 136))(v19, &v22);
  v17 = 0;
  *(_QWORD *)&a3->var1.var0.var0 = v24;
LABEL_14:
  (*(void (**)(CAWBAFEH14 *))(*(_QWORD *)v5 + 8))(v5);

  return v17;
}

+ (int)translateAWBGainsToSecondaryPortType:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8 primaryRGain:(float)a9 primaryBGain:(float)a10 secondaryChannelID:(unsigned int)a11 secondaryRGain:(float *)a12 secondaryBGain:(float *)a13
{
  CAWBAFEH14 *v18;
  AWBAlgorithm *v19;
  void *v20;
  AWBAlgorithm *v21;
  AWBIBPParams *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  float v28;
  float v29;
  uint64_t v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  void *v37;
  float v38;
  float v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  _BOOL4 v58;
  float v59;
  _BOOL4 v60;
  float v61;
  _BOOL4 v62;
  float v63;
  _BOOL4 v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  int v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  _WORD *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  unsigned int i;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  unsigned int j;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v114;
  float *v115;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  AWBIBPParams *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  AWBAlgorithm *v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _OWORD v152[12];
  uint64_t v153;
  unsigned int v154;
  uint64_t v155;

  v155 = *MEMORY[0x24BDAC8D0];
  v119 = a3;
  v120 = a4;
  v121 = a5;
  v122 = a6;
  v123 = a7;
  v118 = a8;
  v154 = 0;
  v153 = 0;
  memset(v152, 0, sizeof(v152));
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v18 = (CAWBAFEH14 *)operator new();
  CAWBAFEH14::CAWBAFEH14(v18, "CAWBAFE", 0);
  if (!(*(unsigned int (**)(CAWBAFEH14 *, uint64_t))(*(_QWORD *)v18 + 16))(v18, 1))
  {
    v131 = 0;
    v132 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v133 = 0;
    v81 = 0;
    v97 = 0;
    v106 = 0;
    v70 = -1;

    goto LABEL_53;
  }
  v19 = [AWBAlgorithm alloc];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AWBAlgorithm initWithAWBObject:](v19, "initWithAWBObject:", v20);

  if (!v21)
  {
    v132 = 0;
    v70 = FigSignalErrorAt();
    v124 = 0;
LABEL_59:
    v125 = 0;
    goto LABEL_60;
  }
  v132 = v21;
  v22 = objc_alloc_init(AWBIBPParams);
  if (!v22)
  {
    v124 = 0;
    v70 = FigSignalErrorAt();
    goto LABEL_59;
  }
  v124 = v22;
  -[AWBIBPParams setValidRectInBufferCoords:](v22, "setValidRectInBufferCoords:", v122);
  -[AWBIBPParams setRegionOfInterestRectInBufferCoords:](v124, "setRegionOfInterestRectInBufferCoords:", 0);
  -[AWBIBPParams setFaceAssistedBehaviorMode:](v124, "setFaceAssistedBehaviorMode:", &unk_24FECE348);
  if (-[AWBAlgorithm configWithModuleConfig:metadata:cameraInfo:awbParams:](v21, "configWithModuleConfig:metadata:cameraInfo:awbParams:", v119, v121, v120, v124)|| (objc_msgSend(v118, "objectForKeyedSubscript:", *MEMORY[0x24BE11A28]), (v23 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v125 = 0;
    v70 = FigSignalErrorAt();
LABEL_60:
    v126 = 0;
    v127 = 0;
    v128 = 0;
LABEL_61:
    v129 = 0;
    v131 = 0;
    v133 = 0;
    v81 = 0;
    v97 = 0;
    v106 = 0;

    goto LABEL_53;
  }
  v24 = *MEMORY[0x24BE11B38];
  v125 = v23;
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE11B38]);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BE11B40];
  objc_msgSend(v125, "objectForKeyedSubscript:", *MEMORY[0x24BE11B40]);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x24BE11B30];
  objc_msgSend(v126, "objectForKeyedSubscript:", *MEMORY[0x24BE11B30]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v29 = v28;

  v30 = *MEMORY[0x24BE11B28];
  objc_msgSend(v126, "objectForKeyedSubscript:", *MEMORY[0x24BE11B28]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v33 = v32;

  objc_msgSend(v127, "objectForKeyedSubscript:", v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  v36 = v35;

  objc_msgSend(v127, "objectForKeyedSubscript:", v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  v39 = v38;

  objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("AutoWhiteBalance"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    v128 = 0;
    v70 = FigSignalErrorAt();
    goto LABEL_61;
  }
  v130 = v40;
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("IdealColorCalibrations"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    v128 = 0;
    v70 = FigSignalErrorAt();
    v106 = 0;
    v129 = 0;
    v131 = 0;
    v133 = 0;
    v81 = 0;
    v97 = 0;
    goto LABEL_52;
  }
  v128 = v41;
  objc_msgSend(v41, "objectForKeyedSubscript:", v24);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "objectForKeyedSubscript:", v25);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "objectForKeyedSubscript:", v26);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  v44 = v43;

  objc_msgSend(v129, "objectForKeyedSubscript:", v30);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "floatValue");
  v47 = v46;

  objc_msgSend(v131, "objectForKeyedSubscript:", v26);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  v50 = v49;

  objc_msgSend(v131, "objectForKeyedSubscript:", v30);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "floatValue");
  v53 = v52;
  v54 = v29 * 16384.0;
  v55 = v33 * 16384.0;
  v56 = v36 * 16384.0;
  v57 = v39 * 16384.0;

  LOWORD(v141) = (int)v50;
  WORD1(v141) = (int)v53;
  WORD2(v141) = (int)v44;
  WORD3(v141) = (int)v47;
  WORD4(v141) = (int)v56;
  WORD5(v141) = (int)v57;
  WORD6(v141) = (int)v54;
  HIWORD(v141) = (int)v55;
  v58 = v50 > 0.0;
  if (v56 <= 0.0)
    v58 = 0;
  v59 = 16384.0;
  if (v58)
    v59 = (float)(v50 * 16384.0) / v56;
  WORD4(v142) = (int)v59;
  v60 = v53 > 0.0;
  if (v57 <= 0.0)
    v60 = 0;
  v61 = 16384.0;
  if (v60)
    v61 = (float)(v53 * 16384.0) / v57;
  WORD5(v142) = (int)v61;
  v62 = v44 > 0.0;
  if (v54 <= 0.0)
    v62 = 0;
  v63 = 16384.0;
  if (v62)
    v63 = (float)(v44 * 16384.0) / v54;
  WORD6(v142) = (int)v63;
  v64 = v47 > 0.0;
  if (v55 <= 0.0)
    v64 = 0;
  v65 = 16384.0;
  if (v64)
    v65 = (float)(v47 * 16384.0) / v55;
  HIWORD(v142) = (int)v65;
  if (v58)
    v66 = (float)(v56 * 16384.0) / v50;
  else
    v66 = 16384.0;
  LOWORD(v142) = (int)v66;
  v67 = 16384.0;
  if (v60)
    v67 = (float)(v57 * 16384.0) / v53;
  WORD1(v142) = (int)v67;
  v68 = 16384.0;
  if (v62)
    v68 = (float)(v54 * 16384.0) / v44;
  WORD2(v142) = (int)v68;
  v69 = 16384.0;
  if (v64)
    v69 = (float)(v55 * 16384.0) / v47;
  WORD3(v142) = (int)v69;
  v70 = -[AWBAlgorithm encodeSetFileIDForModuleConfig:setFileID:](v132, "encodeSetFileIDForModuleConfig:setFileID:", v123, &v143);
  if (v70)
  {
    v133 = 0;
    v81 = 0;
    v97 = 0;
    v106 = 0;
    goto LABEL_52;
  }
  objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("CSC"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71)
  {
    v70 = FigSignalErrorAt();
    v81 = 0;
    v97 = 0;
    v133 = 0;
    v106 = 0;
    goto LABEL_52;
  }
  v72 = 0;
  v115 = a12;
  v133 = v71;
  do
  {
    objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("CCMCoef"), v115);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectAtIndexedSubscript:", v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v143 + v72 + 4) = objc_msgSend(v74, "intValue");

    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("CSCCoef"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "objectAtIndexedSubscript:", v72);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v144 + v72 + 5) = objc_msgSend(v76, "intValue");

    ++v72;
    v71 = v133;
  }
  while (v72 != 9);
  HIDWORD(v145) = 0;
  objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("CSCChromaScale0"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v146) = objc_msgSend(v77, "intValue");

  objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("CSCChromaScale1"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD1(v146) = objc_msgSend(v78, "intValue");

  objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("CCM"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("CCMLuxClipLevel"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  WORD4(v146) = objc_msgSend(v80, "intValue");

  objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("CCM"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v81)
  {
    v70 = FigSignalErrorAt();
    v97 = 0;
    v106 = 0;
    goto LABEL_52;
  }
  v82 = 0;
  v83 = (_WORD *)v152 + 2;
  do
  {
    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("Offset"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectAtIndexedSubscript:", v82);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    *(v83 - 45) = objc_msgSend(v85, "intValue");

    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("X1stOrder"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectAtIndexedSubscript:", v82);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(v83 - 36) = objc_msgSend(v87, "intValue");

    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("Y1stOrder"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectAtIndexedSubscript:", v82);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    *(v83 - 27) = objc_msgSend(v89, "intValue");

    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("X2ndOrder"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectAtIndexedSubscript:", v82);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    *(v83 - 18) = objc_msgSend(v91, "intValue");

    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("Y2ndOrder"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectAtIndexedSubscript:", v82);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    *(v83 - 9) = objc_msgSend(v93, "intValue");

    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("LuxFactor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectAtIndexedSubscript:", v82);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    *v83 = objc_msgSend(v95, "intValue");

    ++v82;
    ++v83;
  }
  while (v82 != 9);
  objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("Histogram"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("XToCCT"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v97)
  {
    v70 = FigSignalErrorAt();
    v106 = 0;
    goto LABEL_52;
  }
  for (i = 0; ; i = v99 + 1)
  {
    v99 = i;
    if (objc_msgSend(v97, "count") <= (unint64_t)i)
      break;
    objc_msgSend(v97, "objectAtIndexedSubscript:", i);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("X"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v152[1] + 3 * v99 + 3) = objc_msgSend(v101, "intValue");

    objc_msgSend(v97, "objectAtIndexedSubscript:", v99);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("Y"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v152[1] + 3 * v99 + 4) = objc_msgSend(v103, "intValue");

    objc_msgSend(v97, "objectAtIndexedSubscript:", v99);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("CCT"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v152[1] + 3 * v99 + 5) = objc_msgSend(v105, "intValue");

  }
  objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("ProjectionPoint"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v106)
  {
    v114 = FigSignalErrorAt();
    goto LABEL_69;
  }
  for (j = 0; ; j = v108 + 1)
  {
    v108 = j;
    if (objc_msgSend(v106, "count") <= (unint64_t)j)
      break;
    objc_msgSend(v106, "objectAtIndexedSubscript:", j);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("X"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v152[4] + 2 * v108 + 3) = objc_msgSend(v110, "intValue");

    objc_msgSend(v106, "objectAtIndexedSubscript:", v108);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("Y"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v152[4] + 2 * v108 + 4) = objc_msgSend(v112, "intValue");

  }
  LODWORD(v153) = a9;
  HIDWORD(v153) = 4096;
  v154 = a10;
  v70 = -[AWBAlgorithm translateAWBGainsToSecondaryChannelID:secondaryChannelID:secondaryConfig:secondaryAWBParams:](v132, "translateAWBGainsToSecondaryChannelID:secondaryChannelID:secondaryConfig:secondaryAWBParams:", &v153, a11, &v141, &v134);
  if (v70)
    goto LABEL_52;
  if (!v115 || (*v115 = (float)DWORD1(v135), !a13))
  {
    v114 = FigSignalErrorAt();
LABEL_69:
    v70 = v114;
    goto LABEL_52;
  }
  v70 = 0;
  *a13 = (float)HIDWORD(v135);
LABEL_52:

LABEL_53:
  return v70;
}

+ (int)getInternalAWBMetadataForMIWB:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 validRect:(id)a6 secondaryModuleConfig:(id)a7 secondaryCameraInfo:(id)a8
{
  id v13;
  id v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  double v26;
  double v27;
  CAWBAFEH14 *v28;
  AWBAlgorithm *v29;
  void *v30;
  AWBAlgorithm *v31;
  AWBIBPParams *v32;
  AWBIBPParams *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  id v54;
  id v55;
  id v56;
  id v57;
  char v58;
  char v59;
  char v60;
  uint64_t v61;

  v57 = a3;
  v56 = a4;
  v13 = a5;
  v14 = a6;
  v54 = a7;
  v55 = a8;
  v61 = 0;
  v60 = 0;
  v15 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11BB0], 4096, &v60);
  if (v60)
  {
    v16 = v15;
    v53 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11B70], 4096, &v60);
    if (v60)
    {
      v17 = *MEMORY[0x24BE11B08];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE11B08]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE11B20]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            v59 = 0;
            v24 = objc_msgSend(v22, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11BC8], 4096, &v59);
            v58 = 0;
            v25 = objc_msgSend(v23, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11BB8], 4096, &v58);
            if (v59)
            {
              if (v55 && v54 && v58)
              {
                *(float *)&v26 = (float)v24;
                *(float *)&v27 = (float)v25;
                LODWORD(v51) = 4;
                +[AWBAlgorithm translateAWBGainsToSecondaryPortType:cameraInfo:metadata:validRect:secondaryModuleConfig:secondaryCameraInfo:primaryRGain:primaryBGain:secondaryChannelID:secondaryRGain:secondaryBGain:](AWBAlgorithm, "translateAWBGainsToSecondaryPortType:cameraInfo:metadata:validRect:secondaryModuleConfig:secondaryCameraInfo:primaryRGain:primaryBGain:secondaryChannelID:secondaryRGain:secondaryBGain:", v54, v55, v13, v14, v57, v56, v26, v27, v51, (char *)&v61 + 4, &v61);
              }
            }
          }

        }
      }
      LODWORD(v19) = HIDWORD(v61);
      if (*((float *)&v61 + 1) != 0.0
        || (*((float *)&v61 + 1) = (float)(int)objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11BC8], 4096, &v60, v19), v60))
      {
        LODWORD(v19) = v61;
        if (*(float *)&v61 != 0.0
          || (*(float *)&v61 = (float)(int)objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11BB8], 4096, &v60, v19), v60))
        {
          v52 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x24BE11C08], 6500, &v60);
          if (v60)
          {
            *(float *)&v61 = *(float *)&v61 * 0.00024414;
            *((float *)&v61 + 1) = *((float *)&v61 + 1) * 0.00024414;
            v28 = (CAWBAFEH14 *)operator new();
            CAWBAFEH14::CAWBAFEH14(v28, "CAWBAFE", 0);
            if ((*(unsigned int (**)(CAWBAFEH14 *, uint64_t))(*(_QWORD *)v28 + 16))(v28, 1))
            {
              v29 = [AWBAlgorithm alloc];
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = -[AWBAlgorithm initWithAWBObject:](v29, "initWithAWBObject:", v30);

              if (v31)
              {
                v32 = objc_alloc_init(AWBIBPParams);
                v33 = v32;
                if (!v32)
                {
                  v40 = 0;
                  v48 = FigSignalErrorAt();
                  v33 = 0;
                  goto LABEL_35;
                }
                -[AWBIBPParams setValidRectInBufferCoords:](v32, "setValidRectInBufferCoords:", v14);
                -[AWBIBPParams setRegionOfInterestRectInBufferCoords:](v33, "setRegionOfInterestRectInBufferCoords:", 0);
                -[AWBIBPParams setFaceAssistedBehaviorMode:](v33, "setFaceAssistedBehaviorMode:", &unk_24FECE348);
                if (-[AWBAlgorithm configWithModuleConfig:metadata:cameraInfo:awbParams:](v31, "configWithModuleConfig:metadata:cameraInfo:awbParams:", v57, v13, v56, v33)|| (objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"), (v34 = objc_claimAutoreleasedReturnValue()) == 0))
                {
                  v40 = 0;
                  v50 = FigSignalErrorAt();
                }
                else
                {
                  v40 = (void *)v34;
                  *(float *)&v39 = (float)v52;
                  *(float *)&v35 = (float)v16 * 0.00024414;
                  *(float *)&v36 = (float)v53 * 0.00024414;
                  LODWORD(v37) = HIDWORD(v61);
                  LODWORD(v38) = v61;
                  if (!-[AWBAlgorithm calculateInternalAWBMetadataForMIWB:bGain:rSkinGain:bSkinGain:cct:internalMetadata:](v31, "calculateInternalAWBMetadataForMIWB:bGain:rSkinGain:bSkinGain:cct:internalMetadata:", v34, v35, v36, v37, v38, v39))
                  {
                    objc_msgSend(v13, "objectForKeyedSubscript:", v17);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v41)
                    {
                      objc_msgSend(v13, "objectForKeyedSubscript:", v17);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = v42;
                      if (v42)
                      {
                        objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x24BE11B20]);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        v45 = v44;
                        if (v44)
                        {
                          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("MIWBOutputMetadata"));
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v46, "count"))
                          {
                            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("DaylightScore"));
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v40, "setObject:forKeyedSubscript:", v47, CFSTR("DaylightScore"));

                          }
                        }

                      }
                    }
                    objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("MIWBOutputMetadata"));
                    goto LABEL_34;
                  }
                  v50 = FigSignalErrorAt();
                }
                v48 = v50;
                goto LABEL_35;
              }
              v48 = FigSignalErrorAt();
            }
            else
            {
              v48 = -1;
            }
            (*(void (**)(CAWBAFEH14 *))(*(_QWORD *)v28 + 8))(v28);
            v40 = 0;
            v33 = 0;
            v31 = 0;
            goto LABEL_35;
          }
        }
      }
    }
  }
  v40 = 0;
  v33 = 0;
  v31 = 0;
LABEL_34:
  v48 = 0;
LABEL_35:

  return v48;
}

- (void)dealloc
{
  CAWBAFE *AWBAlgorithmObj;
  objc_super v4;

  AWBAlgorithmObj = self->_AWBAlgorithmObj;
  if (AWBAlgorithmObj)
    (*((void (**)(CAWBAFE *, SEL))AWBAlgorithmObj->var0 + 1))(AWBAlgorithmObj, a2);
  self->_AWBAlgorithmObj = 0;
  v4.receiver = self;
  v4.super_class = (Class)AWBAlgorithm;
  -[AWBAlgorithm dealloc](&v4, sel_dealloc);
}

- (NSDictionary)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (unsigned)numTilesX
{
  return self->_numTilesX;
}

- (unsigned)numTilesY
{
  return self->_numTilesY;
}

- (unsigned)winRegionWidth
{
  return self->_winRegionWidth;
}

- (void)setWinRegionWidth:(unsigned int)a3
{
  self->_winRegionWidth = a3;
}

- (unsigned)winRegionHeight
{
  return self->_winRegionHeight;
}

- (void)setWinRegionHeight:(unsigned int)a3
{
  self->_winRegionHeight = a3;
}

- (NSData)setFileData
{
  return self->_setFileData;
}

- (NSNumber)digitalFlash
{
  return self->_digitalFlash;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbComboGains
{
  unsigned int bGain;
  uint64_t v3;
  $938B03310D06493B2963E5A84CB75A7E result;

  bGain = self->_awbComboGains.bGain;
  v3 = *(_QWORD *)&self->_awbComboGains.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbComboGainsNormalized
{
  unsigned int bGain;
  uint64_t v3;
  $938B03310D06493B2963E5A84CB75A7E result;

  bGain = self->_awbComboGainsNormalized.bGain;
  v3 = *(_QWORD *)&self->_awbComboGainsNormalized.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- ($938B03310D06493B2963E5A84CB75A7E)awbGains
{
  unsigned int bGain;
  uint64_t v3;
  $938B03310D06493B2963E5A84CB75A7E result;

  bGain = self->_awbGains.bGain;
  v3 = *(_QWORD *)&self->_awbGains.rGain;
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  result.var2 = bGain;
  return result;
}

- (NSMutableDictionary)outputMetadata
{
  return self->_outputMetadata;
}

- (void)setOutputMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_outputMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMetadata, 0);
  objc_storeStrong((id *)&self->_digitalFlash, 0);
  objc_storeStrong((id *)&self->_setFileData, 0);
  objc_storeStrong((id *)&self->_stats, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
