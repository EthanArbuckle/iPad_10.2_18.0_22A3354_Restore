@implementation NTKFaceColorMonochromeEditOption

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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_581);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_582);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_582);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_582, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_583 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors_580;
    _orderedValuesForDevice____colors_580 = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_583;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_581);
  v13 = (id)_orderedValuesForDevice____colors_580;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKFaceColorMonochromeEditOption;
  objc_msgSendSuper2(&v6, sel___orderedValuesForDevice_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "insertObject:atIndex:", &unk_1E6CA0FF0, 0);
  objc_msgSend(v4, "removeObject:", &unk_1E6CA0C60);
  return v4;
}

@end
