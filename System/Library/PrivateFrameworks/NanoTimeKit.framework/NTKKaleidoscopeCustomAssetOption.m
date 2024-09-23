@implementation NTKKaleidoscopeCustomAssetOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[5];

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_974);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_975);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_975);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_975, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_976 = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__NTKKaleidoscopeCustomAssetOption__orderedValuesForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __60__NTKKaleidoscopeCustomAssetOption__orderedValuesForDevice___block_invoke((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_976;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_974);
  v11 = (id)_orderedValuesForDevice____styles_973;

  return v11;
}

void __60__NTKKaleidoscopeCustomAssetOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___NTKKaleidoscopeCustomAssetOption;
  objc_msgSendSuper2(&v5, sel__orderedValuesForDevice_, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6CAA3D8, "arrayByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_orderedValuesForDevice____styles_973;
  _orderedValuesForDevice____styles_973 = v3;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 1000)
  {
    v6 = CFSTR("asset-custom");
  }
  else
  {
    v9 = v4;
    v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKKaleidoscopeCustomAssetOption;
    objc_msgSendSuper2(&v8, sel__snapshotKeyForValue_forDevice_, a3, a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 1000)
  {
    v6 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_ASSET_CUSTOM");
  }
  else
  {
    v9 = v4;
    v10 = v5;
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKKaleidoscopeCustomAssetOption;
    objc_msgSendSuper2(&v8, sel__nameLocalizationKeyForValue_forDevice_, a3, a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 != 1000)
    return 0;
  NTKClockFaceLocalizedString(CFSTR("KALEIDOSCOPE_CHOOSE_PHOTO"), CFSTR("Choose Photo…"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_valueToFaceBundleStringDict
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__NTKKaleidoscopeCustomAssetOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_991 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_991, block);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_990;
}

void __64__NTKKaleidoscopeCustomAssetOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)NTKKaleidoscopeCustomAssetOption;
  objc_msgSendSuper2(&v5, sel__valueToFaceBundleStringDict);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("asset custom"), &unk_1E6CA0F60);
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_990;
  _valueToFaceBundleStringDict_valueToFaceBundleString_990 = v3;

}

@end
