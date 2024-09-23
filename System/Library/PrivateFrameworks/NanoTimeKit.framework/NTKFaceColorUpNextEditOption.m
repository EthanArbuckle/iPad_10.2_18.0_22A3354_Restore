@implementation NTKFaceColorUpNextEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_587);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_588);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_588);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_588, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_589 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors_586;
    _orderedValuesForDevice____colors_586 = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_589;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_587);
  v13 = (id)_orderedValuesForDevice____colors_586;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "nrDeviceVersion") >= 0x50000)
  {
    objc_msgSend(v3, "isRunningGraceOrLater");
    v4 = &unk_1E6CAA1E0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  __CFString *v7;
  objc_super v9;

  v6 = a4;
  if (objc_msgSend(v6, "nrDeviceVersion") >= 0x50000)
  {
    if (a3 == 201)
    {
      v7 = CFSTR("siri-dark");
    }
    else if (a3 == 202)
    {
      v7 = CFSTR("siri-grey");
    }
    else
    {
      v9.receiver = a1;
      v9.super_class = (Class)&OBJC_METACLASS___NTKFaceColorUpNextEditOption;
      objc_msgSendSuper2(&v9, sel__snapshotKeyForValue_forDevice_, a3, v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = &stru_1E6BDC918;
  }

  return v7;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  return objc_msgSend(a3, "nrDeviceVersion") >> 16 > 4;
}

@end
