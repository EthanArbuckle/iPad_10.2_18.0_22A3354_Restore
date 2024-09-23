@implementation ARObjectScanningConfiguration

+ (BOOL)isSupported
{
  return +[ARWorldTrackingConfiguration isSupported](ARWorldTrackingConfiguration, "isSupported");
}

- (ARObjectScanningConfiguration)init
{
  ARObjectScanningConfiguration *v2;
  ARObjectScanningConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARObjectScanningConfiguration;
  v2 = -[ARConfiguration initPrivate](&v5, sel_initPrivate);
  v3 = v2;
  if (v2)
  {
    -[ARConfiguration setAutoFocusEnabled:](v2, "setAutoFocusEnabled:", 1);
    -[ARObjectScanningConfiguration setLowQosSchedulingEnabled:](v3, "setLowQosSchedulingEnabled:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.planeEstimation.enableLowQosScheduling")));
  }
  return v3;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return a3 == 0;
}

+ (id)supportedVideoFormats
{
  void *v2;
  void *v3;
  void *v4;

  +[ARWorldTrackingConfiguration supportedVideoFormats](ARWorldTrackingConfiguration, "supportedVideoFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_119);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __54__ARObjectScanningConfiguration_supportedVideoFormats__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "has4KVideoResolution") ^ 1;
}

- (id)imageSensorSettings
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARObjectScanningConfiguration;
  -[ARConfiguration imageSensorSettings](&v4, sel_imageSensorSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVisionDataOutputEnabled:", 0);
  return v2;
}

- (void)createTechniques:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ARWorldTrackingTechnique *v10;
  ARParentTechnique *v11;
  void *v12;
  ARParentTechnique *v13;
  void *v14;
  uint64_t v15;
  ARPlaneEstimationTechnique *v16;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[ARObjectScanningConfiguration imageSensorSettings](self, "imageSensorSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageSensorSettings:", v6);

  -[ARConfiguration deviceModel](self, "deviceModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceModel:", v7);

  objc_msgSend(v5, "setSlamConfiguration:", CFSTR("ObjectDetectionMapBuilding"));
  objc_msgSend(v5, "setPlaneDetection:", -[ARObjectScanningConfiguration planeDetection](self, "planeDetection"));
  objc_msgSend(v5, "setMlModelEnabled:", -[ARObjectScanningConfiguration isMLModelEnabled](self, "isMLModelEnabled"));
  objc_msgSend(v5, "setLowQosSchedulingEnabled:", -[ARObjectScanningConfiguration isLowQosSchedulingEnabled](self, "isLowQosSchedulingEnabled"));
  objc_msgSend(v5, "setPlaneEstimationShouldUseJasperData:", 0);
  -[ARConfiguration replaySensor](self, "replaySensor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "replayMode"))
    objc_msgSend(v5, "setDeterministicMode:", 1);
  v10 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v5);
  if (v10)
  {
    v11 = [ARParentTechnique alloc];
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ARParentTechnique initWithParallelTechniques:](v11, "initWithParallelTechniques:", v12);

    objc_msgSend(v4, "addObject:", v13);
    -[ARWorldTrackingTechnique options](v10, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "planeDetection");

    if (v15)
    {
      v16 = -[ARPlaneEstimationTechnique initWithTrackingTechnique:]([ARPlaneEstimationTechnique alloc], "initWithTrackingTechnique:", v10);
      objc_msgSend(v4, "addObject:", v16);

    }
    v17.receiver = self;
    v17.super_class = (Class)ARObjectScanningConfiguration;
    -[ARConfiguration createTechniques:](&v17, sel_createTechniques_, v4);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARObjectScanningConfiguration;
  if (-[ARConfiguration isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = self->_planeDetection == v5[15]
      && self->_mlModelEnabled == *((unsigned __int8 *)v5 + 112)
      && self->_lowQosSchedulingEnabled == *((unsigned __int8 *)v5 + 113)
      && self->_deliverRawSceneUnderstandingResults == *((unsigned __int8 *)v5 + 114);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARObjectScanningConfiguration;
  result = -[ARConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 15) = self->_planeDetection;
  *((_BYTE *)result + 112) = self->_mlModelEnabled;
  *((_BYTE *)result + 113) = self->_lowQosSchedulingEnabled;
  *((_BYTE *)result + 114) = self->_deliverRawSceneUnderstandingResults;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled");
  v8 = CFSTR("Disabled");
  if (v7)
    v8 = CFSTR("Enabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" autoFocus=%@"), v8);
  NSStringFromARPlaneDetection(self->_planeDetection);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" planeDetection=%@"), v9);

  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v10);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (BOOL)isMLModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)deliverRawSceneUnderstandingResults
{
  return self->_deliverRawSceneUnderstandingResults;
}

- (void)setDeliverRawSceneUnderstandingResults:(BOOL)a3
{
  self->_deliverRawSceneUnderstandingResults = a3;
}

@end
