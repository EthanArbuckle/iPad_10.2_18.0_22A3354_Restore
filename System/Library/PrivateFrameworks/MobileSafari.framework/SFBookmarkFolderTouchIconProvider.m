@implementation SFBookmarkFolderTouchIconProvider

void __42___SFBookmarkFolderTouchIconProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DCCB18], "readonlySafariBookmarkCollectionConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSkipsExternalNotifications:", 1);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA0]), "initWithConfiguration:checkIntegrity:", v5, 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[4];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "listWithID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke_2;
  v8[3] = &unk_1E21E2E50;
  v4 = *(_QWORD *)(a1 + 56);
  v8[4] = v9;
  v8[5] = v4;
  objc_msgSend(v3, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  _Block_object_dispose(v9, 8);
}

id __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;

  v6 = a2;
  if ((objc_msgSend(v6, "isFolder") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= *(_QWORD *)(a1 + 40))
      *a4 = 1;
    +[SFBookmarkTouchIconRequest requestWithBookmark:iconGenerationEnabled:](SFBookmarkTouchIconRequest, "requestWithBookmark:iconGenerationEnabled:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  _QWORD v15[4];
  id v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x1E0DCCBE8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue");

    objc_msgSend(v14[6], "bookmarkWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentOfFolderDidUpdateWithUUID:", v8);

    }
    objc_msgSend(v14, "allFolderUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14[6], "validBookmarkUUIDsFromUUIDs:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke_2;
      v15[3] = &unk_1E21E2E78;
      v16 = v11;
      v12 = v11;
      objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requestsWithFolderUUIDsDidBecomeInvalid:", v13);

    }
    WeakRetained = v14;
  }

}

uint64_t __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

@end
