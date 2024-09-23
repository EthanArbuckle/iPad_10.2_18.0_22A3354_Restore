@implementation SFNavigationBarItem

- (BOOL)stopReloadButtonShowsStop
{
  return self->_stopReloadButtonShowsStop;
}

- (BOOL)showsStopReloadButtons
{
  return self->_showsStopReloadButtons;
}

- (BOOL)menuButtonSelected
{
  return self->_readerButtonSelected || self->_showsTranslationIcon || self->_showsSiriReaderPlayingIcon;
}

- (BOOL)showsTranslationIcon
{
  return self->_showsTranslationIcon;
}

- (BOOL)showsSiriReaderPlayingIcon
{
  return self->_showsSiriReaderPlayingIcon;
}

- (BOOL)needsExtensionBadge
{
  return self->_needsExtensionBadge;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)extensionsAreActive
{
  return self->_extensionsAreActive;
}

- (BOOL)showsPageFormatButton
{
  return self->_showsPageFormatButton;
}

- (BOOL)showsTranslationButton
{
  return self->_showsTranslationButton;
}

- (BOOL)showsReaderButton
{
  return self->_showsReaderButton;
}

- (BOOL)showsSearchIndicator
{
  return self->_showsSearchIndicator;
}

- (int64_t)securityAnnotation
{
  return self->_securityAnnotation;
}

- (BOOL)hasFocusedSensitiveFieldOnCurrentPage
{
  return self->_hasFocusedSensitiveFieldOnCurrentPage;
}

- (void)setShowsSearchIndicator:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsSearchIndicator ^ a3) & 1) == 0)
  {
    self->_showsSearchIndicator = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsSearchIndicator:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setExtensionButtonConfiguration:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_extensionButtonConfiguration, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "navigationBarItemDidUpdateExtensionButtonConfiguration:", self);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (SFWebExtensionButtonConfiguration)extensionButtonConfiguration
{
  return self->_extensionButtonConfiguration;
}

- (void)setText:(id)a3 textWhenExpanded:(id)a4 startIndex:(unint64_t)a5
{
  NSString *v8;
  NSString *v9;
  int v10;
  NSString *v11;
  NSString *text;
  unint64_t *p_startIndexOfTextInExpandedText;
  NSString *v14;
  NSString *textWhenExpanded;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  if (self->_text == v8 || -[NSString isEqualToString:](v8, "isEqualToString:"))
  {
    v10 = 0;
  }
  else
  {
    v11 = (NSString *)-[NSString copy](v8, "copy");
    text = self->_text;
    self->_text = v11;

    v10 = 1;
  }
  if (self->_textWhenExpanded == v9 || -[NSString isEqualToString:](v9, "isEqualToString:"))
  {
    p_startIndexOfTextInExpandedText = &self->_startIndexOfTextInExpandedText;
    if (self->_startIndexOfTextInExpandedText == a5)
    {
      if (!v10)
        goto LABEL_22;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v14 = (NSString *)-[NSString copy](v9, "copy");
  textWhenExpanded = self->_textWhenExpanded;
  self->_textWhenExpanded = v14;

  p_startIndexOfTextInExpandedText = &self->_startIndexOfTextInExpandedText;
  if (self->_startIndexOfTextInExpandedText != a5)
LABEL_11:
    *p_startIndexOfTextInExpandedText = a5;
LABEL_12:
  -[SFNavigationBarItem setTemporarilySuppressText:](self, "setTemporarilySuppressText:", 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "navigationBarItemDidUpdateText:", self);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

LABEL_22:
}

- (NSString)textWhenExpanded
{
  if (self->_temporarilySuppressText)
    return (NSString *)&stru_1E21FE780;
  else
    return self->_textWhenExpanded;
}

- (unint64_t)startIndexOfTextInExpandedText
{
  return self->_startIndexOfTextInExpandedText;
}

- (void)setTemporarilySuppressText:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_temporarilySuppressText != a3)
  {
    self->_temporarilySuppressText = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateText:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setShowsVoiceSearchButton:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsVoiceSearchButton ^ a3) & 1) == 0)
  {
    self->_showsVoiceSearchButton = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsVoiceSearchButton:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)showsVoiceSearchButton
{
  return self->_showsVoiceSearchButton;
}

- (NSString)text
{
  if (self->_temporarilySuppressText)
    return (NSString *)&stru_1E21FE780;
  else
    return self->_text;
}

- (WBSFluidProgressController)fluidProgressController
{
  return self->_fluidProgressController;
}

- (WBSFluidProgressStateSource)fluidProgressStateSource
{
  return (WBSFluidProgressStateSource *)objc_loadWeakRetained((id *)&self->_fluidProgressStateSource);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (BOOL)showsLockIcon
{
  return self->_showsLockIcon;
}

- (void)setFluidProgressStateSource:(id)a3
{
  objc_storeWeak((id *)&self->_fluidProgressStateSource, a3);
}

- (void)setFluidProgressController:(id)a3
{
  WBSFluidProgressController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (WBSFluidProgressController *)a3;
  if (self->_fluidProgressController != v5)
  {
    objc_storeStrong((id *)&self->_fluidProgressController, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "navigationBarItemDidUpdateFluidProgressController:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (SFNavigationBarItem)init
{
  SFNavigationBarItem *v2;
  uint64_t v3;
  NSHashTable *observers;
  SFNavigationBarItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFNavigationBarItem;
  v2 = -[SFNavigationBarItem init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setShowsStopReloadButtons:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsStopReloadButtons ^ a3) & 1) == 0)
  {
    self->_showsStopReloadButtons = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsStopReloadButtons:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setStopReloadButtonShowsStop:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_stopReloadButtonShowsStop ^ a3) & 1) == 0)
  {
    self->_stopReloadButtonShowsStop = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateStopReloadButtonShowsStop:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setShowsPageFormatButton:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsPageFormatButton ^ a3) & 1) == 0)
  {
    self->_showsPageFormatButton = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsPageFormatButton:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setShowsLockIcon:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsLockIcon ^ a3) & 1) == 0)
  {
    self->_showsLockIcon = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsLockIcon:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setOverrideBarStyleForSecurityWarning:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_overrideBarStyleForSecurityWarning ^ a3) & 1) == 0)
  {
    self->_overrideBarStyleForSecurityWarning = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateOverrideBarStyleForSecurityWarning:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setNeedsExtensionBadge:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_needsExtensionBadge != a3)
  {
    self->_needsExtensionBadge = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateNeedsExtensionBadge:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setLockdownModeAnnotation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_lockdownModeAnnotation != a3)
  {
    self->_lockdownModeAnnotation = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateLockdownModeAnnotation:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setExtensionsAreActive:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_extensionsAreActive != a3)
  {
    self->_extensionsAreActive = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsExtensionsAvailability:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setSecurityAnnotation:(int64_t)a3 hasFocusedInputFieldOnCurrentPage:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_securityAnnotation != a3 || self->_hasFocusedSensitiveFieldOnCurrentPage != a4)
  {
    self->_securityAnnotation = a3;
    self->_hasFocusedSensitiveFieldOnCurrentPage = a4;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "navigationBarItemDidUpdateSecurityAnnotation:", self);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)setShowsTranslationButton:(BOOL)a3 showsAvailabilityText:(BOOL)a4
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_showsTranslationButton != a3 || self->_showsTranslationAvailabilityTextWhenReplacingDomain != a4)
  {
    v5 = !self->_overrideBarStyleForSecurityWarning && a3;
    self->_showsTranslationButton = v5;
    self->_showsTranslationAvailabilityTextWhenReplacingDomain = a4;
    -[SFNavigationBarItem setDidFinishShowingAvailabilityLabel:ofType:](self, "setDidFinishShowingAvailabilityLabel:ofType:", 0, 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "navigationBarItemDidUpdateShowsTranslationButton:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setShowsReaderButton:(BOOL)a3 showsAvailabilityText:(BOOL)a4
{
  BOOL v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_showsReaderButton != a3 || self->_showsReaderAvailabilityTextWhenReplacingDomain != a4)
  {
    v5 = !self->_overrideBarStyleForSecurityWarning && a4;
    v6 = !self->_overrideBarStyleForSecurityWarning && a3;
    self->_showsReaderButton = v6;
    self->_showsReaderAvailabilityTextWhenReplacingDomain = v5;
    -[SFNavigationBarItem setDidFinishShowingAvailabilityLabel:ofType:](self, "setDidFinishShowingAvailabilityLabel:ofType:", 0, 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "navigationBarItemDidUpdateShowsReaderButton:", self);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setReaderButtonSelected:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_readerButtonSelected ^ a3) & 1) == 0)
  {
    self->_readerButtonSelected = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateFormatButtonSelected:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setShowsTranslationIcon:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsTranslationIcon ^ a3) & 1) == 0)
  {
    self->_showsTranslationIcon = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsTranslationIcon:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setShowsSiriReaderPlayingIcon:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showsSiriReaderPlayingIcon ^ a3) & 1) == 0)
  {
    self->_showsSiriReaderPlayingIcon = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setShouldShowListeningControls:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_shouldShowListeningControls ^ a3) & 1) == 0)
  {
    self->_shouldShowListeningControls = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateShouldShowListeningControls:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)updateContentOptions:(unint64_t)a3
{
  unint64_t contentOptions;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  contentOptions = self->_contentOptions;
  if (contentOptions != (contentOptions | a3))
  {
    self->_contentOptions = contentOptions | a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "navigationBarItemDidUpdateContentOptions:resetDisplay:", self, 0);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)resetContentOptions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_contentOptions = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "navigationBarItemDidUpdateContentOptions:resetDisplay:", self, 1);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)setBrowsingAssistantDetectionResult:(int64_t)a3
{
  BOOL v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_browsingAssistantDetectionResult != a3)
  {
    if (a3)
      v4 = !self->_overrideBarStyleForSecurityWarning;
    else
      v4 = 0;
    v5 = v4;
    self->_showsBrowsingAssistantAvailabilityText = v5;
    self->_browsingAssistantDetectionResult = a3;
    -[SFNavigationBarItem setDidFinishShowingAvailabilityLabel:ofType:](self, "setDidFinishShowingAvailabilityLabel:ofType:", 0, 2);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "navigationBarItemDidUpdateBrowsingAssistantDetectionResult:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setDidFinishShowingAvailabilityLabel:(BOOL)a3 ofType:(int64_t)a4
{
  if ((unint64_t)a4 <= 2)
    *((_BYTE *)&self->super.isa + qword_18BAD4CF8[a4]) = a3;
}

- (void)setShowsReaderButton:(BOOL)a3
{
  -[SFNavigationBarItem setShowsReaderButton:showsAvailabilityText:](self, "setShowsReaderButton:showsAvailabilityText:", a3, a3);
}

- (BOOL)showsReaderAvailabilityTextForStyle:(int64_t)a3
{
  BOOL v3;
  uint64_t v4;

  if (!a3)
  {
    v4 = 24;
    return *((_BYTE *)&self->super.isa + v4) != 0;
  }
  if (a3 == 1)
  {
    v4 = 32;
    return *((_BYTE *)&self->super.isa + v4) != 0;
  }
  return v3;
}

- (void)setShowsTranslationButton:(BOOL)a3
{
  -[SFNavigationBarItem setShowsTranslationButton:showsAvailabilityText:](self, "setShowsTranslationButton:showsAvailabilityText:", a3, a3);
}

- (BOOL)showsTranslationAvailabilityTextForStyle:(int64_t)a3
{
  BOOL v3;
  uint64_t v4;

  if (!a3)
  {
    v4 = 25;
    return *((_BYTE *)&self->super.isa + v4) != 0;
  }
  if (a3 == 1)
  {
    v4 = 35;
    return *((_BYTE *)&self->super.isa + v4) != 0;
  }
  return v3;
}

- (BOOL)_showsAvailabilityTextForType:(int64_t)a3 style:(int64_t)a4
{
  BOOL v4;

  if (a3 == 2)
    return self->_showsBrowsingAssistantAvailabilityText;
  if (a3 != 1)
  {
    if (!a3)
      return -[SFNavigationBarItem showsReaderAvailabilityTextForStyle:](self, "showsReaderAvailabilityTextForStyle:", a4);
    return v4;
  }
  return -[SFNavigationBarItem showsTranslationAvailabilityTextForStyle:](self, "showsTranslationAvailabilityTextForStyle:", a4);
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateMediaStateIcon:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setSecurityAnnotation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_securityAnnotation != a3)
  {
    self->_securityAnnotation = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateSecurityAnnotation:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)showsSecurityAnnotation
{
  return self->_securityAnnotation != 0;
}

- (void)setCustomPlaceholderText:(id)a3
{
  NSString *v4;
  NSString *customPlaceholderText;
  NSString *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  customPlaceholderText = self->_customPlaceholderText;
  if (customPlaceholderText != v4 && !-[NSString isEqualToString:](customPlaceholderText, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    v7 = self->_customPlaceholderText;
    self->_customPlaceholderText = v6;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "navigationBarItemDidUpdateCustomPlaceholderText:", self);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)setHasHiddenElements:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_hasHiddenElements ^ a3) & 1) == 0)
  {
    self->_hasHiddenElements = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "navigationBarItemDidUpdateHasHiddenElements:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setOverlayConfiguration:(id)a3
{
  SFURLFieldOverlayConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (SFURLFieldOverlayConfiguration *)a3;
  if (self->_overlayConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_overlayConfiguration, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "navigationBarItemDidUpdateOverlayConfiguration:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setOverlayNarrowConfiguration:(id)a3
{
  SFURLFieldOverlayConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (SFURLFieldOverlayConfiguration *)a3;
  if (self->_overlayNarrowConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_overlayNarrowConfiguration, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "navigationBarItemDidUpdateOverlayNarrowConfiguration:", self);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)updateEntityAnnotationWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "navigationBarItem:didUpdateTabEntityWithUUID:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSString)customPlaceholderText
{
  return self->_customPlaceholderText;
}

- (BOOL)readerButtonSelected
{
  return self->_readerButtonSelected;
}

- (BOOL)didFinishShowingReaderAvailabilityLabel
{
  return self->_didFinishShowingReaderAvailabilityLabel;
}

- (BOOL)didFinishShowingTranslationAvailabilityLabel
{
  return self->_didFinishShowingTranslationAvailabilityLabel;
}

- (BOOL)shouldShowListeningControls
{
  return self->_shouldShowListeningControls;
}

- (unint64_t)contentOptions
{
  return self->_contentOptions;
}

- (BOOL)didFinishShowingAvailabilityLabels
{
  return self->_didFinishShowingAvailabilityLabels;
}

- (BOOL)showsBrowsingAssistantAvailabilityText
{
  return self->_showsBrowsingAssistantAvailabilityText;
}

- (BOOL)didFinishShowingAssistantAvailabilityLabel
{
  return self->_didFinishShowingAssistantAvailabilityLabel;
}

- (int64_t)browsingAssistantDetectionResult
{
  return self->_browsingAssistantDetectionResult;
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)overrideBarStyleForSecurityWarning
{
  return self->_overrideBarStyleForSecurityWarning;
}

- (int64_t)lockdownModeAnnotation
{
  return self->_lockdownModeAnnotation;
}

- (BOOL)hasHiddenElements
{
  return self->_hasHiddenElements;
}

- (SFURLFieldOverlayConfiguration)overlayConfiguration
{
  return self->_overlayConfiguration;
}

- (SFURLFieldOverlayConfiguration)overlayNarrowConfiguration
{
  return self->_overlayNarrowConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayNarrowConfiguration, 0);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_destroyWeak((id *)&self->_fluidProgressStateSource);
  objc_storeStrong((id *)&self->_fluidProgressController, 0);
  objc_storeStrong((id *)&self->_extensionButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong((id *)&self->_customPlaceholderText, 0);
  objc_storeStrong((id *)&self->_textWhenExpanded, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
