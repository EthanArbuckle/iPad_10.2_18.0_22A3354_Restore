@implementation _SFActivityViewController

+ (id)activeWebPageExtensionItemForURL:(id)a3 withPreviewImageHandler:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35E8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setUserInfo:", &unk_1E4B27628);
  v9 = objc_alloc(MEMORY[0x1E0CB36C8]);
  v10 = (void *)objc_msgSend(v9, "initWithItem:typeIdentifier:", v7, *MEMORY[0x1E0CA5C90]);

  objc_msgSend(v10, "setPreviewImageHandler:", v6);
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttachments:", v11);

  return v8;
}

- (_SFActivityViewController)initWithActivityItemProviderCollection:(id)a3 applicationActivities:(id)a4 sharingURL:(id)a5 sourceURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _SFActivityItemCustomizationController *v15;
  void *v16;
  _SFActivityViewController *v17;
  _SFActivityViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  uint64_t v31;
  void *v32;
  _SFActivityViewController *v33;
  _SFActivityItemCustomizationController *v35;
  _SFActivityViewController *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init(_SFActivityItemCustomizationController);
  objc_msgSend(v11, "activityItemProvidersWithCustomizationController:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_SFActivityViewController initWithActivityItems:applicationActivities:sharingURL:sourceURL:](self, "initWithActivityItems:applicationActivities:sharingURL:sourceURL:", v16, v12, v13, v14);
  v18 = v17;
  if (v17)
  {
    v35 = v15;
    v37 = v14;
    v38 = v13;
    v39 = v11;
    v36 = v17;
    objc_storeStrong((id *)&v17->_itemProviderCollection, a3);
    v19 = *MEMORY[0x1E0CEB1A8];
    v45 = *MEMORY[0x1E0CEB238];
    v46 = v19;
    v47 = CFSTR("SFToggleReaderActivity");
    v48 = CFSTR("SFReloadActivity");
    v49 = *MEMORY[0x1E0CEB1C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = v12;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v27, "activityType");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v27, "activityType");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v30);

            }
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v24);
    }

    v31 = *MEMORY[0x1E0CEB1D8];
    v45 = *MEMORY[0x1E0CEB230];
    v46 = v31;
    v47 = (const __CFString *)*MEMORY[0x1E0CEB220];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v32);

    v18 = v36;
    -[_SFActivityViewController setActivityTypeOrder:](v36, "setActivityTypeOrder:", v21);
    v33 = v36;

    v11 = v39;
    v14 = v37;
    v13 = v38;
    v15 = v35;
  }

  return v18;
}

- (_SFActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 sharingURL:(id)a5 sourceURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _SFActivityViewController *v15;
  void *v16;
  _SFActivityItemCustomizationController *v17;
  _SFActivityViewController *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, unsigned int, void *, uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_SFActivityViewController;
  v15 = -[_SFActivityViewController initWithActivityItems:applicationActivities:](&v26, sel_initWithActivityItems_applicationActivities_, v11, v12);
  if (v15)
  {
    objc_initWeak(&location, v15);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityViewController setSourceIsManaged:](v15, "setSourceIsManaged:", objc_msgSend(v16, "isURLManaged:", v14));

    objc_storeStrong((id *)&v15->_sharingURL, a5);
    -[_SFActivityViewController _updatePrintControllerWithActivityItems:](v15, "_updatePrintControllerWithActivityItems:", v11);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __94___SFActivityViewController_initWithActivityItems_applicationActivities_sharingURL_sourceURL___block_invoke;
    v23 = &unk_1E4AC1878;
    objc_copyWeak(&v24, &location);
    -[_SFActivityViewController setCompletionWithItemsHandler:](v15, "setCompletionWithItemsHandler:", &v20);
    objc_storeStrong((id *)&v15->_activityItemProviders, a3);
    v17 = objc_alloc_init(_SFActivityItemCustomizationController);
    -[_SFActivityViewController setCustomizationController:](v15, "setCustomizationController:", v17, v20, v21, v22, v23);

    objc_storeStrong((id *)&v15->_initialApplicationActivities, a4);
    v18 = v15;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFPrintController printInteractionControllerDidFinish](self->_printController, "printInteractionControllerDidFinish");
  v3.receiver = self;
  v3.super_class = (Class)_SFActivityViewController;
  -[_SFActivityViewController dealloc](&v3, sel_dealloc);
}

- (void)_updatePrintControllerWithActivityItems:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _SFPrintController *v11;
  _SFPrintController **p_printController;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "printController", (_QWORD)v13);
          v11 = (_SFPrintController *)objc_claimAutoreleasedReturnValue();
          p_printController = &self->_printController;
          if (*p_printController != v11)
          {
            -[_SFPrintController printInteractionControllerDidFinish](*p_printController, "printInteractionControllerDidFinish");
            objc_storeStrong((id *)p_printController, v11);
          }

          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)activityDidComplete:(id)a3 withReturnedItems:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  _BOOL4 v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[_SFActivityViewController currentExtensionIdentifier](self, "currentExtensionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFActivityViewController _processJavaScriptFinalizeReturnedItems:forExtension:](self, "_processJavaScriptFinalizeReturnedItems:forExtension:", v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "activityViewController:didCompleteActivity:success:", self, v8, v5);
  if (v5 && objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEB230]))
  {
    v17 = 0;
    v18 = 0;
    v12 = -[_SFActivityViewController _containsProviderForDownloadActivityAndGetMIMEType:uti:](self, "_containsProviderForDownloadActivityAndGetMIMEType:uti:", &v18, &v17);
    v13 = v18;
    v14 = v17;
    if (v12)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = objc_msgSend(WeakRetained, "browserPersonaForActivityViewController:", self);
      else
        v15 = 0;
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v13, v14, 2, 0, v15);

    }
  }

}

- (BOOL)_containsProviderForDownloadActivityAndGetMIMEType:(id *)a3 uti:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_SFActivityViewController activityItemProviders](self, "activityItemProviders", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {
    v12 = 0;
    goto LABEL_18;
  }
  v8 = v7;
  v9 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "quickLookDocument");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mimeType");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uti");
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
        v12 = 1;
        goto LABEL_18;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "webView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_MIMEType");
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v15 = (const __CFString *)*MEMORY[0x1E0CA5A90];
        v16 = (__CFString *)*a3;
LABEL_16:
        *a4 = (id)(id)UTTypeCreatePreferredIdentifierForTag(v15, v16, 0);
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_retainAutorelease(CFSTR("application/x-webarchive"));
        *a3 = v16;
        v15 = (const __CFString *)*MEMORY[0x1E0CA5A90];
        goto LABEL_16;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    v12 = 0;
    if (v8)
      continue;
    break;
  }
LABEL_18:

  return v12;
}

- (void)_executeActivity
{
  void *v3;
  void *v4;
  _SFPrintController *printController;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  _SFActivityViewController *v9;

  -[_SFActivityViewController activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_isExecutedInProcess"))
    -[_SFActivityViewController prepareJavaScriptExtensionItemForActivity:](self, "prepareJavaScriptExtensionItemForActivity:", v3);
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CEB1D8]))
  {
    printController = self->_printController;
    if (printController)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45___SFActivityViewController__executeActivity__block_invoke;
      v7[3] = &unk_1E4AC15B8;
      v8 = v3;
      v9 = self;
      -[_SFPrintController preparePrintInteractionControllerForUsage:completion:](printController, "preparePrintInteractionControllerForUsage:completion:", 2, v7);

    }
    else
    {
      objc_msgSend(v3, "activityDidFinish:", 0);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFActivityViewController;
    -[_SFActivityViewController _executeActivity](&v6, sel__executeActivity);
  }

}

- (void)_performActivity:(id)a3
{
  SFSaveToFilesActivity *v4;
  void *v5;
  int v6;
  NSObject *v7;
  SFSaveToFilesActivity *v8;
  id WeakRetained;
  objc_super v10;
  uint8_t buf[16];

  v4 = (SFSaveToFilesActivity *)a3;
  -[SFSaveToFilesActivity activityType](v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEB230]);

  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_INFO, "Performing SFSaveToFilesActivity", buf, 2u);
    }
    v8 = -[SFSaveToFilesActivity initWithActivityItemProviderCollection:customizationController:]([SFSaveToFilesActivity alloc], "initWithActivityItemProviderCollection:customizationController:", self->_itemProviderCollection, self->_customizationController);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SFSaveToFilesActivity setSupportsDownloads:](v8, "setSupportsDownloads:", objc_msgSend(WeakRetained, "activityViewControllerSupportsDownloads:", self));

  }
  else
  {
    v8 = v4;
  }
  v10.receiver = self;
  v10.super_class = (Class)_SFActivityViewController;
  -[_SFActivityViewController _performActivity:](&v10, sel__performActivity_, v8);

}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v9, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB220]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB1E8]))
  {
    -[_SFActivityViewController _preparePrint:completion:](self, "_preparePrint:completion:", v9, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "activityViewController:prepareActivity:completion:", self, v9, v6);
    }
    else if (v6)
    {
      v6[2](v6);
    }

  }
}

- (void)_preparePrint:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _SFPrintController *printController;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[_SFPrintController printInteractionController](self->_printController, "printInteractionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrintInteractionController:", v9);

    v8 = 0;
  }
  printController = self->_printController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54___SFActivityViewController__preparePrint_completion___block_invoke;
  v13[3] = &unk_1E4AC18A0;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[_SFPrintController preparePrintInteractionControllerForUsage:completion:](printController, "preparePrintInteractionControllerForUsage:completion:", v8, v13);

}

- (void)_updateActivityItems:(id)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  NSArray *initialApplicationActivities;
  NSArray *v8;
  NSArray *activityItemProviders;
  NSArray *v10;

  v4 = (NSArray *)a3;
  -[_SFActivityViewController customizationController](self, "customizationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedContentType");

  if (v6)
    initialApplicationActivities = 0;
  else
    initialApplicationActivities = self->_initialApplicationActivities;
  v8 = initialApplicationActivities;
  -[_SFActivityViewController _updateActivityItems:applicationActivities:](self, "_updateActivityItems:applicationActivities:", v4, v8);
  activityItemProviders = self->_activityItemProviders;
  self->_activityItemProviders = v4;
  v10 = v4;

}

- (void)_updateActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFActivityViewController;
  v6 = a3;
  -[_SFActivityViewController _updateActivityItems:applicationActivities:](&v7, sel__updateActivityItems_applicationActivities_, v6, a4);
  -[_SFActivityViewController _updatePrintControllerWithActivityItems:](self, "_updatePrintControllerWithActivityItems:", v6, v7.receiver, v7.super_class);

}

- (id)excludedActivityTypes
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_SFActivityViewController;
  -[_SFActivityViewController excludedActivityTypes](&v9, sel_excludedActivityTypes);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v10[0] = CFSTR("com.apple.UIKit.activity.AddToHomeScreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)prepareJavaScriptExtensionItemForActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFActivityViewController setCurrentExtensionIdentifier:](self, "setCurrentExtensionIdentifier:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_SFActivityViewController _extensionItemForExtensionActivity:](self, "_extensionItemForExtensionActivity:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v7, "_injectedJavaScriptResult:", v4);
      objc_msgSend(v7, "applicationExtension");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[_SFActivityViewController setCurrentExtensionIdentifier:](self, "setCurrentExtensionIdentifier:", v6);
    }

  }
}

- (id)_javaScriptProcessingFileURLInExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("NSExtensionJavaScriptPreprocessingFile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "_extensionBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("js"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_extensionItemForExtensionActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _SFActivityViewController *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "applicationExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFActivityViewController _javaScriptProcessingFileURLInExtension:](self, "_javaScriptProcessingFileURLInExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v5, 4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
      v8 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAttachments:", v9);

      WeakRetained = objc_loadWeakRetained((id *)&self->_sharingExtensionController);
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "prepareJavaScriptWorldForSharingExtension:javaScript:", v11, v6);

      v12 = *MEMORY[0x1E0CA5C30];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke;
      v14[3] = &unk_1E4AC0D00;
      v15 = v4;
      v16 = self;
      objc_msgSend(v8, "registerItemForTypeIdentifier:loadHandler:", v12, v14);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_processJavaScriptFinalizeReturnedItems:(id)a3 forExtension:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id WeakRetained;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (!v7 || !v8)
    goto LABEL_23;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v6;
  v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v23)
  {

LABEL_22:
    WeakRetained = objc_loadWeakRetained((id *)&self->_sharingExtensionController);
    objc_msgSend(WeakRetained, "finalizeJavaScriptForSharingExtension:arguments:", v7, MEMORY[0x1E0C9AA70]);

    goto LABEL_23;
  }
  v20 = v6;
  obj = v9;
  v10 = 0;
  v22 = *(_QWORD *)v32;
  v11 = *MEMORY[0x1E0CA5C30];
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v32 != v22)
        objc_enumerationMutation(obj);
      v24 = v12;
      objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12), "attachments");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v18, "hasItemConformingToTypeIdentifier:", v11))
            {
              v25[0] = MEMORY[0x1E0C809B0];
              v25[1] = 3221225472;
              v25[2] = __82___SFActivityViewController__processJavaScriptFinalizeReturnedItems_forExtension___block_invoke;
              v25[3] = &unk_1E4AC18F0;
              v25[4] = self;
              v26 = v7;
              objc_msgSend(v18, "loadItemForTypeIdentifier:options:completionHandler:", v11, 0, v25);

              v10 = 1;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v15);
      }

      v12 = v24 + 1;
    }
    while (v24 + 1 != v23);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v23);

  v6 = v20;
  if ((v10 & 1) == 0)
    goto LABEL_22;
LABEL_23:

}

- (void)setCustomizationController:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_customizationController, a3);
  v5 = a3;
  -[_SFActivityViewController setObjectManipulationDelegate:](self, "setObjectManipulationDelegate:", v5);

}

- (void)customizationControllerCustomizationsDidChange:(id)a3
{
  _SFActivityItemProviderCollection *itemProviderCollection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *activityTypesExcludedDueToSelectedCustomization;
  NSMutableSet *v10;
  NSMutableSet *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableSet *v19;
  NSMutableSet *v20;
  NSMutableSet *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  itemProviderCollection = self->_itemProviderCollection;
  -[_SFActivityViewController customizationController](self, "customizationController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFActivityItemProviderCollection activityItemProvidersWithCustomizationController:](itemProviderCollection, "activityItemProvidersWithCustomizationController:", v5);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E20];
  -[_SFActivityViewController excludedActivityTypes](self, "excludedActivityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  activityTypesExcludedDueToSelectedCustomization = self->_activityTypesExcludedDueToSelectedCustomization;
  if (activityTypesExcludedDueToSelectedCustomization)
  {
    v10 = activityTypesExcludedDueToSelectedCustomization;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  v11 = self->_activityTypesExcludedDueToSelectedCustomization;
  self->_activityTypesExcludedDueToSelectedCustomization = v10;

  objc_msgSend(v8, "minusSet:", self->_activityTypesExcludedDueToSelectedCustomization);
  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFActivityViewController setExcludedActivityTypes:](self, "setExcludedActivityTypes:", v12);

  -[NSMutableSet removeAllObjects](self->_activityTypesExcludedDueToSelectedCustomization, "removeAllObjects");
  if (objc_msgSend(v25, "count") == 1)
  {
    objc_msgSend(v25, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityViewController excludedActivityTypes](self, "excludedActivityTypes");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = (void *)MEMORY[0x1E0C9AA60];
    if (v14)
      v16 = (void *)v14;
    v17 = v16;

    objc_msgSend(v13, "excludedActivityTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSMutableSet *)objc_msgSend(v18, "mutableCopy");
    v20 = self->_activityTypesExcludedDueToSelectedCustomization;
    self->_activityTypesExcludedDueToSelectedCustomization = v19;

    v21 = self->_activityTypesExcludedDueToSelectedCustomization;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](v21, "minusSet:", v22);

    -[NSMutableSet allObjects](self->_activityTypesExcludedDueToSelectedCustomization, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFActivityViewController setExcludedActivityTypes:](self, "setExcludedActivityTypes:", v24);
  }
  -[_SFActivityViewController _updateActivityItems:](self, "_updateActivityItems:", v25);

}

- (_SFSafariSharingExtensionController)sharingExtensionController
{
  return (_SFSafariSharingExtensionController *)objc_loadWeakRetained((id *)&self->_sharingExtensionController);
}

- (void)setSharingExtensionController:(id)a3
{
  objc_storeWeak((id *)&self->_sharingExtensionController, a3);
}

- (_SFActivityViewControllerDelegate)delegate
{
  return (_SFActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFActivityItemCustomizationController)customizationController
{
  return self->_customizationController;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (void)setSharingURL:(id)a3
{
  objc_storeStrong((id *)&self->_sharingURL, a3);
}

- (NSArray)activityItemProviders
{
  return self->_activityItemProviders;
}

- (_SFPrintController)printController
{
  return self->_printController;
}

- (void)setPrintController:(id)a3
{
  objc_storeStrong((id *)&self->_printController, a3);
}

- (NSString)currentExtensionIdentifier
{
  return self->_currentExtensionIdentifier;
}

- (void)setCurrentExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_activityItemProviders, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_customizationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sharingExtensionController);
  objc_storeStrong((id *)&self->_activityTypesExcludedDueToSelectedCustomization, 0);
  objc_storeStrong((id *)&self->_initialApplicationActivities, 0);
  objc_storeStrong((id *)&self->_itemProviderCollection, 0);
}

@end
