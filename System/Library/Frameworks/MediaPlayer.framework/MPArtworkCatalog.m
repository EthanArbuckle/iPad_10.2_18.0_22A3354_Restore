@implementation MPArtworkCatalog

- (void)setRenderHint:(unint64_t)a3
{
  self->_renderHint = a3;
}

- (void)_setCacheIdentifier:(id)a3 forRequestingContext:(id)a4
{
  id v6;

  v6 = a4;
  -[MPArtworkCatalog setCacheIdentifier:](self, "setCacheIdentifier:", a3);
  -[MPArtworkCatalog setRequestingContext:](self, "setRequestingContext:", v6);

}

- (void)setRequestingContext:(id)a3
{
  objc_storeWeak(&self->_requestingContext, a3);
}

- (void)setCacheIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setDestination:(id)a3 forRepresentationKinds:(unint64_t)a4 configurationBlock:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  objc_opt_class();
  -[MPArtworkCatalog _setDestination:isMainThreadBound:forRepresentationKinds:configurationBlock:](self, "_setDestination:isMainThreadBound:forRepresentationKinds:configurationBlock:", v9, objc_opt_isKindOfClass() & 1, a4, v8);

}

- (void)setFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  void *v8;
  id configurationBlock;
  id v10;

  height = a3.height;
  width = a3.width;
  if (self->_fittingSize.width != a3.width || self->_fittingSize.height != a3.height)
  {
    -[MPArtworkCatalog token](self, "token");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setFittingSize:", width, height);
    if (-[MPArtworkCatalog isLoadingRepresentation](self, "isLoadingRepresentation"))
    {
      -[MPArtworkCatalog dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelLoadingRepresentationForArtworkCatalog:", self);

      -[MPArtworkCatalog setLoadingRepresentation:](self, "setLoadingRepresentation:", 0);
    }
    self->_fittingSize.width = width;
    self->_fittingSize.height = height;
    ++self->_modelRevisionID;
    -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetForRepresentationKinds:", 3);

    os_unfair_lock_lock(&self->_lock);
    configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock)
      -[MPArtworkCatalog _updateRepresentations](self, "_updateRepresentations");

  }
}

- (void)setDestinationScale:(double)a3
{
  double v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id configurationBlock;
  id v10;

  v3 = a3;
  if (a3 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v3 = v6;

  }
  if (self->_destinationScale != v3)
  {
    -[MPArtworkCatalog token](self, "token");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setDestinationScale:", v3);
    if (-[MPArtworkCatalog isLoadingRepresentation](self, "isLoadingRepresentation"))
    {
      -[MPArtworkCatalog dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelLoadingRepresentationForArtworkCatalog:", self);

      -[MPArtworkCatalog setLoadingRepresentation:](self, "setLoadingRepresentation:", 0);
    }
    self->_destinationScale = v3;
    ++self->_modelRevisionID;
    -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetForRepresentationKinds:", 3);

    os_unfair_lock_lock(&self->_lock);
    configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock)
      -[MPArtworkCatalog _updateRepresentations](self, "_updateRepresentations");

  }
}

- (void)_loadBestRepresentationIfNeededOfKind:(int64_t)a3
{
  int64_t modelRevisionID;
  void *v6;
  _QWORD v7[7];

  if (!-[MPArtworkCatalog isLoadingRepresentation](self, "isLoadingRepresentation"))
  {
    -[MPArtworkCatalog setLoadingRepresentation:](self, "setLoadingRepresentation:", 1);
    modelRevisionID = self->_modelRevisionID;
    objc_msgSend((id)objc_opt_class(), "_artworkLoadQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke;
    v7[3] = &unk_1E3155B28;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = modelRevisionID;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

- (BOOL)isLoadingRepresentation
{
  return self->_loadingRepresentation;
}

- (void)setLoadingRepresentation:(BOOL)a3
{
  self->_loadingRepresentation = a3;
}

- (void)_updateWithRepresentation:(id)a3 isBestRepresentation:(BOOL)a4 modelRevisionID:(int64_t)a5
{
  _BOOL4 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = objc_msgSend(v13, "kind");
  if (v8 == 1)
  {
    -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoRepresentation:", v13);
  }
  else
  {
    if (v8)
      goto LABEL_6;
    -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImageRepresentation:", v13);
  }

LABEL_6:
  -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1 << objc_msgSend(v13, "kind");
  if (v6)
    v12 = objc_msgSend(v10, "bestRepresentationKinds") | v11;
  else
    v12 = objc_msgSend(v10, "bestRepresentationKinds") & ~v11;
  objc_msgSend(v10, "setBestRepresentationKinds:", v12);

  -[MPArtworkCatalog _callConfigurationWithRevisionID:](self, "_callConfigurationWithRevisionID:", a5);
}

- (void)_setDestination:(id)a3 isMainThreadBound:(BOOL)a4 forRepresentationKinds:(unint64_t)a5 configurationBlock:(id)a6
{
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id configurationBlock;
  double v16;
  id v17;

  v7 = a4;
  v17 = a6;
  -[MPArtworkCatalog _setDestination:isMainThreadBound:](self, "_setDestination:isMainThreadBound:", a3, v7);
  -[MPArtworkCatalog setRepresentationKinds:](self, "setRepresentationKinds:", a5);
  -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((a5 & 1) != 0)
    objc_msgSend(v10, "setBestRepresentationKinds:", objc_msgSend(v10, "bestRepresentationKinds") & 0xFFFFFFFFFFFFFFFELL);
  else
    objc_msgSend(v10, "setImageRepresentation:", 0);

  -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((a5 & 2) != 0)
    objc_msgSend(v12, "setBestRepresentationKinds:", objc_msgSend(v12, "bestRepresentationKinds") & 0xFFFFFFFFFFFFFFFDLL);
  else
    objc_msgSend(v12, "setVideoRepresentation:", 0);

  os_unfair_lock_lock(&self->_lock);
  if (self->_configurationBlock == v17)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v14 = (void *)objc_msgSend(v17, "copy");
    configurationBlock = self->_configurationBlock;
    self->_configurationBlock = v14;

    os_unfair_lock_unlock(&self->_lock);
    v16 = *MEMORY[0x1E0C9D820];
    if (*MEMORY[0x1E0C9D820] == self->_fittingSize.width
      && (v16 = *(double *)(MEMORY[0x1E0C9D820] + 8), v16 == self->_fittingSize.height))
    {
      -[MPArtworkCatalog _callConfigurationWithRevisionID:](self, "_callConfigurationWithRevisionID:", self->_modelRevisionID);
    }
    else
    {
      -[MPArtworkCatalog _updateRepresentations](self, "_updateRepresentations", v16);
    }
  }

}

- (MPArtworkRepresentationCollection)bestAvailableRepresentationCollection
{
  return self->_bestAvailableRepresentationCollection;
}

- (void)_setDestination:(id)a3 isMainThreadBound:(BOOL)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  MPArtworkCatalog *v10;
  id v11;
  _QWORD block[4];
  id v13;
  MPArtworkCatalog *v14;
  id v15;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_destination);

  if (WeakRetained != v6)
  {
    v8 = objc_loadWeakRetained(&self->_destination);
    objc_storeWeak(&self->_destination, v6);
    self->_mainThreadBound = a4;
    v9 = objc_loadWeakRetained((id *)&self->_overlayDelegate);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "artworkCatalog:willConfigureView:", self, v6);
      objc_msgSend(v6, "artworkCatalog");
      v10 = (MPArtworkCatalog *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v6, (const void *)MPArtworkCatalogAssociatedObjectKey, self, (void *)1);
      if (v10 && v10 != self)
      {
        -[MPArtworkCatalog _clearDestination](v10, "_clearDestination");
        v11 = objc_loadWeakRetained((id *)&v10->_overlayDelegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "artworkCatalog:didClearFromView:", v10, v6);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__MPArtworkCatalog__setDestination_isMainThreadBound___block_invoke;
      block[3] = &unk_1E3163698;
      v13 = v8;
      v14 = self;
      v15 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      objc_setAssociatedObject(v8, (const void *)MPArtworkCatalogAssociatedObjectKey, 0, 0);
    }

  }
}

- (void)setRepresentationKinds:(unint64_t)a3
{
  self->_representationKinds = a3;
}

- (void)_updateRepresentations
{
  unint64_t representationKinds;

  representationKinds = self->_representationKinds;
  if ((representationKinds & 1) != 0)
  {
    -[MPArtworkCatalog _updateRepresentationOfKind:](self, "_updateRepresentationOfKind:", 0);
    representationKinds = self->_representationKinds;
  }
  if ((representationKinds & 2) != 0)
    -[MPArtworkCatalog _updateRepresentationOfKind:](self, "_updateRepresentationOfKind:", 1);
}

- (void)_updateRepresentationOfKind:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  -[MPArtworkCatalog _existingRepresentationOfKind:](self, "_existingRepresentationOfKind:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[MPArtworkCatalog dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isRepresentation:bestRepresentationForArtworkCatalog:", v7, self),
        v5,
        -[MPArtworkCatalog _updateWithRepresentation:isBestRepresentation:modelRevisionID:](self, "_updateWithRepresentation:isBestRepresentation:modelRevisionID:", v7, v6, self->_modelRevisionID), (v6 & 1) == 0))
  {
    -[MPArtworkCatalog _loadBestRepresentationIfNeededOfKind:](self, "_loadBestRepresentationIfNeededOfKind:", a3);
  }

}

- (id)_existingRepresentationOfKind:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "existingRepresentationOfKind:forArtworkCatalog:", a3, self);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v6;
    goto LABEL_7;
  }
  if (!a3)
  {
    objc_msgSend(v5, "existingRepresentationForArtworkCatalog:", self);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)_callConfigurationWithRevisionID:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  _BOOL4 mainThreadBound;
  BOOL v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](self->_configurationBlock);
  WeakRetained = objc_loadWeakRetained(&self->_destination);
  mainThreadBound = self->_mainThreadBound;
  os_unfair_lock_unlock(p_lock);
  if (v5)
    v8 = WeakRetained == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = WeakRetained;
      v13 = v5;
      msv_dispatch_on_main_queue();

      v9 = v12;
    }
    else
    {
      if (!mainThreadBound)
      {
        ((void (**)(_QWORD, id, MPArtworkRepresentationCollection *))v5)[2](v5, WeakRetained, self->_bestAvailableRepresentationCollection);
        goto LABEL_11;
      }
      v11 = v5;
      v10 = WeakRetained;
      msv_dispatch_on_main_queue();

      v9 = v11;
    }

  }
LABEL_11:

}

+ (id)_artworkLoadQueue
{
  if (_artworkLoadQueue_onceToken != -1)
    dispatch_once(&_artworkLoadQueue_onceToken, &__block_literal_global_75);
  return (id)_artworkLoadQueue___artworkLoadQueue;
}

- (BOOL)isArtworkVisuallyIdenticalToCatalog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[MPArtworkCatalog dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[MPArtworkCatalog visualIdenticalityIdentifier](self, "visualIdenticalityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualIdenticalityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "stringRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v7 = objc_msgSend(v8, "isEqual:", v9);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MPArtworkDataSourceVisualIdenticality)visualIdenticalityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[MPArtworkCatalog dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualIdenticalityIdentifierForCatalog:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPArtworkCatalog overlayDelegate](self, "overlayDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "overlayVisualIdenticalityForCatalog:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(v7, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("/"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v4;
  }

  return (MPArtworkDataSourceVisualIdenticality *)v11;
}

- (MPArtworkDataSource)dataSource
{
  return (MPArtworkDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (_MPArtworkCatalogOverlayDelegate)overlayDelegate
{
  return (_MPArtworkCatalogOverlayDelegate *)objc_loadWeakRetained((id *)&self->_overlayDelegate);
}

- (NSCache)cache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MPArtworkCatalog cacheIdentifier](self, "cacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPArtworkCatalog requestingContext](self, "requestingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_artworkCacheForIdentifier:requestingContext:representationKind:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCache *)v6;
}

+ (id)_artworkCacheForIdentifier:(id)a3 requestingContext:(id)a4 representationKind:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_sync_enter(v10);
    if (a5 == 1)
    {
      objc_getAssociatedObject(v10, (const void *)MPArtworkVideoCachesAssociatedObjectKey);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v10, (const void *)MPArtworkVideoCachesAssociatedObjectKey, v11, (void *)1);
    }
    else
    {
      if (a5)
      {
        v11 = 0;
        goto LABEL_13;
      }
      objc_getAssociatedObject(v10, (const void *)MPArtworkImageCachesAssociatedObjectKey);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v10, (const void *)MPArtworkImageCachesAssociatedObjectKey, v11, (void *)1);
    }
    if (v11)
    {
LABEL_10:
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99D38]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v7);
      }
      goto LABEL_14;
    }
LABEL_13:
    v12 = 0;
LABEL_14:

    objc_sync_exit(v10);
    goto LABEL_15;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (id)requestingContext
{
  return objc_loadWeakRetained(&self->_requestingContext);
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (CGSize)scaledFittingSize
{
  double height;
  double width;
  double destinationScale;
  double v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGSize result;

  width = self->_fittingSize.width;
  height = self->_fittingSize.height;
  destinationScale = self->_destinationScale;
  if (destinationScale > 0.00000011920929
    && (width != *(double *)&MPArtworkCatalogOriginalSize || height != *((double *)&MPArtworkCatalogOriginalSize + 1)))
  {
    CGAffineTransformMakeScale(&v13, destinationScale, self->_destinationScale);
    v7 = height * v13.c;
    height = height * v13.d + v13.b * width;
    width = v7 + v13.a * width;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_overlayDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "overlayScaledFittingSizeForCatalog:scaledFittingSize:", self, width, height);
    width = v9;
    height = v10;
  }

  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)token
{
  return self->_token;
}

- (CGSize)fittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fittingSize.width;
  height = self->_fittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)preferredVideoFormat
{
  return self->_preferredVideoFormat;
}

void __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v6)
  {
    objc_msgSend(WeakRetained, "_existingRepresentationOfKind:", *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v8;
      v14 = 2048;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "[MPArtwork] HALTING -- Error loading artwork for catalog: %{public}@ kind: %ld error: %{public}@", (uint8_t *)&v12, 0x20u);
    }

  }
  else
  {
    v9 = v5;
  }
  objc_msgSend(v8, "_updateWithRepresentation:isBestRepresentation:modelRevisionID:", v9, 1, *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "setLoadingRepresentation:", 0);

}

- (unint64_t)renderHint
{
  return self->_renderHint;
}

- (void)_clearDestination
{
  -[MPArtworkCatalog _setDestination:isMainThreadBound:](self, "_setDestination:isMainThreadBound:", 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[MPArtworkCatalog isLoadingRepresentation](self, "isLoadingRepresentation"))
  {
    -[MPArtworkCatalog dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelLoadingRepresentationForArtworkCatalog:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)MPArtworkCatalog;
  -[MPArtworkCatalog dealloc](&v4, sel_dealloc);
}

- (NSUUID)UUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;
  NSUUID *UUID;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_UUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    UUID = self->_UUID;
    self->_UUID = v4;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_UUID;
}

- (void)setLoadingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

+ (void)_setCacheLimit:(int64_t)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5 representationKind:(int64_t)a6
{
  id v7;

  objc_msgSend(a1, "_artworkCacheForIdentifier:requestingContext:representationKind:", a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCountLimit:", a3);

}

- (BOOL)isEqual:(id)a3
{
  MPArtworkCatalog *v4;
  BOOL v5;

  v4 = (MPArtworkCatalog *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[MPArtworkCatalog isArtworkVisuallyIdenticalToCatalog:](self, "isArtworkVisuallyIdenticalToCatalog:", v4);
  }

  return v5;
}

void __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  __int128 v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__MPArtworkCatalog__loadBestRepresentationIfNeededOfKind___block_invoke_2;
  v4[3] = &unk_1E3155B00;
  objc_copyWeak(&v5, &location);
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "_loadRepresentationOfKind:completionHandler:", v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_loadRepresentationOfKind:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  MPArtworkCatalog *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[MPArtworkCatalog dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "loadRepresentationOfKind:forArtworkCatalog:completionHandler:", a3, self, v6);
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPArtworkCatalogErrorDomain"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543874;
      v11 = self;
      v12 = 2048;
      v13 = a3;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "[MPArtwork] Loaded nil representation -- Error loading artwork for catalog: %{public}@ kind: %ld error: %{public}@", (uint8_t *)&v10, 0x20u);
    }

    v6[2](v6, 0, v8);
  }
  else
  {
    objc_msgSend(v7, "loadRepresentationForArtworkCatalog:completionHandler:", self, v6);
  }

}

- (BOOL)hasExportableArtworkProperties
{
  void *v3;
  char v4;

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "hasExportableArtworkPropertiesForCatalog:", self);
  else
    v4 = 0;

  return v4;
}

- (MPArtworkCatalog)initWithToken:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  MPArtworkCatalog *v9;
  MPArtworkCatalog *v10;
  uint64_t v11;
  MPArtworkRepresentationCollection *bestAvailableRepresentationCollection;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPArtworkCatalog;
  v9 = -[MPArtworkCatalog init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_token, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    v10->_destinationScale = 1.0;
    v10->_fittingSize = (CGSize)MPArtworkCatalogOriginalSize;
    v10->_representationKinds = 1;
    +[MPArtworkRepresentationCollection collectionWithImageRepresentation:videoRepresentation:bestRepresentationKinds:](MPArtworkRepresentationCollection, "collectionWithImageRepresentation:videoRepresentation:bestRepresentationKinds:", 0, 0, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    bestAvailableRepresentationCollection = v10->_bestAvailableRepresentationCollection;
    v10->_bestAvailableRepresentationCollection = (MPArtworkRepresentationCollection *)v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overlayStorage, 0);
  objc_storeStrong(&self->_overlayToken, 0);
  objc_destroyWeak((id *)&self->_overlayDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_loadingKey, 0);
  objc_destroyWeak(&self->_requestingContext);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_bestAvailableRepresentationCollection, 0);
  objc_storeStrong(&self->_configurationBlock, 0);
  objc_destroyWeak(&self->_destination);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __53__MPArtworkCatalog__callConfigurationWithRevisionID___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(_QWORD **)(a1 + 40))
  {
    v3 = v2[3];
    v4 = *(_QWORD *)(a1 + 56);

    if (v3 == v4)
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 152));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "artworkCatalog:didConfigureView:withRepresentation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));

}

+ (void)_setCacheLimit:(int64_t)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5
{
  objc_msgSend(a1, "_setCacheLimit:forCacheIdentifier:requestingContext:representationKind:", a3, a4, a5, 0);
}

- (id)existingColorAnalysisWithAlgorithm:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "existingArtworkEffectResultForEffectType:catalog:options:", 1, self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CGSize v13;

  -[MPArtworkCatalog destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPArtworkCatalog isMainThreadBound](self, "isMainThreadBound")
    && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p [redacted description due to non-main thread]>"), objc_opt_class(), v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "description");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[MPArtworkCatalog token](self, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPArtworkCatalog fittingSize](self, "fittingSize");
  NSStringFromCGSize(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPArtworkCatalog destinationScale](self, "destinationScale");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p token=%@ fittingSize=%@ destinationScale=%lf destination=%@>"), v7, self, v8, v9, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isMainThreadBound
{
  return self->_mainThreadBound;
}

- (id)destination
{
  return objc_loadWeakRetained(&self->_destination);
}

- (double)destinationScale
{
  return self->_destinationScale;
}

void __54__MPArtworkCatalog__setDestination_isMainThreadBound___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  void *v5;

  v2 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));

  if (v2 != WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "artworkCatalog:didClearFromView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);

    if (v4 == v5)
      objc_setAssociatedObject(*(id *)(a1 + 32), (const void *)MPArtworkCatalogAssociatedObjectKey, 0, 0);
  }
}

uint64_t __37__MPArtworkCatalog__artworkLoadQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_artworkLoadQueue___artworkLoadQueue;
  _artworkLoadQueue___artworkLoadQueue = (uint64_t)v0;

  return objc_msgSend((id)_artworkLoadQueue___artworkLoadQueue, "setMaxConcurrentOperationCount:", 20);
}

- (NSCache)videoCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[MPArtworkCatalog cacheIdentifier](self, "cacheIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPArtworkCatalog requestingContext](self, "requestingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_artworkCacheForIdentifier:requestingContext:representationKind:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCache *)v6;
}

- (unint64_t)videoCacheStoragePolicy
{
  return self->_videoCacheStoragePolicy;
}

- (BOOL)hasImageOnDisk
{
  void *v3;
  char v4;
  void *v5;

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "hasExistingRepresentationOnDiskForArtworkCatalog:", self);
  }
  else
  {
    -[MPArtworkCatalog bestImageFromDisk](self, "bestImageFromDisk");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)bestImageFromDisk
{
  void *v3;
  void *v4;
  void *v5;

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingRepresentationForArtworkCatalog:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)allowsVideoConstrainedNetworkAccess
{
  return self->_allowsVideoConstrainedNetworkAccess;
}

- (unint64_t)hash
{
  uint64_t v3;
  id WeakRetained;
  unint64_t v5;

  v3 = objc_msgSend(self->_token, "hash");
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_msgSend(WeakRetained, "hash") ^ v3;

  return v5;
}

- (void)requestImageWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MPArtworkCatalog_requestImageWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E31559A0;
  v7 = v4;
  v5 = v4;
  -[MPArtworkCatalog requestImageWithCompletion:](self, "requestImageWithCompletion:", v6);

}

- (void)requestImageWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MPArtworkCatalog_requestImageWithCompletion___block_invoke;
  v6[3] = &unk_1E31559C8;
  v7 = v4;
  v5 = v4;
  -[MPArtworkCatalog _requestBestRepresentationOfKind:completionHandler:](self, "_requestBestRepresentationOfKind:completionHandler:", 0, v6);

}

- (void)setDestination:(id)a3 configurationBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MPArtworkCatalog_setDestination_configurationBlock___block_invoke;
  v8[3] = &unk_1E31559F0;
  v9 = v6;
  v7 = v6;
  -[MPArtworkCatalog setDestination:forRepresentationKinds:configurationBlock:](self, "setDestination:forRepresentationKinds:configurationBlock:", a3, 1, v8);

}

- (void)requestVideoWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MPArtworkCatalog_requestVideoWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E31559C8;
  v7 = v4;
  v5 = v4;
  -[MPArtworkCatalog _requestBestRepresentationOfKind:completionHandler:](self, "_requestBestRepresentationOfKind:completionHandler:", 1, v6);

}

- (void)setAllowsVideoConstrainedNetworkAccess:(BOOL)a3
{
  void *v5;
  void *v6;
  id configurationBlock;

  if (self->_allowsVideoConstrainedNetworkAccess != a3)
  {
    if (-[MPArtworkCatalog isLoadingRepresentation](self, "isLoadingRepresentation"))
    {
      -[MPArtworkCatalog dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancelLoadingRepresentationForArtworkCatalog:", self);

      -[MPArtworkCatalog setLoadingRepresentation:](self, "setLoadingRepresentation:", 0);
    }
    self->_allowsVideoConstrainedNetworkAccess = a3;
    ++self->_modelRevisionID;
    -[MPArtworkCatalog bestAvailableRepresentationCollection](self, "bestAvailableRepresentationCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetForRepresentationKinds:", 2);

    os_unfair_lock_lock(&self->_lock);
    configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock)
      -[MPArtworkCatalog _updateRepresentations](self, "_updateRepresentations");
  }
}

- (void)setPreferredVideoKind:(int64_t)a3
{
  void *v5;
  id configurationBlock;

  if (self->_preferredVideoFormat != a3)
  {
    if (-[MPArtworkCatalog isLoadingRepresentation](self, "isLoadingRepresentation"))
    {
      -[MPArtworkCatalog dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancelLoadingRepresentationForArtworkCatalog:", self);

      -[MPArtworkCatalog setLoadingRepresentation:](self, "setLoadingRepresentation:", 0);
    }
    self->_preferredVideoFormat = a3;
    ++self->_modelRevisionID;
    os_unfair_lock_lock(&self->_lock);
    configurationBlock = self->_configurationBlock;
    os_unfair_lock_unlock(&self->_lock);
    if (configurationBlock)
      -[MPArtworkCatalog _updateRepresentations](self, "_updateRepresentations");
  }
}

- (void)setMainThreadBoundDestination:(id)a3 forRepresentationKinds:(unint64_t)a4 configurationBlock:(id)a5
{
  -[MPArtworkCatalog _setDestination:isMainThreadBound:forRepresentationKinds:configurationBlock:](self, "_setDestination:isMainThreadBound:forRepresentationKinds:configurationBlock:", a3, 1, a4, a5);
}

- (void)requestColorAnalysisWithAlgorithm:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MPArtworkCatalog *v18;
  id v19;
  void (**v20)(id, uint64_t);
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  v21 = CFSTR("MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v9, "existingArtworkEffectResultForEffectType:catalog:options:", 1, self, v8),
        (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    if (v6)
      v6[2](v6, v10);
  }
  else
  {
    -[MPArtworkCatalog token](self, "token");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_artworkLoadQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke;
    v15[3] = &unk_1E31618C8;
    v16 = v12;
    v17 = v9;
    v18 = self;
    v19 = v8;
    v20 = v6;
    v14 = v12;
    objc_msgSend(v13, "addOperationWithBlock:", v15);

    v11 = 0;
  }

}

- (void)requestRadiosityImageWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MPArtworkCatalog *v14;
  void (**v15)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  -[MPArtworkCatalog dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v5, "existingArtworkEffectResultForEffectType:catalog:options:", 3, self, MEMORY[0x1E0C9AA70]),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    if (v4)
      v4[2](v4, v6);
  }
  else
  {
    -[MPArtworkCatalog token](self, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_artworkLoadQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E315C088;
    v12 = v8;
    v13 = v5;
    v14 = self;
    v15 = v4;
    v10 = v8;
    objc_msgSend(v9, "addOperationWithBlock:", v11);

    v7 = 0;
  }

}

- (MPArtworkImageAttachments)imageAttachments
{
  void *v3;
  void *v4;

  -[MPArtworkCatalog dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "existingArtworkEffectResultForEffectType:catalog:options:", 4, self, MEMORY[0x1E0C9AA70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (MPArtworkImageAttachments *)v4;
}

- (void)requestExportableArtworkPropertiesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MPArtworkCatalog dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__MPArtworkCatalog_requestExportableArtworkPropertiesWithCompletion___block_invoke;
    v7[3] = &unk_1E315C398;
    v8 = v4;
    objc_msgSend(v5, "getExportableArtworkPropertiesForCatalog:completionHandler:", self, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPArtworkCatalogErrorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

- (void)_requestBestRepresentationOfKind:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[5];
  void (**v11)(id, void *, _QWORD);
  int64_t v12;

  v6 = (void (**)(id, void *, _QWORD))a4;
  -[MPArtworkCatalog _existingRepresentationOfKind:](self, "_existingRepresentationOfKind:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (-[MPArtworkCatalog dataSource](self, "dataSource"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isRepresentation:bestRepresentationForArtworkCatalog:", v7, self),
        v8,
        (v9 & 1) != 0))
  {
    if (v6)
      v6[2](v6, v7, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__MPArtworkCatalog__requestBestRepresentationOfKind_completionHandler___block_invoke;
    v10[3] = &unk_1E3155B50;
    v10[4] = self;
    v12 = a3;
    v11 = v6;
    -[MPArtworkCatalog _loadRepresentationOfKind:completionHandler:](self, "_loadRepresentationOfKind:completionHandler:", a3, v10);

  }
}

- (void)setDestination:(id)a3 progressiveConfigurationBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__MPArtworkCatalog_setDestination_progressiveConfigurationBlock___block_invoke;
  v8[3] = &unk_1E31559F0;
  v9 = v6;
  v7 = v6;
  -[MPArtworkCatalog setDestination:forRepresentationKinds:configurationBlock:](self, "setDestination:forRepresentationKinds:configurationBlock:", a3, 1, v8);

}

- (void)setPreferredVideoFormat:(int64_t)a3
{
  self->_preferredVideoFormat = a3;
}

- (id)configurationBlock
{
  return self->_configurationBlock;
}

- (void)setConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)representationKinds
{
  return self->_representationKinds;
}

- (void)setBestAvailableRepresentationCollection:(id)a3
{
  objc_storeStrong((id *)&self->_bestAvailableRepresentationCollection, a3);
}

- (NSCopying)loadingKey
{
  return self->_loadingKey;
}

- (void)setVideoCacheStoragePolicy:(unint64_t)a3
{
  self->_videoCacheStoragePolicy = a3;
}

- (void)setOverlayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_overlayDelegate, a3);
}

- (id)overlayToken
{
  return self->_overlayToken;
}

- (void)setOverlayToken:(id)a3
{
  objc_storeStrong(&self->_overlayToken, a3);
}

- (id)overlayStorage
{
  return self->_overlayStorage;
}

- (void)setOverlayStorage:(id)a3
{
  objc_storeStrong(&self->_overlayStorage, a3);
}

void __65__MPArtworkCatalog_setDestination_progressiveConfigurationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "imageRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "imageRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "isBestRepresentationForKind:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __71__MPArtworkCatalog__requestBestRepresentationOfKind_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[6];
      v11 = 138543874;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "[MPArtwork] HALTING -- Error loading artwork for catalog: %{public}@ kind: %ld error: %{public}@", (uint8_t *)&v11, 0x20u);
    }

  }
  v10 = a1[5];
  if (v10 && a1[4])
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

uint64_t __69__MPArtworkCatalog_requestExportableArtworkPropertiesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E3155AB8;
  v14 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v15 = v3;
  v16 = v4;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v11[0] = v2;
    v11[1] = 3221225472;
    v11[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_7;
    v11[3] = &unk_1E3155A68;
    v8 = &v12;
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v6, "loadArtworkEffectResultForEffectType:catalog:options:systemEffectHandler:completionHandler:", 3, v7, MEMORY[0x1E0C9AA70], v5, v11);
  }
  else
  {
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_8;
    v9[3] = &unk_1E3155A68;
    v8 = &v10;
    v10 = *(id *)(a1 + 56);
    ((void (**)(_QWORD, _QWORD *))v5)[2](v5, v9);
  }

}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  MPArtworkCatalog *v4;
  uint64_t v5;
  id v6;
  MPArtworkCatalog *v7;
  _QWORD v8[4];
  MPArtworkCatalog *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = -[MPArtworkCatalog initWithToken:dataSource:]([MPArtworkCatalog alloc], "initWithToken:dataSource:", a1[4], a1[5]);
  -[MPArtworkCatalog setFittingSize:](v4, "setFittingSize:", 300.0, 300.0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E315B910;
  v5 = a1[6];
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  v7 = v4;
  -[MPArtworkCatalog requestImageWithCompletion:](v7, "requestImageWithCompletion:", v8);

}

uint64_t __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  MPArtworkResizeUtility *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  MPArtworkResizeUtility *v10;
  id v11;
  _QWORD v12[5];
  MPArtworkResizeUtility *v13;
  id v14;

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(MPArtworkResizeUtility);
    objc_msgSend(*(id *)(a1 + 32), "fittingSize");
    v6 = v5;
    v8 = v7;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_4;
    v12[3] = &unk_1E315B910;
    v9 = *(id *)(a1 + 48);
    v13 = v4;
    v14 = v9;
    v12[4] = *(_QWORD *)(a1 + 40);
    v10 = v4;
    v11 = -[MPArtworkResizeUtility resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:](v10, "resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:", v3, 1, 0, v12, v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_4(id *a1, id a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v4 = objc_msgSend(objc_retainAutorelease(a2), "CGImage");
    v5 = (void *)MEMORY[0x1E0D1A6C8];
    objc_msgSend(a1[4], "destinationScale");
    v7 = (uint64_t)v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_5;
    v8[3] = &unk_1E3155A90;
    v10 = a1[6];
    v9 = a1[5];
    objc_msgSend(v5, "radiosityImageWithImage:displayScale:completionHandler:", v4, v7, v8);

  }
}

void __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", a2);
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_6;
  block[3] = &unk_1E3161780;
  v9 = *(id *)(a1 + 40);
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __63__MPArtworkCatalog_requestRadiosityImageWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 0);
}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_2;
  v12[3] = &unk_1E3155A40;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_5;
    v10[3] = &unk_1E3155A68;
    v6 = &v11;
    v7 = *(_QWORD *)(a1 + 56);
    v11 = *(id *)(a1 + 64);
    objc_msgSend(v4, "loadArtworkEffectResultForEffectType:catalog:options:systemEffectHandler:completionHandler:", 1, v5, v7, v3, v10);
  }
  else
  {
    v8[0] = v2;
    v8[1] = 3221225472;
    v8[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_6;
    v8[3] = &unk_1E3155A68;
    v6 = &v9;
    v9 = *(id *)(a1 + 64);
    ((void (**)(_QWORD, _QWORD *))v3)[2](v3, v8);
  }

}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  MPArtworkCatalog *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = -[MPArtworkCatalog initWithToken:dataSource:]([MPArtworkCatalog alloc], "initWithToken:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_3;
  v6[3] = &unk_1E31559A0;
  v7 = v3;
  v5 = v3;
  -[MPArtworkCatalog requestImageWithCompletion:](v4, "requestImageWithCompletion:", v6);

}

uint64_t __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D000]), "initWithSourceImage:", objc_msgSend(objc_retainAutorelease(v5), "CGImage"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_4;
    v9[3] = &unk_1E3155A18;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "analyzeWithCompletionHandler:", v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }

}

void __65__MPArtworkCatalog_requestColorAnalysisWithAlgorithm_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    +[MPArtworkColorAnalysis translateFromMSVColorAnalysis:](MPArtworkColorAnalysis, "translateFromMSVColorAnalysis:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

_QWORD *__53__MPArtworkCatalog__callConfigurationWithRevisionID___block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (*(_QWORD *)(v1 + 24) == result[7])
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(result[6] + 16))(result[6], result[5], *(_QWORD *)(v1 + 88));
  return result;
}

void __54__MPArtworkCatalog_requestVideoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "video");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __54__MPArtworkCatalog_setDestination_configurationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = a2;
    objc_msgSend(a3, "imageRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __47__MPArtworkCatalog_requestImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "image");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

uint64_t __54__MPArtworkCatalog_requestImageWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)staticArtworkCatalogWithImage:(id)a3
{
  id v4;
  _MPStaticArtworkVisualIdenticalityIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(_MPStaticArtworkVisualIdenticalityIdentifier);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lx"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPStaticArtworkVisualIdenticalityIdentifier setImageArtworkIdentifier:](v5, "setImageArtworkIdentifier:", v6);

  +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v5, v4, MPArtworkCatalogOriginalSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPArtworkRepresentationCollection collectionWithImageRepresentation:videoRepresentation:](MPArtworkRepresentationCollection, "collectionWithImageRepresentation:videoRepresentation:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "staticArtworkCatalogWithRepresentationCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)staticArtworkCatalogWithRepresentationCollection:(id)a3
{
  id v3;
  MPArtworkCatalog *v4;
  void *v5;
  MPArtworkCatalog *v6;

  if (a3)
  {
    v3 = a3;
    v4 = [MPArtworkCatalog alloc];
    +[_MPArtworkCatalogStaticDataSource sharedDataSource](_MPArtworkCatalogStaticDataSource, "sharedDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPArtworkCatalog initWithToken:dataSource:](v4, "initWithToken:dataSource:", v3, v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)placeholderCatalogWithSymbolName:(id)a3
{
  id v3;
  MPArtworkCatalog *v4;
  void *v5;
  MPArtworkCatalog *v6;

  v3 = a3;
  v4 = [MPArtworkCatalog alloc];
  +[_MPArtworkCatalogPlaceholderDataSource sharedDataSource](_MPArtworkCatalogPlaceholderDataSource, "sharedDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPArtworkCatalog initWithToken:dataSource:](v4, "initWithToken:dataSource:", v3, v5);

  return v6;
}

+ (id)_registeredIdentifiableDataSourceAndTokenClasses
{
  if (_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClassesOnceToken != -1)
    dispatch_once(&_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClassesOnceToken, &__block_literal_global_12598);
  return (id)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
}

+ (MPArtworkCatalog)artworkCatalogWithDataSourceShortDescription:(id)a3 dataSourceIdentifier:(id)a4 tokenParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_registeredIdentifiableDataSourceAndTokenClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v12)
  {
    v15 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v13 = v12;
  v27 = a1;
  v28 = v10;
  v29 = v9;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v31 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v18, "artworkDataSourceShortDescription");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19 == v8)
      {

LABEL_10:
        v14 = (void *)objc_msgSend(v11, "objectForKey:", v18);
        v15 = v18;
        continue;
      }
      v20 = v19;
      v21 = objc_msgSend(v19, "isEqual:", v8);

      if (v21)
        goto LABEL_10;
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v13);
  if (!v15)
  {
    v10 = v28;
    v9 = v29;
    a1 = v27;
    goto LABEL_18;
  }
  v10 = v28;
  v9 = v29;
  a1 = v27;
  if (!v14)
LABEL_18:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Identifiable data source with short description \"%@\" is not properly registered."), v8);
  objc_msgSend(v15, "artworkDataSourceWithIdentifier:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "artworkTokenWithParameters:", v10);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = 0;
  if (v22 && v23)
    v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithToken:dataSource:", v23, v22);

  return (MPArtworkCatalog *)v25;
}

+ (void)_setCachePurgesWhenEnteringBackground:(BOOL)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5
{
  objc_msgSend(a1, "_setCachePurgesWhenEnteringBackground:forCacheIdentifier:requestingContext:representationKind:", a3, a4, a5, 0);
}

+ (void)_setCachePurgesWhenEnteringBackground:(BOOL)a3 forCacheIdentifier:(id)a4 requestingContext:(id)a5 representationKind:(int64_t)a6
{
  _BOOL8 v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_artworkCacheForIdentifier:requestingContext:representationKind:", a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEvictsObjectsWhenApplicationEntersBackground:", v6);

}

uint64_t __68__MPArtworkCatalog__registeredIdentifiableDataSourceAndTokenClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
  _registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses = v0;

  v2 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
  v3 = objc_opt_class();
  objc_msgSend(v2, "setObject:forKey:", v3, objc_opt_class());
  v4 = (void *)_registeredIdentifiableDataSourceAndTokenClasses_sRegisteredIdentifiableDataSourceAndTokenClasses;
  v5 = objc_opt_class();
  return objc_msgSend(v4, "setObject:forKey:", v5, objc_opt_class());
}

- (int64_t)MP_artworkType
{
  void *v2;
  int64_t v3;

  -[MPArtworkCatalog token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "artworkType");

  return v3;
}

@end
