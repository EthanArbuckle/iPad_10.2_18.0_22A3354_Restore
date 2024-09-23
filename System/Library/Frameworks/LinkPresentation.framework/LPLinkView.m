@implementation LPLinkView

- (LPLinkView)init
{
  LPLinkMetadata *v3;
  LPLinkView *v4;

  v3 = objc_alloc_init(LPLinkMetadata);
  v4 = -[LPLinkView initWithMetadata:](self, "initWithMetadata:", v3);

  return v4;
}

- (LPLinkView)initWithFrame:(CGRect)a3
{
  LPLinkView *v3;
  LPLinkView *v4;
  LPLinkView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPLinkView;
  v3 = -[LPLinkView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[LPLinkView _commonInitWithURL:](v3, "_commonInitWithURL:", 0);
    v4->_usesComputedPresentationProperties = 1;
    v4->_metadataIsComplete = 1;
    v5 = v4;
  }

  return v4;
}

- (LPLinkView)initWithCoder:(NSCoder *)coder
{

  return 0;
}

- (LPLinkView)initWithMetadataLoadedFromURL:(id)a3
{
  id v4;
  void *v5;
  LPLinkView *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:", v4);
  v6 = -[LPLinkView initWithMetadataLoadedFromRequest:](self, "initWithMetadataLoadedFromRequest:", v5);

  return v6;
}

- (LPLinkView)initWithMetadataLoadedFromRequest:(id)a3
{
  id v4;
  void *v5;
  LPLinkView *v6;
  LPLinkView *v7;
  LPLinkView *v8;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPLinkView _initWithNullableURL:](self, "_initWithNullableURL:", v5);
  v7 = v6;
  if (v6)
  {
    -[LPLinkView _fetchMetadataForRequest:](v6, "_fetchMetadataForRequest:", v4);
    v8 = v7;
  }

  return v7;
}

- (id)_initWithMetadataLoadedFromURLs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = -[LPLinkView _initWithMetadataLoadedFromRequests:](self, "_initWithMetadataLoadedFromRequests:", v5);
  return v11;
}

- (id)_initWithMetadataLoadedFromRequests:(id)a3
{
  id v4;
  LPLinkView *v5;
  LPLinkView *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  LPLinkView *v13;
  id v14;
  id v15;
  LPLinkView *v16;
  LPLinkView *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, unint64_t);
  void *v22;
  id v23;
  LPLinkView *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)LPLinkView;
  v5 = -[LPLinkView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[LPLinkView _commonInitWithURL:](v5, "_commonInitWithURL:", 0);
    v6->_usesComputedPresentationProperties = 1;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    if ((unint64_t)objc_msgSend(v8, "count") < 0xB)
    {
      objc_storeStrong((id *)&v6->_multipleURLs, v7);
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke;
      v22 = &unk_1E44A9B30;
      v15 = v14;
      v23 = v15;
      v16 = v6;
      v24 = v16;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v19);
      -[LPLinkView _setMultipleMetadata:](v16, "_setMultipleMetadata:", v15, v19, v20, v21, v22);
      v17 = v16;

    }
    else
    {
      -[LPLinkView _configureWithoutLoadingMetadataFromURLs:](v6, "_configureWithoutLoadingMetadataFromURLs:", v7);
      v13 = v6;
    }

  }
  return v6;
}

void __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7 = a3 < 2;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke_2;
  v12 = &unk_1E44A9B08;
  v13 = v5;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v13, "_fetchMetadataForRequest:withSubresources:completionHandler:", a2, v7, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8, v9, v10, v11, v12);

}

void __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setMultipleMetadata:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 848));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "linkView:didFetchMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));

}

- (id)_initWithNullableURL:(id)a3
{
  id v4;
  LPLinkView *v5;
  LPLinkView *v6;
  LPLinkView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPLinkView;
  v5 = -[LPLinkView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[LPLinkView _commonInitWithURL:](v5, "_commonInitWithURL:", v4);
    v6->_usesComputedPresentationProperties = 1;
    v6->_metadataIsComplete = 1;
    v7 = v6;
  }

  return v6;
}

- (LPLinkView)initWithMetadata:(LPLinkMetadata *)metadata
{
  LPLinkMetadata *v4;
  void *v5;
  LPLinkView *v6;
  LPLinkView *v7;

  v4 = metadata;
  -[LPLinkMetadata originalURL](v4, "originalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPLinkView _initWithNullableURL:](self, "_initWithNullableURL:", v5);

  if (v6)
  {
    -[LPLinkView setMetadata:](v6, "setMetadata:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)_initWithMultipleMetadata:(id)a3
{
  id v4;
  LPLinkView *v5;
  LPLinkView *v6;
  LPLinkView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPLinkView;
  v5 = -[LPLinkView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[LPLinkView _commonInitWithURL:](v5, "_commonInitWithURL:", 0);
    v6->_usesComputedPresentationProperties = 1;
    v6->_metadataIsComplete = 1;
    -[LPLinkView _setMultipleMetadata:](v6, "_setMultipleMetadata:", v4);
    v7 = v6;
  }

  return v6;
}

- (LPLinkView)initWithPresentationProperties:(id)a3
{
  LPLinkView *v3;
  LPLinkView *v4;
  LPLinkView *v5;

  v3 = -[LPLinkView initWithPresentationProperties:URL:](self, "initWithPresentationProperties:URL:", a3, 0);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (LPLinkView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  LPLinkView *v8;
  LPLinkView *v9;
  LPLinkView *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPLinkView;
  v8 = -[LPLinkView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    -[LPLinkView _commonInitWithURL:](v8, "_commonInitWithURL:", v7);
    -[LPLinkView _setPresentationProperties:](v9, "_setPresentationProperties:", v6);
    v10 = v9;
  }

  return v9;
}

- (id)_initWithSynapseContentItem:(id)a3
{
  id v4;
  id v5;
  LPLinkView *v6;
  LPLinkView *v7;

  v4 = a3;
  v5 = -[LPLinkMetadata _initWithSynapseContentItem:]([LPLinkMetadata alloc], "_initWithSynapseContentItem:", v4);
  v6 = -[LPLinkView initWithMetadata:](self, "initWithMetadata:", v5);

  if (v6)
    v7 = v6;

  return v6;
}

- (void)_commonInitWithURL:(id)a3
{
  id v5;
  NSHashTable *v6;
  NSHashTable *pendingMetadataProviders;
  void *v8;
  NSString *v9;
  NSString *sourceBundleIdentifier;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  pendingMetadataProviders = self->_pendingMetadataProviders;
  self->_pendingMetadataProviders = v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  self->_sourceBundleIdentifier = v9;

  self->_loggingID = ++generateLoggingID_nextLoggingID;
  objc_storeStrong((id *)&self->_URL, a3);
  self->_applyCornerRadius = 1;
  self->_allowsSkinnyWidth = +[LPApplicationCompatibilityQuirks allowsSkinnyWidthByDefault](LPApplicationCompatibilityQuirks, "allowsSkinnyWidthByDefault");
  self->_presentationPropertyState = -1;
  self->_allowsAsynchronousImageDecoding = !+[LPApplicationIdentification isFreeform](LPApplicationIdentification, "isFreeform");
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)-[LPLinkView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v12, &__block_literal_global_19);

  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)-[LPLinkView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v15, &__block_literal_global_107_0);

  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)-[LPLinkView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v18, &__block_literal_global_109);

}

void __33__LPLinkView__commonInitWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_invalidatePresentationProperties");
  objc_msgSend(v2, "themeParametersDidChange");

}

uint64_t __33__LPLinkView__commonInitWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "themeParametersDidChange");
}

void __33__LPLinkView__commonInitWithURL___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = a2;
  v2[85] |= 1uLL;
  ++v2[86];
  v3 = v2;
  objc_msgSend(v2, "themeParametersDidChange");
  --v3[86];

}

- (void)dealloc
{
  objc_super v3;

  +[LPTheme removeClient:](LPTheme, "removeClient:", self);
  v3.receiver = self;
  v3.super_class = (Class)LPLinkView;
  -[LPLinkView dealloc](&v3, sel_dealloc);
}

- (void)_setApplyCornerRadius:(BOOL)a3
{
  self->_applyCornerRadius = a3;
  -[LPLinkView _rebuildEntireView](self, "_rebuildEntireView");
}

- (BOOL)_shouldApplyCornerRadius
{
  _BOOL4 v3;

  v3 = sizeClassAllowsProgressSpinner(self->_effectiveSizeClass);
  if (v3)
    LOBYTE(v3) = self->_applyCornerRadius;
  return v3;
}

- (void)_setEffectiveCornerRadius:(double)a3
{
  self->_hasOverrideCornerRadius = 1;
  self->_overrideCornerRadius = a3;
  -[LPLinkView _updateCornerRadius](self, "_updateCornerRadius");
}

- (double)_effectiveCornerRadius
{
  double overrideCornerRadius;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[LPLinkView _computePresentationPropertiesFromMetadataIfNeeded](self, "_computePresentationPropertiesFromMetadataIfNeeded");
  if (self->_hasOverrideCornerRadius)
  {
    overrideCornerRadius = self->_overrideCornerRadius;
  }
  else
  {
    -[LPTheme cornerRadius](self->_theme, "cornerRadius");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    overrideCornerRadius = v5;

  }
  -[LPLinkView frame](self, "frame");
  v7 = v6 * 0.5;
  -[LPLinkView frame](self, "frame");
  return fmin(overrideCornerRadius, fmin(v7, v8 * 0.5));
}

- (void)_updateCornerRadius
{
  UIView *animationView;
  _BOOL4 v4;
  double v5;

  animationView = self->_animationView;
  v4 = -[LPLinkView _shouldApplyCornerRadius](self, "_shouldApplyCornerRadius");
  v5 = 0.0;
  if (v4)
    -[LPLinkView _effectiveCornerRadius](self, "_effectiveCornerRadius", 0.0);
  -[UIView _lp_setCornerRadius:](animationView, "_lp_setCornerRadius:", v5);
}

- (BOOL)_shouldClipAnimationView
{
  return sizeClassAllowsProgressSpinner(self->_effectiveSizeClass);
}

- (void)_configureWithoutLoadingMetadataFromURLs:(id)a3
{
  LPLinkMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  LPSummarizedLinkMetadata *v8;
  id v9;

  v9 = a3;
  v4 = objc_alloc_init(LPLinkMetadata);
  v5 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("%ld Document(s)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, objc_msgSend(v9, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setTitle:](v4, "setTitle:", v7);

  v8 = objc_alloc_init(LPSummarizedLinkMetadata);
  -[LPLinkMetadata setSpecialization:](v4, "setSpecialization:", v8);

  -[LPLinkView _setMetadata:isFinal:](self, "_setMetadata:isFinal:", v4, 1);
}

- (id)_fetchMetadataForRequest:(id)a3 withSubresources:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  LPMetadataProvider *v10;
  LPMetadataProvider *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  LPMetadataProvider *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[LPLinkView _updateMetadataIsComplete](self, "_updateMetadataIsComplete");
  v10 = objc_alloc_init(LPMetadataProvider);
  -[NSHashTable addObject:](self->_pendingMetadataProviders, "addObject:", v10);
  -[LPMetadataProvider setShouldFetchSubresources:](v10, "setShouldFetchSubresources:", v6);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke;
  v17[3] = &unk_1E44A9BE0;
  v17[4] = self;
  v11 = v10;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  v20 = &v21;
  -[LPMetadataProvider _startFetchingMetadataForRequest:completionHandler:](v11, "_startFetchingMetadataForRequest:completionHandler:", v8, v17);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v22[5];
  v22[5] = v13;

  v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke_2;
  v5[3] = &unk_1E44A9BB8;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 424), "removeObject:", a1[5]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

- (void)_fetchMetadataForRequest:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__LPLinkView__fetchMetadataForRequest___block_invoke;
  v7[3] = &unk_1E44A9C08;
  v7[4] = self;
  -[LPLinkView _fetchMetadataForRequest:withSubresources:completionHandler:](self, "_fetchMetadataForRequest:withSubresources:completionHandler:", a3, 1, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_allowsTapToLoad = 0;
  -[LPLinkViewComponents media](self->_components, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    -[LPLinkView _setMetadata:isFinal:](self, "_setMetadata:isFinal:", v4, 0);

}

void __39__LPLinkView__fetchMetadataForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __39__LPLinkView__fetchMetadataForRequest___block_invoke_2;
  v13 = &unk_1E44A7D10;
  v14 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v15 = v4;
  v5 = (void (**)(_QWORD))_Block_copy(&v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "media", v10, v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animateOutWithCompletionHandler:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "captionBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animateOut");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setCaptionBar:", 0);
  }
  else
  {
    v5[2](v5);
  }

}

void __39__LPLinkView__fetchMetadataForRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setMetadata:isFinal:", *(_QWORD *)(a1 + 40), 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 848));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "linkView:didFetchMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));

}

- (void)_setupView
{
  UIView *v3;
  UIView *animationView;
  void *v5;
  UIView *v6;
  UIView *contentView;
  NSMutableArray *v8;
  NSMutableArray *tapGestureRecognizers;
  NSMutableArray *v10;
  NSMutableArray *highlightGestureRecognizers;
  void (**v12)(void);
  UIView *v13;
  UIView *captionHighlightView;
  UIView *v15;
  UIView *mediaHighlightView;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD aBlock[5];

  +[LPTheme addClient:](LPTheme, "addClient:", self);
  objc_msgSend(MEMORY[0x1E0DC3F10], "_lp_createFlippedView");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  animationView = self->_animationView;
  self->_animationView = v3;

  -[UIView layer](self->_animationView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  -[LPLinkView addSubview:](self, "addSubview:", self->_animationView);
  objc_msgSend(MEMORY[0x1E0DC3F10], "_lp_createFlippedView");
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v6;

  -[LPLinkView _updateEffectiveAppearanceTraitsIfNeeded](self, "_updateEffectiveAppearanceTraitsIfNeeded");
  -[UIView addSubview:](self->_animationView, "addSubview:", self->_contentView);
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  tapGestureRecognizers = self->_tapGestureRecognizers;
  self->_tapGestureRecognizers = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  highlightGestureRecognizers = self->_highlightGestureRecognizers;
  self->_highlightGestureRecognizers = v10;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__LPLinkView__setupView__block_invoke;
  aBlock[3] = &unk_1E44A9C50;
  aBlock[4] = self;
  v12 = (void (**)(void))_Block_copy(aBlock);
  v12[2]();
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  captionHighlightView = self->_captionHighlightView;
  self->_captionHighlightView = v13;

  -[UIView addSubview:](self->_animationView, "addSubview:", self->_captionHighlightView);
  ((void (*)(void (**)(void)))v12[2])(v12);
  v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  mediaHighlightView = self->_mediaHighlightView;
  self->_mediaHighlightView = v15;

  -[UIView addSubview:](self->_animationView, "addSubview:", self->_mediaHighlightView);
  -[LPLinkView _updateBlur](self, "_updateBlur");
  -[UIView _lp_setHoverEffectEnabled:](self->_animationView, "_lp_setHoverEffectEnabled:", !self->_disableTapGesture);
  if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[LPLinkView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderColor:", v18);

    -[LPLinkView layer](self, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBorderWidth:", 0.5);

    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGColor");
    -[UIView layer](self->_animationView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderColor:", v22);

    -[UIView layer](self->_animationView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBorderWidth:", 0.5);

  }
}

LPBackgroundColorView *__24__LPLinkView__setupView__block_invoke(uint64_t a1)
{
  LPBackgroundColorView *v2;
  void *v3;
  LPBackgroundColorView *v4;
  void *v5;

  v2 = [LPBackgroundColorView alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "highlightColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LPBackgroundColorView initWithColor:](v2, "initWithColor:", v3);

  -[LPBackgroundColorView setHidden:](v4, "setHidden:", 1);
  -[LPBackgroundColorView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "highlightCompositingFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _lp_applyAndRegisterForUpdatesToValue:withApplyCallback:](v4, "_lp_applyAndRegisterForUpdatesToValue:withApplyCallback:", v5, &__block_literal_global_124_0);

  return v4;
}

uint64_t __24__LPLinkView__setupView__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lp_setCompositingFilter:");
}

- (int64_t)_blurEffectStyle
{
  return -[LPTheme backgroundMaterial](self->_theme, "backgroundMaterial");
}

- (BOOL)_shouldUseBlur
{
  int v3;

  if (-[LPLinkView _themePlatform](self, "_themePlatform") != 5 || self->_overrideBackgroundColor)
    goto LABEL_3;
  v3 = sizeClassAllowsBackgroundColor(self->_effectiveSizeClass);
  if (!v3)
    return v3;
  if (+[LPSettings useLightweightMaterials](LPSettings, "useLightweightMaterials"))
LABEL_3:
    LOBYTE(v3) = 0;
  else
    LOBYTE(v3) = self->_backgroundColorSupportsVibrancy;
  return v3;
}

- (void)_updateBlur
{
  if (-[LPLinkView _shouldUseBlur](self, "_shouldUseBlur"))
    -[LPLinkView _enableBlur](self, "_enableBlur");
  else
    -[LPLinkView _disableBlur](self, "_disableBlur");
}

- (void)_enableBlur
{
  id v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *blurView;
  id v6;
  id v7;

  if (!self->_blurView)
  {
    if (self->_contentView)
    {
      v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", -[LPLinkView _blurEffectStyle](self, "_blurEffectStyle"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v4 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:");
      blurView = self->_blurView;
      self->_blurView = v4;

      -[UIView insertSubview:belowSubview:](self->_animationView, "insertSubview:belowSubview:", self->_blurView, self->_contentView);
      -[UIVisualEffectView contentView](self->_blurView, "contentView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_contentView);

    }
  }
}

- (void)_disableBlur
{
  UIVisualEffectView *blurView;

  if (self->_blurView)
  {
    -[UIView insertSubview:belowSubview:](self->_animationView, "insertSubview:belowSubview:", self->_contentView);
    -[UIVisualEffectView removeFromSuperview](self->_blurView, "removeFromSuperview");
    blurView = self->_blurView;
    self->_blurView = 0;

  }
}

- (double)minimumCornerRadiusForComponentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  char v11;

  v4 = a3;
  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasIconViewEqualToComponentView:", v4) & 1) == 0)
  {
    -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "hasIconViewEqualToComponentView:", v4))
    {
      -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasIconViewEqualToComponentView:", v4);

      v8 = 0.0;
      if ((v11 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  -[LPLinkRendererSizeClassParameters minimumIconCornerRadius](self->_sizeClassParameters, "minimumIconCornerRadius");
  v8 = v7;
LABEL_6:

  return v8;
}

- (id)appearanceForComponentView:(id)a3
{
  -[UIView _lp_appearance](self, "_lp_appearance", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_themePlatform
{
  return +[LPTheme platformForView:](LPTheme, "platformForView:", self);
}

- (UIColor)_resolvedBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  UIColor *overrideBackgroundColor;
  UIColor *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UIColor *underlyingBackgroundColor;
  UIColor *v13;
  UIColor *v14;

  -[LPTheme backgroundColor](self->_theme, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LPLinkView _themePlatform](self, "_themePlatform") == 5)
  {
    -[LPLinkView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 != 2)
    {
      +[LPTheme defaultBackgroundColorForPlatform:](LPTheme, "defaultBackgroundColorForPlatform:", 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
  }
  overrideBackgroundColor = self->_overrideBackgroundColor;
  if (overrideBackgroundColor)
  {
    v8 = overrideBackgroundColor;
  }
  else
  {
    -[LPLinkView _presentationOverrideBackgroundColor](self, "_presentationOverrideBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v3;
    v8 = v11;

  }
  underlyingBackgroundColor = self->_underlyingBackgroundColor;
  if (underlyingBackgroundColor)
  {
    -[UIColor _lp_colorBlendedWithColor:](underlyingBackgroundColor, "_lp_colorBlendedWithColor:", v8);
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v8;
  }
  v14 = v13;

  return v14;
}

- (UIColor)_dominantBackgroundColor
{
  -[LPLinkView _computePresentationPropertiesFromMetadataIfNeeded](self, "_computePresentationPropertiesFromMetadataIfNeeded");
  return -[LPWebLinkPresentationProperties dominantImageBackgroundColor](self->_properties, "dominantImageBackgroundColor");
}

- (BOOL)_backgroundColorSupportsVibrancy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[LPLinkView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v7);

  return (char)v5;
}

- (void)_updateBackgroundColor
{
  UIColor *v3;
  UIColor *backgroundColor;

  -[LPLinkView _resolvedBackgroundColor](self, "_resolvedBackgroundColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v3;

  self->_backgroundColorSupportsVibrancy = -[LPLinkView _backgroundColorSupportsVibrancy:](self, "_backgroundColorSupportsVibrancy:", self->_backgroundColor);
}

- (id)_effectiveAppearanceTraits
{
  return self->_effectiveTraitCollection;
}

- (void)_setEffectiveAppearanceTraits:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[LPLinkView _effectiveAppearanceTraits](self, "_effectiveAppearanceTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    -[LPLinkView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_effectiveTraitCollection"));
    objc_storeStrong((id *)&self->_effectiveTraitCollection, a3);
    -[LPLinkView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_effectiveTraitCollection"));
  }

}

- (void)_updateEffectiveAppearanceTraitsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];

  -[LPWebLinkPresentationProperties dominantImageBackgroundColor](self->_properties, "dominantImageBackgroundColor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 && !self->_overrideBackgroundColor)
  {
    v9 = objc_msgSend(v15, "deprecatedLuminosityLevel");
    -[LPLinkView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
    if (v9 == 1)
      v12 = 2;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__LPLinkView__updateEffectiveAppearanceTraitsIfNeeded__block_invoke;
    v17[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v17[4] = v12;
    objc_msgSend(v10, "traitCollectionByModifyingTraits:", v17, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _setEffectiveAppearanceTraits:](self, "_setEffectiveAppearanceTraits:", v13);

    -[LPLinkView _effectiveAppearanceTraits](self, "_effectiveAppearanceTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "userInterfaceStyle");
    -[UIView traitOverrides](self->_contentView, "traitOverrides");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInterfaceStyle:", v14);
    goto LABEL_8;
  }
  -[UIView _lp_appearance](self, "_lp_appearance", v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkView _setEffectiveAppearanceTraits:](self, "_setEffectiveAppearanceTraits:", v3);

  -[UIView traitOverrides](self->_contentView, "traitOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsTrait:", v5);

  if (v6)
  {
    -[UIView traitOverrides](self->_contentView, "traitOverrides");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTrait:", v8);
LABEL_8:

  }
}

uint64_t __54__LPLinkView__updateEffectiveAppearanceTraitsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (void)themeParametersDidChange
{
  int64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  unint64_t effectiveSizeClass;
  LPLinkRendererSizeClassParameters *sizeClassParameters;
  void *v11;
  void *v12;
  LPTheme *v13;
  LPTheme *theme;
  void *v15;
  void *v16;
  void *v17;

  v3 = -[LPLinkView _themePlatform](self, "_themePlatform");
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LPWebLinkPresentationProperties style](self->_properties, "style");
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  if (!v7)
  {
    -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingIcon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  effectiveSizeClass = self->_effectiveSizeClass;
  sizeClassParameters = self->_sizeClassParameters;
  -[LPLinkView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPTheme themeWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:](LPTheme, "themeWithStyle:icon:platform:sizeClass:sizeClassParameters:hasButton:preferredContentSizeCategory:", v8, v17, v3, effectiveSizeClass, sizeClassParameters, v5 != 0, v12);
  v13 = (LPTheme *)objc_claimAutoreleasedReturnValue();
  theme = self->_theme;
  self->_theme = v13;

  if (!v7)
  {

  }
  -[LPLinkView _updateBackgroundColor](self, "_updateBackgroundColor");
  -[LPLinkView _updateBlur](self, "_updateBlur");
  -[LPLinkView _rebuildEntireView](self, "_rebuildEntireView");
}

- (void)_setOverrideURL:(id)a3
{
  NSURL *v5;
  NSURL *overrideURL;

  v5 = (NSURL *)a3;
  objc_storeStrong((id *)&self->_URL, a3);
  overrideURL = self->_overrideURL;
  self->_overrideURL = v5;

  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setUnderlyingBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingBackgroundColor, a3);
  -[LPLinkView themeParametersDidChange](self, "themeParametersDidChange");
}

- (void)_setOverrideBackgroundColor:(id)a3
{
  unint64_t v5;

  v5 = (unint64_t)a3;
  if (v5 | (unint64_t)self->_overrideBackgroundColor && (objc_msgSend((id)v5, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideBackgroundColor, a3);
    -[LPLinkView _updateBackgroundColor](self, "_updateBackgroundColor");
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }

}

- (void)_setOverrideMediaBackgroundColor:(id)a3
{
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (unint64_t)a3;
  v6 = (void *)v5;
  if (v5 | (unint64_t)self->_overrideMediaBackgroundColor)
  {
    v10 = (id)v5;
    v7 = objc_msgSend((id)v5, "isEqual:");
    v6 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideMediaBackgroundColor, a3);
      -[LPLinkView _mediaBackgroundColor](self, "_mediaBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setColor:", v8);

      v6 = v10;
    }
  }

}

- (void)_setOverrideActionButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideActionButtonColor, a3);
  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setOverrideSubtitleButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSubtitleButtonColor, a3);
  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setContactsForAttribution:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSArray isEqual:](self->_contactsForAttribution, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactsForAttribution, a3);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }

}

- (void)_setHighlightedForAttribution:(BOOL)a3
{
  if (self->_highlightedForAttribution != a3)
  {
    self->_highlightedForAttribution = a3;
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }
}

- (void)_setCollaborationFooterViewModel:(id)a3 action:(id)a4
{
  id v6;
  LPCollaborationFooterPresentationProperties *v7;
  void *v8;
  LPCollaborationFooterPresentationProperties *v9;
  LPCollaborationFooterPresentationProperties *v10;
  void *v11;
  void *v12;
  LPCollaborationFooterPresentationProperties *collaborationFooter;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14)
  {
    v7 = objc_alloc_init(LPCollaborationFooterPresentationProperties);
    objc_msgSend(v14, "optionsSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCollaborationFooterPresentationProperties setTitle:](v7, "setTitle:", v8);

    objc_msgSend(v14, "metadata");
    v9 = (LPCollaborationFooterPresentationProperties *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[LPCollaborationFooterPresentationProperties initiatorHandle](v9, "initiatorHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCollaborationFooterPresentationProperties setInitiatorName:](v7, "setInitiatorName:", v11);

      -[LPCollaborationFooterPresentationProperties initiatorNameComponents](v10, "initiatorNameComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCollaborationFooterPresentationProperties setInitiatorNameComponents:](v7, "setInitiatorNameComponents:", v12);

    }
    -[LPCollaborationFooterPresentationProperties setAction:](v7, "setAction:", v6);
    collaborationFooter = self->_collaborationFooter;
    self->_collaborationFooter = v7;

  }
  else
  {
    v10 = self->_collaborationFooter;
    self->_collaborationFooter = 0;
  }

  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setShowingDisclosureView:(BOOL)a3
{
  void *v3;
  id v4;

  if (self->_showingDisclosureView != a3)
  {
    self->_showingDisclosureView = a3;
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collaborationFooterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateIndicator");

  }
}

- (void)_setLastResortIcon:(id)a3
{
  LPImage *v5;

  v5 = (LPImage *)a3;
  if (self->_lastResortIcon != v5)
  {
    objc_storeStrong((id *)&self->_lastResortIcon, a3);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }

}

- (void)_setMediaOverlayIcon:(id)a3
{
  LPImage *v5;

  v5 = (LPImage *)a3;
  if (self->_mediaOverlayIcon != v5)
  {
    objc_storeStrong((id *)&self->_mediaOverlayIcon, a3);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }

}

- (void)_setInComposeContext:(BOOL)a3
{
  if (self->_inComposeContext != a3)
  {
    self->_inComposeContext = a3;
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }
}

- (void)_setInSenderContext:(BOOL)a3
{
  if (self->_inSenderContext != a3)
  {
    self->_inSenderContext = a3;
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }
}

- (void)_setCollaborative:(BOOL)a3
{
  if (self->_collaborative != a3)
  {
    self->_collaborative = a3;
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }
}

- (BOOL)_useCPURenderingForMaterials
{
  return self->_useCPURenderingForMaterials
      || +[LPApplicationIdentification isNotesPreviewGenerator](LPApplicationIdentification, "isNotesPreviewGenerator");
}

- (void)_setUseCPURenderingForMaterials:(BOOL)a3
{
  if (self->_useCPURenderingForMaterials != a3)
  {
    self->_useCPURenderingForMaterials = a3;
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (LPLinkMetadata)metadata
{
  LPLinkMetadata *metadata;
  LPPlaceholderLinkMetadata *v4;

  metadata = self->_metadata;
  if (metadata)
  {
    v4 = (LPPlaceholderLinkMetadata *)-[LPLinkMetadata copy](metadata, "copy");
  }
  else
  {
    v4 = objc_alloc_init(LPPlaceholderLinkMetadata);
    -[LPLinkMetadata setURL:](v4, "setURL:", self->_URL);
    -[LPLinkMetadata setOriginalURL:](v4, "setOriginalURL:", self->_URL);
  }
  return (LPLinkMetadata *)v4;
}

- (int64_t)sharedObjectDownloadStateForComponentView:(id)a3
{
  return self->_sharedObjectDownloadState;
}

- (void)_setBytesLoaded:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  int64_t v7;
  int64_t sharedObjectDownloadState;
  LPLinkMetadataDownloadProgressTransformer *v9;

  self->_bytesLoaded = a3;
  if (self->_metadata)
  {
    v9 = -[LPLinkMetadataDownloadProgressTransformer initWithBytesLoaded:downloadState:metadata:]([LPLinkMetadataDownloadProgressTransformer alloc], "initWithBytesLoaded:downloadState:metadata:", a3, self->_sharedObjectDownloadState, self->_metadata);
    -[LPLinkMetadataDownloadProgressTransformer downloadProgressForTransformer:](v9, "downloadProgressForTransformer:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "isFinished");
      v7 = 1;
      if (v6)
        v7 = 2;
      self->_sharedObjectDownloadState = v7;
    }
    else
    {
      sharedObjectDownloadState = self->_sharedObjectDownloadState;
      self->_sharedObjectDownloadState = 0;
      if (!sharedObjectDownloadState)
      {
LABEL_9:

        return;
      }
    }
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
    goto LABEL_9;
  }
}

- (void)resetDownloadState
{
  self->_sharedObjectDownloadState = 0;
  self->_bytesLoaded = 0;
  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setMetadataInternal:(id)a3
{
  void *v3;
  id v5;
  LPLinkMetadata *v6;
  LPLinkMetadata *metadata;
  NSURL *overrideURL;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  LPLinkView *v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = a3;
  v6 = (LPLinkMetadata *)objc_msgSend(v5, "copy");
  metadata = self->_metadata;
  self->_metadata = v6;

  overrideURL = self->_overrideURL;
  if (overrideURL)
  {
    v9 = 0;
    v10 = self->_overrideURL;
  }
  else
  {
    objc_msgSend(v5, "originalURL");
    v11 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v11;
    if (v11)
    {
      v9 = 0;
      v10 = (void *)v11;
    }
    else
    {
      objc_msgSend(v5, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = 0;
      v9 = 1;
    }
  }
  objc_storeStrong((id *)&self->_URL, v10);
  if (v9)

  if (!overrideURL)
  if (self->_metadata)
  {
    self->_asynchronouslyLoadingMetadataFields = 1;
    v12 = ++_setMetadataInternal__currentAsyncLoadRequestID;
    v13 = (void *)objc_msgSend(v5, "copy");
    if (objc_msgSend(v5, "_isDeferringAsynchronousLoads"))
    {
      objc_msgSend(v13, "_createAsynchronousLoadDeferralToken");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_addFinishedDeferringAsynchronousLoadHandler:", v14);

    }
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __35__LPLinkView__setMetadataInternal___block_invoke;
    v19 = &unk_1E44A9C98;
    v23 = v12;
    v20 = self;
    v21 = v5;
    v15 = v13;
    v22 = v15;
    objc_msgSend(v15, "_loadAsynchronousFieldsWithUpdateHandler:", &v16);

  }
  -[LPLinkView _updateMetadataIsComplete](self, "_updateMetadataIsComplete", v16, v17, v18, v19, v20);
  if (!self->_metadata || self->_asynchronouslyLoadingMetadataFields)
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");

}

void __35__LPLinkView__setMetadataInternal___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (*(_QWORD *)(a1 + 56) == _setMetadataInternal__currentAsyncLoadRequestID)
  {
    if (sizeClassPrefersAsynchronousFieldsMetadataUpdateAfterCompletion(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 624))
      && (objc_msgSend(*(id *)(a1 + 40), "specialization"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion"),
          v4,
          v5)
      && !a2)
    {
      v6 = 0;
    }
    else
    {
      v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 432);
      *(_QWORD *)(v8 + 432) = v7;

      v6 = 1;
      if (a2)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 704) = 0;
        objc_msgSend(*(id *)(a1 + 32), "_updateMetadataIsComplete");
      }
    }
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "_invalidatePresentationPropertiesAndLayout");
  }
}

- (LPLinkMetadata)_flattenedMetadata
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[LPLinkMetadata variants](self->_metadata, "variants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSNumber unsignedIntegerValue](self->_selectedVariantIndex, "unsignedIntegerValue");
  if (v4 >= objc_msgSend(v3, "count"))
    -[LPLinkView metadata](self, "metadata");
  else
    objc_msgSend(v3, "objectAtIndexedSubscript:", -[NSNumber unsignedIntegerValue](self->_selectedVariantIndex, "unsignedIntegerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v5;
}

- (void)setMetadata:(LPLinkMetadata *)metadata
{
  -[LPLinkView _setMetadata:isFinal:](self, "_setMetadata:isFinal:", metadata, 1);
}

- (void)_setMetadata:(id)a3 isFinal:(BOOL)a4
{
  NSNumber *selectedVariantIndex;
  id v6;

  self->_mayReceiveAdditionalMetadata = !a4;
  selectedVariantIndex = self->_selectedVariantIndex;
  self->_selectedVariantIndex = 0;
  v6 = a3;

  -[LPLinkView _setMetadataInternal:](self, "_setMetadataInternal:", v6);
}

- (void)_setSelectedVariantIndex:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSNumber isEqual:](self->_selectedVariantIndex, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedVariantIndex, a3);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }

}

- (void)_setMultipleMetadata:(id)a3
{
  LPMultipleMetadataPresentationTransformer *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v4 = -[LPMultipleMetadataPresentationTransformer initWithMetadata:]([LPMultipleMetadataPresentationTransformer alloc], "initWithMetadata:", v6);
    -[LPMultipleMetadataPresentationTransformer setPreferredSizeClass:](v4, "setPreferredSizeClass:", self->_preferredSizeClass);
    self->_mayReceiveAdditionalMetadata = 0;
    -[LPMultipleMetadataPresentationTransformer summaryMetadata](v4, "summaryMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _setMetadataInternal:](self, "_setMetadataInternal:", v5);

  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v4 = (LPMultipleMetadataPresentationTransformer *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _setMetadataInternal:](self, "_setMetadataInternal:", v4);
  }

}

- (void)_setPreferredSizeClass:(unint64_t)a3
{
  if (self->_preferredSizeClass != a3)
  {
    self->_preferredSizeClass = a3;
    self->_effectiveSizeClass = a3;
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
    -[LPLinkView themeParametersDidChange](self, "themeParametersDidChange");
  }
}

- (void)_setSizeClassParameters:(id)a3
{
  LPLinkRendererSizeClassParameters *v4;
  LPLinkRendererSizeClassParameters *sizeClassParameters;
  id v6;

  v6 = a3;
  if (!-[LPLinkRendererSizeClassParameters isEqual:](self->_sizeClassParameters, "isEqual:"))
  {
    v4 = (LPLinkRendererSizeClassParameters *)objc_msgSend(v6, "copy");
    sizeClassParameters = self->_sizeClassParameters;
    self->_sizeClassParameters = v4;

    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
    -[LPLinkView themeParametersDidChange](self, "themeParametersDidChange");
  }

}

- (void)_setSourceBundleIdentifier:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_sourceBundleIdentifier != v5)
  {
    objc_storeStrong((id *)&self->_sourceBundleIdentifier, a3);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }

}

- (void)_addCaptionButton:(id)a3
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "type") == 1)
  {
    objc_storeStrong((id *)&self->_captionButton, a3);
    -[LPConcretePresentationProperties setCaptionButton:](self->_properties, "setCaptionButton:", v5);
  }
  else
  {
    objc_storeStrong((id *)&self->_captionTextButton, a3);
    -[LPConcretePresentationProperties setCaptionTextButton:](self->_properties, "setCaptionTextButton:", v5);
  }

}

- (void)_removeCaptionButtonWithType:(int64_t)a3
{
  LPCaptionButtonPresentationProperties *captionButton;
  void *v5;
  LPCaptionButtonPresentationProperties *captionTextButton;

  if (a3 == 1)
  {
    captionButton = self->_captionButton;
    self->_captionButton = 0;

    -[LPConcretePresentationProperties setCaptionButton:](self->_properties, "setCaptionButton:", 0);
    -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setButton:", 0);

  }
  else
  {
    captionTextButton = self->_captionTextButton;
    self->_captionTextButton = 0;

    -[LPConcretePresentationProperties setCaptionTextButton:](self->_properties, "setCaptionTextButton:", 0);
  }
  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setAction:(id)a3 withText:(id)a4 buttonType:(int64_t)a5
{
  id v8;
  LPCaptionButtonPresentationProperties *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (v10 && v8)
  {
    v9 = objc_alloc_init(LPCaptionButtonPresentationProperties);
    -[LPCaptionButtonPresentationProperties setText:](v9, "setText:", v8);
    -[LPCaptionButtonPresentationProperties setCallback:](v9, "setCallback:", v10);
    -[LPCaptionButtonPresentationProperties setType:](v9, "setType:", a5);
    -[LPLinkView _addCaptionButton:](self, "_addCaptionButton:", v9);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");

  }
  else
  {
    -[LPLinkView _removeCaptionButtonWithType:](self, "_removeCaptionButtonWithType:", a5);
  }

}

- (void)_setAction:(id)a3 withText:(id)a4
{
  -[LPLinkView _setAction:withText:buttonType:](self, "_setAction:withText:buttonType:", a3, a4, 0);
}

- (void)_setAction:(id)a3 withAttributedText:(id)a4 buttonType:(int64_t)a5
{
  id v8;
  LPCaptionButtonPresentationProperties *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (v10 && v8)
  {
    v9 = objc_alloc_init(LPCaptionButtonPresentationProperties);
    -[LPCaptionButtonPresentationProperties setAttributedText:](v9, "setAttributedText:", v8);
    -[LPCaptionButtonPresentationProperties setCallback:](v9, "setCallback:", v10);
    -[LPCaptionButtonPresentationProperties setType:](v9, "setType:", a5);
    -[LPLinkView _addCaptionButton:](self, "_addCaptionButton:", v9);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");

  }
  else
  {
    -[LPLinkView _removeCaptionButtonWithType:](self, "_removeCaptionButtonWithType:", a5);
  }

}

- (void)_setButtonActions:(id)a3
{
  id v4;
  void *v5;
  LPCaptionButtonPresentationProperties *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(LPCaptionButtonPresentationProperties);
    -[LPCaptionButtonPresentationProperties setActions:](v6, "setActions:", v5);
    -[LPCaptionButtonPresentationProperties setType:](v6, "setType:", 1);
    -[LPCaptionButtonPresentationProperties setCallback:](v6, "setCallback:", &__block_literal_global_140);
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      -[LPCaptionButtonPresentationProperties actions](v6, "actions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionButtonPresentationProperties setCallback:](v6, "setCallback:", v17);

LABEL_27:
      -[LPLinkView _addCaptionButton:](self, "_addCaptionButton:", v6);
      -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");

      goto LABEL_28;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[LPCaptionButtonPresentationProperties actions](v6, "actions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if ((v9 & 1) != 0 || objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "isHeader"))
          {
            objc_msgSend(v13, "setSelected:", 0);
          }
          else if ((objc_msgSend(v13, "isSelected") & 1) != 0)
          {
            v9 = 1;
          }
          else
          {
            if (!v10)
              v10 = v13;
            v9 = 0;
          }
          ++v12;
        }
        while (v8 != v12);
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v8 = v14;
      }
      while (v14);

      if ((v9 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

      v10 = 0;
    }
    objc_msgSend(v10, "setSelected:", 1);
LABEL_26:

    goto LABEL_27;
  }
  -[LPLinkView _removeCaptionButtonWithType:](self, "_removeCaptionButtonWithType:", 1);
LABEL_28:

}

- (void)_setOverrideSubtitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *overrideSubtitle;
  id v6;

  v6 = a3;
  v4 = (NSAttributedString *)objc_msgSend(v6, "copy");
  overrideSubtitle = self->_overrideSubtitle;
  self->_overrideSubtitle = v4;

  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (CGRect)_rectForCaptionButtonType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[LPConcretePresentationProperties captionButton](self->_properties, "captionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == a3)
  {
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "button");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPConcretePresentationProperties captionTextButton](self->_properties, "captionTextButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "type");

    if (v10 != a3)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitleButton");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

LABEL_7:
  objc_msgSend(v11, "bounds");
  objc_msgSend(v11, "convertRect:toView:", self);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_invalidatePresentationProperties
{
  self->_presentationPropertyState = -1;
}

- (void)_invalidatePresentationPropertiesAndLayout
{
  -[LPLinkView _invalidatePresentationProperties](self, "_invalidatePresentationProperties");
  -[LPLinkView _invalidateLayout](self, "_invalidateLayout");
}

- (void)_updateMetadataIsComplete
{
  _BOOL4 metadataIsComplete;
  BOOL v4;
  id WeakRetained;

  if (self->_mayReceiveAdditionalMetadata || self->_asynchronouslyLoadingMetadataFields)
  {
    self->_metadataIsComplete = 0;
  }
  else
  {
    metadataIsComplete = self->_metadataIsComplete;
    v4 = -[LPLinkMetadata _isDeferringAsynchronousLoads](self->_metadata, "_isDeferringAsynchronousLoads");
    self->_metadataIsComplete = !v4;
    if (!metadataIsComplete && !v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "_linkViewMetadataDidBecomeComplete:", self);

    }
  }
}

- (void)_computePresentationPropertiesFromMetadataIfNeeded
{
  LPLinkMetadata *metadata;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LPLinkMetadataPresentationTransformer *v10;

  if (self->_usesComputedPresentationProperties && self->_presentationPropertyState)
  {
    v10 = objc_alloc_init(LPLinkMetadataPresentationTransformer);
    metadata = self->_metadata;
    if (metadata)
    {
      -[LPLinkView _flattenedMetadata](self, "_flattenedMetadata");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    -[LPLinkMetadataPresentationTransformer setMetadata:](v10, "setMetadata:", v4);
    if (metadata)

    -[LPLinkMetadataPresentationTransformer setURL:](v10, "setURL:", self->_URL);
    -[LPLinkMetadataPresentationTransformer setComplete:](v10, "setComplete:", self->_metadataIsComplete);
    -[LPLinkMetadataPresentationTransformer setAllowsTapToLoad:](v10, "setAllowsTapToLoad:", self->_allowsTapToLoad);
    -[LPLinkMetadataPresentationTransformer setPreferredSizeClass:](v10, "setPreferredSizeClass:", self->_preferredSizeClass);
    -[LPLinkMetadataPresentationTransformer setSizeClassParameters:](v10, "setSizeClassParameters:", self->_sizeClassParameters);
    -[LPLinkMetadataPresentationTransformer setSourceBundleIdentifier:](v10, "setSourceBundleIdentifier:", self->_sourceBundleIdentifier);
    -[UIView _lp_backingScaleFactor](self, "_lp_backingScaleFactor");
    -[LPLinkMetadataPresentationTransformer setScaleFactor:](v10, "setScaleFactor:");
    -[LPLinkMetadataPresentationTransformer setAllowsTapping:](v10, "setAllowsTapping:", !self->_disableTapGesture);
    v5 = !self->_disablePlayback && !self->_disablePlaybackControls;
    -[LPLinkMetadataPresentationTransformer setAllowsPlayback:](v10, "setAllowsPlayback:", v5);
    -[LPLinkMetadataPresentationTransformer setAllowsPlaybackControls:](v10, "setAllowsPlaybackControls:", !self->_disablePlaybackControls);
    -[LPLinkMetadataPresentationTransformer setSourceContextIcon:](v10, "setSourceContextIcon:", self->_lastResortIcon);
    -[LPLinkMetadataPresentationTransformer setHasOverriddenBackgroundColor:](v10, "setHasOverriddenBackgroundColor:", self->_overrideBackgroundColor != 0);
    -[LPLinkMetadataPresentationTransformer setCollaborative:](v10, "setCollaborative:", self->_collaborative);
    -[LPLinkMetadataPresentationTransformer setInComposeContext:](v10, "setInComposeContext:", self->_inComposeContext);
    -[LPLinkMetadataPresentationTransformer setBytesLoaded:](v10, "setBytesLoaded:", self->_bytesLoaded);
    -[LPLinkMetadataPresentationTransformer setSharedObjectDownloadState:](v10, "setSharedObjectDownloadState:", self->_sharedObjectDownloadState);
    -[LPLinkMetadataPresentationTransformer setMediaOverlayIcon:](v10, "setMediaOverlayIcon:", self->_mediaOverlayIcon);
    -[UIView _lp_appearance](self, "_lp_appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadataPresentationTransformer setEffectiveAppearance:](v10, "setEffectiveAppearance:", v6);

    -[LPLinkView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkMetadataPresentationTransformer setPreferredContentSizeCategory:](v10, "setPreferredContentSizeCategory:", v8);

    self->_effectiveSizeClass = -[LPLinkMetadataPresentationTransformer effectiveSizeClass](v10, "effectiveSizeClass");
    -[LPLinkMetadataPresentationTransformer presentationProperties](v10, "presentationProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _setPresentationProperties:](self, "_setPresentationProperties:", v9);

  }
}

- (BOOL)_useProgressSpinner
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;

  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingIcon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isFallbackIcon"))
  {
    v13 = v6;
LABEL_4:
    -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingIcon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_isFallbackIcon") ^ 1;

    }
    else
    {
      v11 = 0;
    }

    v6 = v13;
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

LABEL_10:
  return -[LPWebLinkPresentationProperties isPreliminary](self->_properties, "isPreliminary")
      && (v11 & 1) == 0
      && sizeClassAllowsProgressSpinner(self->_effectiveSizeClass);
}

- (NSArray)_metadataVariants
{
  return (NSArray *)-[LPLinkMetadata variants](self->_metadata, "variants");
}

- (void)_setPresentationProperties:(id)a3
{
  unint64_t presentationPropertyState;
  LPConcretePresentationPropertiesParameters *v5;
  LPConcretePresentationProperties *v6;
  void *v7;
  NSURL *v8;
  NSURL *URL;
  id v10;

  v10 = a3;
  presentationPropertyState = self->_presentationPropertyState;
  self->_presentationPropertyState = 0;
  v5 = -[LPConcretePresentationPropertiesParameters initWithUsesComputedPresentationProperties:inComposeContext:inSenderContext:effectiveSizeClass:overrideSubtitleButtonColor:overrideActionButtonColor:overrideSubtitle:captionButton:captionTextButton:]([LPConcretePresentationPropertiesParameters alloc], "initWithUsesComputedPresentationProperties:inComposeContext:inSenderContext:effectiveSizeClass:overrideSubtitleButtonColor:overrideActionButtonColor:overrideSubtitle:captionButton:captionTextButton:", self->_usesComputedPresentationProperties, self->_inComposeContext, self->_inSenderContext, self->_effectiveSizeClass, self->_overrideSubtitleButtonColor, self->_overrideActionButtonColor, self->_overrideSubtitle, self->_captionButton, self->_captionTextButton);
  v6 = -[LPConcretePresentationProperties initWithParameters:properties:]([LPConcretePresentationProperties alloc], "initWithParameters:properties:", v5, v10);
  objc_storeStrong((id *)&self->_properties, v6);
  -[LPWebLinkPresentationProperties overrideURL](self->_properties, "overrideURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LPWebLinkPresentationProperties overrideURL](self->_properties, "overrideURL");
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    URL = self->_URL;
    self->_URL = v8;

  }
  if (presentationPropertyState == 1)
    ++self->_suppressNeedsResizeCount;
  if (!self->_theme || self->_sharedObjectDownloadState != 1)
    -[LPLinkView themeParametersDidChange](self, "themeParametersDidChange");
  if (presentationPropertyState != 1)
    self->_shouldAnimateDuringNextBuild = self->_hasEverBuilt;
  -[LPLinkView _updateEffectiveAppearanceTraitsIfNeeded](self, "_updateEffectiveAppearanceTraitsIfNeeded");
  -[LPLinkView _rebuildEntireView](self, "_rebuildEntireView");
  if (presentationPropertyState == 1)
    --self->_suppressNeedsResizeCount;

}

- (id)_presentationOverrideBackgroundColor
{
  LPConcretePresentationProperties *properties;
  void *v3;
  void *v4;

  properties = self->_properties;
  -[LPTheme mediaImage](self->_theme, "mediaImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "darkeningAmount");
  presentationOverrideBackgroundColorForProperties(properties);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_style
{
  -[LPLinkView _computePresentationPropertiesFromMetadataIfNeeded](self, "_computePresentationPropertiesFromMetadataIfNeeded");
  return -[LPWebLinkPresentationProperties style](self->_properties, "style");
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LPLinkView;
  -[LPLinkView layoutSubviews](&v4, sel_layoutSubviews);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__LPLinkView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E44A7CE8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

uint64_t __28__LPLinkView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutLinkView");
}

- (void)didMoveToWindow
{
  self->_componentsNeedLayout = 1;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[LPLinkView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (void)_setTextSafeAreaInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_textSafeAreaInset.left
    || a3.top != self->_textSafeAreaInset.top
    || a3.right != self->_textSafeAreaInset.right
    || a3.bottom != self->_textSafeAreaInset.bottom)
  {
    self->_textSafeAreaInset = a3;
    -[LPLinkView _invalidateLayout](self, "_invalidateLayout");
  }
}

- (BOOL)_strictlyRespectsSizeClassHeightConstraints
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  if (+[LPApplicationCompatibilityQuirks supportsLPLinkViewAutolayout](LPApplicationCompatibilityQuirks, "supportsLPLinkViewAutolayout"))
  {
    ++self->_suppressNeedsResizeCount;
    -[LPLinkView _computePresentationPropertiesFromMetadataIfNeeded](self, "_computePresentationPropertiesFromMetadataIfNeeded");
    v12.receiver = self;
    v12.super_class = (Class)LPLinkView;
    -[LPLinkView intrinsicContentSize](&v12, sel_intrinsicContentSize);
    v4 = v3;
    v6 = v5;
    --self->_suppressNeedsResizeCount;
  }
  else
  {
    -[LPTheme maximumWidth](self->_theme, "maximumWidth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    -[LPLinkView sizeThatFits:](self, "sizeThatFits:");
    v4 = v8;
    v6 = v9;

  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  unsigned int loggingID;
  double left;
  double top;
  double bottom;
  double right;
  double v20;
  double v21;
  _DWORD v22[2];
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x1E0C80C00];
  ++self->_suppressNeedsResizeCount;
  -[LPLinkView _computePresentationPropertiesFromMetadataIfNeeded](self, "_computePresentationPropertiesFromMetadataIfNeeded");
  -[LPTheme maximumWidth](self->_theme, "maximumWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = fmin(width, v7);

  v9 = floor(v8);
  -[LPLinkView _layoutLinkViewForSize:applyingLayout:](self, "_layoutLinkViewForSize:applyingLayout:", 0, v9 - (self->_contentInset.left + self->_contentInset.right), floor(height) - (self->_contentInset.top + self->_contentInset.bottom));
  v11 = v10;
  v13 = v12;
  if (v10 > v9)
  {
    v14 = LPLogChannelUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      loggingID = self->_loggingID;
      v22[0] = 67109632;
      v22[1] = loggingID;
      v23 = 2048;
      v24 = v11;
      v25 = 2048;
      v26 = v9;
      _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: laid out to larger than maximum requested size (%g > %g)", (uint8_t *)v22, 0x1Cu);
    }
  }
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  --self->_suppressNeedsResizeCount;
  v20 = v11 - (-right - left);
  v21 = v13 - (-bottom - top);
  result.height = v21;
  result.width = v20;
  return result;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

- (void)animateOutAndRemoveViews
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateOut");

  -[LPLinkViewComponents media](self->_components, "media");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[LPLinkViewComponents quote](self->_components, "quote");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[LPLinkViewComponents backgroundImage](self->_components, "backgroundImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "valueForKey:", CFSTR("associatedView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", 0, CFSTR("associatedView"));
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationForKey:", CFSTR("widthSpring"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v12)
  {

LABEL_5:
    -[UIView layer](self->_animationView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("widthSpring"));

    -[UIView layer](self->_animationView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAnimationForKey:", CFSTR("heightSpring"));

    -[LPLinkView _setMaskEnabledForAnimation:](self, "_setMaskEnabledForAnimation:", 0);
    goto LABEL_6;
  }
  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationForKey:", CFSTR("heightSpring"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v12)
    goto LABEL_5;
LABEL_6:

}

- (void)animateInViews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;

  -[LPLinkView layer](self, "layer");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CD2848], "_lp_springWithMass:stiffness:damping:", 2.0, 100.0, 50.0);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v36, "setFromValue:", &unk_1E44EEBA0);
  objc_msgSend(v36, "setToValue:", &unk_1E44EEBB8);
  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animateInWithBaseAnimation:currentTime:", v36, v4);

  -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateInWithBaseAnimation:currentTime:", v36, v4);

  -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animateInWithBaseAnimation:currentTime:", v36, v4);

  -[LPLinkViewComponents media](self->_components, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4 + 0.05;
  objc_msgSend(v36, "_lp_copyWithBeginTime:", v4 + 0.05);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v11, CFSTR("fadeIn"));

  -[LPLinkViewComponents quote](self->_components, "quote");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4 + 0.285;
  objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v15, CFSTR("fadeIn"));

  -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v18, CFSTR("fadeIn"));

  -[LPLinkViewComponents backgroundImage](self->_components, "backgroundImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v21, CFSTR("fadeIn"));

  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "opacity");
  v25 = v24;

  if (v25 == 0.0)
  {
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 1.0;
    objc_msgSend(v27, "setOpacity:", v28);

    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_lp_copyWithBeginTime:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAnimation:forKey:", v31, CFSTR("fadeIn"));

  }
  -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addAnimation:forKey:", v34, CFSTR("fadeIn"));

}

- (void)_setMaskImage:(id)a3
{
  id v4;
  _TtC16LinkPresentation19LPAnimationMaskView *animationMaskView;
  _TtC16LinkPresentation19LPAnimationMaskView *v6;
  _TtC16LinkPresentation19LPAnimationMaskView *v7;
  id v8;

  v4 = a3;
  animationMaskView = self->_animationMaskView;
  v8 = v4;
  if (!animationMaskView)
  {
    v6 = objc_alloc_init(_TtC16LinkPresentation19LPAnimationMaskView);
    v7 = self->_animationMaskView;
    self->_animationMaskView = v6;

    animationMaskView = self->_animationMaskView;
    v4 = v8;
  }
  -[LPAnimationMaskView setImage:](animationMaskView, "setImage:", v4);
  -[LPAnimationMaskView setAnimationOrigin:](self->_animationMaskView, "setAnimationOrigin:", self->_animationOrigin);

}

- (void)_setAnimationOrigin:(int64_t)a3
{
  self->_animationOrigin = a3;
  -[LPAnimationMaskView setAnimationOrigin:](self->_animationMaskView, "setAnimationOrigin:");
}

- (void)animateFromOldFrame:(CGRect)a3 oldMediaBackgroundFrame:(CGRect)a4 oldCaptionBarView:(id)a5
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v12;
  BOOL v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL IsNull;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  int64_t animationOrigin;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int64_t v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  BOOL v129;
  id v130;
  CGRect v131;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v130 = a5;
  -[LPLinkView frame](self, "frame");
  v13 = v10 == v12;
  if (v9 != v14)
    v13 = 0;
  v129 = v13;
  objc_msgSend(MEMORY[0x1E0CD2848], "_lp_springWithMass:stiffness:damping:", 2.0, 300.0, 37.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkView frame](self, "frame");
  if (v16 != v10)
  {
    v17 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v17, "setKeyPath:", CFSTR("bounds.size.width"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFromValue:", v18);

    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v19, "numberWithDouble:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setToValue:", v21);

    -[LPAnimationMaskView imageView](self->_animationMaskView, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAnimation:forKey:", v17, CFSTR("maskWidthSpring"));

    v24 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v24, "setDelegate:", self);
    objc_msgSend(v24, "setRemovedOnCompletion:", 0);
    objc_msgSend(v24, "setValue:forKey:", self->_animationView, CFSTR("associatedView"));
    objc_msgSend(v24, "setKeyPath:", CFSTR("bounds.size.width"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFromValue:", v25);

    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v26, "numberWithDouble:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setToValue:", v28);

    -[UIView layer](self->_animationView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAnimation:forKey:", v24, CFSTR("widthSpring"));

    if (-[LPLinkView _animationOrigin](self, "_animationOrigin") == 1
      && self->_needsMessagesTranscriptPushCounterAnimation)
    {
      v30 = (void *)objc_msgSend(v17, "copy");
      -[LPAnimationMaskView imageView](self->_animationMaskView, "imageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addAnimation:forKey:", v30, CFSTR("imageViewAnimation"));

      objc_msgSend(MEMORY[0x1E0CD2710], "animation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDuration:", 0.3);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTimingFunction:", v34);

      objc_msgSend(v33, "setKeyPath:", CFSTR("transform.translation.x"));
      v35 = (void *)MEMORY[0x1E0CB37E8];
      -[LPLinkView frame](self, "frame");
      objc_msgSend(v35, "numberWithDouble:", v10 - v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFromValue:", v37);

      objc_msgSend(v33, "setToValue:", &unk_1E44EEBA0);
      -[UIView layer](self->_animationView, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addAnimation:forKey:", v33, CFSTR("horizontalSlide"));

      -[LPAnimationMaskView layer](self->_animationMaskView, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addAnimation:forKey:", v33, CFSTR("horizontalSlide"));

    }
    if (!-[LPLinkView _animationOrigin](self, "_animationOrigin"))
    {
      v40 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v40, "setKeyPath:", CFSTR("transform.translation.x"));
      v41 = (void *)MEMORY[0x1E0CB37E8];
      -[LPLinkView frame](self, "frame");
      objc_msgSend(v41, "numberWithDouble:", v42 - v10);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFromValue:", v43);

      objc_msgSend(v40, "setToValue:", &unk_1E44EEBA0);
      -[LPAnimationMaskView imageView](self->_animationMaskView, "imageView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addAnimation:forKey:", v40, CFSTR("maskViewSpring"));

    }
  }
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46
    && (v131.origin.x = x,
        v131.origin.y = y,
        v131.size.width = width,
        v131.size.height = height,
        IsNull = CGRectIsNull(v131),
        v46,
        !IsNull))
  {
    -[LPLinkView frame](self, "frame");
    v55 = v54;
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "frame");
    v49 = v55 - v56 - (v9 - height);
  }
  else
  {
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v9;
    if (!v48)
      goto LABEL_16;
    -[LPLinkView frame](self, "frame");
    v51 = v50;
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "frame");
    v49 = v51 - v53;
  }

LABEL_16:
  -[LPLinkView frame](self, "frame");
  if (v57 != v9)
  {
    v58 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v58, "setKeyPath:", CFSTR("bounds.size.height"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFromValue:", v59);

    v60 = (void *)MEMORY[0x1E0CB37E8];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v60, "numberWithDouble:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setToValue:", v62);

    -[LPAnimationMaskView imageView](self->_animationMaskView, "imageView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "layer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addAnimation:forKey:", v58, CFSTR("maskHeightSpring"));

    v65 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v65, "setDelegate:", self);
    objc_msgSend(v65, "setRemovedOnCompletion:", 0);
    objc_msgSend(v65, "setValue:forKey:", self->_animationView, CFSTR("associatedView"));
    objc_msgSend(v65, "setKeyPath:", CFSTR("bounds.size.height"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFromValue:", v66);

    v67 = (void *)MEMORY[0x1E0CB37E8];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v67, "numberWithDouble:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setToValue:", v69);

    -[UIView layer](self->_animationView, "layer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addAnimation:forKey:", v65, CFSTR("heightSpring"));

    v71 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v71, "setKeyPath:", CFSTR("transform.translation"));
    if (-[LPLinkView _animationOrigin](self, "_animationOrigin") == 1
      && self->_needsMessagesTranscriptPushCounterAnimation)
    {
      v72 = objc_alloc_init(MEMORY[0x1E0CD2710]);
      objc_msgSend(v72, "setDuration:", 0.3);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setTimingFunction:", v73);

      objc_msgSend(v72, "setKeyPath:", CFSTR("transform.translation.y"));
      v74 = (void *)MEMORY[0x1E0CB37E8];
      -[LPLinkView frame](self, "frame");
      objc_msgSend(v74, "numberWithDouble:", v9 - v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setFromValue:", v76);

      objc_msgSend(v72, "setToValue:", &unk_1E44EEBA0);
      -[UIView layer](self->_animationView, "layer");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addAnimation:forKey:", v72, CFSTR("verticalSlide"));

      -[LPAnimationMaskView layer](self->_animationMaskView, "layer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addAnimation:forKey:", v72, CFSTR("verticalSlide"));

    }
    animationOrigin = self->_animationOrigin;
    if (animationOrigin == 2)
    {
      -[LPLinkView frame](self, "frame");
      v80 = (v10 - v82) * 0.5;
    }
    else
    {
      v80 = 0.0;
      if (animationOrigin == 1)
      {
        -[LPLinkView frame](self, "frame");
        v80 = v10 - v81;
      }
    }
    v83 = (void *)MEMORY[0x1E0CB3B18];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v83, "_lp_valueWithCGSize:", v80, v9 - v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setFromValue:", v85);

    v86 = *MEMORY[0x1E0C9D820];
    v87 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(MEMORY[0x1E0CB3B18], "_lp_valueWithCGSize:", *MEMORY[0x1E0C9D820], v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setToValue:", v88);

    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "layer");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addAnimation:forKey:", v71, CFSTR("transformSpring"));

    -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "layer");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addAnimation:forKey:", v71, CFSTR("transformSpring"));

    v93 = (void *)objc_msgSend(v71, "copy");
    v94 = self->_animationOrigin;
    if (v94 == 2)
    {
      -[LPLinkView frame](self, "frame");
      v95 = (v97 - v10) * 0.5;
    }
    else
    {
      v95 = 0.0;
      if (v94 == 1)
      {
        -[LPLinkView frame](self, "frame");
        v95 = v96 - v10;
      }
    }
    v98 = (void *)MEMORY[0x1E0CB3B18];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v98, "_lp_valueWithCGSize:", v95, v99 - v9);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setToValue:", v100);

    objc_msgSend(MEMORY[0x1E0CB3B18], "_lp_valueWithCGSize:", v86, v87);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setFromValue:", v101);

    objc_msgSend(v130, "layer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "addAnimation:forKey:", v93, CFSTR("previousCaptionBarPositionMaintaining"));

    v103 = (void *)objc_msgSend(v71, "copy");
    v104 = (void *)MEMORY[0x1E0CB3B18];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v104, "_lp_valueWithCGSize:", v80, v49 + v9 - v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setFromValue:", v106);

    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "layer");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "addAnimation:forKey:", v103, CFSTR("captionBarAdjustedTransformSpring"));

  }
  if (!-[LPLinkView _animationOrigin](self, "_animationOrigin"))
  {
    v109 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v109, "setKeyPath:", CFSTR("transform.translation.y"));
    v110 = (void *)MEMORY[0x1E0CB37E8];
    -[LPLinkView frame](self, "frame");
    objc_msgSend(v110, "numberWithDouble:", v9 - v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setFromValue:", v112);

    objc_msgSend(v109, "setToValue:", &unk_1E44EEBA0);
    -[LPAnimationMaskView imageView](self->_animationMaskView, "imageView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "layer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addAnimation:forKey:", v109, CFSTR("maskViewYSpring"));

    -[UIView layer](self->_animationView, "layer");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "addAnimation:forKey:", v109, CFSTR("maskViewYSpring"));

  }
  v116 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v116, "setKeyPath:", CFSTR("transform.scale.x"));
  v117 = (void *)MEMORY[0x1E0CB37E8];
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "frame");
  objc_msgSend(v117, "numberWithDouble:", v10 / v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setFromValue:", v120);

  objc_msgSend(v116, "setToValue:", &unk_1E44EEBB8);
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "layer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "addAnimation:forKey:", v116, CFSTR("mediaScaleSpring"));

  v123 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v123, "setKeyPath:", CFSTR("transform.scale.y"));
  v124 = (void *)MEMORY[0x1E0CB37E8];
  -[LPLinkView frame](self, "frame");
  objc_msgSend(v124, "numberWithDouble:", v9 / v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setFromValue:", v126);

  objc_msgSend(v123, "setToValue:", &unk_1E44EEBB8);
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "layer");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "addAnimation:forKey:", v123, CFSTR("mediaScaleYSpring"));

  if (!v129)
    -[LPLinkView _setMaskEnabledForAnimation:](self, "_setMaskEnabledForAnimation:", 1);

}

- (void)_setSuppressChatKitMask:(BOOL)a3
{
  _BOOL8 v3;
  char isKindOfClass;
  char v6;
  id v7;
  id v8;
  id v9;

  v3 = a3;
  -[LPLinkView superview](self, "superview");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKBalloonView"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[LPLinkView superview](self, "superview");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[LPLinkView superview](self, "superview");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSuppressMask:", v3);

    }
  }
}

- (void)_updateMasking
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 maskEnabledForAnimation;
  _TtC16LinkPresentation19LPAnimationMaskView *animationMaskView;

  -[LPLinkView maskView](self, "maskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_maskEnabled)
  {
    if (!v3)
    {
      -[LPLinkView _setSuppressChatKitMask:](self, "_setSuppressChatKitMask:", 1);
      goto LABEL_7;
    }
  }
  else
  {
    v4 = v3 == 0;
    maskEnabledForAnimation = self->_maskEnabledForAnimation;
    if (((v4 ^ self->_maskEnabledForAnimation) & 1) == 0)
    {
      -[LPLinkView _setSuppressChatKitMask:](self, "_setSuppressChatKitMask:", maskEnabledForAnimation);
      if (!maskEnabledForAnimation)
      {
        animationMaskView = 0;
        goto LABEL_8;
      }
LABEL_7:
      animationMaskView = self->_animationMaskView;
LABEL_8:
      -[LPLinkView setMaskView:](self, "setMaskView:", animationMaskView);
    }
  }
}

- (void)_setMaskEnabled:(BOOL)a3
{
  self->_maskEnabled = a3;
  -[LPLinkView _updateMasking](self, "_updateMasking");
}

- (void)_setMaskEnabledForAnimation:(BOOL)a3
{
  self->_maskEnabledForAnimation = a3;
  -[LPLinkView _updateMasking](self, "_updateMasking");
}

- (void)animateBackgroundColor
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v4, "setDuration:", 0.65);
  objc_msgSend(v4, "setKeyPath:", CFSTR("backgroundColor"));
  objc_msgSend(v4, "setToValue:", -[UIColor CGColor](self->_backgroundColor, "CGColor"));
  -[UIView layer](self->_animationView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v4, CFSTR("backgroundColorTransition"));

}

- (BOOL)_layoutHeightDependsOnWidth
{
  objc_super v4;

  if (+[LPApplicationCompatibilityQuirks supportsLPLinkViewAutolayout](LPApplicationCompatibilityQuirks, "supportsLPLinkViewAutolayout"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)LPLinkView;
  return -[LPLinkView _layoutHeightDependsOnWidth](&v4, sel__layoutHeightDependsOnWidth);
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  objc_super v4;

  if (+[LPApplicationCompatibilityQuirks supportsLPLinkViewAutolayout](LPApplicationCompatibilityQuirks, "supportsLPLinkViewAutolayout"))
  {
    return 3;
  }
  v4.receiver = self;
  v4.super_class = (Class)LPLinkView;
  return -[LPLinkView _axesForDerivingIntrinsicContentSizeFromLayoutSize](&v4, sel__axesForDerivingIntrinsicContentSizeFromLayoutSize);
}

- (id)_createComponents
{
  LPLinkViewComponents *v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  LPBackgroundColorView *v23;
  LPBackgroundColorView *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc_init(LPLinkViewComponents);
  if (-[LPLinkView _useProgressSpinner](self, "_useProgressSpinner")
    && (sizeClassAllowsLargeProgressSpinner(self->_preferredSizeClass) & 1) != 0)
  {
    -[LPLinkView _createProgressSpinner](self, "_createProgressSpinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setProgressSpinner:](v3, "setProgressSpinner:", v4);
LABEL_32:

    return v3;
  }
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAnyContent");

  v7 = -[LPConcretePresentationProperties hasMedia](self->_properties, "hasMedia");
  -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 1;
  else
    v9 = v7;
  if (v9 == 1)
  {
    -[LPWebLinkPresentationProperties mediaTopCaptionBar](self->_properties, "mediaTopCaptionBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasAnyContent");

    -[LPWebLinkPresentationProperties mediaBottomCaptionBar](self->_properties, "mediaBottomCaptionBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasAnyContent");

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  -[LPWebLinkPresentationProperties domainNameForIndicator](self->_properties, "domainNameForIndicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPWebLinkPresentationProperties backgroundImage](self->_properties, "backgroundImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[NSArray count](self->_contactsForAttribution, "count");
  if (v6)
  {
    -[LPLinkView _createCaptionBar](self, "_createCaptionBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setCaptionBar:](v3, "setCaptionBar:", v17);

    if (!v7)
      goto LABEL_12;
  }
  else if (!v7)
  {
LABEL_12:
    v18 = 0;
    if (v11)
      goto LABEL_13;
    goto LABEL_18;
  }
  -[LPLinkView _createMediaView](self, "_createMediaView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkViewComponents setMedia:](v3, "setMedia:", v21);

  v18 = 1;
  if ((v11 & 1) != 0)
  {
LABEL_13:
    -[LPLinkView _createMediaTopCaptionBarView](self, "_createMediaTopCaptionBarView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setMediaTopCaptionBar:](v3, "setMediaTopCaptionBar:", v19);

    if ((v13 & 1) == 0)
      goto LABEL_14;
LABEL_19:
    -[LPLinkView _createMediaBottomCaptionBarView](self, "_createMediaBottomCaptionBarView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setMediaBottomCaptionBar:](v3, "setMediaBottomCaptionBar:", v22);

    if (v8)
      goto LABEL_15;
LABEL_20:
    if (!v18)
      goto LABEL_26;
    goto LABEL_21;
  }
LABEL_18:
  if (v13)
    goto LABEL_19;
LABEL_14:
  if (!v8)
    goto LABEL_20;
LABEL_15:
  -[LPLinkView _createQuotedTextView](self, "_createQuotedTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkViewComponents setQuote:](v3, "setQuote:", v20);

LABEL_21:
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v23 = (LPBackgroundColorView *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
    v24 = objc_alloc_init(LPBackgroundColorView);
  -[LPLinkViewComponents setMediaBackground:](v3, "setMediaBackground:", v24);
  if (!v23)

LABEL_26:
  if (v14)
  {
    -[LPLinkView _createDomainNameIndicator](self, "_createDomainNameIndicator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setDomainNameIndicator:](v3, "setDomainNameIndicator:", v25);

  }
  if (v15)
  {
    -[LPLinkView _createBackgroundImageView](self, "_createBackgroundImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setBackgroundImage:](v3, "setBackgroundImage:", v26);

  }
  if (v16)
  {
    -[LPLinkView _createContactsBadgeView](self, "_createContactsBadgeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents setContactsBadge:](v3, "setContactsBadge:", v4);
    goto LABEL_32;
  }
  return v3;
}

- (id)_mediaBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIColor *overrideMediaBackgroundColor;
  UIColor *v8;

  -[LPWebLinkPresentationProperties imageProperties](self->_properties, "imageProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPWebLinkPresentationProperties imageProperties](self->_properties, "imageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    overrideMediaBackgroundColor = self->_overrideMediaBackgroundColor;
    if (overrideMediaBackgroundColor || (overrideMediaBackgroundColor = self->_overrideBackgroundColor) != 0)
    {
      v8 = overrideMediaBackgroundColor;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v8;
  }
  return v6;
}

- (void)_rebuildSubviewsWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  LPLinkViewComponents *componentsForSizing;
  LPLinkViewComponents *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  LPLinkViewComponents *components;
  void *v15;
  UIView *contentView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  UIView *v23;
  void *v24;
  void *v25;
  UIView *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  UIView *v47;
  void *v48;
  void *v49;
  UIView *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  UIView *v56;
  void *v57;
  void *v58;
  UIView *v59;
  void *v60;
  void *v61;
  UIView *v62;
  void *v63;
  id v64;
  LPLinkViewComponents *v65;
  id v66;
  id v67;
  id v68;
  id v69;

  v3 = a3;
  self->_needsRebuild = 0;
  if (a3)
  {
    -[LPLinkView animateOutAndRemoveViews](self, "animateOutAndRemoveViews");
  }
  else
  {
    while (1)
    {
      -[UIView subviews](self->_contentView, "subviews");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v66, "count");

      if (!v8)
        break;
      -[UIView subviews](self->_contentView, "subviews");
      v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    while (1)
    {
      -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
      v68 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "subviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        break;
      -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
      v69 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");

    }
  }
  -[LPLinkView _uninstallTapGestureRecognizers](self, "_uninstallTapGestureRecognizers");
  -[LPLinkView _uninstallHighlightGestureRecognizers](self, "_uninstallHighlightGestureRecognizers");
  -[LPLinkView _updateCornerRadius](self, "_updateCornerRadius");
  v5 = -[LPLinkView _shouldClipAnimationView](self, "_shouldClipAnimationView");
  -[UIView layer](self->_animationView, "layer");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setMasksToBounds:", v5);

  v65 = self->_components;
  componentsForSizing = self->_componentsForSizing;
  if (componentsForSizing)
  {
    v7 = componentsForSizing;
  }
  else
  {
    -[LPLinkView _createComponents](self, "_createComponents");
    v7 = (LPLinkViewComponents *)objc_claimAutoreleasedReturnValue();
  }
  components = self->_components;
  self->_components = v7;

  -[LPLinkView _setEmphasizedTextExpression:](self, "_setEmphasizedTextExpression:", self->_emphasizedTextExpression);
  -[LPLinkViewComponents backgroundImage](self->_components, "backgroundImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    contentView = self->_contentView;
    -[LPLinkViewComponents backgroundImage](self->_components, "backgroundImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](contentView, "addSubview:", v17);

  }
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (-[LPWebLinkPresentationProperties style](self->_properties, "style") != 15 && v3)
    {
      -[LPLinkViewComponents mediaBackground](v65, "mediaBackground");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = 0;
        objc_msgSend(v21, "setOpacity:", v22);

      }
    }
    v23 = self->_contentView;
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v23, "addSubview:", v24);
  }
  else
  {
    -[LPLinkViewComponents mediaBackground](v65, "mediaBackground");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeFromSuperview");
  }

  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = self->_contentView;
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v26, "addSubview:", v27);

    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "button");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addTarget:action:", self, sel__captionBarButtonPressed_);

  }
  -[LPLinkView _sizeClassParameters](self, "_sizeClassParameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minimumMediaCornerRadius");
  if (v31 == 0.0)
  {
    v36 = 0.0;
  }
  else
  {
    -[LPLinkView _effectiveCornerRadius](self, "_effectiveCornerRadius");
    v33 = v32;
    -[LPLinkView _sizeClassParameters](self, "_sizeClassParameters");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "minimumMediaCornerRadius");
    v36 = fmax(v33, v35);

  }
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[LPLinkView _mediaBackgroundColor](self, "_mediaBackgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setColor:", v38);

    if (v36 != 0.0)
    {
      -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_lp_setCornerRadius:", v36);

    }
    v41 = self->_contentView;
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _lp_bringSubviewToFront:](v41, "_lp_bringSubviewToFront:", v42);

  }
  -[LPLinkViewComponents media](self->_components, "media");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents media](self->_components, "media");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v45);

  }
  -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = self->_contentView;
    -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v47, "addSubview:", v48);

  }
  -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v50 = self->_contentView;
    -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v50, "addSubview:", v51);

  }
  -[LPLinkViewComponents quote](self->_components, "quote");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents quote](self->_components, "quote");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v54);

  }
  -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v56 = self->_contentView;
    -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v56, "addSubview:", v57);

  }
  -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v59 = self->_contentView;
    -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v59, "addSubview:", v60);

  }
  -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    v62 = self->_contentView;
    -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v62, "addSubview:", v63);

  }
  if (v3)
  {
    -[LPLinkView animateInViews](self, "animateInViews");
    -[LPLinkView animateBackgroundColor](self, "animateBackgroundColor");
  }
  -[UIView _lp_setBackgroundColor:](self->_animationView, "_lp_setBackgroundColor:", self->_backgroundColor);
  -[LPLinkView _rebuildGestureRecognizersIfNeeded](self, "_rebuildGestureRecognizersIfNeeded");
  self->_hasEverBuilt = 1;

}

- (BOOL)_shouldUseAnimations
{
  if (self->_disableAnimations)
    return 0;
  else
    return !+[LPSettings disableAnimations](LPSettings, "disableAnimations");
}

- (void)_layoutLinkView
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  _BOOL8 shouldAnimateDuringNextBuild;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  LPLinkViewComponents *componentsForSizing;
  int64_t animationOrigin;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  id v50;
  CGRect v51;
  CGRect v52;

  -[LPLinkView _computePresentationPropertiesFromMetadataIfNeeded](self, "_computePresentationPropertiesFromMetadataIfNeeded");
  if (!self->_hasEverBuilt)
    -[LPLinkView _setupView](self, "_setupView");
  -[LPLinkView _updateCornerRadius](self, "_updateCornerRadius");
  if (!self->_hasEverBuilt)
    goto LABEL_6;
  if (!-[LPLinkView _shouldUseAnimations](self, "_shouldUseAnimations"))
    goto LABEL_6;
  -[UIView frame](self->_animationView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[LPLinkView bounds](self, "bounds");
  v52.origin.x = v11;
  v52.origin.y = v12;
  v52.size.width = v13;
  v52.size.height = v14;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  if (!CGRectEqualToRect(v51, v52))
    shouldAnimateDuringNextBuild = self->_shouldAnimateDuringNextBuild;
  else
LABEL_6:
    shouldAnimateDuringNextBuild = 0;
  -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v49 = v16;
    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v16 = v49;
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D628];
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  if (shouldAnimateDuringNextBuild)
  {
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v26 = objc_claimAutoreleasedReturnValue();
    componentsForSizing = self->_componentsForSizing;
    self->_componentsForSizing = 0;

    v50 = (id)v26;
  }
  else if (self->_needsRebuild)
  {
    v50 = 0;
  }
  else
  {
    v50 = 0;
    if (self->_hasEverBuilt)
      goto LABEL_18;
  }
  -[LPLinkView _rebuildSubviewsWithAnimation:](self, "_rebuildSubviewsWithAnimation:", shouldAnimateDuringNextBuild);
  if (v50)
    -[UIView _lp_bringSubviewToFront:](self, "_lp_bringSubviewToFront:");
  else
    v50 = 0;
LABEL_18:
  if (-[LPLinkView _shouldUseAnimations](self, "_shouldUseAnimations"))
  {
    animationOrigin = self->_animationOrigin;
    v29 = 0.0;
    v30 = 0.5;
    if (animationOrigin == 2)
      v29 = 0.5;
    else
      v30 = 1.0;
    if (animationOrigin == 1)
      v31 = 1.0;
    else
      v31 = v29;
    if (animationOrigin == 1)
      v32 = 1.0;
    else
      v32 = v30;
    -[UIView setAnchorPoint:](self->_animationView, "setAnchorPoint:", v31, v32, v30);
    -[LPAnimationMaskView setAnchorPoint:](self->_animationMaskView, "setAnchorPoint:", v31, v32);
    -[LPLinkViewComponents media](self->_components, "media");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAnchorPoint:", v31, v32);

    -[LPLinkViewComponents mediaBackground](self->_components, "mediaBackground");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAnchorPoint:", v31, v32);

  }
  -[LPLinkView bounds](self, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:", v35 + self->_contentInset.left, v36 + self->_contentInset.top, v37 - (self->_contentInset.left + self->_contentInset.right), v38 - (self->_contentInset.top + self->_contentInset.bottom));
  -[LPLinkView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  -[UIView frame](self->_animationView, "frame");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[LPLinkView bounds](self, "bounds");
  -[UIView setFrame:](self->_animationView, "setFrame:");
  -[LPLinkView bounds](self, "bounds");
  -[LPAnimationMaskView setFrame:](self->_animationMaskView, "setFrame:");
  -[UIView bounds](self->_contentView, "bounds");
  -[LPLinkView _layoutLinkViewForSize:applyingLayout:](self, "_layoutLinkViewForSize:applyingLayout:", 1, v47, v48);
  if (shouldAnimateDuringNextBuild)
  {
    -[LPLinkView animateFromOldFrame:oldMediaBackgroundFrame:oldCaptionBarView:](self, "animateFromOldFrame:oldMediaBackgroundFrame:oldCaptionBarView:", v50, v40, v42, v44, v46, v19, v21, v23, v25);
    self->_shouldAnimateDuringNextBuild = 0;
  }

}

- (void)_rebuildEntireView
{
  LPLinkViewComponents *componentsForSizing;

  self->_needsRebuild = 1;
  componentsForSizing = self->_componentsForSizing;
  self->_componentsForSizing = 0;

  -[LPLinkView _invalidateLayout](self, "_invalidateLayout");
}

- (void)_invalidateLayout
{
  id WeakRetained;

  -[LPLinkView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_suppressNeedsResizeCount && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "linkViewNeedsResize:", self);
  if (!self->_usesDeferredLayout)
  {
    -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
    -[LPLinkViewComponents applyToAllViews:](self->_components, "applyToAllViews:", &__block_literal_global_224);
  }

}

uint64_t __31__LPLinkView__invalidateLayout__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lp_setNeedsLayout");
}

- (void)_setAllowsTapToLoad:(BOOL)a3
{
  self->_allowsTapToLoad = a3;
  -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
}

- (void)_setEmphasizedTextExpression:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEmphasizedTextExpression:", v9);

  -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEmphasizedTextExpression:", v9);

  -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEmphasizedTextExpression:", v9);

  -[LPLinkViewComponents quote](self->_components, "quote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEmphasizedTextExpression:", v9);

}

- (id)_createProgressSpinner
{
  LPIndeterminateProgressSpinnerView *v3;
  void *v4;
  void *v5;
  LPIndeterminateProgressSpinnerView *v6;

  v3 = [LPIndeterminateProgressSpinnerView alloc];
  -[LPTheme progressSpinner](self->_theme, "progressSpinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties progressSpinner](self->_properties, "progressSpinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPIndeterminateProgressSpinnerView initWithHost:style:properties:](v3, "initWithHost:style:properties:", self, v4, v5);

  return v6;
}

- (id)_createCaptionBar
{
  LPCaptionBarView *v3;
  void *v4;
  void *v5;
  LPCaptionBarView *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  LPCollaborationFooterView *v13;
  LPCollaborationFooterPresentationProperties *collaborationFooter;
  void *v15;
  void *v16;
  LPCollaborationFooterView *v17;

  v3 = [LPCaptionBarView alloc];
  -[LPTheme captionBar](self->_theme, "captionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPCaptionBarView initWithHost:style:presentationProperties:](v3, "initWithHost:style:presentationProperties:", self, v4, v5);

  -[LPCaptionBarView setEmphasizedTextExpression:](v6, "setEmphasizedTextExpression:", self->_emphasizedTextExpression);
  -[LPCaptionBarView setUseProgressSpinner:](v6, "setUseProgressSpinner:", -[LPLinkView _useProgressSpinner](self, "_useProgressSpinner"));
  if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[LPCaptionBarView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderColor:", v8);

    -[LPCaptionBarView layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", 0.5);

  }
  if (!self->_disablePlayback && !self->_disablePlaybackControls)
  {
    -[LPWebLinkPresentationProperties inlinePlaybackInformation](self->_properties, "inlinePlaybackInformation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[LPWebLinkPresentationProperties inlinePlaybackInformation](self->_properties, "inlinePlaybackInformation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPCaptionBarView setPlaybackInformation:](v6, "setPlaybackInformation:", v12);

    }
  }
  if (self->_collaborationFooter)
  {
    v13 = [LPCollaborationFooterView alloc];
    collaborationFooter = self->_collaborationFooter;
    -[LPTheme captionBar](self->_theme, "captionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collaborationFooter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[LPCollaborationFooterView initWithHost:properties:style:](v13, "initWithHost:properties:style:", self, collaborationFooter, v16);
    -[LPCaptionBarView setCollaborationFooterView:](v6, "setCollaborationFooterView:", v17);

  }
  return v6;
}

- (id)_createMediaTopCaptionBarView
{
  LPCaptionBarView *v3;
  void *v4;
  void *v5;
  LPCaptionBarView *v6;
  void *v7;
  void *v8;

  v3 = [LPCaptionBarView alloc];
  -[LPTheme mediaTopCaptionBar](self->_theme, "mediaTopCaptionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties mediaTopCaptionBar](self->_properties, "mediaTopCaptionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPCaptionBarView initWithHost:style:presentationProperties:](v3, "initWithHost:style:presentationProperties:", self, v4, v5);

  -[LPCaptionBarView setEmphasizedTextExpression:](v6, "setEmphasizedTextExpression:", self->_emphasizedTextExpression);
  -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _lp_setForceLTR:](v6, "_lp_setForceLTR:", objc_msgSend(v8, "_lp_isLTRText"));

  }
  -[LPCaptionBarView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
  return v6;
}

- (id)_createMediaBottomCaptionBarView
{
  LPCaptionBarView *v3;
  void *v4;
  void *v5;
  LPCaptionBarView *v6;
  void *v7;
  void *v8;

  v3 = [LPCaptionBarView alloc];
  -[LPTheme mediaBottomCaptionBar](self->_theme, "mediaBottomCaptionBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties mediaBottomCaptionBar](self->_properties, "mediaBottomCaptionBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPCaptionBarView initWithHost:style:presentationProperties:](v3, "initWithHost:style:presentationProperties:", self, v4, v5);

  -[LPCaptionBarView setEmphasizedTextExpression:](v6, "setEmphasizedTextExpression:", self->_emphasizedTextExpression);
  -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _lp_setForceLTR:](v6, "_lp_setForceLTR:", objc_msgSend(v8, "_lp_isLTRText"));

  }
  -[LPCaptionBarView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
  return v6;
}

- (id)_createTapToLoadView
{
  LPTapToLoadView *v3;
  void *v4;
  LPTapToLoadView *v5;

  v3 = [LPTapToLoadView alloc];
  -[LPTheme tapToLoad](self->_theme, "tapToLoad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LPTapToLoadView initWithHost:style:](v3, "initWithHost:style:", self, v4);

  -[LPTapToLoadView setTapToLoadViewDelegate:](v5, "setTapToLoadViewDelegate:", self);
  return v5;
}

- (id)_videoViewConfiguration
{
  LPVisualMediaViewConfiguration *v3;
  _BOOL4 v4;
  double v5;

  v3 = objc_alloc_init(LPVisualMediaViewConfiguration);
  -[LPVisualMediaViewConfiguration setDisablePlayback:](v3, "setDisablePlayback:", self->_disablePlayback);
  -[LPVisualMediaViewConfiguration setDisablePlaybackControls:](v3, "setDisablePlaybackControls:", self->_disablePlaybackControls);
  -[LPVisualMediaViewConfiguration setDisableAutoPlay:](v3, "setDisableAutoPlay:", self->_disableAutoPlay);
  -[LPVisualMediaViewConfiguration setAllowsLoadingMediaWithAutoPlayDisabled:](v3, "setAllowsLoadingMediaWithAutoPlayDisabled:", self->_allowsLoadingMediaWithAutoPlayDisabled);
  v4 = -[LPLinkView _shouldApplyCornerRadius](self, "_shouldApplyCornerRadius");
  v5 = 28.0;
  if (v4)
    -[LPLinkView _effectiveCornerRadius](self, "_effectiveCornerRadius", 28.0);
  -[LPVisualMediaViewConfiguration setFullScreenTransitionCornerRadius:](v3, "setFullScreenTransitionCornerRadius:", v5);
  return v3;
}

- (id)_createMediaViewForProperties:(id)a3
{
  id v4;
  LPImageView *v5;
  void *v6;
  void *v7;
  LPYouTubeVideoView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  LPStreamingVideoView *v19;
  void *v21;
  int v22;
  LPImageView *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  LPMultipleImageView *v29;
  LPImageView *v30;

  v4 = a3;
  if (objc_msgSend(v4, "style") != 15)
  {
    objc_msgSend(v4, "video");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "youTubeURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [LPYouTubeVideoView alloc];
      objc_msgSend(v4, "video");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPTheme mediaVideo](self->_theme, "mediaVideo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPTheme mediaImage](self->_theme, "mediaImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkView _videoViewConfiguration](self, "_videoViewConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[LPYouTubeVideoView initWithHost:video:style:posterFrame:posterFrameStyle:configuration:](v8, "initWithHost:video:style:posterFrame:posterFrameStyle:configuration:", self, v9, v10, v11, v12, v13);
    }
    else
    {
      objc_msgSend(v4, "video");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "streamingURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

      }
      else
      {
        objc_msgSend(v4, "video");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_msgSend(v4, "image");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "_isFallbackIcon");

          if (v22)
          {
            v23 = [LPImageView alloc];
            objc_msgSend(v4, "image");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[LPTheme placeholderImage](self->_theme, "placeholderImage");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[LPImageView initWithHost:image:properties:style:](v23, "initWithHost:image:properties:style:", self, v9, 0, v10);
          }
          else
          {
            objc_msgSend(v4, "image");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v25)
            {
              v5 = 0;
              goto LABEL_12;
            }
            objc_msgSend(v4, "alternateImages");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              v30 = [LPImageView alloc];
              objc_msgSend(v4, "image");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "imageProperties");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[LPTheme mediaImage](self->_theme, "mediaImage");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = -[LPImageView initWithHost:image:properties:style:](v30, "initWithHost:image:properties:style:", self, v9, v10, v11);
              goto LABEL_10;
            }
            objc_msgSend(v4, "alternateImages");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)objc_msgSend(v27, "mutableCopy");

            objc_msgSend(v4, "image");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "insertObject:atIndex:", v28, 0);

            v29 = [LPMultipleImageView alloc];
            -[LPTheme mediaImage](self->_theme, "mediaImage");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = -[LPMultipleImageView initWithHost:images:style:](v29, "initWithHost:images:style:", self, v9, v10);
          }
          v5 = (LPImageView *)v24;
          goto LABEL_11;
        }
      }
      v19 = [LPStreamingVideoView alloc];
      objc_msgSend(v4, "video");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPTheme mediaVideo](self->_theme, "mediaVideo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPTheme mediaImage](self->_theme, "mediaImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkView _videoViewConfiguration](self, "_videoViewConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[LPStreamingVideoView initWithHost:video:style:posterFrame:posterFrameStyle:configuration:](v19, "initWithHost:video:style:posterFrame:posterFrameStyle:configuration:", self, v9, v10, v11, v12, v13);
    }
    v5 = (LPImageView *)v14;

LABEL_10:
LABEL_11:

    goto LABEL_12;
  }
  -[LPLinkView _createTapToLoadView](self, "_createTapToLoadView");
  v5 = (LPImageView *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

- (id)_createMediaView
{
  return -[LPLinkView _createMediaViewForProperties:](self, "_createMediaViewForProperties:", self->_properties);
}

- (id)_createQuotedTextView
{
  LPQuoteView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LPQuoteView *v8;
  void *v9;

  v3 = [LPQuoteView alloc];
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);
  -[LPTheme quotedText](self->_theme, "quotedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LPQuoteView initWithHost:text:style:](v3, "initWithHost:text:style:", self, v6, v7);

  -[LPQuoteView setEmphasizedTextExpression:](v8, "setEmphasizedTextExpression:", self->_emphasizedTextExpression);
  -[LPWebLinkPresentationProperties quotedText](self->_properties, "quotedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _lp_setForceLTR:](v8, "_lp_setForceLTR:", objc_msgSend(v9, "_lp_isLTRText"));

  return v8;
}

- (id)_createDomainNameIndicator
{
  LPDomainNameIndicator *v3;
  void *v4;
  LPDomainNameIndicator *v5;

  v3 = [LPDomainNameIndicator alloc];
  -[LPWebLinkPresentationProperties domainNameForIndicator](self->_properties, "domainNameForIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LPDomainNameIndicator initWithHost:domainName:theme:](v3, "initWithHost:domainName:theme:", self, v4, self->_theme);

  return v5;
}

- (id)_createBackgroundImageView
{
  void *v3;
  char v4;
  void *v6;
  LPImageView *v7;
  void *v8;
  void *v9;
  LPImageView *v10;
  _QWORD v11[5];

  if (self->_overrideBackgroundColor)
  {
    -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "usesBlurredBackground");

    if ((v4 & 1) != 0)
      return 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__LPLinkView__createBackgroundImageView__block_invoke;
  v11[3] = &unk_1E44A9D20;
  v11[4] = self;
  __40__LPLinkView__createBackgroundImageView__block_invoke((uint64_t)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [LPImageView alloc];
  -[LPWebLinkPresentationProperties backgroundImageProperties](self->_properties, "backgroundImageProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPTheme backgroundImage](self->_theme, "backgroundImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LPImageView initWithHost:image:properties:style:](v7, "initWithHost:image:properties:style:", self, v6, v8, v9);

  return v10;
}

LPImage *__40__LPLinkView__createBackgroundImageView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  LPImage *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  LPImage *v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "backgroundImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "captionBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesBlurredBackground");

  if ((v4 & 1) != 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 727))
    {
      v9 = objc_alloc(MEMORY[0x1E0DC3870]);
      objc_msgSend(v2, "platformImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_lp_CGImage");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      v7 = (void *)objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 5);

      v5 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v7);
      objc_msgSend(v2, "_darkInterfaceAlternativeImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x1E0DC3870]);
        objc_msgSend(v2, "_darkInterfaceAlternativeImage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "platformImage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_lp_CGImage");
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scale");
        v19 = (void *)objc_msgSend(v14, "initWithCGImage:scale:orientation:", v17, 5);

        v20 = -[LPImage initWithPlatformImage:]([LPImage alloc], "initWithPlatformImage:", v19);
        -[LPImage _setDarkInterfaceAlternativeImage:](v5, "_setDarkInterfaceAlternativeImage:", v20);

      }
      goto LABEL_8;
    }
    mapsBackgroundImage(v2);
    v5 = (LPImage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_darkInterfaceAlternativeImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v2, "_darkInterfaceAlternativeImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      mapsBackgroundImage(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImage _setDarkInterfaceAlternativeImage:](v5, "_setDarkInterfaceAlternativeImage:", v8);

LABEL_8:
    }
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (id)_createContactsBadgeView
{
  LPContactsBadgeView *v3;
  NSArray *contactsForAttribution;
  _BOOL8 highlightedForAttribution;
  void *v6;
  LPContactsBadgeView *v7;

  v3 = [LPContactsBadgeView alloc];
  contactsForAttribution = self->_contactsForAttribution;
  highlightedForAttribution = self->_highlightedForAttribution;
  -[LPTheme contactsBadgeStyle](self->_theme, "contactsBadgeStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LPContactsBadgeView initWithHost:contacts:highlighted:style:](v3, "initWithHost:contacts:highlighted:style:", self, contactsForAttribution, highlightedForAttribution, v6);

  return v7;
}

- (BOOL)linkHasMediaForComponentView:(id)a3
{
  return -[LPConcretePresentationProperties hasMedia](self->_properties, "hasMedia", a3);
}

- (int64_t)componentView:(id)a3 allowedImageFilterForFilter:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (a4 == 7 && !-[LPLinkView _isUsingAppClipPresentation](self, "_isUsingAppClipPresentation"))
    goto LABEL_5;
  if (-[LPLinkView _useLowMemoryImageFilters](self, "_useLowMemoryImageFilters"))
  {
    if ((unint64_t)(a4 - 5) < 2)
    {
LABEL_5:
      a4 = 3;
      goto LABEL_6;
    }
    if ((unint64_t)(a4 - 8) < 3)
      a4 = 1;
  }
LABEL_6:

  return a4;
}

- (void)componentViewDidTapCaptionButton:(id)a3 buttonType:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "_linkView:didTapCaptionButtonWithType:", self, a4);

}

- (id)componentView:(id)a3 playerForAudio:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "_linkView:playerForAudio:", self, v5),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[LPStreamingAudioPlayer playerWithAudio:](LPStreamingAudioPlayer, "playerWithAudio:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)downloadProgressForComponentView:(id)a3
{
  LPLinkMetadataDownloadProgressTransformer *v3;
  void *v4;

  v3 = -[LPLinkMetadataDownloadProgressTransformer initWithBytesLoaded:downloadState:metadata:]([LPLinkMetadataDownloadProgressTransformer alloc], "initWithBytesLoaded:downloadState:metadata:", self->_bytesLoaded, self->_sharedObjectDownloadState, self->_metadata);
  -[LPLinkMetadataDownloadProgressTransformer downloadProgressForTransformer:](v3, "downloadProgressForTransformer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)_layoutLinkViewForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  int *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double top;
  double left;
  double bottom;
  double right;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  double v29;
  uint64_t v30;
  unint64_t effectiveSizeClass;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  _BOOL4 v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  CGFloat v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  _BOOL4 v120;
  double v121;
  void *v122;
  double MaxY;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  CGFloat v137;
  double v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  BOOL v143;
  double v144;
  void *v145;
  double v146;
  void *v147;
  double v148;
  _BOOL4 IsNull;
  _BOOL4 v150;
  void *v151;
  double x;
  double y;
  double v154;
  double v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  void *v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  void *v209;
  void *v210;
  double v211;
  UIView *animationView;
  void *v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  void *v226;
  void *v227;
  double v228;
  double v229;
  double v230;
  double v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  double v239;
  CGFloat v240;
  double v241;
  CGFloat v242;
  double v243;
  CGFloat v244;
  double v245;
  CGFloat v246;
  double MaxX;
  double v248;
  void *v249;
  double v250;
  double v251;
  void *v252;
  double v253;
  double MinX;
  double v255;
  double v256;
  void *v257;
  double v258;
  CGFloat v259;
  double v260;
  CGFloat v261;
  double v262;
  double v263;
  double v264;
  CGFloat v265;
  _BOOL4 v266;
  void *v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  CGFloat v275;
  double v276;
  double v277;
  double v278;
  CGFloat v279;
  double v280;
  double v281;
  double v282;
  CGFloat rect;
  double recta;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double r1;
  double MinY;
  double v292;
  double v293;
  double v294;
  double v295;
  double height;
  double v297;
  double r2;
  double r2_8;
  double r2_16;
  double r2_24;
  double v302;
  double v303;
  double v304;
  _QWORD v305[5];
  CGSize result;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;
  CGRect v328;
  CGRect v329;
  CGRect v330;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v7 = &OBJC_IVAR___LPLinkView__componentsForSizing;
  if (a4)
    v7 = &OBJC_IVAR___LPLinkView__components;
  v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  if (!v8)
  {
    -[LPLinkView _createComponents](self, "_createComponents");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_componentsForSizing, v8);
  }
  v270 = width;
  if (!v4)
  {
    if (-[LPWebLinkPresentationProperties style](self->_properties, "style") == 15)
    {
      -[LPTheme tapToLoad](self->_theme, "tapToLoad");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "width");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      width = fmin(v11, width);

    }
    else if (self->_allowsSkinnyWidth)
    {
      objc_msgSend(v8, "media");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v305[0] = MEMORY[0x1E0C809B0];
        v305[1] = 3221225472;
        v305[2] = __52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke;
        v305[3] = &unk_1E44A9878;
        v305[4] = self;
        if (__52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke((uint64_t)v305))
        {
          -[LPTheme widthFractionForTallMedia](self->_theme, "widthFractionForTallMedia");
          width = ceil(width * v13);
        }
      }
    }
  }
  objc_msgSend(v8, "captionBar", *(_QWORD *)&v270);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C9D628];
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);

  r2_16 = v18;
  r2_24 = v17;
  v303 = v16;
  v304 = v15;
  if (v14)
  {
    top = self->_textSafeAreaInset.top;
    left = self->_textSafeAreaInset.left;
    bottom = self->_textSafeAreaInset.bottom;
    right = self->_textSafeAreaInset.right;
    objc_msgSend(v8, "captionBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextSafeAreaInset:", top, left, bottom, right);

    objc_msgSend(v8, "captionBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sizeThatFits:", width, height);
    r1 = v25;
    v27 = v26;

    if (self->_forceFlexibleWidth)
    {
      v28 = !v4;
    }
    else
    {
      v30 = -[LPWebLinkPresentationProperties style](self->_properties, "style");
      effectiveSizeClass = self->_effectiveSizeClass;
      objc_msgSend(v8, "quote");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "media");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = shouldUseFlexibleWidth(v30, effectiveSizeClass, v32 != 0, v33 != 0) & !v4;

    }
    if (v28)
      v34 = v27;
    else
      v34 = width;
    v29 = height - r1;
    v276 = 0.0;
    v285 = 0.0;
    v286 = v34;
  }
  else
  {
    r1 = v18;
    v285 = v15;
    v286 = v17;
    v276 = v16;
    v29 = height;
  }
  objc_msgSend(v8, "quote");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = self->_textSafeAreaInset.top;
    v37 = self->_textSafeAreaInset.left;
    v38 = self->_textSafeAreaInset.bottom;
    v39 = self->_textSafeAreaInset.right;
    objc_msgSend(v8, "quote");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setContentInset:", v36, v37, v38, v39);

    objc_msgSend(v8, "quote");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sizeThatFits:", width, v29);
    v275 = v42;
    v44 = v43;

    -[LPLinkRendererSizeClassParameters mediaFixedAspectRatio](self->_sizeClassParameters, "mediaFixedAspectRatio");
    if (v45 != 0.0)
    {
      -[LPLinkRendererSizeClassParameters mediaFixedAspectRatio](self->_sizeClassParameters, "mediaFixedAspectRatio");
      v44 = width / v46;
    }
    v47 = fmin(v44, v29);
    if (v4)
    {
      objc_msgSend(v8, "media");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v48)
        v47 = v29;
    }
    v29 = v29 - v47;
    v49 = 0.0;
    rect = 0.0;
    v292 = width;
  }
  else
  {
    v47 = r2_16;
    v275 = r2_24;
    v292 = r2_24;
    rect = v303;
    v49 = v304;
  }
  r2 = v49;
  objc_msgSend(v8, "media");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v8, "media");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sizeThatFits:", width, v29);
    v278 = v52;
    v54 = v53;

    -[LPLinkRendererSizeClassParameters mediaFixedAspectRatio](self->_sizeClassParameters, "mediaFixedAspectRatio");
    if (v55 == 0.0)
    {
      if (v4)
        v57 = v29;
      else
        v57 = v54;
    }
    else
    {
      -[LPLinkRendererSizeClassParameters mediaFixedAspectRatio](self->_sizeClassParameters, "mediaFixedAspectRatio");
      v57 = width / v56;
    }
    objc_msgSend(v8, "mediaTopCaptionBar");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v280 = r2_24;
    v281 = r2_16;
    MinY = v303;
    v282 = v304;
    if (v81)
    {
      v82 = self->_textSafeAreaInset.top;
      v83 = self->_textSafeAreaInset.left;
      v84 = self->_textSafeAreaInset.bottom;
      v85 = self->_textSafeAreaInset.right;
      objc_msgSend(v8, "mediaTopCaptionBar");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setTextSafeAreaInset:", v82, v83, v84, v85);

      objc_msgSend(v8, "mediaTopCaptionBar");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "sizeThatFits:", width, v57);
      v89 = v88;

      v309.origin.x = 0.0;
      v282 = 0.0;
      v309.origin.y = 0.0;
      v309.size.width = width;
      v309.size.height = v57;
      MinY = CGRectGetMinY(v309);
      v280 = width;
      v281 = fmin(v89, v57);
    }
    objc_msgSend(v8, "domainNameIndicator");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v295 = r2_16;
    v297 = r2_24;
    v59 = v303;
    v293 = v304;
    if (v90)
    {
      objc_msgSend(v8, "domainNameIndicator");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "sizeThatFits:", width, v57);
      v93 = v92;
      v95 = v94;

      v310.origin.x = 0.0;
      v310.origin.y = 0.0;
      v310.size.width = width;
      v310.size.height = v57;
      v59 = CGRectGetMinY(v310);
      v96 = -[UIView _lp_isLTR](self, "_lp_isLTR");
      v295 = fmin(v95, v57);
      v297 = fmin(v93, width);
      v97 = width - v297;
      if (v96)
        v97 = 0.0;
      v293 = v97;
    }
    objc_msgSend(v8, "mediaBottomCaptionBar");
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    if (v98)
    {
      v99 = self->_textSafeAreaInset.top;
      v100 = self->_textSafeAreaInset.left;
      v101 = self->_textSafeAreaInset.bottom;
      v102 = self->_textSafeAreaInset.right;
      objc_msgSend(v8, "mediaBottomCaptionBar");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setTextSafeAreaInset:", v99, v100, v101, v102);

      objc_msgSend(v8, "mediaBottomCaptionBar");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "sizeThatFits:", width, v57);
      v106 = v105;

      v311.origin.x = 0.0;
      v274 = 0.0;
      v311.origin.y = 0.0;
      v311.size.width = width;
      v311.size.height = v57;
      v272 = width;
      v273 = fmin(v106, v57);
      v287 = CGRectGetMaxY(v311) - v273;
      v294 = width;
      v302 = 0.0;
      r2_8 = 0.0;
    }
    else
    {
      v302 = 0.0;
      v272 = r2_24;
      v273 = r2_16;
      v287 = v303;
      v274 = v304;
      r2_8 = 0.0;
      v294 = width;
    }
  }
  else
  {
    objc_msgSend(v8, "quote");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = r2_16;
    v272 = r2_24;
    v273 = r2_16;
    v287 = v303;
    v274 = v304;
    v294 = r2_24;
    v295 = r2_16;
    v297 = r2_24;
    v59 = v303;
    v293 = v304;
    v280 = r2_24;
    v281 = r2_16;
    MinY = v303;
    v282 = v304;
    v278 = r2_24;
    v302 = v303;
    r2_8 = v304;
    if (v58)
    {
      objc_msgSend(v8, "mediaTopCaptionBar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v280 = r2_24;
      v281 = r2_16;
      MinY = v303;
      v282 = v304;
      if (v60)
      {
        v61 = self->_textSafeAreaInset.top;
        v62 = self->_textSafeAreaInset.left;
        v63 = self->_textSafeAreaInset.bottom;
        v64 = self->_textSafeAreaInset.right;
        objc_msgSend(v8, "mediaTopCaptionBar");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setTextSafeAreaInset:", v61, v62, v63, v64);

        objc_msgSend(v8, "mediaTopCaptionBar");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "sizeThatFits:", v292, v47);
        v68 = v67;

        v307.origin.x = r2;
        v307.origin.y = rect;
        v307.size.width = v292;
        v307.size.height = v47;
        MinY = CGRectGetMinY(v307);
        v280 = v292;
        v281 = fmin(v68, v47);
        v282 = r2;
      }
      objc_msgSend(v8, "mediaBottomCaptionBar");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        v70 = self->_textSafeAreaInset.top;
        v71 = self->_textSafeAreaInset.left;
        v72 = self->_textSafeAreaInset.bottom;
        v73 = self->_textSafeAreaInset.right;
        objc_msgSend(v8, "mediaBottomCaptionBar");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setTextSafeAreaInset:", v70, v71, v72, v73);

        objc_msgSend(v8, "mediaBottomCaptionBar");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "sizeThatFits:", v292, v47);
        v77 = v76;

        v308.origin.x = r2;
        v308.origin.y = rect;
        v308.size.width = v292;
        v308.size.height = v47;
        v272 = v292;
        v273 = fmin(v77, v47);
        v274 = r2;
        v57 = r2_16;
        v295 = r2_16;
        v287 = CGRectGetMaxY(v308) - v273;
        v78 = r2_24;
        v297 = r2_24;
        v80 = v303;
        v79 = v304;
      }
      else
      {
        v57 = r2_16;
        v78 = r2_24;
        v272 = r2_24;
        v273 = r2_16;
        v80 = v303;
        v287 = v303;
        v79 = v304;
        v274 = v304;
        v295 = r2_16;
        v297 = r2_24;
      }
      v59 = v80;
      v293 = v79;
      v294 = v78;
      v278 = v78;
      v302 = v80;
      r2_8 = v79;
    }
  }
  objc_msgSend(v8, "progressSpinner");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v288 = r2_24;
  v289 = r2_16;
  if (v107)
  {
    objc_msgSend(v8, "progressSpinner");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "sizeThatFits:", v271, height);
    v110 = v109;
    v112 = v111;

    v288 = v110;
    v304 = (v271 - v110) * 0.5;
    v289 = v112;
    v303 = (height - v112) * 0.5;
  }
  objc_msgSend(v8, "media");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v114 = v47;

    v115 = rect;
  }
  else
  {
    objc_msgSend(v8, "domainNameIndicator");
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    v115 = rect;
    if (v116)
    {
      v114 = v47;
      objc_msgSend(v8, "domainNameIndicator");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "sizeThatFits:", v297, v295);
      v297 = v118;
      v295 = v119;

      v120 = -[UIView _lp_isLTR](self, "_lp_isLTR");
      v121 = width - v297;
      v59 = 0.0;
      if (v120)
        v121 = 0.0;
      v293 = v121;
    }
    else
    {
      v114 = v47;
    }
  }
  objc_msgSend(v8, "media");
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (v122)
  {
    v312.origin.x = r2_8;
    v312.origin.y = v302;
    v312.size.width = v294;
    v312.size.height = v57;
    MaxY = CGRectGetMaxY(v312);
  }
  else
  {
    MaxY = 0.0;
  }
  objc_msgSend(v8, "media");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if (v124)
  {

  }
  else
  {
    objc_msgSend(v8, "domainNameIndicator");
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (v125)
    {
      v313.origin.x = v293;
      v313.origin.y = v59;
      v313.size.width = v297;
      v313.size.height = v295;
      MaxY = CGRectGetMaxY(v313);
    }
  }
  objc_msgSend(v8, "quote");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (v126)
  {
    v314.origin.x = r2;
    v314.origin.y = MaxY;
    v314.size.width = v292;
    v314.size.height = v114;
    v127 = CGRectGetMaxY(v314);
  }
  else
  {
    v127 = MaxY;
    MaxY = v115;
  }
  objc_msgSend(v8, "captionBar");
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = v278;
  if (v128)
    v130 = v127;
  else
    v130 = v276;
  v131 = v285;
  v132 = v286;
  recta = v130;
  v133 = r1;
  v134 = r2_8;
  v135 = v302;
  v136 = v57;
  v315 = CGRectUnion(*(CGRect *)(&v130 - 1), *(CGRect *)(&v129 - 2));
  v327.origin.x = r2;
  v327.origin.y = v115;
  v327.size.width = v275;
  v327.size.height = v114;
  v316 = CGRectUnion(v315, v327);
  v328.origin.y = v303;
  v328.origin.x = v304;
  v328.size.width = v288;
  v328.size.height = v289;
  v317 = CGRectUnion(v316, v328);
  v329.origin.x = v293;
  v329.origin.y = v59;
  v329.size.width = v297;
  v329.size.height = v295;
  v318 = CGRectUnion(v317, v329);
  v137 = v318.size.width;
  v138 = v318.size.height;
  -[LPWebLinkPresentationProperties minimumHeight](self->_properties, "minimumHeight", v318.origin.x, v318.origin.y);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if (v139)
  {
    -[LPWebLinkPresentationProperties minimumHeight](self->_properties, "minimumHeight");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "doubleValue");
    v142 = v141;

    v143 = v138 < v142;
    v144 = v138;
    if (v143)
    {
      -[LPWebLinkPresentationProperties minimumHeight](self->_properties, "minimumHeight");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "doubleValue");
      v144 = v146;

    }
  }
  else
  {
    v144 = v138;
  }
  objc_msgSend(v8, "quote");
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  v277 = v144;
  v279 = v137;
  if (v4 && v138 < height)
  {
    v148 = height - v138;
    if (!v147)
      v148 = v148 * 0.5;
    v302 = v302 + v148;
    v59 = v59 + v148;
    MinY = MinY + v148;
    v287 = v287 + v148;
    recta = recta + v148;
    MaxY = MaxY + v148;
  }
  if (v4)
  {
    v319.origin.x = r2_8;
    v319.origin.y = v302;
    v319.size.width = v294;
    v319.size.height = v57;
    IsNull = CGRectIsNull(v319);
    v320.origin.x = r2;
    v320.origin.y = MaxY;
    v320.size.width = v292;
    v320.size.height = v114;
    v150 = CGRectIsNull(v320);
    if (IsNull || v150)
    {
      if (IsNull)
      {
        if (v150)
        {
          objc_msgSend(v8, "mediaBackground");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        }
        else
        {
          objc_msgSend(v8, "mediaBackground");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "setFrame:", r2, MaxY, v292, v114);
        }
      }
      else
      {
        objc_msgSend(v8, "mediaBackground");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "setFrame:", r2_8, v302, v294, v57);
      }
    }
    else
    {
      v330.origin.x = r2;
      v321.origin.x = r2_8;
      v321.origin.y = v302;
      v321.size.width = v294;
      v321.size.height = v57;
      v330.origin.y = MaxY;
      v330.size.width = v292;
      v330.size.height = v114;
      v322 = CGRectUnion(v321, v330);
      x = v322.origin.x;
      y = v322.origin.y;
      v154 = v322.size.width;
      v155 = v322.size.height;
      objc_msgSend(v8, "mediaBackground");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setFrame:", x, y, v154, v155);
    }

    objc_msgSend(v8, "mediaBackground");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "convertRect:fromView:", self->_contentView, r2_8, v302, v294, v57);
    v158 = v157;
    v160 = v159;
    v162 = v161;
    v164 = v163;
    objc_msgSend(v8, "media");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "setFrame:", v158, v160, v162, v164);

    objc_msgSend(v8, "domainNameIndicator");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setFrame:", v293, v59, v297, v295);

    objc_msgSend(v8, "mediaTopCaptionBar");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "setFrame:", v282, MinY, v280, v281);

    objc_msgSend(v8, "mediaBottomCaptionBar");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "setFrame:", v274, v287, v272, v273);

    objc_msgSend(v8, "mediaBackground");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "convertRect:fromView:", self->_contentView, r2, MaxY, v292, v114);
    v171 = v170;
    v173 = v172;
    v175 = v174;
    v177 = v176;
    objc_msgSend(v8, "quote");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setFrame:", v171, v173, v175, v177);

    -[LPLinkView bounds](self, "bounds");
    -[LPLinkView convertRect:toView:](self, "convertRect:toView:", self->_contentView);
    v180 = v179;
    v182 = v181;
    v184 = v183;
    v186 = v185;
    objc_msgSend(v8, "backgroundImage");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "setFrame:", v180, v182, v184, v186);

    objc_msgSend(v8, "progressSpinner");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "setFrame:", v304, v303, v288, v289);

    -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v178) = objc_msgSend(v189, "usesBlurredBackground");

    if ((_DWORD)v178)
    {
      objc_msgSend(v8, "backgroundImage");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "frame");
      v192 = v191;
      v194 = v193;
      v196 = v195;
      v198 = v197;

      objc_msgSend(v8, "backgroundImage");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "setFrame:", v192, v57 + v194, v196, v198);

    }
    v201 = self->_contentInset.top;
    v200 = self->_contentInset.left;
    v202 = self->_contentInset.bottom;
    v203 = self->_contentInset.right;
    v323.origin.x = r2_8;
    v323.origin.y = v302;
    v323.size.width = v294;
    v323.size.height = v57;
    if (CGRectIsNull(v323))
      v204 = -v201;
    else
      v204 = 0.0;
    v205 = self->_textSafeAreaInset.top;
    v206 = self->_textSafeAreaInset.left;
    v207 = self->_textSafeAreaInset.bottom;
    v208 = self->_textSafeAreaInset.right;
    objc_msgSend(v8, "captionBar");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "setTextSafeAreaInset:", v205 - v204, v200 + v206, v202 + v207, v203 + v208);

    objc_msgSend(v8, "captionBar");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v211 = -v203 - v200;
    objc_msgSend(v210, "setFrame:", v285 - v200, recta + v204, v286 - v211, r1 - (v204 - v202));

    animationView = self->_animationView;
    objc_msgSend(v8, "captionBar");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "frame");
    -[UIView convertRect:fromView:](animationView, "convertRect:fromView:", self->_contentView, v214 - v200, v204 + v215, v216 - v211, v217 - (v204 - v202));
    v219 = v218;

    -[UIView bounds](self->_animationView, "bounds");
    v221 = v220;
    -[UIView bounds](self->_animationView, "bounds");
    v223 = v222;
    if (v219 == 0.0)
      v224 = 0.0;
    else
      v224 = v221;
    -[UIView setFrame:](self->_mediaHighlightView, "setFrame:", 0.0, 0.0, v224, v219);
    if (v223 - v219 == 0.0)
      v225 = 0.0;
    else
      v225 = v221;
    -[UIView setFrame:](self->_captionHighlightView, "setFrame:", 0.0, v219, v225, v223 - v219);
    objc_msgSend(v8, "contactsBadge");
    v226 = (void *)objc_claimAutoreleasedReturnValue();

    if (v226)
    {
      objc_msgSend(v8, "contactsBadge");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "sizeThatFits:", r2_24, r2_16);
      v229 = v228;
      v231 = v230;

      -[LPTheme contactsBadgeStyle](self->_theme, "contactsBadgeStyle");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = objc_msgSend(v232, "location");

      if (v233 == 1)
      {
        objc_msgSend(v8, "captionBar");
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v234, "_lp_layoutIfNeeded");

        objc_msgSend(v8, "captionBar");
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v235, "primaryIconView");
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "captionBar");
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "primaryIconView");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v238, "bounds");
        objc_msgSend(v236, "convertRect:toView:", self->_contentView);
        v240 = v239;
        v242 = v241;
        v244 = v243;
        v246 = v245;

        v324.origin.x = v240;
        v324.origin.y = v242;
        v324.size.width = v244;
        v324.size.height = v246;
        MaxX = CGRectGetMaxX(v324);
        v325.origin.x = v240;
        v325.origin.y = v242;
        v325.size.width = v244;
        v325.size.height = v246;
        v248 = CGRectGetMaxY(v325);
        -[LPTheme contactsBadgeStyle](self->_theme, "contactsBadgeStyle");
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v249, "iconOffset");
        v251 = v250;

        -[LPTheme contactsBadgeStyle](self->_theme, "contactsBadgeStyle");
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v252, "iconOffset");
        v253 = v248 - v231 * 0.5;
        MinX = MaxX - v229 * 0.5 + v251;
        v256 = v253 + v255;

      }
      else
      {
        objc_msgSend(v8, "mediaBackground");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "frame");
        v259 = v258;
        v261 = v260;
        v263 = v262;
        v265 = v264;

        v266 = -[UIView _lp_isLTR](self, "_lp_isLTR");
        v256 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        if (v266)
        {
          MinX = v263 - v229;
        }
        else
        {
          v326.origin.x = v259;
          v326.origin.y = v261;
          v326.size.width = v263;
          v326.size.height = v265;
          MinX = CGRectGetMinX(v326);
        }
      }
      objc_msgSend(v8, "contactsBadge");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v267, "setFrame:", MinX, v256, v229, v231);

    }
    if (self->_componentsNeedLayout)
    {
      self->_componentsNeedLayout = 0;
      objc_msgSend(v8, "applyToAllViews:", &__block_literal_global_247);
    }
  }

  v269 = v277;
  v268 = v279;
  result.height = v269;
  result.width = v268;
  return result;
}

BOOL __52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke(uint64_t a1)
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;
  _BOOL8 v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "captionBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonCaption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "captionButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "captionTextButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 != 0;

    }
  }

  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "style");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "quotedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "video");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = shouldUseSkinnyWidth(v11, v12, v13, v14, v8);

  return v5;
}

uint64_t __52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lp_setNeedsLayout");
}

- (CGRect)_primaryCaptionBarFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v15 = *MEMORY[0x1E0C9D628];
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)_playable
{
  void *v3;
  int v4;
  LPLinkViewComponents *components;
  void *v6;
  void *v7;

  -[LPLinkViewComponents media](self->_components, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE5E2720);

  components = self->_components;
  if (v4)
    -[LPLinkViewComponents media](components, "media");
  else
    -[LPLinkViewComponents captionBar](components, "captionBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_playMedia
{
  id v2;

  -[LPLinkView _playable](self, "_playable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaying:", 1);

}

- (void)_pauseMedia
{
  id v2;

  -[LPLinkView _playable](self, "_playable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaying:", 0);

}

- (BOOL)_isPlayingMedia
{
  void *v2;
  char v3;

  -[LPLinkView _playable](self, "_playable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (BOOL)_hasMediaToPlay
{
  void *v2;
  BOOL v3;

  -[LPLinkView _playable](self, "_playable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_resetMediaPlayback
{
  id v2;

  -[LPLinkView _playable](self, "_playable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetPlaybackState");

}

- (id)_primaryMediaView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[LPLinkViewComponents media](self->_components, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryIconView");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_animateWithDuration:(double)a3 animations:(id)a4
{
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", a4, a3);
}

- (void)componentViewDidChangeMediaState:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__LPLinkView_componentViewDidChangeMediaState___block_invoke;
  v3[3] = &unk_1E44A7CE8;
  v3[4] = self;
  -[LPLinkView _animateWithDuration:animations:](self, "_animateWithDuration:animations:", v3, 0.2);
}

void __47__LPLinkView_componentViewDidChangeMediaState___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  int v3;
  int v4;
  id v5;

  v1 = (id *)a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "contactsBadge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*((id *)v1[4] + 74), "contactsBadge");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1[4], "_isPlayingMedia");
    if (v3)
    {
      objc_msgSend(v1[4], "_playable");
      v1 = (id *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v1, "hasMuteControl");
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v5, "_lp_setOpacity:", (double)(v4 ^ 1u));
    if (v3)

  }
}

- (id)layoutExclusionsForView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3508];
    -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPLinkViewComponents contactsBadge](self->_components, "contactsBadge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutExclusionRect");
    objc_msgSend(v8, "convertRect:toView:", v4);
    objc_msgSend(v7, "bezierPathWithRect:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[LPLinkViewComponents mediaTopCaptionBar](self->_components, "mediaTopCaptionBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutExclusionsForView:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[LPLinkViewComponents mediaBottomCaptionBar](self->_components, "mediaBottomCaptionBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutExclusionsForView:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v16);

  }
  if (objc_msgSend(v5, "count"))
    v17 = v5;
  else
    v17 = 0;

  return v17;
}

- (int64_t)rendererStyleForComponentView:(id)a3
{
  return -[LPWebLinkPresentationProperties style](self->_properties, "style", a3);
}

- (BOOL)allowsVibrancyForComponentView:(id)a3
{
  BOOL result;
  void *v5;
  uint64_t v6;

  result = !self->_useCPURenderingForMaterials
        && (-[LPLinkView _themePlatform](self, "_themePlatform", a3) != 5
         || (-[LPLinkView traitCollection](self, "traitCollection"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v6 = objc_msgSend(v5, "userInterfaceStyle"),
             v5,
             v6 == 2))
        && self->_backgroundColorSupportsVibrancy;
  return result;
}

- (BOOL)allowsBadgingIconEdgeForComponentView:(id)a3
{
  void *v4;
  BOOL v5;

  -[LPTheme contactsBadgeStyle](self->_theme, "contactsBadgeStyle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "location") != 1 || -[NSArray count](self->_contactsForAttribution, "count") == 0;

  return v5;
}

- (BOOL)showingDisclosureViewForComponentView:(id)a3
{
  return self->_showingDisclosureView;
}

- (BOOL)allowsAsynchronousImageDecodingForComponentView:(id)a3
{
  return self->_allowsAsynchronousImageDecoding;
}

- (BOOL)usesBackgroundForSymbolImagesForComponentView:(id)a3
{
  return sizeClassRequiresLeadingIcon(self->_effectiveSizeClass);
}

- (void)_installHighlightGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents media](self->_components, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPLinkViewComponents media](self->_components, "media");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents quote](self->_components, "quote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LPLinkViewComponents quote](self->_components, "quote");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");

  }
}

- (void)_installTapGestureRecognizers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  -[LPLinkViewComponents captionBar](self->_components, "captionBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPLinkViewComponents captionBar](self->_components, "captionBar");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents media](self->_components, "media");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = (id)v4;
    -[LPLinkViewComponents media](self->_components, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      -[LPLinkViewComponents media](self->_components, "media");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_8;
    }
    -[LPLinkViewComponents media](self->_components, "media");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");

  }
LABEL_8:
  -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LPLinkViewComponents domainNameIndicator](self->_components, "domainNameIndicator");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents quote](self->_components, "quote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[LPLinkViewComponents quote](self->_components, "quote");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");

  }
  -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LPLinkViewComponents progressSpinner](self->_components, "progressSpinner");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");

  }
}

- (void)_uninstallHighlightGestureRecognizers
{
  NSMutableArray *i;
  void *v4;
  void *v5;

  for (i = self->_highlightGestureRecognizers; -[NSMutableArray count](i, "count"); i = self->_highlightGestureRecognizers)
  {
    -[NSMutableArray lastObject](self->_highlightGestureRecognizers, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v4);

    -[NSMutableArray removeLastObject](self->_highlightGestureRecognizers, "removeLastObject");
  }
}

- (void)_uninstallTapGestureRecognizers
{
  NSMutableArray *i;
  void *v4;
  void *v5;

  for (i = self->_tapGestureRecognizers; -[NSMutableArray count](i, "count"); i = self->_tapGestureRecognizers)
  {
    -[NSMutableArray lastObject](self->_tapGestureRecognizers, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v4);

    -[NSMutableArray removeLastObject](self->_tapGestureRecognizers, "removeLastObject");
  }
}

- (void)_rebuildGestureRecognizersIfNeeded
{
  _BOOL4 v3;
  _BOOL4 v4;

  v3 = -[NSMutableArray count](self->_highlightGestureRecognizers, "count") != 0;
  if (((v3 ^ -[LPLinkView _disableHighlightGesture](self, "_disableHighlightGesture")) & 1) == 0)
  {
    if (-[LPLinkView _disableHighlightGesture](self, "_disableHighlightGesture"))
      -[LPLinkView _uninstallHighlightGestureRecognizers](self, "_uninstallHighlightGestureRecognizers");
    else
      -[LPLinkView _installHighlightGestureRecognizers](self, "_installHighlightGestureRecognizers");
  }
  if ((-[NSMutableArray count](self->_tapGestureRecognizers, "count") == 0) == !self->_disableTapGesture)
  {
    if (self->_disableTapGesture)
      -[LPLinkView _uninstallTapGestureRecognizers](self, "_uninstallTapGestureRecognizers");
    else
      -[LPLinkView _installTapGestureRecognizers](self, "_installTapGestureRecognizers");
  }
  v4 = self->_contextMenuInteraction != 0;
  if (((v4 ^ -[LPLinkView _disablePreviewGesture](self, "_disablePreviewGesture")) & 1) == 0)
  {
    if (-[LPLinkView _disablePreviewGesture](self, "_disablePreviewGesture"))
      -[LPLinkView _uninstallPreviewGestureRecognizer](self, "_uninstallPreviewGestureRecognizer");
    else
      -[LPLinkView _installPreviewGestureRecognizer](self, "_installPreviewGestureRecognizer");
  }
}

- (void)_setDisableTapGesture:(BOOL)a3
{
  if (self->_disableTapGesture != a3)
  {
    self->_disableTapGesture = a3;
    -[LPLinkView _rebuildGestureRecognizersIfNeeded](self, "_rebuildGestureRecognizersIfNeeded");
    -[UIView _lp_setHoverEffectEnabled:](self->_animationView, "_lp_setHoverEffectEnabled:", !self->_disableTapGesture);
    -[LPLinkView _invalidatePresentationPropertiesAndLayout](self, "_invalidatePresentationPropertiesAndLayout");
  }
}

- (void)_setDisableHighlightGesture:(BOOL)a3
{
  self->_hasSetDisableHighlightGesture = 1;
  if (self->_disableHighlightGesture != a3)
  {
    self->_disableHighlightGesture = a3;
    -[LPLinkView _rebuildGestureRecognizersIfNeeded](self, "_rebuildGestureRecognizersIfNeeded");
  }
}

- (BOOL)_disableHighlightGesture
{
  int *v2;

  if (self->_hasSetDisableHighlightGesture)
    v2 = &OBJC_IVAR___LPLinkView__disableHighlightGesture;
  else
    v2 = &OBJC_IVAR___LPLinkView__disableTapGesture;
  return *((_BYTE *)&self->super.super.super.isa + *v2);
}

- (void)_setDisablePreviewGesture:(BOOL)a3
{
  self->_hasSetDisablePreviewGesture = 1;
  if (self->_disablePreviewGesture != a3)
  {
    self->_disablePreviewGesture = a3;
    -[LPLinkView _rebuildGestureRecognizersIfNeeded](self, "_rebuildGestureRecognizersIfNeeded");
  }
}

- (BOOL)_disablePreviewGesture
{
  int *v4;

  if (!sizeClassAllowsProgressSpinner(self->_effectiveSizeClass)
    || +[LPApplicationIdentification isMobileReminders](LPApplicationIdentification, "isMobileReminders"))
  {
    return 1;
  }
  if (self->_hasSetDisablePreviewGesture)
    v4 = &OBJC_IVAR___LPLinkView__disablePreviewGesture;
  else
    v4 = &OBJC_IVAR___LPLinkView__disableTapGesture;
  return *((_BYTE *)&self->super.super.super.isa + *v4) != 0;
}

- (void)_addTapRecognizerToView:(id)a3 forMedia:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char **v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = objc_alloc(MEMORY[0x1E0DC3D80]);
  v7 = &selRef__mediaTapRecognized_;
  if (!v4)
    v7 = &selRef__captionTapRecognized_;
  v8 = (void *)objc_msgSend(v6, "initWithTarget:action:", self, *v7);
  objc_msgSend(v8, "_setDelaysRecognitionForGreaterTapCounts:", 1);
  objc_msgSend(v8, "setName:", CFSTR("LPLinkViewTap"));
  objc_msgSend(v9, "addGestureRecognizer:", v8);
  -[NSMutableArray addObject:](self->_tapGestureRecognizers, "addObject:", v8);

}

- (void)_addHighlightRecognizerToView:(id)a3 forMedia:(BOOL)a4
{
  _BOOL4 v4;
  LPHighlightGestureRecognizer *v6;
  char **v7;
  LPHighlightGestureRecognizer *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = [LPHighlightGestureRecognizer alloc];
  v7 = &selRef__mediaHighlightRecognized_;
  if (!v4)
    v7 = &selRef__captionHighlightRecognized_;
  v8 = -[LPHighlightGestureRecognizer initWithTarget:action:](v6, "initWithTarget:action:", self, *v7);
  -[LPHighlightGestureRecognizer setDelegate:](v8, "setDelegate:", self);
  -[LPHighlightGestureRecognizer setName:](v8, "setName:", CFSTR("LPLinkViewHighlight"));
  objc_msgSend(v9, "addGestureRecognizer:", v8);
  -[NSMutableArray addObject:](self->_highlightGestureRecognizers, "addObject:", v8);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 disablePlaybackControls;

  v5 = a4;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkViewComponents media](self->_components, "media");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isDescendantOfView:", v7))
    goto LABEL_5;
  -[LPLinkViewComponents media](self->_components, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:", v5)
    || self->_disablePlayback)
  {

LABEL_5:
    goto LABEL_6;
  }
  disablePlaybackControls = self->_disablePlaybackControls;

  if (!disablePlaybackControls)
    goto LABEL_12;
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    LOBYTE(v10) = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isDescendantOfView:", self))
    v10 = -[NSMutableArray containsObject:](self->_tapGestureRecognizers, "containsObject:", v5) ^ 1;
  else
    LOBYTE(v10) = 0;

LABEL_13:
  return v10;
}

- (void)_cancelActiveHighlight
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_highlightGestureRecognizers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "setEnabled:", 0, (_QWORD)v7);
        objc_msgSend(v6, "setEnabled:", 1);
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_setHighlightMedia:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;

  v3 = a3;
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "shouldHighlightIndependently");

  v6 = !v3;
  if ((v5 & 1) == 0)
  {
    -[UIView layer](self->_captionHighlightView, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v6);

  }
  -[UIView layer](self->_mediaHighlightView, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v6);

}

- (void)_setHighlightCaption:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;

  v3 = a3;
  -[LPWebLinkPresentationProperties captionBar](self->_properties, "captionBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "shouldHighlightIndependently");

  v6 = !v3;
  if ((v5 & 1) == 0)
  {
    -[UIView layer](self->_mediaHighlightView, "layer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v6);

  }
  -[UIView layer](self->_captionHighlightView, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v6);

}

- (void)_mediaHighlightRecognized:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    v5 = 0;
LABEL_5:
    -[LPLinkView _setHighlightMedia:](self, "_setHighlightMedia:", v5);
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    v5 = 1;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_captionHighlightRecognized:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    v5 = 0;
LABEL_5:
    -[LPLinkView _setHighlightCaption:](self, "_setHighlightCaption:", v5);
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    v5 = 1;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_mediaTapRecognized:(id)a3
{
  if (!self->_disableTapGesture)
    -[LPLinkView _openURL](self, "_openURL", a3);
}

- (void)_captionTapRecognized:(id)a3
{
  if (!self->_disableTapGesture)
    -[LPLinkView _openURLAllowingSensitiveSchemes:allowingAssociatedApplications:](self, "_openURLAllowingSensitiveSchemes:allowingAssociatedApplications:", self->_allowsOpeningSensitiveURLs, 1);
}

- (void)_captionBarButtonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);
  id v6;
  id v7;
  id v8;

  -[LPConcretePresentationProperties captionButton](self->_properties, "captionButton", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LPLinkView componentViewDidTapCaptionButton:buttonType:](self, "componentViewDidTapCaptionButton:buttonType:", self, objc_msgSend(v6, "type"));

  -[LPConcretePresentationProperties captionButton](self->_properties, "captionButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPConcretePresentationProperties captionButton](self->_properties, "captionButton");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "callback");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  else if (!self->_disableTapGesture)
  {
    -[LPLinkView _openURLAllowingSensitiveSchemes:allowingAssociatedApplications:](self, "_openURLAllowingSensitiveSchemes:allowingAssociatedApplications:", self->_allowsOpeningSensitiveURLs, 1);
  }
}

- (void)tapToLoadViewWasTapped:(id)a3
{
  id v4;

  if (!-[NSHashTable count](self->_pendingMetadataProviders, "count", a3))
  {
    -[NSURL _lp_requestWithAttribution:](self->_URL, "_lp_requestWithAttribution:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[LPLinkView _fetchMetadataForRequest:](self, "_fetchMetadataForRequest:");

  }
}

- (BOOL)_isUsingAppClipPresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (-[LPWebLinkPresentationProperties style](self->_properties, "style") != 41)
    return 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getCPSClipURLClass_softClass_0;
  v13 = getCPSClipURLClass_softClass_0;
  if (!getCPSClipURLClass_softClass_0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getCPSClipURLClass_block_invoke_0;
    v9[3] = &unk_1E44A7DB0;
    v9[4] = &v10;
    __getCPSClipURLClass_block_invoke_0((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  if (!objc_msgSend(v4, "isSupported"))
    return 0;
  -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)_openURL
{
  -[LPLinkView _openURLAllowingSensitiveSchemes:allowingAssociatedApplications:](self, "_openURLAllowingSensitiveSchemes:allowingAssociatedApplications:", self->_allowsOpeningSensitiveURLs, 0);
}

- (void)_openURLAllowingSensitiveSchemes:(BOOL)a3 allowingAssociatedApplications:(BOOL)a4
{
  _BOOL4 v4;
  NSNumber *overrideAllowsOpeningSensitiveURLs;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  unsigned int v24;
  void *v25;
  objc_class *v26;
  id v27;
  NSURL *v28;
  NSURL *URL;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  unsigned int loggingID;
  _QWORD v37[4];
  id v38;
  LPLinkView *v39;
  void (**v40)(_QWORD);
  _QWORD aBlock[4];
  id v42;
  BOOL v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[8];
  uint64_t v50;
  void (*v51)(uint64_t);
  void *v52;
  uint64_t *v53;
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  if (!-[LPLinkView _disableLinkFollowing](self, "_disableLinkFollowing"))
  {
    overrideAllowsOpeningSensitiveURLs = self->_overrideAllowsOpeningSensitiveURLs;
    if (overrideAllowsOpeningSensitiveURLs)
      a3 = -[NSNumber BOOLValue](overrideAllowsOpeningSensitiveURLs, "BOOLValue");
    -[LPLinkView metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originatingSynapseContentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DB0710], "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPLinkView metadata](self, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "originatingSynapseContentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke;
      v44[3] = &unk_1E44A9D68;
      v44[4] = self;
      objc_msgSend(v10, "navigateToContentItem:completion:", v12, v44);

      return;
    }
    if (self->_URL)
    {
      +[LPPresentationSpecializations URLToOpenForURL:](LPPresentationSpecializations, "URLToOpenForURL:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[LPLinkMetadata specialization](self->_metadata, "specialization");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_disallowsURLOverrideByDelegate");

        if ((v16 & 1) == 0)
        {
          objc_msgSend(WeakRetained, "_linkView:overrideURLForOpeningURL:", self, v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v35 = LPLogChannelUI();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              loggingID = self->_loggingID;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = loggingID;
              _os_log_impl(&dword_1A0C41000, v35, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: delegate handled openURL", buf, 8u);
            }
            goto LABEL_27;
          }
          if ((objc_msgSend(v17, "isEqual:", self->_URL) & 1) == 0)
          {
            v18 = LPLogChannelUI();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = self->_loggingID;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v19;
              _os_log_impl(&dword_1A0C41000, v18, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: delegate overrode link to open", buf, 8u);
            }
          }
          v13 = v17;
        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "_linkView:willOpenURL:", self, v13);
      v20 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_274;
      aBlock[3] = &unk_1E44A9D90;
      v43 = a3;
      v21 = v13;
      v42 = v21;
      v22 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (v4 && -[LPLinkView _isUsingAppClipPresentation](self, "_isUsingAppClipPresentation"))
      {
        v23 = LPLogChannelUI();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = self->_loggingID;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v24;
          _os_log_impl(&dword_1A0C41000, v23, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: attempting to follow an App Clip link", buf, 8u);
        }
        v45 = 0;
        v46 = &v45;
        v47 = 0x2050000000;
        v25 = (void *)getCPSClipRequestClass_softClass;
        v48 = getCPSClipRequestClass_softClass;
        if (!getCPSClipRequestClass_softClass)
        {
          *(_QWORD *)buf = v20;
          v50 = 3221225472;
          v51 = __getCPSClipRequestClass_block_invoke;
          v52 = &unk_1E44A7DB0;
          v53 = &v45;
          __getCPSClipRequestClass_block_invoke((uint64_t)buf);
          v25 = (void *)v46[3];
        }
        v26 = objc_retainAutorelease(v25);
        _Block_object_dispose(&v45, 8);
        v27 = [v26 alloc];
        -[LPLinkMetadata URL](self->_metadata, "URL");
        v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
        URL = v28;
        if (!v28)
          URL = self->_URL;
        -[LPLinkMetadata associatedApplication](self->_metadata, "associatedApplication");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bundleIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v27, "initWithURL:fallbackClipBundleID:", URL, v31);

        v37[0] = v20;
        v37[1] = 3221225472;
        v37[2] = __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_277;
        v37[3] = &unk_1E44A9DB8;
        v38 = v32;
        v39 = self;
        v40 = v22;
        v33 = v32;
        objc_msgSend(v33, "requestClipWithCompletion:", v37);

      }
      else
      {
        v22[2](v22);
      }

LABEL_27:
      return;
    }
    v34 = LPLogChannelUI();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[LPLinkView _openURLAllowingSensitiveSchemes:allowingAssociatedApplications:].cold.1((uint64_t)self, v34);
  }
}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = LPLogChannelUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_274(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], 0);
  }

}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_277(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  if (v5 || !a2)
  {
    v9 = LPLogChannelUI();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 416);
      v11 = 67109120;
      v12 = v10;
      _os_log_impl(&dword_1A0C41000, v9, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: falling back from App Clip link to openURL", (uint8_t *)&v11, 8u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = LPLogChannelUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 416);
      v11 = 67109120;
      v12 = v8;
      _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: successfully followed an App Clip link", (uint8_t *)&v11, 8u);
    }
  }

}

- (void)_installPreviewGestureRecognizer
{
  UIContextMenuInteraction *v3;
  UIContextMenuInteraction *contextMenuInteraction;

  if (self->_animationView)
  {
    v3 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
    contextMenuInteraction = self->_contextMenuInteraction;
    self->_contextMenuInteraction = v3;

    -[UIView addInteraction:](self->_animationView, "addInteraction:", self->_contextMenuInteraction);
  }
}

- (void)_uninstallPreviewGestureRecognizer
{
  UIContextMenuInteraction *contextMenuInteraction;

  -[UIView removeInteraction:](self->_animationView, "removeInteraction:", self->_contextMenuInteraction);
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = 0;

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id result;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[LPLinkView hitTest:withEvent:](self, "hitTest:withEvent:", 0, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = 0;
LABEL_19:

    return v10;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v11 = (void *)getDDContextMenuActionClass_softClass;
  v41 = getDDContextMenuActionClass_softClass;
  if (!getDDContextMenuActionClass_softClass)
  {
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = (uint64_t)__getDDContextMenuActionClass_block_invoke;
    v36 = &unk_1E44A7DB0;
    v37 = &v38;
    __getDDContextMenuActionClass_block_invoke((uint64_t)&v33);
    v11 = (void *)v39[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v38, 8);
  -[UIView bounds](self->_animationView, "bounds");
  objc_msgSend(v12, "updateContext:withSourceRect:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_contextMenuActionsForLinkView:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    v17 = (void *)objc_msgSend(v13, "mutableCopy");
    v33 = 0;
    v34 = (uint64_t)&v33;
    v35 = 0x2020000000;
    v18 = (_QWORD *)getkDDContextMenuActionsKeySymbolLoc_ptr;
    v36 = (void *)getkDDContextMenuActionsKeySymbolLoc_ptr;
    if (!getkDDContextMenuActionsKeySymbolLoc_ptr)
    {
      v19 = DataDetectorsUILibrary();
      v18 = dlsym(v19, "kDDContextMenuActionsKey");
      *(_QWORD *)(v34 + 24) = v18;
      getkDDContextMenuActionsKeySymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v33, 8);
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDDContextMenuActionsKey(void)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("LPLinkView.m"), 103, CFSTR("%s"), dlerror(), v33);
      goto LABEL_22;
    }
    objc_msgSend(v17, "setObject:forKey:", v16, *v18);
    v20 = objc_msgSend(v17, "copy");

    v13 = (void *)v20;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_15:
    -[LPLinkView URL](self, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextMenuConfigurationWithURL:inView:context:menuIdentifier:", v27, self->_animationView, v13, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_linkView:contextMenuConfigurationForSuggestedConfiguration:", self, v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = v28;
    }
    v10 = v29;

    goto LABEL_19;
  }
  v21 = objc_msgSend(WeakRetained, "_wantsContextMenuPreviewForLinkView:", self);
  v22 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = (uint64_t)&v33;
  v35 = 0x2020000000;
  v24 = (_QWORD *)getkDDContextMenuWantsPreviewKeySymbolLoc_ptr;
  v36 = (void *)getkDDContextMenuWantsPreviewKeySymbolLoc_ptr;
  if (!getkDDContextMenuWantsPreviewKeySymbolLoc_ptr)
  {
    v25 = DataDetectorsUILibrary();
    v24 = dlsym(v25, "kDDContextMenuWantsPreviewKey");
    *(_QWORD *)(v34 + 24) = v24;
    getkDDContextMenuWantsPreviewKeySymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v33, 8);
  if (v24)
  {
    objc_msgSend(v22, "setObject:forKey:", v23, *v24);

    v26 = objc_msgSend(v22, "copy");
    v13 = (void *)v26;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkDDContextMenuWantsPreviewKey(void)");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("LPLinkView.m"), 105, CFSTR("%s"), dlerror(), v33);
LABEL_22:

  __break(1u);
  return result;
}

- (BOOL)_disableAnimations
{
  return self->_disableAnimations;
}

- (void)_setDisableAnimations:(BOOL)a3
{
  self->_disableAnimations = a3;
}

- (BOOL)_needsMessagesTranscriptPushCounterAnimation
{
  return self->_needsMessagesTranscriptPushCounterAnimation;
}

- (void)_setNeedsMessagesTranscriptPushCounterAnimation:(BOOL)a3
{
  self->_needsMessagesTranscriptPushCounterAnimation = a3;
}

- (BOOL)_disableTapGesture
{
  return self->_disableTapGesture;
}

- (BOOL)_disableAutoPlay
{
  return self->_disableAutoPlay;
}

- (void)_setDisableAutoPlay:(BOOL)a3
{
  self->_disableAutoPlay = a3;
}

- (BOOL)_allowsLoadingMediaWithAutoPlayDisabled
{
  return self->_allowsLoadingMediaWithAutoPlayDisabled;
}

- (void)_setAllowsLoadingMediaWithAutoPlayDisabled:(BOOL)a3
{
  self->_allowsLoadingMediaWithAutoPlayDisabled = a3;
}

- (BOOL)_disablePlayback
{
  return self->_disablePlayback;
}

- (void)_setDisablePlayback:(BOOL)a3
{
  self->_disablePlayback = a3;
}

- (BOOL)_disablePlaybackControls
{
  return self->_disablePlaybackControls;
}

- (void)_setDisablePlaybackControls:(BOOL)a3
{
  self->_disablePlaybackControls = a3;
}

- (int64_t)_animationOrigin
{
  return self->_animationOrigin;
}

- (BOOL)_allowsTapToLoad
{
  return self->_allowsTapToLoad;
}

- (BOOL)_usesDeferredLayout
{
  return self->_usesDeferredLayout;
}

- (void)_setUsesDeferredLayout:(BOOL)a3
{
  self->_usesDeferredLayout = a3;
}

- (BOOL)_forceFlexibleWidth
{
  return self->_forceFlexibleWidth;
}

- (void)_setForceFlexibleWidth:(BOOL)a3
{
  self->_forceFlexibleWidth = a3;
}

- (BOOL)_applyCornerRadius
{
  return self->_applyCornerRadius;
}

- (UIEdgeInsets)_textSafeAreaInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textSafeAreaInset.top;
  left = self->_textSafeAreaInset.left;
  bottom = self->_textSafeAreaInset.bottom;
  right = self->_textSafeAreaInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSURL)_overrideURL
{
  return self->_overrideURL;
}

- (unint64_t)_preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (NSString)_sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSRegularExpression)_emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (UIColor)_overrideBackgroundColor
{
  return self->_overrideBackgroundColor;
}

- (UIColor)_overrideMediaBackgroundColor
{
  return self->_overrideMediaBackgroundColor;
}

- (UIColor)_underlyingBackgroundColor
{
  return self->_underlyingBackgroundColor;
}

- (UIColor)_overrideActionButtonColor
{
  return self->_overrideActionButtonColor;
}

- (UIColor)_overrideSubtitleButtonColor
{
  return self->_overrideSubtitleButtonColor;
}

- (BOOL)_allowsOpeningSensitiveURLs
{
  return self->_allowsOpeningSensitiveURLs;
}

- (void)_setAllowsOpeningSensitiveURLs:(BOOL)a3
{
  self->_allowsOpeningSensitiveURLs = a3;
}

- (NSArray)_contactsForAttribution
{
  return self->_contactsForAttribution;
}

- (BOOL)_isHighlightedForAttribution
{
  return self->_highlightedForAttribution;
}

- (LPImage)_lastResortIcon
{
  return self->_lastResortIcon;
}

- (BOOL)_inComposeContext
{
  return self->_inComposeContext;
}

- (BOOL)_inSenderContext
{
  return self->_inSenderContext;
}

- (BOOL)_isCollaborative
{
  return self->_collaborative;
}

- (LPLinkRendererSizeClassParameters)_sizeClassParameters
{
  return self->_sizeClassParameters;
}

- (unint64_t)_bytesLoaded
{
  return self->_bytesLoaded;
}

- (BOOL)_isShowingDisclosureView
{
  return self->_showingDisclosureView;
}

- (BOOL)_allowsAsynchronousImageDecoding
{
  return self->_allowsAsynchronousImageDecoding;
}

- (void)_setAllowsAsynchronousImageDecoding:(BOOL)a3
{
  self->_allowsAsynchronousImageDecoding = a3;
}

- (BOOL)_allowsSkinnyWidth
{
  return self->_allowsSkinnyWidth;
}

- (void)_setAllowsSkinnyWidth:(BOOL)a3
{
  self->_allowsSkinnyWidth = a3;
}

- (NSNumber)_selectedVariantIndex
{
  return self->_selectedVariantIndex;
}

- (LPImage)_mediaOverlayIcon
{
  return self->_mediaOverlayIcon;
}

- (BOOL)_maskEnabled
{
  return self->_maskEnabled;
}

- (UITraitCollection)_effectiveTraitCollection
{
  return self->_effectiveTraitCollection;
}

- (LPLinkViewDelegate)delegate
{
  return (LPLinkViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)_disableLinkFollowing
{
  return self->__disableLinkFollowing;
}

- (void)_setDisableLinkFollowing:(BOOL)a3
{
  self->__disableLinkFollowing = a3;
}

- (BOOL)_useLowMemoryImageFilters
{
  return self->__useLowMemoryImageFilters;
}

- (void)_setUseLowMemoryImageFilters:(BOOL)a3
{
  self->__useLowMemoryImageFilters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectiveTraitCollection, 0);
  objc_storeStrong((id *)&self->_mediaOverlayIcon, 0);
  objc_storeStrong((id *)&self->_selectedVariantIndex, 0);
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
  objc_storeStrong((id *)&self->_lastResortIcon, 0);
  objc_storeStrong((id *)&self->_contactsForAttribution, 0);
  objc_storeStrong((id *)&self->_overrideSubtitleButtonColor, 0);
  objc_storeStrong((id *)&self->_underlyingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_animationMaskView, 0);
  objc_storeStrong((id *)&self->_overrideAllowsOpeningSensitiveURLs, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_componentsForSizing, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_collaborationFooter, 0);
  objc_storeStrong((id *)&self->_overrideSubtitle, 0);
  objc_storeStrong((id *)&self->_overrideActionButtonColor, 0);
  objc_storeStrong((id *)&self->_overrideMediaBackgroundColor, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_captionTextButton, 0);
  objc_storeStrong((id *)&self->_captionButton, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_mediaHighlightView, 0);
  objc_storeStrong((id *)&self->_captionHighlightView, 0);
  objc_storeStrong((id *)&self->_highlightGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_multipleURLs, 0);
  objc_storeStrong((id *)&self->_multipleMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pendingMetadataProviders, 0);
}

- (void)_openURLAllowingSensitiveSchemes:(uint64_t)a1 allowingAssociatedApplications:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 416);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "LPLinkView<%d>: opening a link that has nil URL", (uint8_t *)v3, 8u);
}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 416);
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A0C41000, log, OS_LOG_TYPE_ERROR, "LPLinkView<%d>: opening a SYContentItem has failed: %@ ", (uint8_t *)v4, 0x12u);
}

@end
