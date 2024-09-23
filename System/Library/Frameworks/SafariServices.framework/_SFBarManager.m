@implementation _SFBarManager

- (void)setBarItem:(int64_t)a3 hidden:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  int v8;
  void *v9;

  v4 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  if (v8 != v4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v4);

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)setBarItem:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  int v8;
  void *v9;

  v4 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabled");

  if (v8 != v4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", v4);

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)setBarItem:(int64_t)a3 menu:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMenu:", v10);

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }

}

- (void)_updateAllRegistrationsAnimated:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_deferUpdateAllRegistrations)
  {
    self->_needsUpdateAllRegistrations = 1;
  }
  else
  {
    v4 = a3;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMapTable objectEnumerator](self->_barToRegistrationMap, "objectEnumerator", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[_SFBarManager _updateRegistrationWithToken:animated:](self, "_updateRegistrationWithToken:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), v4);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_updateAllRegistrations
{
  -[_SFBarManager _updateAllRegistrationsAnimated:](self, "_updateAllRegistrationsAnimated:", 0);
}

- (void)_updateRegistrationWithToken:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setContentMode:", self->_contentMode);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setState:", self->_state);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setCustomActivityImage:accessibilityLabel:", self->_customActivityImage, self->_customActivityAccessibilityLabel);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setCollaborationButton:", self->_collaborationButton);
  v7 = v6;
  _SFBarItemEnumerateCases();
  objc_msgSend(v7, "updateBarAnimated:", v4);

}

- (_SFBarManagerDelegate)delegate
{
  return (_SFBarManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)performCoalescedUpdatesAnimated:(BOOL)a3 updates:(id)a4
{
  id v6;
  void *v7;
  id coalescedUpdatesBlock;
  NSTimer *v9;
  NSTimer *coalescedUpdatesTimer;
  void *v11;
  _QWORD v12[5];
  BOOL v13;

  v6 = a4;
  if (CFAbsoluteTimeGetCurrent() - self->_lastCoalescedUpdatesTime < 0.2)
    -[_SFBarManager _invalidateCoalescedUpdatesTimer](self, "_invalidateCoalescedUpdatesTimer");
  v7 = (void *)MEMORY[0x1A8598C40](v6);
  coalescedUpdatesBlock = self->_coalescedUpdatesBlock;
  self->_coalescedUpdatesBlock = v7;

  if (!-[NSTimer isValid](self->_coalescedUpdatesTimer, "isValid"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57___SFBarManager_performCoalescedUpdatesAnimated_updates___block_invoke;
    v12[3] = &unk_1E4AC80F0;
    v12[4] = self;
    v13 = a3;
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:repeats:block:", 0, v12, 0.04);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    coalescedUpdatesTimer = self->_coalescedUpdatesTimer;
    self->_coalescedUpdatesTimer = v9;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTimer:forMode:", self->_coalescedUpdatesTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)setBarItem:(int64_t)a3 title:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (v11)
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v11);

    if ((v8 & 1) == 0)
    {
      -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAttributedTitle:", 0);

      -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v11);

      -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
    }
  }

}

- (_SFBarManager)init
{
  _SFBarManager *v2;
  uint64_t v3;
  NSMapTable *barToRegistrationMap;
  void *v5;
  void *v6;
  _SFBarItemConfiguration *v7;
  uint64_t v8;
  NSArray *itemConfigurationMap;
  void *v10;
  void *v11;
  _SFBarManager *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_SFBarManager;
  v2 = -[_SFBarManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    barToRegistrationMap = v2->_barToRegistrationMap;
    v2->_barToRegistrationMap = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (unint64_t)objc_msgSend(v5, "count") <= 0x10)
    {
      do
      {
        v7 = objc_alloc_init(_SFBarItemConfiguration);
        objc_msgSend(v6, "addObject:", v7);

      }
      while ((unint64_t)objc_msgSend(v6, "count") < 0x11);
    }
    v8 = objc_msgSend(v6, "copy");

    itemConfigurationMap = v2->_itemConfigurationMap;
    v2->_itemConfigurationMap = (NSArray *)v8;

    -[NSArray objectAtIndexedSubscript:](v2->_itemConfigurationMap, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", 0);

    -[NSArray objectAtIndexedSubscript:](v2->_itemConfigurationMap, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 0);

    v2->_downloadsItemProgress = -2.0;
    v12 = v2;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)registerToolbar:(id)a3 withLayout:(int64_t)a4 persona:(int64_t)a5
{
  id v8;
  SFBarRegistration *v9;

  v8 = a3;
  v9 = -[SFBarRegistration initWithBar:barManager:layout:persona:]([SFBarRegistration alloc], "initWithBar:barManager:layout:persona:", v8, self, a4, a5);
  -[_SFBarManager registerBar:withToken:](self, "registerBar:withToken:", v8, v9);

}

- (void)registerBar:(id)a3 withToken:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  -[_SFBarManager _updateRegistrationWithToken:animated:](self, "_updateRegistrationWithToken:animated:", v6, 0);
  -[NSMapTable setObject:forKey:](self->_barToRegistrationMap, "setObject:forKey:", v6, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "barManager:willRegisterBarWithToken:", self, v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "didCompleteBarRegistrationWithToken:", v6);

}

- (void)performCoalescedUpdatesNowAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double Current;
  void *v6;
  BOOL deferUpdateAllRegistrations;
  id v8;

  v3 = a3;
  v8 = (id)MEMORY[0x1A8598C40](self->_coalescedUpdatesBlock, a2);
  -[_SFBarManager _invalidateCoalescedUpdatesTimer](self, "_invalidateCoalescedUpdatesTimer");
  Current = CFAbsoluteTimeGetCurrent();
  v6 = v8;
  self->_lastCoalescedUpdatesTime = Current;
  if (v8)
  {
    deferUpdateAllRegistrations = self->_deferUpdateAllRegistrations;
    self->_deferUpdateAllRegistrations = 1;
    (*((void (**)(id))v8 + 2))(v8);
    v6 = v8;
    self->_deferUpdateAllRegistrations = deferUpdateAllRegistrations;
    if (self->_needsUpdateAllRegistrations)
    {
      self->_needsUpdateAllRegistrations = 0;
      -[_SFBarManager _updateAllRegistrationsAnimated:](self, "_updateAllRegistrationsAnimated:", v3);
      v6 = v8;
    }
  }

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)_invalidateCoalescedUpdatesTimer
{
  NSTimer *coalescedUpdatesTimer;
  id coalescedUpdatesBlock;

  -[NSTimer invalidate](self->_coalescedUpdatesTimer, "invalidate");
  coalescedUpdatesTimer = self->_coalescedUpdatesTimer;
  self->_coalescedUpdatesTimer = 0;

  coalescedUpdatesBlock = self->_coalescedUpdatesBlock;
  self->_coalescedUpdatesBlock = 0;

}

- (void)setBarItem:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  int v8;
  void *v9;

  v4 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSelected");

  if (v8 != v4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelected:", v4);

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)setImage:(id)a3 forBarItem:(int64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBSIsEqual();

  if ((v8 & 1) == 0)
  {
    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }

}

- (void)visibleBarItemsNeedUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_barToRegistrationMap, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateBarAnimated:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setDownloadsItemProgress:(double)a3
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
  self->_downloadsItemProgress = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_barToRegistrationMap, "objectEnumerator", 0);
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
          objc_msgSend(v9, "setProgress:forBarItem:", 11, a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setCustomActivityImage:(id)a3 accessibilityLabel:(id)a4
{
  id v7;
  NSString *v8;
  NSString *customActivityAccessibilityLabel;
  UIImage *v10;

  v10 = (UIImage *)a3;
  v7 = a4;
  if (self->_customActivityImage != v10 || (WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_customActivityImage, a3);
    v8 = (NSString *)objc_msgSend(v7, "copy");
    customActivityAccessibilityLabel = self->_customActivityAccessibilityLabel;
    self->_customActivityAccessibilityLabel = v8;

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }

}

- (BOOL)isBarItemEnabled:(int64_t)a3
{
  void *v4;
  char v5;

  if (self->_allBarItemsAreDisabled)
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  return v5;
}

- (BOOL)isBarItemHidden:(int64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (BOOL)isBarItemSelected:(int64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected");

  return v4;
}

- (void)setBarItem:(int64_t)a3 attributedTitle:(id)a4
{
  NSArray *itemConfigurationMap;
  id v7;
  void *v8;
  void *v9;

  if (a4)
  {
    itemConfigurationMap = self->_itemConfigurationMap;
    v7 = a4;
    -[NSArray objectAtIndexedSubscript:](itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", 0);

    -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedTitle:", v7);

    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)setCollaborationButton:(id)a3
{
  _SWCollaborationButtonView *v5;
  _SWCollaborationButtonView *v6;

  v5 = (_SWCollaborationButtonView *)a3;
  if (self->_collaborationButton != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collaborationButton, a3);
    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
    v5 = v6;
  }

}

- (void)setAllBarItemsAreDisabled:(BOOL)a3
{
  if (self->_allBarItemsAreDisabled != a3)
  {
    self->_allBarItemsAreDisabled = a3;
    -[_SFBarManager _updateAllRegistrations](self, "_updateAllRegistrations");
  }
}

- (void)pulseDownloadsItem
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMapTable objectEnumerator](self->_barToRegistrationMap, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "pulseBarItem:", 11);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)setDownloadsItemNeedsLayout
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_barToRegistrationMap, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "UIBarButtonItemForItem:", 11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "customView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setNeedsLayout");

        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_11;
          objc_msgSend(v7, "viewForBarItem:", 11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setNeedsLayout");
        }

LABEL_11:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)performCoalescedUpdates:(id)a3
{
  -[_SFBarManager performCoalescedUpdatesAnimated:updates:](self, "performCoalescedUpdatesAnimated:updates:", 0, a3);
}

- (void)registerUnifiedBar:(id)a3 withPersona:(int64_t)a4
{
  id v6;
  SFUnifiedBarRegistration *v7;

  v6 = a3;
  v7 = -[SFUnifiedBarRegistration initWithBar:barManager:persona:]([SFUnifiedBarRegistration alloc], "initWithBar:barManager:persona:", v6, self, a4);
  -[_SFBarManager registerBar:withToken:](self, "registerBar:withToken:", v6, v7);

}

- (CGRect)frameForBarItem:(int64_t)a3 inCoordinateSpace:(id)a4
{
  id v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double x;
  double y;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect result;
  CGRect v50;
  CGRect v51;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[NSMapTable keyEnumerator](self->_barToRegistrationMap, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!v7)
    goto LABEL_20;
  v12 = v7;
  v39 = v6;
  v13 = *(_QWORD *)v42;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v42 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      -[NSMapTable objectForKey:](self->_barToRegistrationMap, "objectForKey:", v15, v39);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "UIBarButtonItemForItem:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v15;
            objc_msgSend(v18, "_frameOfBarButtonItem:", v17);
            x = v47.origin.x;
            y = v47.origin.y;
            width = v47.size.width;
            height = v47.size.height;
            v50.origin.x = v8;
            v50.origin.y = v9;
            v50.size.width = v10;
            v50.size.height = v11;
            if (!CGRectEqualToRect(v47, v50))
            {
              v6 = v39;
              objc_msgSend(v18, "convertRect:toCoordinateSpace:", v39, x, y, width, height);
              v8 = v31;
              v9 = v32;
              v10 = v33;
              v11 = v34;

              goto LABEL_19;
            }

          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_14;
        objc_msgSend(v16, "viewForBarItem:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v23 = v48.origin.x;
        v24 = v48.origin.y;
        v25 = v48.size.width;
        v26 = v48.size.height;
        v51.origin.x = v8;
        v51.origin.y = v9;
        v51.size.width = v10;
        v51.size.height = v11;
        if (!CGRectEqualToRect(v48, v51))
        {
          v6 = v39;
          objc_msgSend(v17, "convertRect:toCoordinateSpace:", v39, v23, v24, v25, v26);
          v8 = v27;
          v9 = v28;
          v10 = v29;
          v11 = v30;
LABEL_19:

          goto LABEL_20;
        }
      }

LABEL_14:
    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v12)
      continue;
    break;
  }
  v6 = v39;
LABEL_20:

  v35 = v8;
  v36 = v9;
  v37 = v10;
  v38 = v11;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)barRegistration:(id)a3 didReceiveTapForBarItem:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "barManager:didReceiveTapForBarItem:", self, a4);

}

- (BOOL)barRegistration:(id)a3 canHandleLongPressForBarItem:(int64_t)a4
{
  id WeakRetained;
  char v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(WeakRetained, "barManager:canHandleLongPressForBarItem:", self, a4);
  else
    v7 = objc_opt_respondsToSelector();
  v8 = v7;

  return v8 & 1;
}

- (void)barRegistration:(id)a3 didReceiveLongPressForBarItem:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "barManager:didReceiveLongPressForBarItem:", self, a4);

}

- (void)barRegistration:(id)a3 didReceiveTouchDownForBarItem:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "barManager:didReceiveTouchDownForBarItem:", self, a4);

}

- (id)menuForBarItem:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_itemConfigurationMap, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)test_numberOfRegistrations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSMapTable objectEnumerator](self->_barToRegistrationMap, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)test_registrationForBar:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMapTable objectForKey:](self->_barToRegistrationMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)state
{
  return self->_state;
}

- (double)downloadsItemProgress
{
  return self->_downloadsItemProgress;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return self->_collaborationButton;
}

- (BOOL)allBarItemsAreDisabled
{
  return self->_allBarItemsAreDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customActivityAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_customActivityImage, 0);
  objc_storeStrong((id *)&self->_itemConfigurationMap, 0);
  objc_storeStrong(&self->_coalescedUpdatesBlock, 0);
  objc_storeStrong((id *)&self->_coalescedUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_barToRegistrationMap, 0);
}

@end
