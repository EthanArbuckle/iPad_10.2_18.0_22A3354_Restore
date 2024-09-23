@implementation MPContentTasteController

- (id)_initWithUserIdentity:(id)a3
{
  id v4;
  MPContentTasteController *v5;
  uint64_t v6;
  ICUserIdentity *userIdentity;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPContentTasteController;
  v5 = -[MPContentTasteController init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    v8 = dispatch_queue_create("com.apple.MediaPlayer.MPContentTasteController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, sel__deviceMediaLibraryDidChangeNotification_, CFSTR("MPMediaLibraryDidChangeNotification"), v11);

  }
  return v5;
}

+ (MPContentTasteController)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_27_10052);
  return (MPContentTasteController *)(id)sharedController___tasteController;
}

void __90__MPContentTasteController__tasteControllerWithUserIdentity_isSingleton_createIfRequired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 56), "controllers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)MEMORY[0x19403A624]();
      v5 = -[MPContentTasteController _initWithUserIdentity:]([MPContentTasteController alloc], "_initWithUserIdentity:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 56), "controllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

      objc_autoreleasePoolPop(v4);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "controllers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

+ (NSMutableDictionary)controllers
{
  if (controllers_onceToken != -1)
    dispatch_once(&controllers_onceToken, &__block_literal_global_15);
  return (NSMutableDictionary *)(id)controllers___controllers;
}

void __44__MPContentTasteController_sharedController__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPContentTasteController _tasteControllerWithUserIdentity:isSingleton:createIfRequired:](MPContentTasteController, "_tasteControllerWithUserIdentity:isSingleton:createIfRequired:", v0, 1, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedController___tasteController;
  sharedController___tasteController = v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", sharedController___tasteController, sel__libraryPathDidChangeForTasteController_, CFSTR("MPMediaLibraryPathDidChangeNotification"), 0);

}

+ (id)_tasteControllerWithUserIdentity:(id)a3 isSingleton:(BOOL)a4 createIfRequired:(BOOL)a5
{
  id v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  __CFString *v14;
  id v15;
  _QWORD block[4];
  __CFString *v18;
  id v19;
  uint64_t *v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = CFSTR("SingletonTasteController");
  }
  else
  {
    objc_msgSend(v8, "accountDSID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
      v10 = (__CFString *)v11;
    else
      v10 = CFSTR("NoDSID");
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9987;
  v27 = __Block_byref_object_dispose__9988;
  v28 = 0;
  objc_msgSend(a1, "globalSerialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MPContentTasteController__tasteControllerWithUserIdentity_isSingleton_createIfRequired___block_invoke;
  block[3] = &unk_1E315D218;
  v22 = a5;
  v18 = v10;
  v19 = v9;
  v20 = &v23;
  v21 = a1;
  v13 = v9;
  v14 = v10;
  dispatch_sync(v12, block);

  v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v15;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken != -1)
    dispatch_once(&globalSerialQueue_onceToken, &__block_literal_global_10058);
  return (OS_dispatch_queue *)(id)globalSerialQueue___globalSerialQueue;
}

void __39__MPContentTasteController_controllers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)controllers___controllers;
  controllers___controllers = (uint64_t)v0;

}

void __45__MPContentTasteController_globalSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaplayer.MPContentTasteController.global.serial.queue", v2);
  v1 = (void *)globalSerialQueue___globalSerialQueue;
  globalSerialQueue___globalSerialQueue = (uint64_t)v0;

}

- (int64_t)tasteTypeForModel:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[MPContentTasteController _libraryEntityForModel:](self, "_libraryEntityForModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MPContentTasteController tasteTypeForMediaEntity:](self, "tasteTypeForMediaEntity:", v5);
  }
  else
  {
    objc_msgSend(v4, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "universalStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "globalPlaylistID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      -[MPContentTasteController _pendingUpdateRecordForPlaylistGlobalID:](self, "_pendingUpdateRecordForPlaylistGlobalID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_7;
    }
    objc_msgSend(v4, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _MPContentTasteBestIDFromIdentifiers(v11);

    if (v12
      && (-[MPContentTasteController _pendingUpdateRecordForStoreAdamID:](self, "_pendingUpdateRecordForStoreAdamID:", v12), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_7:
      v6 = objc_msgSend(v10, "tasteType");

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (int64_t)tasteTypeForMediaEntity:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString **v13;
  __CFString **v14;
  void *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "valueForProperty:", CFSTR("storeItemAdamID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "longLongValue");

      if (v11)
      {
        v5 = CFSTR("likedState");
        v12 = CFSTR("likedState");
        goto LABEL_13;
      }
      v13 = &MPMediaItemPropertyLikedState;
      v14 = MPMediaItemPropertySubscriptionStoreItemID;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_23;
      v13 = MPMediaAlbumPropertyLikedState;
      v14 = MPMediaAlbumPropertyStoreID;
    }
    objc_msgSend(v4, "valueForProperty:", *v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "longLongValue");

    v5 = *v13;
    if (!v11)
    {
LABEL_19:
      if (v5)
      {
        objc_msgSend(v4, "valueForProperty:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");

        if (v19 == 3)
          v9 = 2;
        else
          v9 = v19 == 2;
        goto LABEL_17;
      }
LABEL_23:
      v9 = 0;
      goto LABEL_18;
    }
LABEL_13:
    -[MPContentTasteController _pendingUpdateRecordForStoreAdamID:](self, "_pendingUpdateRecordForStoreAdamID:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v6 = (void *)v16;
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "valueForProperty:", CFSTR("cloudGlobalID"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[MPContentTasteController _pendingUpdateRecordForPlaylistGlobalID:](self, "_pendingUpdateRecordForPlaylistGlobalID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "valueForProperty:", CFSTR("likedState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    if (v8 == 3)
      v9 = 2;
    else
      v9 = v8 == 2;
    goto LABEL_16;
  }
LABEL_15:
  v9 = objc_msgSend(v6, "tasteType");
LABEL_16:

LABEL_17:
LABEL_18:

  return v9;
}

- (id)_libraryEntityForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "persistentID");

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemWithPersistentID:verifyExistence:", v7, 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11;
        v12 = v7;
        v13 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_7;
          }
          -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "playlistWithPersistentID:", v7);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
        -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11;
        v12 = v7;
        v13 = 2;
      }
      objc_msgSend(v11, "collectionWithPersistentID:groupingType:", v12, v13);
      v9 = objc_claimAutoreleasedReturnValue();
    }
LABEL_6:
    v7 = (void *)v9;

  }
LABEL_7:

  return v7;
}

- (id)_mediaLibrary
{
  return +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
}

- (MPContentTasteController)init
{
  void *v3;
  MPContentTasteController *v4;

  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPContentTasteController _initWithUserIdentity:](self, "_initWithUserIdentity:", v3);

  return v4;
}

- (void)setTasteType:(int64_t)a3 forModel:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v18 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "flattenedGenericObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v10;
  }
  else
  {
    v11 = v18;
  }
  v19 = v11;
  objc_msgSend(v11, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "universalStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "globalPlaylistID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    -[MPContentTasteController setTasteType:forPlaylistGlobalID:withCompletionHandler:](self, "setTasteType:forPlaylistGlobalID:withCompletionHandler:", a3, v14, v8);
  }
  else
  {
    objc_msgSend(v19, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _MPContentTasteBestIDFromIdentifiers(v15);

    if (v16)
    {
      -[MPContentTasteController setTasteType:forStoreAdamID:withContentType:completionHandler:](self, "setTasteType:forStoreAdamID:withContentType:completionHandler:", a3, v16, MPContentTasteContentTypeFromMPModelObject(v19), v8);
    }
    else
    {
      -[MPContentTasteController _libraryEntityForModel:](self, "_libraryEntityForModel:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPContentTasteController setTasteType:forMediaEntity:withCompletionHandler:](self, "setTasteType:forMediaEntity:withCompletionHandler:", a3, v17, v8);

    }
  }

}

- (void)setTasteType:(int64_t)a3 forMediaEntity:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v56 = 0;
  v57 = &v56;
  v10 = 3;
  if (a3 != 2)
    v10 = 1;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__9987;
  v60 = __Block_byref_object_dispose__9988;
  if (a3 == 1)
    v10 = 2;
  v39 = v10;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__9987;
  v50 = __Block_byref_object_dispose__9988;
  v51 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __78__MPContentTasteController_setTasteType_forMediaEntity_withCompletionHandler___block_invoke;
  v41[3] = &unk_1E3154B08;
  v43 = &v56;
  v44 = &v46;
  v41[4] = self;
  v45 = &v52;
  v40 = v9;
  v42 = v40;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v41);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "valueForProperty:", CFSTR("cloudGlobalID"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v57[5];
    v57[5] = v12;

    v14 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (__CFString *)objc_msgSend(v14, "initWithObjectsAndKeys:", v8, CFSTR("MPContentTasteControllerNotificationUserInfoKeyMediaEntity"), v15, CFSTR("MPContentTasteControllerNotificationUserInfoKeyTasteType"), &unk_1E31E4858, CFSTR("MPContentTasteControllerNotificationUserInfoKeyContentType"), 0);

    v17 = v57[5];
    if (v17)
      -[__CFString setObject:forKey:](v16, "setObject:forKey:", v17, CFSTR("MPContentTasteControllerNotificationUserInfoKeyPlaylistGlobalID"));
    +[MPContentTasteController _postNotificationName:controller:userInfo:](MPContentTasteController, "_postNotificationName:controller:userInfo:", CFSTR("MPContentTasteControllerWillSetTasteTypeNotification"), self, v16);
    v18 = v57[5];
    if (v18)
    {
      -[MPContentTasteController _addPendingUpdateRecordForPlaylistGlobalID:contentTasteType:](self, "_addPendingUpdateRecordForPlaylistGlobalID:contentTasteType:", v18, a3);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v47[5];
      v47[5] = v19;

    }
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setValue:forProperty:withCompletionBlock:", v22, CFSTR("likedState"), v11);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = 0;
      v16 = 0;
      goto LABEL_20;
    }
    v27 = CFSTR("albumLikedState");
    objc_msgSend(v8, "valueForProperty:", CFSTR("albumStoreID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "longLongValue");
    v16 = CFSTR("albumLikedState");
    v26 = 3;
LABEL_19:
    v53[3] = v29;

    goto LABEL_20;
  }
  v23 = CFSTR("likedState");
  objc_msgSend(v8, "valueForProperty:", CFSTR("storeItemAdamID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "longLongValue");
  v53[3] = v25;

  if (!v53[3])
  {
    objc_msgSend(v8, "valueForProperty:", CFSTR("subscriptionStoreItemAdamID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "longLongValue");
    v16 = CFSTR("likedState");
    v26 = 1;
    goto LABEL_19;
  }
  v16 = CFSTR("likedState");
  v26 = 1;
LABEL_20:
  if (v8)
  {
    v30 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithObjectsAndKeys:", v8, CFSTR("MPContentTasteControllerNotificationUserInfoKeyMediaEntity"), v31, CFSTR("MPContentTasteControllerNotificationUserInfoKeyTasteType"), v32, CFSTR("MPContentTasteControllerNotificationUserInfoKeyContentType"), 0);

    if (v53[3])
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("MPContentTasteControllerNotificationUserInfoKeyStoreAdamID"));

    }
    +[MPContentTasteController _postNotificationName:controller:userInfo:](MPContentTasteController, "_postNotificationName:controller:userInfo:", CFSTR("MPContentTasteControllerWillSetTasteTypeNotification"), self, v33);

  }
  v35 = v53[3];
  if (v35)
  {
    -[MPContentTasteController _addPendingUpdateRecordForStoreAdamID:contentTasteType:](self, "_addPendingUpdateRecordForStoreAdamID:contentTasteType:", v35, a3);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v47[5];
    v47[5] = v36;

  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forProperty:withCompletionBlock:", v21, v16, v11);
    goto LABEL_28;
  }
  if (!v11)
  {
    v16 = 0;
    goto LABEL_29;
  }
  v38 = (void *)MEMORY[0x1E0CB35C8];
  v62 = *MEMORY[0x1E0CB2D50];
  v63[0] = CFSTR("unknown entity type");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("MediaPlayer"), 123321, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v22);
  v16 = 0;
LABEL_11:

LABEL_28:
LABEL_29:

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

}

- (void)setTasteType:(int64_t)a3 forPlaylistGlobalID:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[MPContentTasteController _libraryPlaylistWithGlobalID:](self, "_libraryPlaylistWithGlobalID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[MPContentTasteController setTasteType:forMediaEntity:withCompletionHandler:](self, "setTasteType:forMediaEntity:withCompletionHandler:", a3, v10, v9);
  }
  else if (v8)
  {
    v33[0] = v8;
    v32[0] = CFSTR("MPContentTasteControllerNotificationUserInfoKeyPlaylistGlobalID");
    v32[1] = CFSTR("MPContentTasteControllerNotificationUserInfoKeyTasteType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = CFSTR("MPContentTasteControllerNotificationUserInfoKeyContentType");
    v33[1] = v11;
    v33[2] = &unk_1E31E4858;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPContentTasteController _postNotificationName:controller:userInfo:](MPContentTasteController, "_postNotificationName:controller:userInfo:", CFSTR("MPContentTasteControllerWillSetTasteTypeNotification"), self, v12);

    -[MPContentTasteController _addPendingUpdateRecordForPlaylistGlobalID:contentTasteType:](self, "_addPendingUpdateRecordForPlaylistGlobalID:contentTasteType:", v8, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke;
    v26[3] = &unk_1E31582C8;
    v26[4] = self;
    v15 = v8;
    v27 = v15;
    v28 = v13;
    v29 = v9;
    v16 = v13;
    v17 = (void *)MEMORY[0x19403A810](v26);
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2;
    v23[3] = &unk_1E3154B30;
    v24 = v17;
    v25 = a3;
    v19 = v17;
    objc_msgSend(v18, "addNonLibraryOwnedPlaylistWithGlobalID:completion:", v15, v23);

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("invalid playlist global ID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("MediaPlayer"), 123321, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v22);

  }
}

- (void)setTasteType:(int64_t)a3 forStoreAdamID:(int64_t)a4 withContentType:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void **v22;
  const __CFString **v23;
  void *v24;
  void *v25;
  MPStoreItemLibraryImportElement *v26;
  MPStoreItemLibraryImport *v27;
  void *v28;
  MPStoreItemLibraryImport *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  _QWORD v39[5];
  id v40;
  id v41;
  int64_t v42;
  MPStoreItemLibraryImportElement *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  -[MPContentTasteController _libraryEntityWithStoreID:contentType:](self, "_libraryEntityWithStoreID:contentType:", a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (a4)
    {
      v48[0] = CFSTR("MPContentTasteControllerNotificationUserInfoKeyStoreAdamID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v12;
      v48[1] = CFSTR("MPContentTasteControllerNotificationUserInfoKeyTasteType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v13;
      v48[2] = CFSTR("MPContentTasteControllerNotificationUserInfoKeyContentType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPContentTasteController _postNotificationName:controller:userInfo:](MPContentTasteController, "_postNotificationName:controller:userInfo:", CFSTR("MPContentTasteControllerWillSetTasteTypeNotification"), self, v15);

    }
    -[MPContentTasteController _addPendingUpdateRecordForStoreAdamID:contentTasteType:](self, "_addPendingUpdateRecordForStoreAdamID:contentTasteType:", a4, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke;
    v39[3] = &unk_1E3154B58;
    v39[4] = self;
    v42 = a4;
    v33 = v16;
    v40 = v33;
    v41 = v10;
    v17 = MEMORY[0x19403A810](v39);
    v18 = 3;
    if (a3 != 2)
      v18 = 1;
    if (a3 == 1)
      v19 = 2;
    else
      v19 = v18;
    v31 = v19;
    v32 = (void *)v17;
    if (a5 == 3)
    {
      v46 = CFSTR("MPStoreItemLibraryImportMetadataKeyAlbumLikedState");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v20;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v47;
      v23 = &v46;
    }
    else
    {
      if ((unint64_t)(a5 - 1) > 1)
      {
        v24 = 0;
        goto LABEL_16;
      }
      v44 = CFSTR("MPStoreItemLibraryImportMetadataKeyTrackLikedState");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v20;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v45;
      v23 = &v44;
    }
    objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MPStoreItemLibraryImportElement initWithStoreItemID:additionalTrackMetadata:]([MPStoreItemLibraryImportElement alloc], "initWithStoreItemID:additionalTrackMetadata:", a4, v24);
    v27 = [MPStoreItemLibraryImport alloc];
    v43 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[MPStoreItemLibraryImport initWithImportElements:referralObject:usingCloudLibraryDestination:](v27, "initWithImportElements:referralObject:usingCloudLibraryDestination:", v28, 0, 0);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2;
    v34[3] = &unk_1E3154B80;
    v36 = a5;
    v37 = v31;
    v38 = a4;
    v34[4] = self;
    v35 = v32;
    v30 = v32;
    objc_msgSend(v25, "performStoreItemLibraryImport:withCompletion:", v29, v34);

    goto LABEL_17;
  }
  -[MPContentTasteController setTasteType:forMediaEntity:withCompletionHandler:](self, "setTasteType:forMediaEntity:withCompletionHandler:", a3, v11, v10);
LABEL_17:

}

- (int64_t)tasteTypeForPlaylistGlobalID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[MPContentTasteController _pendingUpdateRecordForPlaylistGlobalID:](self, "_pendingUpdateRecordForPlaylistGlobalID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "tasteType");
  }
  else
  {
    -[MPContentTasteController _libraryPlaylistWithGlobalID:](self, "_libraryPlaylistWithGlobalID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "valueForProperty:", CFSTR("likedState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      if (v11 == 3)
        v7 = 2;
      else
        v7 = v11 == 2;
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (int64_t)tasteTypeForStoreAdamID:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  -[MPContentTasteController _pendingUpdateRecordForStoreAdamID:](self, "_pendingUpdateRecordForStoreAdamID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "tasteType");
  }
  else
  {
    -[MPContentTasteController _libraryEntityWithStoreID:contentType:](self, "_libraryEntityWithStoreID:contentType:", a3, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (-[MPContentTasteController _libraryEntityWithStoreID:contentType:](self, "_libraryEntityWithStoreID:contentType:", a3, 3), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)|| (-[MPContentTasteController _libraryEntityWithStoreID:contentType:](self, "_libraryEntityWithStoreID:contentType:", a3, 2), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = -[MPContentTasteController tasteTypeForMediaEntity:](self, "tasteTypeForMediaEntity:", v8);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_libraryPathDidChangeForTasteController:(id)a3
{
  MPContentTasteController *v4;
  ICUserIdentity *v5;
  ICUserIdentity *userIdentity;

  +[MPContentTasteController sharedController](MPContentTasteController, "sharedController", a3);
  v4 = (MPContentTasteController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v5 = (ICUserIdentity *)objc_claimAutoreleasedReturnValue();
    userIdentity = self->_userIdentity;
    self->_userIdentity = v5;

  }
}

- (void)_deviceMediaLibraryDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MPContentTasteController__deviceMediaLibraryDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)_libraryPlaylistWithGlobalID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToValue:", *MEMORY[0x1E0D508D8], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPContentTasteController _ML3QueryWithEntityClass:predicate:options:](self, "_ML3QueryWithEntityClass:predicate:options:", v5, v6, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "anyEntityPersistentID");
    if (v8)
    {
      v9 = v8;
      -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "playlistWithPersistentID:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_libraryEntityWithStoreID:(int64_t)a3 contentType:(int64_t)a4
{
  void *v4;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if ((unint64_t)a4 > 7)
  {
    v10 = 0;
    v7 = 0;
    v12 = 0;
  }
  else
  {
    if (((1 << a4) & 0xC6) != 0)
    {
      v7 = (id)*MEMORY[0x1E0D51100];
      v26 = 0;
      v4 = 0;
      v8 = 0;
      v9 = (void *)*MEMORY[0x1E0D51150];
      v10 = (void *)*MEMORY[0x1E0D51150];
      goto LABEL_8;
    }
    v10 = 0;
    v7 = 0;
    v12 = 0;
    if (((1 << a4) & 0x28) != 0)
    {
      v7 = (id)*MEMORY[0x1E0D51128];
      v10 = 0;
      v9 = (void *)*MEMORY[0x1E0D50B98];
      v26 = 1;
      v4 = (void *)*MEMORY[0x1E0D50B98];
      v8 = 1;
LABEL_8:
      v13 = v9;
      if (v7)
      {
        v14 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", v7, a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPContentTasteController _ML3QueryWithEntityClass:predicate:options:](self, "_ML3QueryWithEntityClass:predicate:options:", v14, v15, 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          v34[0] = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke;
          v28[3] = &unk_1E3154BD0;
          v28[4] = &v29;
          objc_msgSend(v16, "enumeratePersistentIDsAndProperties:ordered:usingBlock:", v17, 0, v28);

        }
        else
        {
          v19 = objc_msgSend(v16, "anyEntityPersistentID");
          v30[3] = v19;
        }

        v18 = v30[3];
        if (v18)
        {
LABEL_19:
          if (v18)
          {
            -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
              objc_msgSend(v25, "collectionWithPersistentID:groupingType:verifyExistence:", v30[3], v26, 0);
            else
              objc_msgSend(v25, "itemWithPersistentID:verifyExistence:", v30[3], 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v12 = 0;
          }
          goto LABEL_25;
        }
      }
      else
      {
        v18 = 0;
      }
      if (v10)
      {
        v20 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", v10, a3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPContentTasteController _ML3QueryWithEntityClass:predicate:options:](self, "_ML3QueryWithEntityClass:predicate:options:", v20, v21, 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          v33 = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke_2;
          v27[3] = &unk_1E3154BD0;
          v27[4] = &v29;
          objc_msgSend(v22, "enumeratePersistentIDsAndProperties:ordered:usingBlock:", v23, 0, v27);

        }
        else
        {
          v24 = objc_msgSend(v22, "anyEntityPersistentID");
          v30[3] = v24;
        }

        v18 = v30[3];
      }
      goto LABEL_19;
    }
  }
LABEL_25:

  _Block_object_dispose(&v29, 8);
  return v12;
}

- (id)_ML3QueryWithEntityClass:(Class)a3 predicate:(id)a4 options:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  -[MPContentTasteController _mediaLibrary](self, "_mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryDataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class queryWithLibrary:predicate:orderingTerms:usingSections:options:](a3, "queryWithLibrary:predicate:orderingTerms:usingSections:options:", v11, v8, MEMORY[0x1E0C9AA60], 0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_addPendingUpdateRecord:(id)a3 withKey:(id)a4 inDictionary:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void *v20;
  id v21;
  MPContentTasteController *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke;
  v20 = &unk_1E315D848;
  v21 = v10;
  v22 = self;
  v23 = v8;
  v24 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_barrier_sync(accessQueue, &v17);
  objc_msgSend(v13, "UUID", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_addPendingUpdateRecordForPlaylistGlobalID:(id)a3 contentTasteType:(int64_t)a4
{
  id v6;
  MPContentTastePendingUpdateRecord *v7;
  void *v8;

  v6 = a3;
  v7 = -[MPContentTastePendingUpdateRecord initWithPlaylistGlobalID:tasteType:]([MPContentTastePendingUpdateRecord alloc], "initWithPlaylistGlobalID:tasteType:", v6, a4);
  -[MPContentTasteController _addPendingUpdateRecord:withKey:inDictionary:](self, "_addPendingUpdateRecord:withKey:inDictionary:", v7, v6, self->_pendingUpdateRecordByPlaylistGlobalID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_addPendingUpdateRecordForStoreAdamID:(int64_t)a3 contentTasteType:(int64_t)a4
{
  MPContentTastePendingUpdateRecord *v6;
  void *v7;
  void *v8;

  v6 = -[MPContentTastePendingUpdateRecord initWithStoreAdamID:tasteType:]([MPContentTastePendingUpdateRecord alloc], "initWithStoreAdamID:tasteType:", a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPContentTasteController _addPendingUpdateRecord:withKey:inDictionary:](self, "_addPendingUpdateRecord:withKey:inDictionary:", v6, v7, self->_pendingUpdateRecordByStoreAdamID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_removePendingUpdateRecordForPlaylistGlobalID:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke;
  block[3] = &unk_1E3163698;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(accessQueue, block);

}

- (void)_removePendingUpdateRecordForStoreAdamID:(int64_t)a3 token:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke;
  block[3] = &unk_1E3162690;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_barrier_sync(accessQueue, block);

}

- (id)_pendingUpdateRecordForKey:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9987;
  v21 = __Block_byref_object_dispose__9988;
  v22 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MPContentTasteController__pendingUpdateRecordForKey_inDictionary___block_invoke;
  block[3] = &unk_1E31635A8;
  v15 = v6;
  v16 = &v17;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_sync(accessQueue, block);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_pendingUpdateRecordForStoreAdamID:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPContentTasteController _pendingUpdateRecordForKey:inDictionary:](self, "_pendingUpdateRecordForKey:inDictionary:", v4, self->_pendingUpdateRecordByStoreAdamID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_pendingUpdateRecordForPlaylistGlobalID:(id)a3
{
  return -[MPContentTasteController _pendingUpdateRecordForKey:inDictionary:](self, "_pendingUpdateRecordForKey:inDictionary:", a3, self->_pendingUpdateRecordByPlaylistGlobalID);
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_pendingUpdateRecordByStoreAdamID, 0);
  objc_storeStrong((id *)&self->_pendingUpdateRecordByPlaylistGlobalID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __68__MPContentTasteController__pendingUpdateRecordForKey_inDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", a1[5]);

  if (v6)
  {
    v7 = *(void **)(a1[4] + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = a1[4];
    dispatch_async(v9, block);

  }
}

uint64_t __75__MPContentTasteController__removePendingUpdateRecordForStoreAdamID_token___block_invoke_2(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:controller:](MPContentTasteController, "_postNotificationName:controller:", CFSTR("MPContentTasteControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

void __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", a1[6]);

  if (v4)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke_2;
    block[3] = &unk_1E3163508;
    block[4] = a1[4];
    dispatch_async(v5, block);

  }
}

uint64_t __80__MPContentTasteController__removePendingUpdateRecordForPlaylistGlobalID_token___block_invoke_2(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:controller:](MPContentTasteController, "_postNotificationName:controller:", CFSTR("MPContentTasteControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

void __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];

  v2 = a1[4];
  v3 = a1[5];
  if (!(v2 | *(_QWORD *)(v3 + 16)))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = a1[5];
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;
LABEL_5:

    v2 = a1[4];
    goto LABEL_6;
  }
  if (!(v2 | *(_QWORD *)(v3 + 24)))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = a1[5];
    v6 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend((id)v2, "setObject:forKey:", a1[6], a1[7]);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = a1[5];
  dispatch_async(v9, block);

}

uint64_t __73__MPContentTasteController__addPendingUpdateRecord_withKey_inDictionary___block_invoke_2(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:controller:](MPContentTasteController, "_postNotificationName:controller:", CFSTR("MPContentTasteControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

uint64_t __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke(uint64_t result, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v6;

  if (a3)
  {
    v6 = result;
    result = objc_msgSend(*a3, "longLongValue");
    if (result)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = result;
      *a5 = 1;
    }
  }
  return result;
}

uint64_t __66__MPContentTasteController__libraryEntityWithStoreID_contentType___block_invoke_2(uint64_t result, uint64_t a2, id *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v6;

  if (a3)
  {
    v6 = result;
    result = objc_msgSend(*a3, "longLongValue");
    if (result)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = result;
      *a5 = 1;
    }
  }
  return result;
}

uint64_t __69__MPContentTasteController__deviceMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  return +[MPContentTasteController _postNotificationName:controller:](MPContentTasteController, "_postNotificationName:controller:", CFSTR("MPContentTasteControllerDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

void __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removePendingUpdateRecordForStoreAdamID:token:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed to add cache content to library. %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -1;
    v10 = 1;
    switch(*(_QWORD *)(a1 + 48))
    {
      case 1:
      case 6:
        goto LABEL_9;
      case 2:
        v10 = 2048;
        goto LABEL_9;
      case 3:
      case 5:
        v11 = *(_QWORD *)(a1 + 56);
        v12 = *(_QWORD *)(a1 + 64);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3;
        v21[3] = &unk_1E31624C0;
        v13 = &v22;
        v22 = *(id *)(a1 + 40);
        objc_msgSend(v8, "setLikedState:forAlbumWithStoreID:completion:", v11, v12, v21);
        goto LABEL_13;
      case 7:
        v10 = 256;
LABEL_9:
        if (objc_msgSend(v5, "count"))
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setValue:forProperty:", v15, CFSTR("likedStateChangedDate"));

        }
        v9 = v10;
        break;
      default:
        break;
    }
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4;
    v19[3] = &unk_1E31624C0;
    v13 = &v20;
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setLikedState:forEntityWithStoreID:withMediaType:timeStamp:completion:", v16, v17, v9, v18, v19);

LABEL_13:
  }

}

uint64_t __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__MPContentTasteController_setTasteType_forStoreAdamID_withContentType_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removePendingUpdateRecordForPlaylistGlobalID:token:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __83__MPContentTasteController_setTasteType_forPlaylistGlobalID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed to add cache playlist to library. %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 3;
    if (v8 != 2)
      v9 = 1;
    if (v8 == 1)
      v10 = 2;
    else
      v10 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forProperty:", v7, CFSTR("likedState"));
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__MPContentTasteController_setTasteType_forMediaEntity_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = v4;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removePendingUpdateRecordForPlaylistGlobalID:token:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v4 = v8;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removePendingUpdateRecordForStoreAdamID:token:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v4 = v8;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
    v4 = v8;
  }

}

+ (MPContentTasteController)controllerWithUserIdentity:(id)a3
{
  return (MPContentTasteController *)+[MPContentTasteController _tasteControllerWithUserIdentity:isSingleton:createIfRequired:](MPContentTasteController, "_tasteControllerWithUserIdentity:isSingleton:createIfRequired:", a3, 0, 1);
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4
{
  +[MPContentTasteController _postNotificationName:controller:userInfo:](MPContentTasteController, "_postNotificationName:controller:userInfo:", a3, a4, 0);
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v21 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(v9, "addObject:", v7);
    +[MPContentTasteController sharedController](MPContentTasteController, "sharedController");
    v10 = objc_claimAutoreleasedReturnValue();
    if ((id)v10 == v7)
    {

    }
    else
    {
      v11 = (void *)v10;
      objc_msgSend(v7, "userIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accountDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPContentTasteController sharedController](MPContentTasteController, "sharedController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountDSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "isEqualToString:", v16);

      if (v17)
      {
        +[MPContentTasteController sharedController](MPContentTasteController, "sharedController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    +[MPContentTasteController sharedController](MPContentTasteController, "sharedController");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 != v7)
    {
LABEL_11:
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__MPContentTasteController__postNotificationName_controller_userInfo___block_invoke;
      v22[3] = &unk_1E3154BA8;
      v23 = v21;
      v24 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);

      goto LABEL_12;
    }
    objc_msgSend(v7, "userIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPContentTasteController _tasteControllerWithUserIdentity:isSingleton:createIfRequired:](MPContentTasteController, "_tasteControllerWithUserIdentity:isSingleton:createIfRequired:", v20, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(v9, "addObject:", v18);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v21, 0, v8);
LABEL_12:

}

void __70__MPContentTasteController__postNotificationName_controller_userInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a2;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

}

@end
