@implementation MusicKit_SoftLinking_MPModelLibraryPlaylistEditController

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditController)initWithPlaylist:(id)a3 initialTracklist:(id)a4 authorProfile:(id)a5 library:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MusicKit_SoftLinking_MPModelLibraryPlaylistEditController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MPModelLibraryPlaylistEditController *underlyingEditController;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditController;
  v14 = -[MusicKit_SoftLinking_MPModelLibraryPlaylistEditController init](&v28, sel_init);
  if (v14)
  {
    if (v11)
    {
      objc_msgSend(v11, "_underlyingSectionedCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lazyMapWithSections:items:", &__block_literal_global_0, &__block_literal_global_7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v12)
    {
      objc_msgSend(v12, "_underlyingModelObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CCDE60], "_supportedPropertiesForModelObjectType:", 17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc((Class)getMPModelLibraryPlaylistEditControllerClass());
    objc_msgSend(v13, "_underlyingMediaLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "_underlyingModelObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "initWithLibrary:playlist:playlistEntryProperties:authorProfile:", v20, v21, v18, v17);
      underlyingEditController = v14->_underlyingEditController;
      v14->_underlyingEditController = (MPModelLibraryPlaylistEditController *)v22;

    }
    else
    {
      v24 = objc_msgSend(v19, "initWithLibrary:playlistEntryProperties:authorProfile:", v20, v18, v17);
      v21 = v14->_underlyingEditController;
      v14->_underlyingEditController = (MPModelLibraryPlaylistEditController *)v24;
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    getMPModelLibraryPlaylistEditControllerDidChangeNotification();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v14, sel__handlePlaylistDidChangeNotification_, v26, v14->_underlyingEditController);

  }
  return v14;
}

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditController)initWithPlaylist:(id)a3 underlyingSectionedCollection:(id)a4 authorProfile:(id)a5 library:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MusicKit_SoftLinking_MPModelLibraryPlaylistEditController *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MPModelLibraryPlaylistEditController *underlyingEditController;
  void *v22;
  void *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditController;
  v14 = -[MusicKit_SoftLinking_MPModelLibraryPlaylistEditController init](&v25, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CCDE60], "_supportedPropertiesForModelObjectType:", 17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    v17 = objc_alloc((Class)getMPModelLibraryPlaylistEditControllerClass());
    objc_msgSend(v13, "_underlyingMediaLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_underlyingModelObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v20 = objc_msgSend(v17, "initWithLibrary:playlist:initialTrackList:playlistEntryProperties:authorProfile:", v18, v10, v16, v15, v19);
    else
      v20 = objc_msgSend(v17, "initWithLibrary:playlistEntryProperties:authorProfile:", v18, v15, v19);
    underlyingEditController = v14->_underlyingEditController;
    v14->_underlyingEditController = (MPModelLibraryPlaylistEditController *)v20;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    getMPModelLibraryPlaylistEditControllerDidChangeNotification();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v14, sel__handlePlaylistDidChangeNotification_, v23, v14->_underlyingEditController);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelLibraryPlaylistEditControllerDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingEditController);

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditController;
  -[MusicKit_SoftLinking_MPModelLibraryPlaylistEditController dealloc](&v5, sel_dealloc);
}

- (id)underlyingEditController
{
  return self->_underlyingEditController;
}

- (BOOL)addInsertedTracksToLibrary
{
  return -[MPModelLibraryPlaylistEditController addInsertedTracksToLibrary](self->_underlyingEditController, "addInsertedTracksToLibrary");
}

- (void)setAddInsertedTracksToLibrary:(BOOL)a3
{
  -[MPModelLibraryPlaylistEditController setAddInsertedTracksToLibrary:](self->_underlyingEditController, "setAddInsertedTracksToLibrary:", a3);
}

- (NSString)name
{
  return (NSString *)-[MPModelLibraryPlaylistEditController name](self->_underlyingEditController, "name");
}

- (void)setName:(id)a3
{
  -[MPModelLibraryPlaylistEditController setName:](self->_underlyingEditController, "setName:", a3);
}

- (NSString)descriptionText
{
  return (NSString *)-[MPModelLibraryPlaylistEditController descriptionText](self->_underlyingEditController, "descriptionText");
}

- (void)setDescriptionText:(id)a3
{
  -[MPModelLibraryPlaylistEditController setDescriptionText:](self->_underlyingEditController, "setDescriptionText:", a3);
}

- (MusicKit_SoftLinking_MPModelObject)parentPlaylist
{
  void *v2;
  void *v3;

  -[MPModelLibraryPlaylistEditController parentPlaylist](self->_underlyingEditController, "parentPlaylist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCDE28]), "initWithUnderlyingModelObject:", v2);
  else
    v3 = 0;

  return (MusicKit_SoftLinking_MPModelObject *)v3;
}

- (void)setParentPlaylist:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "_underlyingModelObject");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[MPModelLibraryPlaylistEditController setParentPlaylist:](self->_underlyingEditController, "setParentPlaylist:", v4);

}

- (CGImage)userImage
{
  id v2;
  CGImage *v3;

  -[MPModelLibraryPlaylistEditController userImage](self->_underlyingEditController, "userImage");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGImage *)objc_msgSend(v2, "CGImage");

  return v3;
}

- (void)setUserImage:(CGImage *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v5 = (void *)getUIImageClass_softClass;
    v12 = getUIImageClass_softClass;
    if (!getUIImageClass_softClass)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __getUIImageClass_block_invoke;
      v8[3] = &unk_1E9C05688;
      v8[4] = &v9;
      __getUIImageClass_block_invoke((uint64_t)v8);
      v5 = (void *)v10[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v9, 8);
    v7 = (void *)objc_msgSend([v6 alloc], "initWithCGImage:", a3);
    -[MPModelLibraryPlaylistEditController setUserImage:](self->_underlyingEditController, "setUserImage:", v7);

  }
  else
  {
    -[MPModelLibraryPlaylistEditController setUserImage:](self->_underlyingEditController, "setUserImage:");
  }
}

- (NSString)coverArtworkRecipe
{
  return (NSString *)-[MPModelLibraryPlaylistEditController coverArtworkRecipe](self->_underlyingEditController, "coverArtworkRecipe");
}

- (void)setCoverArtworkRecipe:(id)a3
{
  -[MPModelLibraryPlaylistEditController setCoverArtworkRecipe:](self->_underlyingEditController, "setCoverArtworkRecipe:", a3);
}

- (NSNumber)isPublicPlaylist
{
  return (NSNumber *)-[MPModelLibraryPlaylistEditController isPublicPlaylist](self->_underlyingEditController, "isPublicPlaylist");
}

- (void)setPublicPlaylist:(id)a3
{
  -[MPModelLibraryPlaylistEditController setPublicPlaylist:](self->_underlyingEditController, "setPublicPlaylist:", a3);
}

- (NSNumber)isVisiblePlaylist
{
  return (NSNumber *)-[MPModelLibraryPlaylistEditController isVisiblePlaylist](self->_underlyingEditController, "isVisiblePlaylist");
}

- (void)setVisiblePlaylist:(id)a3
{
  -[MPModelLibraryPlaylistEditController setVisiblePlaylist:](self->_underlyingEditController, "setVisiblePlaylist:", a3);
}

- (NSNumber)isCuratorPlaylist
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getMPModelObjectClass_softClass;
  v19 = getMPModelObjectClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getMPModelObjectClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getMPModelObjectClass_block_invoke;
    v15[3] = &unk_1E9C05688;
    v15[4] = &v16;
    __getMPModelObjectClass_block_invoke((uint64_t)v15);
    v3 = (void *)v17[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __78__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_isCuratorPlaylist__block_invoke;
  v8[3] = &unk_1E9C057C8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "performWithoutEnforcement:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSNumber *)v6;
}

- (void)setCuratorPlaylist:(id)a3
{
  -[MPModelLibraryPlaylistEditController setCuratorPlaylist:](self->_underlyingEditController, "setCuratorPlaylist:", a3);
}

- (MusicKit_SoftLinking_MPSectionedCollection)currentTrackList
{
  void *v2;
  void *v3;

  -[MPModelLibraryPlaylistEditController currentTrackList](self->_underlyingEditController, "currentTrackList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCDEB0]), "initWithUnderlyingSectionedCollection:", v2);

  return (MusicKit_SoftLinking_MPSectionedCollection *)v3;
}

+ (NSString)playlistDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPModelLibraryPlaylistEditControllerDidChangeNotification");
}

- (void)_handlePlaylistDidChangeNotification:(id)a3
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

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPModelLibraryPlaylistEditControllerDidChangeNotification"), self, v6);
}

- (void)beginEditingWithCompletion:(id)a3
{
  -[MPModelLibraryPlaylistEditController beginEditingWithCompletion:](self->_underlyingEditController, "beginEditingWithCompletion:", a3);
}

- (void)appendModelObject:(id)a3 completion:(id)a4
{
  MPModelLibraryPlaylistEditController *underlyingEditController;
  id v6;
  id v7;

  underlyingEditController = self->_underlyingEditController;
  v6 = a4;
  objc_msgSend(a3, "_underlyingModelObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController appendItem:completion:](underlyingEditController, "appendItem:completion:", v7, v6);

}

- (void)appendModelObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "msv_map:", &__block_literal_global_17);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController appendItems:completion:](self->_underlyingEditController, "appendItems:completion:", v7, v6);

}

- (void)insertModelObject:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  MPModelLibraryPlaylistEditController *underlyingEditController;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  underlyingEditController = self->_underlyingEditController;
  v9 = a5;
  objc_msgSend(a3, "_underlyingModelObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "_underlyingModelObject");
    v11 = objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditController insertItem:afterEntry:completion:](underlyingEditController, "insertItem:afterEntry:completion:", v10, v11, v9);

    v9 = (id)v11;
  }
  else
  {
    -[MPModelLibraryPlaylistEditController insertItemAtStart:completion:](underlyingEditController, "insertItemAtStart:completion:", v10, v9);
  }

}

- (void)insertModelObjects:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  MPModelLibraryPlaylistEditController *underlyingEditController;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  objc_msgSend(a3, "msv_map:", &__block_literal_global_18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  underlyingEditController = self->_underlyingEditController;
  if (v12)
  {
    objc_msgSend(v12, "_underlyingModelObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditController insertItems:afterEntry:completion:](underlyingEditController, "insertItems:afterEntry:completion:", v9, v11, v8);

  }
  else
  {
    -[MPModelLibraryPlaylistEditController insertItemsAtStart:completion:](underlyingEditController, "insertItemsAtStart:completion:", v9, v8);
  }

}

- (void)moveEntry:(id)a3 afterEntry:(id)a4
{
  MPModelLibraryPlaylistEditController *underlyingEditController;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  underlyingEditController = self->_underlyingEditController;
  objc_msgSend(a3, "_underlyingModelObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "_underlyingModelObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelLibraryPlaylistEditController moveEntry:afterEntry:](underlyingEditController, "moveEntry:afterEntry:", v7, v8);

  }
  else
  {
    -[MPModelLibraryPlaylistEditController moveEntryToStart:](underlyingEditController, "moveEntryToStart:", v7);
  }

}

- (void)removeEntry:(id)a3
{
  MPModelLibraryPlaylistEditController *underlyingEditController;
  id v4;

  underlyingEditController = self->_underlyingEditController;
  objc_msgSend(a3, "_underlyingModelObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController removeEntry:](underlyingEditController, "removeEntry:", v4);

}

- (void)removeEntries:(id)a3
{
  id v4;

  objc_msgSend(a3, "msv_map:", &__block_literal_global_20);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryPlaylistEditController removeEntries:](self->_underlyingEditController, "removeEntries:", v4);

}

- (void)commitWithCompletion:(id)a3
{
  id v4;
  MPModelLibraryPlaylistEditController *underlyingEditController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  underlyingEditController = self->_underlyingEditController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke;
  v7[3] = &unk_1E9C05870;
  v8 = v4;
  v6 = v4;
  -[MPModelLibraryPlaylistEditController commitWithCompletion:](underlyingEditController, "commitWithCompletion:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingEditController, 0);
}

@end
