@implementation NTKDateAlignmentEditOption

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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_650);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_651);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_651);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_651, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_652 = objc_msgSend(v3, "version");

    __54__NTKDateAlignmentEditOption__orderedValuesForDevice___block_invoke();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesForDevice____previousCLKDeviceVersion_652;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_650);
  v10 = (id)_orderedValuesForDevice____styles;

  return v10;
}

void __54__NTKDateAlignmentEditOption__orderedValuesForDevice___block_invoke()
{
  uint64_t v0;
  void *v1;

  _EnumValueRange(0, 1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_orderedValuesForDevice____styles;
  _orderedValuesForDevice____styles = v0;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("bottom");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("top");
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("EDIT_OPTION_LABEL_DATE_ALIGNMENT_BOTTOM");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("EDIT_OPTION_LABEL_DATE_ALIGNMENT_TOP");
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_663 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_663, &__block_literal_global_664);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_662;
}

void __58__NTKDateAlignmentEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("top");
  v3[1] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_662;
  _valueToFaceBundleStringDict_valueToFaceBundleString_662 = v0;

}

@end
