@implementation NTKOlympusStyleEditOption

- (int64_t)swatchStyle
{
  return 3;
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
  void *v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_869);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_870);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_870);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_870, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_871 = objc_msgSend(v3, "version");

    v10 = (void *)_orderedValuesForDevice____styles_868;
    _orderedValuesForDevice____styles_868 = (uint64_t)&unk_1E6CAA330;

    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_871;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_869);
  v11 = (id)_orderedValuesForDevice____styles_868;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3)
    return 0;
  else
    return *(&off_1E6BD7F08 + a3);
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3)
    return 0;
  else
    return *(&off_1E6BD7F28 + a3);
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_888 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_888, &__block_literal_global_889);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_887;
}

void __57__NTKOlympusStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0D38;
  v2[1] = &unk_1E6CA0D08;
  v3[0] = CFSTR("style 1");
  v3[1] = CFSTR("style 2");
  v2[2] = &unk_1E6CA0E40;
  v3[2] = CFSTR("style 3");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_887;
  _valueToFaceBundleStringDict_valueToFaceBundleString_887 = v0;

}

@end
