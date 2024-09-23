@implementation ARReplayConfiguration

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return 1;
}

- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4 outError:(id *)a5
{
  return -[ARReplayConfiguration initWithBaseConfiguration:fileURL:replayMode:outError:](self, "initWithBaseConfiguration:fileURL:replayMode:outError:", a3, a4, 0, a5);
}

- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4 replayMode:(int64_t)a5 outError:(id *)a6
{
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  ARReplayConfiguration *v14;

  v10 = a3;
  v11 = a4;
  v12 = (objc_class *)ARReplaySensorClassForMovieURL(v11, a6);
  if (v12)
  {
    v13 = (void *)objc_msgSend([v12 alloc], "initWithSequenceURL:replayMode:", v11, a5);
    objc_msgSend(v13, "setReplaySensorDelegate:", self);
    self = -[ARReplayConfiguration initWithBaseConfiguration:replaySensor:](self, "initWithBaseConfiguration:replaySensor:", v10, v13);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 replaySensor:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id *v10;
  ARReplayConfiguration *v11;
  uint64_t v12;
  NSURL *fileURL;
  uint64_t v14;
  NSNumber *vioSessionID;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ARReplayConfiguration *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v6, "parentImageSensorSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParentImageSensorSettings:", v9);

  }
  v22.receiver = self;
  v22.super_class = (Class)ARReplayConfiguration;
  v10 = -[ARCustomTechniquesConfiguration initPrivate](&v22, sel_initPrivate);
  v11 = (ARReplayConfiguration *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 17, a4);
    objc_msgSend(v7, "sequenceURL");
    v12 = objc_claimAutoreleasedReturnValue();
    fileURL = v11->_fileURL;
    v11->_fileURL = (NSURL *)v12;

    objc_msgSend(MEMORY[0x1E0CFCB50], "grabCMSessionID:", v11->_fileURL);
    v14 = objc_claimAutoreleasedReturnValue();
    vioSessionID = v11->_vioSessionID;
    v11->_vioSessionID = (NSNumber *)v14;

    objc_msgSend(v7, "replaySensorDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend(v7, "setReplaySensorDelegate:", v11);
    -[ARCustomTechniquesConfiguration setTemplateConfiguration:](v11, "setTemplateConfiguration:", v6);
    if (v7)
    {
      v23[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARCustomTechniquesConfiguration setCustomSensors:](v11, "setCustomSensors:", v17);

    }
    else
    {
      -[ARCustomTechniquesConfiguration setCustomSensors:](v11, "setCustomSensors:", MEMORY[0x1E0C9AA60]);
    }
    -[ARReplayConfiguration setAlwaysUsePrimaryCameraForHiResOrX420VideoFormat](v11, "setAlwaysUsePrimaryCameraForHiResOrX420VideoFormat");
    -[ARCustomTechniquesConfiguration templateConfiguration](v11, "templateConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "techniques");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCustomTechniquesConfiguration setTechniques:](v11, "setTechniques:", v19);

    -[ARConfiguration setFrameSemantics:](v11, "setFrameSemantics:", objc_msgSend(v6, "frameSemantics"));
    -[ARConfiguration setFrameDebugOptions:](v11, "setFrameDebugOptions:", objc_msgSend(v6, "frameDebugOptions"));
    -[ARConfiguration setPersonMetadataEnabled:](v11, "setPersonMetadataEnabled:", objc_msgSend(v6, "isPersonMetadataEnabled"));
    v20 = v11;
  }

  return v11;
}

- (id)initPrivate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  ARReplayConfiguration *v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ARReplayConfiguration initPrivate]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = -[ARReplayConfiguration initWithBaseConfiguration:fileURL:outError:](self, "initWithBaseConfiguration:fileURL:outError:", v6, v7, 0);

  return v8;
}

- (void)play
{
  -[ARReplaySensorProtocol advanceToFrameIndex:](self->_replaySensor, "advanceToFrameIndex:", -1);
}

- (void)pause
{
  -[ARReplaySensorProtocol advanceToFrameIndex:](self->_replaySensor, "advanceToFrameIndex:", 0);
}

- (int64_t)worldAlignment
{
  void *v2;
  int64_t v3;

  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "worldAlignment");

  return v3;
}

- (id)parentImageSensorSettings
{
  ARReplayConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  ARReplayConfiguration *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v2 = self;
  v35 = *MEMORY[0x1E0C80C00];
  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentImageSensorSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v4;
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v11 = &OBJC_IVAR___ARReplaySensorPublic__croppingTechnique;
    v27 = v2;
    do
    {
      v12 = 0;
      v29 = v9;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        v14 = v11[275];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = *(id *)((char *)&v2->super.super.super.isa + v14);
          objc_msgSend(v13, "videoFormat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16)
            goto LABEL_13;
          objc_msgSend(v16, "device");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v17, "device");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "deviceType");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "device");
            v21 = v10;
            v22 = v7;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "availableVideoFormatForDeviceType:position:", v20, objc_msgSend(v23, "position"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v22;
            v10 = v21;
            v2 = v27;

          }
          else
          {
            objc_msgSend(v17, "captureDeviceType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "availableVideoFormatForDeviceType:position:", v19, objc_msgSend(v17, "captureDevicePosition"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v11 = &OBJC_IVAR___ARReplaySensorPublic__croppingTechnique;
          if (v24)
          {
            objc_msgSend(v13, "setVideoFormat:", v24);

          }
          else
          {
LABEL_13:
            objc_msgSend(v28, "addObject:", v13);
          }

          v9 = v29;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "removeObjectsInArray:", v28);
  objc_msgSend(v26, "setSettings:", v7);

  return v26;
}

- (id)imageSensorSettings
{
  void *v3;
  void *v4;
  ARReplaySensorProtocol *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageSensorSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self->_replaySensor;
      objc_msgSend(v4, "videoFormat");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "device");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "device");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deviceType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "device");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARReplaySensorProtocol availableVideoFormatForDeviceType:position:](v5, "availableVideoFormatForDeviceType:position:", v10, objc_msgSend(v11, "position"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v7, "captureDeviceType");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARReplaySensorProtocol availableVideoFormatForDeviceType:position:](v5, "availableVideoFormatForDeviceType:position:", v9, objc_msgSend(v7, "captureDevicePosition"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v12)
        {
          objc_msgSend(v4, "setVideoFormat:", v12);

        }
      }

    }
    objc_msgSend(v4, "setVisionDataOutputEnabled:", 0);
    return v4;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ARReplayConfiguration;
    -[ARCustomTechniquesConfiguration imageSensorSettings](&v14, sel_imageSensorSettings);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)imageSensorSettingsForUltraWide
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;
  char v7;
  id v8;
  ARReplaySensorProtocol *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      v6 = objc_opt_isKindOfClass();

      -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 & 1) == 0)
      {
        objc_opt_class();
        v7 = objc_opt_isKindOfClass();

        if ((v7 & 1) == 0)
        {
          v8 = 0;
          goto LABEL_15;
        }
        -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v5, "imageSensorSettingsForUltraWide");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = self->_replaySensor;
        objc_msgSend(v8, "videoFormat");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_13;
        v11 = (void *)v10;
        objc_msgSend(v8, "videoFormat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "captureDeviceType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "videoFormat");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARReplaySensorProtocol availableVideoFormatForDeviceType:position:](v9, "availableVideoFormatForDeviceType:position:", v13, objc_msgSend(v14, "captureDevicePosition"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
LABEL_13:

          v16 = 0;
LABEL_16:

          return v16;
        }
        objc_msgSend(v8, "setVideoFormat:", v15);

      }
      objc_msgSend(v8, "setVisionDataOutputEnabled:", 0);
    }
LABEL_15:
    v8 = v8;
    v16 = v8;
    goto LABEL_16;
  }
  v16 = 0;
  return v16;
}

- (NSNumber)vioSessionID
{
  NSNumber *vioSessionID;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  vioSessionID = self->_vioSessionID;
  if (!vioSessionID)
  {
    v4 = (void *)MEMORY[0x1E0CFCB50];
    -[ARReplayConfiguration fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "grabCMSessionID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSNumber *)objc_msgSend(v6, "copy");
    v8 = self->_vioSessionID;
    self->_vioSessionID = v7;

    vioSessionID = self->_vioSessionID;
  }
  return vioSessionID;
}

- (void)ensureTechniqueAndCustomSensorCompatibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  ARWorldTrackingTechnique *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)ARReplayConfiguration;
  -[ARCustomTechniquesConfiguration ensureTechniqueAndCustomSensorCompatibility](&v13, sel_ensureTechniqueAndCustomSensorCompatibility);
  -[ARCustomTechniquesConfiguration techniques](self, "techniques");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARReplayConfiguration vioSessionID](self, "vioSessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVioSessionID:", v7);

    objc_msgSend(v5, "mutableOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v6);
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARParentTechnique techniquesByForceReplacingTechniques:withMatchingClassTechniques:](ARParentTechnique, "techniquesByForceReplacingTechniques:withMatchingClassTechniques:", v3, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARCustomTechniquesConfiguration setTechniques:](self, "setTechniques:", v12);

    }
  }

}

- (id)secondaryTechniques
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
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  ARWorldTrackingTechnique *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryTechniques");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[ARTechnique techniqueOfClass:inArray:](ARTechnique, "techniqueOfClass:inArray:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARConfiguration deviceModel](self, "deviceModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceModel:", v8);

    -[ARConfiguration replaySensor](self, "replaySensor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "replayMode"))
      objc_msgSend(v7, "setDeterministicMode:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setVisionDataWillBeReplayed:", objc_msgSend(v10, "shouldReplayVisionData"));
    if (self->super.super._videoFormat)
    {
      -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageSensorSettingsForWorldTracking");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setVisionDataOutputEnabled:", 0);
        objc_msgSend(v7, "setImageSensorSettings:", v14);

      }
    }
    objc_msgSend(v6, "mutableOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v7);

    if (v16)
    {
      v17 = v4;
    }
    else
    {
      v18 = -[ARWorldTrackingTechnique initWithOptions:]([ARWorldTrackingTechnique alloc], "initWithOptions:", v7);
      v21[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ARParentTechnique techniquesByForceReplacingTechniques:withMatchingClassTechniques:](ARParentTechnique, "techniquesByForceReplacingTechniques:withMatchingClassTechniques:", v4, v19);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = v4;
  }

  return v17;
}

- (void)setAlwaysUsePrimaryCameraForHiResOrX420VideoFormat
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  id v13;

  -[ARConfiguration replaySensor](self, "replaySensor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ARConfiguration replaySensor](self, "replaySensor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "availableVideoFormatForDeviceType:position:", *MEMORY[0x1E0C89FA0], 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5
      || (objc_msgSend(v5, "has4KVideoResolution") & 1) == 0 && !objc_msgSend(v6, "isX420PixelFormat"))
    {
      goto LABEL_10;
    }
    -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isKindOfConfiguration:", objc_opt_class());

    -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) == 0)
    {
      v10 = objc_msgSend(v9, "isKindOfConfiguration:", objc_opt_class());

      -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 & 1) == 0)
      {
        v11 = objc_msgSend(v9, "isKindOfConfiguration:", objc_opt_class());

        if (!v11)
        {
LABEL_10:

          return;
        }
        -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v9, "getAsKindOfConfiguration:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAlwaysUsePrimaryCameraForTracking:", 1);
    goto LABEL_10;
  }
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" fileURL=%@"), self->_fileURL);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (void)replaySensorDidFinishReplayingData
{
  id v3;

  -[ARReplayConfiguration delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replayConfigurationDidFinishReplaying:", self);

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (ARReplayConfigurationDelegate)delegate
{
  return (ARReplayConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_vioSessionID, 0);
  objc_storeStrong((id *)&self->_replaySensor, 0);
}

@end
