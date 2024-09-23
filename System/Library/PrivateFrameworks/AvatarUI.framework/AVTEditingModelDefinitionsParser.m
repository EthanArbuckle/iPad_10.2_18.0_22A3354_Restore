@implementation AVTEditingModelDefinitionsParser

+ (id)errorWithDescription:(id)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CB2D50], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CB3388], v5);
  objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 415, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)dataFromAvatarKit
{
  if (AVTPrereleaseCategoriesEnabled())
    AVTPrereleaseEditorMetadata();
  else
    AVTEditorMetadata();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataFromBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("editor"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVT_RESOURCES_BASE_PATH"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("editor.plist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)platformDictionaryKeyForPlatform:(unint64_t)a3
{
  return (id)kAVTEditingModelDefinitionsPlatformiOSKey;
}

+ (id)sortedModelRows:(id)a3 forPlatform:(unint64_t)a4
{
  return a3;
}

+ (unint64_t)defaultSortingOptionForPlatform:(unint64_t)a3
{
  return 0;
}

+ (id)localizedString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    AVTLocalizedEditorString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)initForPlatform:(unint64_t)a3 withLogger:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  AVTEditingModelDefinitionsParser *v10;

  v6 = a4;
  v7 = AVTUIUseLocalEditorModel_once();
  v8 = (void *)objc_opt_class();
  if (v7)
    objc_msgSend(v8, "dataFromBundle");
  else
    objc_msgSend(v8, "dataFromAvatarKit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTEditingModelDefinitionsParser initWithPlistData:forPlatform:logger:](self, "initWithPlistData:forPlatform:logger:", v9, a3, v6);

  return v10;
}

- (AVTEditingModelDefinitionsParser)initWithPlistData:(id)a3 forPlatform:(unint64_t)a4 logger:(id)a5
{
  id v9;
  id v10;
  AVTEditingModelDefinitionsParser *v11;
  AVTEditingModelDefinitionsParser *v12;
  uint64_t v13;
  NSString *platformDictionaryKey;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AVTEditingModelDefinitionsParser;
  v11 = -[AVTEditingModelDefinitionsParser init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_plistData, a3);
    v12->_platform = a4;
    objc_msgSend((id)objc_opt_class(), "platformDictionaryKeyForPlatform:", a4);
    v13 = objc_claimAutoreleasedReturnValue();
    platformDictionaryKey = v12->_platformDictionaryKey;
    v12->_platformDictionaryKey = (NSString *)v13;

    objc_storeStrong((id *)&v12->_logger, a5);
  }

  return v12;
}

- (void)parseWithCompletionHandler:(id)a3
{
  void (**v4)(id, id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void (**)(id, id, void *))a3;
  -[AVTEditingModelDefinitionsParser plistData](self, "plistData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MissingPlistData"), CFSTR("Unable to get data for the plist from AvatarKit"));
  -[AVTEditingModelDefinitionsParser decodePropertyListObjects:](self, "decodePropertyListObjects:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsGroupsKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorDefaultsKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorPickersKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setColorPickersDefinitions:](self, "setColorPickersDefinitions:", v10);

    objc_msgSend(v7, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPresetPickersKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setPresetPickersDefinitions:](self, "setPresetPickersDefinitions:", v11);

    objc_msgSend(v7, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorPickersKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setMulticolorPickersDefinitions:](self, "setMulticolorPickersDefinitions:", v12);

    -[AVTEditingModelDefinitionsParser parseCoreModelFromGroupsDefinitions:colorDefaultsDefinitions:](self, "parseCoreModelFromGroupsDefinitions:colorDefaultsDefinitions:", v8, v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  -[AVTEditingModelDefinitionsParser error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v14, v13);

}

- (id)decodePropertyListObjects:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = v12;
    -[AVTEditingModelDefinitionsParser logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logParsingMetadataDefinitionsError:", v9);

    objc_msgSend((id)objc_opt_class(), "errorWithDescription:underlyingError:", CFSTR("Error deserializing plist"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTEditingModelDefinitionsParser setError:](self, "setError:", v10);
  }

  return v5;
}

- (void)initalizeColorCacheIfNeeded
{
  void *v3;
  id v4;

  -[AVTEditingModelDefinitionsParser colorCache](self, "colorCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[AVTEditingModelColors buildAllColors](AVTEditingModelColors, "buildAllColors");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setColorCache:](self, "setColorCache:", v4);

  }
}

- (id)parseCoreModelFromGroupsDefinitions:(id)a3 colorDefaultsDefinitions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  AVTAvatarEditorColorDefaultsProvider *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AVTCoreModel *v23;
  void *v24;
  AVTCoreModel *v25;
  void *v26;
  AVTAvatarEditorColorDefaultsProvider *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[AVTEditingModelDefinitionsParser initalizeColorCacheIfNeeded](self, "initalizeColorCacheIfNeeded");
    v29 = v7;
    if (v7
      && (objc_msgSend(v7, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorDefaultsMappingKey),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v9 = (void *)v8,
          objc_msgSend(v7, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorDefaultsDefinitionsKey),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      v11 = [AVTAvatarEditorColorDefaultsProvider alloc];
      -[AVTEditingModelDefinitionsParser colorCache](self, "colorCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[AVTAvatarEditorColorDefaultsProvider initWithColorDefaultsDictionary:editingColors:](v11, "initWithColorDefaultsDictionary:editingColors:", v7, v12);

    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v6;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          -[AVTEditingModelDefinitionsParser coreModelGroupFromGroupDictionary:](self, "coreModelGroupFromGroupDictionary:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            -[AVTEditingModelDefinitionsParser logger](self, "logger");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTEditingModelDefinitionsParser error](self, "error");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "description");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logParsingMetadataDefinitionsError:", v22);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

    v23 = [AVTCoreModel alloc];
    -[AVTEditingModelDefinitionsParser colorCache](self, "colorCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[AVTCoreModel initWithGroups:colors:colorDefaultsProvider:forPlatform:](v23, "initWithGroups:colors:colorDefaultsProvider:forPlatform:", v13, v24, v28, -[AVTEditingModelDefinitionsParser platform](self, "platform"));

    v7 = v29;
    v6 = v30;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "errorWithDescription:underlyingError:", CFSTR("Definitions must contain at least one group"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setError:](self, "setError:", v26);

    v25 = 0;
  }

  return v25;
}

- (id)coreModelGroupFromGroupDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  AVTEditingPreviewModeOptions *v31;
  AVTEditingPreviewMode *v32;
  void *v33;
  AVTCoreModelGroup *v34;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[AVTEditingModelDefinitionsParser applyPlatformOverrideForDictionary:](self, "applyPlatformOverrideForDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsGroupNameKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsCategoriesKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (AVTPrereleaseCategoriesEnabled())
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPrereleaseCategoriesKey);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && objc_msgSend(v9, "count"))
      {
        v11 = v10;

        v8 = v11;
      }

    }
    if (v8 && objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v13);
            -[AVTEditingModelDefinitionsParser coreModelCategoryFromCategoryDictionary:](self, "coreModelCategoryFromCategoryDictionary:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
            v18 = objc_claimAutoreleasedReturnValue();
            if (!v18)
            {
              v34 = 0;
              goto LABEL_27;
            }
            v19 = (void *)v18;
            objc_msgSend(v12, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v15)
            continue;
          break;
        }
      }

      -[AVTEditingModelDefinitionsParser symbolNamesFromGroupDictionary:](self, "symbolNamesFromGroupDictionary:", v4);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPreviewModeKey);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPreviewModeTypeKey);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[AVTEditingPreviewMode previewModeTypeForString:](AVTEditingPreviewMode, "previewModeTypeForString:", v22);

        objc_msgSend(v21, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPreviewModeOptionsKey);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v24;
        objc_msgSend(v24, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPreviewModeOptionsCameraKey);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = (void *)*MEMORY[0x1E0D005C8];
        if (v25)
          v27 = (void *)v25;
        v28 = v27;

        objc_msgSend(v24, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPreviewModeOptionsBodyPosePackKey);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v21;
        v31 = -[AVTEditingPreviewModeOptions initWithFramingMode:bodyPosePack:]([AVTEditingPreviewModeOptions alloc], "initWithFramingMode:bodyPosePack:", v28, v29);

        v32 = -[AVTEditingPreviewMode initWithType:options:]([AVTEditingPreviewMode alloc], "initWithType:options:", v23, v31);
        v21 = v30;

      }
      else
      {
        +[AVTEditingPreviewMode defaultPreviewMode](AVTEditingPreviewMode, "defaultPreviewMode");
        v32 = (AVTEditingPreviewMode *)objc_claimAutoreleasedReturnValue();
      }
      v34 = -[AVTCoreModelGroup initWithName:symbolNames:previewMode:categories:]([AVTCoreModelGroup alloc], "initWithName:symbolNames:previewMode:categories:", v7, v13, v32, v12);

LABEL_27:
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "errorWithDescription:underlyingError:", CFSTR("Group definitions must contain at least one category"), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTEditingModelDefinitionsParser setError:](self, "setError:", v35);

      v34 = 0;
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "errorWithDescription:underlyingError:", CFSTR("Group definitions must contain a non-empty name"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setError:](self, "setError:", v33);

    v34 = 0;
  }

  return v34;
}

- (id)symbolNamesFromGroupDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsGroupSymbolKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithObject:forKey:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsGroupSymbolDarkKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)coreModelCategoryFromCategoryDictionary:(id)a3
{
  return -[AVTEditingModelDefinitionsParser coreModelCategoryFromCategoryDictionary:parsedPickerKeys:](self, "coreModelCategoryFromCategoryDictionary:parsedPickerKeys:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)coreModelCategoryFromCategoryDictionary:(id)a3 parsedPickerKeys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  AVTCoreModelCategory *v23;
  AVTCoreModelCategory *v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsCategoryNameKey);
  v8 = objc_claimAutoreleasedReturnValue();
  +[AVTEditingModelMappings presetCategoryFromCategoryName:](AVTEditingModelMappings, "presetCategoryFromCategoryName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v9, "integerValue");
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__9;
  v52 = __Block_byref_object_dispose__9;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__9;
  v46 = __Block_byref_object_dispose__9;
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTEditingModelDefinitionsParser applyPlatformOverrideForDictionary:](self, "applyPlatformOverrideForDictionary:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsCategoryPickersKey);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v8;
  v29 = v7;
  if (-[AVTEditingModelDefinitionsParser validateForCategoryWithEnumValue:pickers:](self, "validateForCategoryWithEnumValue:pickers:", v9, v15))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsOptionsKey);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser coreModelRowOptionsFromOptionsDictionary:](self, "coreModelRowOptionsFromOptionsDictionary:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __93__AVTEditingModelDefinitionsParser_coreModelCategoryFromCategoryDictionary_parsedPickerKeys___block_invoke;
    v31[3] = &unk_1EA51E560;
    v31[4] = self;
    v32 = v7;
    v40 = v30;
    v26 = v17;
    v33 = v26;
    v37 = v41;
    v34 = v9;
    v38 = &v48;
    v39 = &v42;
    v18 = v10;
    v35 = v10;
    v19 = v16;
    v36 = v19;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v31);
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPairingKey);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser pairingFromDictionary:](self, "pairingFromDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      -[AVTEditingModelDefinitionsParser pairingFromDictionary:](self, "pairingFromDictionary:", v11, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)objc_opt_class(), "sortedModelRows:forPlatform:", v19, -[AVTEditingModelDefinitionsParser platform](self, "platform"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = [AVTCoreModelCategory alloc];
    v24 = -[AVTCoreModelCategory initWithPresetCategory:presets:tags:rows:pairing:](v23, "initWithPresetCategory:presets:tags:rows:pairing:", v30, v49[5], v43[5], v22, v21);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    v18 = v10;
    v24 = 0;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v24;
}

void __93__AVTEditingModelDefinitionsParser_coreModelCategoryFromCategoryDictionary_parsedPickerKeys___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "multicolorPickersDefinitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "colorPickersDefinitions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 32);
    if (!v13)
    {
      objc_msgSend(v14, "presetPickersDefinitions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_19;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "coreModelPresetsForCategory:", *(_QWORD *)(a1 + 104));
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v37 = *(void **)(v36 + 40);
        *(_QWORD *)(v36 + 40) = v35;

        objc_msgSend(*(id *)(a1 + 32), "gatherAllTagsFromPresets:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v40 = *(void **)(v39 + 40);
        *(_QWORD *)(v39 + 40) = v38;

      }
      objc_msgSend(*(id *)(a1 + 32), "presetPickersDefinitions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "coreModelRowFromRowDictionary:availableTags:usedTags:defaultOptions:", v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      if (v25)
      {
        objc_msgSend(*(id *)(a1 + 72), "addObject:", v25);

        goto LABEL_26;
      }
LABEL_19:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't find a picker for identifier '%@'"), v6);
      goto LABEL_26;
    }
    objc_msgSend(v14, "colorPickersDefinitions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = AVTAvatarSettingDestinationForColorPickerIndex(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    objc_msgSend(v16, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorPickerPaletteKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTEditingModelMappings presetCategoryForColorPaletteName:](AVTEditingModelMappings, "presetCategoryForColorPaletteName:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(*(id *)(a1 + 56), "integerValue");
    v21 = *(void **)(a1 + 32);
    v42 = 0;
    v22 = objc_msgSend(v21, "validateForColorPicker:colorPaletteCategory:error:", v16, v19, &v42);
    v23 = v42;
    v24 = v23;
    if ((v22 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "coreModelColorsRowForColorPickerDictionary:settingDestination:inCategory:defaultOptions:", v16, v17, v20, *(_QWORD *)(a1 + 48));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      if (!v24)
      {
LABEL_12:

        goto LABEL_17;
      }
      objc_msgSend(*(id *)(a1 + 32), "setError:", v24);

    }
    else
    {
      if (v23)
        objc_msgSend(*(id *)(a1 + 32), "setError:", v23);
      *a4 = 1;
    }

    goto LABEL_25;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "arrayByAddingObject:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "multicolorPickersDefinitions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "applyPlatformOverrideForDictionary:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 104);
    v30 = *(_QWORD *)(a1 + 48);
    v43 = 0;
    objc_msgSend(v28, "coreModelMulticolorPickerForDictionary:groupPickerCategory:defaultOptions:parsedPickerKeys:error:", v27, v29, v30, v16, &v43);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v43;
    v32 = v31;
    if (!v25 && v31)
    {
      objc_msgSend(*(id *)(a1 + 32), "setError:", v31);
      *a4 = 1;

LABEL_25:
      goto LABEL_26;
    }

    goto LABEL_12;
  }
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recursion found in multicolor picker definition"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDescription:underlyingError:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v11);

  *a4 = 1;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Recursion found in multicolor picker definition for identifier '%@'"), v6);
LABEL_26:

}

- (id)pairingFromDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  AVTCoreModelPairing *v23;

  if (a3)
  {
    v3 = kAVTEditingModelDefinitionsPairedCategoryKey;
    v4 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPairedTitleKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPairTitleKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsUnpairTitleKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPairedDescriptionKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsUnpairedDescriptionKey);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "localizedString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[AVTEditingModelMappings presetCategoryFromCategoryName:](AVTEditingModelMappings, "presetCategoryFromCategoryName:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

    }
    else
    {
      v22 = 40;
      if (!v8 && !v11 && !v14)
      {
        v23 = 0;
        goto LABEL_10;
      }
    }
    v23 = -[AVTCoreModelPairing initWithPairedCategory:pairedTitle:pairTitle:unpairTitle:pairedDescription:unpairedDescription:]([AVTCoreModelPairing alloc], "initWithPairedCategory:pairedTitle:pairTitle:unpairTitle:pairedDescription:unpairedDescription:", v22, v8, v11, v14, v17, v20);
LABEL_10:

    return v23;
  }
  v23 = 0;
  return v23;
}

- (id)coreModelColorsRowForColorPickerDictionary:(id)a3 settingDestination:(int64_t)a4 inCategory:(int64_t)a5 defaultOptions:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  AVTCoreModelColorsPicker *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  unsigned int v28;
  id v29;

  v10 = a6;
  if (a3)
  {
    v29 = v10;
    -[AVTEditingModelDefinitionsParser applyPlatformOverrideForDictionary:](self, "applyPlatformOverrideForDictionary:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorPickerPrimaryColorsKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorPickerExtendedColorsKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorPickerAlwaysExtendedKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v14, "BOOLValue");

    v15 = (void *)objc_opt_class();
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsTitleKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[AVTEditingModelDefinitionsParser coreModelColorsForColorDefinitions:paletteSettingKind:](self, "coreModelColorsForColorDefinitions:paletteSettingKind:", v12, a4, a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_11:
        v20 = 0;
        if (v18)
        {
LABEL_12:
          if (objc_msgSend(v18, "count"))
            goto LABEL_15;
        }
LABEL_13:
        if (!v20 || !objc_msgSend(v20, "count"))
        {
          v19 = 0;
LABEL_20:

          v10 = v29;
          goto LABEL_21;
        }
LABEL_15:
        v27 = v12;
        objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPairingKey);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTEditingModelDefinitionsParser pairingFromDictionary:](self, "pairingFromDictionary:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsOptionsKey);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[AVTEditingModelDefinitionsParser coreModelRowOptionsFromOptionsDictionary:](self, "coreModelRowOptionsFromOptionsDictionary:", v23);
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = v29;
        }
        v25 = v24;
        v19 = -[AVTCoreModelColorsPicker initWithTitle:primaryColors:extendedColors:alwaysShowExtended:colorCategory:destination:pairing:options:]([AVTCoreModelColorsPicker alloc], "initWithTitle:primaryColors:extendedColors:alwaysShowExtended:colorCategory:destination:pairing:options:", v17, v18, v20, v28, a5, a4, v22, v24);

        v12 = v27;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v13)
      {
        -[AVTEditingModelDefinitionsParser coreModelColorsForPaletteSettingKind:](self, "coreModelColorsForPaletteSettingKind:", a4, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v18 = 0;
    }
    -[AVTEditingModelDefinitionsParser coreModelColorsForColorDefinitions:paletteSettingKind:](self, "coreModelColorsForColorDefinitions:paletteSettingKind:", v13, a4, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_12;
    goto LABEL_13;
  }
  v19 = 0;
LABEL_21:

  return v19;
}

- (id)coreModelMulticolorPickerForDictionary:(id)a3 groupPickerCategory:(int64_t)a4 defaultOptions:(id)a5 parsedPickerKeys:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char *v16;
  __objc2_class **v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  void *v25;
  __objc2_class *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  unint64_t v46;
  AVTCoreModelMulticolorPicker *v47;
  void *v48;
  AVTCoreModelMulticolorPicker *v49;
  AVTCoreModelMulticolorPicker *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  AVTEditingModelDefinitionsParser *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  id obj;
  id v70;
  id *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v77;
  char *v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  AVTEditingModelDefinitionsParser *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v70 = a5;
  v82 = a6;
  -[AVTEditingModelDefinitionsParser initalizeColorCacheIfNeeded](self, "initalizeColorCacheIfNeeded");
  objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorSubpickers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  v68 = v11;
  LOBYTE(a6) = -[AVTEditingModelDefinitionsParser validateForMulticolorPicker:subpickers:error:](self, "validateForMulticolorPicker:subpickers:error:", v11, v12, &v94);
  v13 = v94;
  v14 = v13;
  if ((a6 & 1) == 0)
  {
    v47 = 0;
    if (a7 && v13)
    {
      v47 = 0;
      *a7 = objc_retainAutorelease(v13);
    }
    goto LABEL_66;
  }
  v71 = a7;
  v83 = self;
  v66 = v13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v67 = v12;
  v15 = v12;
  v74 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
  if (v74)
  {
    v16 = 0;
    v72 = *(_QWORD *)v91;
    v17 = off_1EA51C000;
    obj = v15;
    while (2)
    {
      for (i = 0; i != v74; ++i)
      {
        if (*(_QWORD *)v91 != v72)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorPickerDestinationKey);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (uint64_t)v16;
        if (v20)
          v21 = objc_msgSend(v20, "integerValue");
        v78 = v16;
        v22 = AVTAvatarSettingDestinationForColorPickerIndex(v21);
        objc_msgSend(v19, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsCategoryNameKey);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = a4;
        if (v23)
        {
          -[__objc2_class presetCategoryFromCategoryName:](v17[51], "presetCategoryFromCategoryName:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v25, "integerValue");

        }
        v26 = v17[51];
        objc_msgSend(v19, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorPickerPaletteKey);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class presetCategoryForColorPaletteName:](v26, "presetCategoryForColorPaletteName:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = 0;
        v29 = -[AVTEditingModelDefinitionsParser validateForColorPicker:colorPaletteCategory:error:](v83, "validateForColorPicker:colorPaletteCategory:error:", v19, v28, &v89);
        v30 = v89;
        v31 = v30;
        if (v29)
        {
          -[AVTEditingModelDefinitionsParser coreModelColorsRowForColorPickerDictionary:settingDestination:inCategory:defaultOptions:](v83, "coreModelColorsRowForColorPickerDictionary:settingDestination:inCategory:defaultOptions:", v19, v22, v24, v70);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v32);
          v16 = v78 + 1;
          v33 = v31 == 0;

        }
        else
        {
          v33 = 0;
          if (v71 && v30)
          {
            v33 = 0;
            *v71 = objc_retainAutorelease(v30);
          }
          v16 = v78;
        }

        if (!v33)
        {
          v47 = 0;
          v14 = v66;
          v12 = v67;
          goto LABEL_65;
        }
        v17 = off_1EA51C000;
      }
      v15 = obj;
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      if (v74)
        continue;
      break;
    }
  }

  v34 = v68;
  objc_msgSend(v68, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorNestedPresetPickers);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v35;
  if (objc_msgSend(v35, "count"))
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v79 = v35;
    v36 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    if (v36)
    {
      v37 = v36;
      v77 = 0;
      v38 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v86 != v38)
            objc_enumerationMutation(v79);
          v40 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          objc_msgSend(v40, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorNestedPresetPickersCategory);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTEditingModelDefinitionsParser coreModelCategoryFromCategoryDictionary:parsedPickerKeys:](v83, "coreModelCategoryFromCategoryDictionary:parsedPickerKeys:", v41, v82);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorNestedPresetPickersIndex);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v43, "integerValue"));
            v44 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v44;
          }
          if (v42)
            v45 = v43 == 0;
          else
            v45 = 1;
          if (!v45)
          {
            v46 = objc_msgSend(v43, "integerValue");
            if (v46 < objc_msgSend(v81, "count"))
            {
              if (v77)
              {
                objc_msgSend(v77, "setObject:forKeyedSubscript:", v42, v43);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v42, v43);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
          }

        }
        v37 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
      }
      while (v37);
    }
    else
    {
      v77 = 0;
    }

    v34 = v68;
  }
  else
  {
    v77 = 0;
  }
  objc_msgSend(v34, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAuxiliaryPicker);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v66;
  v12 = v67;
  if (!v48)
  {
    v50 = 0;
    goto LABEL_50;
  }
  v84 = 0;
  -[AVTEditingModelDefinitionsParser multicolorAuxiliaryPickerForDictionary:error:](v83, "multicolorAuxiliaryPickerForDictionary:error:", v48, &v84);
  v47 = (AVTCoreModelMulticolorPicker *)objc_claimAutoreleasedReturnValue();
  v49 = (AVTCoreModelMulticolorPicker *)v84;
  v50 = v49;
  if (v47)
  {

    v50 = v47;
LABEL_50:
    objc_msgSend(v68, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorPickerInitialState);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v51;
    if (v51)
      v73 = objc_msgSend(v51, "integerValue");
    else
      v73 = 0;
    objc_msgSend(v68, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAllowsRemoval);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
      v54 = objc_msgSend(v52, "BOOLValue");
    else
      v54 = 1;
    objc_msgSend(v68, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsOptionsKey);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v48;
    if (v55)
    {
      v56 = v83;
      -[AVTEditingModelDefinitionsParser coreModelRowOptionsFromOptionsDictionary:](v83, "coreModelRowOptionsFromOptionsDictionary:", v55);
      v57 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = v70;
      v56 = v83;
    }
    v58 = (void *)objc_opt_class();
    objc_msgSend(v68, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsTitleKey);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedString:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorSubtitles);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser localizedSubtitlesForSubtitles:subpickerCount:](v56, "localizedSubtitlesForSubtitles:subpickerCount:", v61, objc_msgSend(v81, "count"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v65) = v54;
    v63 = v77;
    v47 = -[AVTCoreModelMulticolorPicker initWithTitle:subpickers:subtitles:nestedPresetPickers:auxiliaryPicker:initialState:allowsRemoval:options:]([AVTCoreModelMulticolorPicker alloc], "initWithTitle:subpickers:subtitles:nestedPresetPickers:auxiliaryPicker:initialState:allowsRemoval:options:", v60, v81, v62, v77, v50, v73, v65, v57);

    v14 = v66;
    v12 = v67;
    v48 = v80;
    goto LABEL_64;
  }
  if (v71 && v49)
  {
    v50 = objc_retainAutorelease(v49);
    v47 = 0;
    *v71 = v50;
  }
  v63 = v77;
LABEL_64:

LABEL_65:
LABEL_66:

  return v47;
}

- (id)localizedSubtitlesForSubtitles:(id)a3 subpickerCount:(int64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  AVTEditingModelDefinitionsParser *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v26)
  {
    v7 = 0;
    v25 = *(_QWORD *)v33;
    v8 = 0x1E0CB3000uLL;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v27 = v9;
        v31 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0x1E0CB3000uLL;
        if (a4 >= 1)
        {
          v11 = 0;
          v28 = v7 - 1;
          do
          {
            objc_msgSend(*(id *)(v8 + 2024), "numberWithInteger:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("%ld"), v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend((id)objc_opt_class(), "localizedString:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v15)
                goto LABEL_17;
            }
            else
            {
              if (v7 < 1)
                goto LABEL_17;
              v16 = v7;
              v17 = a4;
              v18 = self;
              objc_msgSend(v29, "objectAtIndexedSubscript:", v28);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v13);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend((id)objc_opt_class(), "localizedString:", v20);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v15 = 0;
              }

              self = v18;
              a4 = v17;
              v7 = v16;
              v8 = 0x1E0CB3000;
              v10 = 0x1E0CB3000;
              if (!v15)
                goto LABEL_17;
            }
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v15, v12);

LABEL_17:
            ++v11;
          }
          while (a4 != v11);
        }
        v21 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v29, "addObject:", v21);

        ++v7;
        v9 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v26);
  }

  v22 = (void *)objc_msgSend(v29, "copy");
  return v22;
}

- (id)multicolorAuxiliaryPickerForDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  AVTCoreModelMulticolorAuxilaryPickerItem *v24;
  void *v25;
  void *v26;
  AVTCoreModelMulticolorAuxiliaryPicker *v27;
  id *v29;
  void *v30;
  void *v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v29 = a4;
    v31 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemIdentifier);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemTitle);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)objc_opt_class();
        objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemMessage);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedString:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 || !objc_msgSend(v12, "length"))
          break;
        if (!v15 || !objc_msgSend(v15, "length"))
        {
          v19 = (void *)objc_opt_class();
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemTitle;
          goto LABEL_13;
        }
LABEL_14:
        v24 = -[AVTCoreModelMulticolorAuxilaryPickerItem initWithIdentifier:title:message:]([AVTCoreModelMulticolorAuxilaryPickerItem alloc], "initWithIdentifier:title:message:", v12, v15, v18);
        objc_msgSend(v33, "addObject:", v24);

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_16;
        }
      }
      v19 = (void *)objc_opt_class();
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerItemIdentifier;
LABEL_13:
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Multicolor auxiliary picker items require a valid %@"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDescription:underlyingError:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (v29)
          *v29 = objc_retainAutorelease(v23);

        v27 = 0;
        v6 = v30;
        v5 = v31;
        v25 = obj;
        v26 = v33;
        goto LABEL_20;
      }
      goto LABEL_14;
    }
LABEL_16:

    v5 = v31;
    objc_msgSend(v31, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsMulticolorAuxiliaryPickerType);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v33;
    v27 = -[AVTCoreModelMulticolorAuxiliaryPicker initWithType:items:]([AVTCoreModelMulticolorAuxiliaryPicker alloc], "initWithType:items:", v25, v33);
    v6 = v30;
LABEL_20:

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)validateForCategoryWithEnumValue:(id)a3 pickers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Category definitions require a valid %@"), kAVTEditingModelDefinitionsCategoryNameKey);
LABEL_7:
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDescription:underlyingError:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setError:](self, "setError:", v12);

    v9 = 0;
    goto LABEL_8;
  }
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Category definitions must contain at least one %@"), kAVTEditingModelDefinitionsCategoryPickersKey);
    goto LABEL_7;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)validateForMulticolorPicker:(id)a3 subpickers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multicolor definitions must contain at least one %@"), kAVTEditingModelDefinitionsMulticolorSubpickers);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDescription:underlyingError:", v11, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (BOOL)validateForColorPicker:(id)a3 colorPaletteCategory:(id)a4 error:(id *)a5
{
  BOOL v5;
  BOOL v6;
  void *v8;
  void *v9;

  if (a3)
    v5 = a4 == 0;
  else
    v5 = 0;
  v6 = !v5;
  if (v5 && a5)
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("colorPicker, %@ doesn't match a valid category"), kAVTEditingModelDefinitionsColorPickerPaletteKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDescription:underlyingError:", v9, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)neutralMemojiPresetIdentifierForCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTEditingModelDefinitionsParser neutralMemojiPresetsIdentifierPerCategory](self, "neutralMemojiPresetsIdentifierPerCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D00670], "neutralMemojiPresetsIdentifiersPerCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTEditingModelDefinitionsParser setNeutralMemojiPresetsIdentifierPerCategory:](self, "setNeutralMemojiPresetsIdentifierPerCategory:", v6);

  }
  -[AVTEditingModelDefinitionsParser neutralMemojiPresetsIdentifierPerCategory](self, "neutralMemojiPresetsIdentifierPerCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)coreModelPresetsForCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  AVTCoreModelPreset *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTEditingModelDefinitionsParser neutralMemojiPresetIdentifierForCategory:](self, "neutralMemojiPresetIdentifierForCategory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x1E0D00678], "availablePresetsForCategory:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v6);

        }
        else
        {
          v14 = 0;
        }
        v15 = -[AVTCoreModelPreset initWithPreset:isDefaultPreset:]([AVTCoreModelPreset alloc], "initWithPreset:isDefaultPreset:", v12, v14);
        objc_msgSend(v5, "addObject:", v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

- (id)coreModelColorsForPaletteSettingKind:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v5;
  void *v6;

  var1 = a3.var1;
  var0 = a3.var0;
  -[AVTEditingModelDefinitionsParser colorCache](self, "colorCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorsForSettingKind:", var0, var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)coreModelColorsForColorDefinitions:(id)a3 paletteSettingKind:(id)a4
{
  int64_t var1;
  int64_t var0;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  int64_t v17;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__AVTEditingModelDefinitionsParser_coreModelColorsForColorDefinitions_paletteSettingKind___block_invoke;
  v14[3] = &unk_1EA51E588;
  v14[4] = self;
  v16 = var0;
  v17 = var1;
  v10 = v9;
  v15 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

void __90__AVTEditingModelDefinitionsParser_coreModelColorsForColorDefinitions_paletteSettingKind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorNameKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorShowSliderKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "colorCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorForSettingKind:identifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    AVTAvatarSettingKindDescription(*(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Can't find matching color for name '%@' in color kind and category '%@'\nIs it missing from AvatarKit's palette plist?"), v3, v10);

    if (!v5)
      goto LABEL_9;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorRangeKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorRangeMinKey);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    objc_msgSend(v14, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsColorRangeMaxKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

  }
  else
  {
    v20 = 1.0;
    v17 = -1.0;
  }
  *(float *)&v12 = v17;
  *(float *)&v13 = v20;
  v21 = objc_msgSend(v7, "copyWithRangeMin:rangeMax:showSlider:", 1, v12, v13);

  v7 = (void *)v21;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (id)gatherAllTagsFromPresets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "tags");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __61__AVTEditingModelDefinitionsParser_gatherAllTagsFromPresets___block_invoke;
        v14[3] = &unk_1EA51E5B0;
        v15 = v4;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

void __61__AVTEditingModelDefinitionsParser_gatherAllTagsFromPresets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  objc_msgSend(v6, "unionOrderedSet:", v5);

}

- (id)applyPlatformOverrideForDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[AVTEditingModelDefinitionsParser platformDictionaryKey](self, "platformDictionaryKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKey:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[AVTEditingModelDefinitionsParser platformDictionaryKey](self, "platformDictionaryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = (id)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v11, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsOptionsKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsOptionsKey);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addEntriesFromDictionary:", v14);

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, kAVTEditingModelDefinitionsOptionsKey);
      objc_msgSend(v10, "removeObjectForKey:", kAVTEditingModelDefinitionsOptionsKey);
    }
    objc_msgSend(v11, "addEntriesFromDictionary:", v10);
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("platformOverride"));

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

- (id)coreModelRowFromRowDictionary:(id)a3 availableTags:(id)a4 usedTags:(id)a5 defaultOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  AVTEditingModelDefinitionsParser *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  AVTCoreModelPresetsPicker *v34;
  void *v36;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AVTEditingModelDefinitionsParser applyPlatformOverrideForDictionary:](self, "applyPlatformOverrideForDictionary:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend(v13, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsTitleKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsTagsKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "count"))
  {
    v19 = (void *)MEMORY[0x1E0C99E10];
    objc_msgSend(v10, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "orderedSetWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "minusOrderedSet:", v11);
    v18 = (void *)objc_msgSend(v21, "copy");

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsOptionsKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[AVTEditingModelDefinitionsParser coreModelRowOptionsFromOptionsDictionary:](self, "coreModelRowOptionsFromOptionsDictionary:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v12;
  }
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPairingKey);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = self;
    v27 = v18;
    v28 = v16;
    v29 = v11;
    v30 = v10;
    v31 = (void *)v25;
    -[AVTEditingModelDefinitionsParser pairingFromDictionary:](v26, "pairingFromDictionary:", v25);
    v36 = v17;
    v32 = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v30;
    v11 = v29;
    v16 = v28;
    v18 = v27;
    v34 = -[AVTCoreModelPresetsPicker initWithTitle:representedTags:pairing:options:]([AVTCoreModelPresetsPicker alloc], "initWithTitle:representedTags:pairing:options:", v16, v27, v33, v24);

    v12 = v32;
    v17 = v36;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)coreModelRowOptionsFromOptionsDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  AVTCoreModelPickerOptions *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  AVTCoreModelFramingModeOverrides *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsSeparatorKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsCameraKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTEditingModelMappings framingModeForCameraIdentifier:](AVTEditingModelMappings, "framingModeForCameraIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPresetOverridesKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke;
  v44[3] = &unk_1EA51E5D8;
  v44[4] = self;
  v46 = &v47;
  v10 = v8;
  v45 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v44);
  if (*((_BYTE *)v48 + 24))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsPoseOverrideKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00658]), "initWithDictionaryRepresentation:", v11);
    else
      v12 = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsCameraOverridesKey);
    v14 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v14;
    if (v14)
      v38 = -[AVTCoreModelFramingModeOverrides initWithCameraOverrides:]([AVTCoreModelFramingModeOverrides alloc], "initWithCameraOverrides:", v14);
    else
      v38 = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsDisplayModeKey);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = +[AVTCoreModelPickerOptions displayModeFromString:](AVTCoreModelPickerOptions, "displayModeFromString:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsDisplayConditionKey);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      +[AVTCoreModelPickerDisplayCondition displayConditionFromDictionnary:](AVTCoreModelPickerDisplayCondition, "displayConditionFromDictionnary:", v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsSortingKey);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend((id)objc_opt_class(), "defaultSortingOptionForPlatform:", -[AVTEditingModelDefinitionsParser platform](self, "platform"));
    if (v41)
      v17 = +[AVTCoreModelPickerOptions sortingOptionFromString:](AVTCoreModelPickerOptions, "sortingOptionFromString:");
    v18 = v17;
    v40 = v10;
    v34 = v11;
    if (v5)
      v19 = objc_msgSend(v5, "BOOLValue");
    else
      v19 = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsStickerConfigurationKey);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v16;
    objc_msgSend(v20, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsStickerConfigurationNameKey);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsStickerConfigurationPackKey);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v39 = v7;
    v32 = v5;
    v24 = 0;
    if (v21 && v22)
    {
      objc_msgSend(MEMORY[0x1E0D00690], "stickerConfigurationsForMemojiInStickerPack:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke_2;
      v42[3] = &unk_1EA51E600;
      v43 = v21;
      objc_msgSend(v25, "avt_firstObjectPassingTest:", v42);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", kAVTEditingModelDefinitionsShowsLabelKey);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v20;
    if ((AVTUIEditorShowAssetsName_once() & 1) != 0 || v26 && objc_msgSend(v26, "BOOLValue"))
    {
      v27 = v18;
      v28 = 1;
    }
    else
    {
      v27 = v18;
      v28 = 0;
    }
    LOBYTE(v30) = v28;
    v13 = -[AVTCoreModelPickerOptions initWithFramingMode:separatorFlag:presetOverrides:poseOverride:framingModeOverrides:displayMode:displayCondition:sortingOption:stickerConfiguration:showsLabel:]([AVTCoreModelPickerOptions alloc], "initWithFramingMode:separatorFlag:presetOverrides:poseOverride:framingModeOverrides:displayMode:displayCondition:sortingOption:stickerConfiguration:showsLabel:", v39, v19, v40, v12, v38, v36, v35, v27, v24, v30);

    v5 = v32;
    v7 = v39;
    v10 = v40;
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v47, 8);
  return v13;
}

void __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AVTCoreModelPreset *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  +[AVTEditingModelMappings presetCategoryFromCategoryName:](AVTEditingModelMappings, "presetCategoryFromCategoryName:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(MEMORY[0x1E0D00678], "presetWithCategory:identifier:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = *(void **)(a1 + 40);
    v12 = -[AVTCoreModelPreset initWithPreset:]([AVTCoreModelPreset alloc], "initWithPreset:", v10);
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find a preset override for category %@, identifier %@"), v16, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDescription:underlyingError:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v15);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __77__AVTEditingModelDefinitionsParser_coreModelRowOptionsFromOptionsDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (NSString)platformDictionaryKey
{
  return self->_platformDictionaryKey;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSData)plistData
{
  return self->_plistData;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (AVTEditingModelColors)colorCache
{
  return self->_colorCache;
}

- (void)setColorCache:(id)a3
{
  objc_storeStrong((id *)&self->_colorCache, a3);
}

- (NSDictionary)neutralMemojiPresetsIdentifierPerCategory
{
  return self->_neutralMemojiPresetsIdentifierPerCategory;
}

- (void)setNeutralMemojiPresetsIdentifierPerCategory:(id)a3
{
  objc_storeStrong((id *)&self->_neutralMemojiPresetsIdentifierPerCategory, a3);
}

- (NSDictionary)presetPickersDefinitions
{
  return self->_presetPickersDefinitions;
}

- (void)setPresetPickersDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_presetPickersDefinitions, a3);
}

- (NSDictionary)colorPickersDefinitions
{
  return self->_colorPickersDefinitions;
}

- (void)setColorPickersDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickersDefinitions, a3);
}

- (NSDictionary)multicolorPickersDefinitions
{
  return self->_multicolorPickersDefinitions;
}

- (void)setMulticolorPickersDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_multicolorPickersDefinitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multicolorPickersDefinitions, 0);
  objc_storeStrong((id *)&self->_colorPickersDefinitions, 0);
  objc_storeStrong((id *)&self->_presetPickersDefinitions, 0);
  objc_storeStrong((id *)&self->_neutralMemojiPresetsIdentifierPerCategory, 0);
  objc_storeStrong((id *)&self->_colorCache, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_plistData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_platformDictionaryKey, 0);
}

@end
