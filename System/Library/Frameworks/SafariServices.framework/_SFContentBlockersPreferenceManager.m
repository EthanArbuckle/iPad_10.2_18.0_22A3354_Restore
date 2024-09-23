@implementation _SFContentBlockersPreferenceManager

- (_SFContentBlockersPreferenceManager)initWithPerSitePreferencesStore:(id)a3 extensionsController:(id)a4
{
  id v7;
  _SFContentBlockersPreferenceManager *v8;
  _SFContentBlockersPreferenceManager *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFContentBlockersPreferenceManager *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_SFContentBlockersPreferenceManager;
  v8 = -[WBSContentBlockersPreferenceManager initWithPerSitePreferencesStore:](&v21, sel_initWithPerSitePreferencesStore_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_extensionsController, a4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SFWebExtensionsController allContentBlockerManagers](v9->_extensionsController, "allContentBlockerManagers", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "addObserver:", v9);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    -[_SFContentBlockersPreferenceManager _checkForContentBlockers](v9, "_checkForContentBlockers");
    v15 = v9;
  }

  return v9;
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  -[SFWebExtensionsController allContentBlockerManagers](self->_extensionsController, "allContentBlockerManagers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeObserver:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_checkForContentBlockers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  self->_hasEnabledContentBlockers = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SFWebExtensionsController allContentBlockerManagers](self->_extensionsController, "allContentBlockerManagers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "extensions", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              if ((objc_msgSend(v8, "extensionIsEnabled:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j)) & 1) != 0)
              {
                self->_hasEnabledContentBlockers = 1;

                goto LABEL_27;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v18;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v5);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SFWebExtensionsController allWebExtensionControllers](self->_extensionsController, "allWebExtensionControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    while (2)
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * k), "anyWebExtensionContentBlockerEnabled"))
        {
          self->_hasEnabledContentBlockers = 1;
          goto LABEL_27;
        }
      }
      v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_27:

}

- (BOOL)hasEnabledContentBlockers
{
  return self->_hasEnabledContentBlockers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionsController, 0);
}

@end
