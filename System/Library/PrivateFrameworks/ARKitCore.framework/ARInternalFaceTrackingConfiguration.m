@implementation ARInternalFaceTrackingConfiguration

- (ARInternalFaceTrackingConfiguration)init
{
  ARInternalFaceTrackingConfiguration *v2;
  ARInternalFaceTrackingConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARInternalFaceTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v5, sel_initPrivate);
  v3 = v2;
  if (v2)
  {
    -[ARInternalFaceTrackingConfiguration setLightEstimationEnabled:](v2, "setLightEstimationEnabled:", 1);
    -[ARInternalFaceTrackingConfiguration setMaximumNumberOfTrackedFaces:](v3, "setMaximumNumberOfTrackedFaces:", 1);
  }
  return v3;
}

- (void)setLightEstimationEnabled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[ARConfiguration setLightEstimation:](self, "setLightEstimation:", v3);
}

- (void)setCameraPosition:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  ARVideoFormat *v7;
  ARVideoFormat *videoFormat;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  ARInternalFaceTrackingConfiguration *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.faceTracking.backCamera.allowed")))
  {
    if (a3
      && (-[ARConfiguration videoFormat](self, "videoFormat"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "captureDevicePosition"),
          v5,
          v6 != a3))
    {
      v14.receiver = self;
      v14.super_class = (Class)ARInternalFaceTrackingConfiguration;
      -[ARConfiguration setCameraPosition:](&v14, sel_setCameraPosition_, a3);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "supportedVideoFormats");
      v13[1] = 3221225472;
      v13[2] = __57__ARInternalFaceTrackingConfiguration_setCameraPosition___block_invoke;
      v13[3] = &__block_descriptor_40_e30_B32__0__ARVideoFormat_8Q16_B24l;
      v13[4] = a3;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      objc_msgSend(v12, "ar_firstObjectPassingTest:", v13);
      v7 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
      videoFormat = self->super._videoFormat;
      self->super._videoFormat = v7;

      self->super._cameraPosition = a3;
    }
  }
  else
  {
    _ARLogGeneral_6();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: setCameraPosition failed: The camera position for face tracking cannot be changed.", buf, 0x16u);

    }
  }
}

BOOL __57__ARInternalFaceTrackingConfiguration_setCameraPosition___block_invoke(uint64_t a1, void *a2)
{
  return !*(_QWORD *)(a1 + 32) || objc_msgSend(a2, "captureDevicePosition") == *(_QWORD *)(a1 + 32);
}

+ (BOOL)isSupported
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ARInternalFaceTrackingConfiguration;
  v2 = objc_msgSendSuper2(&v4, sel_isSupported);
  if (v2)
    LOBYTE(v2) = +[ARFaceTrackingInternalTechnique isSupported](ARFaceTrackingInternalTechnique, "isSupported");
  return v2;
}

+ (id)supportedVideoFormats
{
  return +[ARFaceTrackingConfiguration supportedVideoFormats](ARFaceTrackingConfiguration, "supportedVideoFormats");
}

- (void)createTechniques:(id)a3
{
  id v4;
  ARFaceTrackingInternalTechnique *v5;
  ARFaceTrackingInternalTechnique *v6;
  ARParentTechnique *v7;
  void *v8;
  ARParentTechnique *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ARInternalFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces") < 1)
    goto LABEL_4;
  v5 = -[ARFaceTrackingInternalTechnique initWithMaximumNumberOfTrackedFaces:options:]([ARFaceTrackingInternalTechnique alloc], "initWithMaximumNumberOfTrackedFaces:options:", -[ARInternalFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces"), 0);
  if (v5)
  {
    v6 = v5;
    v7 = [ARParentTechnique alloc];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ARParentTechnique initWithParallelTechniques:](v7, "initWithParallelTechniques:", v8);

    objc_msgSend(v4, "addObject:", v9);
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)ARInternalFaceTrackingConfiguration;
    -[ARConfiguration createTechniques:](&v10, sel_createTechniques_, v4);
  }

}

- (void)setMaximumNumberOfTrackedFaces:(int64_t)a3
{
  int64_t v5;

  if (ARLinkedOnOrAfterYukon())
  {
    v5 = (int)+[ARFaceTrackingConfiguration supportedNumberOfTrackedFaces](ARFaceTrackingConfiguration, "supportedNumberOfTrackedFaces");
    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    self->_maximumNumberOfTrackedFaces = 0;
    return;
  }
  v5 = 1;
  if (a3 < 0)
    goto LABEL_6;
LABEL_3:
  if (v5 >= a3)
    self->_maximumNumberOfTrackedFaces = a3;
  else
    self->_maximumNumberOfTrackedFaces = v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  int64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARInternalFaceTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[ARInternalFaceTrackingConfiguration useAlternativeResources](self, "useAlternativeResources");
    if (v6 == objc_msgSend(v5, "useAlternativeResources"))
    {
      v8 = -[ARInternalFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces");
      v7 = v8 == objc_msgSend(v5, "maximumNumberOfTrackedFaces");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARInternalFaceTrackingConfiguration;
  v4 = -[ARConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setUseAlternativeResources:", -[ARInternalFaceTrackingConfiguration useAlternativeResources](self, "useAlternativeResources"));
  v4[15] = self->_maximumNumberOfTrackedFaces;
  return v4;
}

- (id)imageSensorSettings
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARInternalFaceTrackingConfiguration;
  -[ARConfiguration imageSensorSettings](&v4, sel_imageSensorSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMetaData:", *MEMORY[0x1E0C8AA38]);
  return v2;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (BOOL)useAlternativeResources
{
  return self->_useAlternativeResources;
}

- (void)setUseAlternativeResources:(BOOL)a3
{
  self->_useAlternativeResources = a3;
}

@end
