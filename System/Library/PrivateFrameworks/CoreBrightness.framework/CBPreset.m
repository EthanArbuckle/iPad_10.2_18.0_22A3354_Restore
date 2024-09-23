@implementation CBPreset

+ (id)newActive:(unint64_t)a3
{
  int v3;
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  _QWORD __b[8];
  id v14;
  uint64_t v15;
  unint64_t v16;
  SEL v17;
  Class v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = (Class)a1;
  v17 = a2;
  v16 = a3;
  v15 = 0;
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(MEMORY[0x1E0CD2728], "displays");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v12)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v12;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v14 = 0;
      v14 = *(id *)(__b[1] + 8 * v9);
      v3 = objc_msgSend(v14, "displayId");
      if (v3 == v16)
        v15 = objc_msgSend(v14, "currentPreset");
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v10)
          break;
      }
    }
  }
  if (!v15)
    return 0;
  v4 = [v18 alloc];
  return (id)objc_msgSend(v4, "initWithCAPreset:", v15);
}

- (CBPreset)initWithCAPreset:(id)a3
{
  char v3;
  char v4;
  char v5;
  double v6;
  double v7;
  char v8;
  double v10;
  objc_super v11;
  id v12;
  SEL v13;
  CBPreset *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBPreset;
  v14 = -[CBPreset init](&v11, sel_init);
  if (v14)
  {
    v3 = objc_msgSend(v12, "allowAutoBrightness");
    v14->_autoBrighnessDisabled = (v3 ^ 1) & 1;
    v4 = objc_msgSend(v12, "allowTrueTone");
    v14->_trueToneDisabled = (v4 ^ 1) & 1;
    v5 = objc_msgSend(v12, "allowNightShift");
    v14->_nightShiftDisabled = (v5 ^ 1) & 1;
    objc_msgSend(v12, "minSliderBrightness");
    v10 = v6;
    objc_msgSend(v12, "maxSliderBrightness");
    v14->_brightnessDisabled = vabdd_f64(v10, v7) < 0.5;
    v8 = objc_msgSend(v12, "isReference");
    v14->_referenceMode = v8 & 1;
  }
  return v14;
}

- (float)maxSDRLuminance
{
  return -1.0;
}

- (BOOL)trueToneDisabled
{
  return self->_trueToneDisabled;
}

- (BOOL)nightShiftDisabled
{
  return self->_nightShiftDisabled;
}

- (BOOL)autoBrighnessDisabled
{
  return self->_autoBrighnessDisabled;
}

- (BOOL)brightnessDisabled
{
  return self->_brightnessDisabled;
}

- (BOOL)referenceMode
{
  return self->_referenceMode;
}

@end
