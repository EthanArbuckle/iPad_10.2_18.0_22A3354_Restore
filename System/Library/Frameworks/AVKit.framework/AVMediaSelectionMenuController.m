@implementation AVMediaSelectionMenuController

- (AVMediaSelectionMenuController)initWithAudibleOptions:(id)a3 legibleOptions:(id)a4
{
  return -[AVMediaSelectionMenuController initWithAudibleOptions:legibleOptions:enhanceDialogueOptions:](self, "initWithAudibleOptions:legibleOptions:enhanceDialogueOptions:", a3, a4, 0);
}

- (AVMediaSelectionMenuController)initWithAudibleOptions:(id)a3 legibleOptions:(id)a4 enhanceDialogueOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVMediaSelectionMenuController *v11;
  uint64_t v12;
  NSArray *audibleOptions;
  uint64_t v14;
  NSArray *enhanceDialogueOptions;
  uint64_t v16;
  NSArray *legibleOptions;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVMediaSelectionMenuController;
  v11 = -[AVMediaSelectionMenuController init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    audibleOptions = v11->_audibleOptions;
    v11->_audibleOptions = (NSArray *)v12;

    v14 = objc_msgSend(v10, "copy");
    enhanceDialogueOptions = v11->_enhanceDialogueOptions;
    v11->_enhanceDialogueOptions = (NSArray *)v14;

    v16 = objc_msgSend(v9, "copy");
    legibleOptions = v11->_legibleOptions;
    v11->_legibleOptions = (NSArray *)v16;

    v11->_currentAudibleOptionIndex = 0;
    v11->_currentEnhanceDialogueOption = 0;
    v11->_currentLegibleOptionIndex = 0;
    -[AVMediaSelectionMenuController _reloadAudibleOptionsMenu]((uint64_t)v11);
    -[AVMediaSelectionMenuController _reloadLegibleOptionsMenu]((void **)&v11->super.isa);
  }

  return v11;
}

- (void)setAudibleOptions:(id)a3
{
  NSArray *v4;
  NSArray *audibleOptions;

  if (self->_audibleOptions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    audibleOptions = self->_audibleOptions;
    self->_audibleOptions = v4;

    -[AVMediaSelectionMenuController _reloadAudibleOptionsMenu]((uint64_t)self);
  }
}

- (void)setEnhanceDialogueOptions:(id)a3
{
  NSArray *v4;
  NSArray *enhanceDialogueOptions;

  if (self->_enhanceDialogueOptions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    enhanceDialogueOptions = self->_enhanceDialogueOptions;
    self->_enhanceDialogueOptions = v4;

    -[AVMediaSelectionMenuController _reloadAudibleOptionsMenu]((uint64_t)self);
  }
}

- (void)setLegibleOptions:(id)a3
{
  NSArray *v4;
  NSArray *legibleOptions;

  if (self->_legibleOptions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    legibleOptions = self->_legibleOptions;
    self->_legibleOptions = v4;

    -[AVMediaSelectionMenuController _reloadLegibleOptionsMenu]((void **)&self->super.isa);
  }
}

- (void)setCurrentAudibleOptionIndex:(unint64_t)a3
{
  if (self->_currentAudibleOptionIndex != a3)
  {
    self->_currentAudibleOptionIndex = a3;
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)self, self->_audioTrackMenu, a3);
  }
}

- (void)setCurrentEnhanceDialogueOption:(int64_t)a3
{
  if (self->_currentEnhanceDialogueOption != a3)
  {
    self->_currentEnhanceDialogueOption = a3;
    -[AVMediaSelectionMenuController _updateSelectionForEnhanceDialogueMenu]((void **)&self->super.isa);
    -[AVMediaSelectionMenuController _updateSubtitleForEnhanceDialogueMenu]((id *)&self->super.isa);
  }
}

- (void)setCurrentLegibleOptionIndex:(unint64_t)a3
{
  if (self->_currentLegibleOptionIndex != a3)
  {
    self->_currentLegibleOptionIndex = a3;
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)self, self->_legibleOptionsMenu, a3);
  }
}

- (void)setShouldEnableEnhanceDialogueOptions:(BOOL)a3
{
  if (self->_shouldEnableEnhanceDialogueOptions != a3)
  {
    self->_shouldEnableEnhanceDialogueOptions = a3;
    -[AVMediaSelectionMenuController _updateEnablementForMenu:enabled:]((uint64_t)self, self->_enhanceDialogueMenu, a3);
  }
}

- (UIMenu)audibleOptionsMenu
{
  return self->_audibleOptionsMenu;
}

- (UIMenu)audibleOptionsOverflowMenu
{
  return self->_audibleOptionsOverflowMenu;
}

- (UIMenu)legibleOptionsMenu
{
  return self->_legibleOptionsMenu;
}

- (NSArray)audibleOptions
{
  return self->_audibleOptions;
}

- (NSArray)enhanceDialogueOptions
{
  return self->_enhanceDialogueOptions;
}

- (NSArray)legibleOptions
{
  return self->_legibleOptions;
}

- (unint64_t)currentAudibleOptionIndex
{
  return self->_currentAudibleOptionIndex;
}

- (int64_t)currentEnhanceDialogueOption
{
  return self->_currentEnhanceDialogueOption;
}

- (unint64_t)currentLegibleOptionIndex
{
  return self->_currentLegibleOptionIndex;
}

- (BOOL)shouldEnableEnhanceDialogueOptions
{
  return self->_shouldEnableEnhanceDialogueOptions;
}

- (AVMediaSelectionMenuDelegate)delegate
{
  return (AVMediaSelectionMenuDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibleOptions, 0);
  objc_storeStrong((id *)&self->_enhanceDialogueOptions, 0);
  objc_storeStrong((id *)&self->_audibleOptions, 0);
  objc_storeStrong((id *)&self->_legibleOptionsMenu, 0);
  objc_storeStrong((id *)&self->_enhanceDialogueMenu, 0);
  objc_storeStrong((id *)&self->_audioTrackMenu, 0);
  objc_storeStrong((id *)&self->_audibleOptionsOverflowMenu, 0);
  objc_storeStrong((id *)&self->_audibleOptionsMenu, 0);
  objc_storeStrong((id *)&self->_adjustmentsMenu, 0);
}

- (void)_updateEnablementForMenu:(int)a3 enabled:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a2, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            -[NSObject setAttributes:](v10, "setAttributes:", -[NSObject attributes](v10, "attributes") & 0xFFFFFFFFFFFFFFFELL | a3 ^ 1u);
          }
          else
          {
            _AVLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v11 = 0;
              _os_log_error_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_ERROR, "We expect all menu elements in this menu to be UIActions.", v11, 2u);
            }
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_updateSelectionForMenu:(uint64_t)a3 selectedIndex:
{
  void *v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (a1)
  {
    objc_msgSend(a2, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "setState:", a3 == v5);
        }
        else
        {
          _AVLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v8 = 0;
            _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "We expect all menu elements in this menu to be UIActions.", v8, 2u);
          }

        }
        ++v5;
      }
      while (v5 < objc_msgSend(v4, "count"));
    }

  }
}

- (void)_updateSelectionForEnhanceDialogueMenu
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    objc_msgSend(a1, "enhanceDialogueOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "currentEnhanceDialogueOption"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "containsObject:", v3);

    if (v4)
    {
      objc_msgSend(a1, "enhanceDialogueOptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "currentEnhanceDialogueOption"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "indexOfObject:", v6);

    }
    else
    {
      v7 = -1;
    }
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)a1, a1[5], v7);
  }
}

- (void)_updateSubtitleForEnhanceDialogueMenu
{
  id v2;

  if (a1)
  {
    +[AVMediaSelectionMenuController _displayNameForEnhanceDialogueLevel:]((uint64_t)AVMediaSelectionMenuController, objc_msgSend(a1, "currentEnhanceDialogueOption"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setSubtitle:", v2);

  }
}

+ (id)_displayNameForEnhanceDialogueLevel:(uint64_t)a1
{
  __CFString *v3;
  NSObject *v4;
  id result;
  uint8_t v6[16];

  objc_opt_self();
  switch(a2)
  {
    case 0:
      v3 = CFSTR("ENHANCE_DIALOGUE_OPTION_OFF");
      goto LABEL_9;
    case 1:
      v3 = CFSTR("ENHANCE_DIALOGUE_OPTION_ENHANCE");
      goto LABEL_9;
    case 2:
      v3 = CFSTR("ENHANCE_DIALOGUE_OPTION_BOOST");
      goto LABEL_9;
    case 3:
      v3 = CFSTR("ENHANCE_DIALOGUE_OPTION_ISOLATE");
LABEL_9:
      AVLocalizedString(v3);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Encountered unknown Enhance Dialogue level.", v6, 2u);
      }

      result = 0;
      break;
  }
  return result;
}

- (void)_reloadLegibleOptionsMenu
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (a1)
  {
    objc_msgSend(a1, "legibleOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3 > 1)
    {
      v5 = (void *)MEMORY[0x1E0DC39D0];
      AVLocalizedString(CFSTR("OVERFLOW_MENU_SUBTITLES_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("captions.bubble"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "legibleOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMediaSelectionMenuController _elementsForMediaSelectionOptions:](a1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "menuWithTitle:image:identifier:options:children:", v6, v7, CFSTR("AVSubtitlesMenu"), 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[6];
      a1[6] = (void *)v10;

      -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)a1, a1[6], objc_msgSend(a1, "currentLegibleOptionIndex"));
    }
    else
    {
      v4 = a1[6];
      a1[6] = 0;

    }
  }
}

- (id)_elementsForMediaSelectionOptions:(void *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char *v22;
  id obj;
  void *v24;
  _QWORD v25[5];
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      v22 = sel_shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController_;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v6);
        objc_msgSend(a1, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) == 0
          || (objc_msgSend(a1, "delegate"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v10, "mediaSelectionMenuController:displayNameForMediaSelectionOption:", a1, v7),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              !v11))
        {
          objc_msgSend(v7, "localizedDisplayName", v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_initWeak(&location, a1);
        v12 = (void *)MEMORY[0x1E0DC3428];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __68__AVMediaSelectionMenuController__elementsForMediaSelectionOptions___block_invoke;
        v25[3] = &unk_1E5BB2FA0;
        v25[4] = v7;
        objc_copyWeak(&v26, &location);
        objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v14 == v7;

        if (v15)
        {
          objc_msgSend(a1, "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_opt_respondsToSelector();

          if ((v17 & 1) != 0)
          {
            objc_msgSend(a1, "delegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:", a1);

            if ((v19 & 1) != 0)
              objc_msgSend(v13, "setAttributes:", 1);
          }
        }
        objc_msgSend(v24, "addObject:", v13, v22);

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v4);
  }

  v20 = (void *)objc_msgSend(v24, "copy");
  return v20;
}

void __68__AVMediaSelectionMenuController__elementsForMediaSelectionOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 136315394;
    v11 = "-[AVMediaSelectionMenuController _elementsForMediaSelectionOptions:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "%s Did select media selection option: %@", (uint8_t *)&v10, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "mediaSelectionMenuController:didSelectOption:", v9, *(_QWORD *)(a1 + 32));

  }
}

- (void)_reloadAudibleOptionsMenu
{
  void *v1;
  char v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id obj;
  id obja;
  _QWORD v42[4];
  id v43;
  void *v44;
  id v45;
  id location;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[18];

  v51[16] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "enhanceDialogueEnabled");

    if ((v2 & 1) != 0)
    {
      objc_msgSend((id)a1, "enhanceDialogueOptions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "count");

      if (v4 > 1)
      {
        v36 = (void *)MEMORY[0x1E0DC39D0];
        AVLocalizedString(CFSTR("ENHANCE_DIALOGUE_FEATURE_TITLE"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "enhanceDialogueOptions");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend((id)a1, "enhanceDialogueOptions");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v48 != v11)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              +[AVMediaSelectionMenuController _displayNameForEnhanceDialogueLevel:]((uint64_t)AVMediaSelectionMenuController, objc_msgSend(v13, "unsignedIntegerValue"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_initWeak(&location, (id)a1);
              v15 = (void *)MEMORY[0x1E0DC3428];
              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __69__AVMediaSelectionMenuController__elementsForEnhanceDialogueOptions___block_invoke;
              v42[3] = &unk_1E5BB0D30;
              v16 = v14;
              v43 = v16;
              objc_copyWeak(&v45, &location);
              v44 = v13;
              objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v42);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setAttributes:", objc_msgSend(v17, "attributes") | 8);
              objc_msgSend(v9, "addObject:", v17);

              objc_destroyWeak(&v45);
              objc_destroyWeak(&location);

            }
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          }
          while (v10);
        }

        v18 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v36, "menuWithTitle:image:identifier:options:children:", v38, 0, CFSTR("AVEnhanceDialogueMenu"), 0, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v5 = a1;
        v20 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v19;

        -[AVMediaSelectionMenuController _updateSelectionForEnhanceDialogueMenu]((void **)a1);
        -[AVMediaSelectionMenuController _updateSubtitleForEnhanceDialogueMenu]((id *)a1);
        -[AVMediaSelectionMenuController _updateEnablementForMenu:enabled:](a1, *(void **)(a1 + 40), objc_msgSend((id)a1, "shouldEnableEnhanceDialogueOptions"));
      }
      else
      {
        v5 = a1;
        v6 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = 0;

      }
      if (*(_QWORD *)(v5 + 40))
      {
        v21 = (void *)MEMORY[0x1E0DC39D0];
        AVLocalizedString(CFSTR("OVERFLOW_MENU_AUDIO_ADJUSTMENTS_TITLE"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "menuWithTitle:image:identifier:options:children:", v22, 0, CFSTR("AVAdjustmentsMenu"), 1, v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

        v5 = a1;
      }
      else
      {
        v26 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

      }
      -[AVMediaSelectionMenuController _reloadAudioTrackMenuDisplayingInline:]((void **)v5, 1u);
      if (*(_QWORD *)(v5 + 8) || *(_QWORD *)(v5 + 32))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        obja = (id)objc_claimAutoreleasedReturnValue();
        if (*(_QWORD *)(a1 + 8))
          objc_msgSend(obja, "addObject:");
        v27 = obja;
        if (*(_QWORD *)(a1 + 32))
        {
          objc_msgSend(obja, "addObject:");
          v27 = obja;
        }
        objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5BB5F88, 0, CFSTR("AVAudioMenu"), 0, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v28;

        v30 = (void *)MEMORY[0x1E0DC39D0];
        AVLocalizedString(CFSTR("OVERFLOW_MENU_AUDIO_TITLE"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("waveform.circle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "menuWithTitle:image:identifier:options:children:", v31, v32, CFSTR("AVAudioMenu"), 0, obja);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v33;

        v8 = obja;
      }
      else
      {
        v35 = *(void **)(v5 + 16);
        *(_QWORD *)(v5 + 16) = 0;

        v8 = *(void **)(v5 + 24);
        *(_QWORD *)(v5 + 24) = 0;
      }
    }
    else
    {
      -[AVMediaSelectionMenuController _reloadAudioTrackMenuDisplayingInline:]((void **)a1, 0);
      objc_storeStrong((id *)(a1 + 16), *(id *)(a1 + 32));
      v7 = *(id *)(a1 + 32);
      v8 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;
    }

  }
}

- (void)_reloadAudioTrackMenuDisplayingInline:(void *)a1
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(a1, "audibleOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 > 1)
  {
    v7 = (void *)MEMORY[0x1E0DC39D0];
    AVLocalizedString(CFSTR("OVERFLOW_MENU_AUDIOTRACK_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) != 0)
    {
      v9 = 0;
      v10 = CFSTR("AVAudioTrackMenu");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("waveform.circle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("AVAudioMenu");
    }
    objc_msgSend(a1, "audibleOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaSelectionMenuController _elementsForMediaSelectionOptions:](a1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", v8, v9, v10, a2, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = a1[4];
    a1[4] = (void *)v13;

    if ((a2 & 1) == 0)
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)a1, a1[4], objc_msgSend(a1, "currentAudibleOptionIndex"));
  }
  else
  {
    v6 = a1[4];
    a1[4] = 0;

  }
}

void __69__AVMediaSelectionMenuController__elementsForEnhanceDialogueOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 136315394;
    v11 = "-[AVMediaSelectionMenuController _elementsForEnhanceDialogueOptions:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "%s Did select enhance dialogue option: %@", (uint8_t *)&v10, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "mediaSelectionMenuController:didSelectEnhanceDialogueOption:", v9, objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));

  }
}

@end
