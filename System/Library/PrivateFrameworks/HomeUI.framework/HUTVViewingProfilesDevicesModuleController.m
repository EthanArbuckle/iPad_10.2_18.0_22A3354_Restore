@implementation HUTVViewingProfilesDevicesModuleController

- (HUTVViewingProfilesDevicesModuleController)initWithModule:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithModule_host_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTVViewingProfilesDevicesModuleController.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTVViewingProfilesDevicesModuleController initWithModule:]",
    v6);

  return 0;
}

- (HUTVViewingProfilesDevicesModuleController)initWithModule:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUTVViewingProfilesDevicesModuleController *v14;
  HUTVViewingProfilesDevicesModuleController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUTVViewingProfilesDevicesModuleController;
  v14 = -[HUItemModuleController initWithModule:](&v17, sel_initWithModule_, v9);
  v15 = v14;
  if (v14)
    -[HUItemModuleController setHost:](v14, "setHost:", v7);

  return v15;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTVViewingProfileDevice:", v6);

  if (v8)
  {
    objc_opt_class();
    v9 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "setDelegate:", self);
  }

}

- (void)_toggleShowTVViewingProfileForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  int v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "sourceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HUItemModuleController module](self, "module");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewingProfilesDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = (id)objc_opt_new();
    v17 = v16;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v11;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = objc_msgSend(v17, "containsObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (_QWORD)v27);
        }
        v24 = v23;
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);

      if (v24)
      {
        objc_msgSend(v18, "allObjects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectsInArray:", v25);
LABEL_22:

        -[HUItemModuleController module](self, "module");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setViewingProfilesDevices:", v17);

        goto LABEL_23;
      }
    }
    else
    {

    }
    objc_msgSend(v18, "allObjects", (_QWORD)v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v25);
    goto LABEL_22;
  }
LABEL_23:

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTVViewingProfileDevice:", v6);

  if (v8)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v10 = CFSTR("On");
      else
        v10 = CFSTR("Off");
      objc_msgSend(v6, "latestResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Turning \"Use My TV Viewing Profile\" %@ for %@", (uint8_t *)&v12, 0x16u);

    }
    -[HUTVViewingProfilesDevicesModuleController _toggleShowTVViewingProfileForItem:](self, "_toggleShowTVViewingProfileForItem:", v6);
  }

}

@end
