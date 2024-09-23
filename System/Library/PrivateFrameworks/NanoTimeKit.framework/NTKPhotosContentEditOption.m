@implementation NTKPhotosContentEditOption

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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1082);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1083);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1083);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1083, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1084 = objc_msgSend(v3, "version");

    __54__NTKPhotosContentEditOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1084;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1082);
  v11 = (id)_orderedValuesForDevice__contents;

  return v11;
}

void __54__NTKPhotosContentEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int HasPhotosFaceMemoryCapability;
  void *v4;
  void *v5;

  objc_msgSend(a2, "nrDeviceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HasPhotosFaceMemoryCapability = NTKPhotosDeviceHasPhotosFaceMemoryCapability((uint64_t)v2);

  v4 = &unk_1E6CAA408;
  v5 = (void *)_orderedValuesForDevice__contents;
  if (HasPhotosFaceMemoryCapability)
    v4 = &unk_1E6CAA3F0;
  _orderedValuesForDevice__contents = (uint64_t)v4;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2)
    return 0;
  else
    return off_1E6BD7F68[a3];
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2)
    return 0;
  else
    return off_1E6BD7F80[a3];
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v5 = a4;
  if (a3 == 1)
  {
    v6 = CFSTR("EDIT_OPTION_LABEL_PHOTOS_CUSTOM_ACTION_COMPANION");
    v7 = CFSTR("Choose Photos…");
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("EDIT_OPTION_LABEL_PHOTOS_SYNCED_ALBUM_ACTION_COMPANION");
    v7 = CFSTR("Choose Album…");
  }
  NTKCompanionClockFaceLocalizedString(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1111 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1111, &__block_literal_global_1112);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1110;
}

void __58__NTKPhotosContentEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("synced");
  v3[1] = CFSTR("custom");
  v2[2] = &unk_1E6CA0D38;
  v3[2] = CFSTR("memory");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1110;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1110 = v0;

}

@end
