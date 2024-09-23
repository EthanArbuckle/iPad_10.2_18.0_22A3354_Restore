@implementation NTKNumeralEditOption

+ (id)defaultOptionForDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = CLKLocaleCurrentNumberSystem();
  +[NTKNumeralEditOption optionWithNumeral:forDevice:](NTKNumeralEditOption, "optionWithNumeral:forDevice:", NTKNumeralOptionFromCLKLocaleNumberSystem(v4), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __48__NTKNumeralEditOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock);
  v11 = (id)_orderedValuesForDevice____orderedOptions;

  return v11;
}

void __48__NTKNumeralEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _EnumValueRange(0, 2uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _EnumValueRange(3uLL, 0xEuLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        +[NTKNumeralEditOption _localizedNameForValue:forDevice:](NTKNumeralEditOption, "_localizedNameForValue:forDevice:", objc_msgSend(v10, "unsignedIntegerValue"), v2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }
  objc_msgSend(v3, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v17);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k), (_QWORD)v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v14, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v22);
  }

  v26 = objc_msgSend(v14, "copy");
  v27 = (void *)_orderedValuesForDevice____orderedOptions;
  _orderedValuesForDevice____orderedOptions = v26;

}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_0 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_0, &__block_literal_global_4_1);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_0;
}

void __52__NTKNumeralEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6C9E8C0;
  v2[1] = &unk_1E6C9E8D8;
  v3[0] = CFSTR("style 1");
  v3[1] = CFSTR("style 2");
  v2[2] = &unk_1E6C9E8F0;
  v2[3] = &unk_1E6C9E908;
  v3[2] = CFSTR("style 3");
  v3[3] = CFSTR("style 4");
  v2[4] = &unk_1E6C9E920;
  v2[5] = &unk_1E6C9E938;
  v3[4] = CFSTR("style 5");
  v3[5] = CFSTR("style 6");
  v2[6] = &unk_1E6C9E950;
  v2[7] = &unk_1E6C9E968;
  v3[6] = CFSTR("style 7");
  v3[7] = CFSTR("style 8");
  v2[8] = &unk_1E6C9E980;
  v2[9] = &unk_1E6C9E998;
  v3[8] = CFSTR("style 9");
  v3[9] = CFSTR("style 10");
  v2[10] = &unk_1E6C9E9B0;
  v2[11] = &unk_1E6C9E9C8;
  v3[10] = CFSTR("style 11");
  v3[11] = CFSTR("style 12");
  v2[12] = &unk_1E6C9E9E0;
  v2[13] = &unk_1E6C9E9F8;
  v3[12] = CFSTR("style 13");
  v3[13] = CFSTR("style 14");
  v2[14] = &unk_1E6C9EA10;
  v3[14] = CFSTR("style 15");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_0;
  _valueToFaceBundleStringDict_valueToFaceBundleString_0 = v0;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CLKLocaleNumberSystemFromNumeralOption(a3);
  return (id)CLKLocaleNumberSystemIdentifier();
}

- (id)localizedName
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[NTKNumeralEditOption numeralOption](self, "numeralOption");
  -[NTKEditOption device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKNumeralEditOption _localizedNameForValue:forDevice:](NTKNumeralEditOption, "_localizedNameForValue:forDevice:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  void *v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;

  v5 = a4;
  if (_os_feature_enabled_impl())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("10262875-CE7F-4736-BEE0-2233E4EAA468"));
    v7 = objc_msgSend(v5, "supportsCapability:", v6);

  }
  else
  {
    v7 = 0;
  }
  v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_DEVANAGARI");
  switch(a3)
  {
    case 0uLL:
      v9 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_LATIN_COMPATIBILITY");
      v10 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_LATIN");
      goto LABEL_8;
    case 1uLL:
      v9 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_ARABIC_INDIC_COMPATIBILITY");
      v10 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_ARABIC_INDIC");
LABEL_8:
      if (v7)
        v8 = (__CFString *)v10;
      else
        v8 = (__CFString *)v9;
      goto LABEL_23;
    case 2uLL:
      goto LABEL_23;
    case 3uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_BENGALI");
      goto LABEL_23;
    case 4uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_GURMUKHI");
      goto LABEL_23;
    case 5uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_GUJARATI");
      goto LABEL_23;
    case 6uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_TELUGU");
      goto LABEL_23;
    case 7uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_MALAYALAM");
      goto LABEL_23;
    case 8uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_KANNADA");
      goto LABEL_23;
    case 9uLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_ODIA");
      goto LABEL_23;
    case 0xAuLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_Ol_CHIKI");
      goto LABEL_23;
    case 0xBuLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_URDU");
      goto LABEL_23;
    case 0xCuLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_MEITEI");
      goto LABEL_23;
    case 0xDuLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_BURMESE");
      goto LABEL_23;
    case 0xEuLL:
      v8 = CFSTR("EDIT_OPTION_LABEL_NUMERAL_KHMER");
LABEL_23:
      -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("_COMPANION"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NTKCompanionClockFaceLocalizedString(v12, CFSTR("Numerals"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v11 = &stru_1E6BDC918;
      break;
  }

  return v11;
}

- (int64_t)swatchStyle
{
  return 2;
}

- (id)swatchImageWithFont:(id)a3 device:(id)a4 baseline:(double)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double MidX;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  CGRect v31;
  CGRect v32;

  v8 = a4;
  v9 = a3;
  +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", -[NTKNumeralEditOption swatchStyle](self, "swatchStyle"));
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "fontWithSize:", 22.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKEditOption device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = CLKLocaleNumberSystemFromNumeralOption(-[NTKNumeralEditOption numeralOption](self, "numeralOption"));
  objc_msgSend(v16, "setUsesLegibility:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v18);

  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeOffset");
  objc_msgSend(v16, "setTimeOffset:");

  NTKIdealizedDate();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOverrideDate:duration:", v20, 0.0);

  objc_msgSend(v16, "setForcedNumberSystem:", v17);
  -[NTKNumeralEditOption styleForSwatchTimeLabelWithFont:device:baseline:faceBounds:](self, "styleForSwatchTimeLabelWithFont:device:baseline:faceBounds:", v14, v8, a5, 0.0, 0.0, v11, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setStyle:", v21);
  objc_msgSend(v16, "sizeToFit");
  v22 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v23 = (void *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v11, v13);
  objc_msgSend(v23, "addSubview:", v16);
  objc_msgSend(v23, "bounds");
  MidX = CGRectGetMidX(v31);
  objc_msgSend(v23, "bounds");
  objc_msgSend(v16, "setCenter:", MidX, CGRectGetMidY(v32));
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", 0.0, 0.0, v11, v13);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __60__NTKNumeralEditOption_swatchImageWithFont_device_baseline___block_invoke;
  v29[3] = &unk_1E6BD2F50;
  v30 = v23;
  v26 = v23;
  objc_msgSend(v25, "imageWithActions:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void __60__NTKNumeralEditOption_swatchImageWithFont_device_baseline___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

- (id)styleForSwatchTimeLabelWithFont:(id)a3 device:(id)a4 baseline:(double)a5 faceBounds:(CGRect)a6
{
  double width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  width = a6.size.width;
  +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0.0, round(a6.size.height * a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutRule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "referenceFrame");
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "layoutRule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReferenceFrame:", 0.0, v10, width, v12);

  objc_msgSend(v7, "layoutRule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHorizontalLayout:", 1);

  return v7;
}

+ (id)partiallySupportedEditOptionsForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  _EnumValueRange(3uLL, 0xEuLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "optionWithNumeral:forDevice:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "intValue", (_QWORD)v12), v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)partiallySupportedOptions
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  _EnumValueRange(3uLL, 0xEuLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "intValue", (_QWORD)v11);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

+ (BOOL)isPartiallySupported:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  +[NTKNumeralEditOption partiallySupportedOptions](NTKNumeralEditOption, "partiallySupportedOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

@end
