@implementation AVTAvatarUpdaterFactory

+ (id)updaterForPreset:(id)a3 pairedPreset:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__AVTAvatarUpdaterFactory_updaterForPreset_pairedPreset___block_invoke;
  v11[3] = &unk_1EA51F340;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)objc_msgSend(v11, "copy");

  return v9;
}

void __57__AVTAvatarUpdaterFactory_updaterForPreset_pairedPreset___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "addPreset:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "addPreset:");

}

+ (id)updaterForColor:(id)a3 colorsState:(id)a4 pairedColors:(id)a5 additionalColor:(id)a6
{
  return (id)objc_msgSend(a1, "updaterForColor:colorsState:pairedColors:additionalColor:saveToColorsState:", a3, a4, a5, a6, 1);
}

+ (id)updaterForColor:(id)a3 colorsState:(id)a4 pairedColors:(id)a5 additionalColor:(id)a6 saveToColorsState:(BOOL)a7
{
  return (id)objc_msgSend(a1, "updaterForColor:variationOverride:colorsState:pairedColors:additionalColor:saveToColorsState:", a3, 0, a4, a5, a6, a7);
}

+ (id)updaterForColor:(id)a3 variationOverride:(id)a4 colorsState:(id)a5 pairedColors:(id)a6 additionalColor:(id)a7 saveToColorsState:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke;
  v25[3] = &unk_1EA51F390;
  v26 = v14;
  v27 = v13;
  v31 = a8;
  v28 = v15;
  v29 = v16;
  v30 = v17;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v13;
  v22 = v14;
  v23 = (void *)objc_msgSend(v25, "copy");

  return v23;
}

void __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AVTCoreModelColorVariation *v6;
  AVTCoreModelColorVariation *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  AVTCoreModelColorVariation *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  AVTCoreModelColorVariation *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AVTCoreModelColorVariation *v26;
  void *v27;
  id v28;
  AVTCoreModelColorVariation *v29;
  id obj;
  _QWORD v31[4];
  id v32;
  AVTCoreModelColorVariation *v33;
  id v34;
  id v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "baseColorPreset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "floatValue");
    objc_msgSend(v4, "colorPresetWithVariation:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[AVTCoreModelColorVariation initWithColor:colorPreset:]([AVTCoreModelColorVariation alloc], "initWithColor:colorPreset:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "variationStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorVariationFromColor:", *(_QWORD *)(a1 + 40));
    v6 = (AVTCoreModelColorVariation *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "addColorPreset:", v7);
  if (*(_BYTE *)(a1 + 72))
  {
    v8 = *(void **)(a1 + 48);
    -[AVTCoreModelColorVariation colorPreset](v7, "colorPreset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectedColorPreset:forCoreModelColor:", v9, *(_QWORD *)(a1 + 40));

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 56);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (v14)
        {
          v15 = v3;
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "baseColorPreset");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v7;
          -[AVTCoreModelColorVariation colorPreset](v7, "colorPreset");
          v18 = a1;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "variation");
          objc_msgSend(v16, "colorPresetWithVariation:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          a1 = v18;
          if (*(_BYTE *)(v18 + 72))
            objc_msgSend(*(id *)(v18 + 48), "setSelectedColorPreset:forCoreModelColor:", v20, v14);
          v21 = -[AVTCoreModelColorVariation initWithColor:colorPreset:]([AVTCoreModelColorVariation alloc], "initWithColor:colorPreset:", v14, v20);
          v3 = v15;
          objc_msgSend(v15, "addColorPreset:", v21);

          v7 = v17;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v11);
  }

  v22 = *(void **)(a1 + 64);
  if (v22)
  {
    objc_msgSend(v22, "baseColorPreset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCoreModelColorVariation colorPreset](v7, "colorPreset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "variation");
    objc_msgSend(v23, "colorPresetWithVariation:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = -[AVTCoreModelColorVariation initWithColor:colorPreset:]([AVTCoreModelColorVariation alloc], "initWithColor:colorPreset:", *(_QWORD *)(a1 + 64), v25);
    objc_msgSend(v3, "addColorPreset:", v26);

  }
  objc_msgSend(*(id *)(a1 + 40), "derivedColorsByCategories");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke_2;
  v31[3] = &unk_1EA51F368;
  v32 = *(id *)(a1 + 40);
  v33 = v7;
  v36 = *(_BYTE *)(a1 + 72);
  v34 = *(id *)(a1 + 48);
  v35 = v3;
  v28 = v3;
  v29 = v7;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v31);

}

void __120__AVTAvatarUpdaterFactory_updaterForColor_variationOverride_colorsState_pairedColors_additionalColor_saveToColorsState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  AVTCoreModelColorVariation *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "settingKind");
  objc_msgSend(v9, "baseColorPreset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "colorPreset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "variation");
  objc_msgSend(v5, "colorPresetWithVariation:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 48), "setSelectedColorPreset:forCoreModelColor:", v7, v9);
  v8 = -[AVTCoreModelColorVariation initWithColor:colorPreset:]([AVTCoreModelColorVariation alloc], "initWithColor:colorPreset:", v9, v7);
  objc_msgSend(*(id *)(a1 + 56), "addColorPreset:", v8);

}

+ (id)updaterForPairingCategory:(id)a3 colorsState:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__AVTAvatarUpdaterFactory_updaterForPairingCategory_colorsState___block_invoke;
  v12[3] = &unk_1EA51F3B8;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v8 = v7;
  v9 = v6;
  v10 = (void *)objc_msgSend(v12, "copy");

  return v10;
}

void __65__AVTAvatarUpdaterFactory_updaterForPairingCategory_colorsState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pairing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v22 = v4;
    v5 = objc_msgSend(v4, "pairedCategory");
    objc_msgSend(v3, "presetForCategory:", objc_msgSend(*(id *)(a1 + 32), "presetCategory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v6, "copyForPairedCategory:", v5);
    v21 = v6;
    objc_msgSend(*(id *)(a1 + 48), "updaterForPreset:pairedPreset:", v6);
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v3);

    for (i = 0; i != 3; ++i)
    {
      v9 = AVTColorSettingKind(objc_msgSend(*(id *)(a1 + 32), "presetCategory"), i);
      objc_msgSend(v3, "colorPresetForSettingKind:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "color");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copyForPairedCategory:", v5);

        v15 = *(void **)(a1 + 48);
        objc_msgSend(v12, "color");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 40);
        v23[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updaterForColor:colorsState:pairedColors:additionalColor:", v16, v17, v18, 0);
        v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v19)[2](v19, v3);

      }
    }

    v4 = v22;
  }

}

+ (id)updaterForClearingColorsForCategory:(int64_t)a3 destination:(int64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__AVTAvatarUpdaterFactory_updaterForClearingColorsForCategory_destination___block_invoke;
  v5[3] = &__block_descriptor_48_e32_v16__0__AVTAvatarConfiguration_8l;
  v5[4] = a3;
  v5[5] = a4;
  return (id)objc_msgSend(v5, "copy");
}

uint64_t __75__AVTAvatarUpdaterFactory_updaterForClearingColorsForCategory_destination___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeColorPresetsForSettingKind:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)updaterForAggregatingUpdaters:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__AVTAvatarUpdaterFactory_updaterForAggregatingUpdaters___block_invoke;
  v7[3] = &unk_1EA51F400;
  v8 = v3;
  v4 = v3;
  v5 = (void *)objc_msgSend(v7, "copy");

  return v5;
}

void __57__AVTAvatarUpdaterFactory_updaterForAggregatingUpdaters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

@end
