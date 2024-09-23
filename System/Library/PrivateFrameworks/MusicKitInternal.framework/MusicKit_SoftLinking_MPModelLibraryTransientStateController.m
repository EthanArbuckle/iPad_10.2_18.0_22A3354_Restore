@implementation MusicKit_SoftLinking_MPModelLibraryTransientStateController

+ (MusicKit_SoftLinking_MPModelLibraryTransientStateController)sharedLibraryTransientStateController
{
  if (sharedLibraryTransientStateController_sOnceToken != -1)
    dispatch_once(&sharedLibraryTransientStateController_sOnceToken, &__block_literal_global_2);
  return (MusicKit_SoftLinking_MPModelLibraryTransientStateController *)(id)sharedLibraryTransientStateController_sSharedDeviceLibraryController;
}

- (id)_initWithUnderlyingLibraryTransientStateController:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPModelLibraryTransientStateController *v6;
  MusicKit_SoftLinking_MPModelLibraryTransientStateController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryTransientStateController;
  v6 = -[MusicKit_SoftLinking_MPModelLibraryTransientStateController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingLibraryTransientStateController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPModelLibraryTransientStateControllerDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleLibraryTransientStateControllerDidChangeNotification_, v9, v7->_underlyingLibraryTransientStateController);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelLibraryTransientStateControllerDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingLibraryTransientStateController);

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryTransientStateController;
  -[MusicKit_SoftLinking_MPModelLibraryTransientStateController dealloc](&v5, sel_dealloc);
}

- (int64_t)transientFavoriteStateForModelObject:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "_underlyingModelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MusicKit_SoftLinking_MPModelLibraryTransientStateController _libraryTransientFavoriteState:](self, "_libraryTransientFavoriteState:", -[MPModelLibraryTransientStateController transientFavoriteStateForModelObject:](self->_underlyingLibraryTransientStateController, "transientFavoriteStateForModelObject:", v4));

  return v5;
}

- (void)performAddToPlaylistWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_underlyingLibraryAddToPlaylistChangeRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke;
  v15 = &unk_1E9C059A0;
  v16 = v6;
  v17 = v7;
  v9 = v6;
  v10 = v7;
  v11 = (void *)objc_msgSend(v8, "newOperationWithResponseHandler:", &v12);

  -[MPModelLibraryTransientStateController addOperation:](self->_underlyingLibraryTransientStateController, "addOperation:", v11, v12, v13, v14, v15);
}

- (void)performDeleteEntityWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_underlyingLibraryDeleteEntityChangeRequest");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedModelObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "msv_map:", &__block_literal_global_17_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
  objc_msgSend(v10, "appendSection:", &stru_1E9C1C058);
  objc_msgSend(v10, "appendItems:", v9);
  -[MPModelLibraryTransientStateController performDeleteEntityChangeRequest:withRelatedModelObjects:completion:](self->_underlyingLibraryTransientStateController, "performDeleteEntityChangeRequest:withRelatedModelObjects:completion:", v11, v10, v6);

}

- (void)performLibraryImportChangeWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  MPModelLibraryTransientStateController *underlyingLibraryTransientStateController;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_underlyingLibraryImportChangeRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedModelObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "msv_map:", &__block_literal_global_20_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
  objc_msgSend(v11, "appendSection:", &stru_1E9C1C058);
  objc_msgSend(v11, "appendItems:", v10);
  underlyingLibraryTransientStateController = self->_underlyingLibraryTransientStateController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __119__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryImportChangeWithRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E9C059E8;
  v15 = v6;
  v13 = v6;
  -[MPModelLibraryTransientStateController performLibraryImportChangeRequest:withRelatedModelObjects:completion:](underlyingLibraryTransientStateController, "performLibraryImportChangeRequest:withRelatedModelObjects:completion:", v8, v11, v14);

}

- (void)performLibraryKeepLocalChangeWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_underlyingLibraryKeepLocalChangeRequest");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedModelObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "msv_map:", &__block_literal_global_22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass());
  objc_msgSend(v10, "appendSection:", &stru_1E9C1C058);
  objc_msgSend(v10, "appendItems:", v9);
  -[MPModelLibraryTransientStateController performKeepLocalChangeRequest:withRelatedModelObjects:completion:](self->_underlyingLibraryTransientStateController, "performKeepLocalChangeRequest:withRelatedModelObjects:completion:", v11, v10, v6);

}

- (void)performFavoriteStateChangeRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "_underlyingFavoriteEntityChangeRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryTransientStateController performFavoriteStateChangeRequest:withRelatedModelObjects:completion:](self->_underlyingLibraryTransientStateController, "performFavoriteStateChangeRequest:withRelatedModelObjects:completion:", v7, 0, v6);

}

- (void)performOperation:(id)a3
{
  -[MPModelLibraryTransientStateController addOperation:](self->_underlyingLibraryTransientStateController, "addOperation:", a3);
}

- (int64_t)_libraryTransientFavoriteState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (int64_t)_underlyingLibraryTransientFavoriteState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (NSString)didChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPLibraryTransientStateControllerDidChangeNotification");
}

- (void)_handleLibraryTransientStateControllerDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPLibraryTransientStateControllerDidChangeNotification"), self, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLibraryTransientStateController, 0);
}

@end
