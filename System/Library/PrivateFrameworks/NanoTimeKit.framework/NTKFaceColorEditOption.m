@implementation NTKFaceColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return 0;
}

+ (id)_optionByValidatingValueOfInvalidOption:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4))
  {
    v5 = objc_msgSend(v3, "_value");
    v6 = objc_msgSend(v4, "collectionType");
    v7 = objc_msgSend(v4, "materialType");
    v8 = (void *)objc_opt_class();
    v9 = 1000;
    switch(v5)
    {
      case 'd':
        break;
      case 'e':
        v10 = 1001;
        if (v7 != 8)
          v10 = 1002;
        if (v7 == 10)
          v9 = 1000;
        else
          v9 = v10;
        break;
      case 'f':
        if (v6 == 5)
          goto LABEL_13;
        v9 = 54;
        break;
      case 'g':
        if (v6 == 6)
          goto LABEL_13;
        v9 = 39;
        break;
      default:
        if (v5 != 53)
          goto LABEL_13;
        break;
    }
    objc_msgSend(v8, "optionWithFaceColor:forDevice:", v9, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:
    v11 = 0;
  }

  return v11;
}

+ (id)_thirdPartyValues
{
  return &unk_1E6CAA108;
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_orderedValuesRestrictedByDevice____cachedDevice, v3);
    _orderedValuesRestrictedByDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __59__NTKFaceColorEditOption__orderedValuesRestrictedByDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _orderedValuesRestrictedByDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock);
  v11 = (id)_orderedValuesRestrictedByDevice__hardwareSpecificValues;

  return v11;
}

void __59__NTKFaceColorEditOption__orderedValuesRestrictedByDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_new();
  v4 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues;
  _orderedValuesRestrictedByDevice__hardwareSpecificValues = v3;

  v5 = objc_msgSend(v2, "collectionType");
  _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "_orderedValuesRestrictedByDevice collectionType:%ld", (uint8_t *)&v8, 0xCu);
  }

  v7 = &unk_1E6CA06F0;
  switch(v5)
  {
    case 3:
      if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v2) & 1) == 0)
      {
        v7 = &unk_1E6CA0720;
        goto LABEL_10;
      }
      break;
    case 4:
      if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v2) & 1) == 0)
      {
        v7 = &unk_1E6CA0738;
        goto LABEL_10;
      }
      break;
    case 5:
      goto LABEL_10;
    case 8:
      if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v2) & 1) == 0)
      {
        v7 = &unk_1E6CA0750;
LABEL_10:
        objc_msgSend((id)_orderedValuesRestrictedByDevice__hardwareSpecificValues, "addObject:", v7);
      }
      break;
    default:
      break;
  }

}

+ (id)standardColorEditOptionsForDevice:(id)a3
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
  os_unfair_lock_lock((os_unfair_lock_t)&standardColorEditOptionsForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&standardColorEditOptionsForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&standardColorEditOptionsForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&standardColorEditOptionsForDevice____cachedDevice, v4);
    standardColorEditOptionsForDevice____previousCLKDeviceVersion = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__NTKFaceColorEditOption_standardColorEditOptionsForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __60__NTKFaceColorEditOption_standardColorEditOptionsForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = standardColorEditOptionsForDevice____previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&standardColorEditOptionsForDevice____lock);
  v11 = (id)standardColorEditOptionsForDevice__colors;

  return v11;
}

void __60__NTKFaceColorEditOption_standardColorEditOptionsForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "standardColorValuesForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "optionWithFaceColor:forDevice:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "integerValue", (_QWORD)v14), v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  v13 = (void *)standardColorEditOptionsForDevice__colors;
  standardColorEditOptionsForDevice__colors = v12;

}

+ (id)standardColorValuesForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "nrDeviceVersion") >= 0x50000)
  {
    if (objc_msgSend(v3, "nrDeviceVersion") >> 9 >= 0x281)
    {
      if (objc_msgSend(v3, "nrDeviceVersion") >= 0x60000)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
        v6 = objc_msgSend(v3, "supportsCapability:", v5);

        if (v6)
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
          v8 = objc_msgSend(v3, "supportsCapability:", v7);

          if (v8)
          {
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C814BC07-AE2D-4061-9C1E-D97BED9DAC22"));
            v10 = objc_msgSend(v3, "supportsCapability:", v9);

            v4 = &unk_1E6CAA198;
            if (v10)
              v4 = &unk_1E6CAA1B0;
          }
          else
          {
            v4 = &unk_1E6CAA180;
          }
        }
        else
        {
          v4 = &unk_1E6CAA168;
        }
      }
      else
      {
        v4 = &unk_1E6CAA150;
      }
    }
    else
    {
      v4 = &unk_1E6CAA138;
    }
  }
  else
  {
    v4 = &unk_1E6CAA120;
  }
  v11 = (void *)standardColorValuesForDevice__orderedColors;
  standardColorValuesForDevice__orderedColors = (uint64_t)v4;

  v12 = (id)standardColorValuesForDevice__orderedColors;
  return v12;
}

+ (id)standardColorsWithColorClass:(Class)a3 forDevice:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&standardColorsWithColorClass_forDevice____lock);
  WeakRetained = objc_loadWeakRetained(&standardColorsWithColorClass_forDevice____cachedDevice);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&standardColorsWithColorClass_forDevice____cachedDevice);
    if (v9 == v6)
    {
      v10 = objc_msgSend(v6, "version");
      v11 = standardColorsWithColorClass_forDevice____previousCLKDeviceVersion;

      if (v10 == v11)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v12 = objc_storeWeak(&standardColorsWithColorClass_forDevice____cachedDevice, v6);
  standardColorsWithColorClass_forDevice____previousCLKDeviceVersion = objc_msgSend(v6, "version");

  v13 = objc_opt_new();
  v14 = (void *)standardColorsWithColorClass_forDevice__standardColorsCache;
  standardColorsWithColorClass_forDevice__standardColorsCache = v13;

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&standardColorsWithColorClass_forDevice____lock);
  v15 = a1;
  objc_sync_enter(v15);
  NSStringFromClass(a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)standardColorsWithColorClass_forDevice__standardColorsCache, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[objc_class standardColorEditOptionsForDevice:](a3, "standardColorEditOptionsForDevice:", v6);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)standardColorsWithColorClass_forDevice__standardColorsCache, "setObject:forKey:", v19, v16);
  }

  objc_sync_exit(v15);
  return v19;
}

+ (BOOL)value:(int64_t)a3 existsInDevice:(id)a4
{
  id v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  void *v31;
  char v32;

  v5 = a4;
  v6 = objc_msgSend(v5, "nrDeviceVersion");
  v7 = v6;
  if (!(v6 >> 18))
  {
    NTKNewToFortuneColors();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", a3);

    if ((v9 & 1) != 0)
      goto LABEL_26;
    if (v7 >> 9 <= 0x180)
    {
      NTKNewToElectricColors();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsIndex:", a3);

      if ((v11 & 1) != 0)
        goto LABEL_26;
    }
LABEL_7:
    NTKNewToEmperorColors();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsIndex:", a3);

    if ((v13 & 1) != 0)
      goto LABEL_26;
    goto LABEL_10;
  }
  if (v6 >> 8 <= 0x402)
    goto LABEL_7;
  if (HIWORD(v6) <= 4u)
  {
LABEL_10:
    NTKNewToGloryColors();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsIndex:", a3);

    if ((v15 & 1) != 0)
      goto LABEL_26;
    goto LABEL_13;
  }
  if (v6 >> 9 > 0x280)
  {
    if (v6 >> 17 > 2)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_13:
  NTKNewToGloryEColors();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsIndex:", a3);

  if ((v17 & 1) != 0)
    goto LABEL_26;
LABEL_16:
  NTKNewToGraceColors();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsIndex:", a3);

  if ((v19 & 1) != 0)
    goto LABEL_26;
LABEL_17:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
  if (objc_msgSend(v5, "supportsCapability:", v20))
  {

  }
  else
  {
    NTKNewToGraceEColors();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsIndex:", a3);

    if ((v22 & 1) != 0)
      goto LABEL_26;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
  if (objc_msgSend(v5, "supportsCapability:", v23))
  {

  }
  else
  {
    NTKNewToHunterColors();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containsIndex:", a3);

    if ((v25 & 1) != 0)
      goto LABEL_26;
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C814BC07-AE2D-4061-9C1E-D97BED9DAC22"));
  if (objc_msgSend(v5, "supportsCapability:", v26))
  {

    goto LABEL_28;
  }
  NTKNewToHunterEColors();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsIndex:", a3);

  if ((v28 & 1) != 0)
  {
LABEL_26:
    v29 = 0;
    goto LABEL_27;
  }
LABEL_28:
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v5) & 1) != 0)
  {
    v29 = 1;
  }
  else
  {
    NTKDistinctSportPlusAndEditionColors();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsIndex:", a3);

    v29 = v32 ^ 1;
  }
LABEL_27:

  return v29;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "value:existsInDevice:", -[NTKValueEditOption _value](self, "_value"), v4);

  return (char)self;
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_0);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_0);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_0);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_0, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_0 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors;
    _orderedValuesForDevice____colors = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_0;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_0);
  v13 = (id)_orderedValuesForDevice____colors;

  return v13;
}

+ (id)__allOrderedColors
{
  return (id)objc_msgSend(&unk_1E6CAA1C8, "mutableCopy");
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "__allOrderedColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_orderedValuesRestrictedByDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13++), 0);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v14 = (void *)MEMORY[0x1E0CB3880];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __51__NTKFaceColorEditOption___orderedValuesForDevice___block_invoke;
  v21 = &unk_1E6BD7AF8;
  v22 = v4;
  v23 = a1;
  v15 = v4;
  objc_msgSend(v14, "predicateWithBlock:", &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterUsingPredicate:", v16, v18, v19, v20, v21);

  return v5;
}

uint64_t __51__NTKFaceColorEditOption___orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "value:existsInDevice:", objc_msgSend(a2, "integerValue"), *(_QWORD *)(a1 + 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKFaceColorEditOption;
  if (-[NTKValueEditOption isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = (void *)objc_opt_class();
    -[NTKEditOption device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_orderedValuesRestrictedByDevice:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKValueEditOption _value](self, "_value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      -[NTKEditOption device](self, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "materialType");
      objc_msgSend(v4, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 == objc_msgSend(v12, "materialType");

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if ((uint64_t)a3 > 999)
  {
    v8 = CFSTR("gold-generic-2");
    v9 = CFSTR("gold-generic-3");
    if (a3 != 1002)
      v9 = 0;
    if (a3 != 1001)
      v8 = v9;
    if (a3 == 1000)
      v7 = CFSTR("gold-generic-1");
    else
      v7 = v8;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        v7 = CFSTR("pink");
        break;
      case 1uLL:
        v7 = CFSTR("purple");
        break;
      case 2uLL:
        v7 = CFSTR("blue");
        break;
      case 3uLL:
        v7 = CFSTR("green");
        break;
      case 4uLL:
        v7 = CFSTR("yellow");
        break;
      case 5uLL:
        v7 = CFSTR("orange");
        break;
      case 6uLL:
        v7 = CFSTR("red");
        break;
      case 7uLL:
        v7 = CFSTR("white");
        break;
      case 8uLL:
        v7 = CFSTR("dark-orange");
        break;
      case 9uLL:
        v7 = CFSTR("turquoise");
        break;
      case 0xAuLL:
        v7 = CFSTR("midnight-blue");
        break;
      case 0xBuLL:
        v7 = CFSTR("lavender");
        break;
      case 0xCuLL:
        v7 = CFSTR("vintage-rose");
        break;
      case 0xDuLL:
        v7 = CFSTR("walnut");
        break;
      case 0xEuLL:
        v7 = CFSTR("stone");
        break;
      case 0xFuLL:
        v7 = CFSTR("antique-white");
        break;
      case 0x10uLL:
        v7 = CFSTR("light-blue");
        break;
      case 0x11uLL:
        v7 = CFSTR("mint");
        break;
      case 0x12uLL:
        v7 = CFSTR("lilac");
        break;
      case 0x13uLL:
        v7 = CFSTR("royal-blue");
        break;
      case 0x14uLL:
        v7 = CFSTR("light-pink");
        break;
      case 0x15uLL:
        v7 = CFSTR("apricot");
        break;
      case 0x16uLL:
        v7 = CFSTR("ocean-blue");
        break;
      case 0x17uLL:
        v7 = CFSTR("cocoa");
        break;
      case 0x18uLL:
        v7 = CFSTR("ice-white");
        break;
      case 0x19uLL:
        v7 = CFSTR("pink-sand");
        break;
      case 0x1AuLL:
        v7 = CFSTR("gray");
        break;
      case 0x1BuLL:
        v7 = CFSTR("pebble");
        break;
      case 0x1CuLL:
        v7 = CFSTR("azure");
        break;
      case 0x1DuLL:
        v7 = CFSTR("camellia");
        break;
      case 0x1EuLL:
        v7 = CFSTR("mist-blue");
        break;
      case 0x1FuLL:
        v7 = CFSTR("flamingo");
        break;
      case 0x20uLL:
        v7 = CFSTR("pollen");
        break;
      case 0x21uLL:
        v7 = CFSTR("soft-white");
        break;
      case 0x22uLL:
        v7 = CFSTR("blue-cobalt");
        break;
      case 0x23uLL:
        v7 = CFSTR("dark-olive");
        break;
      case 0x24uLL:
        v7 = CFSTR("violet");
        break;
      case 0x25uLL:
        v7 = CFSTR("rose-red");
        break;
      case 0x27uLL:
        v7 = CFSTR("flash");
        break;
      case 0x28uLL:
        v7 = CFSTR("dark-teal");
        break;
      case 0x29uLL:
        v7 = CFSTR("electric-pink");
        break;
      case 0x2AuLL:
        v7 = CFSTR("peach");
        break;
      case 0x2BuLL:
        v7 = CFSTR("denim-blue");
        break;
      case 0x2CuLL:
        v7 = CFSTR("flash-light");
        break;
      case 0x2DuLL:
        v7 = CFSTR("nectarine");
        break;
      case 0x2EuLL:
        v7 = CFSTR("mellow-yellow");
        break;
      case 0x2FuLL:
        v7 = CFSTR("storm-gray");
        break;
      case 0x30uLL:
        v7 = CFSTR("pacific-green");
        break;
      case 0x31uLL:
        v7 = CFSTR("blue-horizon");
        break;
      case 0x32uLL:
        v7 = CFSTR("indigo");
        break;
      case 0x33uLL:
        v7 = CFSTR("lavender-gray");
        break;
      case 0x34uLL:
        v7 = CFSTR("hibiscus");
        break;
      case 0x35uLL:
        v7 = CFSTR("blush-gold-steel");
        break;
      case 0x36uLL:
        v7 = CFSTR("papaya");
        break;
      case 0x37uLL:
        v7 = CFSTR("canary-yellow");
        break;
      case 0x38uLL:
        v7 = CFSTR("spearmint");
        break;
      case 0x39uLL:
        v7 = CFSTR("cerulean");
        break;
      case 0x3AuLL:
        v7 = CFSTR("delft-blue");
        break;
      case 0x3BuLL:
        v7 = CFSTR("dragon-fruit");
        break;
      case 0x3CuLL:
        v7 = CFSTR("pine-green");
        break;
      case 0x3DuLL:
        v7 = CFSTR("lemon-cream");
        break;
      case 0x3EuLL:
        v7 = CFSTR("alaskan-blue");
        break;
      case 0x3FuLL:
        v7 = CFSTR("pomegranate");
        break;
      case 0x40uLL:
        v7 = CFSTR("khaki");
        break;
      case 0x41uLL:
        v7 = CFSTR("beryl");
        break;
      case 0x42uLL:
        v7 = CFSTR("camel");
        break;
      case 0x43uLL:
        v7 = CFSTR("sea-foam");
        break;
      case 0x44uLL:
        v7 = CFSTR("surf-blue");
        break;
      case 0x45uLL:
        v7 = CFSTR("cactus");
        break;
      case 0x46uLL:
        v7 = CFSTR("linen-blue");
        break;
      case 0x47uLL:
        v7 = CFSTR("grapefruit");
        break;
      case 0x48uLL:
        v7 = CFSTR("neon-pink");
        break;
      case 0x49uLL:
        v7 = CFSTR("coastal-gray");
        break;
      case 0x4AuLL:
        v7 = CFSTR("PinkCitrus");
        break;
      case 0x4BuLL:
        v7 = CFSTR("DeepNavy");
        break;
      case 0x4CuLL:
        v7 = CFSTR("CyprusGreen");
        break;
      case 0x4DuLL:
        v7 = CFSTR("Cream");
        break;
      case 0x4EuLL:
        v7 = CFSTR("Kumquat");
        break;
      case 0x4FuLL:
        v7 = CFSTR("NorthernBlue");
        break;
      case 0x50uLL:
        v7 = CFSTR("Plum");
        break;
      case 0x51uLL:
        v7 = CFSTR("ElectricOrange");
        break;
      case 0x52uLL:
        v7 = CFSTR("Sunflower");
        break;
      case 0x53uLL:
        v7 = CFSTR("Pistachio");
        break;
      case 0x54uLL:
        v7 = CFSTR("CloudBlue");
        break;
      case 0x55uLL:
        v7 = CFSTR("Abyss");
        break;
      case 0x56uLL:
        v7 = CFSTR("SeaSalt");
        break;
      case 0x57uLL:
        v7 = CFSTR("Olive");
        break;
      case 0x58uLL:
        v7 = CFSTR("MallardGreen");
        break;
      case 0x64uLL:
        v10 = objc_msgSend(v5, "materialType");
        v11 = CFSTR("edition");
        if (v10 == 6)
          v11 = CFSTR("edition rose gold");
        if (v10 == 5)
          v7 = CFSTR("edition gold");
        else
          v7 = v11;
        break;
      case 0x65uLL:
        v12 = objc_msgSend(v5, "materialType");
        if ((unint64_t)(v12 - 7) >= 4)
          v7 = CFSTR("sport+");
        else
          v7 = off_1E6BD7E78[v12 - 7];
        break;
      case 0x66uLL:
        v7 = CFSTR("zeus");
        break;
      case 0x67uLL:
        v7 = CFSTR("victory");
        break;
      case 0x68uLL:
        v7 = CFSTR("explorer");
        break;
      case 0x69uLL:
        v7 = CFSTR("whistler-black");
        break;
      case 0xC8uLL:
        v7 = CFSTR("multi");
        break;
      default:
        break;
    }
  }

  return (id)v7;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[NTKFaceColorEditOption pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  return +[NTKFaceColorEditOption __valueToFaceBundleStringDict](NTKFaceColorEditOption, "__valueToFaceBundleStringDict");
}

+ (id)__valueToFaceBundleStringDict
{
  if (__valueToFaceBundleStringDict_onceToken != -1)
    dispatch_once(&__valueToFaceBundleStringDict_onceToken, &__block_literal_global_523);
  return (id)__valueToFaceBundleStringDict_valueToFaceBundleString;
}

void __55__NTKFaceColorEditOption___valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[100];
  _QWORD v3[101];

  v3[100] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("pink");
  v3[1] = CFSTR("purple");
  v2[2] = &unk_1E6CA0D38;
  v2[3] = &unk_1E6CA0D08;
  v3[2] = CFSTR("blue");
  v3[3] = CFSTR("green");
  v2[4] = &unk_1E6CA0CC0;
  v2[5] = &unk_1E6CA0CA8;
  v3[4] = CFSTR("yellow");
  v3[5] = CFSTR("orange");
  v2[6] = &unk_1E6CA0810;
  v2[7] = &unk_1E6CA0C60;
  v3[6] = CFSTR("red");
  v3[7] = CFSTR("white");
  v2[8] = &unk_1E6CA0720;
  v2[9] = &unk_1E6CA0738;
  v3[8] = CFSTR("rose gold");
  v3[9] = CFSTR("rose gold sport");
  v2[10] = &unk_1E6CA0F60;
  v2[11] = &unk_1E6CA0F78;
  v3[10] = CFSTR("gold generic 1");
  v3[11] = CFSTR("gold generic 2");
  v2[12] = &unk_1E6CA0F90;
  v2[13] = &unk_1E6CA06F0;
  v3[12] = CFSTR("gold generic 3");
  v3[13] = CFSTR("Hermès");
  v2[14] = &unk_1E6CA0FA8;
  v2[15] = &unk_1E6CA0FC0;
  v3[14] = CFSTR("siri");
  v3[15] = CFSTR("siri grey");
  v2[16] = &unk_1E6CA0708;
  v2[17] = &unk_1E6CA0FD8;
  v3[16] = CFSTR("victory");
  v3[17] = CFSTR("explorer");
  v2[18] = &unk_1E6CA0FF0;
  v2[19] = &unk_1E6CA0C78;
  v3[18] = CFSTR("multicolor");
  v3[19] = CFSTR("dark orange");
  v2[20] = &unk_1E6CA07F8;
  v2[21] = &unk_1E6CA09D8;
  v3[20] = CFSTR("turquoise");
  v3[21] = CFSTR("midnight blue");
  v2[22] = &unk_1E6CA0DF8;
  v2[23] = &unk_1E6CA0E28;
  v3[22] = CFSTR("lavender");
  v3[23] = CFSTR("vintage rose");
  v2[24] = &unk_1E6CA0EB8;
  v2[25] = &unk_1E6CA0ED0;
  v3[24] = CFSTR("walnut");
  v3[25] = CFSTR("stone");
  v2[26] = &unk_1E6CA0EE8;
  v2[27] = &unk_1E6CA0D20;
  v3[26] = CFSTR("antique white");
  v3[27] = CFSTR("light blue");
  v2[28] = &unk_1E6CA1008;
  v2[29] = &unk_1E6CA07B0;
  v3[28] = CFSTR("gray");
  v3[29] = CFSTR("mint");
  v2[30] = &unk_1E6CA0948;
  v2[31] = &unk_1E6CA0780;
  v3[30] = CFSTR("lilac");
  v3[31] = CFSTR("royal blue");
  v2[32] = &unk_1E6CA0798;
  v2[33] = &unk_1E6CA07C8;
  v3[32] = CFSTR("light pink");
  v3[33] = CFSTR("apricot");
  v2[34] = &unk_1E6CA0DC8;
  v2[35] = &unk_1E6CA0F30;
  v3[34] = CFSTR("ocean blue");
  v3[35] = CFSTR("cocoa");
  v2[36] = &unk_1E6CA1020;
  v2[37] = &unk_1E6CA0E10;
  v3[36] = CFSTR("ice white");
  v3[37] = CFSTR("pink sand");
  v2[38] = &unk_1E6CA0F18;
  v2[39] = &unk_1E6CA0D68;
  v3[38] = CFSTR("pebble");
  v3[39] = CFSTR("azure");
  v2[40] = &unk_1E6CA0E88;
  v2[41] = &unk_1E6CA0D50;
  v3[40] = CFSTR("camelia");
  v3[41] = CFSTR("mist blue");
  v2[42] = &unk_1E6CA0EA0;
  v2[43] = &unk_1E6CA0768;
  v3[42] = CFSTR("flamingo");
  v3[43] = CFSTR("pollen");
  v2[44] = &unk_1E6CA0828;
  v2[45] = &unk_1E6CA08A0;
  v3[44] = CFSTR("nectarine");
  v3[45] = CFSTR("mellow yellow");
  v2[46] = &unk_1E6CA0840;
  v2[47] = &unk_1E6CA08B8;
  v3[46] = CFSTR("storm gray");
  v3[47] = CFSTR("pacific green");
  v2[48] = &unk_1E6CA0858;
  v2[49] = &unk_1E6CA0870;
  v3[48] = CFSTR("blue horizon");
  v3[49] = CFSTR("indigo");
  v2[50] = &unk_1E6CA0888;
  v2[51] = &unk_1E6CA08D0;
  v3[50] = CFSTR("lavender gray");
  v3[51] = CFSTR("hibiscus");
  v2[52] = &unk_1E6CA0750;
  v2[53] = &unk_1E6CA0F00;
  v3[52] = CFSTR("blush gold steel");
  v3[53] = CFSTR("soft white");
  v2[54] = &unk_1E6CA0D80;
  v2[55] = &unk_1E6CA0F48;
  v3[54] = CFSTR("blue cobalt");
  v3[55] = CFSTR("dark olive");
  v2[56] = &unk_1E6CA0DE0;
  v2[57] = &unk_1E6CA0E70;
  v3[56] = CFSTR("violet");
  v3[57] = CFSTR("rose red");
  v2[58] = &unk_1E6CA0CF0;
  v2[59] = &unk_1E6CA0D98;
  v3[58] = CFSTR("flash");
  v3[59] = CFSTR("dark teal");
  v2[60] = &unk_1E6CA0E58;
  v2[61] = &unk_1E6CA0C90;
  v3[60] = CFSTR("electric pink");
  v3[61] = CFSTR("peach");
  v2[62] = &unk_1E6CA0DB0;
  v2[63] = &unk_1E6CA0CD8;
  v3[62] = CFSTR("denim blue");
  v3[63] = CFSTR("flash light");
  v2[64] = &unk_1E6CA08E8;
  v3[64] = CFSTR("papaya");
  v2[65] = &unk_1E6CA0900;
  v3[65] = CFSTR("canary yellow");
  v2[66] = &unk_1E6CA0918;
  v3[66] = CFSTR("spearmint");
  v2[67] = &unk_1E6CA0930;
  v3[67] = CFSTR("cerulean");
  v2[68] = &unk_1E6CA0960;
  v3[68] = CFSTR("delft blue");
  v2[69] = &unk_1E6CA0978;
  v3[69] = CFSTR("dragon fruit");
  v2[70] = &unk_1E6CA0A38;
  v3[70] = CFSTR("pine green");
  v2[71] = &unk_1E6CA09C0;
  v3[71] = CFSTR("lemon cream");
  v2[72] = &unk_1E6CA09A8;
  v3[72] = CFSTR("alaskan blue");
  v2[73] = &unk_1E6CA09F0;
  v3[73] = CFSTR("pomegranate");
  v2[74] = &unk_1E6CA0A20;
  v3[74] = CFSTR("khaki");
  v2[75] = &unk_1E6CA0990;
  v3[75] = CFSTR("beryl");
  v2[76] = &unk_1E6CA0A08;
  v3[76] = CFSTR("camel");
  v2[77] = &unk_1E6CA0A50;
  v3[77] = CFSTR("sea foam");
  v2[78] = &unk_1E6CA0A68;
  v3[78] = CFSTR("surf blue");
  v2[79] = &unk_1E6CA0A80;
  v3[79] = CFSTR("cactus");
  v2[80] = &unk_1E6CA0A98;
  v3[80] = CFSTR("linen blue");
  v2[81] = &unk_1E6CA0AB0;
  v3[81] = CFSTR("grapefruit");
  v2[82] = &unk_1E6CA0AC8;
  v3[82] = CFSTR("neon pink");
  v2[83] = &unk_1E6CA0AE0;
  v3[83] = CFSTR("coastal gray");
  v2[84] = &unk_1E6CA0AF8;
  v3[84] = CFSTR("PinkCitrus");
  v2[85] = &unk_1E6CA0B10;
  v3[85] = CFSTR("DeepNavy");
  v2[86] = &unk_1E6CA0B28;
  v3[86] = CFSTR("CyprusGreen");
  v2[87] = &unk_1E6CA0B40;
  v3[87] = CFSTR("FallCream");
  v2[88] = &unk_1E6CA0B58;
  v3[88] = CFSTR("Kumquat");
  v2[89] = &unk_1E6CA0B70;
  v3[89] = CFSTR("NorthernBlue");
  v2[90] = &unk_1E6CA0B88;
  v3[90] = CFSTR("Plum");
  v2[91] = &unk_1E6CA0BA0;
  v3[91] = CFSTR("ElectricOrange");
  v2[92] = &unk_1E6CA0BB8;
  v3[92] = CFSTR("Sunflower");
  v2[93] = &unk_1E6CA0BD0;
  v3[93] = CFSTR("Pistachio");
  v2[94] = &unk_1E6CA0BE8;
  v3[94] = CFSTR("CloudBlue");
  v2[95] = &unk_1E6CA0C00;
  v3[95] = CFSTR("Abyss");
  v2[96] = &unk_1E6CA0C18;
  v3[96] = CFSTR("SeaSalt");
  v2[97] = &unk_1E6CA0C30;
  v3[97] = CFSTR("Olive");
  v2[98] = &unk_1E6CA0C48;
  v3[98] = CFSTR("MallardGreen");
  v2[99] = &unk_1E6CA1038;
  v3[99] = CFSTR("whistler black");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 100);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__valueToFaceBundleStringDict_valueToFaceBundleString;
  __valueToFaceBundleStringDict_valueToFaceBundleString = v0;

}

- (id)pigmentEditOption
{
  id v2;
  id v3;
  NTKPigmentEditOption *v4;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  NTKFaceColorNameAndCollection(-[NTKValueEditOption _value](self, "_value"), &v7, &v6);
  v2 = v7;
  v3 = v6;
  v4 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v2, v3);

  return v4;
}

@end
