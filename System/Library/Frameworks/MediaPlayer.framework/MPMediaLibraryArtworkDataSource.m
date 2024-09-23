@implementation MPMediaLibraryArtworkDataSource

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  void *v3;
  _MPMediaLibraryArtworkVisualIdenticalityIdentifier *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _MPMediaLibraryArtworkVisualIdenticalityIdentifier *v8;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [_MPMediaLibraryArtworkVisualIdenticalityIdentifier alloc];
  v5 = objc_msgSend(v3, "artworkType");
  objc_msgSend(v3, "availableArtworkToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchableArtworkToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_MPMediaLibraryArtworkVisualIdenticalityIdentifier initWithArtworkType:availableArtworkToken:fetchableArtworkToken:](v4, "initWithArtworkType:availableArtworkToken:fetchableArtworkToken:", v5, v6, v7);

  return v8;
}

- (NSCache)fallbackCache
{
  NSCache *v3;

  if (-[MPMediaLibraryArtworkDataSource usesFallbackCache](self, "usesFallbackCache"))
    v3 = self->_fallbackCache;
  else
    v3 = 0;
  return v3;
}

- (BOOL)usesFallbackCache
{
  return self->_usesFallbackCache;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MPMediaLibraryArtworkDataSource _existingRepresentationForArtworkCatalog:fromCacheOnly:](self, "_existingRepresentationForArtworkCatalog:fromCacheOnly:", v4, ((unint64_t)objc_msgSend(v4, "renderHint") >> 3) & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasExportableArtworkPropertiesForCatalog:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MPMediaLibraryArtwork fetchableArtworkExistsForRequest:](MPMediaLibraryArtwork, "fetchableArtworkExistsForRequest:", v3);

  return v4;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5
    && (objc_msgSend(v6, "token"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = +[MPMediaLibraryArtwork needsToFetchArtworkForRequest:](MPMediaLibraryArtwork, "needsToFetchArtworkForRequest:", v8), v8, !v9))
  {
    objc_msgSend(v5, "representationToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validSizes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledFittingSize");
    v15 = MPArtworkRepresentationBestSizeMatchingSize(v12, v13, v14);
    v17 = v16;

    objc_msgSend(v5, "representationSize");
    v10 = v19 == v17 && v18 == v15;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_existingRepresentationForArtworkCatalog:(id)a3 fromCacheOnly:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;

  v6 = a3;
  -[MPMediaLibraryArtworkDataSource _cachedRepresentationForCatalog:](self, "_cachedRepresentationForCatalog:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v6, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "scaledFittingSize");
      if (v13 != *(double *)&MPArtworkCatalogOriginalSize || v12 != *((double *)&MPArtworkCatalogOriginalSize + 1))
      {
        objc_msgSend(v11, "validSizes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "scaledFittingSize");
        v18 = MPArtworkRepresentationBestSizeMatchingSize(v15, v16, v17);
        v20 = v19;

        -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, v18, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v9 = (id)v21;
          goto LABEL_19;
        }
        objc_msgSend(v11, "validSizes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v18, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "indexOfObject:", v23);

        v25 = v24 + 1;
        while (v25 < objc_msgSend(v22, "count"))
        {
          objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "CGSizeValue");
          v28 = v27;
          v30 = v29;

          -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, v28, v30);
          v31 = objc_claimAutoreleasedReturnValue();
          ++v25;
          if (v31)
          {
            v9 = (id)v31;
            -[MPMediaLibraryArtworkDataSource _cacheRepresentation:forCatalog:](self, "_cacheRepresentation:forCatalog:", v31, v6);

            goto LABEL_21;
          }
        }

      }
      if ((objc_msgSend(v6, "renderHint") & 4) == 0)
      {
        -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, MPArtworkCatalogOriginalSize);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
LABEL_21:

          goto LABEL_22;
        }
LABEL_19:
        -[MPMediaLibraryArtworkDataSource _cacheRepresentation:forCatalog:](self, "_cacheRepresentation:forCatalog:", v9, v6);
        goto LABEL_21;
      }
    }
    v9 = 0;
    goto LABEL_21;
  }
  v9 = v7;
LABEL_22:

  return v9;
}

- (id)_representationAtSize:(CGSize)a3 forCatalog:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageFileURLForSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithContentsOfExactFilePath:", v11);

    if (v12)
      objc_setAssociatedObject(v12, "MPArtworkRepresentationBackingFileURLAssociatedKey", v9, (void *)3);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v6, "visualIdenticalityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v13, v12, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setRepresentationToken:", v8);
  return v14;
}

- (id)_cachedRepresentationForCatalog:(id)a3
{
  id v4;
  void *v5;
  _MPMediaLibraryArtworkDataSourceCacheKey *v6;
  _MPMediaLibraryArtworkDataSourceCacheKey *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [_MPMediaLibraryArtworkDataSourceCacheKey alloc];
  objc_msgSend(v4, "scaledFittingSize");
  v7 = -[_MPMediaLibraryArtworkDataSourceCacheKey initWithArtworkCatalog:representativeSize:](v6, "initWithArtworkCatalog:representativeSize:", v4);
  objc_msgSend(v4, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fetchableArtworkToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {

  }
  else
  {
    objc_msgSend(v8, "availableArtworkToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend(v5, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[MPMediaLibraryArtworkDataSource fallbackCache](self, "fallbackCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v12;
}

- (void)_cacheRepresentation:(id)a3 forCatalog:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _MPMediaLibraryArtworkDataSourceCacheKey *v12;
  _MPMediaLibraryArtworkDataSourceCacheKey *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _MPMediaLibraryArtworkDataSourceCacheKey *v18;

  v6 = a3;
  if (v6)
  {
    v7 = a4;
    objc_msgSend(v7, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[MPMediaLibraryArtworkDataSource fallbackCache](self, "fallbackCache");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    v12 = [_MPMediaLibraryArtworkDataSourceCacheKey alloc];
    objc_msgSend(v7, "scaledFittingSize");
    v13 = -[_MPMediaLibraryArtworkDataSourceCacheKey initWithArtworkCatalog:representativeSize:](v12, "initWithArtworkCatalog:representativeSize:", v7);

    objc_msgSend(v11, "setObject:forKey:", v6, v13);
    if (!objc_msgSend(v6, "kind"))
    {
      objc_msgSend(v6, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __67__MPMediaLibraryArtworkDataSource__cacheRepresentation_forCatalog___block_invoke;
      v15[3] = &unk_1E3161418;
      v16 = v6;
      v17 = v11;
      v18 = v13;
      objc_msgSend(v14, "prepareForDisplayWithCompletionHandler:", v15);

    }
  }

}

- (MPMediaLibraryArtworkDataSource)init
{
  MPMediaLibraryArtworkDataSource *v2;
  MPMediaLibraryArtworkDataSource *v3;
  NSCache *v4;
  NSCache *fallbackCache;
  MPArtworkResizeUtility *v6;
  MPArtworkResizeUtility *artworkResizeUtility;
  MPArtworkColorAnalysisUtility *v8;
  MPArtworkColorAnalysisUtility *artworkColorAnalysisUtility;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPMediaLibraryArtworkDataSource;
  v2 = -[MPMediaLibraryArtworkDataSource init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_usesFallbackCache = 1;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    fallbackCache = v3->_fallbackCache;
    v3->_fallbackCache = v4;

    v6 = -[MPArtworkResizeUtility initWithQualityOfService:]([MPArtworkResizeUtility alloc], "initWithQualityOfService:", 17);
    artworkResizeUtility = v3->_artworkResizeUtility;
    v3->_artworkResizeUtility = v6;

    v8 = -[MPArtworkColorAnalysisUtility initWithQualityOfService:]([MPArtworkColorAnalysisUtility alloc], "initWithQualityOfService:", 17);
    artworkColorAnalysisUtility = v3->_artworkColorAnalysisUtility;
    v3->_artworkColorAnalysisUtility = v8;

  }
  return v3;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MPMediaLibraryArtwork artworkExistsForRequest:](MPMediaLibraryArtwork, "artworkExistsForRequest:", v3);

  return v4;
}

- (void)setMediaLibraryUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

void __67__MPMediaLibraryArtworkDataSource__cacheRepresentation_forCatalog___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "representationWithPreparedImage:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

  }
}

- (void)setUsesFallbackCache:(BOOL)a3
{
  self->_usesFallbackCache = a3;
}

- (BOOL)hasExistingRepresentationOnDiskForArtworkCatalog:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !+[MPMediaLibraryArtwork needsToFetchArtworkForRequest:](MPMediaLibraryArtwork, "needsToFetchArtworkForRequest:", v3);

  return v4;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  id location;

  v6 = a3;
  if (a4)
    v7 = a4;
  else
    v7 = &__block_literal_global_43921;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v7);
  if ((objc_msgSend(v6, "renderHint") & 8) != 0
    && (-[MPMediaLibraryArtworkDataSource _existingRepresentationForArtworkCatalog:fromCacheOnly:](self, "_existingRepresentationForArtworkCatalog:fromCacheOnly:", v6, 0), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    v8[2](v8, v9, 0);

  }
  else
  {
    objc_initWeak(&location, v6);
    objc_msgSend(v6, "token");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[MPMediaLibraryArtwork needsToFetchArtworkForRequest:](MPMediaLibraryArtwork, "needsToFetchArtworkForRequest:", v11);

    if (v12)
    {
      objc_msgSend(v6, "token");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
      v14[3] = &unk_1E3161348;
      objc_copyWeak(&v16, &location);
      v14[4] = self;
      v15 = v8;
      +[MPMediaLibraryArtwork fetchArtworkForRequest:completionHandler:](MPMediaLibraryArtwork, "fetchArtworkForRequest:completionHandler:", v13, v14);

      objc_destroyWeak(&v16);
    }
    else
    {
      -[MPMediaLibraryArtworkDataSource _resizeOriginalArtworkForArtworkCatalog:completionHandler:](self, "_resizeOriginalArtworkForArtworkCatalog:completionHandler:", v6, v8);
    }
    objc_destroyWeak(&location);
  }

}

- (void)_resizeOriginalArtworkForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  void (**v32)(id, void *, _QWORD);
  id v33;
  id location;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "validSizes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledFittingSize");
  v13 = MPArtworkRepresentationBestSizeMatchingSize(v10, v11, v12);
  v15 = v14;

  -[MPMediaLibraryArtworkDataSource _representationAtSize:forCatalog:](self, "_representationAtSize:forCatalog:", v6, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[MPMediaLibraryArtworkDataSource _cacheRepresentation:forCatalog:](self, "_cacheRepresentation:forCatalog:", v16, v6);
    v7[2](v7, v16, 0);
  }
  else
  {
    objc_msgSend(v9, "originalFileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);
    if (v17
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "path"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v18, "fileExistsAtPath:", v19),
          v19,
          v18,
          v20))
    {
      v21 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke;
      v31[3] = &unk_1E3161370;
      objc_copyWeak(&v33, &location);
      v31[4] = self;
      v32 = v7;
      v22 = -[MPMediaLibraryArtworkDataSource _resizeArtwork:forCatalog:toSize:completionHandler:](self, "_resizeArtwork:forCatalog:toSize:completionHandler:", v9, v6, v31, v13, v15);
      objc_msgSend(v6, "existingColorAnalysisWithAlgorithm:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
      {
        v29[0] = v21;
        v29[1] = 3221225472;
        v29[2] = __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke_2;
        v29[3] = &unk_1E3161398;
        v29[4] = self;
        v30 = v9;
        -[MPMediaLibraryArtworkDataSource _createColorAnalysisForArtwork:catalog:withCompletion:](self, "_createColorAnalysisForArtwork:catalog:withCompletion:", v30, v6, v29);

      }
      objc_destroyWeak(&v33);
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image did not exist at URL: %@"), v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("MPArtworkResizeDomain"), 0, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, void *, void *))v7)[2](v7, 0, v28);
    }
    objc_destroyWeak(&location);

  }
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v3;

  objc_msgSend(a3, "token");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryArtwork cancelFetchingArtworkForRequest:](MPMediaLibraryArtwork, "cancelFetchingArtworkForRequest:", v3);

}

- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  _MPMediaLibraryArtworkDataSourceCacheKey *v8;
  _MPMediaLibraryArtworkDataSourceCacheKey *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _MPMediaLibraryArtworkDataSourceCacheKey *v14;
  void (**v15)(id, void *, _QWORD);

  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v5, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [_MPMediaLibraryArtworkDataSourceCacheKey alloc];
  v9 = -[_MPMediaLibraryArtworkDataSourceCacheKey initWithArtworkCatalog:representativeSize:](v8, "initWithArtworkCatalog:representativeSize:", v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6[2](v6, v10, 0);
  }
  else
  {
    objc_msgSend(v5, "token");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__MPMediaLibraryArtworkDataSource_getExportableArtworkPropertiesForCatalog_completionHandler___block_invoke;
    v12[3] = &unk_1E31613C0;
    v13 = v7;
    v14 = v9;
    v15 = v6;
    +[MPMediaLibraryArtwork fetchArtworkInfoForRequest:completionHandler:](MPMediaLibraryArtwork, "fetchArtworkInfoForRequest:completionHandler:", v11, v12);

  }
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;

  v7 = a4;
  v8 = a5;
  if (a3 == 3)
  {
    objc_msgSend(v7, "token");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v18 = 0;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v10, "imageFileURLForEffect:", CFSTR("Radiosity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fileExistsAtPath:", v21);

    if (!v22)
    {
      v18 = 0;
      goto LABEL_15;
    }
    v23 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v23, "initWithContentsOfFile:", v13);
LABEL_12:

LABEL_15:
    goto LABEL_16;
  }
  if (a3 == 1)
  {
    objc_msgSend(v7, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "effectsMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ColorAnalysis"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary()
      && (v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D511F8]), "initWithColorAnalysisDictionary:", v15)) != 0)
    {
      v17 = (void *)v16;
      +[MPArtworkColorAnalyzer translateFromMLColorAnalysis:](MPArtworkColorAnalyzer, "translateFromMLColorAnalysis:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

    goto LABEL_12;
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (*v14)(id, _QWORD *);
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __126__MPMediaLibraryArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E31613F0;
  v19 = v11;
  v20 = v12;
  v21 = v13;
  v22 = a3;
  v14 = (void (*)(id, _QWORD *))*((_QWORD *)a6 + 2);
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v14(a6, v18);

}

- (id)_resizeArtwork:(id)a3 forCatalog:(id)a4 toSize:(CGSize)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  double v34;
  double v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  double v41;
  double v42;
  uint64_t v43;
  _QWORD v44[2];

  height = a5.height;
  width = a5.width;
  v44[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v13, "originalFileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageFileURLForSize:", width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "renderHint") & 2) != 0
    && objc_msgSend(MEMORY[0x1E0D4D028], "canConnectToMediaArtworkService"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D028]), "initWithSourceURL:", v14);
    v17 = objc_msgSend(MEMORY[0x1E0D51270], "devicePreferredImageFormat");
    if (v17)
      objc_msgSend(v16, "addDestinationWithFormat:size:url:", v17, v15, width, height);
    else
      objc_msgSend(v16, "addJPEGDestinationWithSize:compressionQuality:url:", v15, width, height, 0.9);
    objc_msgSend(MEMORY[0x1E0D4D008], "sharedService");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke;
    v36[3] = &unk_1E3161480;
    v37 = v15;
    v38 = v16;
    v39 = v11;
    v41 = width;
    v42 = height;
    v40 = v12;
    v20 = v16;
    objc_msgSend(v28, "sendRequest:completionHandler:", v20, v36);

LABEL_15:
    v24 = 0;
    goto LABEL_16;
  }
  if (!v14
    || (v18 = objc_alloc(MEMORY[0x1E0DC3870]),
        objc_msgSend(v14, "path"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = (id)objc_msgSend(v18, "initWithContentsOfExactFilePath:", v19),
        v19,
        !v20))
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image did not exist at URL: %@"), v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("MPArtworkResizeDomain"), 0, v27);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
      (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v20);
    goto LABEL_15;
  }
  objc_setAssociatedObject(v20, "MPArtworkRepresentationBackingFileURLAssociatedKey", v14, (void *)3);
  if (objc_msgSend(MEMORY[0x1E0D4D020], "hasWriteAccessToPath:", v15))
    v21 = v15;
  else
    v21 = 0;
  v22 = v21;
  -[MPMediaLibraryArtworkDataSource artworkResizeUtility](self, "artworkResizeUtility");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke_3;
  v30[3] = &unk_1E31614A8;
  v33 = v12;
  v31 = v15;
  v32 = v11;
  v34 = width;
  v35 = height;
  objc_msgSend(v23, "resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:", v20, 0, v22, v30, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v24;
}

- (void)_createColorAnalysisForArtwork:(id)a3 catalog:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "autogeneratedSizes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "autogeneratedSizes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CGSizeValue");
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v19 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke;
  v34[3] = &unk_1E31614D0;
  v20 = v8;
  v35 = v20;
  v21 = v9;
  v36 = v21;
  v22 = (void *)MEMORY[0x19403A810](v34);
  v23 = objc_msgSend(v10, "renderHint");

  objc_msgSend(v20, "imageFileURLForSize:", v16, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v23 & 2) != 0 && objc_msgSend(MEMORY[0x1E0D4D028], "canConnectToMediaArtworkService"))
  {
    v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D010]), "initWithSourceURL:preferredImageSize:", v24, v16, v18);
    objc_msgSend(MEMORY[0x1E0D4D008], "sharedService");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_47;
    v32[3] = &unk_1E31614F8;
    v33 = v22;
    v27 = v22;
    objc_msgSend(v26, "sendRequest:completion:", v25, v32);

  }
  else
  {
    -[MPMediaLibraryArtworkDataSource artworkColorAnalysisUtility](self, "artworkColorAnalysisUtility");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_2;
    v30[3] = &unk_1E31614F8;
    v31 = v22;
    v25 = v22;
    v29 = (id)objc_msgSend(v28, "performColorAnalysisForImageAtUrl:preferredImageSize:completionHandler:", v24, v30, v16, v18);

    v27 = v31;
  }

}

- (void)_updateCachedColorAnalysis:(id)a3 forArtwork:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = CFSTR("ColorAnalysis");
    v5 = a4;
    v6 = a3;
    objc_msgSend(&unk_1E31E4EA0, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    objc_msgSend(v6, "dictRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEffectsMetadata:", v10);

  }
}

- (NSString)mediaLibraryUniqueIdentifier
{
  return self->_mediaLibraryUniqueIdentifier;
}

- (void)setFallbackCache:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackCache, a3);
}

- (MPArtworkResizeUtility)artworkResizeUtility
{
  return self->_artworkResizeUtility;
}

- (void)setArtworkResizeUtility:(id)a3
{
  objc_storeStrong((id *)&self->_artworkResizeUtility, a3);
}

- (MPArtworkColorAnalysisUtility)artworkColorAnalysisUtility
{
  return self->_artworkColorAnalysisUtility;
}

- (void)setArtworkColorAnalysisUtility:(id)a3
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisUtility, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkColorAnalysisUtility, 0);
  objc_storeStrong((id *)&self->_artworkResizeUtility, 0);
  objc_storeStrong((id *)&self->_fallbackCache, 0);
  objc_storeStrong((id *)&self->_mediaLibraryUniqueIdentifier, 0);
}

void __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D511F8]), "initWithColorAnalysis:", v5);
    v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v17 = 138477827;
        v18 = v12;
        v13 = "Created color analysis for artwork: %{private}@";
        v14 = v11;
        v15 = OS_LOG_TYPE_INFO;
LABEL_10:
        _os_log_impl(&dword_193B9B000, v14, v15, v13, (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138477827;
      v18 = v16;
      v13 = "Failed to create color analysis for artwork: %{private}@";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }

    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9);
    goto LABEL_12;
  }
  v7 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v17 = 138478083;
    v18 = v8;
    v19 = 2113;
    v20 = v6;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{private}@ with error; %{private}@",
      (uint8_t *)&v17,
      0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_12:

}

uint64_t __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__MPMediaLibraryArtworkDataSource__createColorAnalysisForArtwork_catalog_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (!v3 && *(_QWORD *)(a1 + 32))
  {
    v10 = 0;
    objc_msgSend(*(id *)(a1 + 40), "enumerateDestinationsUsingBlock:", &__block_literal_global_41_43816);
    v5 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(*(id *)(a1 + 32), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithContentsOfExactFilePath:", v6);

    objc_msgSend(*(id *)(a1 + 48), "visualIdenticalityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v8, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_6;
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    v10 = v3;
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
LABEL_6:
    v3 = v10;
  }

}

void __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id object;

  object = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    if (object)
      objc_setAssociatedObject(object, "MPArtworkRepresentationBackingFileURLAssociatedKey", *(id *)(a1 + 32), (void *)3);
    objc_msgSend(*(id *)(a1 + 40), "visualIdenticalityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v6, object, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __86__MPMediaLibraryArtworkDataSource__resizeArtwork_forCatalog_toSize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D51270];
  v3 = a2;
  objc_msgSend(v2, "autoupdatingSharedLibrary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markSystemPurgeableMusicPath:forUrgency:", v5, ML3ArtworkPurgeabilityLevelCache());

}

void __126__MPMediaLibraryArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  UIImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;

  v46 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 != 3)
  {
    if (v6 != 1)
      goto LABEL_22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (objc_class *)MEMORY[0x1E0D4D090];
      v8 = v46;
      v9 = (UIImage *)objc_alloc_init(v7);
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "MP_hexStringFromColor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage setBackgroundColorHex:](v9, "setBackgroundColorHex:", v12);

      -[UIImage setBackgroundColorLight:](v9, "setBackgroundColorLight:", objc_msgSend(v8, "isBackgroundColorLight"));
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "primaryTextColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "MP_hexStringFromColor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage setPrimaryTextColorHex:](v9, "setPrimaryTextColorHex:", v15);

      -[UIImage setPrimaryTextColorLight:](v9, "setPrimaryTextColorLight:", objc_msgSend(v8, "isPrimaryTextColorLight"));
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "secondaryTextColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "MP_hexStringFromColor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage setSecondaryTextColorHex:](v9, "setSecondaryTextColorHex:", v18);

      -[UIImage setSecondaryTextColorLight:](v9, "setSecondaryTextColorLight:", objc_msgSend(v8, "isSecondaryTextColorLight"));
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "tertiaryTextColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "MP_hexStringFromColor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImage setTertiaryTextColorHex:](v9, "setTertiaryTextColorHex:", v21);

      v22 = objc_msgSend(v8, "isTertiaryTextColorLight");
      -[UIImage setTertiaryTextColorLight:](v9, "setTertiaryTextColorLight:", v22);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = (UIImage *)v46;
      else
        v9 = 0;
    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D511F8]), "initWithColorAnalysis:", v9);
    objc_msgSend(v24, "dictRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v35;

    objc_msgSend(*(id *)(a1 + 32), "token");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v32, "effectsMetadata");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "mutableCopy");

      objc_msgSend(v38, "objectForKey:", CFSTR("ColorAnalysis"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v39, "mutableCopy");

      if (!v40)
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("MPArtworkCatalogEffectOptionColorAnalyzerAlgorithm"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "integerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKey:", v25, v44);

      objc_msgSend(v38, "setObject:forKey:", v40, CFSTR("ColorAnalysis"));
      objc_msgSend(v32, "setEffectsMetadata:", v38);

    }
    goto LABEL_19;
  }
  v9 = (UIImage *)v46;
  objc_msgSend(*(id *)(a1 + 32), "token");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryArtwork availableArtworkWithRequest:](MPMediaLibraryArtwork, "availableArtworkWithRequest:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !v24)
    goto LABEL_21;
  objc_msgSend(v24, "imageFileURLForEffect:", CFSTR("Radiosity"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

  if ((v28 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByDeletingLastPathComponent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v31, 1, 0, 0);

    UIImagePNGRepresentation(v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "writeToURL:atomically:", v25, 1);
LABEL_19:

  }
LABEL_21:

LABEL_22:
  v45 = *(_QWORD *)(a1 + 48);
  if (v45)
    (*(void (**)(uint64_t, id, id))(v45 + 16))(v45, v46, v5);

}

void __94__MPMediaLibraryArtworkDataSource_getExportableArtworkPropertiesForCatalog_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = (void *)a1[4];
    if (v6)
      objc_msgSend(v6, "setObject:forKey:", v7, a1[5]);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "_cacheRepresentation:forCatalog:", v7, WeakRetained);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __93__MPMediaLibraryArtworkDataSource__resizeOriginalArtworkForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "originalFileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138477827;
      v7 = v5;
      _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{private}@", (uint8_t *)&v6, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateCachedColorAnalysis:forArtwork:", a2, *(_QWORD *)(a1 + 40));
  }
}

void __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  id v31;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    if (WeakRetained)
      objc_msgSend(*(id *)(a1 + 32), "_resizeOriginalArtworkForArtworkCatalog:completionHandler:", WeakRetained, *(_QWORD *)(a1 + 40));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "validSizes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaledFittingSize");
    v12 = MPArtworkRepresentationBestSizeMatchingSize(v9, v10, v11);
    v14 = v13;

    v15 = *(void **)(a1 + 32);
    v16 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3;
    v27[3] = &unk_1E31612F8;
    objc_copyWeak(&v31, (id *)(a1 + 48));
    v17 = v5;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v28 = v17;
    v29 = v18;
    v30 = v19;
    v20 = (id)objc_msgSend(v15, "_resizeArtwork:forCatalog:toSize:completionHandler:", v17, v8, v27, v12, v14);
    objc_msgSend(v8, "existingColorAnalysisWithAlgorithm:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = *(void **)(a1 + 32);
      v23[0] = v16;
      v23[1] = 3221225472;
      v23[2] = __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4;
      v23[3] = &unk_1E3161320;
      v24 = 0;
      v25 = v22;
      v26 = v17;
      objc_msgSend(v22, "_createColorAnalysisForArtwork:catalog:withCompletion:", v26, v8, v23);

    }
    objc_destroyWeak(&v31);
  }

}

void __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v7, "setRepresentationToken:", *(_QWORD *)(a1 + 32));
  if (!v5 && WeakRetained)
    objc_msgSend(*(id *)(a1 + 40), "_cacheRepresentation:forCatalog:", v7, WeakRetained);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __89__MPMediaLibraryArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "originalFileURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138477827;
      v6 = v4;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_ERROR, "Failed to create color analysis for artwork: %{private}@", (uint8_t *)&v5, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateCachedColorAnalysis:forArtwork:", a2, *(_QWORD *)(a1 + 48));
  }
}

+ (NSString)artworkDataSourceShortDescription
{
  return (NSString *)CFSTR("library");
}

+ (MPMediaLibraryArtworkDataSource)artworkDataSourceWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:allowsLoadingFromDisk:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (MPMediaLibraryArtworkDataSource *)v6;
}

@end
