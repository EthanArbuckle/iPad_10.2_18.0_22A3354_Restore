@implementation VNHumanBodyPoseDetector

+ (Class)recognizedPointsObservationClass
{
  return (Class)objc_opt_class();
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VNHumanBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_13;
  v7 = objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class());
  if (a4)
    v8 = v7;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v6, "requestRevision");
  if (v9 == 1)
  {
    v16 = CFSTR("VNComputeStageMain");
    +[VNComputeDeviceUtilities allComputeDevices](VNComputeDeviceUtilities, "allComputeDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (v9 != 3737841664)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v6);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v14 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allNeuralEngineComputeDevices](VNComputeDeviceUtilities, "allNeuralEngineComputeDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v11;
}

void __64__VNHumanBodyPoseDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNHumanBodyPoseDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNHumanBodyPoseDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  VCPRequest *v11;
  VCPRequest *humanPoseDetector;
  BOOL v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanBodyPoseDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v15, sel_completeInitializationForSession_error_, v6, a4))
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNHumanBodyPoseDetector vcpPoseRequestSetupOptionsForDetectorOptions:error:](self, "vcpPoseRequestSetupOptionsForDetectorOptions:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v9 = (void *)getVCPHumanPoseImageRequestClass(void)::softClass;
      v20 = getVCPHumanPoseImageRequestClass(void)::softClass;
      if (!getVCPHumanPoseImageRequestClass(void)::softClass)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = ___ZL32getVCPHumanPoseImageRequestClassv_block_invoke;
        v16[3] = &unk_1E4548FA8;
        v16[4] = &v17;
        ___ZL32getVCPHumanPoseImageRequestClassv_block_invoke((uint64_t)v16);
        v9 = (void *)v18[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v17, 8);
      v11 = (VCPRequest *)objc_msgSend([v10 alloc], "initWithOptions:", v8);
      humanPoseDetector = self->super._humanPoseDetector;
      self->super._humanPoseDetector = v11;

      if (self->super._humanPoseDetector)
      {
        v13 = 1;
LABEL_11:

        goto LABEL_12;
      }
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to setup request in VNDetectHumanBodyPoseRequest"));
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    v13 = 0;
    goto LABEL_11;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v6 = a4;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNHumanBodyPoseDetector _vcpRequestRevisionForOptions:](self, "_vcpRequestRevisionForOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNHumanBodyPoseDetector _vcpRequestRevisionForOptions:](self, "_vcpRequestRevisionForOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToNumber:", &unk_1E459C9E8)
    && (objc_msgSend(v9, "isEqualToNumber:", &unk_1E459C9D0) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VNHumanBodyPoseDetector;
    v10 = -[VNDetector canBehaveAsDetectorOfClass:withConfiguration:](&v12, sel_canBehaveAsDetectorOfClass_withConfiguration_, a3, v6);
  }

  return v10;
}

- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v6 = a4;
  -[VNDetector configurationOptions](self, "configurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNHumanBodyPoseDetector _vcpRequestRevisionForOptions:](self, "_vcpRequestRevisionForOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNHumanBodyPoseDetector _vcpRequestRevisionForOptions:](self, "_vcpRequestRevisionForOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToNumber:", &unk_1E459C9E8)
    && (objc_msgSend(v9, "isEqualToNumber:", &unk_1E459C9D0) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)VNHumanBodyPoseDetector;
    v10 = -[VNDetector shouldBeReplacedByDetectorOfClass:withConfiguration:](&v12, sel_shouldBeReplacedByDetectorOfClass_withConfiguration_, a3, v6);
  }

  return v10;
}

- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNHumanBodyPoseDetector;
  -[VNHumanPoseDetector vcpPoseRequestSetupOptionsForDetectorOptions:error:](&v15, sel_vcpPoseRequestSetupOptionsForDetectorOptions_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v6, objc_opt_class(), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "requestRevision");
      if (v10 == 1)
      {
        getVCPRequestRevisionPropertyKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E459CA00, v11);
        goto LABEL_8;
      }
      if (v10 == 3737841664)
      {
        -[VNHumanBodyPoseDetector _vcpRequestRevisionForOptions:](self, "_vcpRequestRevisionForOptions:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        getVCPRequestRevisionPropertyKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

LABEL_8:
        v13 = v7;
LABEL_12:

        goto LABEL_13;
      }
      if (a4)
      {
        +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v9);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)_vcpRequestRevisionForOptions:(id)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v6;
  char v7;

  v7 = 1;
  v6 = 0;
  v3 = +[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v7, CFSTR("VNHumanBodyPoseDetectorProcessOption_HolisticDetection"), a3, 1, &v6);
  v4 = &unk_1E459C9D0;
  if (!v7)
    v4 = &unk_1E459C9E8;
  if (v3)
    return v4;
  else
    return 0;
}

@end
