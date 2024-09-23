@implementation CAMSmartStyleCategoryInstructionLabel

- (CAMSmartStyleCategoryInstructionLabel)initWithFrame:(CGRect)a3
{
  CAMSmartStyleCategoryInstructionLabel *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSSet *systemStylePresetTypes;
  CAMSmartStyleCategoryInstructionLabel *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMSmartStyleCategoryInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    CEKSmartStyleSystemStylePresetTypes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithArray:", v5);
    systemStylePresetTypes = v3->__systemStylePresetTypes;
    v3->__systemStylePresetTypes = (NSSet *)v6;

    v3->_presetType = 1;
    -[CAMSmartStyleCategoryInstructionLabel _updateText](v3, "_updateText");
    v8 = v3;
  }

  return v3;
}

- (double)_backgroundAlpha
{
  return 0.9;
}

- (double)_backgroundColorWhiteValue
{
  return 0.2;
}

- (void)_updateText
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  id v7;

  -[CAMSmartStyleCategoryInstructionLabel _systemStylePresetTypes](self, "_systemStylePresetTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMSmartStyleCategoryInstructionLabel presetType](self, "presetType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if (v5)
    v6 = CFSTR("SMART_STYLES_CATEGORY_LABEL_SYSTEM");
  else
    v6 = CFSTR("SMART_STYLES_CATEGORY_LABEL_CREATIVE");
  CAMLocalizedFrameworkString(v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel setText:](self, "setText:", v7);

}

- (void)setPresetType:(int64_t)a3
{
  if (self->_presetType != a3)
  {
    self->_presetType = a3;
    -[CAMSmartStyleCategoryInstructionLabel _updateText](self, "_updateText");
  }
}

- (int64_t)presetType
{
  return self->_presetType;
}

- (NSSet)_systemStylePresetTypes
{
  return self->__systemStylePresetTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__systemStylePresetTypes, 0);
}

@end
