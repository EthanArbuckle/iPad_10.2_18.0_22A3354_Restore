@implementation CHDefaultHapticDeviceCapability

- (id)initPrivate
{
  CHDefaultHapticDeviceCapability *v3;
  objc_super v5;

  setupHapticLogScopes();
  v5.receiver = self;
  v5.super_class = (Class)CHDefaultHapticDeviceCapability;
  v3 = -[CHDefaultHapticDeviceCapability init](&v5, sel_init);
  if (v3)
  {
    v3->_supportsAudio = +[AVHapticPlayer supportsAudio](AVHapticPlayer, "supportsAudio");
    v3->_supportsHaptics = +[AVHapticPlayer supportsHaptics](AVHapticPlayer, "supportsHaptics");
  }
  return v3;
}

- (id)attributesForEventParameter:(id)a3 eventType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  CHHapticParameterAttributesImpl *v16;
  double v17;
  double v18;
  double v19;
  CHHapticParameterAttributesImpl *v20;
  NSObject *v21;
  id v22;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CHDefaultHapticDeviceCapability minimumValueForEventParameter:](self, "minimumValueForEventParameter:", v8);
  v11 = v10;
  -[CHDefaultHapticDeviceCapability maximumValueForEventParameter:](self, "maximumValueForEventParameter:", v8);
  v13 = v12;
  -[CHDefaultHapticDeviceCapability defaultValueForEventParameter:eventType:](self, "defaultValueForEventParameter:eventType:", v8, v9);
  v15 = v14;
  if (v11 != -999.0 && v13 != -999.0 && v14 != -999.0)
  {
    v16 = [CHHapticParameterAttributesImpl alloc];
    *(float *)&v17 = v11;
    *(float *)&v18 = v13;
    *(float *)&v19 = v15;
    v20 = -[CHHapticParameterAttributesImpl initWithMinValue:maxValue:defaultValue:](v16, "initWithMinValue:maxValue:defaultValue:", v17, v18, v19);
    goto LABEL_15;
  }
  if (!kHAPIScope)
  {
    v21 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
    goto LABEL_9;
  }
  v21 = *(id *)kHAPIScope;
  if (v21)
  {
LABEL_9:
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = 136315906;
      v25 = "CHDeviceCapability.mm";
      v26 = 1024;
      v27 = 355;
      v28 = 2080;
      v29 = "-[CHDefaultHapticDeviceCapability attributesForEventParameter:eventType:error:]";
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: In parameter %@ is not a valid CHHapticEventParameter", (uint8_t *)&v24, 0x26u);
    }

  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4820, 0);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_15:

  return v20;
}

- (float)minimumValueForEventParameter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  _QWORD v10[10];
  _QWORD v11[11];

  v11[10] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = CHHapticEventParameterIDHapticIntensity;
  v10[1] = CHHapticEventParameterIDHapticSharpness;
  v11[0] = &unk_1E6969820;
  v11[1] = &unk_1E6969820;
  v10[2] = CHHapticEventParameterIDAttackTime;
  v10[3] = CHHapticEventParameterIDDecayTime;
  v11[2] = &unk_1E6969820;
  v11[3] = &unk_1E6969820;
  v10[4] = CHHapticEventParameterIDReleaseTime;
  v10[5] = CHHapticEventParameterIDSustained;
  v11[4] = &unk_1E6969820;
  v11[5] = &unk_1E6969820;
  v10[6] = CHHapticEventParameterIDAudioVolume;
  v10[7] = CHHapticEventParameterIDAudioPitch;
  v11[6] = &unk_1E6969820;
  v11[7] = &unk_1E6969830;
  v10[8] = CHHapticEventParameterIDAudioPan;
  v10[9] = CHHapticEventParameterIDAudioBrightness;
  v11[8] = &unk_1E6969830;
  v11[9] = &unk_1E6969820;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = -999.0;
  }

  return v8;
}

- (float)maximumValueForEventParameter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  _QWORD v10[10];
  _QWORD v11[11];

  v11[10] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = CHHapticEventParameterIDHapticIntensity;
  v10[1] = CHHapticEventParameterIDHapticSharpness;
  v11[0] = &unk_1E6969810;
  v11[1] = &unk_1E6969810;
  v10[2] = CHHapticEventParameterIDAttackTime;
  v10[3] = CHHapticEventParameterIDDecayTime;
  v11[2] = &unk_1E6969810;
  v11[3] = &unk_1E6969810;
  v10[4] = CHHapticEventParameterIDReleaseTime;
  v10[5] = CHHapticEventParameterIDSustained;
  v11[4] = &unk_1E6969810;
  v11[5] = &unk_1E6969810;
  v10[6] = CHHapticEventParameterIDAudioVolume;
  v10[7] = CHHapticEventParameterIDAudioPitch;
  v11[6] = &unk_1E6969810;
  v11[7] = &unk_1E6969810;
  v10[8] = CHHapticEventParameterIDAudioPan;
  v10[9] = CHHapticEventParameterIDAudioBrightness;
  v11[8] = &unk_1E6969810;
  v11[9] = &unk_1E6969810;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = -999.0;
  }

  return v8;
}

- (float)defaultValueForEventParameter:(id)a3 eventType:(id)a4
{
  id v5;
  id v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  _QWORD v13[10];
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDHapticIntensity)
    || (v7 = 0.75, (objc_msgSend(v6, "isEqualToString:", CHHapticEventTypeHapticTransient) & 1) == 0))
  {
    if (!objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDHapticSharpness)
      || (v7 = 0.5, (objc_msgSend(v6, "isEqualToString:", CHHapticEventTypeHapticTransient) & 1) == 0))
    {
      v13[0] = CHHapticEventParameterIDHapticIntensity;
      v13[1] = CHHapticEventParameterIDHapticSharpness;
      v14[0] = &unk_1E6969840;
      v14[1] = &unk_1E6969850;
      v13[2] = CHHapticEventParameterIDAttackTime;
      v13[3] = CHHapticEventParameterIDDecayTime;
      v14[2] = &unk_1E6969820;
      v14[3] = &unk_1E6969820;
      v13[4] = CHHapticEventParameterIDReleaseTime;
      v13[5] = CHHapticEventParameterIDSustained;
      v14[4] = &unk_1E6969820;
      v14[5] = &unk_1E6969820;
      v13[6] = CHHapticEventParameterIDAudioVolume;
      v13[7] = CHHapticEventParameterIDAudioPitch;
      v14[6] = &unk_1E6969810;
      v14[7] = &unk_1E6969820;
      v13[8] = CHHapticEventParameterIDAudioPan;
      v13[9] = CHHapticEventParameterIDAudioBrightness;
      v14[8] = &unk_1E6969820;
      v14[9] = &unk_1E6969810;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "floatValue");
        v7 = v11;
      }
      else
      {
        v7 = -999.0;
      }

    }
  }

  return v7;
}

- (BOOL)supportsHaptics
{
  return self->_supportsHaptics;
}

- (CHDefaultHapticDeviceCapability)init
{

  return 0;
}

- (BOOL)supportsAudio
{
  return self->_supportsAudio;
}

- (unint64_t)maximumNumberOfHapticChannels
{
  return 1;
}

- (unint64_t)maximumNumberOfAudioChannels
{
  return 2;
}

- (float)maximumValueForDynamicParameter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  _QWORD v10[12];
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = CHHapticDynamicParameterIDHapticIntensityControl;
  v10[1] = CHHapticDynamicParameterIDHapticSharpnessControl;
  v11[0] = &unk_1E6969810;
  v11[1] = &unk_1E6969810;
  v10[2] = CHHapticDynamicParameterIDHapticAttackTimeControl;
  v10[3] = CHHapticDynamicParameterIDHapticDecayTimeControl;
  v11[2] = &unk_1E6969810;
  v11[3] = &unk_1E6969810;
  v10[4] = CHHapticDynamicParameterIDHapticReleaseTimeControl;
  v10[5] = CHHapticDynamicParameterIDAudioVolumeControl;
  v11[4] = &unk_1E6969810;
  v11[5] = &unk_1E6969810;
  v10[6] = CHHapticDynamicParameterIDAudioPanControl;
  v10[7] = CHHapticDynamicParameterIDAudioBrightnessControl;
  v11[6] = &unk_1E6969810;
  v11[7] = &unk_1E6969810;
  v10[8] = CHHapticDynamicParameterIDAudioPitchControl;
  v10[9] = CHHapticDynamicParameterIDAudioAttackTimeControl;
  v11[8] = &unk_1E6969810;
  v11[9] = &unk_1E6969810;
  v10[10] = CHHapticDynamicParameterIDAudioDecayTimeControl;
  v10[11] = CHHapticDynamicParameterIDAudioReleaseTimeControl;
  v11[10] = &unk_1E6969810;
  v11[11] = &unk_1E6969810;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = -999.0;
  }

  return v8;
}

- (float)minimumValueForDynamicParameter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  _QWORD v10[12];
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = CHHapticDynamicParameterIDHapticIntensityControl;
  v10[1] = CHHapticDynamicParameterIDHapticSharpnessControl;
  v11[0] = &unk_1E6969820;
  v11[1] = &unk_1E6969830;
  v10[2] = CHHapticDynamicParameterIDHapticAttackTimeControl;
  v10[3] = CHHapticDynamicParameterIDHapticDecayTimeControl;
  v11[2] = &unk_1E6969830;
  v11[3] = &unk_1E6969830;
  v10[4] = CHHapticDynamicParameterIDHapticReleaseTimeControl;
  v10[5] = CHHapticDynamicParameterIDAudioVolumeControl;
  v11[4] = &unk_1E6969830;
  v11[5] = &unk_1E6969820;
  v10[6] = CHHapticDynamicParameterIDAudioPanControl;
  v10[7] = CHHapticDynamicParameterIDAudioBrightnessControl;
  v11[6] = &unk_1E6969830;
  v11[7] = &unk_1E6969830;
  v10[8] = CHHapticDynamicParameterIDAudioPitchControl;
  v10[9] = CHHapticDynamicParameterIDAudioAttackTimeControl;
  v11[8] = &unk_1E6969830;
  v11[9] = &unk_1E6969830;
  v10[10] = CHHapticDynamicParameterIDAudioDecayTimeControl;
  v10[11] = CHHapticDynamicParameterIDAudioReleaseTimeControl;
  v11[10] = &unk_1E6969830;
  v11[11] = &unk_1E6969830;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = -999.0;
  }

  return v8;
}

- (float)defaultValueForDynamicParameter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  _QWORD v10[12];
  _QWORD v11[13];

  v11[12] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10[0] = CHHapticDynamicParameterIDHapticIntensityControl;
  v10[1] = CHHapticDynamicParameterIDHapticSharpnessControl;
  v11[0] = &unk_1E6969810;
  v11[1] = &unk_1E6969820;
  v10[2] = CHHapticDynamicParameterIDHapticAttackTimeControl;
  v10[3] = CHHapticDynamicParameterIDHapticDecayTimeControl;
  v11[2] = &unk_1E6969820;
  v11[3] = &unk_1E6969820;
  v10[4] = CHHapticDynamicParameterIDHapticReleaseTimeControl;
  v10[5] = CHHapticDynamicParameterIDAudioVolumeControl;
  v11[4] = &unk_1E6969820;
  v11[5] = &unk_1E6969810;
  v10[6] = CHHapticDynamicParameterIDAudioPanControl;
  v10[7] = CHHapticDynamicParameterIDAudioBrightnessControl;
  v11[6] = &unk_1E6969820;
  v11[7] = &unk_1E6969820;
  v10[8] = CHHapticDynamicParameterIDAudioPitchControl;
  v10[9] = CHHapticDynamicParameterIDAudioAttackTimeControl;
  v11[8] = &unk_1E6969820;
  v11[9] = &unk_1E6969820;
  v10[10] = CHHapticDynamicParameterIDAudioDecayTimeControl;
  v10[11] = CHHapticDynamicParameterIDAudioReleaseTimeControl;
  v11[10] = &unk_1E6969820;
  v11[11] = &unk_1E6969820;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = -999.0;
  }

  return v8;
}

- (id)attributesForDynamicParameter:(id)a3 error:(id *)a4
{
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  CHHapticParameterAttributesImpl *v13;
  double v14;
  double v15;
  double v16;
  CHHapticParameterAttributesImpl *v17;
  NSObject *v18;
  id v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CHDefaultHapticDeviceCapability minimumValueForDynamicParameter:](self, "minimumValueForDynamicParameter:", v6);
  v8 = v7;
  -[CHDefaultHapticDeviceCapability maximumValueForDynamicParameter:](self, "maximumValueForDynamicParameter:", v6);
  v10 = v9;
  -[CHDefaultHapticDeviceCapability defaultValueForDynamicParameter:](self, "defaultValueForDynamicParameter:", v6);
  v12 = v11;
  if (v8 != -999.0 && v10 != -999.0 && v11 != -999.0)
  {
    v13 = [CHHapticParameterAttributesImpl alloc];
    *(float *)&v14 = v8;
    *(float *)&v15 = v10;
    *(float *)&v16 = v12;
    v17 = -[CHHapticParameterAttributesImpl initWithMinValue:maxValue:defaultValue:](v13, "initWithMinValue:maxValue:defaultValue:", v14, v15, v16);
    goto LABEL_15;
  }
  if (!kHAPIScope)
  {
    v18 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
    goto LABEL_9;
  }
  v18 = *(id *)kHAPIScope;
  if (v18)
  {
LABEL_9:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "CHDeviceCapability.mm";
      v23 = 1024;
      v24 = 370;
      v25 = 2080;
      v26 = "-[CHDefaultHapticDeviceCapability attributesForDynamicParameter:error:]";
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: In parameter %@ is not a valid CHHapticDynamicParameter", (uint8_t *)&v21, 0x26u);
    }

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4820, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_15:

  return v17;
}

@end
