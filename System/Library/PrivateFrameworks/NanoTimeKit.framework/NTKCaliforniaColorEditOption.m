@implementation NTKCaliforniaColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

- (BOOL)isPrideOption
{
  return -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor") == 3009;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  char v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D0D02931-2190-4E71-B843-C73C4ADB3F27"));
  if (objc_msgSend(v4, "supportsCapability:", v5) && !NTKGizmoOrCompanionAreRussian(v4))
  {

  }
  else
  {
    v6 = -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor");

    if (v6 == 3009)
      goto LABEL_21;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
  if (objc_msgSend(v4, "supportsCapability:", v7))
  {

  }
  else
  {
    if (_NTKNewToHunterCaliforniaColors_onceToken != -1)
      dispatch_once(&_NTKNewToHunterCaliforniaColors_onceToken, &__block_literal_global_1314);
    v8 = (id)_NTKNewToHunterCaliforniaColors_colors;
    v9 = objc_msgSend(v8, "containsIndex:", -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor"));

    if ((v9 & 1) != 0)
      goto LABEL_21;
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) == 0
    && (objc_msgSend(v4, "collectionType") != 9
     && -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor") == 3005
     || objc_msgSend(v4, "collectionType") != 10
     && -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor") == 3006
     || objc_msgSend(v4, "collectionType") != 7
     && -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor") == 3007
     || objc_msgSend(v4, "collectionType") != 8
     && -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor") == 3008))
  {
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  v10 = 1;
LABEL_22:

  return v10;
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1205);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1206);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1206);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1206, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1207 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors_1204;
    _orderedValuesForDevice____colors_1204 = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1207;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1205);
  v13 = (id)_orderedValuesForDevice____colors_1204;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_orderedValuesRestrictedByDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || objc_msgSend(v4, "collectionType") == 10
    || NTKShowHardwareSpecificFaces())
  {
    objc_msgSend(v5, "addObject:", &unk_1E6CA11B8);
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || objc_msgSend(v4, "collectionType") == 9
    || NTKShowHardwareSpecificFaces())
  {
    objc_msgSend(v5, "addObject:", &unk_1E6CA11D0);
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || objc_msgSend(v4, "collectionType") == 7
    || NTKShowHardwareSpecificFaces())
  {
    objc_msgSend(v5, "addObject:", &unk_1E6CA11A0);
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || objc_msgSend(v4, "collectionType") == 8
    || NTKShowHardwareSpecificFaces())
  {
    objc_msgSend(v5, "addObject:", &unk_1E6CA1188);
  }
  objc_msgSend(a1, "_curatedColorValuesForDevice:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D0D02931-2190-4E71-B843-C73C4ADB3F27"));
  if (objc_msgSend(v4, "supportsCapability:", v8))
  {
    v9 = NTKGizmoOrCompanionAreRussian(v4);

    if ((v9 & 1) == 0)
      objc_msgSend(v5, "addObject:", &unk_1E6CA1170);
  }
  else
  {

  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___NTKCaliforniaColorEditOption;
  objc_msgSendSuper2(&v13, sel___orderedValuesForDevice_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeObjectsInArray:", v5);
  objc_msgSend(v11, "removeObject:", &unk_1E6CA0C60);
  objc_msgSend(v11, "removeObject:", &unk_1E6CA0F60);
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  return v5;
}

+ (id)_curatedColorValuesForDevice:(id)a3
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
  os_unfair_lock_lock((os_unfair_lock_t)&_curatedColorValuesForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_curatedColorValuesForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_curatedColorValuesForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_curatedColorValuesForDevice____cachedDevice, v3);
    _curatedColorValuesForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __61__NTKCaliforniaColorEditOption__curatedColorValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _curatedColorValuesForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_curatedColorValuesForDevice____lock);
  v11 = (id)_curatedColorValuesForDevice____colors;

  return v11;
}

void __61__NTKCaliforniaColorEditOption__curatedColorValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  v6 = &unk_1E6CAA450;
  if (v5)
  {
    objc_msgSend(&unk_1E6CAA450, "arrayByAddingObjectsFromArray:", &unk_1E6CAA468);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)_curatedColorValuesForDevice____colors;
  _curatedColorValuesForDevice____colors = (uint64_t)v6;

}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1215);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1216);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1216);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesRestrictedByDevice____cachedDevice_1216, v4);
    _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1217 = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__NTKCaliforniaColorEditOption__orderedValuesRestrictedByDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __65__NTKCaliforniaColorEditOption__orderedValuesRestrictedByDevice___block_invoke((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1217;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1215);
  v11 = (id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1214;

  return v11;
}

uint64_t __65__NTKCaliforniaColorEditOption__orderedValuesRestrictedByDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___NTKCaliforniaColorEditOption;
  objc_msgSendSuper2(&v6, sel__orderedValuesRestrictedByDevice_, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1214;
  _orderedValuesRestrictedByDevice__hardwareSpecificValues_1214 = v3;

  objc_msgSend((id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1214, "removeObject:", &unk_1E6CA0720);
  return objc_msgSend((id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1214, "removeObject:", &unk_1E6CA0750);
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  __CFString *v6;

  v5 = a4;
  if (a3 - 3000 >= 0xF)
  {
    +[NTKFaceColorEditOption _snapshotKeyForValue:forDevice:](NTKFaceColorEditOption, "_snapshotKeyForValue:forDevice:", a3, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E6BD7FC8[a3 - 3000];
  }

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NTKCaliforniaColorEditOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_1246 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1246, block);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1245;
}

void __60__NTKCaliforniaColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)NTKCaliforniaColorEditOption;
  objc_msgSendSuper2(&v7, sel__valueToFaceBundleStringDict);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v12[0] = &unk_1E6CA11E8;
  v12[1] = &unk_1E6CA1230;
  v13[0] = CFSTR("style 1");
  v13[1] = CFSTR("style 2");
  v12[2] = &unk_1E6CA1200;
  v12[3] = &unk_1E6CA1050;
  v13[2] = CFSTR("style 3");
  v13[3] = CFSTR("style 4");
  v12[4] = &unk_1E6CA1218;
  v13[4] = CFSTR("style 5");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v10[0] = &unk_1E6CA11D0;
  v10[1] = &unk_1E6CA11B8;
  v11[0] = CFSTR("style 6");
  v11[1] = CFSTR("style 7");
  v10[2] = &unk_1E6CA11A0;
  v10[3] = &unk_1E6CA1188;
  v11[2] = CFSTR("style 8");
  v11[3] = CFSTR("style 9");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  objc_msgSend(v2, "setObject:forKey:", CFSTR("style 10"), &unk_1E6CA1170);
  v8[0] = &unk_1E6CA1158;
  v8[1] = &unk_1E6CA1140;
  v9[0] = CFSTR("style 11");
  v9[1] = CFSTR("style 12");
  v8[2] = &unk_1E6CA1128;
  v8[3] = &unk_1E6CA1110;
  v9[2] = CFSTR("style 13");
  v9[3] = CFSTR("style 14");
  v8[4] = &unk_1E6CA10F8;
  v9[4] = CFSTR("style 15");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  v6 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1245;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1245 = (uint64_t)v2;

}

+ (id)colorNameForColor:(unint64_t)a3
{
  if (a3 - 3000 > 0xE)
    return 0;
  else
    return off_1E6BD8040[a3 - 3000];
}

+ (id)pigmentFaceDomain
{
  return CFSTR("california");
}

- (id)pigmentEditOption
{
  id v3;
  __CFString *v4;
  NTKPigmentEditOption *v5;
  __CFString *v6;
  NTKPigmentEditOption *v7;
  __CFString *v9;
  id v10;

  objc_msgSend((id)objc_opt_class(), "colorNameForColor:", -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("evergreen");
  if (-[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor") == 3009)
  {
    +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("special.rainbow"));
    v5 = (NTKPigmentEditOption *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v3)
    {
      v9 = v4;
      v10 = 0;
      NTKFaceColorNameAndCollection(-[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor"), &v10, &v9);
      v3 = v10;
      v6 = v9;

      v4 = v6;
    }
    v5 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v3, v4);
  }
  v7 = v5;

  return v7;
}

@end
