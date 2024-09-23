@implementation NTKKaleidoscopeAssetOption

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4CC676F2-E761-4AA8-AE40-1A40F3868BDE"));
  v6 = objc_msgSend(v3, "supportsCapability:", v5);

  if (v6)
    objc_msgSend(v4, "addObjectsFromArray:", &unk_1E6CAA360);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A19F7B33-B4B5-4859-8FDD-DEDA6FD71895"));
  v8 = objc_msgSend(v3, "supportsCapability:", v7);

  if (v8)
    objc_msgSend(v4, "addObjectsFromArray:", &unk_1E6CAA378);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
  v10 = objc_msgSend(v3, "supportsCapability:", v9);

  if (v10)
    objc_msgSend(v4, "addObjectsFromArray:", &unk_1E6CAA390);
  if (objc_msgSend(v3, "nrDeviceVersion") >= 0x50000)
    objc_msgSend(v4, "addObjectsFromArray:", &unk_1E6CAA3A8);
  objc_msgSend(v4, "addObjectsFromArray:", &unk_1E6CAA3C0);

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("asset-%lu"), a4, a3 + 1);
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  __CFString *v5;
  void *v6;

  if (objc_msgSend(a4, "nrDeviceVersion") < 0x50000)
  {
    v5 = CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_ASSET_%lu");
  }
  else
  {
    objc_msgSend(CFSTR("EDIT_OPTION_LABEL_KALEIDOSCOPE_ASSET_%lu"), "stringByAppendingString:", CFSTR("_5_0"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_967 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_967, &__block_literal_global_968);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_966;
}

void __58__NTKKaleidoscopeAssetOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[33];
  _QWORD v3[34];

  v3[33] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA0E40;
  v2[1] = &unk_1E6CA07E0;
  v3[0] = CFSTR("asset 1");
  v3[1] = CFSTR("asset 2");
  v2[2] = &unk_1E6CA0D38;
  v2[3] = &unk_1E6CA0D08;
  v3[2] = CFSTR("asset 3");
  v3[3] = CFSTR("asset 4");
  v2[4] = &unk_1E6CA0CC0;
  v2[5] = &unk_1E6CA0CA8;
  v3[4] = CFSTR("asset 5");
  v3[5] = CFSTR("asset 6");
  v2[6] = &unk_1E6CA0810;
  v2[7] = &unk_1E6CA0C60;
  v3[6] = CFSTR("asset 7");
  v3[7] = CFSTR("asset 8");
  v2[8] = &unk_1E6CA0C78;
  v2[9] = &unk_1E6CA07F8;
  v3[8] = CFSTR("asset 9");
  v3[9] = CFSTR("asset 10");
  v2[10] = &unk_1E6CA09D8;
  v2[11] = &unk_1E6CA0DF8;
  v3[10] = CFSTR("asset 11");
  v3[11] = CFSTR("asset 12");
  v2[12] = &unk_1E6CA0E28;
  v2[13] = &unk_1E6CA0EB8;
  v3[12] = CFSTR("asset 13");
  v3[13] = CFSTR("asset 14");
  v2[14] = &unk_1E6CA0ED0;
  v2[15] = &unk_1E6CA0EE8;
  v3[14] = CFSTR("asset 15");
  v3[15] = CFSTR("asset 16");
  v2[16] = &unk_1E6CA0D20;
  v2[17] = &unk_1E6CA07B0;
  v3[16] = CFSTR("asset 17");
  v3[17] = CFSTR("asset 18");
  v2[18] = &unk_1E6CA0948;
  v2[19] = &unk_1E6CA0780;
  v3[18] = CFSTR("asset 19");
  v3[19] = CFSTR("asset 20");
  v2[20] = &unk_1E6CA0798;
  v2[21] = &unk_1E6CA07C8;
  v3[20] = CFSTR("asset 21");
  v3[21] = CFSTR("asset 22");
  v2[22] = &unk_1E6CA0DC8;
  v2[23] = &unk_1E6CA0F30;
  v3[22] = CFSTR("asset 23");
  v3[23] = CFSTR("asset 24");
  v2[24] = &unk_1E6CA1020;
  v2[25] = &unk_1E6CA0E10;
  v3[24] = CFSTR("asset 25");
  v3[25] = CFSTR("asset 26");
  v2[26] = &unk_1E6CA1008;
  v2[27] = &unk_1E6CA0F18;
  v3[26] = CFSTR("asset 27");
  v3[27] = CFSTR("asset 28");
  v2[28] = &unk_1E6CA0D68;
  v2[29] = &unk_1E6CA0E88;
  v3[28] = CFSTR("asset 29");
  v3[29] = CFSTR("asset 30");
  v2[30] = &unk_1E6CA0D50;
  v2[31] = &unk_1E6CA0EA0;
  v3[30] = CFSTR("asset 31");
  v3[31] = CFSTR("asset 32");
  v2[32] = &unk_1E6CA0768;
  v3[32] = CFSTR("asset 33");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 33);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_966;
  _valueToFaceBundleStringDict_valueToFaceBundleString_966 = v0;

}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;
  char v14;
  void *v15;
  id v16;
  id WeakRetained;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;

  v4 = a3;
  if (objc_msgSend(v4, "nrDeviceVersion") >> 16 > 4)
  {
LABEL_9:
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
    if (objc_msgSend(v4, "supportsCapability:", v15))
    {

      v14 = 1;
      goto LABEL_17;
    }
    -[NTKEditOption device](self, "device");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___lock);
    WeakRetained = objc_loadWeakRetained(&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___cachedDevice);
    if (WeakRetained)
    {
      v18 = WeakRetained;
      v19 = objc_loadWeakRetained(&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___cachedDevice);
      if (v19 == v16)
      {
        v20 = objc_msgSend(v16, "version");
        v21 = _NTKNew2020SpringSummerColorsKaleidoscopeAssets___previousCLKDeviceVersion;

        if (v20 == v21)
        {
LABEL_16:
          os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___lock);
          v23 = (id)_NTKNew2020SpringSummerColorsKaleidoscopeAssets_kaleidoscopeSpring2020Assets;

          v24 = objc_msgSend(v23, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
          v14 = v24 ^ 1;
          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    v22 = objc_storeWeak(&_NTKNew2020SpringSummerColorsKaleidoscopeAssets___cachedDevice, v16);
    _NTKNew2020SpringSummerColorsKaleidoscopeAssets___previousCLKDeviceVersion = objc_msgSend(v16, "version");

    ___NTKNew2020SpringSummerColorsKaleidoscopeAssets_block_invoke();
    goto LABEL_16;
  }
  -[NTKEditOption device](self, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_NTKNewToGloryKaleidoscopeAssets___lock);
  v6 = objc_loadWeakRetained(&_NTKNewToGloryKaleidoscopeAssets___cachedDevice);
  if (v6)
  {
    v7 = v6;
    v8 = objc_loadWeakRetained(&_NTKNewToGloryKaleidoscopeAssets___cachedDevice);
    if (v8 == v5)
    {
      v9 = objc_msgSend(v5, "version");
      v10 = _NTKNewToGloryKaleidoscopeAssets___previousCLKDeviceVersion;

      if (v9 == v10)
        goto LABEL_7;
    }
    else
    {

    }
  }
  v11 = objc_storeWeak(&_NTKNewToGloryKaleidoscopeAssets___cachedDevice, v5);
  _NTKNewToGloryKaleidoscopeAssets___previousCLKDeviceVersion = objc_msgSend(v5, "version");

  ___NTKNewToGloryKaleidoscopeAssets_block_invoke();
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_NTKNewToGloryKaleidoscopeAssets___lock);
  v12 = (id)_NTKNewToGloryKaleidoscopeAssets_kaleidoscopeGloryAssets;

  v13 = objc_msgSend(v12, "containsIndex:", -[NTKValueEditOption _value](self, "_value"));
  if ((v13 & 1) == 0)
    goto LABEL_9;
  v14 = 0;
LABEL_17:

  return v14;
}

@end
