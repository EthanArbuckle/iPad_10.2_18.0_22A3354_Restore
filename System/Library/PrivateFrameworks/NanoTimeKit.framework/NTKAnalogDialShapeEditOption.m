@implementation NTKAnalogDialShapeEditOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)optionWithShape:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(v6, "deviceCategory") == 1)
    v7 = 0;
  else
    v7 = a3;
  objc_msgSend(a1, "_optionWithValue:forDevice:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_value
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[NTKEditOption device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceCategory");

  if (v4 == 1)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)NTKAnalogDialShapeEditOption;
  return -[NTKValueEditOption _value](&v6, sel__value);
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1167);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1168);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1168);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesRestrictedByDevice____cachedDevice_1168, v3);
    _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1169 = objc_msgSend(v3, "version");

    __65__NTKAnalogDialShapeEditOption__orderedValuesRestrictedByDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1169;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1167);
  v11 = (id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1166;

  return v11;
}

void __65__NTKAnalogDialShapeEditOption__orderedValuesRestrictedByDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1166;
  _orderedValuesRestrictedByDevice__hardwareSpecificValues_1166 = v3;

  v5 = objc_msgSend(v2, "deviceCategory");
  if (v5 != 1)
    objc_msgSend((id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1166, "addObject:", &unk_1E6CA07E0);
}

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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1171);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1172);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1172);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1172, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1173 = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__NTKAnalogDialShapeEditOption__orderedValuesForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __56__NTKAnalogDialShapeEditOption__orderedValuesForDevice___block_invoke((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1173;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1171);
  v11 = (id)_orderedValuesForDevice__dialShapes;

  return v11;
}

void __56__NTKAnalogDialShapeEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_orderedValuesRestrictedByDevice:", a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_orderedValuesForDevice__dialShapes;
  _orderedValuesForDevice__dialShapes = v2;

  objc_msgSend((id)_orderedValuesForDevice__dialShapes, "arrayByAddingObjectsFromArray:", &unk_1E6CAA438);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_orderedValuesForDevice__dialShapes;
  _orderedValuesForDevice__dialShapes = v4;

}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("fullscreen");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("circular");
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("EDIT_OPTION_LABEL_ANALOG_DIAL_SHAPE_FULLSCREEN");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("EDIT_OPTION_LABEL_ANALOG_DIAL_SHAPE_CIRCULAR");
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1185 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1185, &__block_literal_global_1186);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1184;
}

void __60__NTKAnalogDialShapeEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("circular");
  v3[1] = CFSTR("fullscreen");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1184;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1184 = v0;

}

@end
