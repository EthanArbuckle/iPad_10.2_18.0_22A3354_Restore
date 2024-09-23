@implementation VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
}

- (VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations)init
{
  VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *configurations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations;
  v2 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    configurations = v2->_configurations;
    v2->_configurations = v3;

  }
  return v2;
}

- (id)allConfigurations
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_configurations, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)configurationForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *v18;
  void *v19;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "regionOfInterest");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = ((uint64_t (*)(id, char *))objc_msgSend(v4, "methodForSelector:", sel_imageCropAndScaleOption))(v4, sel_imageCropAndScaleOption);
  else
    v13 = 2;
  v21 = 0;
  v14 = (void *)objc_msgSend(v4, "applicableDetectorClassAndOptions:forRevision:error:", &v21, objc_msgSend(v4, "resolvedRevision"), 0);
  v15 = v21;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v14 != 0, CFSTR("detector class could not be resolved"));
  objc_msgSend(v14, "computeDeviceForComputeStage:configurationOptions:error:", CFSTR("VNComputeStageMain"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v16 != 0, CFSTR("main stage compute device could not be resolved"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%g,%g,%g,%g]:%@:%u"), v6, v8, v10, v12, v16, v13);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", v17);
  v18 = (VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v18 = -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration initWithMainStageComputeDevice:]([VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration alloc], "initWithMainStageComputeDevice:", v16);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_configurations, "setObject:forKeyedSubscript:");
  }
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration addOriginalRequest:](v18, "addOriginalRequest:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration setDetectorConfigurationOption:value:](v18, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"), v19);

  return v18;
}

- (unint64_t)configurationsCount
{
  return -[NSMutableDictionary count](self->_configurations, "count");
}

@end
