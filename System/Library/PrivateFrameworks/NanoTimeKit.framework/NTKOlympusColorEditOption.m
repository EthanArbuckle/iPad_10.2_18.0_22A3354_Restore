@implementation NTKOlympusColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[NTKOlympusColorEditOption pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_848);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_849);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_849);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_849, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_850 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors_847;
    _orderedValuesForDevice____colors_847 = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_850;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_848);
  v13 = (id)_orderedValuesForDevice____colors_847;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  if (v5)
  {
    _EnumValueRange(0x1AuLL, 0x1EuLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E6CAA318, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &unk_1E6CAA318;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
  v9 = objc_msgSend(v3, "supportsCapability:", v8);

  if (v9)
  {
    _EnumValueRange(0x1FuLL, 0x27uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C814BC07-AE2D-4061-9C1E-D97BED9DAC22"));
  v13 = objc_msgSend(v3, "supportsCapability:", v12);

  if (v13)
  {
    _EnumValueRange(0x28uLL, 0x30uLL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
  }

  return v7;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  char v35;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
  if (objc_msgSend(v4, "supportsCapability:", v5))
  {

    goto LABEL_9;
  }
  v6 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGraceEOlympusColors___lock);
  WeakRetained = objc_loadWeakRetained(&_NTKNewToGraceEOlympusColors___cachedDevice);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(&_NTKNewToGraceEOlympusColors___cachedDevice);
    if (v9 == v6)
    {
      v10 = objc_msgSend(v6, "version");
      v11 = _NTKNewToGraceEOlympusColors___previousCLKDeviceVersion;

      if (v10 == v11)
        goto LABEL_8;
    }
    else
    {

    }
  }
  v12 = objc_storeWeak(&_NTKNewToGraceEOlympusColors___cachedDevice, v6);
  _NTKNewToGraceEOlympusColors___previousCLKDeviceVersion = objc_msgSend(v6, "version");

  ___NTKNewToGraceEOlympusColors_block_invoke();
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGraceEOlympusColors___lock);
  v13 = (id)_NTKNewToGraceEOlympusColors_olympusGraceEColors;

  v14 = objc_msgSend(v13, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if ((v14 & 1) != 0)
    goto LABEL_17;
LABEL_9:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
  if (objc_msgSend(v4, "supportsCapability:", v15))
  {

    goto LABEL_18;
  }
  v16 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToHunterOlympusColors___lock);
  v17 = objc_loadWeakRetained(&_NTKNewToHunterOlympusColors___cachedDevice);
  if (v17)
  {
    v18 = v17;
    v19 = objc_loadWeakRetained(&_NTKNewToHunterOlympusColors___cachedDevice);
    if (v19 == v16)
    {
      v20 = objc_msgSend(v16, "version");
      v21 = _NTKNewToHunterOlympusColors___previousCLKDeviceVersion;

      if (v20 == v21)
        goto LABEL_16;
    }
    else
    {

    }
  }
  v22 = objc_storeWeak(&_NTKNewToHunterOlympusColors___cachedDevice, v16);
  _NTKNewToHunterOlympusColors___previousCLKDeviceVersion = objc_msgSend(v16, "version");

  ___NTKNewToHunterOlympusColors_block_invoke();
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToHunterOlympusColors___lock);
  v23 = (id)_NTKNewToHunterOlympusColors_hunterColors;

  v24 = objc_msgSend(v23, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if ((v24 & 1) == 0)
  {
LABEL_18:
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C814BC07-AE2D-4061-9C1E-D97BED9DAC22"));
    if (objc_msgSend(v4, "supportsCapability:", v26))
    {

      v25 = 1;
      goto LABEL_26;
    }
    v27 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToHunterEOlympusColors___lock);
    v28 = objc_loadWeakRetained(&_NTKNewToHunterEOlympusColors___cachedDevice);
    if (v28)
    {
      v29 = v28;
      v30 = objc_loadWeakRetained(&_NTKNewToHunterEOlympusColors___cachedDevice);
      if (v30 == v27)
      {
        v31 = objc_msgSend(v27, "version");
        v32 = _NTKNewToHunterEOlympusColors___previousCLKDeviceVersion;

        if (v31 == v32)
        {
LABEL_25:
          os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToHunterEOlympusColors___lock);
          v34 = (id)_NTKNewToHunterEOlympusColors_hunterEColors;

          v35 = objc_msgSend(v34, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
          v25 = v35 ^ 1;
          goto LABEL_26;
        }
      }
      else
      {

      }
    }
    v33 = objc_storeWeak(&_NTKNewToHunterEOlympusColors___cachedDevice, v27);
    _NTKNewToHunterEOlympusColors___previousCLKDeviceVersion = objc_msgSend(v27, "version");

    ___NTKNewToHunterEOlympusColors_block_invoke();
    goto LABEL_25;
  }
LABEL_17:
  v25 = 0;
LABEL_26:

  return v25;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color-%lu"), a4, a3);
}

- (id)_valueToFaceBundleStringDict
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__NTKOlympusColorEditOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_855 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_855, block);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleStringDict;
}

void __57__NTKOlympusColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleStringDict;
  _valueToFaceBundleStringDict_valueToFaceBundleStringDict = v2;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_orderedValuesForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("color %@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)_valueToFaceBundleStringDict_valueToFaceBundleStringDict, "setObject:forKeyedSubscript:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

+ (id)pigmentFaceDomain
{
  return CFSTR("victoryHybrid");
}

- (id)pigmentEditOption
{
  void *v2;
  __CFString *v3;
  NTKPigmentEditOption *v4;
  __CFString *v6;

  v6 = CFSTR("victoryHybrid");
  objc_msgSend((id)objc_opt_class(), "colorNameForColorValue:collectionName:", -[NTKOlympusColorEditOption color](self, "color"), &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  v4 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v2, v3);

  return v4;
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  uint64_t v4;

  v4 = 0;
  objc_msgSend(a1, "colorNameForColorValue:collectionName:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorNameForColorValue:(unint64_t)a3 collectionName:(id *)a4
{
  const __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;

  switch(a3)
  {
    case 0uLL:
      v4 = CFSTR("anthracite");
      goto LABEL_32;
    case 1uLL:
      v4 = CFSTR("black");
      v5 = CFSTR("anthracite");
      goto LABEL_34;
    case 2uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("volt");
      return v6;
    case 3uLL:
      v7 = 2;
      goto LABEL_52;
    case 4uLL:
      v8 = 2;
      goto LABEL_54;
    case 5uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("purePlatinum");
      return v6;
    case 6uLL:
      v7 = 5;
      goto LABEL_52;
    case 7uLL:
      v8 = 5;
      goto LABEL_54;
    case 8uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("totalOrange");
      return v6;
    case 9uLL:
      v7 = 8;
      goto LABEL_52;
    case 0xAuLL:
      v8 = 8;
      goto LABEL_54;
    case 0xBuLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("auroraGreen");
      return v6;
    case 0xCuLL:
      v7 = 11;
      goto LABEL_52;
    case 0xDuLL:
      v8 = 11;
      goto LABEL_54;
    case 0xEuLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("celestialTeal");
      return v6;
    case 0xFuLL:
      v7 = 14;
      goto LABEL_52;
    case 0x10uLL:
      v8 = 14;
      goto LABEL_54;
    case 0x11uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("royalPulse");
      return v6;
    case 0x12uLL:
      v7 = 17;
      goto LABEL_52;
    case 0x13uLL:
      v8 = 17;
      goto LABEL_54;
    case 0x14uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("pinkBlast");
      return v6;
    case 0x15uLL:
      v7 = 20;
      goto LABEL_52;
    case 0x16uLL:
      v8 = 20;
      goto LABEL_54;
    case 0x17uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("desertSand");
      return v6;
    case 0x18uLL:
      v7 = 23;
      goto LABEL_52;
    case 0x19uLL:
      v8 = 23;
      goto LABEL_54;
    case 0x1AuLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("midnightTurquoise");
      return v6;
    case 0x1BuLL:
      v7 = 26;
      goto LABEL_52;
    case 0x1CuLL:
      v8 = 26;
      goto LABEL_54;
    case 0x1DuLL:
      v4 = CFSTR("limeBlast");
LABEL_32:
      v5 = CFSTR("black");
      goto LABEL_34;
    case 0x1EuLL:
      v4 = CFSTR("black");
      v5 = CFSTR("limeBlast");
LABEL_34:
      ntk_duotone((uint64_t)CFSTR("victory"), (uint64_t)v4, CFSTR("victory"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v6;
    case 0x1FuLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("spruceAura");
      return v6;
    case 0x20uLL:
      v7 = 31;
      goto LABEL_52;
    case 0x21uLL:
      v8 = 31;
      goto LABEL_54;
    case 0x22uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("blueBlack");
      return v6;
    case 0x23uLL:
      v7 = 34;
      goto LABEL_52;
    case 0x24uLL:
      v8 = 34;
      goto LABEL_54;
    case 0x25uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("obsidianMist");
      return v6;
    case 0x26uLL:
      v7 = 37;
      goto LABEL_52;
    case 0x27uLL:
      v8 = 37;
      goto LABEL_54;
    case 0x28uLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("hasta");
      return v6;
    case 0x29uLL:
      v7 = 40;
      goto LABEL_52;
    case 0x2AuLL:
      v8 = 40;
      goto LABEL_54;
    case 0x2BuLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("chlorineBlue");
      return v6;
    case 0x2CuLL:
      v7 = 43;
      goto LABEL_52;
    case 0x2DuLL:
      v8 = 43;
      goto LABEL_54;
    case 0x2EuLL:
      *a4 = CFSTR("victory");
      v6 = CFSTR("ironstone");
      return v6;
    case 0x2FuLL:
      v7 = 46;
LABEL_52:
      objc_msgSend(a1, "colorNameForColorValue:", v7, a4);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("black");
      v11 = v9;
      goto LABEL_55;
    case 0x30uLL:
      v8 = 46;
LABEL_54:
      objc_msgSend(a1, "colorNameForColorValue:", v8, a4);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("black");
      v10 = v9;
LABEL_55:
      ntk_duotone((uint64_t)CFSTR("victory"), (uint64_t)v11, CFSTR("victory"), v10);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (unint64_t)colorCodeForPigmentEditOption:(id)a3 forDevice:(id)a4
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a1, "legacyOptionWithPigmentEditOption:forDevice:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "color");

  return v5;
}

@end
