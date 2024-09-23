@implementation PHBatchAssetExpunger

- (PHBatchAssetExpunger)initWithAssets:(id)a3 deleteOptions:(id)a4 library:(id)a5 batchSize:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  PHBatchAssetExpunger *v13;
  uint64_t v14;
  NSArray *assets;
  PHBatchPerformChanges *v16;
  uint64_t v17;
  uint64_t v18;
  PHBatchPerformChanges *batchPerformChanges;
  PHBatchAssetExpunger *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PHBatchAssetExpunger;
  v13 = -[PHBatchAssetExpunger init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    assets = v13->_assets;
    v13->_assets = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_deleteOptions, a4);
    objc_initWeak(&location, v13);
    v16 = [PHBatchPerformChanges alloc];
    v17 = -[NSArray count](v13->_assets, "count");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__PHBatchAssetExpunger_initWithAssets_deleteOptions_library_batchSize___block_invoke;
    v22[3] = &unk_1E35DA8F0;
    objc_copyWeak(&v23, &location);
    v18 = -[PHBatchPerformChanges initWithPhotoLibrary:itemCount:batchSize:batchBlock:](v16, "initWithPhotoLibrary:itemCount:batchSize:batchBlock:", v12, v17, a6, v22);
    batchPerformChanges = v13->_batchPerformChanges;
    v13->_batchPerformChanges = (PHBatchPerformChanges *)v18;

    v20 = v13;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (BOOL)performChangesAndWait:(id *)a3
{
  NSObject *v5;
  NSUInteger v6;
  PHBatchPerformChanges *batchPerformChanges;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  id v14;
  uint8_t buf[4];
  PHBatchAssetExpunger *v16;
  __int16 v17;
  NSUInteger v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSArray count](self->_assets, "count");
    *(_DWORD *)buf = 134218240;
    v16 = self;
    v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Start synchronous expunge of %tu assets", buf, 0x16u);
  }

  batchPerformChanges = self->_batchPerformChanges;
  v14 = 0;
  v8 = -[PHBatchPerformChanges performChangesAndWait:](batchPerformChanges, "performChangesAndWait:", &v14);
  v9 = v14;
  PLPhotoKitGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v16 = self;
    v17 = 2112;
    if (v8)
      v11 = CFSTR("YES");
    v18 = (NSUInteger)v11;
    v19 = 2112;
    v20 = v9;
    v12 = v11;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Finished synchronous expunge: %@ %@", buf, 0x20u);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v8;
}

- (void)performChangesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSUInteger v6;
  PHBatchPerformChanges *batchPerformChanges;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  PHBatchAssetExpunger *v12;
  __int16 v13;
  NSUInteger v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotoKitGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSArray count](self->_assets, "count");
    *(_DWORD *)buf = 134218240;
    v12 = self;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Start asynchronous expunge of %tu assets", buf, 0x16u);
  }

  batchPerformChanges = self->_batchPerformChanges;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PHBatchAssetExpunger_performChangesWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E35DBB00;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[PHBatchPerformChanges performChangesWithCompletionHandler:](batchPerformChanges, "performChangesWithCompletionHandler:", v9);

}

- (void)_batchExpungeInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  PHBatchAssetExpunger *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  NSRange v14;

  length = a3.length;
  location = a3.location;
  v13 = *MEMORY[0x1E0C80C00];
  PLPhotoKitGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14.location = location;
    v14.length = length;
    NSStringFromRange(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Batch expunging assets in range: %@", (uint8_t *)&v9, 0x16u);

  }
  -[NSArray subarrayWithRange:](self->_assets, "subarrayWithRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAssetChangeRequest internalExpungeAssets:deleteOptions:](PHAssetChangeRequest, "internalExpungeAssets:deleteOptions:", v8, self->_deleteOptions);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchPerformChanges, 0);
  objc_storeStrong((id *)&self->_deleteOptions, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __60__PHBatchAssetExpunger_performChangesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLPhotoKitGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    if ((_DWORD)a2)
      v8 = CFSTR("YES");
    v9 = v8;
    v11 = 134218498;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEFAULT, "Batch Expunge: %p Finished asynchronous expunge: %@ %@", (uint8_t *)&v11, 0x20u);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void __71__PHBatchAssetExpunger_initWithAssets_deleteOptions_library_batchSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_batchExpungeInRange:", a2, a3);

}

+ (id)batchAssetExpungerWithAssets:(id)a3 deleteOptions:(id)a4 library:(id)a5 topLevelSelector:(SEL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PHBatchAssetExpunger *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v11, a6, objc_opt_class());
  PLArrayFromEnumeration();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PHBatchAssetExpunger initWithAssets:deleteOptions:library:batchSize:]([PHBatchAssetExpunger alloc], "initWithAssets:deleteOptions:library:batchSize:", v12, v10, v9, 200);
  return v13;
}

@end
