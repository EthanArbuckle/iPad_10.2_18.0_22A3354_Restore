@implementation ARCustomTechniquesConfiguration

+ (NSArray)supportedVideoFormats
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)initPrivate
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  v2 = -[ARConfiguration initPrivate](&v4, sel_initPrivate);
  if (v2 && ARShouldSupport1440pAndAutofocus())
    objc_msgSend(v2, "setAutoFocusEnabled:", 1);
  return v2;
}

- (void)setVideoFormat:(id)a3
{
  objc_storeStrong((id *)&self->super._videoFormat, a3);
}

- (id)imageSensorSettings
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t i;
  ARConfiguration *templateConfiguration;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)ARCustomTechniquesConfiguration;
  -[ARConfiguration imageSensorSettings](&v18, sel_imageSensorSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_techniques;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = (_QWORD *)MEMORY[0x1E0C8AA68];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = (_QWORD *)MEMORY[0x1E0C8AA38];
LABEL_12:
          objc_msgSend(v3, "setMetaData:", *v8, v14);
          goto LABEL_13;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  templateConfiguration = self->_templateConfiguration;
  if (templateConfiguration)
  {
    -[ARConfiguration imageSensorSettings](templateConfiguration, "imageSensorSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisionDataOutputEnabled:", objc_msgSend(v11, "visionDataOutputEnabled"));
    objc_msgSend(v11, "visionDataOutputParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisionDataOutputParameters:", v12);

  }
  return v3;
}

- (int64_t)worldAlignment
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[ARConfiguration worldAlignment](self->_templateConfiguration, "worldAlignment");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ARCustomTechniquesConfiguration techniques](self, "techniques", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = objc_msgSend(v9, "alignment");

          return v10;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  return 2;
}

- (BOOL)isLightEstimationEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ARCustomTechniquesConfiguration techniques](self, "techniques", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        v7 = 1;
        goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v7 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (ARWorldMap)initialWorldMap
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class();
  -[ARCustomTechniquesConfiguration techniques](self, "techniques");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "initialWorldMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ARWorldMap *)v7;
}

- (void)setCustomSensors:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  -[ARConfiguration setCustomSensors:](&v4, sel_setCustomSensors_, a3);
  -[ARCustomTechniquesConfiguration _updateCaptureSettings](self, "_updateCaptureSettings");
  self->_needsEnsureTechniqueAndCustomSensorCompatibility = 1;
}

- (void)setCameraPosition:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  -[ARConfiguration setCameraPosition:](&v4, sel_setCameraPosition_, a3);
  -[ARCustomTechniquesConfiguration _updateCaptureSettings](self, "_updateCaptureSettings");
  self->_needsEnsureTechniqueAndCustomSensorCompatibility = 1;
}

- (void)setProvidesAudioData:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  -[ARConfiguration setProvidesAudioData:](&v4, sel_setProvidesAudioData_, a3);
  self->_needsConfigureRecordingTechnique = 1;
}

- (void)setTechniques:(id)a3
{
  NSArray *v4;
  NSArray *techniques;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  techniques = self->_techniques;
  self->_techniques = v4;

  -[ARCustomTechniquesConfiguration _updateCaptureSettings](self, "_updateCaptureSettings");
  self->_needsEnsureTechniqueAndCustomSensorCompatibility = 1;
  self->_needsConfigureRecordingTechnique = 1;
}

- (NSArray)techniques
{
  -[ARCustomTechniquesConfiguration _ensureTechniqueAndCustomSensorCompatibilityIfNeeded](self, "_ensureTechniqueAndCustomSensorCompatibilityIfNeeded");
  -[ARCustomTechniquesConfiguration _configureRecordingTechniqueIfNeeded](self, "_configureRecordingTechniqueIfNeeded");
  return self->_techniques;
}

- (void)_updateCaptureSettings
{
  void *v3;
  NSArray *techniques;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  ARVideoFormat *v9;
  ARVideoFormat *v10;
  ARVideoFormat *v11;
  ARVideoFormat *videoFormat;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  ARCustomTechniquesConfiguration *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[ARConfiguration customSensors](self, "customSensors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return;
  }
  if (!-[ARConfiguration cameraPosition](self, "cameraPosition"))
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__7;
    v26 = __Block_byref_object_dispose__7;
    v27 = (id)*MEMORY[0x1E0C89FA0];
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    techniques = self->_techniques;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__ARCustomTechniquesConfiguration__updateCaptureSettings__block_invoke;
    v17[3] = &unk_1E6675F08;
    v17[4] = &v28;
    v17[5] = &v22;
    v17[6] = &v18;
    -[NSArray enumerateObjectsUsingBlock:](techniques, "enumerateObjectsUsingBlock:", v17);
    v5 = v29[3];
    if (v5 == -[ARVideoFormat captureDevicePosition](self->super._videoFormat, "captureDevicePosition"))
    {
      v6 = (void *)v23[5];
      -[ARVideoFormat captureDeviceType](self->super._videoFormat, "captureDeviceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = v6 == v7;

      if ((v6 & 1) != 0)
      {
LABEL_17:
        _Block_object_dispose(&v18, 8);
        _Block_object_dispose(&v22, 8);

        _Block_object_dispose(&v28, 8);
        return;
      }
    }
    if (*((_BYTE *)v19 + 24))
    {
      +[ARWorldTrackingConfiguration supportedVideoFormats](ARWorldTrackingConfiguration, "supportedVideoFormats");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:", v29[3], v23[5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v11 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
      videoFormat = self->super._videoFormat;
      self->super._videoFormat = v11;

      if (self->super._videoFormat || !ARRGBFaceTrackingEnabled())
        goto LABEL_12;
      +[ARFaceTrackingConfiguration fallbackVideoFormat](ARFaceTrackingConfiguration, "fallbackVideoFormat");
      v9 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
    }
    v10 = self->super._videoFormat;
    self->super._videoFormat = v9;

LABEL_12:
    if (_ARLogGeneral_onceToken_52 != -1)
      dispatch_once(&_ARLogGeneral_onceToken_52, &__block_literal_global_172);
    v13 = (id)_ARLogGeneral_logObj_52;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ARVideoFormat description](self->super._videoFormat, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v15;
      v34 = 2048;
      v35 = self;
      v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_1B3A68000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Video format updated in custom techniques configurations: %{public}@", buf, 0x20u);

    }
    goto LABEL_17;
  }
}

void __57__ARCustomTechniquesConfiguration__updateCaptureSettings__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "techniqueOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 2;
    ARFaceTrackingDevice();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = v10;
    goto LABEL_5;
  }
  objc_msgSend(v10, "techniqueOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
  objc_msgSend(v10, "techniqueOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v9)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
LABEL_5:

}

- (void)ensureTechniqueAndCustomSensorCompatibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ARWorldTrackingTechnique *v12;
  NSArray *techniques;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  void *context;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), self->_techniques);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[ARConfiguration deviceModel](self, "deviceModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeviceModel:", v7);

    -[ARConfiguration replaySensor](self, "replaySensor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "replayMode"))
      objc_msgSend(v6, "setDeterministicMode:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setVisionDataWillBeReplayed:", objc_msgSend(v9, "shouldReplayVisionData"));
    if (self->super._videoFormat)
    {
      -[ARCustomTechniquesConfiguration imageSensorSettings](self, "imageSensorSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImageSensorSettings:", v10);

      -[ARCustomTechniquesConfiguration imageSensorSettingsForUltraWide](self, "imageSensorSettingsForUltraWide");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImageSensorSettingsForUltraWide:", v11);

    }
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    {
      v12 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v6);
      context = (void *)MEMORY[0x1B5E2DDB0]();
      v18[0] = v12;
      techniques = self->_techniques;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARParentTechnique techniquesByForceReplacingTechniques:withMatchingClassTechniques:](ARParentTechnique, "techniquesByForceReplacingTechniques:withMatchingClassTechniques:", techniques, v14);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v16 = self->_techniques;
      self->_techniques = v15;

      objc_autoreleasePoolPop(context);
    }

  }
}

- (id)imageSensorSettingsForUltraWide
{
  return 0;
}

- (void)configureRecordingTechnique
{
  NSArray *techniques;
  void *v4;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  id v9;

  techniques = self->_techniques;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_125);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](techniques, "filteredArrayUsingPredicate:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "setExpectAudioData:", -[ARConfiguration providesAudioData](self, "providesAudioData"));
    v6 = self->_techniques;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_119);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](v6, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setExpectDepthData:", objc_msgSend(v8, "count") != 0);
  }

}

uint64_t __62__ARCustomTechniquesConfiguration_configureRecordingTechnique__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF08E0E8);
}

unint64_t __62__ARCustomTechniquesConfiguration_configureRecordingTechnique__block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "requiredSensorDataTypes") >> 5) & 1;
}

- (void)_ensureTechniqueAndCustomSensorCompatibilityIfNeeded
{
  if (self->_needsEnsureTechniqueAndCustomSensorCompatibility)
  {
    self->_needsEnsureTechniqueAndCustomSensorCompatibility = 0;
    -[ARCustomTechniquesConfiguration ensureTechniqueAndCustomSensorCompatibility](self, "ensureTechniqueAndCustomSensorCompatibility");
  }
}

- (void)_configureRecordingTechniqueIfNeeded
{
  if (self->_needsConfigureRecordingTechnique)
  {
    self->_needsConfigureRecordingTechnique = 0;
    -[ARCustomTechniquesConfiguration configureRecordingTechnique](self, "configureRecordingTechnique");
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARCustomTechniquesConfiguration;
  if (-[ARConfiguration isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[ARCustomTechniquesConfiguration techniques](self, "techniques");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "techniques");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToArray:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARCustomTechniquesConfiguration;
  v4 = -[ARConfiguration copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[ARCustomTechniquesConfiguration techniques](self, "techniques");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[15];
  v4[15] = v6;

  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[16];
  v4[16] = v8;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARCustomTechniquesConfiguration techniques](self, "techniques");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" techniques=[%@]"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ARConfiguration)templateConfiguration
{
  return self->_templateConfiguration;
}

- (void)setTemplateConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateConfiguration, 0);
  objc_storeStrong((id *)&self->_techniques, 0);
}

@end
