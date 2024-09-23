@implementation NTKDensityEditOption

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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_602);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_603);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_603);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_603, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_604 = objc_msgSend(v3, "version");

    __48__NTKDensityEditOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_604;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_602);
  v10 = (id)_orderedValuesForDevice____densities;

  return v10;
}

void __48__NTKDensityEditOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  _EnumValueRange(0, 3uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_orderedValuesForDevice____densities;
  _orderedValuesForDevice____densities = v0;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3)
    return 0;
  else
    return off_1E6BD7E98[a3];
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3)
    return 0;
  else
    return off_1E6BD7EB8[a3];
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1, &__block_literal_global_622);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1;
}

void __52__NTKDensityEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("minimal");
  v3[1] = CFSTR("simple");
  v2[2] = &unk_1E6CA0D38;
  v2[3] = &unk_1E6CA0D08;
  v3[2] = CFSTR("medium");
  v3[3] = CFSTR("detailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1 = v0;

}

@end
