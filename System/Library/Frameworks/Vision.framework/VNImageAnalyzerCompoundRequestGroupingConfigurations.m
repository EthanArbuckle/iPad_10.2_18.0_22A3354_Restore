@implementation VNImageAnalyzerCompoundRequestGroupingConfigurations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingConfigurations, 0);
}

- (_QWORD)groupingConfigurationForRequest:(uint64_t)a3 kind:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  VNImageAnalyzerCompoundRequestGroupingConfiguration *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v37;
  objc_super v38;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "regionOfInterest");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(v6, "frameworkClass");
    v16 = objc_msgSend(v6, "resolvedRevision");
    v17 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", v15, v16);
    v37 = 0;
    v18 = (void *)objc_msgSend(v6, "applicableDetectorClassAndOptions:forRevision:error:", &v37, v16, 0);
    v19 = v37;
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v18 != 0, CFSTR("detector class could not be resolved"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = ((uint64_t (*)(void *, char *))objc_msgSend(v6, "methodForSelector:", sel_imageCropAndScaleOption))(v6, sel_imageCropAndScaleOption);
    else
      v20 = 2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "useImageAnalyzerScaling"))
        v21 = 73;
      else
        v21 = 86;
    }
    else
    {
      v21 = 86;
    }
    objc_msgSend(v18, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v22 != 0, CFSTR("main stage compute device could not be resolved"));
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%g,%g,%g,%g]:%@:%u:%u:%c"), v8, v10, v12, v14, v22, v17, v20, v21);
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v23);
    v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v25 = [VNImageAnalyzerCompoundRequestGroupingConfiguration alloc];
      if (v25)
      {
        v26 = *(_QWORD *)(a1 + 16);
        v38.receiver = v25;
        v38.super_class = (Class)VNImageAnalyzerCompoundRequestGroupingConfiguration;
        v27 = objc_msgSendSuper2(&v38, sel_init);
        v24 = v27;
        if (v27)
        {
          v27[5] = v26;
          v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29 = (void *)v24[1];
          v24[1] = v28;

          v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v31 = (void *)v24[2];
          v24[2] = v30;

          v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v33 = (void *)v24[3];
          v24[3] = v32;

          v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v35 = (void *)v24[4];
          v24[4] = v34;

        }
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v24, v23);
    }
    objc_msgSend(v24, "addOriginalRequest:forKind:", v6, a3);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (VNImageAnalyzerCompoundRequestGroupingConfigurations)initWithDetectorModel:(unint64_t)a3
{
  VNImageAnalyzerCompoundRequestGroupingConfigurations *v4;
  VNImageAnalyzerCompoundRequestGroupingConfigurations *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *groupingConfigurations;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNImageAnalyzerCompoundRequestGroupingConfigurations;
  v4 = -[VNImageAnalyzerCompoundRequestGroupingConfigurations init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_detectorModel = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupingConfigurations = v5->_groupingConfigurations;
    v5->_groupingConfigurations = v6;

  }
  return v5;
}

- (unint64_t)detectorModel
{
  return self->_detectorModel;
}

@end
