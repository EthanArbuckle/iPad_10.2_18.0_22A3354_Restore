@implementation WFShareActionUIKitUserInterface

- (void)presentExtensionViewControllerForItems:(id)a3 extensionBundleIdentifier:(id)a4 extensionPointIdentifier:(id)a5 isContentManaged:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  id v57;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  WFShareActionUIKitUserInterface *v67;
  id v68;
  id v69;
  _QWORD *v70;
  id v71;
  _QWORD v72[5];
  id v73;
  id location;
  id v75;
  _QWORD v76[4];
  BOOL v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  const __CFString *v86;
  void *v87;
  id v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint8_t v91[128];
  _BYTE buf[24];
  void *v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v62 = a5;
  v60 = v9;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    v43 = v10;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareActionUIKitUserInterface.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

    v10 = v43;
    if (v43)
      goto LABEL_3;
  }
  v45 = v10;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareActionUIKitUserInterface.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleIdentifier"));

  v10 = v45;
LABEL_3:
  if (!v62)
  {
    v47 = v10;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareActionUIKitUserInterface.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier"));

    v10 = v47;
  }
  v75 = 0;
  v56 = v10;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v10, &v75);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v75;
  if (!v61)
  {
    getWFActionsLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFShareActionUIKitUserInterface presentExtensionViewControllerForItems:extensionBundleIdent"
                           "ifier:extensionPointIdentifier:isContentManaged:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v56;
      *(_WORD *)&buf[22] = 2114;
      v93 = v57;
      _os_log_impl(&dword_21EB60000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create NSExtrension for %{public}@: %{public}@", buf, 0x20u);
    }

    -[WFShareActionUIKitUserInterface finishWithExtensionItems:error:](self, "finishWithExtensionItems:error:", 0, v57);
    goto LABEL_43;
  }
  objc_initWeak(&location, self);
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__2850;
  v72[4] = __Block_byref_object_dispose__2851;
  v73 = v9;
  v11 = v73;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSArray * _Nonnull WFActivityItemValuesFromContentItems(NSArray<WFContentItem *> * _Nonnull __strong)");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("WFShareActionUIKitUserInterface.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItems"));

  }
  v12 = objc_alloc(MEMORY[0x24BE8F650]);
  v13 = (void *)objc_msgSend(v12, "initWithActivityItems:applicationActivities:", MEMORY[0x24BDBD1A8], 0);
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __WFActivityItemValuesFromContentItems_block_invoke;
  v93 = &unk_24E343040;
  v94 = v13;
  v14 = v13;
  objc_msgSend(v11, "if_compactMap:", buf);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  v59 = v62;
  v63 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSArray<NSExtensionItem *> * _Nonnull WFExtensionItemsForActivityItemValues(NSArray * _Nonnull __strong, NSString * _Nonnull __strong, BOOL)");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("WFShareActionUIKitUserInterface.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityItemValues"));

    if (v62)
      goto LABEL_10;
LABEL_47:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSArray<NSExtensionItem *> * _Nonnull WFExtensionItemsForActivityItemValues(NSArray * _Nonnull __strong, NSString * _Nonnull __strong, BOOL)");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("WFShareActionUIKitUserInterface.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier"));

    goto LABEL_10;
  }
  if (!v62)
    goto LABEL_47;
LABEL_10:
  if (objc_msgSend(v59, "isEqualToString:", *MEMORY[0x24BE010E0]))
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v17 = v63;
    v18 = 0;
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
    if (!v19)
      goto LABEL_25;
    v20 = *(_QWORD *)v83;
    while (1)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v83 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        if (v18)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
          objc_msgSend(v18, "appendAttributedString:", v24);

          if ((isKindOfClass & 1) != 0)
            goto LABEL_20;
        }
        else
        {
          v18 = objc_alloc_init(MEMORY[0x24BDD1688]);
          if ((isKindOfClass & 1) != 0)
          {
LABEL_20:
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v22);
            objc_msgSend(v18, "appendAttributedString:", v25);

            continue;
          }
        }
        objc_msgSend(v18, "appendAttributedString:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v82, buf, 16);
      if (!v19)
      {
LABEL_25:

        goto LABEL_30;
      }
    }
  }
  v18 = 0;
LABEL_30:
  _NSExtensionItemsFromActivityItemValues();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v18)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v29 = v27;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v79;
      while (2)
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v79 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          if ((objc_msgSend(v63, "containsObject:", v33) & 1) == 0)
          {
            objc_msgSend(v33, "setAttributedContentText:", v18);
            v28 = v29;
            goto LABEL_41;
          }
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
        if (v30)
          continue;
        break;
      }
    }

    v34 = objc_alloc_init(MEMORY[0x24BDD1560]);
    objc_msgSend(v34, "setAttributedContentText:", v18);
    objc_msgSend(v29, "arrayByAddingObject:", v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v34;
LABEL_41:

  }
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = __WFExtensionItemsForActivityItemValues_block_invoke;
  v76[3] = &__block_descriptor_33_e32_v32__0__NSExtensionItem_8Q16_B24l;
  v77 = a6;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v76);

  v35 = *MEMORY[0x24BDD0C48];
  v88 = v59;
  v89[0] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = CFSTR("NSExtensionActivationRule");
  v90[0] = v36;
  v86 = CFSTR("extensionItems");
  objc_msgSend(v28, "if_compactMap:", &__block_literal_global_2855);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x24BDD1550];
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2;
  v64[3] = &unk_24E342F80;
  v70 = v72;
  objc_copyWeak(&v71, &location);
  v41 = v39;
  v65 = v41;
  v66 = v61;
  v67 = self;
  v42 = v28;
  v68 = v42;
  v69 = v59;
  objc_msgSend(v40, "extensionsWithMatchingAttributes:completion:", v41, v64);

  objc_destroyWeak(&v71);
  _Block_object_dispose(v72, 8);

  objc_destroyWeak(&location);
LABEL_43:

}

- (void)presentActivityViewControllerForItems:(id)a3 isContentManaged:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[5];

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BE8F650];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithActivityItems:applicationActivities:", v7, 0);

  -[WFShareActionUIKitUserInterface excludedActivityTypes](self, "excludedActivityTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExcludedActivityTypes:", v9);

  objc_msgSend(v8, "setIsContentManaged:", v4);
  objc_msgSend(v8, "setAllowsCustomPresentationStyle:", 1);
  objc_msgSend(v8, "setModalPresentationStyle:", 1);
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke;
  v14[3] = &unk_24E342FA8;
  v14[4] = self;
  objc_msgSend(v8, "setCompletionWithItemsHandler:", v14);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke_2;
  block[3] = &unk_24E3439C0;
  block[4] = self;
  v13 = v8;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)presentItems:(id)a3 extensionBundleIdentifier:(id)a4 extensionPointIdentifier:(id)a5 isContentManaged:(BOOL)a6
{
  if (a4)
    -[WFShareActionUIKitUserInterface presentExtensionViewControllerForItems:extensionBundleIdentifier:extensionPointIdentifier:isContentManaged:](self, "presentExtensionViewControllerForItems:extensionBundleIdentifier:extensionPointIdentifier:isContentManaged:", a3, a4, a5, a6);
  else
    -[WFShareActionUIKitUserInterface presentActivityViewControllerForItems:isContentManaged:](self, "presentActivityViewControllerForItems:isContentManaged:", a3, a6, a5);
}

- (void)showWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5 extensionPointIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  BOOL v28;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareActionUIKitUserInterface.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier"));

    if (v16)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareActionUIKitUserInterface.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareActionUIKitUserInterface.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("archivedItems"));

  if (!v15)
    goto LABEL_6;
LABEL_3:
  if (!v16)
    goto LABEL_7;
LABEL_4:
  -[WFShareActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v16);
  v17 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_24E343018;
  v25[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = a4;
  v19 = v15;
  v20 = v14;
  v21 = (id)objc_msgSend(v17, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v13, v18, v25);

}

- (void)finishWithExtensionItems:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFShareActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFShareActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFShareActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFShareActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __75__WFShareActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFShareActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)prewarmInput:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = a4;
  v6 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
        dispatch_group_enter(v6);
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke;
        v20[3] = &unk_24E343958;
        v21 = v6;
        objc_msgSend(v13, "prepareForPresentationWithCompletionHandler:", v20);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke_2;
  block[3] = &unk_24E3439E8;
  v18 = v5;
  v19 = v16;
  v14 = v5;
  v15 = v16;
  dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], block);

}

- (id)excludedActivityTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

void __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __59__WFShareActionUIKitUserInterface_prewarmInput_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __75__WFShareActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithExtensionItems:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  char v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke_2;
    v6[3] = &unk_24E342FF0;
    v4 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = v4;
    v9 = *(id *)(a1 + 48);
    v10 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v7, "prewarmInput:completion:", a2, v6);

  }
  else
  {
    getWFActionsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFShareActionUIKitUserInterface showWithArchivedItems:isContentManaged:extensionBundleIdentifier:extension"
            "PointIdentifier:completionHandler:]_block_invoke";
      _os_log_impl(&dword_21EB60000, v5, OS_LOG_TYPE_FAULT, "%s Could not unarchive input items.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "cancelPresentationWithCompletionHandler:", &__block_literal_global_152);
  }
}

uint64_t __143__WFShareActionUIKitUserInterface_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentItems:extensionBundleIdentifier:extensionPointIdentifier:isContentManaged:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(void **)(a1 + 32);
  if (a5)
  {
    v6 = 0;
    v7 = a5;
  }
  else
  {
    v6 = a4;
    v7 = 0;
  }
  return objc_msgSend(v5, "finishWithExtensionItems:error:", v6, v7);
}

uint64_t __90__WFShareActionUIKitUserInterface_presentActivityViewControllerForItems_isContentManaged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentContent:", *(_QWORD *)(a1 + 40));
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  id v48;
  void (**v49)(id, _QWORD, void *);
  void (**v50)(id, _QWORD, void *);
  void (**v51)(id, _QWORD, void *);
  id v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  __CFString *v65;
  void *v66;
  _QWORD *v67;
  id v68;
  void (**v69)(id, _QWORD, void *);
  void *v70;
  _QWORD *v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[2];
  void (*v76)(uint64_t, void *);
  void *v77;
  _QWORD *v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD aBlock[6];
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void (**v93)(id, _QWORD, void *);
  _QWORD *v94;
  _QWORD v95[3];
  char v96;
  _BYTE buf[24];
  void *v98;
  id v99;
  id v100;
  id v101;
  _QWORD *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v74 = a3;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__2850;
  v84[4] = __Block_byref_object_dispose__2851;
  v85 = 0;
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3;
  aBlock[3] = &unk_24E342EE0;
  aBlock[4] = *(_QWORD *)(a1 + 72);
  aBlock[5] = v84;
  v7 = (id *)(a1 + 80);
  aBlock[1] = 3221225472;
  objc_copyWeak(&v83, (id *)(a1 + 80));
  v8 = _Block_copy(aBlock);
  if (v5)
  {
    v80[0] = v6;
    v80[1] = 3221225472;
    v80[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_137;
    v80[3] = &unk_24E342F08;
    v81 = *(id *)(a1 + 40);
    objc_msgSend(v5, "if_firstObjectPassingTest:", v80);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      v37 = *(void **)(a1 + 48);
      WFLocalizedString(CFSTR("Input Not Supported"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Selected app does not support the provided input."));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0FC8];
      *(_QWORD *)&v103 = *MEMORY[0x24BDD0FD8];
      *((_QWORD *)&v103 + 1) = v41;
      *(_QWORD *)buf = v38;
      *(_QWORD *)&buf[8] = v39;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v103, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("WFShareActionUIKitUserInterfaceErrorDomain"), 0, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "finishWithExtensionItems:error:", 0, v43);
LABEL_39:

      goto LABEL_40;
    }
    v11 = *(void **)(a1 + 40);
    v13 = *(void **)(a1 + 56);
    v12 = *(void **)(a1 + 64);
    v75[0] = v6;
    v75[1] = 3221225472;
    v76 = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2_139;
    v77 = &unk_24E342F58;
    v78 = v84;
    objc_copyWeak(&v79, v7);
    v14 = v11;
    v15 = v13;
    v73 = v12;
    v72 = v8;
    v71 = v75;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("WFShareActionUIKitUserInterface.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extension"));

    }
    v70 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("WFShareActionUIKitUserInterface.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionItems"));

    }
    if (!v73)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("WFShareActionUIKitUserInterface.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier"));

    }
    if (!v72)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void WFConfiguredViewControllerForExtension(NSExtension * _Nonnull __strong, NSArray<NSExtensionItem *> * _Nonnull __strong, NSString * _Nonnull __strong, void (^ _Nonnull __strong)(NSArray * _Nullable __strong, NSError * _Nullable __strong), void (^ _Nonnull __strong)(UIViewController * _Nullable __strong))");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("WFShareActionUIKitUserInterface.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationCompletionBlock"));

    }
    if (!objc_msgSend(v73, "isEqualToString:", *MEMORY[0x24BE010E0]))
    {
      v44 = v14;
      v45 = v15;
      v46 = v72;
      v47 = v71;
      v95[0] = 0;
      v95[1] = v95;
      v95[2] = 0x2020000000;
      v96 = 0;
      *(_QWORD *)&v103 = v6;
      *((_QWORD *)&v103 + 1) = 3221225472;
      *(_QWORD *)&v104 = __WFConfiguredViewControllerForActionExtension_block_invoke;
      *((_QWORD *)&v104 + 1) = &unk_24E3430C8;
      *((_QWORD *)&v105 + 1) = v95;
      v48 = v46;
      *(_QWORD *)&v105 = v48;
      objc_msgSend(v44, "setRequestCompletionBlock:", &v103);
      v89 = v6;
      v90 = 3221225472;
      v91 = __WFConfiguredViewControllerForActionExtension_block_invoke_2;
      v92 = &unk_24E3430F0;
      v94 = v95;
      v49 = (void (**)(id, _QWORD, void *))v48;
      v93 = v49;
      objc_msgSend(v44, "setRequestCancellationBlock:", &v89);
      v86[0] = v6;
      v86[1] = 3221225472;
      v86[2] = __WFConfiguredViewControllerForActionExtension_block_invoke_3;
      v86[3] = &unk_24E343118;
      v88 = v95;
      v50 = v49;
      v87 = v50;
      objc_msgSend(v44, "setRequestInterruptionBlock:", v86);
      *(_QWORD *)buf = v6;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __WFConfiguredViewControllerForActionExtension_block_invoke_4;
      v98 = &unk_24E343140;
      v102 = v95;
      v51 = v50;
      v100 = v51;
      v52 = v44;
      v99 = v52;
      v53 = v47;
      v101 = v53;
      objc_msgSend(v52, "instantiateViewControllerWithInputItems:connectionHandler:", v45, buf);

      _Block_object_dispose(v95, 8);
LABEL_38:

      objc_destroyWeak(&v79);
      goto LABEL_39;
    }
    v16 = v14;
    v68 = v15;
    v69 = (void (**)(id, _QWORD, void *))v72;
    v67 = v71;
    if ((objc_msgSend(getSLComposeViewControllerClass(), "isAvailableForExtension:", v16) & 1) == 0)
    {
      WFExtensionCommunicationError(0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2](v69, 0, v17);
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(getSLComposeViewControllerClass(), "composeViewControllerForExtension:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      WFExtensionCommunicationError(0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v69[2](v69, 0, v34);
      goto LABEL_36;
    }
    v89 = v6;
    v90 = 3221225472;
    v91 = __WFConfiguredViewControllerForShareExtension_block_invoke;
    v92 = &unk_24E343088;
    v93 = v69;
    objc_msgSend(v17, "setCompletionHandler:", &v89);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v18 = v68;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
    v20 = v14;
    if (v19)
    {
      v21 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v104 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addExtensionItem:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i));
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v103, buf, 16);
      }
      while (v19);
    }

    v14 = v20;
    objc_msgSend(v16, "infoDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x24BDC1528]);
    objc_msgSend(v16, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithBundleIdentifier:error:", v26, 0);

    objc_msgSend(v27, "SDKVersion");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v30 = CFSTR("1.0");
    if (v28)
      v30 = (__CFString *)v28;
    v65 = v30;

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("NSExtensionActionWantsFullScreenPresentation"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v66, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("NSExtensionActionWantsFullScreenPresentation"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v31, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v54, "isVersion:greaterThanOrEqualToVersion:", v65, CFSTR("13.0"));

        if ((v63 & 1) != 0)
        {
          v32 = 0;
          v33 = -2;
          goto LABEL_28;
        }
LABEL_27:
        v32 = 1;
        v33 = 5;
LABEL_28:
        objc_msgSend(v17, "setModalPresentationStyle:", v33);
        objc_msgSend(v17, "setShouldForceNonAnimatedTransition:", v32);
        v76((uint64_t)v67, v17);

        v34 = v93;
LABEL_36:

        goto LABEL_37;
      }

    }
    goto LABEL_27;
  }
  getWFActionsLogObject();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WFShareActionUIKitUserInterface presentExtensionViewControllerForItems:extensionBundleIdentif"
                         "ier:extensionPointIdentifier:isContentManaged:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2114;
    v98 = v74;
    _os_log_impl(&dword_21EB60000, v35, OS_LOG_TYPE_ERROR, "%s Failed to find matching extensions for attributes %@: %{public}@", buf, 0x20u);
  }

  (*((void (**)(void *, _QWORD, id))v8 + 2))(v8, 0, v74);
LABEL_40:

  objc_destroyWeak(&v83);
  _Block_object_dispose(v84, 8);

}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_4;
  block[3] = &unk_24E342EB8;
  v12 = *(_OWORD *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 48));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v13);
}

uint64_t __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_137(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_2_139(uint64_t a1, void *a2)
{
  _QWORD v3[5];
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3_140;
  v3[3] = &unk_24E342F30;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_3_140(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentContent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_5;
    v8[3] = &unk_24E342E90;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v8);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    objc_destroyWeak(&v11);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "finishWithExtensionItems:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "finishWithExtensionItems:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __142__WFShareActionUIKitUserInterface_presentExtensionViewControllerForItems_extensionBundleIdentifier_extensionPointIdentifier_isContentManaged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_matchingDictionaryRepresentation");
}

@end
