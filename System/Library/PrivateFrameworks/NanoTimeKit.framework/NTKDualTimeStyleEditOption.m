@implementation NTKDualTimeStyleEditOption

- (int64_t)swatchStyle
{
  return 1;
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
  id v10;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1192);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1193);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1193);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1193, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1194 = objc_msgSend(v3, "version");

    __54__NTKDualTimeStyleEditOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1194;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1192);
  v10 = (id)_orderedValuesForDevice____styles_1191;

  return v10;
}

void __54__NTKDualTimeStyleEditOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  _EnumValueRange(0, 1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_orderedValuesForDevice____styles_1191;
  _orderedValuesForDevice____styles_1191 = v0;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("digital");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("analog");
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("EDIT_OPTION_LABEL_DUAL_TIME_STYLE_DIGITAL");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("EDIT_OPTION_LABEL_DUAL_TIME_STYLE_ANALOG");
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1201 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1201, &__block_literal_global_1202);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1200;
}

void __58__NTKDualTimeStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("analog");
  v3[1] = CFSTR("digital");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1200;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1200 = v0;

}

@end
