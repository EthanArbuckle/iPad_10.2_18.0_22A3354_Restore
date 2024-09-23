@implementation MPCRadioArtworkDataSource

- (MPCRadioArtworkDataSource)init
{
  MPCRadioArtworkDataSource *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *cachedArtworkRepresentationsAccessQueue;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCRadioArtworkDataSource;
  v2 = -[MPAbstractNetworkArtworkDataSource init](&v8, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(2, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.MediaPlaybackCore.MPCRadioArtworkDataSouce.cachedArtworkRepresentationsAccessQueue", 0, v3);
    cachedArtworkRepresentationsAccessQueue = v2->_cachedArtworkRepresentationsAccessQueue;
    v2->_cachedArtworkRepresentationsAccessQueue = (OS_dispatch_queue *)v4;

    v2->_backgroundCacheSize = 1;
    v2->_cacheSize = 50;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleDidEnterBackgroundNotification_, *MEMORY[0x24BEBDF98], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleDidReceiveMemoryWarningNotification_, *MEMORY[0x24BEBDFA8], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__handleWillEnterForegroundNotification_, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDFA8], 0);

  v4.receiver = self;
  v4.super_class = (Class)MPCRadioArtworkDataSource;
  -[MPAbstractNetworkArtworkDataSource dealloc](&v4, sel_dealloc);
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    objc_msgSend(v5, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scaledFittingSize");
    v9 = v8;
    v11 = v10;

    objc_msgSend(v7, "bestArtworkForPixelSize:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representationSize");
    v14 = v13;
    v16 = v15;

    objc_msgSend(v12, "pixelSize");
    LOBYTE(v4) = v16 == v18 && v14 == v17;

  }
  return (char)v4;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *cachedArtworkRepresentationsAccessQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  MPCRadioArtworkDataSource *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__15968;
  v46 = __Block_byref_object_dispose__15969;
  v47 = 0;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFittingSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bestArtworkForPixelSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __69__MPCRadioArtworkDataSource_existingRepresentationForArtworkCatalog___block_invoke;
  v34 = &unk_24CAB5AF0;
  v39 = &v42;
  v35 = self;
  v13 = v11;
  v36 = v13;
  v14 = v5;
  v37 = v14;
  v15 = v10;
  v38 = v15;
  v40 = v7;
  v41 = v9;
  dispatch_sync(cachedArtworkRepresentationsAccessQueue, &v31);
  v16 = (void *)v43[5];
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BE7CBD8], "sharedCache", v31, v32, v33, v34, v35, v36, v37);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cachedImageDataForRadioArtwork:MIMEType:", v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v4, "destinationScale");
      v20 = v19;
      if (v19 < 0.00000011920929)
      {
        objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "scale");
        v20 = v22;

      }
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:scale:", v18, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDDC6E8];
      objc_msgSend(v4, "visualIdenticalityIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pixelSize");
      objc_msgSend(v24, "representationForVisualIdentity:withSize:image:", v25, v23);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v43[5];
      v43[5] = v26;

      v28 = v43[5];
      if (v28)
        -[MPCRadioArtworkDataSource _cacheArtworkRepresentation:forKey:](self, "_cacheArtworkRepresentation:forKey:", v28, v13);

    }
    v16 = (void *)v43[5];
  }
  v29 = v16;

  _Block_object_dispose(&v42, 8);
  return v29;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFittingSize");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "bestArtworkForPixelSize:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1840];
  objc_msgSend(v10, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MPCRadioArtworkDataSource *v20;
  id v21;
  id v22;
  double v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledFittingSize");
  objc_msgSend(v8, "bestArtworkForPixelSize:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationScale");
  v11 = v10;
  if (v10 < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v11 = v13;

  }
  objc_msgSend(MEMORY[0x24BE7CBD8], "sharedCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v18[3] = &unk_24CAB5B18;
  v23 = v11;
  v19 = v9;
  v20 = self;
  v21 = v6;
  v22 = v7;
  v15 = v7;
  v16 = v6;
  v17 = v9;
  objc_msgSend(v14, "loadImageForRadioArtwork:withCompletionHandler:", v17, v18);

}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)objc_msgSend(a3, "token");
}

- (void)_handleDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  char v5;

  MPUIApplication();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuspendedUnderLock");

  if ((v5 & 1) == 0)
  {
    self->_resumeToForegroundCacheSize = self->_cacheSize;
    -[MPCRadioArtworkDataSource _setCacheSize:preserveExisting:](self, "_setCacheSize:preserveExisting:", self->_backgroundCacheSize, 1);
  }
}

- (void)_handleWillEnterForegroundNotification:(id)a3
{
  if (self->_resumeToForegroundCacheSize >= 1)
    -[MPCRadioArtworkDataSource _setCacheSize:preserveExisting:](self, "_setCacheSize:preserveExisting:");
}

- (void)_cacheArtworkRepresentation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *cachedArtworkRepresentationsAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__MPCRadioArtworkDataSource__cacheArtworkRepresentation_forKey___block_invoke;
  block[3] = &unk_24CABAA28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(cachedArtworkRepresentationsAccessQueue, block);

}

- (void)_clearCache
{
  NSObject *cachedArtworkRepresentationsAccessQueue;
  _QWORD block[5];

  cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__MPCRadioArtworkDataSource__clearCache__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_sync(cachedArtworkRepresentationsAccessQueue, block);
}

- (void)_setCacheSize:(unint64_t)a3 preserveExisting:(BOOL)a4
{
  NSObject *cachedArtworkRepresentationsAccessQueue;
  _QWORD block[6];
  BOOL v6;

  if (self->_cacheSize != a3)
  {
    self->_cacheSize = a3;
    cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke;
    block[3] = &unk_24CAB5B68;
    v6 = a4;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(cachedArtworkRepresentationsAccessQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedArtworkRepresentationsAccessQueue, 0);
  objc_storeStrong((id *)&self->_cachedArtworkRepresentations, 0);
}

void __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 48) && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v2, "allKeys");
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        v7 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v16 != v7)
              objc_enumerationMutation(v3);
            v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              if (!v6)
                v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(v6, "setObject:forKey:", v10, v9);
              if ((unint64_t)objc_msgSend(v6, "count") >= *(_QWORD *)(a1 + 40))
              {

                goto LABEL_19;
              }
            }

          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v5)
            continue;
          break;
        }
      }
      else
      {
        v6 = 0;
      }
LABEL_19:

    }
    else
    {
      v6 = 0;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE65C60]), "initWithMaximumCapacity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 160);
    *(_QWORD *)(v12 + 160) = v11;

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke_2;
    v14[3] = &unk_24CAB5B40;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
}

uint64_t __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setObject:forKey:", a3, a2);
}

uint64_t __40__MPCRadioArtworkDataSource__clearCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
}

uint64_t __64__MPCRadioArtworkDataSource__cacheArtworkRepresentation_forKey___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1[4] + 160);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE65C60]), "initWithMaximumCapacity:", *(_QWORD *)(a1[4] + 152));
    v4 = a1[4];
    v5 = *(void **)(v4 + 160);
    *(_QWORD *)(v4 + 160) = v3;

    v2 = *(void **)(a1[4] + 160);
  }
  return objc_msgSend(v2, "setObject:forKey:", a1[5], a1[6]);
}

void __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  v12 = v9;
  if (v7 && !v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "pixelSize");
    v14 = v13;
    v16 = v15;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("image/jpeg")))
    {
      v17 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", v7, 0, 0, v14, v16, *(double *)(a1 + 64)));
      if (objc_msgSend(v17, "CGImage"))
      {
        if (v17)
          goto LABEL_10;
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:scale:", v7, *(double *)(a1 + 64));
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v22, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
LABEL_13:

      goto LABEL_15;
    }
    v17 = (id)v18;
LABEL_10:
    v19 = (void *)MEMORY[0x24BDDC6E8];
    objc_msgSend(*(id *)(a1 + 48), "visualIdenticalityIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "representationForVisualIdentity:withSize:image:", v20, v17, v14, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = 0;
      goto LABEL_15;
    }
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_cacheArtworkRepresentation:forKey:", v11, v22);
    v12 = 0;
    goto LABEL_13;
  }
LABEL_15:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  block[3] = &unk_24CAB98A8;
  v25 = *(id *)(a1 + 56);
  v30 = v12;
  v31 = v25;
  v29 = v11;
  v26 = v12;
  v27 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69__MPCRadioArtworkDataSource_existingRepresentationForArtworkCatalog___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "artworks");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v17, "count");
    v6 = objc_msgSend(v17, "indexOfObject:", *(_QWORD *)(a1 + 56));
    v7 = v6 + 1;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 < v5)
    {
      while (1)
      {
        objc_msgSend(v17, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pixelSize");
        if (v11 > *(double *)(a1 + 72) + *(double *)(a1 + 72))
          break;
        if (v10 > *(double *)(a1 + 80) + *(double *)(a1 + 80))
          break;
        objc_msgSend(v9, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v16)
          break;

        if (v5 == ++v7)
          goto LABEL_12;
      }

    }
LABEL_12:

  }
}

+ (id)sharedRadioArtworkDataSource
{
  if (sharedRadioArtworkDataSource_sRadioArtworkDataSourceOnceToken != -1)
    dispatch_once(&sharedRadioArtworkDataSource_sRadioArtworkDataSourceOnceToken, &__block_literal_global_15979);
  return (id)sharedRadioArtworkDataSource_sRadioArtworkDataSource;
}

void __57__MPCRadioArtworkDataSource_sharedRadioArtworkDataSource__block_invoke()
{
  MPCRadioArtworkDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(MPCRadioArtworkDataSource);
  v1 = (void *)sharedRadioArtworkDataSource_sRadioArtworkDataSource;
  sharedRadioArtworkDataSource_sRadioArtworkDataSource = (uint64_t)v0;

}

@end
