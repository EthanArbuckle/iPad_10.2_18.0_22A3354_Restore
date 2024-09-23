@implementation MFPhotoPickerProgressManager

- (MFPhotoPickerProgressManager)init
{
  MFPhotoPickerProgressManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *progressItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFPhotoPickerProgressManager;
  v2 = -[MFPhotoPickerProgressManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    progressItems = v2->_progressItems;
    v2->_progressItems = v3;

  }
  return v2;
}

- (void)setProgress:(double)a3 forIndexPath:(id)a4
{
  id v6;
  MFPhotoPickerProgressManager *v8;
  void *v9;
  void *v10;
  MFPhotoPickerProgressItem *v11;
  void *v12;
  id v13;

  v6 = a4;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    v13 = v6;
    v8 = self;
    objc_sync_enter(v8);
    -[MFPhotoPickerProgressManager progressItems](v8, "progressItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "setProgress:", a3);
    }
    else
    {
      v11 = objc_alloc_init(MFPhotoPickerProgressItem);
      -[MFPhotoPickerProgressItem setProgress:](v11, "setProgress:", a3);
      -[MFPhotoPickerProgressManager progressItems](v8, "progressItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v11, v13);

      v10 = v11;
    }

    objc_sync_exit(v8);
    v6 = v13;
  }

}

- (void)setImageRequestID:(int)a3 forIndexPath:(id)a4
{
  uint64_t v4;
  MFPhotoPickerProgressManager *v6;
  void *v7;
  void *v8;
  MFPhotoPickerProgressItem *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  v6 = self;
  objc_sync_enter(v6);
  -[MFPhotoPickerProgressManager progressItems](v6, "progressItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "setImageRequestID:", v4);
  }
  else
  {
    v9 = objc_alloc_init(MFPhotoPickerProgressItem);
    -[MFPhotoPickerProgressItem setImageRequestID:](v9, "setImageRequestID:", v4);
    -[MFPhotoPickerProgressManager progressItems](v6, "progressItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

    v8 = v9;
  }

  objc_sync_exit(v6);
}

- (void)setExportSession:(id)a3 forIndexPath:(id)a4
{
  id v6;
  MFPhotoPickerProgressManager *v7;
  void *v8;
  void *v9;
  MFPhotoPickerProgressItem *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[MFPhotoPickerProgressManager progressItems](v7, "progressItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setExportSession:", v12);
  }
  else
  {
    v10 = objc_alloc_init(MFPhotoPickerProgressItem);
    -[MFPhotoPickerProgressItem setExportSession:](v10, "setExportSession:", v12);
    -[MFPhotoPickerProgressManager progressItems](v7, "progressItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v6);

    v9 = v10;
  }

  objc_sync_exit(v7);
}

- (BOOL)anyRequestExists
{
  MFPhotoPickerProgressManager *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = self;
  objc_sync_enter(v2);
  -[MFPhotoPickerProgressManager progressItems](v2, "progressItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  objc_sync_exit(v2);
  return v5;
}

- (BOOL)requestExistsForIndexPath:(id)a3
{
  id v4;
  MFPhotoPickerProgressManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MFPhotoPickerProgressManager progressItems](v5, "progressItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7 != 0;
}

- (double)progressForIndexPath:(id)a3
{
  id v4;
  MFPhotoPickerProgressManager *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MFPhotoPickerProgressManager progressItems](v5, "progressItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "progress");
    v9 = v8;
  }
  else
  {
    v9 = -1.0;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)cancelEverything
{
  MFPhotoPickerProgressManager *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MFPhotoPickerProgressManager *v9;

  v2 = self;
  objc_sync_enter(v2);
  -[MFPhotoPickerProgressManager progressItems](v2, "progressItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_sync_exit(v2);
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MFPhotoPickerProgressManager_cancelEverything__block_invoke;
  v7[3] = &unk_1E5A65430;
  v8 = v4;
  v9 = v2;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __48__MFPhotoPickerProgressManager_cancelEverything__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_cancelProgressItem:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)cancelEverythingAtIndexPath:(id)a3
{
  MFPhotoPickerProgressManager *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MFPhotoPickerProgressManager progressItems](v4, "progressItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  objc_sync_exit(v4);
  -[MFPhotoPickerProgressManager _cancelProgressItem:](v4, "_cancelProgressItem:", v6);

}

- (void)_cancelProgressItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", objc_msgSend(v5, "imageRequestID"));

  objc_msgSend(v5, "exportSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelExport");

}

- (NSMutableDictionary)progressItems
{
  return self->_progressItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressItems, 0);
}

@end
