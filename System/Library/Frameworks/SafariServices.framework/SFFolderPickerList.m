@implementation SFFolderPickerList

- (SFFolderPickerList)initWithBookmarkCollection:(id)a3 style:(unint64_t)a4
{
  id v7;
  SFFolderPickerList *v8;
  SFFolderPickerList *v9;
  SFFolderPickerList *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFFolderPickerList;
  v8 = -[SFFolderPickerList init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    objc_storeStrong((id *)&v8->_bookmarkCollection, a3);
    v10 = v9;
  }

  return v9;
}

- (id)folderListItemsIgnoringIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t style;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!self->_style)
  {
    -[WebBookmarkCollection favoritesFolder](self->_bookmarkCollection, "favoritesFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFolderPickerList _appendFolderAndChildren:toArray:depth:ignoringIdentifiers:](self, "_appendFolderAndChildren:toArray:depth:ignoringIdentifiers:", v6, v5, 0, v4);

  }
  -[SFFolderPickerList _appendPerTabGroupFavoritesIntoArray:](self, "_appendPerTabGroupFavoritesIntoArray:", v5);
  style = self->_style;
  -[WebBookmarkCollection rootBookmark](self->_bookmarkCollection, "rootBookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (style == 1)
    -[SFFolderPickerList _appendChildrenOfFolder:toArray:depth:ignoringIdentifiers:](self, "_appendChildrenOfFolder:toArray:depth:ignoringIdentifiers:", v8, v5, 0, v4);
  else
    -[SFFolderPickerList _appendFolderAndChildren:toArray:depth:ignoringIdentifiers:](self, "_appendFolderAndChildren:toArray:depth:ignoringIdentifiers:", v8, v5, 0, v4);

  return v5;
}

- (void)_appendChildrenOfFolder:(id)a3 toArray:(id)a4 depth:(unint64_t)a5 ignoringIdentifiers:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v10 = a6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WebBookmarkCollection subfoldersOfID:](self->_bookmarkCollection, "subfoldersOfID:", objc_msgSend(a3, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        if (self->_style
          || (-[WebBookmarkCollection bookmarkIsFavoritesFolder:](self->_bookmarkCollection, "bookmarkIsFavoritesFolder:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15)) & 1) == 0)
        {
          if (objc_msgSend(v16, "isSyncable"))
          {
            if (!objc_msgSend(v16, "isBookmarksMenuFolder")
              || (-[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", objc_msgSend(v16, "identifier")), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v17, "bookmarkCount"), v17, v18))
            {
              -[SFFolderPickerList _appendFolderAndChildren:toArray:depth:ignoringIdentifiers:](self, "_appendFolderAndChildren:toArray:depth:ignoringIdentifiers:", v16, v19, a5, v10);
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

}

- (void)_appendFolderAndChildren:(id)a3 toArray:(id)a4 depth:(unint64_t)a5 ignoringIdentifiers:(id)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if ((v13 & 1) == 0)
  {
    v14 = -[_SFFolderPickerItem _initWithBookmark:syntheticFolder:depth:]([_SFFolderPickerItem alloc], "_initWithBookmark:syntheticFolder:depth:", v15, 0, a5);
    objc_msgSend(v10, "addObject:", v14);

    -[SFFolderPickerList _appendChildrenOfFolder:toArray:depth:ignoringIdentifiers:](self, "_appendChildrenOfFolder:toArray:depth:ignoringIdentifiers:", v15, v10, a5 + 1, v11);
  }

}

- (void)_appendPerTabGroupFavoritesIntoArray:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  _SFFolderPickerItem *v8;
  void *v9;
  id v10;
  _SFFolderPickerItem *v11;
  SFSyntheticBookmarkFolder *v12;
  void *v13;
  SFSyntheticBookmarkFolder *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);
  if (objc_msgSend(WeakRetained, "hasNamedTabGroups"))
  {
    objc_msgSend(WeakRetained, "activeTabGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsTabGroupFavorites");
    if (v7)
    {
      v8 = [_SFFolderPickerItem alloc];
      objc_msgSend(WeakRetained, "syntheticBookmarkFolderForTabGroup:withAttribution:", v6, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_SFFolderPickerItem _initWithBookmark:syntheticFolder:depth:](v8, "_initWithBookmark:syntheticFolder:depth:", 0, v9, 0);
      objc_msgSend(v4, "addObject:", v10);

    }
    v11 = [_SFFolderPickerItem alloc];
    v12 = [SFSyntheticBookmarkFolder alloc];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SFSyntheticBookmarkFolder initWithBookmarkList:title:](v12, "initWithBookmarkList:title:", 0, v13);
    v15 = -[_SFFolderPickerItem _initWithBookmark:syntheticFolder:depth:](v11, "_initWithBookmark:syntheticFolder:depth:", 0, v14, 0);

    objc_msgSend(v4, "addObject:", v15);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(WeakRetained, "syntheticBookmarkFoldersIncludingActiveTabGroup:", v7 ^ 1u, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFFolderPickerItem _initWithBookmark:syntheticFolder:depth:]([_SFFolderPickerItem alloc], "_initWithBookmark:syntheticFolder:depth:", 0, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), 1);
          objc_msgSend(v4, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

  }
}

- (_SFSyntheticBookmarkProvider)syntheticBookmarkProvider
{
  return (_SFSyntheticBookmarkProvider *)objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);
}

- (void)setSyntheticBookmarkProvider:(id)a3
{
  objc_storeWeak((id *)&self->_syntheticBookmarkProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syntheticBookmarkProvider);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
}

@end
