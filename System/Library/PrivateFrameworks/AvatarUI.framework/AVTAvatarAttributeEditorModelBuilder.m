@implementation AVTAvatarAttributeEditorModelBuilder

+ (unint64_t)destinationForPresetCategory:(int64_t)a3 isPaired:(BOOL)a4
{
  unint64_t result;

  result = 0;
  switch(a3)
  {
    case 25:
    case 30:
      if (a4)
        result = 3;
      else
        result = 1;
      break;
    case 26:
    case 31:
      if (a4)
        result = 3;
      else
        result = 2;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)buildDataSourceCategoriesFromCoreModel:(id)a3 selectingFromAvatarConfiguration:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 stickerRenderer:(id)a7 modelManager:(id)a8 withSelectedCategory:(id)a9 atIndex:(unint64_t)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  AVTAvatarAttributeEditorCategory *v39;
  void *v40;
  void *v41;
  AVTAvatarAttributeEditorCategory *v42;
  void *v43;
  void *v45;
  id obj;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  unint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v58 = a4;
  v57 = a5;
  v56 = a6;
  v55 = a7;
  v16 = a8;
  v17 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v15, "platform");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v17;
  if (v17)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    objc_msgSend(v17, "sections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v73 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v23, v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      }
      while (v20);
    }

  }
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __203__AVTAvatarAttributeEditorModelBuilder_buildDataSourceCategoriesFromCoreModel_selectingFromAvatarConfiguration_imageProvider_colorLayerProvider_stickerRenderer_modelManager_withSelectedCategory_atIndex___block_invoke;
  v69[3] = &unk_1EA51FC18;
  v54 = v16;
  v70 = v54;
  v71 = a10;
  v53 = (void *)MEMORY[0x1DF0D0754](v69);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v15, "groups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v49)
  {
    v47 = *(_QWORD *)v66;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v66 != v47)
          objc_enumerationMutation(obj);
        v51 = v25;
        v26 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v25);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v50 = v26;
        objc_msgSend(v26, "categories");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v62 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
              objc_msgSend(v15, "colors");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "colorDefaultsProvider");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "sectionProvidersForCoreModelCategory:platform:modelManager:pairingPickers:editingColors:colorDefaultsProvider:previousSectionMap:imageProvider:colorLayerProvider:stickerRenderer:configuration:displayConditionEvaluator:", v34, v52, v54, v28, v35, v36, v59, v57, v56, v55, v58, v53);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (v37)
                objc_msgSend(v27, "addObjectsFromArray:", v37);

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
          }
          while (v31);
        }

        objc_msgSend(a1, "previewModeForCoreModelGroup:", v50);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = [AVTAvatarAttributeEditorCategory alloc];
        objc_msgSend(v50, "name");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "symbolNames");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[AVTAvatarAttributeEditorCategory initWithSectionProviders:localizedName:previewMode:modelGroup:symbolNames:](v39, "initWithSectionProviders:localizedName:previewMode:modelGroup:symbolNames:", v27, v40, v38, v50, v41);

        objc_msgSend(v48, "addObject:", v42);
        v25 = v51 + 1;
      }
      while (v51 + 1 != v49);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v49);
  }

  v43 = (void *)objc_msgSend(v48, "copy");
  return v43;
}

uint64_t __203__AVTAvatarAttributeEditorModelBuilder_buildDataSourceCategoriesFromCoreModel_selectingFromAvatarConfiguration_imageProvider_colorLayerProvider_stickerRenderer_modelManager_withSelectedCategory_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "shouldDisplaySectionWithDisplayCondition:inCategoryAtIndex:", a2, *(_QWORD *)(a1 + 40));
  else
    return 1;
}

+ (id)sectionProvidersForCoreModelCategory:(id)a3 platform:(unint64_t)a4 modelManager:(id)a5 pairingPickers:(id)a6 editingColors:(id)a7 colorDefaultsProvider:(id)a8 previousSectionMap:(id)a9 imageProvider:(id)a10 colorLayerProvider:(id)a11 stickerRenderer:(id)a12 configuration:(id)a13 displayConditionEvaluator:(id)a14
{
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t (**v22)(id, void *);
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v89;
  id v90;
  unsigned int v91;
  id obj;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t (**v97)(id, void *);
  void *v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v90 = a6;
  v100 = a7;
  v89 = a8;
  v20 = v19;
  v95 = a9;
  v102 = a10;
  v99 = a11;
  v81 = a12;
  v21 = a13;
  v22 = (uint64_t (**)(id, void *))a14;
  v82 = v18;
  if (v19)
  {
    if (!objc_msgSend(v19, "shouldDisplaySectionForCategory:", objc_msgSend(v18, "presetCategory")))
    {
      v28 = 0;
      goto LABEL_62;
    }
    objc_msgSend(v19, "editorState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pairing");
    v24 = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "isCategoryPaired:", objc_msgSend(v25, "pairedCategory"));

    if (v26)
    {
      objc_msgSend(v24, "pairing");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v27, "pairedCategory");

      v91 = 1;
    }
    else
    {
      v91 = 0;
      v94 = 40;
    }
    v18 = v24;
  }
  else
  {
    v91 = 0;
    v94 = 40;
  }
  v29 = a1;
  objc_msgSend(v18, "pairing");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v20, "colorsState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarUpdaterFactory updaterForPairingCategory:colorsState:](AVTAvatarUpdaterFactory, "updaterForPairingCategory:colorsState:", v82, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[AVTAvatarAttributeEditorSectionSupplementalPicker pickerForPairableModelCategory:isPaired:avatarUpdaterOnPair:](AVTAvatarAttributeEditorSectionSupplementalPicker, "pickerForPairableModelCategory:isPaired:avatarUpdaterOnPair:", v82, v91, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v82, "pairing");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v35, "pairedCategory"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)v33;
    objc_msgSend(v90, "setObject:forKeyedSubscript:", v33, v36);

    v18 = v82;
  }
  else
  {
    v98 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presetForCategory:", objc_msgSend(v18, "presetCategory"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "preset");
  v38 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "presets");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)v38;
  objc_msgSend(a1, "selectedModelPresetForSelectedPreset:inPresetsList:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = v40;
  objc_msgSend(v40, "tags");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v41, "copy");

  objc_msgSend(v18, "tags");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pickers");
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
  if (v103)
  {
    v104 = 0;
    v101 = *(_QWORD *)v106;
    v85 = v20;
    v78 = v21;
    v97 = v22;
    do
    {
      for (i = 0; i != v103; ++i)
      {
        if (*(_QWORD *)v106 != v101)
          objc_enumerationMutation(obj);
        v43 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        if (v22)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "options");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "displayCondition");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v22[2](v22, v45);

          if (!v46)
            continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v47 = v43;
        else
          v47 = 0;
        v48 = v47;
        if (v48)
        {
          objc_msgSend(v29, "multicolorSectionProviderForCoreMulticolorPicker:platform:configuration:imageProvider:colorLayerProvider:editingColors:colorDefaultsProvider:modelManager:previousSectionMap:pairingPickers:", v48, a4, v21, v102, v99, v100, v89, v20, v95, v90);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
            objc_msgSend(v93, "addObject:", v49);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v50 = v43;
        else
          v50 = 0;
        v51 = v50;
        if (v51)
        {
          LOBYTE(v75) = 1;
          objc_msgSend(v29, "sectionForModelColorsRow:configuration:modelManager:imageProvider:colorLayerProvider:pairedCategory:destination:editingColors:displaysTitle:", v51, v21, v20, v102, v99, v94, AVTAvatarSettingDestinationForColorPickerIndex(v104), v100, v75);
          v52 = (id)objc_claimAutoreleasedReturnValue();
          if (v98)
          {
            objc_msgSend(v43, "pairing");
            v53 = objc_claimAutoreleasedReturnValue();
            if (!v53)
              goto LABEL_46;
            v54 = (void *)v53;
            objc_msgSend(v43, "pairing");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v55;
            if ((v91 & 1) != 0)
              objc_msgSend(v55, "localizedUnpairTitle");
            else
              objc_msgSend(v55, "localizedPairTitle");
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = v85;
            if (v68)
            {
              v69 = (void *)objc_msgSend(v98, "copyWithLocalizedTitle:", v68);
              objc_msgSend(v52, "setSupplementalPicker:", v69);

            }
            else
            {
LABEL_46:
              objc_msgSend(v52, "setSupplementalPicker:", v98);
            }
            v29 = a1;
            if (v91)
            {
              objc_msgSend(v43, "pairing");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "localizedPairedTitle");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              if (v71)
              {
                objc_msgSend(v52, "setLocalizedName:", v71);
              }
              else
              {
                objc_msgSend(v82, "pairing");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "localizedPairedTitle");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setLocalizedName:", v73);

                v20 = v85;
              }

              v29 = a1;
            }
          }
          if (v52)
            objc_msgSend(v93, "addObject:", v52);
          ++v104;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v57 = v43;
          else
            v57 = 0;
          v52 = v57;
          if (v52)
          {
            v86 = v48;
            objc_msgSend(v43, "identifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "objectForKeyedSubscript:", v58);
            v59 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v82, "presets");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = (void *)v59;
            objc_msgSend(v29, "sectionForModelRow:fromModelPresets:selectedModelPreset:tagSelection:fixedTags:availableTags:category:imageProvider:stickerRenderer:configuration:previousSection:pairedCategory:", v43, v60, v80, v84, v83, v79, objc_msgSend(v82, "presetCategory"), v102, v81, v21, v59, v94);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if (v61)
            {
              objc_msgSend(v52, "representedTags");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "tagSetForTagNames:inTagSet:", v62, v84);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(a1, "setTags:onMutableTagSet:", v63, v83);
              objc_msgSend(v61, "options");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend(v64, "displayMode");

              if (v65 == 1)
              {
                objc_msgSend(a1, "firstColorSectionInSections:", v77);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (v66)
                {
                  +[AVTAvatarAttributeEditorSectionSupplementalPicker pickerFromEditorSection:](AVTAvatarAttributeEditorSectionSupplementalPicker, "pickerFromEditorSection:", v61);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "setSupplementalPicker:", v67);

                }
              }
              else
              {
                objc_msgSend(v93, "addObject:", v61);
              }

              v20 = v85;
            }

            v29 = a1;
            v21 = v78;
            v48 = v86;
          }
        }

        v22 = v97;
      }
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
    }
    while (v103);
  }
  v28 = (void *)objc_msgSend(v93, "copy");

LABEL_62:
  return v28;
}

+ (id)previewModeForCoreModelGroup:(id)a3
{
  id v3;
  AVTAvatarAttributeEditorPreviewModeOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AVTAvatarAttributeEditorPreviewModeOptions *v11;
  void *v12;
  unint64_t v13;
  AVTAvatarAttributeEditorPreviewMode *v14;

  v3 = a3;
  v4 = [AVTAvatarAttributeEditorPreviewModeOptions alloc];
  objc_msgSend(v3, "previewMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "framingMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bodyPosePack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVTAvatarAttributeEditorPreviewModeOptions initWithFramingMode:bodyPosePack:](v4, "initWithFramingMode:bodyPosePack:", v7, v10);

  objc_msgSend(v3, "previewMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = +[AVTAvatarAttributeEditorPreviewMode attributeEditorPreviewModeTypeForEditingPreviewModeType:](AVTAvatarAttributeEditorPreviewMode, "attributeEditorPreviewModeTypeForEditingPreviewModeType:", objc_msgSend(v12, "type"));
  v14 = -[AVTAvatarAttributeEditorPreviewMode initWithType:options:]([AVTAvatarAttributeEditorPreviewMode alloc], "initWithType:options:", v13, v11);

  return v14;
}

+ (id)selectedModelPresetForSelectedPreset:(id)a3 inPresetsList:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)sectionForModelColorsRow:(id)a3 configuration:(id)a4 modelManager:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 pairedCategory:(int64_t)a8 destination:(int64_t)a9 editingColors:(id)a10 displaysTitle:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  int64_t v29;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  if (v16 && (objc_msgSend(v16, "isEmpty") & 1) == 0)
  {
    objc_msgSend(v18, "colorsState");
    v29 = a8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v16, "colorCategory"), a9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = AVTColorSettingKind(40, 0);
    LOBYTE(v28) = a11;
    objc_msgSend(a1, "sectionForModelColorsRow:selectedColorPreset:configuration:modelManager:additionalAvatarUpdateKind:imageProvider:colorLayerProvider:pairedCategory:destination:editingColors:displaysTitle:", v16, v24, v17, v18, v25, v26, v19, v20, v29, a9, v21, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)sectionForModelColorsRow:(id)a3 selectedColorPreset:(id)a4 configuration:(id)a5 modelManager:(id)a6 additionalAvatarUpdateKind:(id)a7 imageProvider:(id)a8 colorLayerProvider:(id)a9 pairedCategory:(int64_t)a10 destination:(int64_t)a11 editingColors:(id)a12 displaysTitle:(BOOL)a13
{
  int64_t var1;
  int64_t var0;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AVTAvatarAttributeEditorColorSection *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  AVTAvatarAttributeEditorColorSection *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  unsigned int v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v51;
  void *v52;

  var1 = a7.var1;
  var0 = a7.var0;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  v24 = a12;
  v52 = v22;
  if (v18 && (objc_msgSend(v18, "isEmpty") & 1) == 0)
  {
    v48 = v19;
    objc_msgSend(v18, "primaryColors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v18, "primaryColors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sectionColorItemsForColors:selectedPreset:configuration:modelManager:additionalUpdateKind:imageProvider:colorLayerProvider:pairedCategory:editingColors:", v27, v48, v20, v21, var0, var1, v22, v23, a10, v24);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v18, "extendedColors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v18, "extendedColors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sectionColorItemsForColors:selectedPreset:configuration:modelManager:additionalUpdateKind:imageProvider:colorLayerProvider:pairedCategory:editingColors:", v29, v48, v20, v21, var0, var1, v22, v23, a10, v24);
      v30 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }
    v46 = (void *)v30;
    v47 = v20;
    if (a10 == 40)
    {
      v31 = 0;
      if (a13)
        goto LABEL_18;
    }
    else
    {
      objc_msgSend(v18, "pairing");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v32 != 0;

      if (a13)
      {
        v44 = v31;
        objc_msgSend(v18, "pairing");
        v33 = objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          v31 = v31;
LABEL_18:
          objc_msgSend(v18, "title");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        v34 = (void *)v33;
        objc_msgSend(v18, "pairing");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedPairedTitle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v44;
LABEL_19:
        objc_msgSend(v18, "options");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "sectionOptionFromModelOptions:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = objc_msgSend((id)objc_opt_class(), "destinationForPresetCategory:isPaired:", objc_msgSend(v18, "colorCategory"), v31);
        v38 = [AVTAvatarAttributeEditorColorSection alloc];
        objc_msgSend(v21, "colorsState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "variationStore");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v43) = objc_msgSend(v18, "alwaysShowExtended");
        v25 = -[AVTAvatarAttributeEditorColorSection initWithPrimaryItems:extendedItems:colorVariationStore:localizedName:identifier:intendedDestination:alwaysShowExtended:options:](v38, "initWithPrimaryItems:extendedItems:colorVariationStore:localizedName:identifier:intendedDestination:alwaysShowExtended:options:", v45, v46, v40, v49, v41, v51, v43, v37);

        v20 = v47;
        v19 = v48;
        goto LABEL_20;
      }
    }
    v49 = 0;
    goto LABEL_19;
  }
  v25 = 0;
LABEL_20:

  return v25;
}

+ (id)multicolorSectionProviderForCoreMulticolorPicker:(id)a3 platform:(unint64_t)a4 configuration:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 editingColors:(id)a8 colorDefaultsProvider:(id)a9 modelManager:(id)a10 previousSectionMap:(id)a11 pairingPickers:(id)a12
{
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v41;
  _BOOL4 v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL8 v90;
  void *v91;
  void *v92;
  AVTAvatarAttributeEditorMulticolorPickerSectionItem *v93;
  void *v94;
  void *v95;
  AVTAvatarAttributeEditorMulticolorPickerSectionItem *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  void *v118;
  void *v119;
  void *v120;
  _BOOL8 v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  AVTAvatarAttributeEditorMulticolorSectionProvider *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id obj;
  void *v140;
  id v142;
  id v143;
  void *v144;
  BOOL v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  id v155;
  id v156;
  void *v157;
  id v158;
  uint64_t v159;
  id v160;
  id v161;
  AVTAvatarAttributeEditorMulticolorSectionProvider *v162;
  id v163;
  void *v164;
  void *v165;
  uint64_t v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[4];
  id v177;
  id v178;
  uint64_t v179;
  BOOL v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v158 = a5;
  v156 = a6;
  v155 = a7;
  v154 = a8;
  v17 = v16;
  v163 = a9;
  v18 = a10;
  v143 = a11;
  v142 = a12;
  v19 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v17, "subpickers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v17, "subpickers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v17, "subpickers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v144 = v25;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "editorState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v26, "selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:", v27);

  objc_msgSend(v18, "editorState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:", v29);

  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  objc_msgSend(v17, "subpickers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v138 = v17;
  v151 = v18;
  v149 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v187, 16);
  if (!v149)
  {
    v135 = 0;
    v32 = a1;
    goto LABEL_78;
  }
  v135 = 0;
  v31 = 0;
  v147 = *(_QWORD *)v182;
  v148 = v30 + 1;
  v32 = a1;
  v159 = v30;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v182 != v147)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * v33);
      if (v31 < 1)
      {
        v36 = 0;
      }
      else
      {
        objc_msgSend(v17, "subpickers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v31 - 1);
        v36 = objc_claimAutoreleasedReturnValue();

      }
      v160 = (id)v36;
      objc_msgSend(v32, "selectedPresetForCoreModelColorsPicker:isEnabled:fallbackToColorsPicker:colorDefaultsProvider:modelManager:", v34, v31 <= v30, v36, v163, v18);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = AVTColorSettingKind(40, 0);
      v39 = v38;
      v41 = objc_msgSend(v34, "colorCategory") == 1 && objc_msgSend(v34, "destination") == 1 && v30 == 0;
      v43 = objc_msgSend(v34, "colorCategory") == 2 && objc_msgSend(v34, "destination") == 1 && v30 == 0;
      v166 = v31;
      if (v41 || v43)
      {
        v44 = v31 + 1;
        objc_msgSend(v17, "subpickers");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44 < objc_msgSend(v45, "count"))
        {
          objc_msgSend(v17, "subpickers");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectAtIndexedSubscript:", v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = v159;
          if (!v47)
            goto LABEL_30;
          v37 = objc_msgSend(v47, "destination");
          v39 = objc_msgSend(v47, "colorCategory");
          v45 = v47;
        }

      }
LABEL_30:
      LOBYTE(v132) = 0;
      objc_msgSend(v32, "sectionForModelColorsRow:selectedColorPreset:configuration:modelManager:additionalAvatarUpdateKind:imageProvider:colorLayerProvider:pairedCategory:destination:editingColors:displaysTitle:", v34, v164, v158, v18, v37, v39, v156, v155, 40, objc_msgSend(v34, "destination"), v154, v132);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v48)
      {
        v31 = v166;
        v63 = v160;
        goto LABEL_72;
      }
      objc_msgSend(v144, "addObject:", v48);
      v31 = v166;
      v145 = v166 > v30;
      objc_msgSend(v48, "sectionItems");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "indexOfObjectPassingTest:", &__block_literal_global_29);

      if (v50 == 0x7FFFFFFFFFFFFFFFLL)
        v51 = 0;
      else
        v51 = v50;
      objc_msgSend(v48, "sectionItems");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndexedSubscript:", v51);
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      if (v166 >= 1)
      {
        if (objc_msgSend(v34, "destination") == 1)
        {
          objc_msgSend(v18, "colorsState");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "variationStore");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "color");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "colorPresetFromColor:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v135, "color");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)objc_msgSend(v57, "copyForPairedCategory:", objc_msgSend(v34, "colorCategory"));
          v59 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v56, "variation");
          objc_msgSend(v59, "numberWithFloat:");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "colorsState");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          +[AVTAvatarUpdaterFactory updaterForColor:variationOverride:colorsState:pairedColors:additionalColor:saveToColorsState:](AVTAvatarUpdaterFactory, "updaterForColor:variationOverride:colorsState:pairedColors:additionalColor:saveToColorsState:", v58, v60, v61, 0, 0, 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v151;
        }
        else
        {
          +[AVTAvatarUpdaterFactory updaterForClearingColorsForCategory:destination:](AVTAvatarUpdaterFactory, "updaterForClearingColorsForCategory:destination:", objc_msgSend(v34, "colorCategory"), objc_msgSend(v34, "destination"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v64 = (void *)objc_msgSend(v62, "copy");
        v65 = (void *)MEMORY[0x1DF0D0754]();
        objc_msgSend(v137, "addObject:", v65);

        objc_msgSend(v18, "colorsState");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "selectedColorForCategory:destinationIndex:", objc_msgSend(v34, "colorCategory"), objc_msgSend(v34, "destination"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v163 && !v67)
        {
          objc_msgSend(v163, "defaultColorForCategory:destination:withConfiguration:", objc_msgSend(v34, "colorCategory"), AVTAvatarSettingColorIndexForColorDestination(objc_msgSend(v34, "destination")), v158);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v68;
          if (v68)
            v69 = v68;

        }
        if (!v67)
        {
          objc_msgSend(v17, "subpickers");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "objectAtIndexedSubscript:", v166 - 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "colorsState");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "selectedColorForCategory:destinationIndex:", objc_msgSend(v71, "colorCategory"), objc_msgSend(v71, "destination"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          v67 = (void *)objc_msgSend(v73, "copyForCategory:destination:", objc_msgSend(v34, "colorCategory"), objc_msgSend(v34, "destination"));
        }
        objc_msgSend(v18, "colorsState");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTAvatarUpdaterFactory updaterForColor:colorsState:pairedColors:additionalColor:saveToColorsState:](AVTAvatarUpdaterFactory, "updaterForColor:colorsState:pairedColors:additionalColor:saveToColorsState:", v67, v74, 0, 0, 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v157 = 0;
        if (v166 > v148)
        {
          v30 = v159;
          if (v75)
            goto LABEL_51;
        }
        else
        {
          v30 = v159;
          if (v166 > v159)
            v157 = (void *)MEMORY[0x1DF0D0754](v75);
          if (v75)
          {
LABEL_51:
            v76 = (void *)objc_msgSend(v75, "copy");
            v77 = (void *)MEMORY[0x1DF0D0754]();
            objc_msgSend(v133, "addObject:", v77);

            v30 = v159;
          }
        }

        v32 = a1;
        v31 = v166;
        goto LABEL_53;
      }
      v62 = 0;
      v157 = 0;
LABEL_53:
      v152 = v62;
      if (v31 <= v148)
      {
        v146 = v48;
        v78 = objc_msgSend(v17, "allowsRemoval");
        if (v31 > 0)
          v79 = v78;
        else
          v79 = 0;
        objc_msgSend(v17, "subtitles");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "subtitleFromSubtitles:forIndex:enabledIndex:", v80, v31, v159);
        v81 = v31;
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v83 = v159;
        v84 = v82;
        v85 = v17;
        v140 = v84;
        if (!v84)
        {
          if (v81 <= v159)
          {
            objc_msgSend(v34, "title");
            v84 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v86 = (void *)MEMORY[0x1E0CB3940];
            AVTAvatarUIBundle();
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("ADD_MULTICOLOR_FORMAT"), &stru_1EA5207B8, CFSTR("Localized"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "title");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "stringWithFormat:", v88, v89);
            v84 = (id)objc_claimAutoreleasedReturnValue();

            v83 = v159;
          }
          v85 = v138;
          v81 = v166;
        }
        v90 = v81 > v83;
        if ((_DWORD)v79)
          v91 = v152;
        else
          v91 = 0;
        v92 = (void *)MEMORY[0x1DF0D0754](v91);
        v93 = [AVTAvatarAttributeEditorMulticolorPickerSectionItem alloc];
        objc_msgSend(v146, "identifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "colorVariationStore");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v176[0] = MEMORY[0x1E0C809B0];
        v176[1] = 3221225472;
        v176[2] = __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke_2;
        v176[3] = &unk_1EA51FC60;
        v180 = v145;
        v177 = v151;
        v179 = v81;
        v178 = v85;
        v96 = -[AVTAvatarAttributeEditorMulticolorPickerSectionItem initWithIdentifier:localizedName:isPlaceholder:isRemovable:colorItem:variationStore:avatarUpdater:editorStateUpdater:removalUpdater:](v93, "initWithIdentifier:localizedName:isPlaceholder:isRemovable:colorItem:variationStore:avatarUpdater:editorStateUpdater:removalUpdater:", v94, v84, v90, v79, v153, v95, v157, v176, v92);

        -[AVTAvatarAttributeEditorMulticolorPickerSectionItem setSelected:](v96, "setSelected:", v81 == v134);
        objc_msgSend(v136, "addObject:", v96);
        if (v81
          || (objc_msgSend(v144, "objectAtIndexedSubscript:", 0),
              v97 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v97, "sectionItems"),
              v98 = (void *)objc_claimAutoreleasedReturnValue(),
              v99 = objc_msgSend(v98, "indexOfObjectPassingTest:", &__block_literal_global_21),
              v98,
              v97,
              v99 == 0x7FFFFFFFFFFFFFFFLL))
        {
          v17 = v138;
          v32 = a1;
          v18 = v151;
          v30 = v159;
          v48 = v146;
        }
        else
        {
          v48 = v146;
          objc_msgSend(v146, "sectionItems");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "objectAtIndexedSubscript:", v99);
          v101 = objc_claimAutoreleasedReturnValue();

          v135 = (void *)v101;
          v17 = v138;
          v32 = a1;
          v18 = v151;
          v30 = v159;
        }

        v31 = v166 + 1;
      }
      v63 = v160;

LABEL_72:
      ++v33;
    }
    while (v149 != v33);
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v187, 16);
    v149 = v102;
  }
  while (v102);
LABEL_78:

  v103 = v144;
  if (objc_msgSend(v144, "count"))
  {
    v104 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v17, "nestedPresetPickers");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "dictionaryWithCapacity:", objc_msgSend(v105, "count"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "nestedPresetPickers");
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v167 = (id)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v172, v186, 16);
    if (v106)
    {
      v107 = v106;
      v161 = *(id *)v173;
      do
      {
        for (i = 0; i != v107; ++i)
        {
          if (*(id *)v173 != v161)
            objc_enumerationMutation(v167);
          v109 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i);
          objc_msgSend(v167, "objectForKeyedSubscript:", v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "sectionProvidersForCoreModelCategory:platform:modelManager:pairingPickers:editingColors:colorDefaultsProvider:previousSectionMap:imageProvider:colorLayerProvider:stickerRenderer:configuration:displayConditionEvaluator:", v110, a4, v18, v142, v154, v163, v143, v156, v155, 0, v158, 0);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = 0u;
          v169 = 0u;
          v170 = 0u;
          v171 = 0u;
          v113 = v111;
          v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v168, v185, 16);
          if (v114)
          {
            v115 = v114;
            v116 = *(_QWORD *)v169;
            do
            {
              for (j = 0; j != v115; ++j)
              {
                if (*(_QWORD *)v169 != v116)
                  objc_enumerationMutation(v113);
                objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * j), "sections");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "addObjectsFromArray:", v118);

              }
              v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v168, v185, 16);
            }
            while (v115);
          }

          objc_msgSend(v165, "setObject:forKeyedSubscript:", v112, v109);
          v32 = a1;
          v18 = v151;
        }
        v107 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v172, v186, 16);
      }
      while (v107);
    }
    objc_msgSend(v18, "editorState");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v138;
    objc_msgSend(v138, "identifier");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v119, "enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:", v120) > 0;

    v122 = v137;
    +[AVTAvatarUpdaterFactory updaterForAggregatingUpdaters:](AVTAvatarUpdaterFactory, "updaterForAggregatingUpdaters:", v137);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarUpdaterFactory updaterForAggregatingUpdaters:](AVTAvatarUpdaterFactory, "updaterForAggregatingUpdaters:", v133);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarAttributeEditorSectionSupplementalPicker pickerForMulticolorPicker:isMultipleSelected:switchToSingleColorAvatarUpdater:switchToMultipleColorAvatarUpdater:](AVTAvatarAttributeEditorSectionSupplementalPicker, "pickerForMulticolorPicker:isMultipleSelected:switchToSingleColorAvatarUpdater:switchToMultipleColorAvatarUpdater:", v138, v121, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v144;
    if (v125)
    {
      objc_msgSend(v144, "objectAtIndexedSubscript:", 0);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "setSupplementalPicker:", v125);

    }
    v127 = [AVTAvatarAttributeEditorMulticolorSectionProvider alloc];
    objc_msgSend(v138, "identifier");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "title");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v136;
    v162 = -[AVTAvatarAttributeEditorMulticolorSectionProvider initWithIdentifier:localizedName:subpickers:subpickerRemovalUpdaters:nestedPresetPickers:supplementalPicker:pickerItems:editorState:](v127, "initWithIdentifier:localizedName:subpickers:subpickerRemovalUpdaters:nestedPresetPickers:supplementalPicker:pickerItems:editorState:", v128, v129, v144, v137, v165, v125, v136, v119);

  }
  else
  {
    v162 = 0;
    v130 = v136;
    v122 = v137;
  }

  return v162;
}

uint64_t __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

void __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "editorState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabledMulticolorSubpickersIndex:forMulticolorPickerIdentifier:", v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "editorState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedMulticolorSubpickersIndex:forMulticolorPickerIdentifier:", v5, v6);

}

uint64_t __228__AVTAvatarAttributeEditorModelBuilder_multicolorSectionProviderForCoreMulticolorPicker_platform_configuration_imageProvider_colorLayerProvider_editingColors_colorDefaultsProvider_modelManager_previousSectionMap_pairingPickers___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

+ (id)subtitleFromSubtitles:(id)a3 forIndex:(int64_t)a4 enabledIndex:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)selectedPresetForCoreModelColorsPicker:(id)a3 isEnabled:(BOOL)a4 fallbackToColorsPicker:(id)a5 colorDefaultsProvider:(id)a6 modelManager:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v40;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v14, "colorsState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v11, "colorCategory"), objc_msgSend(v11, "destination"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "colorsState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v12, "colorCategory"), objc_msgSend(v12, "destination"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 && v10)
  {
    v40 = v13;
    v19 = objc_msgSend(v11, "destination");
    v20 = objc_msgSend(v11, "colorCategory");
    objc_msgSend(v14, "avatarConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorPresetForSettingKind:", v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorPreset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqual:", v25) & 1) != 0)
    {
      objc_msgSend(v18, "variation");
      v27 = v26;
      objc_msgSend(v22, "colorPreset");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "variation");
      v30 = v29;

      if (v27 == v30)
      {
        v16 = 0;
LABEL_8:
        v13 = v40;

        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v22, "colorPreset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  if (!v16 && v10)
  {
    v31 = objc_msgSend(v11, "colorCategory");
    v32 = AVTAvatarSettingColorIndexForColorDestination(objc_msgSend(v11, "destination"));
    objc_msgSend(v14, "avatarConfiguration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultColorPresetForCategory:destination:withConfiguration:", v31, v32, v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v12 && !v16)
  {
    objc_msgSend(v14, "colorsState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "selectedColorPresetForCategory:destinationIndex:", objc_msgSend(v12, "colorCategory"), objc_msgSend(v12, "destination"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0D00660];
    objc_msgSend(v35, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v11, "colorCategory");
    objc_msgSend(v35, "variation");
    objc_msgSend(v36, "colorPresetWithName:category:variation:", v37, v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

+ (id)sectionColorItemsForColors:(id)a3 selectedPreset:(id)a4 configuration:(id)a5 modelManager:(id)a6 additionalUpdateKind:(id)a7 imageProvider:(id)a8 colorLayerProvider:(id)a9 pairedCategory:(int64_t)a10 editingColors:(id)a11
{
  id v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AVTAvatarAttributeEditorSectionColorItem *v31;
  uint64_t v33;
  int64_t var0;
  id obj;
  uint64_t v36;
  int64_t var1;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  char v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  var1 = a7.var1;
  var0 = a7.var0;
  v53 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v43 = a4;
  v42 = a5;
  v46 = a6;
  v40 = a8;
  v39 = a9;
  v38 = a11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v14;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v44)
  {
    v36 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v48 != v36)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v46, "colorsState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "variationStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "colorPresetFromColor:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = AVTColorSettingKind(0, 0);
        objc_msgSend(v42, "colorPresetForSettingKind:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "colorPreset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v19, "isEqual:", v43);
        v24 = 0;
        if (a10 != 40)
        {
          v25 = (void *)objc_msgSend(v16, "copyForPairedCategory:", a10);
          v51 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (var1 == 40)
        {
          v26 = 0;
          v27 = v38;
        }
        else
        {
          objc_msgSend(v19, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v38;
          objc_msgSend(v38, "colorForSettingKind:identifier:", var0, var1, v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v46, "colorsState");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTAvatarUpdaterFactory updaterForColor:colorsState:pairedColors:additionalColor:](AVTAvatarUpdaterFactory, "updaterForColor:colorsState:pairedColors:additionalColor:", v16, v29, v24, v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v33) = v45;
        v31 = -[AVTAvatarAttributeEditorSectionColorItem initWithColor:skinColor:imageProvider:colorLayerProvider:avatarUpdater:derivedColorDependent:selected:]([AVTAvatarAttributeEditorSectionColorItem alloc], "initWithColor:skinColor:imageProvider:colorLayerProvider:avatarUpdater:derivedColorDependent:selected:", v16, v23, v40, v39, v30, objc_msgSend(v27, "colorHasDerivedColorDependency:", v16), v33);
        objc_msgSend(v41, "addObject:", v31);

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v44);
  }

  return v41;
}

+ (id)sectionForModelRow:(id)a3 fromModelPresets:(id)a4 selectedModelPreset:(id)a5 tagSelection:(id)a6 fixedTags:(id)a7 availableTags:(id)a8 category:(int64_t)a9 imageProvider:(id)a10 stickerRenderer:(id)a11 configuration:(id)a12 previousSection:(id)a13 pairedCategory:(int64_t)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  AVTAvatarAttributeEditorSectionItem *v62;
  void *v63;
  void *v64;
  AVTAvatarAttributeEditorSectionItem *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  AVTAvatarAttributeEditorSection *v73;
  void *v74;
  AVTAvatarAttributeEditorSection *v75;
  uint64_t v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  id obj;
  id v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  _QWORD v98[5];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v93 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v86 = a10;
  v88 = a11;
  v92 = a12;
  v24 = a13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "representedTags");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "options");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v21;
  v83 = v20;
  v80 = v23;
  v81 = v22;
  objc_msgSend(a1, "filterPresets:forRowRepresentingTags:currentTagSelection:fixedTags:availableTags:sortingOption:", v20, v26, v21, v22, v23, objc_msgSend(v27, "sortingOption"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v24, "sectionItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v79 = v24;
  objc_msgSend(v24, "sectionItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v104 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        objc_msgSend(v36, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setObject:forKeyedSubscript:", v36, v37);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
    }
    while (v33);
  }

  objc_msgSend((id)objc_opt_class(), "framingModeForRow:selectedPreset:", v19, v93);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = a14;
  if (a14 == 40)
  {
    v78 = 0;
  }
  else
  {
    objc_msgSend(v19, "pairing");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v39 != 0;

  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v28;
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
  if (v94)
  {
    v89 = *(_QWORD *)v100;
    v90 = v25;
    v91 = v19;
    do
    {
      for (j = 0; j != v94; ++j)
      {
        if (*(_QWORD *)v100 != v89)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
        objc_msgSend(v41, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "objectForKeyedSubscript:", v42);
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "options");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stickerConfiguration");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "options");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "presetOverrides");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "options");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v44)
        {
          objc_msgSend(v47, "stickerConfiguration");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "scheduledStickerResourceProviderForThumbnailForModelPreset:presetOverrides:avatarConfiguration:stickerConfiguration:correctClipping:", v41, v46, v92, v49, 0);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
        }
        else
        {
          objc_msgSend(v47, "poseOverride");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "providerForThumbnailForModelPreset:presetOverrides:poseOverride:avatarConfiguration:framingMode:", v41, v46, v49, v92, v85);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = 0;
        }

        objc_msgSend(v41, "identifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "identifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v51, "isEqual:", v52);

        objc_msgSend(v19, "options");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "framingMode");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTRenderingScope thumbnailHeightRatioForFramingMode:](AVTRenderingScope, "thumbnailHeightRatioForFramingMode:", v55);
        v57 = v56;

        if (v38 == 40)
          v58 = 0;
        else
          v58 = (void *)objc_msgSend(v41, "copyForPairedCategory:", v38);
        +[AVTAvatarUpdaterFactory updaterForPreset:pairedPreset:](AVTAvatarUpdaterFactory, "updaterForPreset:pairedPreset:", v41, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __217__AVTAvatarAttributeEditorModelBuilder_sectionForModelRow_fromModelPresets_selectedModelPreset_tagSelection_fixedTags_availableTags_category_imageProvider_stickerRenderer_configuration_previousSection_pairedCategory___block_invoke;
        v98[3] = &unk_1EA51FCA8;
        v98[4] = v41;
        v60 = (void *)MEMORY[0x1DF0D0754](v98);
        if (v38 == 40)
          objc_msgSend(v41, "localizedName");
        else
          objc_msgSend(v41, "localizedPairedName");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = [AVTAvatarAttributeEditorSectionItem alloc];
        objc_msgSend(v41, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(v60, "copy");
        LOBYTE(v77) = v53;
        v65 = -[AVTAvatarAttributeEditorSectionItem initWithIdentifier:localizedName:thumbnailProvider:stickerResourceProvider:presetResourcesProvider:avatarUpdater:heightRatio:selected:](v62, "initWithIdentifier:localizedName:thumbnailProvider:stickerResourceProvider:presetResourcesProvider:avatarUpdater:heightRatio:selected:", v63, v61, v50, v97, v64, v59, v57, v77);

        objc_msgSend(v95, "cachedThumbnail");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          objc_msgSend(v95, "cachedThumbnail");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTAvatarAttributeEditorSectionItem setCachedThumbnail:](v65, "setCachedThumbnail:", v67);

        }
        v25 = v90;
        objc_msgSend(v90, "addObject:", v65);

        v19 = v91;
        v38 = a14;
      }
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
    }
    while (v94);
  }

  if (v78)
  {
    objc_msgSend(v19, "pairing");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedPairedTitle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v19, "title");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "options");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sectionOptionFromModelOptions:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v25, "count") < 2)
  {
    v75 = 0;
  }
  else
  {
    v72 = objc_msgSend((id)objc_opt_class(), "destinationForPresetCategory:isPaired:", a9, v78);
    v73 = [AVTAvatarAttributeEditorSection alloc];
    objc_msgSend(v19, "identifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[AVTAvatarAttributeEditorSection initWithSectionItems:localizedName:identifier:intendedDestination:options:](v73, "initWithSectionItems:localizedName:identifier:intendedDestination:options:", v25, v69, v74, v72, v71);

  }
  return v75;
}

AVTPresetResources *__217__AVTAvatarAttributeEditorModelBuilder_sectionForModelRow_fromModelPresets_selectedModelPreset_tagSelection_fixedTags_availableTags_category_imageProvider_stickerRenderer_configuration_previousSection_pairedCategory___block_invoke(uint64_t a1)
{
  AVTPresetResources *v2;
  void *v3;
  AVTPresetResources *v4;

  v2 = [AVTPresetResources alloc];
  objc_msgSend(*(id *)(a1 + 32), "preset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTPresetResources initWithPreset:](v2, "initWithPreset:", v3);

  return v4;
}

+ (unint64_t)sectionDisplayModeForCoreModelDisplayMode:(unint64_t)a3
{
  return a3 == 1;
}

+ (id)framingModeForRow:(id)a3 selectedPreset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  int v21;
  void *v23;
  void *v24;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "framingMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "framingModeOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v9, "orderedTags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v23 = v9;
      v24 = v7;
      v25 = v5;
      v13 = 0;
      v14 = *(_QWORD *)v29;
      v15 = -1;
      v16 = 1;
      do
      {
        v17 = v10;
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v17);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v27, "tags");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(a1, "scoreForTags:forCombination:currentSelection:", v19, v19, v20);

          if (v21 > v16)
          {
            v16 = v21;
            v15 = v13 + i;
          }
        }
        v13 += v12;
        v10 = v17;
        v12 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);

      v5 = v25;
      if (v15 < 0)
      {
        v9 = v23;
        v7 = v24;
        goto LABEL_15;
      }
      v9 = v23;
      objc_msgSend(v23, "orderedFramingModeOverrides");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_15:

  return v7;
}

+ (id)filterPresets:(id)a3 forRowRepresentingTags:(id)a4 currentTagSelection:(id)a5 fixedTags:(id)a6 availableTags:(id)a7 sortingOption:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  id v41;
  id obj;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v15;
    v39 = v18;
    objc_msgSend(a1, "tagCombinationsForTagNames:availableTags:", v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v16;
    if (v16)
      v20 = v16;
    else
      v20 = (void *)MEMORY[0x1E0C9AA70];
    v52 = (void *)objc_msgSend(v20, "mutableCopy");
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v19;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v48)
    {
      v44 = *(_QWORD *)v58;
      v45 = a8;
      v46 = v17;
      v47 = v14;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v58 != v44)
            objc_enumerationMutation(obj);
          v50 = v21;
          v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v21);
          v23 = objc_msgSend(v22, "mutableCopy");
          objc_msgSend(a1, "setTags:onMutableTagSet:", v17, v23);
          v49 = (void *)v23;
          objc_msgSend(a1, "filterPresets:matchingTagValues:sortedUsing:", v14, v23, a8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v51 = v24;
          v26 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = *(_QWORD *)v54;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v54 != v29)
                  objc_enumerationMutation(v51);
                v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                objc_msgSend(v31, "tags");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = a1;
                v34 = objc_msgSend(a1, "scoreForTags:forCombination:currentSelection:", v32, v22, v52);

                if (v34 > v28)
                {
                  v35 = v31;

                  v28 = v34;
                  v25 = v35;
                }
                a1 = v33;
              }
              v27 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
            }
            while (v27);
          }

          if (v25 && (objc_msgSend(v43, "containsObject:", v25) & 1) == 0)
          {
            objc_msgSend(v43, "addObject:", v25);
            objc_msgSend(v25, "tags");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "addTags:toMutableTagSet:", v36, v52);

          }
          v21 = v50 + 1;
          v14 = v47;
          a8 = v45;
          v17 = v46;
        }
        while (v50 + 1 != v48);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v48);
    }

    v37 = (void *)objc_msgSend(v43, "copy");
    v16 = v40;
    v15 = v41;
    v18 = v39;
  }
  else
  {
    objc_msgSend(a1, "filterPresets:matchingTagValues:sortedUsing:", v14, v17, a8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v37;
}

+ (id)tagCombinationsForTagNames:(id)a3 availableTags:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "removeObjectsInRange:", 0, 1);
    v28 = v10;
    v11 = (void *)objc_msgSend(v10, "copy");
    v29 = v7;
    objc_msgSend(a1, "tagCombinationsForTagNames:availableTags:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v12;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v41;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(obj);
          v35 = v13;
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v15 = v33;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v37;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v37 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v19);
                v21 = (void *)objc_msgSend(v14, "mutableCopy");
                objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v8);

                objc_msgSend(v9, "addObject:", v21);
                if (objc_msgSend(v14, "count"))
                {
                  v23 = (void *)MEMORY[0x1E0C99D80];
                  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v20);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "dictionaryWithObject:forKey:", v24, v8);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v9, "addObject:", v25);
                }

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v17);
          }

          if (objc_msgSend(v14, "count"))
            objc_msgSend(v9, "addObject:", v14);
          v13 = v35 + 1;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v34);
    }

    v26 = (void *)objc_msgSend(v9, "copy");
    v7 = v29;
    v6 = v30;
  }
  else
  {
    v26 = &unk_1EA571B80;
  }

  return v26;
}

+ (id)tagSetByRemovingTagNames:(id)a3 fromTagSet:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(v6, "copy");
  return v12;
}

+ (id)filterPresets:(id)a3 matchingTagValues:(id)a4 sortedUsing:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v37;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v29 = v7;
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v31, "allKeys");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v30);
              v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
              objc_msgSend(v8, "tags");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v13);
              v15 = objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = (void *)v15;
                objc_msgSend(v8, "tags");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", v13);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v13);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "intersectsOrderedSet:", v19);

                if (!v20)
                {

                  goto LABEL_18;
                }
              }
              else
              {

              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v10);
        }

        objc_msgSend(a1, "insertPreset:intoList:forSortingOption:", v8, v25, a5);
LABEL_18:
        v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v28);
  }

  v21 = (void *)objc_msgSend(v25, "copy");
  return v21;
}

+ (void)insertPreset:(id)a3 intoList:(id)a4 forSortingOption:(unint64_t)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (a5 == 1 || a5 == 2 && objc_msgSend(v8, "isDefaultPreset"))
    objc_msgSend(v7, "insertObject:atIndex:", v8, 0);
  else
    objc_msgSend(v7, "addObject:", v8);

}

+ (int)scoreForTags:(id)a3 forCombination:(id)a4 currentSelection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(a4, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v10)
  {
LABEL_19:

    goto LABEL_20;
  }
  v11 = 0;
  v12 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 != 0;

      v11 |= v15;
    }
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  }
  while (v10);

  if ((v11 & 1) != 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "allKeys", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      LODWORD(v10) = 1;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v9);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v7, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          objc_msgSend(v8, "objectForKeyedSubscript:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "intersectOrderedSet:", v23);

          v10 = objc_msgSend(v22, "count") + (int)v10;
        }
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v17);
    }
    else
    {
      LODWORD(v10) = 1;
    }
    goto LABEL_19;
  }
  LODWORD(v10) = 0;
LABEL_20:

  return v10;
}

+ (void)addTags:(id)a3 toMutableTagSet:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AVTAvatarAttributeEditorModelBuilder_addTags_toMutableTagSet___block_invoke;
  v7[3] = &unk_1EA51E5B0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __64__AVTAvatarAttributeEditorModelBuilder_addTags_toMutableTagSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

+ (void)setTags:(id)a3 onMutableTagSet:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__AVTAvatarAttributeEditorModelBuilder_setTags_onMutableTagSet___block_invoke;
  v7[3] = &unk_1EA51E5B0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __64__AVTAvatarAttributeEditorModelBuilder_setTags_onMutableTagSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

+ (id)tagSetForTagNames:(id)a3 inTagSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

+ (id)firstColorSectionInSections:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_36);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __68__AVTAvatarAttributeEditorModelBuilder_firstColorSectionInSections___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)sectionOptionFromModelOptions:(id)a3
{
  id v4;
  uint64_t v5;
  AVTAvatarAttributeEditorSectionOptions *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AVTAvatarAttributeEditorSectionOptions *v12;

  v4 = a3;
  v5 = objc_msgSend(a1, "sectionDisplayModeForCoreModelDisplayMode:", objc_msgSend(v4, "displayMode"));
  v6 = [AVTAvatarAttributeEditorSectionOptions alloc];
  objc_msgSend(v4, "framingMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poseOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presetOverrides");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "showsLabel");

  v12 = -[AVTAvatarAttributeEditorSectionOptions initWithFramingMode:poseOverride:presetOverrides:displayMode:stickerConfiguration:showsLabel:](v6, "initWithFramingMode:poseOverride:presetOverrides:displayMode:stickerConfiguration:showsLabel:", v7, v8, v9, v5, v10, v11);
  return v12;
}

@end
