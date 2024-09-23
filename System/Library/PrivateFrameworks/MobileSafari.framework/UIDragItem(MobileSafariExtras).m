@implementation UIDragItem(MobileSafariExtras)

+ (void)_sf_loadObjectsFromDragItems:()MobileSafariExtras usingLocalObjectLoader:objectLoader:completionHandler:
{
  id v9;
  id v10;
  dispatch_group_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD aBlock[4];
  id v36;
  _QWORD *v37;
  _QWORD v38[6];
  int v39;

  v9 = a3;
  v10 = a6;
  v11 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3812000000;
  v38[3] = __Block_byref_object_copy__5;
  v38[4] = __Block_byref_object_dispose__5;
  v38[5] = &unk_18BB4097D;
  v13 = MEMORY[0x1E0C809B0];
  v39 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke;
  aBlock[3] = &unk_1E21E52C8;
  v37 = v38;
  v14 = v12;
  v36 = v14;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_2;
  v25[3] = &unk_1E21E5318;
  v29 = a4;
  v15 = _Block_copy(aBlock);
  v27 = v15;
  v28 = &v31;
  v16 = v11;
  v26 = v16;
  v30 = a5;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v25);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __117__UIDragItem_MobileSafariExtras___sf_loadObjectsFromDragItems_usingLocalObjectLoader_objectLoader_completionHandler___block_invoke_4;
  v21[3] = &unk_1E21E5340;
  v24 = v38;
  v17 = v14;
  v22 = v17;
  v18 = v10;
  v23 = v18;
  v19 = (void (**)(_QWORD))_Block_copy(v21);
  v20 = v19;
  if (*((_BYTE *)v32 + 24))
    v19[2](v19);
  else
    dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v19);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v38, 8);

}

+ (id)_sf_itemWithTabGroup:()MobileSafariExtras
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v3, "richTextForPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObject:", v5);

  if (objc_msgSend(v3, "isSyncable"))
  {
    v7 = (void *)MEMORY[0x1E0CA5920];
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "lastSelectedTabUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
    objc_msgSend(v7, "_sf_windowCreationActivityWithTabUUID:tabGroupUUID:browserControllerUUID:", v10, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "registerObject:visibility:", v14, 0);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v6);
  objc_msgSend(v15, "setLocalObject:", v3);

  return v15;
}

- (void)_sf_initWithBookmark:()MobileSafariExtras
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if ((objc_msgSend(v4, "isFolder") & 1) == 0)
  {
    objc_msgSend(v4, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_bestURLForUserTypedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB36C8];
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemProviderWithURL:title:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[_SFNavigationIntentBuilder builderWithModifierFlags:](_SFNavigationIntentBuilder, "builderWithModifierFlags:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationIntentWithBookmark:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB36C8]);
    objc_msgSend(MEMORY[0x1E0CA5920], "_sf_windowCreationActivityWithNavigationIntent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithObject:", v8);
LABEL_5:
    v12 = (id)v9;

    goto LABEL_6;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
LABEL_6:

  v13 = (void *)objc_msgSend(a1, "initWithItemProvider:", v12);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setLocalObject:", v4);
    v15 = v14;
  }

  return v14;
}

- (uint64_t)_sf_initWithSiriSuggestion:()MobileSafariExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36C8];
  objc_msgSend(v4, "pageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProviderWithURL:title:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(a1, "initWithItemProvider:", v8);
  return v9;
}

- (id)_sf_localBookmark
{
  void *v1;
  id v2;

  objc_msgSend(a1, "localObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)_sf_localURL
{
  void *v1;
  id v2;

  objc_msgSend(a1, "localObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)_sf_localTabGroup
{
  void *v1;
  id v2;

  objc_msgSend(a1, "localObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)safari_fluidCollectionViewSourceItem
{
  return objc_getAssociatedObject(a1, (const void *)fcvSourceItemKey);
}

- (void)safari_setFluidCollectionViewSourceItem:()MobileSafariExtras
{
  objc_setAssociatedObject(a1, (const void *)fcvSourceItemKey, a3, (void *)1);
}

- (id)safari_fluidCollectionViewSourceView
{
  return objc_getAssociatedObject(a1, (const void *)fcvSourceViewKey);
}

- (void)safari_setFluidCollectionViewSourceView:()MobileSafariExtras
{
  objc_setAssociatedObject(a1, (const void *)fcvSourceViewKey, a3, (void *)1);
}

@end
