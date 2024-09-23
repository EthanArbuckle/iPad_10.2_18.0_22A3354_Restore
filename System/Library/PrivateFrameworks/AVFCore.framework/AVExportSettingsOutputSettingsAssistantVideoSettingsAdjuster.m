@implementation AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster

- (AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster)initWithOutputSettingsPreset:(id)a3
{
  AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster;
  v4 = -[AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster init](&v7, sel_init);
  if (v4)
  {
    v4->_outputSettingsPresetIdentifier = (NSString *)objc_msgSend(a3, "copy");
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
  v3.super_class = (Class)AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster;
  -[AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster dealloc](&v3, sel_dealloc);
}

- (int64_t)averageBitRateForSourceFormatDescription:(opaqueCMFormatDescription *)a3 andTargetFrameRate:(float)a4 andEncoderSpecification:(id)a5
{
  id v8;
  int v9;

  v8 = -[NSDictionary objectForKey:](self->_exportSettings, "objectForKey:", *MEMORY[0x1E0CC4258]);
  if (v8
    && (v9 = (int)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!a5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    return AVExportSettingsAverageBitRateForSourceAndOutputSettingsPreset(v9, (int)a5, (uint64_t)self->_outputSettingsPresetIdentifier, a3);
  }
  else
  {
    return 0;
  }
}

- (id)colorSpaceFromSourceFormatDescriptions:(id)a3 andRendererColorSpace:(id)a4
{
  id result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  result = -[NSDictionary objectForKey:](self->_exportSettings, "objectForKey:", *MEMORY[0x1E0CC4258]);
  if (result)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    result = AVExportSettingsEffectiveColorPropertyForPresetAndInputOutputFormat();
    if (!result)
      return result;
    v5 = result;
    v6 = objc_msgSend(result, "objectForKeyedSubscript:", *MEMORY[0x1E0CC41F0]);
    v7 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CC4240]);
    v8 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CC4268]);
    v9 = !v6 || v7 == 0;
    if (v9 || v8 == 0)
    {
      return 0;
    }
    else
    {
      v11[0] = CFSTR("ColorPrimaries");
      v11[1] = CFSTR("TransferFunction");
      v12[0] = v6;
      v12[1] = v7;
      v11[2] = CFSTR("YCbCrMatrix");
      v12[2] = v8;
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    }
  }
  return result;
}

@end
