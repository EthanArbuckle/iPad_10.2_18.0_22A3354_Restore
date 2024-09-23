@implementation ARRecordingConfiguration

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return 1;
}

- (ARRecordingConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  ARRecordingTechniquePublic *v20;
  ARRecordingConfiguration *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v6, "techniques");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = 15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "requiredSensorDataTypes");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 15;
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "secondaryTechniques", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "requiredSensorDataTypes");
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = objc_msgSend(v6, "isCollaborationEnabled");
  else
    v19 = 0;
  v20 = -[ARRecordingTechniquePublic initWithFileURL:recordingSensorDataTypes:startImmediately:recordCollaborationData:]([ARRecordingTechniquePublic alloc], "initWithFileURL:recordingSensorDataTypes:startImmediately:recordCollaborationData:", v7, v12, 0, v19);
  v21 = -[ARRecordingConfiguration initWithBaseConfiguration:recordingTechnique:](self, "initWithBaseConfiguration:recordingTechnique:", v6, v20);

  return v21;
}

- (ARRecordingConfiguration)initWithBaseConfiguration:(id)a3 recordingTechnique:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ARRecordingConfiguration *v9;
  id *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "templateConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ARRecordingConfiguration initWithBaseConfiguration:recordingTechnique:](self, "initWithBaseConfiguration:recordingTechnique:", v8, v7);

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ARRecordingConfiguration;
    v10 = -[ARCustomTechniquesConfiguration initPrivate](&v20, sel_initPrivate);
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v7;
        objc_msgSend(v6, "parentImageSensorSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setParentImageSensorSettings:", v12);

      }
      objc_storeStrong(v10 + 18, a4);
      objc_msgSend(v7, "outputFileURL");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v10[17];
      v10[17] = (id)v13;

      objc_msgSend(v6, "techniques");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v10, "setTemplateConfiguration:", v6);
      v17 = objc_msgSend(v16, "indexOfObjectPassingTest:", &__block_literal_global_118);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v16, "removeObjectAtIndex:", v17);
      objc_msgSend(v16, "addObject:", v7);
      objc_msgSend(v10, "setAutoFocusEnabled:", objc_msgSend(v6, "isAutoFocusEnabled"));
      objc_msgSend(v10, "setProvidesAudioData:", objc_msgSend(v6, "providesAudioData"));
      objc_msgSend(v6, "customSensors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCustomSensors:", v18);

      objc_msgSend(v10, "setFrameSemantics:", objc_msgSend(v6, "frameSemantics"));
      objc_msgSend(v10, "setTechniques:", v16);

    }
    v9 = v10;
  }

  return v9;
}

uint64_t __73__ARRecordingConfiguration_initWithBaseConfiguration_recordingTechnique___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF08E0E8);
}

- (id)initPrivate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  ARRecordingConfiguration *v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ARRecordingConfiguration initPrivate]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = -[ARRecordingConfiguration initWithBaseConfiguration:fileURL:](self, "initWithBaseConfiguration:fileURL:", v6, v7);

  return v8;
}

- (ARRecordingTechniqueProtocol)recordingTechnique
{
  -[ARCustomTechniquesConfiguration _configureRecordingTechniqueIfNeeded](self, "_configureRecordingTechniqueIfNeeded");
  return self->_recordingTechnique;
}

- (void)startRecording
{
  void *v3;
  id v4;

  if (-[ARRecordingConfiguration state](self, "state"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("You cannot start more than once"));
  -[ARRecordingConfiguration setState:](self, "setState:", 1);
  -[ARRecordingConfiguration customUserData](self, "customUserData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARRecordingTechniqueProtocol setCustomUserData:](self->_recordingTechnique, "setCustomUserData:", v3);

  -[ARRecordingConfiguration recordingTechnique](self, "recordingTechnique");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startRecording");

}

- (void)finishRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[ARRecordingConfiguration state](self, "state") != 1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("You cannot finish before start or more than once"));
  -[ARRecordingConfiguration setState:](self, "setState:", 2);
  -[ARRecordingConfiguration setFinishBlock:](self, "setFinishBlock:", v4);

  -[ARRecordingConfiguration recordingTechnique](self, "recordingTechnique");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordingTechniqueDelegate:", self);

  -[ARRecordingConfiguration recordingTechnique](self, "recordingTechnique");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishRecording");

}

- (void)abortRecording
{
  id v3;

  if (-[ARRecordingConfiguration state](self, "state") == 1)
  {
    -[ARRecordingConfiguration setState:](self, "setState:", 2);
    -[ARRecordingConfiguration recordingTechnique](self, "recordingTechnique");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "abortRecording");

  }
}

+ (BOOL)isSupported
{
  return +[ARRecordingTechniquePublic isSupported](ARRecordingTechniquePublic, "isSupported");
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

- (void)setVideoFormat:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ARRecordingConfiguration setVideoFormat:]");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@: Cannot set videoFormat for %@."), v7, v6);

}

- (id)videoFormat
{
  void *v2;
  void *v3;

  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)imageSensorSettings
{
  void *v2;
  void *v3;

  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageSensorSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parentImageSensorSettings
{
  void *v2;
  void *v3;

  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentImageSensorSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)secondaryTechniques
{
  void *v2;
  void *v3;

  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTechniques");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" fileURL=%@"), self->_fileURL);
  -[ARCustomTechniquesConfiguration templateConfiguration](self, "templateConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" templateConfiguration=%@"), v8);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (void)technique:(id)a3 didFinishWithResult:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[ARRecordingConfiguration finishBlock](self, "finishBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARRecordingConfiguration finishBlock](self, "finishBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

    -[ARRecordingConfiguration setFinishBlock:](self, "setFinishBlock:", 0);
  }

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setRecordingTechnique:(id)a3
{
  objc_storeStrong((id *)&self->_recordingTechnique, a3);
}

- (NSDictionary)customUserData
{
  return self->_customUserData;
}

- (void)setCustomUserData:(id)a3
{
  objc_storeStrong((id *)&self->_customUserData, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)finishBlock
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setFinishBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong((id *)&self->_customUserData, 0);
  objc_storeStrong((id *)&self->_recordingTechnique, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
