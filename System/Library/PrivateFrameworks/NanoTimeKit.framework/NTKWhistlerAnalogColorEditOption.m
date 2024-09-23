@implementation NTKWhistlerAnalogColorEditOption

- (int64_t)swatchStyle
{
  return 0;
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
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1136);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1137);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1137);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1137, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1138 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors_1135;
    _orderedValuesForDevice____colors_1135 = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1138;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1136);
  v13 = (id)_orderedValuesForDevice____colors_1135;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NTKWhistlerAnalogColorEditOption;
  objc_msgSendSuper2(&v7, sel___orderedValuesForDevice_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", &unk_1E6CA0C60);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1E6CA0C60, &unk_1E6CA1038, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  return v5;
}

@end
