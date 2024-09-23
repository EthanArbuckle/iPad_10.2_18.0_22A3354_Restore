@implementation AVExportSettingsOutputSettingsAssistantBaseSettings

- (AVExportSettingsOutputSettingsAssistantBaseSettings)init
{
  return -[AVExportSettingsOutputSettingsAssistantBaseSettings initWithOutputSettingsPreset:](self, "initWithOutputSettingsPreset:", 0);
}

- (AVExportSettingsOutputSettingsAssistantBaseSettings)initWithOutputSettingsPreset:(id)a3
{
  AVExportSettingsOutputSettingsAssistantBaseSettings *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVExportSettingsOutputSettingsAssistantBaseSettings;
  v4 = -[AVExportSettingsOutputSettingsAssistantBaseSettings init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_msgSend((id)AVExportSettingsForOutputSettingsPreset((uint64_t)a3), "copy");
    v4->_exportSettings = (NSDictionary *)v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVExportSettingsOutputSettingsAssistantBaseSettings;
  -[AVExportSettingsOutputSettingsAssistantBaseSettings dealloc](&v3, sel_dealloc);
}

- (NSDictionary)baseAudioSettings
{
  id v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[NSDictionary objectForKey:](self->_exportSettings, "objectForKey:", *MEMORY[0x1E0CC41E0]);
  if (!v2)
    return 0;
  v3 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (!objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CC41E8]))
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || FigAudioCompressionOptionsGetPreset())
    return 0;
  v4 = MEMORY[0];
  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MEMORY[8]);
  v7 = *MEMORY[0x1E0C898E0];
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v9 = *MEMORY[0x1E0C89970];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  return (NSDictionary *)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, v7, v8, v9, v10, *MEMORY[0x1E0C89930], 0);
}

- (NSDictionary)baseVideoSettings
{
  NSDictionary *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  CFTypeID v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFBoolean *v29;
  const __CFBoolean *v30;
  CFTypeID v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[NSDictionary objectForKey:](self->_exportSettings, "objectForKey:", *MEMORY[0x1E0CC4258]);
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4250]);
      if (v6)
      {
        v7 = (void *)v6;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = objc_msgSend(v7, "unsignedIntValue");
          if (v8 == 1752589105)
          {
            v9 = (const __CFBoolean *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC41D0]);
            if (v9)
            {
              v10 = v9;
              v11 = CFGetTypeID(v9);
              v8 = 1752589105;
              if (v11 == CFBooleanGetTypeID())
              {
                if (CFBooleanGetValue(v10))
                  v8 = 1836415073;
                else
                  v8 = 1752589105;
              }
            }
            else
            {
              v8 = 1752589105;
            }
          }
          -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", AVStringForOSType(v8), CFSTR("AVVideoCodecKey"));
          v12 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4260]);
          v13 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4210]);
          v14 = (void *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4228]);
          v15 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4220]);
          if (v14 && (v16 = v15) != 0)
          {
            if (objc_msgSend(v14, "isEqual:", v15))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                return v3;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                return v3;
              v17 = objc_msgSend(v14, "integerValue");
              if (v17 == 640)
                v18 = 480;
              else
                v18 = 9 * v17 / 16;
              v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
            }
          }
          else
          {
            v19 = v12 != 0;
            v20 = v13 != 0;
            if (v19 && v20)
              v14 = (void *)v12;
            else
              v14 = 0;
            if (v19 && v20)
              v16 = v13;
            else
              v16 = 0;
          }
          if (v14)
            v21 = v16 == 0;
          else
            v21 = 1;
          if (!v21)
          {
            -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v14, CFSTR("AVVideoWidthKey"));
            -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v16, CFSTR("AVVideoHeightKey"));
            -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", CFSTR("AVVideoScalingModeResizeAspect"), CFSTR("AVVideoScalingModeKey"));
            v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v23 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4248]);
            if (v23)
              objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("AverageBitRate"));
            v24 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4230]);
            if (v24)
              objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("ProfileLevel"));
            v25 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4200]);
            if (v25)
              objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("H264EntropyMode"));
            v26 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4218]);
            if (v26)
              objc_msgSend(v22, "setObject:forKey:", v26, CFSTR("MaxKeyFrameInterval"));
            v27 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4208]);
            if (v27)
              objc_msgSend(v22, "setObject:forKey:", v27, CFSTR("AllowFrameReordering"));
            v28 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC41D8]);
            if (v28)
              objc_msgSend(v22, "setObject:forKey:", v28, *MEMORY[0x1E0CED210]);
            if (v8 == 1752589105)
            {
              v29 = (const __CFBoolean *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4238]);
              if (v29)
              {
                v30 = v29;
                v31 = CFGetTypeID(v29);
                if (v31 == CFBooleanGetTypeID())
                {
                  if (CFBooleanGetValue(v30))
                  {
                    objc_msgSend(v22, "setObject:forKey:", &unk_1E3093C58, *MEMORY[0x1E0CED080]);
                    objc_msgSend(v22, "setObject:forKey:", &unk_1E3093C70, *MEMORY[0x1E0CED088]);
                    objc_msgSend(v22, "setObject:forKey:", &unk_1E3093C88, *MEMORY[0x1E0CED078]);
                  }
                }
              }
            }
            -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v22, CFSTR("AVVideoCompressionPropertiesKey"));
            v32 = *MEMORY[0x1E0CC41F0];
            v33 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC41F0]);
            v34 = *MEMORY[0x1E0CC4240];
            v35 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4240]);
            v36 = *MEMORY[0x1E0CC4268];
            v37 = objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC4268]);
            if (v33 && v35 && v37)
            {
              v38 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v33, CFSTR("ColorPrimaries"), v35, CFSTR("TransferFunction"), v37, CFSTR("YCbCrMatrix"), 0);
LABEL_55:
              -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v38, CFSTR("AVVideoColorPropertiesKey"));
              return v3;
            }
            v39 = (void *)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CC41F8]);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v39, "count"))
            {
              v40 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "objectForKey:", v32);
              v41 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "objectForKey:", v34);
              v43 = objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 0), "objectForKey:", v36);
              v38 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v40, CFSTR("ColorPrimaries"), v41, CFSTR("TransferFunction"), v43, CFSTR("YCbCrMatrix"), 0);
              goto LABEL_55;
            }
          }
        }
      }
    }
  }
  return v3;
}

@end
