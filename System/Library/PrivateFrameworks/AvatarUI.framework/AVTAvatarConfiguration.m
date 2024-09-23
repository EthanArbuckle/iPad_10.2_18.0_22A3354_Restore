@implementation AVTAvatarConfiguration

- (id)volatileIdentifierForScope:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presets](self, "presets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v11, "preset");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "category");
        objc_msgSend(v11, "preset");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%ld_%@_"), v13, v15);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }

  -[AVTAvatarConfiguration colorPresets](self, "colorPresets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = v17;
  v18 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v38);
        v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v22, "color");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "settingKind");
        AVTAvatarSettingKindIdentifier(v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "color");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@_%@"), v26, v28);

        objc_msgSend(v22, "colorPreset");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "variation");
        v31 = v30;

        if (v31 != 0.0)
        {
          objc_msgSend(v22, "colorPreset");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "variation");
          objc_msgSend(v4, "appendFormat:", CFSTR("_%.2f"), v33);

        }
        objc_msgSend(v4, "appendString:", CFSTR("_"));
      }
      v19 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v19);
  }

  objc_msgSend(v4, "appendFormat:", CFSTR("AK%lu"), AVTAvatarKitSnapshotVersionNumber());
  if (v37)
  {
    objc_msgSend(v37, "cacheableResourceAssociatedIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v34);

  }
  v35 = (void *)objc_msgSend(v4, "copy");

  return v35;
}

- (id)persistentIdentifierForScope:(id)a3
{
  void *v3;
  void *v4;

  -[AVTAvatarConfiguration volatileIdentifierForScope:](self, "volatileIdentifierForScope:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avt_MD5String");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)costForScope:(id)a3
{
  return objc_msgSend(a3, "cacheableResourceAssociatedCost");
}

- (BOOL)requiresEncryption
{
  return 1;
}

+ (id)configurationPresetWithPreset:(id)a3 settingKind:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v6;
  AVTConfigurationPreset *v7;
  AVTConfigurationPreset *v8;
  AVTCoreModelPreset *v9;
  AVTConfigurationPreset *v10;

  var1 = a4.var1;
  var0 = a4.var0;
  v6 = a3;
  v7 = [AVTConfigurationPreset alloc];
  v8 = v7;
  if (v6)
  {
    v9 = -[AVTCoreModelPreset initWithPreset:]([AVTCoreModelPreset alloc], "initWithPreset:", v6);
    v10 = -[AVTConfigurationPreset initWithPreset:settingKind:](v8, "initWithPreset:settingKind:", v9, var0, var1);

  }
  else
  {
    v10 = -[AVTConfigurationPreset initWithDefaultPresetForSettingKind:](v7, "initWithDefaultPresetForSettingKind:", var0, var1);
  }

  return v10;
}

+ (id)configurationColorPresetWithColorPreset:(id)a3 settingKind:(id)a4 coreModel:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v8;
  void *v9;
  void *v10;
  AVTCoreModelColor *v11;
  AVTCoreModelColor *v12;
  AVTCoreModelColorVariation *v13;
  AVTConfigurationPreset *v14;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  if (v8)
  {
    objc_msgSend(a5, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorForSettingKind:identifier:", var0, var1, v10);
    v11 = (AVTCoreModelColor *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = [AVTCoreModelColor alloc];
      v11 = -[AVTCoreModelColor initWithColorPreset:settingKind:order:derivedColorsByCategories:](v12, "initWithColorPreset:settingKind:order:derivedColorsByCategories:", v8, var0, var1, 0x7FFFFFFFFFFFFFFFLL, MEMORY[0x1E0C9AA70]);
    }
    v13 = -[AVTCoreModelColorVariation initWithColor:colorPreset:]([AVTCoreModelColorVariation alloc], "initWithColor:colorPreset:", v11, v8);
    v14 = -[AVTConfigurationPreset initWithPreset:settingKind:]([AVTConfigurationPreset alloc], "initWithPreset:settingKind:", v13, var0, var1);

  }
  else
  {
    v14 = -[AVTConfigurationPreset initWithDefaultPresetForSettingKind:]([AVTConfigurationPreset alloc], "initWithDefaultPresetForSettingKind:", var0, var1);
  }

  return v14;
}

+ (id)configurationFromAvatar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorCoreModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "configurationFromAvatar:coreModel:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)configurationFromAvatar:(id)a3 coreModel:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id obj;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v7, "groups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v84;
    v66 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v84 != v54)
          objc_enumerationMutation(obj);
        v56 = v9;
        v10 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v9);
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        objc_msgSend(v10, "categories");
        v57 = (id)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
        if (v59)
        {
          v58 = *(_QWORD *)v80;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v80 != v58)
                objc_enumerationMutation(v57);
              v60 = v11;
              v12 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v11);
              v13 = objc_msgSend(v12, "presetCategory");
              if ((AVTPrereleaseCategoriesEnabled() & 1) != 0 || (AVTPresetCategoryIsPrerelease() & 1) == 0)
              {
                objc_msgSend(v6, "presetForCategory:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = AVTPresetSettingKind();
                objc_msgSend(a1, "configurationPresetWithPreset:settingKind:", v14, v15, v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addConfigurationPreset:", v17);

                for (i = 0; i != 3; ++i)
                {
                  objc_msgSend(v6, "colorPresetForCategory:colorIndex:", v13, i);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = AVTColorSettingKind(v13, i);
                  objc_msgSend(a1, "configurationColorPresetWithColorPreset:settingKind:coreModel:", v19, v20, v21, v7);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "addConfigurationColorPreset:", v22);

                  v6 = v66;
                }
                v77 = 0u;
                v78 = 0u;
                v75 = 0u;
                v76 = 0u;
                objc_msgSend(v12, "pickers");
                v63 = (id)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
                if (v23)
                {
                  v24 = v23;
                  v25 = *(_QWORD *)v76;
                  v61 = *(_QWORD *)v76;
                  do
                  {
                    v26 = 0;
                    v62 = v24;
                    do
                    {
                      if (*(_QWORD *)v76 != v25)
                        objc_enumerationMutation(v63);
                      v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v26);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v64 = v26;
                        v28 = v7;
                        v29 = v27;
                        v71 = 0u;
                        v72 = 0u;
                        v73 = 0u;
                        v74 = 0u;
                        v65 = v29;
                        objc_msgSend(v29, "subpickers");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
                        if (v31)
                        {
                          v32 = v31;
                          v33 = *(_QWORD *)v72;
                          do
                          {
                            for (j = 0; j != v32; ++j)
                            {
                              if (*(_QWORD *)v72 != v33)
                                objc_enumerationMutation(v30);
                              v35 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
                              v36 = objc_msgSend(v35, "colorCategory");
                              v37 = objc_msgSend(v35, "destination") - 1;
                              objc_msgSend(v6, "colorPresetForCategory:colorIndex:", v36, v37);
                              v38 = (void *)objc_claimAutoreleasedReturnValue();
                              v39 = AVTColorSettingKind(v36, v37);
                              objc_msgSend(a1, "configurationColorPresetWithColorPreset:settingKind:coreModel:", v38, v39, v40, v28);
                              v41 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v8, "addConfigurationColorPreset:", v41);

                              v6 = v66;
                            }
                            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
                          }
                          while (v32);
                        }

                        v69 = 0u;
                        v70 = 0u;
                        v67 = 0u;
                        v68 = 0u;
                        objc_msgSend(v65, "nestedPresetPickers");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "allValues");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();

                        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
                        if (v44)
                        {
                          v45 = v44;
                          v46 = *(_QWORD *)v68;
                          do
                          {
                            for (k = 0; k != v45; ++k)
                            {
                              if (*(_QWORD *)v68 != v46)
                                objc_enumerationMutation(v43);
                              objc_msgSend(v6, "presetForCategory:", objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "presetCategory"));
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              v49 = AVTPresetSettingKind();
                              objc_msgSend(a1, "configurationPresetWithPreset:settingKind:", v48, v49, v50);
                              v51 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v8, "addConfigurationPreset:", v51);

                            }
                            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
                          }
                          while (v45);
                        }

                        v7 = v28;
                        v25 = v61;
                        v24 = v62;
                        v26 = v64;
                      }
                      ++v26;
                    }
                    while (v26 != v24);
                    v24 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
                  }
                  while (v24);
                }

              }
              v11 = v60 + 1;
            }
            while (v60 + 1 != v59);
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
          }
          while (v59);
        }

        v9 = v56 + 1;
      }
      while (v56 + 1 != v55);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v55);
  }

  return v8;
}

+ (id)configurationForRecord:(id)a3 coreModel:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D00858];
  v7 = a4;
  objc_msgSend(v6, "memojiForRecord:usageIntent:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configurationFromAvatar:coreModel:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)keyForSettingKind:(id)a3
{
  return AVTAvatarSettingKindIdentifier(a3.var0, a3.var1);
}

- (AVTAvatarConfiguration)init
{
  return -[AVTAvatarConfiguration initWithPresets:colorPresets:](self, "initWithPresets:colorPresets:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70]);
}

- (AVTAvatarConfiguration)initWithPresets:(id)a3 colorPresets:(id)a4
{
  id v6;
  id v7;
  AVTAvatarConfiguration *v8;
  uint64_t v9;
  NSMutableDictionary *presetsStorage;
  uint64_t v11;
  NSMutableDictionary *colorPresetsStorage;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarConfiguration;
  v8 = -[AVTAvatarConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    presetsStorage = v8->_presetsStorage;
    v8->_presetsStorage = (NSMutableDictionary *)v9;

    v11 = objc_msgSend(v7, "mutableCopy");
    colorPresetsStorage = v8->_colorPresetsStorage;
    v8->_colorPresetsStorage = (NSMutableDictionary *)v11;

  }
  return v8;
}

- (void)addPreset:(id)a3
{
  id v4;
  AVTConfigurationPreset *v5;
  uint64_t v6;
  uint64_t v7;
  AVTConfigurationPreset *v8;
  id v9;

  v4 = a3;
  v5 = [AVTConfigurationPreset alloc];
  objc_msgSend(v4, "preset");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "category");
  v6 = AVTPresetSettingKind();
  v8 = -[AVTConfigurationPreset initWithPreset:settingKind:](v5, "initWithPreset:settingKind:", v4, v6, v7);

  -[AVTAvatarConfiguration addConfigurationPreset:](self, "addConfigurationPreset:", v8);
}

- (void)addConfigurationPreset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "settingKind");
  +[AVTAvatarConfiguration keyForSettingKind:](AVTAvatarConfiguration, "keyForSettingKind:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, v7);

}

- (void)addColorPreset:(id)a3
{
  id v4;
  AVTConfigurationPreset *v5;
  uint64_t v6;
  uint64_t v7;
  AVTConfigurationPreset *v8;
  id v9;

  v4 = a3;
  v5 = [AVTConfigurationPreset alloc];
  objc_msgSend(v4, "color");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "settingKind");
  v8 = -[AVTConfigurationPreset initWithPreset:settingKind:](v5, "initWithPreset:settingKind:", v4, v6, v7);

  -[AVTAvatarConfiguration addConfigurationColorPreset:](self, "addConfigurationColorPreset:", v8);
}

- (void)addConfigurationColorPreset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "settingKind");
  +[AVTAvatarConfiguration keyForSettingKind:](AVTAvatarConfiguration, "keyForSettingKind:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v4, v7);

}

- (void)removePresetsForCategory:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = AVTPresetSettingKind();
  v6 = v5;
  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration removePresetsForSettingKind:storage:](self, "removePresetsForSettingKind:storage:", v4, v6, v7);

}

- (void)removeColorPresetsForSettingKind:(id)a3
{
  int64_t var1;
  int64_t var0;
  id v6;

  var1 = a3.var1;
  var0 = a3.var0;
  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration removePresetsForSettingKind:storage:](self, "removePresetsForSettingKind:storage:", var0, var1, v6);

}

- (void)removePresetsForSettingKind:(id)a3 storage:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v6;
  void *v7;
  AVTConfigurationPreset *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  _BYTE v19[128];
  uint64_t v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__AVTAvatarConfiguration_removePresetsForSettingKind_storage___block_invoke;
  v18[3] = &__block_descriptor_48_e49_B32__0__NSString_8__AVTConfigurationPreset_16_B24l;
  v18[4] = var0;
  v18[5] = var1;
  objc_msgSend(v6, "keysOfEntriesPassingTest:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTConfigurationPreset initWithDefaultPresetForSettingKind:]([AVTConfigurationPreset alloc], "initWithDefaultPresetForSettingKind:", var0, var1);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "setObject:forKey:", v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }

}

BOOL __62__AVTAvatarConfiguration_removePresetsForSettingKind_storage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "settingKind");
  return AVTAvatarSettingKindEqual(v4, v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)presets
{
  void *v3;
  void *v4;

  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presetsForStorage:](self, "presetsForStorage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)colorPresets
{
  void *v3;
  void *v4;

  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presetsForStorage:](self, "presetsForStorage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presetsForStorage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isDefaultPreset") & 1) == 0)
        {
          objc_msgSend(v10, "preset");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)presetForCategory:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = AVTPresetSettingKind();
  v6 = v5;
  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presetForSettingKind:storage:](self, "presetForSettingKind:storage:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)colorPresetForSettingKind:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  void *v7;
  void *v8;

  var1 = a3.var1;
  var0 = a3.var0;
  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presetForSettingKind:storage:](self, "presetForSettingKind:storage:", var0, var1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)presetForSettingKind:(id)a3 storage:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v6;
  void *v7;
  void *v8;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "keyForSettingKind:", var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)colorConfigurationPresets
{
  void *v2;
  void *v3;

  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presetConfigurationPresets
{
  void *v2;
  void *v3;

  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)configurationPresets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presetConfigurationPresets](self, "presetConfigurationPresets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[AVTAvatarConfiguration colorConfigurationPresets](self, "colorConfigurationPresets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)configurationPresetForSettingKind:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  void *v7;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a3.var0)
    -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  else
    -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration presetForSettingKind:storage:](self, "presetForSettingKind:storage:", var0, var1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)applyToAvatar:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v6 = a3;
  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke;
  v14[3] = &unk_1EA51EB08;
  v9 = v6;
  v15 = v9;
  v16 = a4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke_2;
  v12[3] = &unk_1EA51EB30;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "isDefaultPreset") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v11, "preset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v11, "settingKind");
  objc_msgSend(v6, "presetForCategory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v4)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v11, "settingKind");
    objc_msgSend(v9, "setPreset:forCategory:animated:", v4, v10, *(unsigned __int8 *)(a1 + 40));
  }

}

void __49__AVTAvatarConfiguration_applyToAvatar_animated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  if ((objc_msgSend(v19, "isDefaultPreset") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v19, "preset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorPreset");
    v4 = objc_claimAutoreleasedReturnValue();

  }
  v6 = AVTAvatarSettingColorIndexForColorDestination(objc_msgSend(v19, "settingKind"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v19, "settingKind");
  objc_msgSend(v7, "colorPresetForCategory:colorIndex:", v8, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9 | v4)
  {
    objc_msgSend((id)v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) == 0)
    {

LABEL_9:
      v17 = *(void **)(a1 + 32);
      objc_msgSend(v19, "settingKind");
      objc_msgSend(v17, "setColorPreset:forCategory:colorIndex:", v4, v18, v6);
      goto LABEL_10;
    }
    objc_msgSend(v10, "variation");
    v14 = v13;
    objc_msgSend((id)v4, "variation");
    v16 = v15;

    if (v14 != v16)
      goto LABEL_9;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithPresets:colorPresets:", v5, v6);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarConfiguration;
  -[AVTAvatarConfiguration description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" presets: %@"), v5);

  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" colorPresets: %@"), v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTAvatarConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = (AVTAvatarConfiguration *)a3;
  if (v5 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[AVTAvatarConfiguration presetsStorage](v5, "presetsStorage");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_7:
          -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10
            || (-[AVTAvatarConfiguration colorPresetsStorage](v5, "colorPresetsStorage"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTAvatarConfiguration colorPresetsStorage](v5, "colorPresetsStorage");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if (v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            v13 = 1;
          }

          goto LABEL_16;
        }
      }
      -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarConfiguration presetsStorage](v5, "presetsStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v6)
      {

        if (v9)
          goto LABEL_7;
      }
      else
      {

        if ((v9 & 1) != 0)
          goto LABEL_7;
      }
    }
    v13 = 0;
  }
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  unint64_t v8;

  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AVTAvatarConfiguration presetsStorage](self, "presetsStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v6 + 1) = v4;
  *(_QWORD *)&v6 = objc_msgSend(v5, "hash");
  -[AVTAvatarConfiguration colorPresetsStorage](self, "colorPresetsStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ (v6 >> 32);

  return v8;
}

- (NSMutableDictionary)presetsStorage
{
  return self->_presetsStorage;
}

- (NSMutableDictionary)colorPresetsStorage
{
  return self->_colorPresetsStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPresetsStorage, 0);
  objc_storeStrong((id *)&self->_presetsStorage, 0);
}

@end
