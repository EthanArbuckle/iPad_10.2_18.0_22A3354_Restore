@implementation DOCNodeThumbnail

- (BOOL)registerGenerationCompletionHandler:(id)a3
{
  id v4;
  DOCNodeThumbnail *v5;
  DOCThumbnailRequest *currentRequest;
  NSMutableArray *generationCompletionHandlers;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  currentRequest = v5->_currentRequest;
  if (currentRequest)
  {
    generationCompletionHandlers = v5->_generationCompletionHandlers;
    v8 = (void *)MEMORY[0x219A09DE0](v4);
    -[NSMutableArray addObject:](generationCompletionHandlers, "addObject:", v8);

  }
  objc_sync_exit(v5);

  return currentRequest != 0;
}

- (void)fetchWithOptions:(unint64_t)a3
{
  DOCNodeThumbnail *obj;

  obj = self;
  objc_sync_enter(obj);
  -[DOCNodeThumbnail _fetchThumbnailWithOptions:](obj, "_fetchThumbnailWithOptions:", a3);
  objc_sync_exit(obj);

}

void __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = (NSObject **)MEMORY[0x24BE2DF90];
    v9 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2_cold_1(a1, (uint64_t)v7, v9);
    objc_msgSend(*(id *)(a1 + 40), "thumbnailOperationFailedToLoadThumbnail");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "thumbnailOperationDidLoadThumbnail:representativeIcon:", v5, 1);
  }

}

- (void)thumbnailOperationDidLoadThumbnail:(id)a3 representativeIcon:(BOOL)a4
{
  UIImage *v6;
  DOCNodeThumbnail *v7;
  DOCThumbnailRequest *currentRequest;
  UIImage *thumbnailImage;
  UIImage *v10;
  _QWORD block[5];

  v6 = (UIImage *)a3;
  v7 = self;
  objc_sync_enter(v7);
  v7->_representativeIcon = a4;
  currentRequest = v7->_currentRequest;
  v7->_currentRequest = 0;

  -[DOCNodeThumbnail _callGenerationCompletionHandlers](v7, "_callGenerationCompletionHandlers");
  thumbnailImage = v7->_thumbnailImage;
  v7->_thumbnailImage = v6;
  v10 = v6;

  objc_sync_exit(v7);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__DOCNodeThumbnail_thumbnailOperationDidLoadThumbnail_representativeIcon___block_invoke;
  block[3] = &unk_24D72AA38;
  block[4] = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (DOCNodeThumbnailIdentifier)nodeThumbnailIdentifier
{
  return self->_nodeThumbnailIdentifier;
}

- (unint64_t)style
{
  return -[DOCThumbnailDescriptor style](self->_descriptor, "style");
}

- (void)updateNodeThumbnailIdentifierTo:(id)a3
{
  DOCNodeThumbnail *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[DOCNodeThumbnail nodeThumbnailIdentifier](v5, "nodeThumbnailIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_nodeThumbnailIdentifier, a3);
    -[DOCNodeThumbnail setNeedsUpdate](v5, "setNeedsUpdate");
  }
  objc_sync_exit(v5);

}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[DOCThumbnailDescriptor size](self->_descriptor, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFallback:(id)a3
{
  DOCNodeThumbnail *v5;
  void *v6;
  void *v7;
  DOCThumbnail *v8;

  v8 = (DOCThumbnail *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_fallback == v8)
  {
    objc_sync_exit(v5);

  }
  else
  {
    -[DOCNodeThumbnail fallback](v5, "fallback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeListener:", v5);

    objc_storeStrong((id *)&v5->_fallback, a3);
    -[DOCNodeThumbnail fallback](v5, "fallback");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addListener:", v5);

    objc_sync_exit(v5);
    -[DOCNodeThumbnail thumbnailLoaded:](v5, "thumbnailLoaded:", v8);
  }

}

- (DOCThumbnail)fallback
{
  return self->_fallback;
}

- (BOOL)isRepresentativeIcon
{
  DOCNodeThumbnail *v2;
  void *v3;
  _BOOL8 v4;
  DOCNodeThumbnail *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[DOCNodeThumbnail thumbnailImage](v2, "thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LOBYTE(v4) = v2->_representativeIcon;
    objc_sync_exit(v2);
  }
  else
  {
    -[DOCNodeThumbnail fallback](v2, "fallback");
    v5 = (DOCNodeThumbnail *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v2);

    v4 = -[DOCNodeThumbnail isRepresentativeIcon](v5, "isRepresentativeIcon");
    v2 = v5;
  }

  return v4;
}

- (UIImage)thumbnail
{
  DOCNodeThumbnail *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[DOCNodeThumbnail thumbnailImage](v2, "thumbnailImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_sync_exit(v2);
    v4 = v2;
  }
  else
  {
    -[DOCNodeThumbnail fallback](v2, "fallback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v2);

    objc_msgSend(v4, "thumbnail");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[DOCNodeThumbnail scheduleUpdateIfNeeded](v2, "scheduleUpdateIfNeeded");
  -[DOCNodeThumbnail generator](v2, "generator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markThumbnailAsRecentlyUsed:", v2);

  return (UIImage *)v3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)scheduleUpdateIfNeeded
{
  DOCNodeThumbnail *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[DOCNodeThumbnail needsUpdate](obj, "needsUpdate"))
  {
    obj->_needsUpdate = 0;
    -[DOCNodeThumbnail _fetchThumbnailWithOptions:](obj, "_fetchThumbnailWithOptions:", 0);
  }
  objc_sync_exit(obj);

}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (DOCThumbnailGenerator)generator
{
  return (DOCThumbnailGenerator *)objc_loadWeakRetained((id *)&self->_generator);
}

- (void)thumbnailLoaded:(id)a3
{
  DOCNodeThumbnail *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[DOCNodeThumbnail thumbnailImage](v4, "thumbnailImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  if (!v5)
    -[DOCNodeThumbnail _notifyListeners](v4, "_notifyListeners");

}

- (double)scale
{
  double result;

  -[DOCThumbnailDescriptor scale](self->_descriptor, "scale");
  return result;
}

- (DOCNodeThumbnail)initWithGenerator:(id)a3 node:(id)a4 descriptor:(id)a5 fallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DOCNodeThumbnail *v14;
  DOCNodeThumbnail *v15;
  uint64_t v16;
  NSHashTable *listeners;
  uint64_t v18;
  DOCNodeThumbnailIdentifier *nodeThumbnailIdentifier;
  uint64_t v20;
  NSMutableArray *generationCompletionHandlers;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DOCNodeThumbnail;
  v14 = -[DOCNodeThumbnail init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_generator, v10);
    objc_storeStrong((id *)&v15->_descriptor, a5);
    objc_storeStrong((id *)&v15->_fallback, a6);
    *(_WORD *)&v15->_representativeIcon = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    listeners = v15->_listeners;
    v15->_listeners = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_node, a4);
    objc_msgSend(v11, "thumbnailIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    nodeThumbnailIdentifier = v15->_nodeThumbnailIdentifier;
    v15->_nodeThumbnailIdentifier = (DOCNodeThumbnailIdentifier *)v18;

    v20 = objc_opt_new();
    generationCompletionHandlers = v15->_generationCompletionHandlers;
    v15->_generationCompletionHandlers = (NSMutableArray *)v20;

    -[DOCThumbnail addListener:](v15->_fallback, "addListener:", v15);
  }

  return v15;
}

- (void)_notifyListeners
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  NSObject **v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  DOCNodeThumbnail *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[DOCNodeThumbnail listeners](self, "listeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[DOCNodeThumbnail listeners](self, "listeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v18;
    v10 = (NSObject **)MEMORY[0x24BE2DF90];
    *(_QWORD *)&v8 = 138412802;
    v16 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = *v10;
        if (!*v10)
        {
          DOCInitLogging();
          v13 = *v10;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = v13;
          v15 = objc_opt_class();
          *(_DWORD *)buf = v16;
          v22 = v15;
          v23 = 2048;
          v24 = v12;
          v25 = 2112;
          v26 = self;
          _os_log_debug_impl(&dword_2172C6000, v14, OS_LOG_TYPE_DEBUG, "Notifying <%@: %p> that the thumbnail for %@ successfully loaded", buf, 0x20u);

        }
        objc_msgSend(v12, "thumbnailLoaded:", self, v16, (_QWORD)v17);
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v7);
  }

}

- (void)removeListener:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[DOCNodeThumbnail listeners](self, "listeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  if (v8)
  {
    -[DOCNodeThumbnail listeners](self, "listeners");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v8);

  }
  -[DOCNodeThumbnail listeners](self, "listeners");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_sync_exit(v4);
  if (!v7)
    -[DOCNodeThumbnail _cancelCurrentRequest](self, "_cancelCurrentRequest");

}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[DOCNodeThumbnail listeners](self, "listeners");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    -[DOCNodeThumbnail listeners](self, "listeners");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)_callGenerationCompletionHandlers
{
  DOCNodeThumbnail *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_generationCompletionHandlers, "copy");
  -[NSMutableArray removeAllObjects](v2->_generationCompletionHandlers, "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

- (void)_fetchThumbnailWithOptions:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id WeakRetained;
  DOCNodeThumbnail *v13;
  void *v14;
  DOCNodeThumbnail *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  DOCNodeThumbnail *v20;
  _QWORD v21[5];

  v3 = a3;
  -[DOCNodeThumbnail node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 2) != 0)
    goto LABEL_5;
  v7 = v5;
  if ((objc_msgSend(v7, "isActionable") & 1) != 0)
  {
    objc_msgSend(v7, "providerDomainID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DOCProviderDomainIDIsSharedServerDomainID();

    if ((v9 & 1) == 0)
    {

      if ((v3 & 1) == 0)
        goto LABEL_6;
LABEL_9:
      v13 = self;
      objc_sync_enter(v13);
      if (v13->_currentRequest || v13->_thumbnailImage)
      {
        objc_sync_exit(v13);
        goto LABEL_12;
      }
      objc_sync_exit(v13);

LABEL_6:
      -[DOCNodeThumbnail _cancelCurrentRequest](self, "_cancelCurrentRequest");
      WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
      objc_msgSend(WeakRetained, "thumbnailGenerator");
      v13 = (DOCNodeThumbnail *)objc_claimAutoreleasedReturnValue();

      +[DOCThumbnailRequest requestForNode:descriptor:thumbnailGenerator:](DOCThumbnailRequest, "requestForNode:descriptor:thumbnailGenerator:", self->_node, self->_descriptor, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self;
      objc_sync_enter(v15);
      objc_storeStrong((id *)&v15->_currentRequest, v14);
      objc_sync_exit(v15);

      v16 = MEMORY[0x24BDAC760];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke;
      v21[3] = &unk_24D72AA38;
      v21[4] = v15;
      objc_msgSend(v14, "setThumbnailGenerationRequiresDownloadHandler:", v21);
      v18[0] = v16;
      v18[1] = 3221225472;
      v18[2] = __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2;
      v18[3] = &unk_24D72ABF0;
      v19 = v14;
      v20 = v15;
      v17 = v14;
      objc_msgSend(v17, "generateThumbnailWithCompletionHandler:", v18);

LABEL_12:
      goto LABEL_13;
    }
    objc_msgSend(v7, "fpfs_fpItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "doc_isSMBSharepoint");

    if (v11)
    {
LABEL_5:
      if ((v3 & 1) == 0)
        goto LABEL_6;
      goto LABEL_9;
    }
  }
  else
  {

  }
LABEL_13:

}

- (void)_cancelCurrentRequest
{
  DOCThumbnailRequest *currentRequest;
  DOCNodeThumbnail *obj;

  obj = self;
  objc_sync_enter(obj);
  -[DOCThumbnailRequest cancel](obj->_currentRequest, "cancel");
  currentRequest = obj->_currentRequest;
  obj->_currentRequest = 0;

  -[DOCNodeThumbnail _callGenerationCompletionHandlers](obj, "_callGenerationCompletionHandlers");
  objc_sync_exit(obj);

}

- (DOCNode)node
{
  return self->_node;
}

uint64_t __74__DOCNodeThumbnail_thumbnailOperationDidLoadThumbnail_representativeIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyListeners");
}

- (double)minimumSize
{
  double result;

  -[DOCThumbnailDescriptor minimumSize](self->_descriptor, "minimumSize");
  return result;
}

- (BOOL)isInteractive
{
  return -[DOCThumbnailDescriptor isInteractive](self->_descriptor, "isInteractive");
}

- (void)setNeedsUpdate
{
  DOCNodeThumbnail *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_needsUpdate = 1;
  objc_sync_exit(obj);

}

- (BOOL)isLoading
{
  DOCNodeThumbnail *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[DOCNodeThumbnail currentRequest](v2, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[DOCNodeThumbnail thumbnailImage](v2, "thumbnailImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      -[DOCNodeThumbnail fallback](v2, "fallback");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isLoading");

    }
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)averageColorInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[DOCNodeThumbnail isRepresentativeIcon](self, "isRepresentativeIcon"))
  {
    -[DOCNodeThumbnail thumbnail](self, "thumbnail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doc_averageColorInRect:", x, y, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (BOOL)hasFinishedTryingToFetchCorrectThumbnail
{
  DOCNodeThumbnail *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  -[DOCNodeThumbnail currentRequest](v2, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)thumbnailOperationFailedToLoadThumbnail
{
  DOCThumbnailRequest *currentRequest;
  DOCNodeThumbnail *obj;

  obj = self;
  objc_sync_enter(obj);
  currentRequest = obj->_currentRequest;
  obj->_currentRequest = 0;

  -[DOCNodeThumbnail _callGenerationCompletionHandlers](obj, "_callGenerationCompletionHandlers");
  -[DOCNodeThumbnail setNeedsUpdate](obj, "setNeedsUpdate");
  objc_sync_exit(obj);

}

void __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "_callGenerationCompletionHandlers");
  objc_sync_exit(obj);

}

- (BOOL)representativeIcon
{
  return self->_representativeIcon;
}

- (void)setRepresentativeIcon:(BOOL)a3
{
  self->_representativeIcon = a3;
}

- (DOCThumbnailDescriptor)descriptor
{
  return self->_descriptor;
}

- (DOCThumbnailRequest)currentRequest
{
  return self->_currentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_nodeThumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_generationCompletionHandlers, 0);
}

void __47__DOCNodeThumbnail__fetchThumbnailWithOptions___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2172C6000, log, OS_LOG_TYPE_ERROR, "Failed to generate thumbnail for request %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
