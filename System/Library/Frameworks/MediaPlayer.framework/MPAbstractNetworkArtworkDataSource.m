@implementation MPAbstractNetworkArtworkDataSource

- (void)loadRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  int64_t v26;
  int64_t v27;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  OS_dispatch_queue *imageAccessQueue;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  MPAbstractNetworkArtworkDataSource *v49;
  id v50;
  id v51;
  void (**v52)(id, void *, _QWORD);
  int64_t v53;
  int64_t v54;
  BOOL v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint8_t buf[4];
  MPAbstractNetworkArtworkDataSource *v61;
  __int16 v62;
  int64_t v63;
  __int16 v64;
  int64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v61 = self;
    v62 = 2048;
    v63 = a3;
    v64 = 2114;
    v65 = (int64_t)v8;
    _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Calling loadRepresentationOfKind: %ld, for artwork catalog: %{public}@", buf, 0x20u);
  }

  if (a3 == 1)
  {
    -[MPAbstractNetworkArtworkDataSource _bestVideoArtworkRepresentationForCatalog:](self, "_bestVideoArtworkRepresentationForCatalog:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "representationSize");
      -[MPAbstractNetworkArtworkDataSource _cacheKeyForCatalog:kind:size:](self, "_cacheKeyForCatalog:kind:size:", v8, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if (v11)
        {
          objc_msgSend(v12, "setObject:forKey:", v11, v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v37, v13);

        }
      }

    }
    v9[2](v9, v11, 0);
    goto LABEL_41;
  }
  objc_msgSend(v8, "cache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    -[MPAbstractNetworkArtworkDataSource fallbackImageArtworkRepresentationCache](self, "fallbackImageArtworkRepresentationCache");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v16;

  -[MPAbstractNetworkArtworkDataSource _existingRepresentationFromURLCacheForArtworkCatalog:immediateImageDecompressionAllowed:](self, "_existingRepresentationFromURLCacheForArtworkCatalog:immediateImageDecompressionAllowed:", v8, 1);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    -[MPAbstractNetworkArtworkDataSource _bestAvailableSizeForCatalog:kind:](self, "_bestAvailableSizeForCatalog:kind:", v8, a3);
    v26 = *(_QWORD *)&v24;
    v27 = *(_QWORD *)&v25;
    if (v24 == *MEMORY[0x1E0C9D820] && v25 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v31 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v61 = self;
        v62 = 2114;
        v63 = (int64_t)v8;
        v64 = 2048;
        v65 = a3;
        _os_log_impl(&dword_193B9B000, v31, OS_LOG_TYPE_FAULT, "%{public}@ Artwork request cannot have a size of zero, catalog: %{public}@, representation kind: %ld", buf, 0x20u);
      }
      v32 = 0;
    }
    else
    {
      -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v8, a3, v24, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v61 = self;
        v62 = 2048;
        v63 = v26;
        v64 = 2048;
        v65 = v27;
        _os_log_impl(&dword_193B9B000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Created request for size: %f, %f", buf, 0x20u);
      }

      v31 = objc_msgSend(v29, "mutableCopy");
      -[NSObject setAttribution:](v31, "setAttribution:", 1);
      v32 = -[NSObject copy](v31, "copy");

    }
    objc_msgSend(v32, "URL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v61 = self;
      v62 = 2114;
      v63 = (int64_t)v33;
      _os_log_impl(&dword_193B9B000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting artwork request for url: %{public}@", buf, 0x16u);
    }

    if (v33)
    {
      imageAccessQueue = self->_imageAccessQueue;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke;
      v46[3] = &unk_1E31573C0;
      v47 = v8;
      v48 = v33;
      v49 = self;
      v52 = v9;
      v53 = v26;
      v54 = v27;
      v50 = v32;
      v55 = v11 != 0;
      v51 = v11;
      -[MPAbstractNetworkArtworkDataSource _performAsyncBarrierBlockOnQueue:block:](self, "_performAsyncBarrierBlockOnQueue:block:", imageAccessQueue, v46);

      v36 = v47;
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Artwork request must have a non-nil URL. catalog=%@"), v8);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v61 = self;
        v62 = 2114;
        v63 = (int64_t)v36;
        _os_log_impl(&dword_193B9B000, v39, OS_LOG_TYPE_FAULT, "%{public}@ -loadRepresentationOfKind:forArtworkCatalog:completionHandler: %{public}@", buf, 0x16u);
      }

      if (v9)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v58 = *MEMORY[0x1E0CB2938];
        v59 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("MPAbstractNetworkArtworkDataSourceErrorDomain"), 1, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(id, void *, void *))v9)[2](v9, 0, v42);
      }
    }
    else
    {
      if (!v9)
        goto LABEL_32;
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create URL request for catalog: %@"), v8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("MPAbstractNetworkArtworkDataSource"), 0, v45);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, void *, void *))v9)[2](v9, 0, v36);
    }

LABEL_32:
    v12 = 0;
    goto LABEL_41;
  }
  v12 = (void *)v17;
  v18 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v61 = self;
    v62 = 2114;
    v63 = (int64_t)v12;
    v64 = 2114;
    v65 = (int64_t)v8;
    _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Found existing representation: %{public}@ from url cache for catalog: %{public}@", buf, 0x20u);
  }

  if (v11)
  {
    v19 = objc_msgSend(v12, "kind");
    objc_msgSend(v12, "representationSize");
    -[MPAbstractNetworkArtworkDataSource _cacheKeyForCatalog:kind:size:](self, "_cacheKeyForCatalog:kind:size:", v8, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      -[MPAbstractNetworkArtworkDataSource fallbackImageArtworkRepresentationCache](self, "fallbackImageArtworkRepresentationCache");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v23;

    if (v20)
      objc_msgSend(v38, "setObject:forKey:", v12, v20);

  }
  v9[2](v9, v12, 0);
LABEL_41:

}

- (id)existingRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;

  v6 = a4;
  v7 = v6;
  if (a3 == 1)
  {
    objc_msgSend(v6, "videoCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v6, "cache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[MPAbstractNetworkArtworkDataSource fallbackImageArtworkRepresentationCache](self, "fallbackImageArtworkRepresentationCache");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    if (!v11)
      goto LABEL_10;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__MPAbstractNetworkArtworkDataSource_existingRepresentationOfKind_forArtworkCatalog___block_invoke;
  v17[3] = &unk_1E3157348;
  v17[4] = self;
  v18 = v7;
  v20 = a3;
  v19 = v11;
  -[MPAbstractNetworkArtworkDataSource _existingRepresentativeObjectForArtworkCatalog:kind:handler:](self, "_existingRepresentativeObjectForArtworkCatalog:kind:handler:", v18, a3, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  if (a3 == 1 && !v12)
  {
    -[MPAbstractNetworkArtworkDataSource _bestVideoArtworkRepresentationForCatalog:](self, "_bestVideoArtworkRepresentationForCatalog:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v11)
    {
      if (v13)
      {
        v14 = objc_msgSend(v13, "kind");
        objc_msgSend(v12, "representationSize");
        -[MPAbstractNetworkArtworkDataSource _cacheKeyForCatalog:kind:size:](self, "_cacheKeyForCatalog:kind:size:", v7, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v11, "setObject:forKey:", v12, v15);

      }
    }
  }
LABEL_18:

  return v12;
}

- (id)_existingRepresentativeObjectForArtworkCatalog:(id)a3 kind:(int64_t)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t *);
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v28;

  v8 = a3;
  v9 = (void (**)(id, uint64_t *))a5;
  -[MPAbstractNetworkArtworkDataSource _bestAvailableSizeForCatalog:kind:](self, "_bestAvailableSizeForCatalog:kind:", v8, a4);
  v11 = v10;
  v13 = v12;
  v28 = 0;
  v9[2](v9, &v28);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (a4 || v14)
    goto LABEL_16;
  if (v28
    && !-[MPAbstractNetworkArtworkDataSource shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable](self, "shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable"))
  {
    v15 = 0;
    goto LABEL_16;
  }
  -[MPAbstractNetworkArtworkDataSource sortedSupportedSizesForCatalog:](self, "sortedSupportedSizesForCatalog:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    -[MPAbstractNetworkArtworkDataSource supportedSizesForCatalog:](self, "supportedSizesForCatalog:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_373);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v11, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "indexOfObject:", v18);

  v20 = v19 + 1;
  if (v19 + 1 >= (unint64_t)objc_msgSend(v16, "count"))
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  while (1)
  {
    objc_msgSend(v16, "objectAtIndexedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "CGSizeValue");
    v23 = v22;
    v25 = v24;

    if (!-[MPAbstractNetworkArtworkDataSource _isRepresentationSize:validForCatalog:](self, "_isRepresentationSize:validForCatalog:", v8, v23, v25))goto LABEL_12;
    v28 = 1;
    ((void (*)(void (**)(id, uint64_t *), uint64_t *, double, double))v9[2])(v9, &v28, v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
      break;
    if (v28
      && !-[MPAbstractNetworkArtworkDataSource shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable](self, "shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable"))
    {
      goto LABEL_13;
    }
LABEL_12:
    if (++v20 >= (unint64_t)objc_msgSend(v16, "count"))
      goto LABEL_13;
  }
  v15 = (void *)v26;
LABEL_14:

LABEL_16:
  return v15;
}

id __85__MPAbstractNetworkArtworkDataSource_existingRepresentationOfKind_forArtworkCatalog___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForCatalog:kind:size:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {

    v5 = 0;
    *a2 = 1;
  }

  return v5;
}

- (id)_requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPAbstractNetworkArtworkDataSource requestForCatalog:kind:size:](self, "requestForCatalog:kind:size:", v9, a4, width, height);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[MPAbstractNetworkArtworkDataSource requestForCatalog:size:](self, "requestForCatalog:size:", v9, width, height);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:
  if (_requestForCatalog_kind_size__onceToken != -1)
    dispatch_once(&_requestForCatalog_kind_size__onceToken, &__block_literal_global_198);
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", _requestForCatalog_kind_size__userAgent, *MEMORY[0x1E0DDBD50]);
  v13 = v12;

  return v13;
}

- (id)_cacheKeyForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v9;
  uint64_t v10;
  void *v11;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPAbstractNetworkArtworkDataSource cacheKeyForCatalog:kind:size:](self, "cacheKeyForCatalog:kind:size:", v9, a4, width, height);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    goto LABEL_7;
  }
  if (!a4)
  {
    -[MPAbstractNetworkArtworkDataSource cacheKeyForCatalog:size:](self, "cacheKeyForCatalog:size:", v9, width, height);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (CGSize)_bestAvailableSizeForCatalog:(id)a3 kind:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPAbstractNetworkArtworkDataSource bestAvailableSizeForCatalog:](self, "bestAvailableSizeForCatalog:", v6);
    v8 = v7;
    v10 = v9;
  }
  else if (a4)
  {
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[MPAbstractNetworkArtworkDataSource sortedSupportedSizesForCatalog:](self, "sortedSupportedSizesForCatalog:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[MPAbstractNetworkArtworkDataSource supportedSizesForCatalog:](self, "supportedSizesForCatalog:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_373);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "scaledFittingSize");
    v8 = MPArtworkRepresentationBestSizeMatchingSize(v11, v13, v14);
    v10 = v15;

  }
  v16 = v8;
  v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if (sel_isEqual(a3, sel_areRepresentationsOfKind_availableForCatalog_)
    || sel_isEqual(a3, sel_requestForCatalog_kind_size_)
    || sel_isEqual(a3, sel_cacheKeyForCatalog_kind_size_)
    || sel_isEqual(a3, sel_bestAvailableSizeForCatalog_))
  {
    return -[MPAbstractNetworkArtworkDataSource _subclassImplementsSelector:](self, "_subclassImplementsSelector:", a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)MPAbstractNetworkArtworkDataSource;
  return -[MPAbstractNetworkArtworkDataSource respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (BOOL)_subclassImplementsSelector:(SEL)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a3);
  if (v4)
    LOBYTE(v4) = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a3) != v4;
  return v4;
}

id __126__MPAbstractNetworkArtworkDataSource__existingRepresentationFromURLCacheForArtworkCatalog_immediateImageDecompressionAllowed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_requestForCatalog:kind:size:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageURLSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedResponseForRequest:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSURLSession)imageURLSession
{
  return self->_imageURLSession;
}

- (id)_existingRepresentationFromURLCacheForArtworkCatalog:(id)a3 immediateImageDecompressionAllowed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  CGSize v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  MPAbstractNetworkArtworkDataSource *v20;
  id v21;

  v4 = a4;
  v6 = a3;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __126__MPAbstractNetworkArtworkDataSource__existingRepresentationFromURLCacheForArtworkCatalog_immediateImageDecompressionAllowed___block_invoke;
  v19 = &unk_1E3157438;
  v20 = self;
  v21 = v6;
  v7 = v6;
  -[MPAbstractNetworkArtworkDataSource _existingRepresentativeObjectForArtworkCatalog:kind:handler:](self, "_existingRepresentativeObjectForArtworkCatalog:kind:handler:", v7, 0, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data", v16, v17, v18, v19, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("representationSize"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = CGSizeFromString(v12);
  -[MPAbstractNetworkArtworkDataSource _artworkRepresentationWithImageFromData:forURLResponse:catalog:size:immediateImageDecompressionAllowed:](self, "_artworkRepresentationWithImageFromData:forURLResponse:catalog:size:immediateImageDecompressionAllowed:", v9, v10, v7, v4, v13.width, v13.height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_artworkRepresentationWithImageFromData:(id)a3 forURLResponse:(id)a4 catalog:(id)a5 size:(CGSize)a6 immediateImageDecompressionAllowed:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  double v20;
  double v21;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  v12 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visualIdenticalityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v14, v13, width, height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && -[MPAbstractNetworkArtworkDataSource wantsBackgroundImageDecompression](self, "wantsBackgroundImageDecompression"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __141__MPAbstractNetworkArtworkDataSource__artworkRepresentationWithImageFromData_forURLResponse_catalog_size_immediateImageDecompressionAllowed___block_invoke;
      v17[3] = &unk_1E3157410;
      v17[4] = self;
      v18 = v12;
      v20 = width;
      v21 = height;
      v19 = v15;
      objc_msgSend(v13, "prepareForDisplayWithCompletionHandler:", v17);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_performAsyncBarrierBlockOnQueue:(id)a3 block:(id)a4
{
  dispatch_barrier_async((dispatch_queue_t)a3, a4);
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  -[MPAbstractNetworkArtworkDataSource _bestAvailableSizeForCatalog:kind:](self, "_bestAvailableSizeForCatalog:kind:", v7, objc_msgSend(v6, "kind"));
  v9 = v8;
  v11 = v10;

  if (!v6 && (v9 == *MEMORY[0x1E0C9D820] ? (v12 = v11 == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v12 = 0), v12))
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v6, "representationSize");
    v15 = v14 == v11 && v13 == v9;
  }

  return v15;
}

- (NSCache)fallbackImageArtworkRepresentationCache
{
  NSCache *v3;

  if (-[MPAbstractNetworkArtworkDataSource usesFallbackCache](self, "usesFallbackCache"))
    v3 = self->_fallbackImageArtworkRepresentationCache;
  else
    v3 = 0;
  return v3;
}

- (BOOL)usesFallbackCache
{
  return self->_usesFallbackCache;
}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  _MPAbstractNetworkArtworkLoadingContext *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _MPAbstractNetworkArtworkLoadingContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, void *, void *);
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  _MPAbstractNetworkArtworkLoadingContext *v31;
  id v32;
  id v33;
  __int128 v34;
  char v35;
  id location;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setLoadingKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (_MPAbstractNetworkArtworkLoadingContext *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v4;
      v39 = 2114;
      v40 = v5;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Found cached loading context for key: %{public}@", buf, 0x16u);

    }
    -[_MPAbstractNetworkArtworkLoadingContext catalogIdentifierToCompletionHandlerMap](v2, "catalogIdentifierToCompletionHandlerMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x19403A810](*(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
  else
  {
    v9 = objc_alloc_init(_MPAbstractNetworkArtworkLoadingContext);
    -[_MPAbstractNetworkArtworkLoadingContext catalogIdentifierToCompletionHandlerMap](v9, "catalogIdentifierToCompletionHandlerMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x19403A810](*(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v12);

    objc_msgSend(*(id *)(a1 + 48), "imageURLSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setRepresentationSize:forRequest:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v38 = v16;
      v39 = 2114;
      v40 = v17;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating data task for request: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "imageURLSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_156;
    v27 = &unk_1E3157398;
    v19 = *(_QWORD *)(a1 + 56);
    v28 = *(_QWORD *)(a1 + 48);
    v29 = *(id *)(a1 + 32);
    v34 = *(_OWORD *)(a1 + 80);
    v35 = *(_BYTE *)(a1 + 96);
    objc_copyWeak(&v33, &location);
    v30 = *(id *)(a1 + 64);
    v2 = v9;
    v31 = v2;
    v32 = *(id *)(a1 + 40);
    objc_msgSend(v18, "msv_dataTaskWithRequest:completionHandler:", v19, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPAbstractNetworkArtworkLoadingContext setDataTask:](v2, "setDataTask:", v20, v24, v25, v26, v27, v28);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
    v21 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 48);
      v23 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v38 = v22;
      v39 = 2114;
      v40 = v23;
      _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Created data task for request: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v20, "resume");
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }

}

- (void)setVideoArtworkCacheURL:(id)a3
{
  NSURL *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  id v22;
  char v23;
  uint8_t buf[4];
  MPAbstractNetworkArtworkDataSource *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (NSURL *)a3;
  if (self->_videoArtworkCacheURL != v5)
  {
    objc_storeStrong((id *)&self->_videoArtworkCacheURL, a3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      -[NSURL path](v5, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v23);

      if ((v8 & 1) != 0)
      {
        if (!v23)
        {
          v9 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            -[NSURL absoluteString](self->_videoArtworkCacheURL, "absoluteString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = self;
            v26 = 2114;
            v27 = v10;
            _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "MPAbstractNetworkArtworkDataSource: %p setVideoArtworkCacheURL: Can't use videoArtworkCacheURL as cache directory [Non-directory file already exists at path] videoArtworkCacheURL=%{public}@", buf, 0x16u);

          }
          goto LABEL_15;
        }
      }
      else
      {
        v22 = 0;
        objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v22);
        v11 = v22;
        if (v11)
        {
          v12 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            -[MPAbstractNetworkArtworkDataSource videoArtworkCacheURL](self, "videoArtworkCacheURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "absoluteString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = self;
            v26 = 2114;
            v27 = v14;
            _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "MPAbstractNetworkArtworkDataSource: %p setVideoArtworkCacheURL: error creating directory at URL %{public}@", buf, 0x16u);

          }
        }

      }
    }
    -[MPAbstractNetworkArtworkDataSource videoURLSession](self, "videoURLSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v16, "copy");

    objc_msgSend((id)objc_opt_class(), "_applyVideoCacheURL:toConfiguration:", v5, v6);
    objc_msgSend(v6, "URLCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAbstractNetworkArtworkDataSource setVideoURLCache:](self, "setVideoURLCache:", v17);

    -[MPAbstractNetworkArtworkDataSource videoURLSession](self, "videoURLSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "finishTasksAndInvalidate");

    v19 = (void *)MEMORY[0x1E0CB39F0];
    WeakRetained = objc_loadWeakRetained((id *)&self->_URLSessionDataDelegateProxy);
    objc_msgSend(v19, "sessionWithConfiguration:delegate:delegateQueue:", v6, WeakRetained, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAbstractNetworkArtworkDataSource setVideoURLSession:](self, "setVideoURLSession:", v21);

LABEL_15:
  }

}

- (void)setVideoURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_videoURLSession, a3);
}

- (void)setVideoURLCache:(id)a3
{
  objc_storeWeak((id *)&self->_videoURLCache, a3);
}

- (MPAbstractNetworkArtworkDataSource)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)MPAbstractNetworkArtworkDataSource;
  v2 = -[MPAbstractNetworkArtworkDataSource init](&v32, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaplayer.MPAbstractNetworkArtworkDataSource.imageAccessQueue", MEMORY[0x1E0C80D50]);
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 4), (const void *)_MPAbstractNetworkArtworkDataSourceQueueSpecificIsAccessQueue, (void *)_MPAbstractNetworkArtworkDataSourceQueueSpecificIsAccessQueue, 0);
    v5 = dispatch_queue_create("com.apple.mediaplayer.MPAbstractNetworkArtworkDataSource.videoAccessQueue", 0);
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    v7 = dispatch_queue_create("com.apple.mediaplayer.MPAbstractNetworkArtworkDataSource.callbackQueue", 0);
    v8 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v9;

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v17;

    if ((objc_msgSend(v2, "_subclassImplementsSelector:", sel_cacheKeyForCatalog_kind_size_) & 1) != 0
      || objc_msgSend(v2, "_subclassImplementsSelector:", sel_cacheKeyForCatalog_size_))
    {
      *((_BYTE *)v2 + 8) = 1;
      v19 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      v20 = (void *)*((_QWORD *)v2 + 7);
      *((_QWORD *)v2 + 7) = v19;

    }
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHTTPShouldUsePipelining:", 1);
    objc_msgSend((id)objc_opt_class(), "_applyImageURLCachePolicy:cacheDiskPath:toConfiguration:", 0, 0, v21);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v22;

    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHTTPShouldUsePipelining:", 1);
    objc_msgSend((id)objc_opt_class(), "_applyVideoCacheURL:toConfiguration:", 0, v24);
    objc_msgSend(v24, "URLCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v2 + 15, v25);

    objc_msgSend(MEMORY[0x1E0D4D120], "proxyWithObject:protocol:", v2, &unk_1EE312B50);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v2 + 16, v26);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v24, v26, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v27;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v2, sel__didReceiveMemoryWarningNotification_, *MEMORY[0x1E0DC4778], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v2, sel__didReceiveWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);

  }
  return (MPAbstractNetworkArtworkDataSource *)v2;
}

+ (void)_applyVideoCacheURL:(id)a3 toConfiguration:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CB3990];
  v6 = a4;
  v7 = [v5 alloc];
  if (v10)
    v8 = (void *)objc_msgSend(v7, "initWithMemoryCapacity:diskCapacity:directoryURL:", 83886080, 104857600, v10);
  else
    v8 = (void *)objc_msgSend(v7, "initWithMemoryCapacity:diskCapacity:diskPath:", 83886080, 104857600, 0);
  v9 = v8;
  objc_msgSend(v8, "set_maxCacheableEntrySizeRatio:", 1.0);
  objc_msgSend(v6, "setURLCache:", v9);

}

+ (void)_applyImageURLCachePolicy:(unint64_t)a3 cacheDiskPath:(id)a4 toConfiguration:(id)a5
{
  id v7;
  _MPArtworkDataSourceURLCache *v8;
  _MPArtworkDataSourceURLCache *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  objc_msgSend(v7, "setRequestCachePolicy:", a3);
  if (v10)
    v8 = -[_MPArtworkDataSourceURLCache initWithMemoryCapacity:diskCapacity:diskPath:]([_MPArtworkDataSourceURLCache alloc], "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 0, v10);
  else
    v8 = objc_alloc_init(_MPArtworkDataSourceURLCache);
  v9 = v8;
  -[NSURLCache setMemoryCapacity:](v8, "setMemoryCapacity:", 0);
  -[NSURLCache setDiskCapacity:](v9, "setDiskCapacity:", 419430400);
  objc_msgSend(v7, "setURLCache:", v9);

}

void __141__MPAbstractNetworkArtworkDataSource__artworkRepresentationWithImageFromData_forURLResponse_catalog_size_immediateImageDecompressionAllowed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(double *)(a1 + 56);
    v6 = *(double *)(a1 + 64);
    v7 = a2;
    objc_msgSend(v3, "_cacheKeyForCatalog:kind:size:", v4, 0, v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "representationWithPreparedImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v10);

  }
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  ldiv_t v22;
  uint64_t v23;
  char *v24;
  const UInt8 *v25;
  unsigned __int8 *v26;
  char *v27;
  char *v28;
  uint64_t m;
  unsigned int v30;
  char *v31;
  id v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  unsigned __int8 *v39;
  char *v40;
  char *v41;
  uint64_t j;
  unsigned int v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t quot;
  lldiv_t v48;
  uint64_t v49;
  CFStringRef v50;
  unsigned __int8 *v51;
  char *v52;
  char *v53;
  uint64_t k;
  unsigned int v55;
  char *v56;
  char *v57;
  uint64_t v58;
  _BYTE *v59;
  unint64_t v60;
  unsigned __int8 *v61;
  char *v62;
  char *v63;
  uint64_t i;
  unsigned int v65;
  char *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  _OWORD v73[2];
  unint64_t v74;
  unint64_t v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[72];
  _OWORD v88[4];
  uint64_t v89;
  _QWORD v90[3];
  _QWORD v91[3];

  v91[0] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v8, 0, MPArtworkCatalogOriginalSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (a3 != 3)
    goto LABEL_52;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Radiosity"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D4CEF8];
  v18 = v16;
  v86 = 0u;
  v85 = 0u;
  v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  *((_QWORD *)&v73[0] + 1) = 0;
  v73[1] = vaddq_s64(vdupq_n_s64(v17), (int64x2_t)xmmword_193F0CAF0);
  v74 = v17;
  v75 = v17 + 0x61C8864E7A143579;
  v76 = 0u;
  v77 = 0u;
  v78 = 0;
  v19 = objc_retainAutorelease(v18);
  _MSV_XXH_XXH64_update_10930((char *)v73 + 8, (char *)objc_msgSend(v19, "UTF8String"), objc_msgSend(v19, "length"));
  memset(&v87[8], 0, 64);
  *(_QWORD *)v87 = 3001;
  *(_QWORD *)&v87[8] = _MSV_XXH_XXH64_digest((_QWORD *)v73 + 1);
  v88[0] = *(_OWORD *)v87;
  v88[1] = *(_OWORD *)&v87[16];
  v88[2] = *(_OWORD *)&v87[32];
  v88[3] = *(_OWORD *)&v87[48];
  v89 = *(_QWORD *)&v87[64];
  if (*(uint64_t *)v87 > 3999)
  {
    if (*(uint64_t *)v87 > 4255)
    {
      if (*(_QWORD *)v87 == 4256)
      {
        v61 = (unsigned __int8 *)v88 + 8;
        v62 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v63 = v62;
        for (i = 0; i != 64; i += 2)
        {
          v65 = *v61++;
          v66 = &v62[i];
          *v66 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v65 >> 4];
          v66[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v65 & 0xF];
        }
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        v33 = v63;
        v34 = 64;
      }
      else
      {
        if (*(_QWORD *)v87 != 4512)
          goto LABEL_53;
        v39 = (unsigned __int8 *)v88 + 8;
        v40 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v41 = v40;
        for (j = 0; j != 128; j += 2)
        {
          v43 = *v39++;
          v44 = &v40[j];
          *v44 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v43 >> 4];
          v44[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v43 & 0xF];
        }
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        v33 = v41;
        v34 = 128;
      }
    }
    else if (*(_QWORD *)v87 == 4000)
    {
      v51 = (unsigned __int8 *)v88 + 8;
      v52 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v53 = v52;
      for (k = 0; k != 32; k += 2)
      {
        v55 = *v51++;
        v56 = &v52[k];
        *v56 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v55 >> 4];
        v56[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v55 & 0xF];
      }
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v33 = v53;
      v34 = 32;
    }
    else
    {
      if (*(_QWORD *)v87 != 4001)
        goto LABEL_53;
      v26 = (unsigned __int8 *)v88 + 8;
      v27 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v28 = v27;
      for (m = 0; m != 40; m += 2)
      {
        v30 = *v26++;
        v31 = &v27[m];
        *v31 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v30 >> 4];
        v31[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v30 & 0xF];
      }
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v33 = v28;
      v34 = 40;
    }
LABEL_46:
    v50 = (CFStringRef)objc_msgSend(v32, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v33, v34, 4, 1);
    goto LABEL_47;
  }
  if (*(uint64_t *)v87 > 2999)
  {
    if (*(_QWORD *)v87 == 3000)
    {
      LODWORD(v90[0]) = bswap32(DWORD2(v88[0]));
      v57 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v58 = 0;
      v59 = v57 + 1;
      do
      {
        v60 = *((unsigned __int8 *)v90 + v58);
        *(v59 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v60 >> 4];
        *v59 = MSVFastHexStringFromBytes_hexCharacters_47995[v60 & 0xF];
        v59 += 2;
        ++v58;
      }
      while (v58 != 4);
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v33 = v57;
      v34 = 8;
    }
    else
    {
      if (*(_QWORD *)v87 != 3001)
        goto LABEL_53;
      v90[0] = bswap64(*((unint64_t *)&v88[0] + 1));
      v35 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v36 = 0;
      v37 = v35 + 1;
      do
      {
        v38 = *((unsigned __int8 *)v90 + v36);
        *(v37 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v38 >> 4];
        *v37 = MSVFastHexStringFromBytes_hexCharacters_47995[v38 & 0xF];
        v37 += 2;
        ++v36;
      }
      while (v36 != 8);
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v33 = v35;
      v34 = 16;
    }
    goto LABEL_46;
  }
  if (*(_QWORD *)v87 == 1000)
  {
    v45 = *((_QWORD *)&v88[0] + 1);
    v46 = (char *)v91 + 1;
    quot = *((_QWORD *)&v88[0] + 1);
    do
    {
      v48 = lldiv(quot, 10);
      quot = v48.quot;
      if (v48.rem >= 0)
        LOBYTE(v49) = v48.rem;
      else
        v49 = -v48.rem;
      *(v46 - 2) = v49 + 48;
      v25 = (const UInt8 *)(v46 - 2);
      --v46;
    }
    while (v48.quot);
    if (v45 < 0)
    {
      *(v46 - 2) = 45;
      v25 = (const UInt8 *)(v46 - 2);
    }
    v24 = (char *)((char *)v91 - (char *)v25);
    goto LABEL_36;
  }
  if (*(_QWORD *)v87 != 2000)
  {
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v67 = &stru_1E3163D10;
    goto LABEL_48;
  }
  v20 = DWORD2(v88[0]);
  v21 = v91;
  do
  {
    v22 = ldiv(v20, 10);
    v20 = v22.quot;
    if (v22.rem >= 0)
      LOBYTE(v23) = v22.rem;
    else
      v23 = -v22.rem;
    *((_BYTE *)v21 - 1) = v23 + 48;
    v21 = (_QWORD *)((char *)v21 - 1);
  }
  while (v22.quot);
  v24 = (char *)((char *)v91 - (char *)v21);
  v25 = (const UInt8 *)v21;
LABEL_36:
  v50 = CFStringCreateWithBytes(0, v25, (CFIndex)v24, 0x8000100u, 0);
LABEL_47:
  v67 = (__CFString *)v50;
LABEL_48:

  objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v67, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v69, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v69);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

LABEL_52:
  return v12;
}

void __94__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "videoTaskToCacheStoragePolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (v4 == objc_msgSend(*(id *)(a1 + 48), "storagePolicy"))
  {
    v5 = *(id *)(a1 + 48);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB34F0]);
    objc_msgSend(*(id *)(a1 + 48), "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "initWithResponse:data:userInfo:storagePolicy:", v7, v8, v9, v4);

    v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(*(id *)(a1 + 48), "storagePolicy");
      v12 = objc_msgSend(v5, "storagePolicy");
      v13 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218754;
      v22 = v11;
      v23 = 2048;
      v24 = v12;
      v25 = 2114;
      v26 = v13;
      v27 = 2114;
      v28 = v15;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_INFO, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:willCacheResponse:completionHandler: Updating storage policy from %lu to %lu for dataTask: %{public}@. URL=%{public}@.", (uint8_t *)&v21, 0x2Au);

    }
  }
  v16 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_msgSend(v5, "storagePolicy");
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "response");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 134218498;
    v22 = v17;
    v23 = 2114;
    v24 = v18;
    v25 = 2114;
    v26 = v20;
    _os_log_impl(&dword_193B9B000, v16, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:willCacheResponse:completionHandler: Decided on storage policy %lu for dataTask=%{public}@. responseURL=%{public}@", (uint8_t *)&v21, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MPAbstractNetworkArtworkDataSource videoAccessQueue](self, "videoAccessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    objc_msgSend(v7, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setValue:forHTTPHeaderField:", 0, CFSTR("Range"));
    objc_msgSend(v10, "setCachePolicy:", 2);
    -[MPAbstractNetworkArtworkDataSource videoURLSession](self, "videoURLSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v11, "dataTaskWithRequest:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPAbstractNetworkArtworkDataSource videoTaskToResourceLoadingRequest](self, "videoTaskToResourceLoadingRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v7, v13);

    -[MPAbstractNetworkArtworkDataSource resourceLoaderStoragePolicyMap](self, "resourceLoaderStoragePolicyMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPAbstractNetworkArtworkDataSource videoTaskToCacheStoragePolicy](self, "videoTaskToCacheStoragePolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v13);

    v18 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v13;
      v24 = 2048;
      v25 = v7;
      v26 = 2114;
      v27 = v20;
      _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -resourceLoader:shouldWaitForLoadingOfRequestedResource: starting data task: %{public}@. loadingRequest=%p URL=%{public}@", (uint8_t *)&v22, 0x20u);

    }
    objc_msgSend(v13, "resume");

  }
  return 1;
}

- (NSMutableDictionary)videoTaskToCacheStoragePolicy
{
  return self->_videoTaskToCacheStoragePolicy;
}

- (NSURLSession)videoURLSession
{
  return self->_videoURLSession;
}

- (NSMapTable)resourceLoaderStoragePolicyMap
{
  return self->_resourceLoaderStoragePolicyMap;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MPAbstractNetworkArtworkDataSource *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[MPAbstractNetworkArtworkDataSource videoAccessQueue](self, "videoAccessQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveData___block_invoke;
  v12[3] = &unk_1E3163698;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  -[MPAbstractNetworkArtworkDataSource _performSyncBlockOnQueue:block:](self, "_performSyncBlockOnQueue:block:", v9, v12);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MPAbstractNetworkArtworkDataSource videoAccessQueue](self, "videoAccessQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke;
  v16[3] = &unk_1E315C088;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[MPAbstractNetworkArtworkDataSource _performSyncBlockOnQueue:block:](self, "_performSyncBlockOnQueue:block:", v12, v16);

}

- (OS_dispatch_queue)videoAccessQueue
{
  return self->_videoAccessQueue;
}

- (void)_performSyncBlockOnQueue:(id)a3 block:(id)a4
{
  void (**v6)(id, OS_dispatch_queue *);
  NSObject *v7;
  void (**v8)(id, OS_dispatch_queue *);
  void *specific;
  OS_dispatch_queue *queue;

  queue = (OS_dispatch_queue *)a3;
  v6 = (void (**)(id, OS_dispatch_queue *))a4;
  v7 = queue;
  v8 = v6;
  if (self->_imageAccessQueue == queue
    && (specific = dispatch_get_specific((const void *)_MPAbstractNetworkArtworkDataSourceQueueSpecificIsAccessQueue),
        v7 = queue,
        specific))
  {
    if (v8)
      v8[2](v8, queue);
  }
  else
  {
    dispatch_sync(v7, v8);
  }

}

void __73__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_data_t concat;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "videoTaskToData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v2, "_createDispatchData");
    v6 = objc_msgSend(v4, "_createDispatchData");
    concat = dispatch_data_create_concat(v6, v5);

  }
  else
  {
    concat = (dispatch_data_t)*(id *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "videoTaskToData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", concat, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "videoTaskToResourceLoadingRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "dataRequest");
    v11 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject requestsAllDataToEndOfResource](v11, "requestsAllDataToEndOfResource") & 1) != 0
      || (v12 = -[NSObject length](concat, "length"),
          v13 = -[NSObject requestedOffset](v11, "requestedOffset"),
          v12 < -[NSObject requestedLength](v11, "requestedLength") + v13))
    {
      v14 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(a1 + 48);
        v28 = 134219266;
        v29 = v11;
        v30 = 2114;
        v31 = v15;
        v32 = 2048;
        v33 = -[NSObject currentOffset](v11, "currentOffset");
        v34 = 2048;
        v35 = -[NSObject requestedLength](v11, "requestedLength");
        v36 = 2048;
        v37 = -[NSObject requestedOffset](v11, "requestedOffset");
        v38 = 2048;
        v39 = -[NSObject length](concat, "length");
        _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: creating data task using accumulatedData.length. %p dataTask=%{public}@ currentOffset=%lld, requestedLength=%ld requestedOffset=%lld accumulatedData.length=%lu", (uint8_t *)&v28, 0x3Eu);
      }

      v16 = -[NSObject length](concat, "length");
    }
    else
    {
      v18 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_QWORD *)(a1 + 48);
        v28 = 134219266;
        v29 = v11;
        v30 = 2114;
        v31 = v19;
        v32 = 2048;
        v33 = -[NSObject currentOffset](v11, "currentOffset");
        v34 = 2048;
        v35 = -[NSObject requestedLength](v11, "requestedLength");
        v36 = 2048;
        v37 = -[NSObject requestedOffset](v11, "requestedOffset");
        v38 = 2048;
        v39 = -[NSObject requestedLength](v11, "requestedLength");
        _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: creating data task using dataRequest.requestedLength. %p dataTask=%{public}@ currentOffset=%lld, requestedLength=%ld requestedOffset=%lld dataRequest.requestedLength=%lu", (uint8_t *)&v28, 0x3Eu);
      }

      v16 = -[NSObject requestedLength](v11, "requestedLength");
    }
    v20 = v16;
    if (v16 >= -[NSObject currentOffset](v11, "currentOffset"))
    {
      v26 = -[NSObject bytes](objc_retainAutorelease(concat), "bytes");
      v27 = v26 + -[NSObject currentOffset](v11, "currentOffset");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27, v20 - -[NSObject currentOffset](v11, "currentOffset"));
      v21 = objc_claimAutoreleasedReturnValue();
      -[NSObject respondWithData:](v11, "respondWithData:", v21);
    }
    else
    {
      v21 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = *(NSObject **)(a1 + 48);
        v23 = -[NSObject currentOffset](v11, "currentOffset");
        v24 = -[NSObject requestedLength](v11, "requestedLength");
        v25 = -[NSObject requestedOffset](v11, "requestedOffset");
        v28 = 138544130;
        v29 = v22;
        v30 = 2048;
        v31 = v23;
        v32 = 2048;
        v33 = v24;
        v34 = 2048;
        v35 = v25;
        _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_INFO, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: not responding with data [currentOffset was greater than length] task=%{public}@ currentOffset=%lld, requestedLength=%ld requestedOffset=%lld", (uint8_t *)&v28, 0x2Au);
      }
    }

  }
  else
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v17 = *(NSObject **)(a1 + 48);
      v28 = 138543362;
      v29 = v17;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_FAULT, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: ignoring data [no loading request associated with data task] task=%{public}@", (uint8_t *)&v28, 0xCu);
    }
  }

}

- (NSMutableDictionary)videoTaskToData
{
  return self->_videoTaskToData;
}

void __75__MPAbstractNetworkArtworkDataSource_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      v4 = *(void **)(a1 + 40);
      v17 = 138543618;
      v18 = v3;
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "MPAbstractNetworkArtworkDataSource: -URLSession:task:didCompleteWithError: task finished with error: %{public}@ dataTask=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "videoTaskToResourceLoadingRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "finishLoadingWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "videoTaskToResourceLoadingRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 56);
        v17 = 134218498;
        v18 = v6;
        v19 = 2114;
        v20 = v11;
        v21 = 2114;
        v22 = v12;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:task:didCompleteWithError: finished loading request: %p. URL=%{public}@ dataTask=%{public}@", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(v6, "finishLoading");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v13 = *(void **)(a1 + 56);
        v17 = 138543362;
        v18 = v13;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_FAULT, "MPAbstractNetworkArtworkDataSource: -URLSession:task:didCompleteWithError: ignoring data [no loading request associated with data task] task=%{public}@", (uint8_t *)&v17, 0xCu);
      }

      v6 = 0;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "videoTaskToResourceLoadingRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "videoTaskToData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "videoTaskToCacheStoragePolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

}

- (NSMutableDictionary)videoTaskToResourceLoadingRequest
{
  return self->_videoTaskToResourceLoadingRequest;
}

- (void)_reEnableVideoCache
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[MPAbstractNetworkArtworkDataSource videoURLCache](self, "videoURLCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "memoryCapacity"))
  {
    objc_msgSend(v2, "setMemoryCapacity:", 83886080);
    v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "MPAbstractNetworkArtworkDataSource: _reEnableVideoCache: Increasing video URLCache memory capacity from 0 to default capacity.", v4, 2u);
    }

  }
}

- (NSURLCache)videoURLCache
{
  return (NSURLCache *)objc_loadWeakRetained((id *)&self->_videoURLCache);
}

void __95__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "countOfBytesExpectedToReceive");
  objc_msgSend(*(id *)(a1 + 40), "videoURLCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "diskCapacity");
  v5 = v4 - objc_msgSend(v3, "currentDiskUsage");
  v6 = objc_msgSend(v3, "memoryCapacity");
  v7 = v6 - objc_msgSend(v3, "currentMemoryUsage");
  objc_msgSend(*(id *)(a1 + 40), "videoTaskToCacheStoragePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_13;
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      if (objc_msgSend(v3, "memoryCapacity") < v2)
      {
        v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v15 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v15;
          v27 = 2114;
          v28 = v13;
          v29 = 2048;
          v30 = v2;
          v31 = 2048;
          v32 = objc_msgSend(v3, "memoryCapacity");
          v14 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: canceled "
                "data task [expectedEntrySize > memoryCapacity] dataTask=%{public}@ URL=%{public}@ expectedEntrySize=%lld"
                " memoryCapacity=%lu";
          goto LABEL_11;
        }
LABEL_12:

        goto LABEL_13;
      }
      if (v7 < (uint64_t)v2)
      {
        v17 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v18;
          v27 = 2114;
          v28 = v19;
          v29 = 2048;
          v30 = v2;
          v31 = 2048;
          v32 = v7;
          v20 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: expecting"
                " eviction in memory cache [expectedEntrySize > memoryCacheAvailableSize] dataTask=%{public}@ URL=%{publi"
                "c}@ expectedEntrySize=%lld memoryCacheAvailableSize=%lld";
LABEL_20:
          _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, 0x2Au);

        }
LABEL_21:

      }
    }
    else
    {
      if (v10)
      {
LABEL_13:
        v16 = 0;
        goto LABEL_23;
      }
      if (objc_msgSend(v3, "diskCapacity") < v2)
      {
        v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v12;
          v27 = 2114;
          v28 = v13;
          v29 = 2048;
          v30 = v2;
          v31 = 2048;
          v32 = objc_msgSend(v3, "diskCapacity");
          v14 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: canceled "
                "data task [expectedEntrySize > diskCapacity] dataTask=%{public}@ URL=%{public}@ expectedEntrySize=%lld diskCapacity=%lu";
LABEL_11:
          _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v25, 0x2Au);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
      if (v5 < (uint64_t)v2)
      {
        v17 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v21;
          v27 = 2114;
          v28 = v19;
          v29 = 2048;
          v30 = v2;
          v31 = 2048;
          v32 = v5;
          v20 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: expecting"
                " eviction in disk cache - cache will be purged [expectedEntrySize > diskCacheAvailableSize] dataTask=%{p"
                "ublic}@ URL=%{public}@ expectedEntrySize=%lld diskCacheAvailableSize=%lld";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
  }
  v16 = 1;
LABEL_23:
  v22 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 134219522;
    v26 = v16;
    v27 = 2114;
    v28 = v23;
    v29 = 2114;
    v30 = (unint64_t)v24;
    v31 = 2048;
    v32 = v10;
    v33 = 2048;
    v34 = v2;
    v35 = 2048;
    v36 = v5;
    v37 = 2048;
    v38 = v7;
    _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: Decided on disposition %ld for dataTask: %{public}@. URL=%{public}@.storagePolicy=%lu expectedEntrySize=%lld diskCacheAvailableSize=%lld memoryCacheAvailableSize=%lld", (uint8_t *)&v25, 0x48u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

id __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "_requestForCatalog:kind:size:", *(_QWORD *)(a1 + 40), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "allowsVideoConstrainedNetworkAccess"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C8AD40]);

    v11 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C8ADC0]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C8AD88]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E31E4A50, *MEMORY[0x1E0C8ADB8]);
    objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceLoader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "videoAccessQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:queue:", v14, v15);

    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "videoAccessQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke_205;
    v24[3] = &unk_1E3163698;
    v18 = *(id *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 32);
    v25 = v18;
    v26 = v19;
    v27 = v13;
    v20 = v13;
    objc_msgSend(v16, "_performSyncBlockOnQueue:block:", v17, v24);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "visualIdenticalityIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPArtworkRepresentation representationForVisualIdentity:withSize:video:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:video:", v21, v12, a2, a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __67__MPAbstractNetworkArtworkDataSource__requestForCatalog_kind_size___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC048]), "initWithBlock:", &__block_literal_global_201);
  objc_msgSend(v2, "userAgent");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_requestForCatalog_kind_size__userAgent;
  _requestForCatalog_kind_size__userAgent = v0;

}

- (BOOL)shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable
{
  return 1;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (id)_bestVideoArtworkRepresentationForCatalog:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke;
  v8[3] = &unk_1E31574A0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[MPAbstractNetworkArtworkDataSource _existingRepresentativeObjectForArtworkCatalog:kind:handler:](self, "_existingRepresentativeObjectForArtworkCatalog:kind:handler:", v5, 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MPAbstractNetworkArtworkDataSource *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    -[MPAbstractNetworkArtworkDataSource videoAccessQueue](self, "videoAccessQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__MPAbstractNetworkArtworkDataSource_URLSession_task_didCompleteWithError___block_invoke;
    v11[3] = &unk_1E315D848;
    v12 = v8;
    v13 = v9;
    v14 = self;
    v15 = v13;
    -[MPAbstractNetworkArtworkDataSource _performSyncBlockOnQueue:block:](self, "_performSyncBlockOnQueue:block:", v10, v11);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  MPAbstractNetworkArtworkDataSource *v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MPAbstractNetworkArtworkDataSource videoAccessQueue](self, "videoAccessQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v16[3] = &unk_1E315C088;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v20 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[MPAbstractNetworkArtworkDataSource _performSyncBlockOnQueue:block:](self, "_performSyncBlockOnQueue:block:", v12, v16);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4778], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4860], 0);

  v5.receiver = self;
  v5.super_class = (Class)MPAbstractNetworkArtworkDataSource;
  -[MPAbstractNetworkArtworkDataSource dealloc](&v5, sel_dealloc);
}

- (void)updateURLSessionWithCachePolicy:(unint64_t)a3 cachePath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSURLSession *v9;
  NSURLSession *imageURLSession;
  id v11;

  v6 = a4;
  -[MPAbstractNetworkArtworkDataSource imageURLSession](self, "imageURLSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "copy");

  objc_msgSend((id)objc_opt_class(), "_applyImageURLCachePolicy:cacheDiskPath:toConfiguration:", a3, v6, v11);
  -[NSURLSession finishTasksAndInvalidate](self->_imageURLSession, "finishTasksAndInvalidate");
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v11);
  v9 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  imageURLSession = self->_imageURLSession;
  self->_imageURLSession = v9;

}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[MPAbstractNetworkArtworkDataSource areRepresentationsOfKind:availableForCatalog:](self, "areRepresentationsOfKind:availableForCatalog:", 0, v5);
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
    if (v7 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAbstractNetworkArtworkDataSource.m"), 252, CFSTR("Subclass %@ must implement -%@ defined in %@."), v11, v12, CFSTR("[MPAbstractNetworkArtworkDataSource class]"));

    }
    v6 = 0;
  }

  return v6;
}

- (id)supportedSizesForCatalog:(id)a3
{
  uint64_t v5;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAbstractNetworkArtworkDataSource.m"), 258, CFSTR("Subclass %@ must implement -%@ defined in %@."), v9, v10, CFSTR("[MPAbstractNetworkArtworkDataSource class]"));

  }
  return 0;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPAbstractNetworkArtworkDataSource requestForCatalog:kind:size:](self, "requestForCatalog:kind:size:", v8, 0, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
    if (v10 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAbstractNetworkArtworkDataSource.m"), 267, CFSTR("Subclass %@ must implement -%@ defined in %@."), v14, v15, CFSTR("[MPAbstractNetworkArtworkDataSource class]"));

    }
    v9 = 0;
  }

  return v9;
}

- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MPAbstractNetworkArtworkDataSource cacheKeyForCatalog:kind:size:](self, "cacheKeyForCatalog:kind:size:", v7, 0, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sortedSupportedSizesForCatalog:(id)a3
{
  return 0;
}

- (BOOL)wantsBackgroundImageDecompression
{
  return 0;
}

- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4
{
  return 0;
}

- (id)requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  return 0;
}

- (CGSize)bestAvailableSizeForCatalog:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)cacheKeyForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  return 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return -[MPAbstractNetworkArtworkDataSource existingRepresentationOfKind:forArtworkCatalog:](self, "existingRepresentationOfKind:forArtworkCatalog:", 0, a3);
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  -[MPAbstractNetworkArtworkDataSource loadRepresentationOfKind:forArtworkCatalog:completionHandler:](self, "loadRepresentationOfKind:forArtworkCatalog:completionHandler:", 0, a3, a4);
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *imageAccessQueue;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadingKey:", 0);

  if (v6)
  {
    imageAccessQueue = self->_imageAccessQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__MPAbstractNetworkArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke;
    v8[3] = &unk_1E3163698;
    v8[4] = self;
    v9 = v5;
    v10 = v6;
    -[MPAbstractNetworkArtworkDataSource _performAsyncBarrierBlockOnQueue:block:](self, "_performAsyncBarrierBlockOnQueue:block:", imageAccessQueue, v8);

  }
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE2F4910);

  if (v6)
  {
    objc_msgSend(v4, "token");
    v7 = (_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier);
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v4, 0, *MEMORY[0x1E0C9D820], v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier setImageArtworkIdentifier:](v7, "setImageArtworkIdentifier:", v12);

    -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v4, 1, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier setVideoArtworkIdentifier:](v7, "setVideoArtworkIdentifier:", v15);

  }
  return v7;
}

- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7
{
  id v11;
  __int128 v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void (*v16)(_QWORD *, _QWORD *);
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t v22;

  v11 = a7;
  v12 = MPArtworkCatalogOriginalSize;
  v13 = a6;
  -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", a4, 0, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __129__MPAbstractNetworkArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke;
  v19[3] = &unk_1E3157320;
  v21 = v11;
  v22 = a3;
  v20 = v15;
  v16 = (void (*)(_QWORD *, _QWORD *))v13[2];
  v17 = v11;
  v18 = v15;
  v16(v13, v19);

}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MPAbstractNetworkArtworkDataSource videoAccessQueue](self, "videoAccessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__18398;
    v25 = __Block_byref_object_dispose__18399;
    v26 = 0;
    -[MPAbstractNetworkArtworkDataSource videoTaskToResourceLoadingRequest](self, "videoTaskToResourceLoadingRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __77__MPAbstractNetworkArtworkDataSource_resourceLoader_didCancelLoadingRequest___block_invoke;
    v18 = &unk_1E31573E8;
    v10 = v7;
    v19 = v10;
    v20 = &v21;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v15);

    v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v22[5];
      objc_msgSend(v10, "request", v15, v16, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v12;
      v29 = 2048;
      v30 = v10;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "MPAbstractNetworkArtworkDataSource: -resourceLoader:didCancelLoadingRequest: canceled data task: %{public}@. loadingRequest=%p URL=%{public}@", buf, 0x20u);

    }
    objc_msgSend((id)v22[5], "cancel");

    _Block_object_dispose(&v21, 8);
  }

}

- (void)_onImageAccessQueue_cancelLoadingContextForCatalogUUID:(id)a3 withLoadingURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  _QWORD block[4];
  NSObject *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  MPAbstractNetworkArtworkDataSource *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_imageAccessQueue);
  -[NSMutableDictionary objectForKey:](self->_loadingContexts, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "catalogIdentifierToCompletionHandlerMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "catalogIdentifierToCompletionHandlerMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v6);

      -[MPAbstractNetworkArtworkDataSource callbackQueue](self, "callbackQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__MPAbstractNetworkArtworkDataSource__onImageAccessQueue_cancelLoadingContextForCatalogUUID_withLoadingURL___block_invoke;
      block[3] = &unk_1E31637F8;
      v20 = v11;
      dispatch_async(v13, block);

    }
    objc_msgSend(v9, "catalogIdentifierToCompletionHandlerMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
    {
      objc_msgSend(v9, "dataTask");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cancel");

      -[NSMutableDictionary removeObjectForKey:](self->_loadingContexts, "removeObjectForKey:", v7);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "<%@: %p> _cancelLoadingContextForCatalogUUID:withLoadingURL: No loading context for url=%@", buf, 0x20u);

    }
  }

}

- (BOOL)_isRepresentationSize:(CGSize)a3 validForCatalog:(id)a4
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a4, "scaledFittingSize");
  return height <= v7 + v7 && width <= v6 + v6;
}

- (void)_disableVideoCache
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  -[MPAbstractNetworkArtworkDataSource videoURLCache](self, "videoURLCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_CFURLCache");
  _CFURLCachePurgeMemoryCache();
  objc_msgSend(v2, "setMemoryCapacity:", 0);
  v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "MPAbstractNetworkArtworkDataSource: _disableVideoCache: Reducing video URLCache memory capacity to 0.", v4, 2u);
  }

}

- (void)startListeningForMemoryPressureNotifications
{
  dispatch_source_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, MEMORY[0x1E0C80D38]);
  -[MPAbstractNetworkArtworkDataSource setMemoryPressureNotificationSource:](self, "setMemoryPressureNotificationSource:", v3);

  -[MPAbstractNetworkArtworkDataSource memoryPressureNotificationSource](self, "memoryPressureNotificationSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    -[MPAbstractNetworkArtworkDataSource memoryPressureNotificationSource](self, "memoryPressureNotificationSource");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __82__MPAbstractNetworkArtworkDataSource_startListeningForMemoryPressureNotifications__block_invoke;
    v10 = &unk_1E315E5D0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v5, &v7);

    -[MPAbstractNetworkArtworkDataSource memoryPressureNotificationSource](self, "memoryPressureNotificationSource", v7, v8, v9, v10);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v6);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)stopListeningForMemoryPressureNotifications
{
  void *v3;
  NSObject *v4;

  -[MPAbstractNetworkArtworkDataSource memoryPressureNotificationSource](self, "memoryPressureNotificationSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MPAbstractNetworkArtworkDataSource memoryPressureNotificationSource](self, "memoryPressureNotificationSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[MPAbstractNetworkArtworkDataSource setMemoryPressureNotificationSource:](self, "setMemoryPressureNotificationSource:", 0);
  }
}

- (NSURLSessionConfiguration)URLSessionConfiguration
{
  return self->_URLSessionConfiguration;
}

- (void)setUsesFallbackCache:(BOOL)a3
{
  self->_usesFallbackCache = a3;
}

- (NSURL)videoArtworkCacheURL
{
  return self->_videoArtworkCacheURL;
}

- (OS_dispatch_queue)imageAccessQueue
{
  return self->_imageAccessQueue;
}

- (void)setImageAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageAccessQueue, a3);
}

- (void)setVideoAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_videoAccessQueue, a3);
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setFallbackImageArtworkRepresentationCache:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackImageArtworkRepresentationCache, a3);
}

- (NSMutableDictionary)loadingContexts
{
  return self->_loadingContexts;
}

- (void)setLoadingContexts:(id)a3
{
  objc_storeStrong((id *)&self->_loadingContexts, a3);
}

- (void)setResourceLoaderStoragePolicyMap:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoaderStoragePolicyMap, a3);
}

- (void)setVideoTaskToCacheStoragePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_videoTaskToCacheStoragePolicy, a3);
}

- (void)setVideoTaskToResourceLoadingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_videoTaskToResourceLoadingRequest, a3);
}

- (void)setVideoTaskToData:(id)a3
{
  objc_storeStrong((id *)&self->_videoTaskToData, a3);
}

- (void)setImageURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLSession, a3);
}

- (NSURLSessionDataDelegate)URLSessionDataDelegateProxy
{
  return (NSURLSessionDataDelegate *)objc_loadWeakRetained((id *)&self->_URLSessionDataDelegateProxy);
}

- (void)setURLSessionDataDelegateProxy:(id)a3
{
  objc_storeWeak((id *)&self->_URLSessionDataDelegateProxy, a3);
}

- (OS_dispatch_source)memoryPressureNotificationSource
{
  return self->_memoryPressureNotificationSource;
}

- (void)setMemoryPressureNotificationSource:(id)a3
{
  objc_storeStrong((id *)&self->_memoryPressureNotificationSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureNotificationSource, 0);
  objc_destroyWeak((id *)&self->_URLSessionDataDelegateProxy);
  objc_destroyWeak((id *)&self->_videoURLCache);
  objc_storeStrong((id *)&self->_videoURLSession, 0);
  objc_storeStrong((id *)&self->_imageURLSession, 0);
  objc_storeStrong((id *)&self->_videoTaskToData, 0);
  objc_storeStrong((id *)&self->_videoTaskToResourceLoadingRequest, 0);
  objc_storeStrong((id *)&self->_videoTaskToCacheStoragePolicy, 0);
  objc_storeStrong((id *)&self->_resourceLoaderStoragePolicyMap, 0);
  objc_storeStrong((id *)&self->_loadingContexts, 0);
  objc_storeStrong((id *)&self->_fallbackImageArtworkRepresentationCache, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_videoAccessQueue, 0);
  objc_storeStrong((id *)&self->_imageAccessQueue, 0);
  objc_storeStrong((id *)&self->_videoArtworkCacheURL, 0);
  objc_storeStrong((id *)&self->_URLSessionConfiguration, 0);
}

void __82__MPAbstractNetworkArtworkDataSource_startListeningForMemoryPressureNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uintptr_t data;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "memoryPressureNotificationSource");
    v2 = objc_claimAutoreleasedReturnValue();
    data = dispatch_source_get_data(v2);

    WeakRetained = v5;
    if (data != currentMemoryPressureLevel)
    {
      v4 = (void *)MEMORY[0x19403A624](v5);
      if (data == 4 || data == 2)
      {
        objc_msgSend(v5, "_disableVideoCache");
      }
      else if (data == 1 && (currentMemoryPressureLevel == 4 || currentMemoryPressureLevel == 2))
      {
        objc_msgSend(v5, "_reEnableVideoCache");
      }
      currentMemoryPressureLevel = data;
      objc_autoreleasePoolPop(v4);
      WeakRetained = v5;
    }
  }

}

void __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke_205(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "videoCacheStoragePolicy"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resourceLoaderStoragePolicyMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

}

void __108__MPAbstractNetworkArtworkDataSource__onImageAccessQueue_cancelLoadingContextForCatalogUUID_withLoadingURL___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPAbstractNetworkArtworkDataSourceErrorDomain"), 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __77__MPAbstractNetworkArtworkDataSource_resourceLoader_didCancelLoadingRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_156(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  objc_class *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id WeakRetained;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  const __CFString *v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  void *v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_artworkRepresentationWithImageFromData:forURLResponse:catalog:size:immediateImageDecompressionAllowed:", v10, v11, *(_QWORD *)(a1 + 40), 1, *(double *)(a1 + 80), *(double *)(a1 + 88));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v63 = v15;
    v64 = 2114;
    v65 = v13;
    v66 = 2114;
    v67 = v9;
    _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded image representation: %{public}@ with URLSessionDataTask: %{public}@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v11)
    {
      v48 = v10;
      v49 = v9;
      v17 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v63 = v18;
        v64 = 2114;
        v65 = v11;
        _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_ERROR, "%{public}@ encountered unexpected NSURLResponse: %{public}@", buf, 0x16u);
      }

      v19 = (void *)MEMORY[0x1E0D4D030];
      v20 = *MEMORY[0x1E0D4CE38];
      v59[0] = CFSTR("response");
      objc_msgSend(v11, "description");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (const __CFString *)v21;
      else
        v23 = CFSTR("nil");
      v59[1] = CFSTR("responseClass");
      v60[0] = v23;
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = (const __CFString *)v25;
      else
        v27 = CFSTR("nil");
      v60[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v20, CFSTR("Bug"), CFSTR("MPAbstractNetworkArtworkDataSource"), CFSTR("UnexpectedURLResponse"), &stru_1E3163D10, v29, 0);

      v16 = 0;
      v10 = v48;
      v9 = v49;
    }
    else
    {
      v16 = 0;
    }
LABEL_17:
    if (objc_msgSend(v10, "length"))
      goto LABEL_27;
    goto LABEL_18;
  }
  v16 = objc_msgSend(v11, "statusCode");
  if (v16 <= 399)
    goto LABEL_17;
LABEL_18:
  if (!v12)
  {
    v30 = v10;
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB32E8];
    v57 = CFSTR("response");
    v33 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v58 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, v16, v34);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    v10 = v30;
  }
  v35 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v63 = v36;
    v64 = 2114;
    v65 = v9;
    v66 = 2114;
    v67 = v12;
    _os_log_impl(&dword_193B9B000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error while requesting artwork for NSURLSessionDataTask: %{public}@. %{public}@", buf, 0x20u);
  }

LABEL_27:
  if (*(_BYTE *)(a1 + 96))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForCatalog:kind:size:", WeakRetained, objc_msgSend(v13, "kind"), *(double *)(a1 + 80), *(double *)(a1 + 88));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = v10;
      v40 = *(void **)(a1 + 48);
      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v13, v38);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v41, v38);

      }
      v10 = v39;
    }

  }
  v42 = *(_QWORD **)(a1 + 32);
  v43 = v42[4];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_175;
  v50[3] = &unk_1E3157370;
  v44 = *(id *)(a1 + 56);
  v45 = *(_QWORD *)(a1 + 32);
  v51 = v44;
  v52 = v45;
  v53 = *(id *)(a1 + 64);
  v54 = *(id *)(a1 + 40);
  v55 = v13;
  v56 = v12;
  v46 = v12;
  v47 = v13;
  objc_msgSend(v42, "_performAsyncBarrierBlockOnQueue:block:", v43, v50);

}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_175(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "catalogIdentifierToCompletionHandlerMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 56), "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Completion handler for catalog id %{public}@ found in map", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "catalogIdentifierToCompletionHandlerMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "catalogIdentifierToCompletionHandlerMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_176;
    v15[3] = &unk_1E315D848;
    v13 = *(_QWORD *)(a1 + 40);
    v16 = v10;
    v17 = v13;
    v18 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 72);
    v14 = v10;
    dispatch_async(v12, v15);

  }
}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_176(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v8 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 40);
          v10 = *(_QWORD *)(a1 + 48);
          v11 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          v17 = v9;
          v18 = 2114;
          v19 = v10;
          v20 = 2114;
          v21 = v11;
          _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Calling completion with loaded representation: %{public}@ and error: %{public}@", buf, 0x20u);
        }

        (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
    }
    while (v4);
  }

}

void __129__MPAbstractNetworkArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  UIImage *v7;
  UIImage *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  ldiv_t v16;
  uint64_t v17;
  char *v18;
  const UInt8 *v19;
  unsigned __int8 *v20;
  char *v21;
  char *v22;
  uint64_t m;
  unsigned int v24;
  char *v25;
  id v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _BYTE *v31;
  unint64_t v32;
  unsigned __int8 *v33;
  char *v34;
  char *v35;
  uint64_t j;
  unsigned int v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t quot;
  lldiv_t v42;
  uint64_t v43;
  CFStringRef v44;
  unsigned __int8 *v45;
  char *v46;
  char *v47;
  uint64_t k;
  unsigned int v49;
  char *v50;
  char *v51;
  uint64_t v52;
  _BYTE *v53;
  unint64_t v54;
  unsigned __int8 *v55;
  char *v56;
  char *v57;
  uint64_t i;
  unsigned int v59;
  char *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  UIImage *v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _OWORD v87[2];
  unint64_t v88;
  unint64_t v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint64_t v102;
  _BYTE v103[72];
  _OWORD v104[4];
  uint64_t v105;
  _QWORD v106[3];
  _QWORD v107[3];

  v107[0] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 48) == 3)
  {
    v7 = (UIImage *)v5;
    v8 = v7;
    if (!v7)
    {
LABEL_61:

      goto LABEL_62;
    }
    v81 = v7;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "URLByAppendingPathComponent:isDirectory:", CFSTR("Radiosity"), 1);
    v82 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D4CEF8];
    v100 = 0u;
    v99 = 0u;
    v98 = 0u;
    v97 = 0u;
    v96 = 0u;
    v95 = 0u;
    v94 = 0u;
    v93 = 0u;
    v87[0] = xmmword_193F0CAE0;
    v87[1] = vaddq_s64(vdupq_n_s64(v11), (int64x2_t)xmmword_193F0CAF0);
    v88 = v11;
    v89 = v11 + 0x61C8864E7A143579;
    v90 = 0u;
    v91 = 0u;
    v92 = 0;
    v12 = objc_retainAutorelease(v10);
    _MSV_XXH_XXH64_update_10930((char *)v87 + 8, (char *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v12, "length"));
    memset(&v103[8], 0, 64);
    *(_QWORD *)v103 = 3001;
    *(_QWORD *)&v103[8] = _MSV_XXH_XXH64_digest((_QWORD *)v87 + 1);
    v104[0] = *(_OWORD *)v103;
    v104[1] = *(_OWORD *)&v103[16];
    v104[2] = *(_OWORD *)&v103[32];
    v104[3] = *(_OWORD *)&v103[48];
    v105 = *(_QWORD *)&v103[64];
    v80 = a1;
    if (*(uint64_t *)v103 > 3999)
    {
      v8 = v81;
      v13 = (void *)v82;
      if (*(uint64_t *)v103 > 4255)
      {
        if (*(_QWORD *)v103 == 4256)
        {
          v55 = (unsigned __int8 *)v104 + 8;
          v56 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          v57 = v56;
          for (i = 0; i != 64; i += 2)
          {
            v59 = *v55++;
            v60 = &v56[i];
            *v60 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v59 >> 4];
            v60[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v59 & 0xF];
          }
          v26 = objc_alloc(MEMORY[0x1E0CB3940]);
          v27 = v57;
          v28 = 64;
        }
        else
        {
          if (*(_QWORD *)v103 != 4512)
            goto LABEL_65;
          v33 = (unsigned __int8 *)v104 + 8;
          v34 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          v35 = v34;
          for (j = 0; j != 128; j += 2)
          {
            v37 = *v33++;
            v38 = &v34[j];
            *v38 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v37 >> 4];
            v38[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v37 & 0xF];
          }
          v26 = objc_alloc(MEMORY[0x1E0CB3940]);
          v27 = v35;
          v28 = 128;
        }
      }
      else if (*(_QWORD *)v103 == 4000)
      {
        v45 = (unsigned __int8 *)v104 + 8;
        v46 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        v47 = v46;
        for (k = 0; k != 32; k += 2)
        {
          v49 = *v45++;
          v50 = &v46[k];
          *v50 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v49 >> 4];
          v50[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v49 & 0xF];
        }
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v27 = v47;
        v28 = 32;
      }
      else
      {
        if (*(_QWORD *)v103 != 4001)
          goto LABEL_65;
        v20 = (unsigned __int8 *)v104 + 8;
        v21 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        v22 = v21;
        for (m = 0; m != 40; m += 2)
        {
          v24 = *v20++;
          v25 = &v21[m];
          *v25 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v24 >> 4];
          v25[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v24 & 0xF];
        }
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v27 = v22;
        v28 = 40;
      }
    }
    else
    {
      v8 = v81;
      v13 = (void *)v82;
      if (*(uint64_t *)v103 <= 2999)
      {
        if (*(_QWORD *)v103 == 1000)
        {
          v39 = *((_QWORD *)&v104[0] + 1);
          v40 = (char *)v107 + 1;
          quot = *((_QWORD *)&v104[0] + 1);
          do
          {
            v42 = lldiv(quot, 10);
            quot = v42.quot;
            if (v42.rem >= 0)
              LOBYTE(v43) = v42.rem;
            else
              v43 = -v42.rem;
            *(v40 - 2) = v43 + 48;
            v19 = (const UInt8 *)(v40 - 2);
            --v40;
          }
          while (v42.quot);
          if (v39 < 0)
          {
            *(v40 - 2) = 45;
            v19 = (const UInt8 *)(v40 - 2);
          }
          v18 = (char *)((char *)v107 - (char *)v19);
          goto LABEL_37;
        }
        if (*(_QWORD *)v103 == 2000)
        {
          v14 = DWORD2(v104[0]);
          v15 = v107;
          do
          {
            v16 = ldiv(v14, 10);
            v14 = v16.quot;
            if (v16.rem >= 0)
              LOBYTE(v17) = v16.rem;
            else
              v17 = -v16.rem;
            *((_BYTE *)v15 - 1) = v17 + 48;
            v15 = (_QWORD *)((char *)v15 - 1);
          }
          while (v16.quot);
          v18 = (char *)((char *)v107 - (char *)v15);
          v19 = (const UInt8 *)v15;
LABEL_37:
          v44 = CFStringCreateWithBytes(0, v19, (CFIndex)v18, 0x8000100u, 0);
LABEL_48:
          v61 = (__CFString *)v44;
LABEL_49:

          objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v61, 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "path");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v9, "fileExistsAtPath:", v63);

          if ((v64 & 1) == 0)
          {
            v78 = v6;
            objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);
            UIImagePNGRepresentation(v8);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "writeToURL:atomically:", v62, 1);
            v102 = *MEMORY[0x1E0C998E8];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v13, v66, 1, 0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v67, "count") >= 0x33)
            {
              v77 = v5;
              objc_msgSend(v67, "sortedArrayUsingComparator:", &__block_literal_global_18485);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "subarrayWithRange:", 0, objc_msgSend(v68, "count") - 50);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = 0u;
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
              if (v70)
              {
                v71 = v70;
                v72 = *(_QWORD *)v84;
                do
                {
                  for (n = 0; n != v71; ++n)
                  {
                    if (*(_QWORD *)v84 != v72)
                      objc_enumerationMutation(v69);
                    objc_msgSend(v9, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * n), 0);
                  }
                  v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v83, v101, 16);
                }
                while (v71);
              }

              v5 = v77;
              v8 = v81;
            }

            v6 = v78;
            v13 = (void *)v82;
          }

          a1 = v80;
          goto LABEL_61;
        }
LABEL_65:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

        v61 = &stru_1E3163D10;
        goto LABEL_49;
      }
      if (*(_QWORD *)v103 == 3000)
      {
        LODWORD(v106[0]) = bswap32(DWORD2(v104[0]));
        v51 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        v52 = 0;
        v53 = v51 + 1;
        do
        {
          v54 = *((unsigned __int8 *)v106 + v52);
          *(v53 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v54 >> 4];
          *v53 = MSVFastHexStringFromBytes_hexCharacters_47995[v54 & 0xF];
          v53 += 2;
          ++v52;
        }
        while (v52 != 4);
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v27 = v51;
        v28 = 8;
      }
      else
      {
        if (*(_QWORD *)v103 != 3001)
          goto LABEL_65;
        v106[0] = bswap64(*((unint64_t *)&v104[0] + 1));
        v29 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        v30 = 0;
        v31 = v29 + 1;
        do
        {
          v32 = *((unsigned __int8 *)v106 + v30);
          *(v31 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v32 >> 4];
          *v31 = MSVFastHexStringFromBytes_hexCharacters_47995[v32 & 0xF];
          v31 += 2;
          ++v30;
        }
        while (v30 != 8);
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v27 = v29;
        v28 = 16;
      }
    }
    v44 = (CFStringRef)objc_msgSend(v26, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v27, v28, 4, 1);
    goto LABEL_48;
  }
LABEL_62:
  v74 = *(_QWORD *)(a1 + 40);
  if (v74)
    (*(void (**)(uint64_t, id, id))(v74 + 16))(v74, v5, v6);

}

uint64_t __129__MPAbstractNetworkArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x1E0C998E8];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v6, "compare:", v9);
  return v7;
}

uint64_t __83__MPAbstractNetworkArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onImageAccessQueue_cancelLoadingContextForCatalogUUID:withLoadingURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
