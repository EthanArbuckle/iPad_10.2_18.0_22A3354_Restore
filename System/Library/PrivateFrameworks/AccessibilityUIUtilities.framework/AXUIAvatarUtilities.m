@implementation AXUIAvatarUtilities

+ (BOOL)avatarFrameworksArePresent
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CF3908]);

  if ((v4 & 1) != 0)
    return 0;
  if (!AvatarKitLibraryCore_frameworkLibrary)
    AvatarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary)
    return 0;
  if (!AvatarUILibraryCore_frameworkLibrary)
    AvatarUILibraryCore_frameworkLibrary = _sl_dlopen();
  return AvatarUILibraryCore_frameworkLibrary != 0;
}

+ (void)performValidations
{
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = AXPerformValidationChecks();
  v4 = MEMORY[0x1E0C809B0];
  if (v3 && objc_msgSend(a1, "avatarFrameworksArePresent"))
  {
    getAVTAnimojiClass();
    objc_opt_class();
    getAVTPresetClass();
    objc_opt_class();
    getAVTColorPresetClass();
    objc_opt_class();
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v5 = (void *)getAVTAvatarPuppetRecordClass_softClass;
    v13 = getAVTAvatarPuppetRecordClass_softClass;
    if (!getAVTAvatarPuppetRecordClass_softClass)
    {
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __getAVTAvatarPuppetRecordClass_block_invoke;
      v9[3] = &unk_1E76AB358;
      v9[4] = &v10;
      __getAVTAvatarPuppetRecordClass_block_invoke((uint64_t)v9);
      v5 = (void *)v11[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v10, 8);
    objc_opt_class();
  }
  objc_msgSend(MEMORY[0x1E0CF3A08], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __41__AXUIAvatarUtilities_performValidations__block_invoke;
  v8[3] = &__block_descriptor_40_e29_B16__0__AXValidationManager_8l;
  v8[4] = a1;
  objc_msgSend(v7, "performValidations:withPreValidationHandler:postValidationHandler:", v8, &__block_literal_global_5, 0);

}

uint64_t __41__AXUIAvatarUtilities_performValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "avatarFrameworksArePresent"))
  {
    objc_msgSend(v3, "validateClass:", CFSTR("AVTAnimoji"));
    objc_msgSend(v3, "validateClass:", CFSTR("AVTPreset"));
    objc_msgSend(v3, "validateClass:", CFSTR("AVTColorPreset"));
    objc_msgSend(v3, "validateClass:", CFSTR("AVTAvatarPuppetRecord"));
    objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AVTAvatarPuppetRecord"), CFSTR("AVTAvatarRecord"));
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarPuppetRecord"), CFSTR("puppetName"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarRecord"), CFSTR("avatarData"), "@", 0);
    objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVTAvatarRecord"), CFSTR("isEditable"));
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTStickerConfiguration"), CFSTR("localizedName"), "@", 0);
  }

  return 1;
}

uint64_t __41__AXUIAvatarUtilities_performValidations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AXUIAvatarUtilities"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AXUIAvatarUtilities"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

+ (id)descriptionForAvatarWithRecord:(id)a3 includeVideoPrefix:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v17;
  id v18;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(a1, "avatarFrameworksArePresent"))
  {
    if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("isEditable")))
    {
      objc_msgSend(v6, "safeValueForKey:", CFSTR("avatarData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = 0;
        objc_msgSend(getAVTMemojiClass(), "avatarWithDataRepresentation:error:", v7, &v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        if (v9)
        {
          _AXLogWithFacility();
        }
        else
        {
          getAVTMemojiClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "descriptionForMemoji:", v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v4)
              v15 = CFSTR("memoji.video.description");
            else
              v15 = CFSTR("starfish.avatar");
            AXUILocalizedStringForKey(v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            __AXStringForVariables();
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
        }
        v10 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v6, "safeStringForKey:", CFSTR("puppetName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(getAVTAnimojiClass(), "animojiNamed:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "descriptionForAnimoji:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          AXUILocalizedStringForKey(CFSTR("animoji.video.description"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __AXStringForVariables();
          v13 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v13;
        }

        goto LABEL_17;
      }
    }
    v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

+ (id)descriptionForAnimoji:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (getAVTAnimojiClass())
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("animoji.name.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXUILocalizedStringForKey(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AXLogWithFacility();
    v7 = 0;
  }

  return v7;
}

+ (id)descriptionForMemoji:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v3 = a3;
  if (getAVTColorPresetClass() && getAVTPresetClass() && getAVTMemojiClass() && getAVTAnimojiClass())
  {
    objc_msgSend(v3, "colorPresetForCategory:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedName");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorPresetForCategory:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedName");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presetForCategory:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v6;
    objc_msgSend((id)v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v8, "isEqualToString:", CFSTR("none"));

    objc_msgSend(v3, "colorPresetForCategory:", 7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorPresetForCategory:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presetForCategory:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorPresetForCategory:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presetForCategory:", 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presetForCategory:", 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorPresetForCategory:", 32);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    if ((v6 & 1) != 0)
    {
      AXUILocalizedStringForKey(CFSTR("memoji.description.no.hair"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v4, v7, v5, v9);
    }
    else
    {
      AXUILocalizedStringForKey(CFSTR("memoji.description.basic"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v4, v5, v7, v9);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v5;

    v16 = (void *)v4;
    if (objc_msgSend(v45, "hasComponent"))
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      AXUILocalizedStringForKey(CFSTR("memoji.description.facialhair"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v18, v46, v43);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
    }
    if (objc_msgSend(v44, "hasComponent", v27, v30))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      AXUILocalizedStringForKey(CFSTR("memoji.description.headwear"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v21, v42, v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v22 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v22;
    }
    v23 = (void *)v40;
    if (objc_msgSend(v10, "hasComponent", v28, v31))
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      AXUILocalizedStringForKey(CFSTR("memoji.description.facewear"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v25, v11, v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      __AXStringForVariables();
      v26 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v26;
      v23 = (void *)v40;
    }

  }
  else
  {
    _AXLogWithFacility();
    v14 = 0;
  }

  return v14;
}

+ (id)customContentForAvatarWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v4 = a3;
  if (objc_msgSend(a1, "avatarFrameworksArePresent")
    && objc_msgSend(v4, "safeBoolForKey:", CFSTR("isEditable")))
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("avatarData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v10 = 0;
    objc_msgSend(getAVTMemojiClass(), "avatarWithDataRepresentation:error:", v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v7)
    {
      _AXLogWithFacility();
    }
    else
    {
      getAVTMemojiClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "customContentForMemoji:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

+ (id)customContentForMemoji:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  const __CFString *v18;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (getAVTColorPresetClass() && getAVTPresetClass() && getAVTMemojiClass() && getAVTAnimojiClass())
  {
    for (i = 0; i != 40; ++i)
    {
      if ((objc_msgSend(a1, "_shouldSkipPresetCategory:", i, v17, v18) & 1) == 0)
      {
        objc_msgSend(v4, "presetForCategory:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "hasComponent"))
        {
          objc_msgSend(a1, "_axStringForPresetCategory:", i);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "colorPresetForCategory:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v17 = v11;
            v18 = CFSTR("__AXStringForVariablesSentinel");
            __AXStringForVariables();
            v12 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v12;
          }
          if (v8 && v9)
          {
            v13 = (void *)MEMORY[0x1E0C8EDE0];
            AXUILocalizedStringForKey(v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "customContentWithLabel:value:", v14, v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "addObject:", v15);
          }

        }
      }
    }
  }
  else
  {
    _AXLogWithFacility();
  }

  return v5;
}

+ (BOOL)_shouldSkipPresetCategory:(int64_t)a3
{
  return a3 == 40;
}

+ (id)_axStringForPresetCategory:(int64_t)a3
{
  char v4;
  id result;

  v4 = objc_msgSend(a1, "_shouldSkipPresetCategory:");
  result = 0;
  if ((unint64_t)a3 <= 0x23 && (v4 & 1) == 0)
    return off_1E76ABA38[a3];
  return result;
}

@end
