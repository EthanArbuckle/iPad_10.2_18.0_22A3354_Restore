@implementation AVTAvatarLibraryModel

- (AVTAvatarLibraryModel)initWithAvatarStore:(id)a3 avtViewSessionProvider:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarLibraryModel *v12;
  AVTAvatarLibraryModel *v13;
  AVTAvatarLibraryCreateNewItem *v14;
  AVTAvatarLibraryCreateNewItem *createNewItem;
  uint64_t v16;
  NSMutableArray *mutableLibraryItems;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AVTAvatarLibraryModel;
  v12 = -[AVTAvatarLibraryModel init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_avatarStore, a3);
    objc_storeStrong((id *)&v13->_environment, a5);
    v14 = objc_alloc_init(AVTAvatarLibraryCreateNewItem);
    createNewItem = v13->_createNewItem;
    v13->_createNewItem = v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13->_createNewItem);
    v16 = objc_claimAutoreleasedReturnValue();
    mutableLibraryItems = v13->_mutableLibraryItems;
    v13->_mutableLibraryItems = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v13->_viewSessionProvider, a4);
    objc_msgSend(v11, "notificationCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v13, sel_storeDidChangeNotification_, *MEMORY[0x1E0D006D8], 0);

  }
  return v13;
}

- (NSArray)libraryItems
{
  void *v2;
  void *v3;

  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (unint64_t)numberOfRecords
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AVTAvatarLibraryModel libraryItems](self, "libraryItems", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        objc_opt_class();
        v5 += objc_opt_isKindOfClass() & 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)storeDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryModel avatarStore](self, "avatarStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    -[AVTAvatarLibraryModel load](self, "load");
}

- (void)load
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D00840], "requestForCustomAvatars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryModel avatarStore](self, "avatarStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AVTAvatarLibraryModel_load__block_invoke;
  v5[3] = &unk_1EA51E128;
  v5[4] = self;
  objc_msgSend(v4, "fetchAvatarsForFetchRequest:completionHandler:", v3, v5);

}

void __29__AVTAvatarLibraryModel_load__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__AVTAvatarLibraryModel_load__block_invoke_2;
    v7[3] = &unk_1EA51D570;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __29__AVTAvatarLibraryModel_load__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataForRecords:", *(_QWORD *)(a1 + 40));
}

- (void)performActionOnItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVTAvatarLibraryModel presentActionSheetForRecordItem:atIndex:](self, "presentActionSheetForRecordItem:atIndex:", v9, a3);
  }
  else
  {
    -[AVTAvatarLibraryModel avatarStore](self, "avatarStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarLibraryModel viewSessionProvider](self, "viewSessionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:avtViewSessionProvider:](AVTAvatarEditorViewController, "viewControllerForCreatingAvatarInStore:avtViewSessionProvider:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTAvatarLibraryModel presentEditor:forCreating:](self, "presentEditor:forCreating:", v8, 1);
  }

}

- (void)presentEditor:(id)a3 forCreating:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTAvatarLibraryModel setIsCreatingAvatar:](self, "setIsCreatingAvatar:", v4);
  objc_msgSend(v6, "setDelegate:", self);
  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presetEditorViewController:", v6);

}

- (void)presentActionSheetForRecordItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  unint64_t v37;
  _QWORD v38[5];
  id v39;
  unint64_t v40;
  _QWORD v41[5];
  id v42;
  unint64_t v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  AVTAvatarLibraryModel *v51;

  v6 = a3;
  if (v6)
  {
    v37 = a4;
    v7 = v6;
    objc_msgSend(v6, "avatarRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AVTAvatarUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1EA5207B8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke;
    v49[3] = &unk_1EA51E150;
    v13 = v8;
    v50 = v13;
    v51 = self;
    +[AVTComponentFactory alertActionWithTitle:style:handler:](AVTComponentFactory, "alertActionWithTitle:style:handler:", v11, 0, v49);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v14);

    AVTAvatarUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHARE"), &stru_1EA5207B8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v12;
    v46[1] = 3221225472;
    v46[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_2;
    v46[3] = &unk_1EA51E178;
    v46[4] = self;
    v17 = v13;
    v47 = v17;
    v35 = v7;
    v18 = v7;
    v48 = v18;
    +[AVTComponentFactory alertActionWithTitle:style:handler:](AVTComponentFactory, "alertActionWithTitle:style:handler:", v16, 0, v46);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v19);

    AVTAvatarUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SHARE ALL"), &stru_1EA5207B8, CFSTR("Localized"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_3;
    v44[3] = &unk_1EA51E150;
    v44[4] = self;
    v36 = v18;
    v45 = v36;
    +[AVTComponentFactory alertActionWithTitle:style:handler:](AVTComponentFactory, "alertActionWithTitle:style:handler:", v21, 0, v44);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v22);

    -[AVTAvatarLibraryModel avatarStore](self, "avatarStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend(v23, "canCreateAvatarWithError:", 0);

    if ((_DWORD)v21)
    {
      AVTAvatarUIBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("DUPLICATE"), &stru_1EA5207B8, CFSTR("Localized"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_4;
      v41[3] = &unk_1EA51E1F0;
      v41[4] = self;
      v42 = v17;
      v43 = v37;
      +[AVTComponentFactory alertActionWithTitle:style:handler:](AVTComponentFactory, "alertActionWithTitle:style:handler:", v25, 0, v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAction:", v26);

    }
    AVTAvatarUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1EA5207B8, CFSTR("Localized"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_7;
    v38[3] = &unk_1EA51E1F0;
    v38[4] = self;
    v39 = v17;
    v40 = v37;
    v29 = v17;
    +[AVTComponentFactory alertActionWithTitle:style:handler:](AVTComponentFactory, "alertActionWithTitle:style:handler:", v28, 0, v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v30);

    AVTAvatarUIBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1EA5207B8, CFSTR("Localized"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTComponentFactory alertActionWithTitle:style:handler:](AVTComponentFactory, "alertActionWithTitle:style:handler:", v32, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v33);

    -[AVTAvatarLibraryModel delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "presentUIViewController:forItem:", v9, v36);

    v6 = v35;
  }

}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewSessionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "avatarStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarEditorViewController viewControllerForEditingAvatar:avtViewSessionProvider:store:](AVTAvatarEditorViewController, "viewControllerForEditingAvatar:avtViewSessionProvider:store:", v2, v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "presentEditor:forCreating:", v5, 0);
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presetShareSheetWithRecords:fromItem:", v3, a1[6]);

}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "avatarStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00840], "requestForCustomAvatars");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarsForFetchRequest:error:", v3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "presetShareSheetWithRecords:fromItem:", v5, *(_QWORD *)(a1 + 40));
    v4 = v5;
  }

}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "avatarStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_5;
  v5[3] = &unk_1EA51E1C8;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  objc_msgSend(v2, "duplicateAvatar:completionBlock:", v3, v5);

}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_6;
    block[3] = &unk_1EA51E1A0;
    block[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 40);
    v10 = v7;
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "insertItemForRecord:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) + 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didAddRecord:", *(_QWORD *)(a1 + 40));

}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "avatarStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_8;
  v5[3] = &unk_1EA51E218;
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v6 = v3;
  objc_msgSend(v2, "deleteAvatar:completionHandler:", v6, v5);

}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_8(_QWORD *a1, int a2)
{
  uint64_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_9;
    block[3] = &unk_1EA51E1A0;
    v3 = (void *)a1[5];
    v2 = a1[6];
    block[4] = a1[4];
    v6 = v2;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__AVTAvatarLibraryModel_presentActionSheetForRecordItem_atIndex___block_invoke_9(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeItemForRecordAtIndex:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDeleteRecord:", *(_QWORD *)(a1 + 40));

}

- (id)libraryItemsFromAvatarRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVTAvatarLibraryRecordItem *v12;
  void *v13;
  AVTAvatarLibraryRecordItem *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = [AVTAvatarLibraryRecordItem alloc];
        -[AVTAvatarLibraryModel environment](self, "environment", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[AVTAvatarLibraryRecordItem initWithAvatarRecord:environment:](v12, "initWithAvatarRecord:environment:", v11, v13);

        objc_msgSend(v5, "addObject:", v14);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  -[AVTAvatarLibraryModel avatarStore](self, "avatarStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "canCreateAvatarWithError:", 0);

  if (v16)
  {
    -[AVTAvatarLibraryModel createNewItem](self, "createNewItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  return v5;
}

- (void)insertItemForRecord:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  AVTAvatarLibraryRecordItem *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AVTAvatarLibraryRecordItem *v22;

  v6 = a3;
  v7 = [AVTAvatarLibraryRecordItem alloc];
  -[AVTAvatarLibraryModel environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AVTAvatarLibraryRecordItem initWithAvatarRecord:environment:](v7, "initWithAvatarRecord:environment:", v6, v8);

  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v22, a4);

  -[AVTAvatarLibraryModel avatarStore](self, "avatarStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canCreateAvatarWithError:", 0);
  if ((v11 & 1) != 0)
    goto LABEL_4;
  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryModel createNewItem](self, "createNewItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarLibraryModel createNewItem](self, "createNewItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v15);

LABEL_4:
    v16 = v11 ^ 1;

    goto LABEL_6;
  }
  v16 = 0;
LABEL_6:
  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0CB36B8];
    -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "indexSetWithIndex:", objc_msgSend(v20, "count") - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertItemsAtIndexes:deleteItemsAtIndexes:reloadItemsAtIndexes:", v18, v21, 0);

  }
  else
  {
    objc_msgSend(v17, "insertItemsAtIndexes:deleteItemsAtIndexes:reloadItemsAtIndexes:", v18, 0, 0);
  }

}

- (void)removeItemForRecordAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v4 = self;
  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", a3);

  objc_msgSend(v4, "avatarStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "canCreateAvatarWithError:", 0) & 1) != 0)
  {
    objc_msgSend(v4, "mutableLibraryItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createNewItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (!v9)
    {
      objc_msgSend(v4, "mutableLibraryItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "createNewItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      objc_msgSend(v4, "delegate");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB36B8];
      objc_msgSend(v4, "mutableLibraryItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexSetWithIndex:", objc_msgSend(v4, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 1;
      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "delegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v13 = 0;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "insertItemsAtIndexes:deleteItemsAtIndexes:reloadItemsAtIndexes:", v13, v15, 0);

  if (v14)
  {

  }
}

- (void)reloadDataForRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryModel libraryItemsFromAvatarRecords:](self, "libraryItemsFromAvatarRecords:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setArray:", v6);
  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryModel libraryItems](self, "libraryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didUpdateLibraryItems:", v7);

}

- (void)updateForCreatedRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTAvatarLibraryModel libraryItems](self, "libraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarLibraryModel insertItemForRecord:atIndex:](self, "insertItemForRecord:atIndex:", v4, objc_msgSend(v5, "count") - 1);

  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didAddRecord:", v4);

}

- (void)updateForEditedRecord:(id)a3
{
  id v4;
  int64_t v5;
  AVTAvatarLibraryRecordItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTAvatarLibraryRecordItem *v12;

  v4 = a3;
  v5 = -[AVTAvatarLibraryModel indexForRecord:](self, "indexForRecord:", v4);
  v6 = [AVTAvatarLibraryRecordItem alloc];
  -[AVTAvatarLibraryModel environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTAvatarLibraryRecordItem initWithAvatarRecord:environment:](v6, "initWithAvatarRecord:environment:", v4, v7);

  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v5, v12);

  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertItemsAtIndexes:deleteItemsAtIndexes:reloadItemsAtIndexes:", 0, 0, v10);

  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didEditRecord:", v4);

}

- (int64_t)indexForRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AVTAvatarLibraryModel mutableLibraryItems](self, "mutableLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AVTAvatarLibraryModel_indexForRecord___block_invoke;
  v9[3] = &unk_1EA51E240;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __40__AVTAvatarLibraryModel_indexForRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "avatarRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)presetShareSheetWithRecords:(id)a3 fromItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1F03FF178) & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object protocol for %@"), v12);
        v13 = v12;
        if ((objc_msgSend(v13, "isPuppet") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v13);
          objc_msgSend(v6, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2D8]), "initWithActivityItems:applicationActivities:", v6, 0);
  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentUIViewController:forItem:", v14, v17);

}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__AVTAvatarLibraryModel_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke;
  v10[3] = &unk_1EA51D570;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "dismissController:completion:", v7, v10);

}

uint64_t __78__AVTAvatarLibraryModel_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCreatingAvatar");
  v3 = *(void **)(a1 + 32);
  if (!v2)
    return objc_msgSend(v3, "updateForEditedRecord:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setIsCreatingAvatar:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateForCreatedRecord:", *(_QWORD *)(a1 + 40));
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarLibraryModel setIsCreatingAvatar:](self, "setIsCreatingAvatar:", 0);
  -[AVTAvatarLibraryModel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissController:completion:", v4, 0);

}

- (AVTAvatarLibraryModelDelegate)delegate
{
  return (AVTAvatarLibraryModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTViewSessionProvider)viewSessionProvider
{
  return self->_viewSessionProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarLibraryCreateNewItem)createNewItem
{
  return self->_createNewItem;
}

- (NSMutableArray)mutableLibraryItems
{
  return self->_mutableLibraryItems;
}

- (BOOL)isCreatingAvatar
{
  return self->_isCreatingAvatar;
}

- (void)setIsCreatingAvatar:(BOOL)a3
{
  self->_isCreatingAvatar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableLibraryItems, 0);
  objc_storeStrong((id *)&self->_createNewItem, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_viewSessionProvider, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
