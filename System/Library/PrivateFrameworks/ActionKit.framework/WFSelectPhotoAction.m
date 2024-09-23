@implementation WFSelectPhotoAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD520;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFSelectPhotoAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithPhotoPickerTypes_selectMultiple_completionHandler_, 0, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithPhotoPickerTypes_selectMultiple_completionHandler_, 0, 1);

  return v2;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v8[5];

  v5 = a3;
  -[WFSelectPhotoAction pickerTypes](self, "pickerTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFSelectPhotoAction selectMultiple](self, "selectMultiple");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_24F8BB6B0;
  v8[4] = self;
  objc_msgSend(v5, "showWithPhotoPickerTypes:selectMultiple:completionHandler:", v6, v7, v8);

}

- (id)pickerTypes
{
  void *v2;
  void *v3;

  -[WFSelectPhotoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPhotoPickerTypes"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v2);

  return v3;
}

- (BOOL)selectMultiple
{
  void *v2;
  char v3;

  -[WFSelectPhotoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSelectMultiplePhotos"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

void __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v21 = a3;
  objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "fetchOptionsWithError:", &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;

  if (v7)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v8 = (void *)getPHAssetClass_softClass_34894;
    v33 = getPHAssetClass_softClass_34894;
    v9 = MEMORY[0x24BDAC760];
    if (!getPHAssetClass_softClass_34894)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __getPHAssetClass_block_invoke_34895;
      v29[3] = &unk_24F8BB430;
      v29[4] = &v30;
      __getPHAssetClass_block_invoke_34895((uint64_t)v29);
      v8 = (void *)v31[3];
    }
    v10 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v10, "fetchAssetsWithLocalIdentifiers:options:", v5, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke_2;
    v26[3] = &unk_24F8BA018;
    v11 = (id)objc_opt_new();
    v27 = v11;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v26);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
          objc_msgSend(*(id *)(a1 + 32), "output");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v21);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v20);
  }

}

void __56__WFSelectPhotoAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

@end
