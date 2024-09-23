@implementation NTKVictoryColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return 0;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[NTKVictoryColorEditOption pigmentEditOption](self, "pigmentEditOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  char v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  char v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  char v60;
  void *v62;
  void *v63;
  void *v64;
  char v65;

  v4 = a3;
  v5 = objc_msgSend(v4, "nrDeviceVersion");
  v6 = v5;
  if (!(v5 >> 18))
  {
    -[NTKEditOption device](self, "device");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToFortuneVictoryColors___lock);
    WeakRetained = objc_loadWeakRetained(&_NTKNewToFortuneVictoryColors___cachedDevice);
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v10 = objc_loadWeakRetained(&_NTKNewToFortuneVictoryColors___cachedDevice);
      if (v10 == v7)
      {
        v11 = objc_msgSend(v7, "version");
        v12 = _NTKNewToFortuneVictoryColors___previousCLKDeviceVersion;

        if (v11 == v12)
          goto LABEL_11;
      }
      else
      {

      }
    }
    v13 = objc_storeWeak(&_NTKNewToFortuneVictoryColors___cachedDevice, v7);
    _NTKNewToFortuneVictoryColors___previousCLKDeviceVersion = objc_msgSend(v7, "version");

    ___NTKNewToFortuneVictoryColors_block_invoke();
LABEL_11:
    os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToFortuneVictoryColors___lock);
    v14 = (id)_NTKNewToFortuneVictoryColors_victoryFortuneColors;

    v15 = objc_msgSend(v14, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
    if ((v15 & 1) != 0)
      goto LABEL_46;
    if (v6 >> 9 > 0x180)
    {
LABEL_19:
      -[NTKEditOption device](self, "device");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGloryVictoryColors___lock);
      v26 = objc_loadWeakRetained(&_NTKNewToGloryVictoryColors___cachedDevice);
      if (v26)
      {
        v27 = v26;
        v28 = objc_loadWeakRetained(&_NTKNewToGloryVictoryColors___cachedDevice);
        if (v28 == v25)
        {
          v29 = objc_msgSend(v25, "version");
          v30 = _NTKNewToGloryVictoryColors___previousCLKDeviceVersion;

          if (v29 == v30)
            goto LABEL_24;
        }
        else
        {

        }
      }
      v31 = objc_storeWeak(&_NTKNewToGloryVictoryColors___cachedDevice, v25);
      _NTKNewToGloryVictoryColors___previousCLKDeviceVersion = objc_msgSend(v25, "version");

      ___NTKNewToGloryVictoryColors_block_invoke();
LABEL_24:
      os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGloryVictoryColors___lock);
      v32 = (id)_NTKNewToGloryVictoryColors_victoryGloryColors;

      v33 = objc_msgSend(v32, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
      if ((v33 & 1) != 0)
        goto LABEL_46;
LABEL_25:
      -[NTKEditOption device](self, "device");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGloryEVictoryColors___lock);
      v35 = objc_loadWeakRetained(&_NTKNewToGloryEVictoryColors___cachedDevice);
      if (v35)
      {
        v36 = v35;
        v37 = objc_loadWeakRetained(&_NTKNewToGloryEVictoryColors___cachedDevice);
        if (v37 == v34)
        {
          v38 = objc_msgSend(v34, "version");
          v39 = _NTKNewToGloryEVictoryColors___previousCLKDeviceVersion;

          if (v38 == v39)
            goto LABEL_30;
        }
        else
        {

        }
      }
      v40 = objc_storeWeak(&_NTKNewToGloryEVictoryColors___cachedDevice, v34);
      _NTKNewToGloryEVictoryColors___previousCLKDeviceVersion = objc_msgSend(v34, "version");

      ___NTKNewToGloryEVictoryColors_block_invoke();
LABEL_30:
      os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGloryEVictoryColors___lock);
      v41 = (id)_NTKNewToGloryEVictoryColors_victoryGloryEColors;

      v42 = objc_msgSend(v41, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
      if ((v42 & 1) != 0)
        goto LABEL_46;
      goto LABEL_31;
    }
    -[NTKEditOption device](self, "device");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToElectricVictoryColors___lock);
    v17 = objc_loadWeakRetained(&_NTKNewToElectricVictoryColors___cachedDevice);
    if (v17)
    {
      v18 = v17;
      v19 = objc_loadWeakRetained(&_NTKNewToElectricVictoryColors___cachedDevice);
      if (v19 == v16)
      {
        v20 = objc_msgSend(v16, "version");
        v21 = _NTKNewToElectricVictoryColors___previousCLKDeviceVersion;

        if (v20 == v21)
          goto LABEL_18;
      }
      else
      {

      }
    }
    v22 = objc_storeWeak(&_NTKNewToElectricVictoryColors___cachedDevice, v16);
    _NTKNewToElectricVictoryColors___previousCLKDeviceVersion = objc_msgSend(v16, "version");

    ___NTKNewToElectricVictoryColors_block_invoke();
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToElectricVictoryColors___lock);
    v23 = (id)_NTKNewToElectricVictoryColors_victoryElectricColors;

    v24 = objc_msgSend(v23, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
    if ((v24 & 1) != 0)
      goto LABEL_46;
    goto LABEL_19;
  }
  if (HIWORD(v5) <= 4u)
    goto LABEL_19;
  if (v5 < 0x50200)
    goto LABEL_25;
  if (v5 >> 17 > 2)
    goto LABEL_37;
LABEL_31:
  -[NTKEditOption device](self, "device");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGraceVictoryColors___lock);
  v44 = objc_loadWeakRetained(&_NTKNewToGraceVictoryColors___cachedDevice);
  if (v44)
  {
    v45 = v44;
    v46 = objc_loadWeakRetained(&_NTKNewToGraceVictoryColors___cachedDevice);
    if (v46 == v43)
    {
      v47 = objc_msgSend(v43, "version");
      v48 = _NTKNewToGraceVictoryColors___previousCLKDeviceVersion;

      if (v47 == v48)
        goto LABEL_36;
    }
    else
    {

    }
  }
  v49 = objc_storeWeak(&_NTKNewToGraceVictoryColors___cachedDevice, v43);
  _NTKNewToGraceVictoryColors___previousCLKDeviceVersion = objc_msgSend(v43, "version");

  ___NTKNewToGraceVictoryColors_block_invoke();
LABEL_36:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGraceVictoryColors___lock);
  v50 = (id)_NTKNewToGraceVictoryColors_victoryGraceColors;

  v51 = objc_msgSend(v50, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if ((v51 & 1) != 0)
    goto LABEL_46;
LABEL_37:
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
  if (objc_msgSend(v4, "supportsCapability:", v52))
  {

  }
  else
  {
    -[NTKEditOption device](self, "device");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKNewToGraceEVictoryColors(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));

    if ((v55 & 1) != 0)
      goto LABEL_46;
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) == 0
    && (objc_msgSend(v4, "isExplorer") & 1) == 0
    && -[NTKValueEditOption _value](self, "_value") == 100)
  {
    goto LABEL_46;
  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AE03A48B-6794-4978-96CC-425A7F6443DA"));
  if (objc_msgSend(v4, "supportsCapability:", v56))
  {

    goto LABEL_48;
  }
  -[NTKEditOption device](self, "device");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKNewToHunterVictoryColors(v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));

  if ((v59 & 1) != 0)
  {
LABEL_46:
    v60 = 0;
    goto LABEL_47;
  }
LABEL_48:
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C814BC07-AE2D-4061-9C1E-D97BED9DAC22"));
  if (objc_msgSend(v4, "supportsCapability:", v62))
  {

    v60 = 1;
  }
  else
  {
    -[NTKEditOption device](self, "device");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKNewToHunterEVictoryColors(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));

    v60 = v65 ^ 1;
  }
LABEL_47:

  return v60;
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
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_670);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_671);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_671);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_671, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_672 = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__NTKVictoryColorEditOption__orderedValuesForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __53__NTKVictoryColorEditOption__orderedValuesForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_672;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_670);
  v11 = (id)_orderedValuesForDevice____colors_669;

  return v11;
}

void __53__NTKVictoryColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_orderedValuesRestrictedByDevice:", v14);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_orderedValuesForDevice____colors_669;
  _orderedValuesForDevice____colors_669 = v3;

  objc_msgSend((id)_orderedValuesForDevice____colors_669, "arrayByAddingObjectsFromArray:", &unk_1E6CAA1F8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_orderedValuesForDevice____colors_669;
  _orderedValuesForDevice____colors_669 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D0D02931-2190-4E71-B843-C73C4ADB3F27"));
  if (!objc_msgSend(v14, "supportsCapability:", v7))
    goto LABEL_4;
  v8 = NTKGizmoOrCompanionAreRussian(v14);

  if ((v8 & 1) == 0)
  {
    objc_msgSend((id)_orderedValuesForDevice____colors_669, "arrayByAddingObjectsFromArray:", &unk_1E6CAA210);
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_orderedValuesForDevice____colors_669;
    _orderedValuesForDevice____colors_669 = v9;
LABEL_4:

  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v14) & 1) != 0
    || objc_msgSend(v14, "isExplorer"))
  {
    objc_msgSend((id)_orderedValuesForDevice____colors_669, "arrayByAddingObject:", &unk_1E6CA0720);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_orderedValuesForDevice____colors_669;
    _orderedValuesForDevice____colors_669 = v10;

  }
  objc_msgSend((id)_orderedValuesForDevice____colors_669, "arrayByAddingObjectsFromArray:", &unk_1E6CAA228);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_orderedValuesForDevice____colors_669;
  _orderedValuesForDevice____colors_669 = v12;

}

+ (id)fall2020VictoryColors
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "spring2020VictoryColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByExcludingObjectsInArray:", &unk_1E6CAA258);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6CAA240, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)spring2020VictoryColors
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "graceVictoryColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByExcludingObjectsInArray:", &unk_1E6CAA288);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6CAA270, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)graceVictoryColors
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "gloryEVictoryColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByExcludingObjectsInArray:", &unk_1E6CAA2B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6CAA2A0, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)gloryEVictoryColors
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "gloryVictoryColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByExcludingObjectsInArray:", &unk_1E6CAA2E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6CAA2D0, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)gloryVictoryColors
{
  return &unk_1E6CAA300;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id result;

  switch(a3)
  {
    case 0uLL:
      result = CFSTR("white");
      break;
    case 1uLL:
      result = CFSTR("green-white");
      break;
    case 2uLL:
      result = CFSTR("green");
      break;
    case 3uLL:
      result = CFSTR("blue-orbit");
      break;
    case 4uLL:
      result = CFSTR("indigo");
      break;
    case 5uLL:
      result = CFSTR("violet-dust");
      break;
    case 6uLL:
      result = CFSTR("light-violet");
      break;
    case 7uLL:
      result = CFSTR("anthracite");
      break;
    case 8uLL:
      result = CFSTR("light-bone");
      break;
    case 9uLL:
      result = CFSTR("solar-red");
      break;
    case 0xAuLL:
      result = CFSTR("total-orange");
      break;
    case 0xBuLL:
      result = CFSTR("cargo-khaki");
      break;
    case 0xCuLL:
      result = CFSTR("barely-rose");
      break;
    case 0xDuLL:
      result = CFSTR("wolf-gray");
      break;
    case 0xEuLL:
      result = CFSTR("light-silver");
      break;
    case 0xFuLL:
      result = CFSTR("particle-beige");
      break;
    case 0x10uLL:
      result = CFSTR("aurora-green");
      break;
    case 0x11uLL:
      result = CFSTR("obsidian-indigo");
      break;
    case 0x12uLL:
      result = CFSTR("terra-blush");
      break;
    case 0x13uLL:
      result = CFSTR("smoky-mauve");
      break;
    case 0x14uLL:
      result = CFSTR("olive-flak");
      break;
    case 0x15uLL:
      result = CFSTR("celestial-teal");
      break;
    case 0x16uLL:
      result = CFSTR("teal-tint");
      break;
    case 0x17uLL:
      result = CFSTR("hyper-grape");
      break;
    case 0x18uLL:
      result = CFSTR("spruce-fog");
      break;
    case 0x19uLL:
      result = CFSTR("desert-sand");
      break;
    case 0x1AuLL:
      result = CFSTR("royal-pulse");
      break;
    case 0x1BuLL:
      result = CFSTR("pink-blast");
      break;
    case 0x1CuLL:
      result = CFSTR("midnight-turquoise");
      break;
    case 0x1DuLL:
      result = CFSTR("lime-blast");
      break;
    case 0x1EuLL:
      result = CFSTR("multicolor-1");
      break;
    case 0x1FuLL:
      result = CFSTR("spruce-aura");
      break;
    case 0x20uLL:
      result = CFSTR("blue-black");
      break;
    case 0x21uLL:
      result = CFSTR("obsidian-mist");
      break;
    case 0x22uLL:
      result = CFSTR("hasta");
      break;
    case 0x23uLL:
      result = CFSTR("chlorine-blue");
      break;
    case 0x24uLL:
      result = CFSTR("ironstone");
      break;
    default:
      if (a3 == 100)
        result = CFSTR("explorer");
      else
        result = 0;
      break;
  }
  return result;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_768 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_768, &__block_literal_global_769);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_767;
}

void __57__NTKVictoryColorEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[38];
  _QWORD v3[39];

  v3[38] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0D38;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("green");
  v3[1] = CFSTR("mint");
  v2[2] = &unk_1E6CA0E40;
  v2[3] = &unk_1E6CA0D08;
  v3[2] = CFSTR("white");
  v3[3] = CFSTR("blue orbit");
  v2[4] = &unk_1E6CA0CC0;
  v2[5] = &unk_1E6CA0CA8;
  v3[4] = CFSTR("indigo");
  v3[5] = CFSTR("violet dust");
  v2[6] = &unk_1E6CA0810;
  v2[7] = &unk_1E6CA0C60;
  v3[6] = CFSTR("light violet");
  v3[7] = CFSTR("anthracite");
  v2[8] = &unk_1E6CA0C78;
  v2[9] = &unk_1E6CA0720;
  v3[8] = CFSTR("light bone");
  v3[9] = CFSTR("explorer");
  v2[10] = &unk_1E6CA07F8;
  v2[11] = &unk_1E6CA09D8;
  v3[10] = CFSTR("solar red");
  v3[11] = CFSTR("total orange");
  v2[12] = &unk_1E6CA0DF8;
  v2[13] = &unk_1E6CA0E28;
  v3[12] = CFSTR("cargo khaki");
  v3[13] = CFSTR("barely rose");
  v2[14] = &unk_1E6CA0EB8;
  v2[15] = &unk_1E6CA0ED0;
  v3[14] = CFSTR("wolf gray");
  v3[15] = CFSTR("light silver");
  v2[16] = &unk_1E6CA0EE8;
  v2[17] = &unk_1E6CA0D20;
  v3[16] = CFSTR("particle beige");
  v3[17] = CFSTR("aurora green");
  v2[18] = &unk_1E6CA07B0;
  v2[19] = &unk_1E6CA0948;
  v3[18] = CFSTR("obsidian indigo");
  v3[19] = CFSTR("terra blush");
  v2[20] = &unk_1E6CA0780;
  v2[21] = &unk_1E6CA0798;
  v3[20] = CFSTR("smoky mauve");
  v3[21] = CFSTR("olive flak");
  v2[22] = &unk_1E6CA07C8;
  v2[23] = &unk_1E6CA0DC8;
  v3[22] = CFSTR("celestial teal");
  v3[23] = CFSTR("teal tint");
  v2[24] = &unk_1E6CA0F30;
  v2[25] = &unk_1E6CA1020;
  v3[24] = CFSTR("hyper grape");
  v3[25] = CFSTR("spruce fog");
  v2[26] = &unk_1E6CA0E10;
  v2[27] = &unk_1E6CA1008;
  v3[26] = CFSTR("desert sand");
  v3[27] = CFSTR("royal pulse");
  v2[28] = &unk_1E6CA0F18;
  v2[29] = &unk_1E6CA0D68;
  v3[28] = CFSTR("pink blast");
  v3[29] = CFSTR("midnight turquoise");
  v2[30] = &unk_1E6CA0E88;
  v2[31] = &unk_1E6CA0D50;
  v3[30] = CFSTR("lime blast");
  v3[31] = CFSTR("multicolor 1");
  v2[32] = &unk_1E6CA0EA0;
  v2[33] = &unk_1E6CA0768;
  v3[32] = CFSTR("spruce aura");
  v3[33] = CFSTR("blue black");
  v2[34] = &unk_1E6CA0F00;
  v2[35] = &unk_1E6CA0D80;
  v3[34] = CFSTR("obsidian mist");
  v3[35] = CFSTR("hasta");
  v2[36] = &unk_1E6CA0F48;
  v2[37] = &unk_1E6CA0DE0;
  v3[36] = CFSTR("chlorine-blue");
  v3[37] = CFSTR("ironstone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_767;
  _valueToFaceBundleStringDict_valueToFaceBundleString_767 = v0;

}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  return (id)objc_opt_new();
}

- (id)pigmentCollectionName
{
  return CFSTR("victory");
}

- (id)pigmentEditOption
{
  void *v3;
  void *v4;
  NTKPigmentEditOption *v5;
  NTKPigmentEditOption *v6;

  objc_msgSend((id)objc_opt_class(), "colorNameForColorValue:", -[NTKVictoryColorEditOption victoryColor](self, "victoryColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKVictoryColorEditOption pigmentCollectionName](self, "pigmentCollectionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKVictoryColorEditOption victoryColor](self, "victoryColor") == 30)
  {
    +[NTKPigmentEditOption pigmentNamed:](NTKPigmentEditOption, "pigmentNamed:", CFSTR("special.rainbow"));
    v5 = (NTKPigmentEditOption *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v3, v4);
  }
  v6 = v5;

  return v6;
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
      v4 = CFSTR("white");
      break;
    case 1uLL:
      objc_msgSend(a1, "colorNameForColorValue:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "colorNameForColorValue:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ntk_duotone((uint64_t)CFSTR("victory"), (uint64_t)v6, CFSTR("victory"), v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 2uLL:
      v4 = CFSTR("volt");
      break;
    case 3uLL:
      v4 = CFSTR("blueOrbit");
      break;
    case 4uLL:
      v4 = CFSTR("indigo");
      break;
    case 5uLL:
      v4 = CFSTR("violetDust");
      break;
    case 6uLL:
      v4 = CFSTR("lightViolet");
      break;
    case 7uLL:
      v4 = CFSTR("anthracite");
      break;
    case 8uLL:
      v4 = CFSTR("lightBone");
      break;
    case 9uLL:
      v4 = CFSTR("brightCrimson");
      break;
    case 0xAuLL:
      v4 = CFSTR("totalOrange");
      break;
    case 0xBuLL:
      v4 = CFSTR("cargoKhaki");
      break;
    case 0xCuLL:
      v4 = CFSTR("barelyRose");
      break;
    case 0xDuLL:
      v4 = CFSTR("wolfGray");
      break;
    case 0xEuLL:
      v4 = CFSTR("lightSilver");
      break;
    case 0xFuLL:
      v4 = CFSTR("particleBeige");
      break;
    case 0x10uLL:
      v4 = CFSTR("auroraGreen");
      break;
    case 0x11uLL:
      v4 = CFSTR("obsidianIndigo");
      break;
    case 0x12uLL:
      v4 = CFSTR("terraBlush");
      break;
    case 0x13uLL:
      v4 = CFSTR("smokyMauve");
      break;
    case 0x14uLL:
      v4 = CFSTR("oliveFlak");
      break;
    case 0x15uLL:
      v4 = CFSTR("celestialTeal");
      break;
    case 0x16uLL:
      v4 = CFSTR("tealTint");
      break;
    case 0x17uLL:
      v4 = CFSTR("hyperGrape");
      break;
    case 0x18uLL:
      v4 = CFSTR("spruceFog");
      break;
    case 0x19uLL:
      v4 = CFSTR("desertSand");
      break;
    case 0x1AuLL:
      v4 = CFSTR("royalPulse");
      break;
    case 0x1BuLL:
      v4 = CFSTR("pinkBlast");
      break;
    case 0x1CuLL:
      v4 = CFSTR("midnightTurquoise");
      break;
    case 0x1DuLL:
      v4 = CFSTR("limeBlast");
      break;
    case 0x1EuLL:
      v4 = CFSTR("rainbow");
      break;
    case 0x1FuLL:
      v4 = CFSTR("spruceAura");
      break;
    case 0x20uLL:
      v4 = CFSTR("blueBlack");
      break;
    case 0x21uLL:
      v4 = CFSTR("obsidianMist");
      break;
    case 0x22uLL:
      v4 = CFSTR("hasta");
      break;
    case 0x23uLL:
      v4 = CFSTR("chlorineBlue");
      break;
    case 0x24uLL:
      v4 = CFSTR("ironstone");
      break;
    default:
      if (a3 == 100)
      {
        objc_msgSend(a1, "colorNameForColorValue:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        ntk_duotone((uint64_t)CFSTR("seasons.spring2015"), (uint64_t)v5, CFSTR("explorer"), CFSTR("red"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }
      break;
  }
  return v4;
}

+ (unint64_t)colorCodeForPigmentEditOption:(id)a3 forDevice:(id)a4
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a1, "legacyOptionWithPigmentEditOption:forDevice:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "victoryColor");

  return v5;
}

@end
