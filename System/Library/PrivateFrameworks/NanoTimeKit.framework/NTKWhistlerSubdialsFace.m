@implementation NTKWhistlerSubdialsFace

- (int64_t)timeStyle
{
  void *v2;
  int64_t v3;

  -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", 15, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style") != 0;

  return v3;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)NTKWhistlerSubdialsFace;
  -[NTKFace selectOption:forCustomEditMode:slot:](&v13, sel_selectOption_forCustomEditMode_slot_, v8, a4, v9);

  if (a4 == 15 && (NTKEqualObjects(v8, v10) & 1) == 0)
  {
    v11 = v10;
    v12 = objc_msgSend(v8, "style");
    if (v12 != objc_msgSend(v11, "style"))
      -[NTKFace _notifyObserversFaceTimeStyleChanged](self, "_notifyObserversFaceTimeStyleChanged");

  }
}

+ (id)_complicationSlotDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  NTKAllSignatureCircularTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllSignatureRectangularTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA6A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTinker");

  if (v6)
    v7 = &unk_1E6CAA6C0;
  else
    v7 = &unk_1E6CAA6D8;
  NTKComplicationTypeRankedListWithDefaultTypes(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA6F0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("top");
  NTKComplicationSlotDescriptor(10, v2, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = CFSTR("center");
  NTKComplicationSlotDescriptor(10, v2, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v15[2] = CFSTR("bottom");
  NTKComplicationSlotDescriptor(11, v3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5;
  int v6;
  __CFString **v7;
  __CFString *v8;
  __CFString **v9;
  void *v10;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bottom")))
  {
    v6 = objc_msgSend(v5, "supportsUrsa");
    v7 = NTKBundleComplicationUrsaBearingBundleIdentifier;
    if (!v6)
      v7 = NTKBundleComplicationNoiseBundleIdentifier;
    v8 = *v7;
    v9 = NTKBundleComplicationUrsaAppBundleIdentifier;
    if (!v6)
      v9 = NTKBundleComplicationNoiseAppBundleIdentifier;
    +[NTKBundleComplication bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:](NTKBundleComplication, "bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v8, *v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return CFSTR("top");
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top");
  v3[1] = CFSTR("center");
  v3[2] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_customEditModes
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  if (!v4)
    return &unk_1E6CAA738;
  -[NTKFace device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NTKShowIndicScriptNumerals(v5);

  if (v6)
    return &unk_1E6CAA708;
  else
    return &unk_1E6CAA720;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t Language;
  uint64_t v15;

  v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 10:
      -[NTKFace device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = NTKDefaultFaceColorForDeviceCollection(v8, 7);

      -[NTKFace device](self, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorEditOption, "optionWithFaceColor:forDevice:", v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 15:
      -[NTKFace device](self, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isTinker");

      -[NTKFace device](self, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDualTimeStyleEditOption optionWithStyle:forDevice:](NTKDualTimeStyleEditOption, "optionWithStyle:forDevice:", v13, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 17:
      -[NTKWhistlerSubdialsFace _defaultBackgroundOption](self, "_defaultBackgroundOption");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      Language = CLKLocaleNumberSystemForFirstLanguage();
      v15 = NTKNumeralOptionFromCLKLocaleNumberSystem(Language);
      -[NTKFace device](self, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKNumeralEditOption optionWithNumeral:forDevice:](NTKNumeralEditOption, "optionWithNumeral:forDevice:", v15, v10);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v11;

      break;
    default:
      break;
  }

  return v7;
}

- (id)_defaultBackgroundOption
{
  void *v2;
  void *v3;

  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:forDevice:](NTKFaceBackgroundStyleEditOption, "optionWithBackgroundStyle:forDevice:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pigmentOptionProvider
{
  void *v3;
  int v4;
  NTKPigmentEditOptionProvider *pigmentEditOptionProvider;
  NTKPigmentEditOptionProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NTKPigmentEditOptionProvider *v11;
  NTKPigmentEditOptionProvider *v12;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NTKShowGossamerUI(v3);

  if (self->_isGossamerPigmentEditOptionProvider != v4)
  {
    pigmentEditOptionProvider = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = 0;

  }
  v6 = self->_pigmentEditOptionProvider;
  if (!v6)
  {
    self->_isGossamerPigmentEditOptionProvider = v4;
    objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_isGossamerPigmentEditOptionProvider)
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("-Gossamer"));
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NTKPigmentEditOptionProvider initWithDomain:bundle:]([NTKPigmentEditOptionProvider alloc], "initWithDomain:bundle:", v8, v10);
    v12 = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = v11;

    v6 = self->_pigmentEditOptionProvider;
  }
  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_class *v5;
  void *v6;
  unint64_t v7;

  v5 = -[NTKWhistlerSubdialsFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  -[NTKFace device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[objc_class numberOfOptionsForDevice:](v5, "numberOfOptionsForDevice:", v6);

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  objc_class *v7;
  void *v8;
  void *v9;

  v7 = -[NTKWhistlerSubdialsFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionAtIndex:forDevice:](v7, "optionAtIndex:forDevice:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  unint64_t v10;

  v7 = a3;
  v8 = -[NTKWhistlerSubdialsFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[objc_class indexOfOption:forDevice:](v8, "indexOfOption:forDevice:", v7, v9);

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(a3 - 10) <= 9 && ((0x2A1u >> (a3 - 10)) & 1) != 0)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  void *v4;
  objc_super v6;

  if (a3 == 15)
  {
    NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_TIME_COMPANION"), CFSTR("Time"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKWhistlerSubdialsFace;
    objc_msgSendSuper2(&v6, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("top");
  v4[1] = CFSTR("center");
  v4[2] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  __CFString *v5;
  const __CFString *v6;
  __CFString **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;

  switch(a4)
  {
    case 0:
      v5 = CFSTR("special.rainbow");
      goto LABEL_12;
    case 1:
      v6 = CFSTR("gossamer.color3");
      break;
    case 2:
      v6 = CFSTR("gossamer.color5");
      break;
    case 3:
      v6 = CFSTR("gossamer.color6");
      break;
    case 4:
      v6 = CFSTR("gossamer.color8");
      break;
    case 5:
      v6 = CFSTR("gossamer.color2");
      break;
    case 6:
      v7 = ntk_standard_pink;
      goto LABEL_11;
    case 7:
      v7 = ntk_standard_purple;
LABEL_11:
      v5 = *v7;
LABEL_12:
      v6 = v5;
      break;
    default:
      v6 = 0;
      break;
  }
  v12 = (__CFString *)v6;
  +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWhistlerSubdialsFace selectOption:forCustomEditMode:slot:](self, "selectOption:forCustomEditMode:slot:", v8, 10, 0);
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:forDevice:](NTKFaceBackgroundStyleEditOption, "optionWithBackgroundStyle:forDevice:", v12 != CFSTR("special.rainbow"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKWhistlerSubdialsFace selectOption:forCustomEditMode:slot:](self, "selectOption:forCustomEditMode:slot:", v10, 17, 0);
  +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace setComplication:forSlot:](self, "setComplication:forSlot:", v11, CFSTR("top"));
  -[NTKFace setComplication:forSlot:](self, "setComplication:forSlot:", v11, CFSTR("center"));
  -[NTKFace setComplication:forSlot:](self, "setComplication:forSlot:", v11, CFSTR("bottom"));

}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return CFSTR("modularCompact");
}

- (id)editOptionsThatHideEditModes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKDualTimeStyleEditOption optionWithStyle:forDevice:](NTKDualTimeStyleEditOption, "optionWithStyle:forDevice:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v3;
  v8 = &unk_1E6CA1B60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3
{
  return &stru_1E6BDC918;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pigmentEditOptionProvider, 0);
}

@end
