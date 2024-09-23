@implementation NTKKaleidoscopeStyleOption

- (int64_t)swatchStyle
{
  void *v2;
  uint64_t v3;

  -[NTKEditOption device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceCategory");

  if (v3 == 1)
    return 1;
  else
    return 3;
}

+ (int64_t)indexForStyle:(unint64_t)a3 forDevice:(id)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a1, "_orderedValuesForDevice:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  return v7;
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_917);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_918);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_918);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_918, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_919 = objc_msgSend(v3, "version");

    __54__NTKKaleidoscopeStyleOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_919;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_917);
  v11 = (id)_orderedValuesForDevice____styles_916;

  return v11;
}

void __54__NTKKaleidoscopeStyleOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  _EnumValueRange(0, 2uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_orderedValuesForDevice____styles_916;
  _orderedValuesForDevice____styles_916 = v3;

  v5 = objc_msgSend(v2, "deviceCategory");
  if (v5 != 1)
  {
    objc_msgSend(&unk_1E6CAA348, "arrayByAddingObjectsFromArray:", _orderedValuesForDevice____styles_916);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_orderedValuesForDevice____styles_916;
    _orderedValuesForDevice____styles_916 = v6;

  }
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3)
    return 0;
  else
    return off_1E6BD7F48[a3];
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0uLL:
      if (objc_msgSend(v5, "deviceCategory") == 1)
        v7 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_FACETED_CLASSIC");
      else
        v7 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_FACETED");
      break;
    case 1uLL:
      v7 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_RADIAL");
      break;
    case 2uLL:
      v7 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_LIMIT");
      break;
    case 3uLL:
      v7 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_STYLE_FSFACET");
      break;
    default:
      v7 = 0;
      break;
  }

  return (id)v7;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_942 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_942, &__block_literal_global_943);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_941;
}

void __58__NTKKaleidoscopeStyleOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("faceted");
  v3[1] = CFSTR("radial");
  v2[2] = &unk_1E6CA0D38;
  v2[3] = &unk_1E6CA0D08;
  v3[2] = CFSTR("limit");
  v3[3] = CFSTR("fullscreen facet");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_941;
  _valueToFaceBundleStringDict_valueToFaceBundleString_941 = v0;

}

@end
