@implementation WFShareExtensionActionUIKitUserInterface

- (void)performActionWithInput:(id)a3 inputConfiguration:(id)a4 socialServiceType:(id)a5 extensionBundleIdentifier:(id)a6 extensionUserInfo:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  WFShareExtensionActionUIKitUserInterface *v27;
  id v28;
  id v29;
  id v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[WFShareExtensionActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", a8);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke;
  v24[3] = &unk_24E343470;
  v25 = v16;
  v26 = v17;
  v27 = self;
  v28 = v14;
  v29 = v15;
  v30 = v18;
  v19 = v18;
  v20 = v15;
  v21 = v14;
  v22 = v17;
  v23 = v16;
  dispatch_async(MEMORY[0x24BDAC9B8], v24);

}

- (void)addContentToShareController:(id)a3 withInput:(id)a4 inputConfiguration:(id)a5 extensionUserInfo:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  WFShareExtensionActionUIKitUserInterface *v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = *MEMORY[0x24BE010B0];
  v17 = a4;
  objc_msgSend(v13, "objectForKey:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke;
  aBlock[3] = &unk_24E343538;
  v20 = v18;
  v31 = v20;
  v32 = self;
  v21 = v13;
  v33 = v21;
  v22 = v15;
  v36 = v22;
  v23 = v12;
  v34 = v23;
  v24 = v14;
  v35 = v24;
  v25 = _Block_copy(aBlock);
  -[WFShareExtensionActionUIKitUserInterface contentItemClassesFromInputConfiguration:](self, "contentItemClassesFromInputConfiguration:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_6;
    v27[3] = &unk_24E343560;
    v28 = v22;
    v29 = v25;
    objc_msgSend(v17, "generateCollectionByCoercingToItemClasses:completionHandler:", v26, v27);

    v17 = v28;
  }
  else
  {
    (*((void (**)(void *, id))v25 + 2))(v25, v17);
  }

}

- (id)contentItemClassesFromInputConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE01098]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_4364);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)inputContentItemClassesFromInputConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE010A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_325);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)finishWithContentCollection:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFShareExtensionActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFShareExtensionActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFShareExtensionActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFShareExtensionActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __84__WFShareExtensionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFShareExtensionActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

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

uint64_t __84__WFShareExtensionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithContentCollection:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

Class __90__WFShareExtensionActionUIKitUserInterface_inputContentItemClassesFromInputConfiguration___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

Class __85__WFShareExtensionActionUIKitUserInterface_contentItemClassesFromInputConfiguration___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  _QWORD *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  char v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE010B8]))
  {
    objc_msgSend(*(id *)(a1 + 40), "inputContentItemClassesFromInputConfiguration:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_2;
    v26[3] = &unk_24E3434C0;
    v28 = *(id *)(a1 + 72);
    v27 = *(id *)(a1 + 56);
    objc_msgSend(v3, "generateCollectionByCoercingToItemClasses:completionHandler:", v4, v26);

LABEL_16:
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BE010A8]))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BE010D8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE010C0]);
    v6 = (_QWORD *)MEMORY[0x24BE010C8];
    if ((v5 & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE010C8]);
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE010D0]) & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", *v6);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v3, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_4;
    v22[3] = &unk_24E3434E8;
    v24 = v7;
    v12 = v9;
    v23 = v12;
    v25 = v8;
    objc_msgSend(v10, "if_compactMap:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, *MEMORY[0x24BE19768]);

    objc_msgSend(v14, "setObject:forKey:", v13, *MEMORY[0x24BDD0C38]);
    objc_msgSend(v14, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 64));
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setUserInfo:", v14);
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v18);
      objc_msgSend(v17, "setAttributedContentText:", v19);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 56), "addExtensionItem:", v17);
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_5;
    v20[3] = &unk_24E343510;
    v21 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x24BDAC9B8], v20);

    goto LABEL_16;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_17:

}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a4;
  if (objc_msgSend(v7, "numberOfItems"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_3;
    v8[3] = &unk_24E343498;
    v10 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "getShareableObjectsOfTypes:options:completionHandler:", 15, 1, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  if (!*(_BYTE *)(a1 + 41))
  {
    v6 = 0;
  }
  else
  {
LABEL_5:
    objc_msgSend(v3, "minimalItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __137__WFShareExtensionActionUIKitUserInterface_addContentToShareController_withInput_inputConfiguration_extensionUserInfo_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v31 = v7;
    v32 = v6;
    v33 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    v10 = a1;
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v36;
      v13 = 0x24BDBC000uLL;
      v14 = 0x24BDD1000uLL;
      do
      {
        v15 = 0;
        v34 = v11;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v8);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(v10 + 32), "addURL:", v16);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v33, "addObject:", v16);
            }
            else
            {
              v17 = v12;
              v18 = v10;
              v19 = v13;
              v20 = v8;
              v21 = v14;
              objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE19598], "typeWithClassName:frameworkName:location:", CFSTR("UIImage"), CFSTR("UIKit"), 2);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v22, "conformsToType:", v23);

              if (v24)
              {
                v10 = v18;
                objc_msgSend(*(id *)(v18 + 32), "addImage:", v16);
                v14 = v21;
                v8 = v20;
                v13 = v19;
                v12 = v17;
                v11 = v34;
              }
              else
              {
                objc_opt_class();
                v14 = v21;
                v8 = v20;
                v13 = v19;
                v10 = v18;
                v12 = v17;
                v11 = v34;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_setAssociatedObject(*(id *)(v18 + 32), v16, v16, (void *)1);
                  v25 = *(void **)(v18 + 32);
                  objc_msgSend(v16, "fileURL");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v25;
                  v10 = v18;
                  objc_msgSend(v27, "addURL:", v26);

                }
              }
            }
          }
          ++v15;
        }
        while (v11 != v15);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v11);
    }

    v28 = v10;
    v29 = *(void **)(v10 + 32);
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInitialText:", v30);

    (*(void (**)(void))(*(_QWORD *)(v28 + 40) + 16))();
    v7 = v31;
    v6 = v32;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  if (!objc_msgSend(*(id *)(a1 + 32), "length")
    || (objc_msgSend(getSLComposeViewControllerClass_4381(), "composeViewControllerForServiceType:", *(_QWORD *)(a1 + 32)), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (getSLComposeViewControllerClass_4381(), (objc_opt_respondsToSelector() & 1) != 0))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v3, &v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 48), "finishWithContentCollection:error:", 0, v5);
        goto LABEL_9;
      }
      objc_msgSend(getSLComposeViewControllerClass_4381(), "composeViewControllerForExtension:", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }
  }
  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_2;
  v10[3] = &unk_24E343448;
  v10[4] = *(_QWORD *)(a1 + 48);
  v11 = v2;
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 32);
  v5 = v2;
  v9 = (id)objc_msgSend(v6, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v7, v8, v10);

LABEL_9:
}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_3;
  v8[3] = &unk_24E343420;
  objc_copyWeak(&v11, &location);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v4, "addContentToShareController:withInput:inputConfiguration:extensionUserInfo:completionHandler:", v5, v3, v6, v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_3(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v10 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    v11 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_4;
    v16[3] = &unk_24E3433D0;
    v16[4] = WeakRetained;
    v17 = v7;
    objc_msgSend(a1[4], "setCompletionHandler:", v16);
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_5;
    block[3] = &unk_24E3433F8;
    v13 = a1[5];
    v14 = a1[4];
    v15 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(WeakRetained, "finishWithContentCollection:error:", 0, v8);
  }

}

void __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v5, "finishWithContentCollection:error:", 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithContentCollection:error:", 0, v6);

  }
}

uint64_t __166__WFShareExtensionActionUIKitUserInterface_performActionWithInput_inputConfiguration_socialServiceType_extensionBundleIdentifier_extensionUserInfo_completionHandler___block_invoke_5(id *a1)
{
  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("com.apple.social.twitter")))
    objc_msgSend(a1[5], "setModalPresentationStyle:", 1);
  return objc_msgSend(a1[6], "presentContent:", a1[5]);
}

@end
