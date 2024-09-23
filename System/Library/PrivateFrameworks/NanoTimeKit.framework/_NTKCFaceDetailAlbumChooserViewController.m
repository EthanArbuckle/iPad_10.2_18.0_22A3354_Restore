@implementation _NTKCFaceDetailAlbumChooserViewController

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0D7D248], "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setInterfaceThemeClass:", objc_opt_class());

  }
}

- (_NTKCFaceDetailAlbumChooserViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _NTKCFaceDetailAlbumChooserViewController *v11;
  _NTKCFaceDetailAlbumChooserViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v16.receiver = self;
  v16.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
  v11 = -[PUAlbumListViewController initWithSpec:isRootSharedAlbumList:](&v16, sel_initWithSpec_isRootSharedAlbumList_, v10, 0);
  v12 = v11;
  if (v11)
  {
    -[_NTKCFaceDetailAlbumChooserViewController setEditor:](v11, "setEditor:", v8);
    -[_NTKCFaceDetailAlbumChooserViewController setInGallery:](v12, "setInGallery:", v5);
    -[_NTKCFaceDetailAlbumChooserViewController setFace:](v12, "setFace:", v9);
    v13 = (void *)objc_opt_new();
    -[PUAlbumListViewController setSessionInfo:](v12, "setSessionInfo:", v13);

    -[_NTKCFaceDetailAlbumChooserViewController _title](v12, "_title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKCFaceDetailAlbumChooserViewController setTitle:](v12, "setTitle:", v14);

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
  -[PUAlbumListViewController viewDidLoad](&v6, sel_viewDidLoad);
  BPSBridgeTintColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKCFaceDetailAlbumChooserViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorStyle:", 1);

  -[_NTKCFaceDetailAlbumChooserViewController _reloadData](self, "_reloadData");
}

- (BOOL)shouldShowAllPhotosItem
{
  return 0;
}

- (BOOL)showAddNewAlbumPlaceholder
{
  return 0;
}

- (BOOL)_shouldShowAggregateItem
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  objc_super v24;
  objc_super v25;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "section");
  v9 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
  if (v8 < v9 || v8 - v9 >= v10)
  {
    v24.receiver = self;
    v24.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
    -[PUAlbumListViewController tableView:cellForRowAtIndexPath:](&v24, sel_tableView_cellForRowAtIndexPath_, v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)_NTKCFaceDetailAlbumChooserViewController;
    -[PUAlbumListViewController tableView:cellForRowAtIndexPath:](&v25, sel_tableView_cellForRowAtIndexPath_, v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v12;
    if (self->_selectedAlbum
      && (NTK_npto_uuid(v12),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          NTK_npto_uuid(self->_selectedAlbum),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "isEqual:", v14),
          v14,
          v13,
          (v15 & 1) != 0))
    {
      v16 = 3;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v11, "setAccessoryType:", v16);
    BPSForegroundColor();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v17);

    objc_msgSend(v11, "setSelectionStyle:", 3);
    v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    BPSCellHightlightColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    objc_msgSend(v11, "setSelectedBackgroundView:", v19);
    -[PUAlbumListViewController spec](self, "spec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stackSize");
    objc_msgSend(v11, "setSeparatorInset:", 0.0, v22 + 16.0 + 8.0, 0.0, 0.0);

  }
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  PHAssetCollection *v18;
  PHAssetCollection *selectedAlbum;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessoryType:", 3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "visibleCells", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v14 != v8)
          objc_msgSend(v14, "setAccessoryType:", 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v7, "section");
  v16 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
  if (v15 >= v16 && v15 - v16 < v17)
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v7);
    v18 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
    selectedAlbum = self->_selectedAlbum;
    self->_selectedAlbum = v18;

  }
}

- (void)sessionInfoStatusDidChange:(id)a3
{
  PHAssetCollection *selectedAlbum;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (objc_msgSend(a3, "status") == 1)
  {
    selectedAlbum = self->_selectedAlbum;
    if (selectedAlbum)
      v5 = selectedAlbum == self->_syncedAlbum;
    else
      v5 = 1;
    if (v5)
    {
      v11 = 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CD13B8];
      NTK_npto_uuid(selectedAlbum);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localIdentifierWithUUID:", v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[_NTKCFaceDetailAlbumChooserViewController editor](self, "editor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlbumIdentifier:", v11);

    -[_NTKCFaceDetailAlbumChooserViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_albumChooserDidFinish:", self);

  }
}

- (id)_title
{
  return NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_OPTION_LABEL_PHOTOS_SYNCED_ALBUM_ACTION_COMPANION"), CFSTR("Choose Album…"));
}

- (void)_reloadData
{
  void *v3;
  void *v4;
  id v5;

  -[_NTKCFaceDetailAlbumChooserViewController _set_allAlbums](self, "_set_allAlbums");
  -[_NTKCFaceDetailAlbumChooserViewController _set_selectedAlbum](self, "_set_selectedAlbum");
  objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:", self->_allAlbums, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController dataSourceManagerConfiguration](self, "dataSourceManagerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v5);
    objc_msgSend(v4, "setSeparateSectionsForSmartAndUserCollections:", 0);
    -[PUAlbumListViewController setDataSourceManagerConfiguration:](self, "setDataSourceManagerConfiguration:", v4);

  }
}

- (void)_set_allAlbums
{
  NSMutableArray *v3;
  NSMutableArray *allAlbums;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHAssetCollection *v10;
  PHAssetCollection *syncedAlbum;
  id v12;

  v3 = (NSMutableArray *)objc_opt_new();
  allAlbums = self->_allAlbums;
  self->_allAlbums = v3;

  v5 = objc_alloc(MEMORY[0x1E0D51600]);
  -[_NTKCFaceDetailAlbumChooserViewController face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nrDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v5, "initWithDevice:", v8);

  objc_msgSend(v12, "npto_fetchSyncedAlbum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
  syncedAlbum = self->_syncedAlbum;
  self->_syncedAlbum = v10;

  if (self->_syncedAlbum)
    -[NSMutableArray addObject:](self->_allAlbums, "addObject:");
  -[_NTKCFaceDetailAlbumChooserViewController _appendCollectionsWithType:subtype:](self, "_appendCollectionsWithType:subtype:", 2, 203);
  -[_NTKCFaceDetailAlbumChooserViewController _appendCollectionsWithType:subtype:](self, "_appendCollectionsWithType:subtype:", 2, 209);
  -[_NTKCFaceDetailAlbumChooserViewController _appendCollectionsWithType:subtype:](self, "_appendCollectionsWithType:subtype:", 1, 0x7FFFFFFFFFFFFFFFLL);

}

- (void)_set_selectedAlbum
{
  _NTKCFaceDetailAlbumChooserViewController *v2;
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  _NTKCFaceDetailAlbumChooserViewController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v2 = self;
  v26 = *MEMORY[0x1E0C80C00];
  -[_NTKCFaceDetailAlbumChooserViewController editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albumIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v2;
    v5 = v2->_allAlbums;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CD13B8];
          NTK_npto_uuid(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localIdentifierWithUUID:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v4, "isEqualToString:", v14);

          if (v15)
          {
            v2 = v18;
            objc_storeStrong((id *)&v18->_selectedAlbum, v10);

            goto LABEL_13;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v7)
          continue;
        break;
      }
    }

    v2 = v18;
  }
  else
  {
    objc_storeStrong((id *)&v2->_selectedAlbum, v2->_syncedAlbum);
  }
LABEL_13:
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[PHAssetCollection localizedTitle](v2->_selectedAlbum, "localizedTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "-[_NTKCFaceDetailAlbumChooserViewController _set_selectedAlbum]: selected album == %@", buf, 0xCu);

  }
}

- (void)_appendCollectionsWithType:(int64_t)a3 subtype:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PHAssetCollection *syncedAlbum;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        syncedAlbum = self->_syncedAlbum;
        if (!syncedAlbum
          || (NTK_npto_uuid(syncedAlbum),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              NTK_npto_uuid(v10),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v12, "isEqual:", v13),
              v13,
              v12,
              (v14 & 1) == 0))
        {
          -[NSMutableArray addObject:](self->_allAlbums, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (NTKCAlbumHandlingEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (_NTKCFaceDetailAlbumChooserViewControllerDelegate)delegate
{
  return (_NTKCFaceDetailAlbumChooserViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_selectedAlbum, 0);
  objc_storeStrong((id *)&self->_syncedAlbum, 0);
  objc_storeStrong((id *)&self->_allAlbums, 0);
}

@end
