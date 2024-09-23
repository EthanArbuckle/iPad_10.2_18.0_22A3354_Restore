@implementation MPVolumeHUDController

- (void)addVolumeDisplay:(id)a3
{
  void *v4;
  void *v5;
  NSHashTable *scenes;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "volumeAudioCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeHUDController _addCategory:](self, "_addCategory:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "windowSceneForVolumeDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      scenes = self->_scenes;
      objc_msgSend(v8, "windowSceneForVolumeDisplay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHashTable addObject:](scenes, "addObject:", v7);

    }
  }
  -[NSMutableSet addObject:](self->_displays, "addObject:", v8);
  -[MPVolumeHUDController setNeedsUpdate](self, "setNeedsUpdate");

}

- (void)setNeedsUpdate
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_needsUpdate)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_needsUpdate = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __39__MPVolumeHUDController_setNeedsUpdate__block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

+ (MPVolumeHUDController)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_27268);
  return (MPVolumeHUDController *)(id)sharedInstance_instance;
}

- (void)_updateVisibility
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
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
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[NSHashTable allObjects](self->_scenes, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "_appAdoptsUISceneLifecycle");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = self->_displays;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  v32 = v5;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v12, "volumeAudioCategory", v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPVolumeHUDController _addCategory:](self, "_addCategory:", v13);

        if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "windowSceneForVolumeDisplay");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v33, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKey:", v16, v14);

            }
            objc_msgSend(v33, "objectForKey:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v12);

            objc_msgSend(v34, "removeObject:", v14);
            v5 = v32;
          }

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v9);
  }

  if (v6)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = v33;
    objc_msgSend(v33, "keyEnumerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v33, "objectForKey:", v25, v32);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPVolumeHUDController _updateVisibilityForVolumeDisplays:inWindowScene:](self, "_updateVisibilityForVolumeDisplays:inWindowScene:", v26, v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v22);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v34;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v27);
          -[MPVolumeHUDController _updateVisibilityForVolumeDisplays:inWindowScene:](self, "_updateVisibilityForVolumeDisplays:inWindowScene:", 0, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), v32);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v29);
    }

    v5 = v32;
  }
  else
  {
    -[MPVolumeHUDController _updateVisibilityForVolumeDisplays:inWindowScene:](self, "_updateVisibilityForVolumeDisplays:inWindowScene:", v5, 0);
    v18 = v33;
  }

}

- (void)_addCategory:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[NSMutableSet addObject:](self->_categories, "addObject:", v4);

}

uint64_t __39__MPVolumeHUDController_setNeedsUpdate__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibility");
}

void __39__MPVolumeHUDController_sharedInstance__block_invoke()
{
  MPVolumeHUDController *v0;
  void *v1;

  v0 = objc_alloc_init(MPVolumeHUDController);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (MPVolumeHUDController)init
{
  MPVolumeHUDController *v2;
  uint64_t v3;
  NSHashTable *scenes;
  NSMutableSet *v5;
  NSMutableSet *displays;
  NSMutableSet *v7;
  NSMutableSet *categories;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPVolumeHUDController;
  v2 = -[MPVolumeHUDController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    scenes = v2->_scenes;
    v2->_scenes = (NSHashTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    displays = v2->_displays;
    v2->_displays = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    categories = v2->_categories;
    v2->_categories = v7;

  }
  return v2;
}

- (void)_updateVisibilityForVolumeDisplays:(id)a3 inWindowScene:(id)a4
{
  id v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  __int128 v29;
  NSMutableSet *obj;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
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
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_categories;
  v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v44;
    *(_QWORD *)&v7 = 67109634;
    v29 = v7;
    v31 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v10 = v33;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
        if (!v11)
        {
          v18 = 1;
          goto LABEL_23;
        }
        v12 = v11;
        v13 = *(_QWORD *)v40;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v40 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              if ((objc_msgSend(v15, "isOnScreenForVolumeDisplay") & 1) == 0)
                goto LABEL_17;
            }
            else if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v15, "isOnScreen"))
            {
              goto LABEL_17;
            }
            objc_msgSend(v15, "volumeAudioCategory", v29);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v9, "isEqualToString:", v16);

            if ((v17 & 1) != 0)
            {
              v18 = 0;
              goto LABEL_21;
            }
LABEL_17:
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
          if (v12)
            continue;
          break;
        }
        v18 = 1;
LABEL_21:
        v6 = v31;
LABEL_23:

        if (v6)
        {
          objc_msgSend(v6, "_setSystemVolumeHUDEnabled:forAudioCategory:", v18, v9);
        }
        else
        {
          MPUIApplication();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "_appAdoptsUISceneLifecycle");

          if ((v20 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v22 = v10;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v36;
              do
              {
                v26 = 0;
                do
                {
                  if (*(_QWORD *)v36 != v25)
                    objc_enumerationMutation(v22);
                  objc_msgSend(v21, "addObject:", objc_opt_class());
                  ++v26;
                }
                while (v24 != v26);
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
              }
              while (v24);
            }

            v27 = os_log_create("com.apple.amp.mediaplayer", "Volume");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v48 = v18;
              v49 = 2114;
              v50 = v9;
              v51 = 2114;
              v52 = v21;
              _os_log_impl(&dword_193B9B000, v27, OS_LOG_TYPE_ERROR, "Attempting to setSystemVolumeHUDEnabled for application that supports UIScene lifecycle (enabled: %{BOOL}u | category: %{public}@ | volumeDisplays: %{public}@)", buf, 0x1Cu);
            }

          }
          else
          {
            MPUIApplication();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSystemVolumeHUDEnabled:forAudioCategory:", v18, v9);

          }
        }
        ++v8;
      }
      while (v8 != v34);
      v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v34);
  }

}

- (void)removeVolumeDisplay:(id)a3
{
  void *v4;
  void *v5;
  NSHashTable *scenes;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "volumeAudioCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPVolumeHUDController _addCategory:](self, "_addCategory:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "windowSceneForVolumeDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      scenes = self->_scenes;
      objc_msgSend(v8, "windowSceneForVolumeDisplay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHashTable addObject:](scenes, "addObject:", v7);

    }
  }
  -[NSMutableSet removeObject:](self->_displays, "removeObject:", v8);
  -[MPVolumeHUDController setNeedsUpdate](self, "setNeedsUpdate");

}

- (id)mainContext
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_scenes, 0);
}

@end
