@implementation PHImageResourceChooser

uint64_t __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4, void *a5)
{
  id v10;
  void (**v11)(_QWORD);
  id *WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  float v32;
  double v33;
  __CFString *v34;
  id v35;
  void *v36;
  void (**v37)(id, id, void *, id);
  id v38;
  const __CFString *v40;
  unsigned int v41;
  id v42;
  void (**v43)(_QWORD);
  char v44;
  id v45;
  char v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v46 = 0;
  v13 = (void *)objc_msgSend(WeakRetained, "_policyHandlerClassForCurrentPolicy");
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 32);
  v45 = 0;
  v16 = objc_msgSend(v13, "qualifyResourceInfo:againstPolicy:requestInfo:reversed:tooLargeForPolicy:disqualificationReason:", v10, v14, v15, a3, &v46, &v45);
  v17 = (__CFString *)v45;
  if (!v16)
    goto LABEL_10;
  if ((objc_msgSend(WeakRetained, "_resourceInfoPassesTestForImageDerivativeOfVideo:", v10) & 1) == 0)
  {

    v17 = CFSTR("failed video derivative test");
LABEL_10:
    v21 = WeakRetained[5];
    if (v21)
    {
      v19 = v21;
      v11[2](v11);
      v44 = 0;
      v22 = 1;
      v20 = CFSTR("NOT OK (Yielding FB)");
      goto LABEL_21;
    }
    if (v46)
    {
      v11[2](v11);
      *a4 = 1;
      v20 = CFSTR("NOT OK (Forcing EOL)");
    }
    else
    {
      v20 = CFSTR("NOT OK");
    }
    goto LABEL_20;
  }
  if (v16 == 1)
  {
    if (objc_msgSend(WeakRetained[2], "reversed"))
    {
      v19 = v10;
      v20 = CFSTR("OK as FB (Yielding FB due to running in reverse)");
      if (!v19)
        goto LABEL_20;
      goto LABEL_35;
    }
    objc_storeStrong(WeakRetained + 5, a2);
    v20 = CFSTR("OK as FB");
LABEL_20:
    v19 = 0;
    v22 = *a4 != 0;
    v44 = 1;
    goto LABEL_21;
  }
  if (v16 != 2)
  {
    v20 = 0;
    goto LABEL_20;
  }
  if (WeakRetained[5])
  {
    objc_msgSend(v10, "dataStoreKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = WeakRetained[5];
      v11[2](v11);
      v20 = CFSTR("OK, but not local (Yielding local FB)");
      if (v19)
        goto LABEL_35;
      goto LABEL_20;
    }
  }
  v19 = v10;
  v20 = CFSTR("OK");
  if (!v19)
    goto LABEL_20;
LABEL_35:
  v44 = 0;
  v22 = 1;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "approximateSizeFromAsset:", v23);

  PLImageManagerGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = *(_QWORD *)(a1 + 48);
    v42 = v19;
    v43 = v11;
    v41 = v22;
    v40 = v20;
    if (v25 > 4)
      v26 = CFSTR("best");
    else
      v26 = off_1E35DEFD0[v25];
    v27 = WeakRetained[10];
    v28 = v26;
    DCIM_NSStringFromCGSize();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = WeakRetained[4];
    DCIM_NSStringFromCGSize();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resourceScale");
    v33 = v32;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@)"), v17);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = &stru_1E35DFFF8;
    }
    *(_DWORD *)buf = 138414082;
    v48 = v27;
    v49 = 2112;
    v50 = v28;
    v51 = 2112;
    v52 = v29;
    v53 = 2048;
    v54 = v30;
    v55 = 2112;
    v56 = v31;
    v57 = 2048;
    v58 = v33;
    v59 = 2112;
    v60 = v40;
    v61 = 2112;
    v62 = v34;
    _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "[RM]: %@ (choosing) policy: %@, req size: %@ (scale: %f), qualifying resource w appx size: %@ (scale: %f), %@%@", buf, 0x52u);
    if (v17)

    v19 = v42;
    v11 = v43;
    v22 = v41;
  }

  if ((v44 & 1) == 0)
  {
    v35 = WeakRetained[5];
    WeakRetained[5] = 0;

    +[PHImageResourceChooser _bagFromInfo:asset:behaviorSpec:requiredScale:bagVendor:assetIDContainerVendor:](PHImageResourceChooser, "_bagFromInfo:asset:behaviorSpec:requiredScale:bagVendor:assetIDContainerVendor:", v19, WeakRetained[1], WeakRetained[6], s_bagVendor, s_assetIDContainerVendor, *((double *)WeakRetained + 4));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void (**)(id, id, void *, id))WeakRetained[3];
    v38 = objc_loadWeakRetained(WeakRetained + 9);
    v37[2](v37, v38, v36, v19);

    objc_msgSend((id)s_bagVendor, "recycleObject:", v36);
  }

  return v22;
}

- (BOOL)_resourceInfoPassesTestForImageDerivativeOfVideo:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;

  v4 = a3;
  if (-[PHResourceChooserAsset mediaType](self->_asset, "mediaType") != 2)
    goto LABEL_13;
  if (!self->_didCheckForLocalVideoKeyFrame && self->_list && (objc_msgSend(v4, "isHintBased") & 1) == 0)
  {
    self->_didCheckForLocalVideoKeyFrame = 1;
    self->_hasLocalVideoKeyFrameInNonHintResources = PHChooserListLookAheadForNonHintResourcePassingTest(self->_list, &__block_literal_global_24353);
  }
  if (!self->_hasLocalVideoKeyFrameInNonHintResources)
    goto LABEL_13;
  v5 = -[PHResourceChooserAsset isLocalVideoKeyFrameValid](self->_asset, "isLocalVideoKeyFrameValid");
  v6 = objc_msgSend(v4, "recipeID");
  if (!v5)
  {
    LOBYTE(v7) = v6 != 65749;
    goto LABEL_14;
  }
  if ((PLResourceRecipeIDIsCPLImageDerivative() & 1) == 0)
  {
    if (objc_msgSend(v4, "recipeID") == 65749)
    {
      v7 = -[PHResourceChooserAsset isWalrusEnabled](self->_asset, "isWalrusEnabled") ^ 1;
      goto LABEL_14;
    }
LABEL_13:
    LOBYTE(v7) = 1;
    goto LABEL_14;
  }
  LOBYTE(v7) = 0;
LABEL_14:

  return v7;
}

+ (void)initialize
{
  PHRecyclableObjectVendor *v2;
  void *v3;
  PHRecyclableObjectVendor *v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[PHRecyclableObjectVendor initWithTargetClass:requiresThreadSafety:initialPoolSize:]([PHRecyclableObjectVendor alloc], "initWithTargetClass:requiresThreadSafety:initialPoolSize:", objc_opt_class(), 1, 4);
    v3 = (void *)s_bagVendor;
    s_bagVendor = (uint64_t)v2;

    v4 = -[PHRecyclableObjectVendor initWithTargetClass:requiresThreadSafety:initialPoolSize:]([PHRecyclableObjectVendor alloc], "initWithTargetClass:requiresThreadSafety:initialPoolSize:", objc_opt_class(), 1, 4);
    v5 = (void *)s_assetIDContainerVendor;
    s_assetIDContainerVendor = (uint64_t)v4;

  }
}

- (void)setIsCloudSharedMode:(BOOL)a3
{
  if (self->_isCloudSharedMode != a3)
  {
    self->_needsReset = 1;
    self->_isCloudSharedMode = a3;
  }
}

- (PHImageResourceChooser)initWithChooserList:(id)a3 asset:(id)a4 resourceHandler:(id)a5
{
  id v10;
  id v11;
  id v12;
  PHImageResourceChooser *v13;
  void *v14;
  id resourceHandler;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHImageResourceChooser;
  v13 = -[PHImageResourceChooser init](&v19, sel_init);
  if (v13)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v13->_list, a3);
        objc_storeStrong((id *)&v13->_asset, a4);
        v14 = _Block_copy(v12);
        resourceHandler = v13->_resourceHandler;
        v13->_resourceHandler = v14;

        *(_WORD *)&v13->_needsReset = 257;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PHImageResourceChooser.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("list"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PHImageResourceChooser.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    goto LABEL_4;
  }
LABEL_5:

  return v13;
}

- (Class)_policyHandlerClassForCurrentPolicy
{
  void *v2;

  if ((unint64_t)-[PHImageRequestBehaviorSpec choosingPolicy](self->_behaviorSpec, "choosingPolicy") <= 4)
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v2;
}

- (void)_updateCachedGeometry
{
  double width;
  double height;
  PHResourceChooserAsset *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  PHResourceChooserAsset *v13;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  v5 = self->_asset;
  v6 = height == *(double *)(MEMORY[0x1E0C9D820] + 8) && width == *MEMORY[0x1E0C9D820];
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PHImageResourceChooser _updateCachedGeometry]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PHImageResourceChooser.m"), 164, CFSTR("asset must be set before setting desired size."));

    v5 = 0;
  }
  -[PHResourceChooserAsset unorientedSize](v5, "unorientedSize");
  v8 = v7;
  -[PHResourceChooserAsset unorientedSize](v13, "unorientedSize");
  v10 = 1.0;
  if (!v6)
    v10 = (float)((float)(unint64_t)(width * height) / (float)(unint64_t)(v8 * v9));
  self->_requiredScale = fmin(v10, 1.0);

}

- (void)setLoggingPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_loggingPrefix, a3);
}

- (void)setResourceHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDesiredSize:(CGSize)a3
{
  double width;
  double height;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  if (a3.width != width || a3.height != height)
  {
    if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
      self->_needsReset = 1;
    self->_desiredSize = a3;
    -[PHImageResourceChooser _updateCachedGeometry](self, "_updateCachedGeometry");
  }
}

- (void)setContext:(id)a3
{
  objc_storeWeak(&self->_context, a3);
}

- (void)setBehaviorSpec:(id)a3
{
  PHImageRequestBehaviorSpec *v4;
  PHImageRequestBehaviorSpec *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  char v12;
  PHImageRequestBehaviorSpec *behaviorSpec;
  BOOL v14;

  v4 = (PHImageRequestBehaviorSpec *)a3;
  v5 = v4;
  if (!self->_needsReset && v4 && self->_behaviorSpec)
  {
    v6 = -[PHImageRequestBehaviorSpec loadingOptions](v4, "loadingOptions");
    if (v6 == -[PHImageRequestBehaviorSpec loadingOptions](self->_behaviorSpec, "loadingOptions")
      && (v7 = -[PHImageRequestBehaviorSpec choosingPolicy](v5, "choosingPolicy"),
          v7 >= -[PHImageRequestBehaviorSpec choosingPolicy](self->_behaviorSpec, "choosingPolicy"))
      && (v8 = -[PHImageRequestBehaviorSpec version](v5, "version"),
          v8 == -[PHImageRequestBehaviorSpec version](self->_behaviorSpec, "version"))
      && (-[PHImageRequestBehaviorSpec minimumTableThumbnailLongSide](v5, "minimumTableThumbnailLongSide"),
          v10 = v9,
          -[PHImageRequestBehaviorSpec minimumTableThumbnailLongSide](self->_behaviorSpec, "minimumTableThumbnailLongSide"), v10 == v11))
    {
      v14 = -[PHImageRequestBehaviorSpec onlyUseFetchedAssetPropertiesDuringChoosing](v5, "onlyUseFetchedAssetPropertiesDuringChoosing");
      v12 = v14 ^ -[PHImageRequestBehaviorSpec onlyUseFetchedAssetPropertiesDuringChoosing](self->_behaviorSpec, "onlyUseFetchedAssetPropertiesDuringChoosing");
    }
    else
    {
      v12 = 1;
    }
    self->_needsReset = v12;
  }
  behaviorSpec = self->_behaviorSpec;
  self->_behaviorSpec = v5;

}

- (void)presentNextQualifyingResource
{
  void *v3;
  int64_t v4;
  void *v5;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  PHResourceChooserList *list;
  id itemHandler;
  id v14;
  void *v15;
  PHResourceChooserList *v16;
  id endOfListHandler;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22[3];
  BOOL v23;
  _QWORD aBlock[4];
  id v25;
  id v26[2];
  id location;

  if (!self->_behaviorSpec)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImageResourceChooser.m"), 365, CFSTR("no behavior spec set."));

  }
  if (self->_needsReset)
    -[PHImageResourceChooser _reset](self, "_reset");
  v3 = -[PHImageRequestBehaviorSpec version](self->_behaviorSpec, "version");
  v4 = -[PHImageRequestBehaviorSpec choosingPolicy](self->_behaviorSpec, "choosingPolicy");
  v5 = (void *)v4;
  v7 = (unint64_t)v3 < 2 && v4 == 3;
  -[PHImageResourceChooser _requestInfo](self, "_requestInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_storeStrong((id *)&self->_list->_asset, self->_asset);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke;
  aBlock[3] = &unk_1E35DB2F0;
  objc_copyWeak(v26, &location);
  v26[1] = v5;
  v10 = v8;
  v25 = v10;
  v11 = _Block_copy(aBlock);
  list = self->_list;
  itemHandler = list->_itemHandler;
  list->_itemHandler = v11;

  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke_69;
  v20[3] = &unk_1E35DB318;
  objc_copyWeak(v22, &location);
  v14 = v10;
  v21 = v14;
  v22[1] = v5;
  v22[2] = v3;
  v23 = v7;
  v15 = _Block_copy(v20);
  v16 = self->_list;
  endOfListHandler = v16->_endOfListHandler;
  v16->_endOfListHandler = v15;

  -[PHResourceChooserList continueEnumeratingWithSourceOptions:](self->_list, "continueEnumeratingWithSourceOptions:", objc_msgSend((id)objc_opt_class(), "_chooserSourceOptionsFromBehaviorSpec:allowHints:", self->_behaviorSpec, self->_allowHints));
  objc_destroyWeak(v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

}

- (id)_requestInfo
{
  PHImageResourceChooserRequestInfo *v3;
  PHResourceChooserAsset *asset;
  float requiredScale;
  void *v6;
  double v7;
  PHImageResourceChooserRequestInfo *v8;

  v3 = [PHImageResourceChooserRequestInfo alloc];
  asset = self->_asset;
  requiredScale = self->_requiredScale;
  +[PHImageResourceChooser _resourceVersionsFromImageRequestVersion:assetHasAdjustments:](PHImageResourceChooser, "_resourceVersionsFromImageRequestVersion:assetHasAdjustments:", -[PHImageRequestBehaviorSpec version](self->_behaviorSpec, "version"), -[PHResourceChooserAsset hasAdjustments](asset, "hasAdjustments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = requiredScale;
  v8 = -[PHImageResourceChooserRequestInfo initWithAsset:desiredSize:requestedScale:allowedResourceVersions:behaviorSpec:cloudSharedMode:fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:loggingPrefix:](v3, "initWithAsset:desiredSize:requestedScale:allowedResourceVersions:behaviorSpec:cloudSharedMode:fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:loggingPrefix:", asset, v6, self->_behaviorSpec, self->_isCloudSharedMode, self->_loggingPrefix, self->_desiredSize.width, self->_desiredSize.height, v7, self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable);

  return v8;
}

+ (id)_resourceVersionsFromImageRequestVersion:(int64_t)a3 assetHasAdjustments:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = &unk_1E3655B70;
  switch(a3)
  {
    case 0:
      objc_msgSend(v6, "addObject:", &unk_1E3655B40);
      if (v4)
        v8 = &unk_1E3655B58;
      goto LABEL_8;
    case 1:
      objc_msgSend(v6, "addObject:", &unk_1E3655B70);
      if (v4)
        return v7;
      v8 = &unk_1E3655B40;
LABEL_8:
      objc_msgSend(v7, "addObject:", v8);
      return v7;
    case 2:
      goto LABEL_8;
    case 8:
      v8 = &unk_1E3655B88;
      goto LABEL_8;
    default:
      return v7;
  }
}

+ (unint64_t)_chooserSourceOptionsFromBehaviorSpec:(id)a3 allowHints:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unint64_t v6;

  v4 = a4;
  v5 = a3;
  v6 = v4;
  if ((objc_msgSend(v5, "onlyUseFetchedAssetPropertiesDuringChoosing") & 1) == 0
    && (objc_msgSend(v5, "choosingPolicy") > 2
     || !v4
     || !objc_msgSend(v5, "choosingPolicy") && objc_msgSend(v5, "isNetworkAccessAllowed")))
  {
    v6 = v4 | 2;
  }

  return v6;
}

- (void)_reset
{
  NSObject *v3;
  NSString *loggingPrefix;
  PHResourceChooserListResourceInfo *fallbackInfo;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    loggingPrefix = self->_loggingPrefix;
    v9 = 138412290;
    v10 = loggingPrefix;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %@ resetting chooser...", (uint8_t *)&v9, 0xCu);
  }

  fallbackInfo = self->_fallbackInfo;
  self->_fallbackInfo = 0;

  *(_WORD *)&self->_didCheckForLocalVideoKeyFrame = 0;
  PHChooserListMoveFirst((uint64_t)self->_list);
  -[PHImageResourceChooser _updateCachedGeometry](self, "_updateCachedGeometry");
  v6 = -[PHImageRequestBehaviorSpec version](self->_behaviorSpec, "version");
  if (v6 == 2)
  {
    v8 = 0;
    goto LABEL_7;
  }
  v7 = 0;
  if (v6 == 1)
  {
    v8 = 1;
LABEL_7:
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("uniformTypeIdentifier.conformsToRawImage"), v8);
  }
  PHChooserListSetSortDescriptor(self->_list, v7);
  self->_needsReset = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_destroyWeak(&self->_context);
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_fallbackInfo, 0);
  objc_storeStrong(&self->_resourceHandler, 0);
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PHImageResourceChooser)initWithAsset:(id)a3 resourceHandler:(id)a4
{
  id v6;
  id v7;
  PHResourceChooserList *v8;
  PHImageResourceChooser *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PHResourceChooserList);
  v9 = -[PHImageResourceChooser initWithChooserList:asset:resourceHandler:](self, "initWithChooserList:asset:resourceHandler:", v8, v7, v6);

  return v9;
}

- (void)setAllowHints:(BOOL)a3
{
  if (self->_allowHints != a3)
  {
    self->_needsReset = 1;
    self->_allowHints = a3;
  }
}

- (void)setFallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:(double)a3
{
  if (vabdd_f64(self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable, a3) > 0.00000011920929)
  {
    self->_needsReset = 1;
    self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable = a3;
  }
}

- (void)moveFirst
{
  PHChooserListMoveFirst((uint64_t)self->_list);
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_desiredSize.width;
  height = self->_desiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable
{
  return self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable;
}

- (BOOL)allowHints
{
  return self->_allowHints;
}

- (BOOL)isCloudSharedMode
{
  return self->_isCloudSharedMode;
}

- (PHImageRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (id)resourceHandler
{
  return self->_resourceHandler;
}

- (id)context
{
  return objc_loadWeakRetained(&self->_context);
}

- (NSString)loggingPrefix
{
  return self->_loggingPrefix;
}

void __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke_69(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  __CFString *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (void *)*((_QWORD *)WeakRetained + 5);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)*((_QWORD *)WeakRetained + 5);
    *((_QWORD *)WeakRetained + 5) = 0;

    objc_msgSend(*(id *)(a1 + 32), "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "approximateSizeFromAsset:", v10);

    PLImageManagerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *((_QWORD *)WeakRetained + 10);
      v13 = *(_QWORD *)(a1 + 48);
      if (v13 > 4)
        v14 = CFSTR("best");
      else
        v14 = off_1E35DEFD0[v13];
      v20 = v14;
      DCIM_NSStringFromCGSize();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *((_QWORD *)WeakRetained + 4);
      DCIM_NSStringFromCGSize();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413314;
      v28 = v12;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2048;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "[RM]: %@ (choosing) policy: %@, against size: %@ (scale: %f), yielding FB resource w appx size: %@ due to hitting EOL", (uint8_t *)&v27, 0x34u);

    }
    +[PHImageResourceChooser _bagFromInfo:asset:behaviorSpec:requiredScale:bagVendor:assetIDContainerVendor:](PHImageResourceChooser, "_bagFromInfo:asset:behaviorSpec:requiredScale:bagVendor:assetIDContainerVendor:", v8, *((_QWORD *)WeakRetained + 1), *((_QWORD *)WeakRetained + 6), s_bagVendor, s_assetIDContainerVendor, *((double *)WeakRetained + 4));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *((_QWORD *)WeakRetained + 3);
    v26 = objc_loadWeakRetained((id *)WeakRetained + 9);
    (*(void (**)(uint64_t, id, void *, id))(v25 + 16))(v25, v26, v24, v8);

    objc_msgSend((id)s_bagVendor, "recycleObject:", v24);
    goto LABEL_16;
  }
  if (*(_BYTE *)(a1 + 64) && (v15 = objc_msgSend(v5, "reversed"), a3) && (v15 & 1) == 0)
  {
    PLImageManagerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *((_QWORD *)WeakRetained + 10);
      v27 = 138412290;
      v28 = v17;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "[RM]: %@ (choosing) couldn't find a resource meeting size criteria, turning around and removing size criteria...", (uint8_t *)&v27, 0xCu);
    }

    *a3 = 1;
    if (*(_QWORD *)(a1 + 56) == 1)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("uniformTypeIdentifier.conformsToRawImage"), 0);
      PHChooserListSetSortDescriptor(v5, v8);
LABEL_16:

    }
  }
  else
  {
    v18 = *((_QWORD *)WeakRetained + 3);
    v19 = objc_loadWeakRetained((id *)WeakRetained + 9);
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v18 + 16))(v18, v19, 0, 0);

  }
}

BOOL __75__PHImageResourceChooser__resourceInfoPassesTestForImageDerivativeOfVideo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recipeID") == 65749;
}

+ (id)_bagFromInfo:(id)a3 asset:(id)a4 behaviorSpec:(id)a5 requiredScale:(double)a6 bagVendor:(id)a7 assetIDContainerVendor:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t IsFullSizeDeferredProcessingPreview;
  float v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v13, "dataStoreKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v16, "dequeueRecyclableObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dequeueRecyclableObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "loadFromAsset:", v14);
    objc_msgSend(v18, "setAssetID:", v19);
    objc_msgSend(v13, "store");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataStore:", v20);

    objc_msgSend(v13, "dataStoreKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataStoreKey:", v21);

    v22 = objc_msgSend(v15, "choosingPolicy");
    if (v22 <= 4)
    {
      if (((1 << v22) & 0x19) != 0)
      {
        IsFullSizeDeferredProcessingPreview = 0;
      }
      else
      {
        objc_msgSend(v13, "resourceScale");
        if (v24 >= a6)
        {
          objc_msgSend(v13, "recipeID");
          IsFullSizeDeferredProcessingPreview = PLResourceRecipeIsFullSizeDeferredProcessingPreview();
        }
        else
        {
          IsFullSizeDeferredProcessingPreview = 1;
        }
      }
      objc_msgSend(v18, "setIsDegraded:", IsFullSizeDeferredProcessingPreview);
    }
    objc_msgSend(v18, "setIsPrimaryFormat:", objc_msgSend(v13, "isPrimaryFormat"));
    objc_msgSend(v18, "setKeyIsHintBased:", objc_msgSend(v13, "isHintBased"));
    objc_msgSend(v13, "recipeID");
    objc_msgSend(v14, "deferredProcessingNeeded");
    objc_msgSend(v18, "setIsDerivedFromDeferredPreview:", PLResourceIsDerivedFromDeferredProcessingPreviewImage());
  }
  else
  {
    v19 = 0;
  }

  return v18;
}

@end
