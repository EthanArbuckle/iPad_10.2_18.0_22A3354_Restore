@implementation AVTAvatarAttributeEditorModelManager

- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AVTColorLayerProvider *v7;
  AVTAvatarAttributeEditorModelManager *v8;

  v4 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorCoreModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(AVTColorLayerProvider);
  v8 = -[AVTAvatarAttributeEditorModelManager initWithAvatarRecord:coreModel:imageProvider:colorLayerProvider:preloader:environment:stickerRenderer:](self, "initWithAvatarRecord:coreModel:imageProvider:colorLayerProvider:preloader:environment:stickerRenderer:", v4, v6, 0, v7, 0, v5, 0);

  return v8;
}

- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3 coreModel:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 preloader:(id)a7 environment:(id)a8 stickerRenderer:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  AVTAvatarEditorColorsState *v22;
  void *v23;
  void *v24;
  AVTAvatarEditorColorsState *v25;
  AVTAvatarAttributeEditorModelManager *v26;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = [AVTAvatarEditorColorsState alloc];
  objc_msgSend(v20, "colors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "variationStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AVTAvatarEditorColorsState initWithVariationStore:](v22, "initWithVariationStore:", v24);

  v26 = -[AVTAvatarAttributeEditorModelManager initWithAvatarRecord:coreModel:editorColorsState:imageProvider:colorLayerProvider:preloader:environment:stickerRenderer:](self, "initWithAvatarRecord:coreModel:editorColorsState:imageProvider:colorLayerProvider:preloader:environment:stickerRenderer:", v21, v20, v25, v19, v18, v17, v16, v15);
  return v26;
}

- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3 coreModel:(id)a4 editorColorsState:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 preloader:(id)a8 environment:(id)a9 stickerRenderer:(id)a10
{
  id v16;
  id v17;
  AVTAvatarAttributeEditorModelManager *v18;
  AVTAvatarAttributeEditorModelManager *v19;
  uint64_t v20;
  AVTAvatarRecord *avatarRecord;
  uint64_t v22;
  AVTMemoji *avatar;
  uint64_t v24;
  AVTAvatarConfiguration *avatarConfiguration;
  uint64_t v26;
  AVTUILogger *logger;
  uint64_t v28;
  AVTAvatarAttributeEditorState *editorState;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v16 = a3;
  v36 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v17 = a9;
  v31 = a10;
  v37.receiver = self;
  v37.super_class = (Class)AVTAvatarAttributeEditorModelManager;
  v18 = -[AVTAvatarAttributeEditorModelManager init](&v37, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_environment, a9);
    objc_storeStrong((id *)&v19->_coreModel, a4);
    objc_storeStrong((id *)&v19->_colorsState, a5);
    v20 = objc_msgSend(v16, "copy");
    avatarRecord = v19->_avatarRecord;
    v19->_avatarRecord = (AVTAvatarRecord *)v20;

    objc_msgSend(MEMORY[0x1E0D00858], "memojiForRecord:usageIntent:", v16, 4);
    v22 = objc_claimAutoreleasedReturnValue();
    avatar = v19->_avatar;
    v19->_avatar = (AVTMemoji *)v22;

    +[AVTAvatarConfiguration configurationFromAvatar:coreModel:](AVTAvatarConfiguration, "configurationFromAvatar:coreModel:", v19->_avatar, v36);
    v24 = objc_claimAutoreleasedReturnValue();
    avatarConfiguration = v19->_avatarConfiguration;
    v19->_avatarConfiguration = (AVTAvatarConfiguration *)v24;

    objc_storeStrong((id *)&v19->_imageProvider, a6);
    objc_storeStrong((id *)&v19->_colorLayerProvider, a7);
    objc_storeStrong((id *)&v19->_stickerRenderer, a10);
    objc_storeStrong((id *)&v19->_preloader, a8);
    objc_msgSend(v17, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    logger = v19->_logger;
    v19->_logger = (AVTUILogger *)v26;

    -[AVTAvatarAttributeEditorModelManager buildInitialEditorState](v19, "buildInitialEditorState");
    v28 = objc_claimAutoreleasedReturnValue();
    editorState = v19->_editorState;
    v19->_editorState = (AVTAvatarAttributeEditorState *)v28;

    -[AVTAvatarAttributeEditorModelManager buildIntitialColorsState](v19, "buildIntitialColorsState");
  }

  return v19;
}

- (AVTMemoji)avatar
{
  -[AVTAvatarAttributeEditorModelManager loadResourcesIfNeeded](self, "loadResourcesIfNeeded");
  return self->_avatar;
}

- (void)flushResourcesForEnteringBackground
{
  AVTMemoji *avatar;
  id v4;

  avatar = self->_avatar;
  self->_avatar = 0;

  -[AVTAvatarAttributeEditorModelManager environment](self, "environment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushResourcesForEnteringBackground");

}

- (void)loadResourcesIfNeeded
{
  void *v3;
  void *v4;
  AVTMemoji *v5;
  void *v6;
  AVTMemoji *avatar;

  if (!self->_avatar)
  {
    v3 = (void *)MEMORY[0x1E0D00858];
    -[AVTAvatarAttributeEditorModelManager avatarRecord](self, "avatarRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "memojiForRecord:usageIntent:", v4, 4);
    v5 = (AVTMemoji *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyToAvatar:animated:", v5, 0);

    avatar = self->_avatar;
    self->_avatar = v5;

  }
}

- (void)buildIntitialColorsState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[AVTAvatarAttributeEditorModelManager coreModel](self, "coreModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v42;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v5);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v6, "categories");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v26)
        {
          v25 = *(_QWORD *)v38;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v38 != v25)
                objc_enumerationMutation(v24);
              v27 = v7;
              v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              objc_msgSend(v8, "pickers");
              v28 = (id)objc_claimAutoreleasedReturnValue();
              v9 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
              if (v9)
              {
                v10 = v9;
                v11 = *(_QWORD *)v34;
                do
                {
                  v12 = 0;
                  do
                  {
                    if (*(_QWORD *)v34 != v11)
                      objc_enumerationMutation(v28);
                    v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v14 = v13;
                      v29 = 0u;
                      v30 = 0u;
                      v31 = 0u;
                      v32 = 0u;
                      objc_msgSend(v14, "subpickers");
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
                      if (v16)
                      {
                        v17 = v16;
                        v18 = *(_QWORD *)v30;
                        do
                        {
                          v19 = 0;
                          do
                          {
                            if (*(_QWORD *)v30 != v18)
                              objc_enumerationMutation(v15);
                            -[AVTAvatarAttributeEditorModelManager setInitialColorStateForColorPicker:forMulticolor:](self, "setInitialColorStateForColorPicker:forMulticolor:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19++), 1);
                          }
                          while (v17 != v19);
                          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
                        }
                        while (v17);
                      }

                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        -[AVTAvatarAttributeEditorModelManager setInitialColorStateForColorPicker:forMulticolor:](self, "setInitialColorStateForColorPicker:forMulticolor:", v13, 0);
                    }
                    ++v12;
                  }
                  while (v12 != v10);
                  v10 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
                }
                while (v10);
              }

              v7 = v27 + 1;
            }
            while (v27 + 1 != v26);
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          }
          while (v26);
        }

        v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v22);
  }

}

- (BOOL)primaryColorOfCategory:(int64_t)a3 doesMatchColorOfDependentCategory:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  BOOL v20;

  -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorPresetForSettingKind:", 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorPresetForSettingKind:", 1, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "colorPreset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorPreset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v14))
  {
    objc_msgSend(v8, "colorPreset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "variation");
    v17 = v16;
    objc_msgSend(v10, "colorPreset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "variation");
    v20 = v17 == v19;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)setInitialColorStateForColorPicker:(id)a3 forMulticolor:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  v6 = objc_msgSend(v15, "colorCategory") == 15
    && -[AVTAvatarAttributeEditorModelManager primaryColorOfCategory:doesMatchColorOfDependentCategory:](self, "primaryColorOfCategory:doesMatchColorOfDependentCategory:", 1, 15);
  if (objc_msgSend(v15, "colorCategory") == 16)
  {
    v7 = -[AVTAvatarAttributeEditorModelManager primaryColorOfCategory:doesMatchColorOfDependentCategory:](self, "primaryColorOfCategory:doesMatchColorOfDependentCategory:", 2, 16);
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v7 = 0;
    if (!v4)
    {
LABEL_9:
      v8 = objc_msgSend(v15, "destination");
      v9 = objc_msgSend(v15, "colorCategory");
      -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorPresetForSettingKind:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTAvatarAttributeEditorModelManager colorsState](self, "colorsState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "colorPreset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "color");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectedColorPreset:forCoreModelColor:", v13, v14);

      goto LABEL_10;
    }
  }
  if (!v6 && !v7)
    goto LABEL_9;
LABEL_10:

}

- (id)buildUIModel
{
  return -[AVTAvatarAttributeEditorModelManager buildUIModelWithSelectedCategory:atIndex:](self, "buildUIModelWithSelectedCategory:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)buildUIModelWithSelectedCategory:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[AVTAvatarAttributeEditorModelManager coreModel](self, "coreModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorModelManager imageProvider](self, "imageProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorModelManager colorLayerProvider](self, "colorLayerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorModelManager stickerRenderer](self, "stickerRenderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorModelBuilder buildDataSourceCategoriesFromCoreModel:selectingFromAvatarConfiguration:imageProvider:colorLayerProvider:stickerRenderer:modelManager:withSelectedCategory:atIndex:](AVTAvatarAttributeEditorModelBuilder, "buildDataSourceCategoriesFromCoreModel:selectingFromAvatarConfiguration:imageProvider:colorLayerProvider:stickerRenderer:modelManager:withSelectedCategory:atIndex:", v7, v8, v9, v10, v11, self, v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)buildInitialEditorState
{
  void *v3;
  void *v4;
  void *v5;

  -[AVTAvatarAttributeEditorModelManager coreModel](self, "coreModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorState buildStateFromCoreModel:avatarConfiguration:](AVTAvatarAttributeEditorState, "buildStateFromCoreModel:avatarConfiguration:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateAvatarRecordFromAvatar
{
  void *v3;
  void *v4;
  id v5;

  -[AVTAvatarAttributeEditorModelManager avatar](self, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't encode avatar"));
  -[AVTAvatarAttributeEditorModelManager avatarRecord](self, "avatarRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvatarData:", v5);

}

- (void)updateEditorStateBySelectingSectionItem:(id)a3 animated:(BOOL)a4
{
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  id v13;

  v13 = a3;
  v5 = objc_msgSend(v13, "conformsToProtocol:", &unk_1F03F3128);
  v6 = v13;
  if (v5)
  {
    v7 = v13;
    objc_msgSend(v7, "editorStateUpdater");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[AVTAvatarAttributeEditorModelManager editorState](self, "editorState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v7, "editorStateUpdater");
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[AVTAvatarAttributeEditorModelManager editorState](self, "editorState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v11)[2](v11, v12);

      }
    }

    v6 = v13;
  }

}

- (void)updateAvatarBySelectingSectionItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F03C2B68))
  {
    objc_msgSend(v7, "avatarUpdater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorModelManager updateAvatarWithAvatarUpdater:animated:](self, "updateAvatarWithAvatarUpdater:animated:", v6, v4);

  }
}

- (void)updateAvatarByDeletingSectionItems:(id)a3 animated:(BOOL)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v17 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v11);
        v12 = v11;
        objc_msgSend(v12, "removalUpdater");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "removalUpdater");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1DF0D0754]();
          objc_msgSend(v5, "addObject:", v15);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  +[AVTAvatarUpdaterFactory updaterForAggregatingUpdaters:](AVTAvatarUpdaterFactory, "updaterForAggregatingUpdaters:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorModelManager updateAvatarWithAvatarUpdater:animated:](self, "updateAvatarWithAvatarUpdater:animated:", v16, v17);
  -[AVTAvatarAttributeEditorModelManager updateAvatarRecordFromAvatar](self, "updateAvatarRecordFromAvatar");

}

- (void)updateAvatarBySelectingSupplementalPickerItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  objc_msgSend(v13, "editorUpdater");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[AVTAvatarAttributeEditorModelManager editorState](self, "editorState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v13, "editorUpdater");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[AVTAvatarAttributeEditorModelManager editorState](self, "editorState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v10);

    }
  }
  objc_msgSend(v13, "avatarUpdater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v13, "avatarUpdater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorModelManager updateAvatarWithAvatarUpdater:animated:](self, "updateAvatarWithAvatarUpdater:animated:", v12, v4);

  }
}

- (void)updateAvatarWithAvatarUpdater:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(id, void *);

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  if (v6)
  {
    v12 = v6;
    -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v8);

    -[AVTAvatarAttributeEditorModelManager presetOverriddenConfiguration](self, "presetOverriddenConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AVTAvatarAttributeEditorModelManager presetOverriddenConfiguration](self, "presetOverriddenConfiguration");
      v10 = objc_claimAutoreleasedReturnValue();

      -[AVTAvatarAttributeEditorModelManager presetOverriddenConfiguration](self, "presetOverriddenConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v11);

      v7 = (void *)v10;
    }
    -[AVTAvatarAttributeEditorModelManager applyConfigurationToAvatar:animated:](self, "applyConfigurationToAvatar:animated:", v7, v4);
    -[AVTAvatarAttributeEditorModelManager updateAvatarRecordFromAvatar](self, "updateAvatarRecordFromAvatar");

    v6 = v12;
  }

}

- (void)updateAvatarByApplyingPresetOverrides:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "addPreset:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    -[AVTAvatarAttributeEditorModelManager setPresetOverriddenConfiguration:](self, "setPresetOverriddenConfiguration:", v8);
    -[AVTAvatarAttributeEditorModelManager presetOverriddenConfiguration](self, "presetOverriddenConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorModelManager applyConfigurationToAvatar:animated:](self, "applyConfigurationToAvatar:animated:", v14, v4);

  }
  else
  {
    -[AVTAvatarAttributeEditorModelManager setPresetOverriddenConfiguration:](self, "setPresetOverriddenConfiguration:", 0);
    -[AVTAvatarAttributeEditorModelManager avatarConfiguration](self, "avatarConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorModelManager applyConfigurationToAvatar:animated:](self, "applyConfigurationToAvatar:animated:", v15, 1);

    -[AVTAvatarAttributeEditorModelManager updateAvatarRecordFromAvatar](self, "updateAvatarRecordFromAvatar");
  }

}

- (void)applyPairColorUpdateIfNeeded:(id)a3 forCategoryRight:(int64_t)a4 categoryLeft:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v8 = a3;
  v9 = AVTAvatarSettingColorIndexForColorDestination(1);
  -[AVTAvatarAttributeEditorModelManager avatar](self, "avatar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorPresetForCategory:colorIndex:", a4, v9);
  v32 = objc_claimAutoreleasedReturnValue();

  -[AVTAvatarAttributeEditorModelManager avatar](self, "avatar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorPresetForCategory:colorIndex:", a5, v9);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "colorPresetForSettingKind:", 1, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorPreset");
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "colorPresetForSettingKind:", 1, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "colorPreset");
  v16 = objc_claimAutoreleasedReturnValue();

  if (v14 | v32)
  {
    objc_msgSend((id)v14, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v32, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", v18)
      && (objc_msgSend((id)v14, "variation"), v20 = v19, objc_msgSend((id)v32, "variation"), v20 == v21)
      || !(v16 | v12))
    {

    }
    else
    {
      objc_msgSend((id)v16, "name");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "name");
      v23 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v22;
      v24 = (void *)v22;
      v25 = (void *)v23;
      if (objc_msgSend(v24, "isEqualToString:", v23))
      {
        objc_msgSend((id)v16, "variation");
        v27 = v26;
        objc_msgSend((id)v12, "variation");
        v29 = v28;

        if (v27 == v29)
          goto LABEL_12;
      }
      else
      {

      }
      -[AVTAvatarAttributeEditorModelManager avatar](self, "avatar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setColorPreset:forCategory:colorIndex:", v14, a4, v9);

      -[AVTAvatarAttributeEditorModelManager avatar](self, "avatar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setColorPreset:forCategory:colorIndex:", v16, a5, v9);
    }

  }
LABEL_12:

}

- (void)applyPairColorUpdatesIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  -[AVTAvatarAttributeEditorModelManager applyPairColorUpdateIfNeeded:forCategoryRight:categoryLeft:](self, "applyPairColorUpdateIfNeeded:forCategoryRight:categoryLeft:", v4, 31, 30);
  -[AVTAvatarAttributeEditorModelManager applyPairColorUpdateIfNeeded:forCategoryRight:categoryLeft:](self, "applyPairColorUpdateIfNeeded:forCategoryRight:categoryLeft:", v4, 26, 25);

}

- (void)applyConfigurationToAvatar:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[AVTAvatarAttributeEditorModelManager applyPairColorUpdatesIfNeeded:](self, "applyPairColorUpdatesIfNeeded:", v6);
  -[AVTAvatarAttributeEditorModelManager logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logUpdatingLiveAvatarWithConfiguration:", v8);

  -[AVTAvatarAttributeEditorModelManager avatar](self, "avatar");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyToAvatar:animated:", v9, v4);

}

- (BOOL)shouldDisplaySectionForCategory:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  -[AVTAvatarAttributeEditorModelManager editorState](self, "editorState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCategoryPaired:", a3);

  -[AVTAvatarAttributeEditorModelManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AVTAvatarAttributeEditorModelManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldDisplaySectionForCategory:", a3);

  }
  else
  {
    v9 = 1;
  }

  return v9 & ~v6;
}

- (BOOL)shouldDisplaySectionWithDisplayCondition:(id)a3 inCategoryAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  -[AVTAvatarAttributeEditorModelManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1F03D81C0);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    -[AVTAvatarAttributeEditorModelManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v10);

  }
  -[AVTAvatarAttributeEditorModelManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(v11, "shouldDisplaySectionWithDisplayCondition:inCategoryAtIndex:", v6, a4);
  else
    v12 = 1;

  return v12;
}

- (void)setAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_avatar, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTAvatarEditorColorsState)colorsState
{
  return self->_colorsState;
}

- (AVTAvatarAttributeEditorState)editorState
{
  return self->_editorState;
}

- (AVTAvatarAttributeEditorModelManagerDelegate)delegate
{
  return (AVTAvatarAttributeEditorModelManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarConfiguration)presetOverriddenConfiguration
{
  return self->_presetOverriddenConfiguration;
}

- (void)setPresetOverriddenConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_presetOverriddenConfiguration, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTCoreModel)coreModel
{
  return self->_coreModel;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (AVTAvatarConfiguration)avatarConfiguration
{
  return self->_avatarConfiguration;
}

- (AVTPresetImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTColorLayerProvider)colorLayerProvider
{
  return self->_colorLayerProvider;
}

- (AVTUIStickerRenderer)stickerRenderer
{
  return self->_stickerRenderer;
}

- (AVTAvatarAttributeEditorPreloader)preloader
{
  return self->_preloader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloader, 0);
  objc_storeStrong((id *)&self->_stickerRenderer, 0);
  objc_storeStrong((id *)&self->_colorLayerProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_avatarConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_coreModel, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_presetOverriddenConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editorState, 0);
  objc_storeStrong((id *)&self->_colorsState, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end
