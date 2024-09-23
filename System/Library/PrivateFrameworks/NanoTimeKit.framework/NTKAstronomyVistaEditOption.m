@implementation NTKAstronomyVistaEditOption

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
  uint64_t v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_627);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_628);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_628);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_628, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_629 = objc_msgSend(v3, "version");

    __55__NTKAstronomyVistaEditOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_629;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_627);
  v11 = (id)_orderedValuesForDevice____themes;

  return v11;
}

void __55__NTKAstronomyVistaEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(a2, "nrDeviceVersion") >= 0x50000)
  {
    _EnumValueRange(0, 2uLL);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = MEMORY[0x1E0C9AA60];
  }
  v3 = (void *)_orderedValuesForDevice____themes;
  _orderedValuesForDevice____themes = v2;

}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2)
    return 0;
  else
    return off_1E6BD7ED8[a3];
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2)
    return 0;
  else
    return off_1E6BD7EF0[a3];
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_644 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_644, &__block_literal_global_645);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_643;
}

void __59__NTKAstronomyVistaEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("earth");
  v3[1] = CFSTR("luna");
  v2[2] = &unk_1E6CA0D38;
  v3[2] = CFSTR("orrery");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_643;
  _valueToFaceBundleStringDict_valueToFaceBundleString_643 = v0;

}

@end
