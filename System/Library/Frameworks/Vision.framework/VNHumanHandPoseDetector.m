@implementation VNHumanHandPoseDetector

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
  v15.super_class = (Class)VNHumanHandPoseDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v15, sel_completeInitializationForSession_error_, v6, a4))
  {
    -[VNDetector configurationOptions](self, "configurationOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNHumanHandPoseDetector vcpPoseRequestSetupOptionsForDetectorOptions:error:](self, "vcpPoseRequestSetupOptionsForDetectorOptions:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2050000000;
      v9 = (void *)getVCPHandPoseImageRequestClass(void)::softClass;
      v20 = getVCPHandPoseImageRequestClass(void)::softClass;
      if (!getVCPHandPoseImageRequestClass(void)::softClass)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = ___ZL31getVCPHandPoseImageRequestClassv_block_invoke;
        v16[3] = &unk_1E4548FA8;
        v16[4] = &v17;
        ___ZL31getVCPHandPoseImageRequestClassv_block_invoke((uint64_t)v16);
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
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Unable to setup request in VNDetectHumanHandPoseRequest"));
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

- (id)vcpPoseRequestSetupOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id result;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNHumanHandPoseDetector;
  -[VNHumanPoseDetector vcpPoseRequestSetupOptionsForDetectorOptions:error:](&v14, sel_vcpPoseRequestSetupOptionsForDetectorOptions_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = 0;
LABEL_13:

    return v12;
  }
  +[VNValidationUtilities originatingRequestSpecifierInOptions:specifyingRequestClass:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:specifyingRequestClass:error:", v6, objc_opt_class(), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_11;
  if (objc_msgSend(v8, "requestRevision") != 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v9);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v10 = (_QWORD *)getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr;
  v18 = getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr;
  if (!getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr)
  {
    v11 = (void *)VideoProcessingLibrary();
    v10 = dlsym(v11, "VCPRequestRevisionPropertyKey");
    v16[3] = (uint64_t)v10;
    getVCPRequestRevisionPropertyKeySymbolLoc(void)::ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v15, 8);
  if (v10)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E459CA48, *v10);
    v12 = v7;
LABEL_12:

    goto LABEL_13;
  }
  dlerror();
  result = (id)abort_report_np();
  __break(1u);
  return result;
}

- (id)vcpPoseRequestRuntimeOptionsForDetectorOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  id result;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNHumanHandPoseDetector;
  -[VNHumanPoseDetector vcpPoseRequestRuntimeOptionsForDetectorOptions:error:](&v14, sel_vcpPoseRequestRuntimeOptionsForDetectorOptions_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v13 = 0,
        !+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v13, CFSTR("VNHumanHandPoseDetectorProcessOption_MaximumHandCount"), v6, a4)))
  {
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v9 = (_QWORD *)getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr;
  v18 = getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr;
  if (!getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr)
  {
    v10 = (void *)VideoProcessingLibrary();
    v9 = dlsym(v10, "VCPRequestMaxNumOfHandsPropertyKey");
    v16[3] = (uint64_t)v9;
    getVCPRequestMaxNumOfHandsPropertyKeySymbolLoc(void)::ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v15, 8);
  if (v9)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *v9);

    v11 = v7;
LABEL_8:

    return v11;
  }
  dlerror();
  result = (id)abort_report_np();
  __break(1u);
  return result;
}

+ (Class)recognizedPointsObservationClass
{
  return (Class)objc_opt_class();
}

@end
