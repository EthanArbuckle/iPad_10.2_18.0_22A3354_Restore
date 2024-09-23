@implementation CPLResource

+ (unint64_t)maxPixelSizeForResourceType:(unint64_t)a3
{
  unint64_t result;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = 104857600;
  switch(a3)
  {
    case 2uLL:
      return result;
    case 3uLL:
      result = 25165824;
      break;
    case 4uLL:
      result = 3145728;
      break;
    case 5uLL:
      result = 172800;
      break;
    default:
      if (a3 != 15)
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(a1, "descriptionForResourceType:", a3);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 138412290;
            v9 = v7;
            _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Unsupported resource type %@ for maxPixels", (uint8_t *)&v8, 0xCu);

          }
        }
        result = 0;
      }
      break;
  }
  return result;
}

- (CPLResource)initWithCoder:(id)a3
{
  id v4;
  CPLResource *v5;
  CPLResource *v6;
  void *v7;
  void *v8;
  CPLScopedIdentifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLResource;
  v5 = -[CPLResource init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);
    -[CPLResource itemScopedIdentifier](v6, "itemScopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (initWithCoder__onceToken_84 != -1)
        dispatch_once(&initWithCoder__onceToken_84, &__block_literal_global_86);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", initWithCoder__stringClass_85, CFSTR("itemIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v8);
        -[CPLResource setItemScopedIdentifier:](v6, "setItemScopedIdentifier:", v9);

      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

uint64_t __42__CPLResource_CPLNSCoding__initWithCoder___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  initWithCoder__stringClass_85 = result;
  return result;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("itemIdentifier")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLResource;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLResource)initWithCPLArchiver:(id)a3
{
  id v4;
  CPLResource *v5;
  CPLResource *v6;
  void *v7;
  void *v8;
  CPLScopedIdentifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLResource;
  v5 = -[NSObject initWithCPLArchiver:](&v11, sel_initWithCPLArchiver_, v4);
  v6 = v5;
  if (v5)
  {
    -[CPLResource itemScopedIdentifier](v5, "itemScopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (initWithCPLArchiver__onceToken_1303 != -1)
        dispatch_once(&initWithCPLArchiver__onceToken_1303, &__block_literal_global_1305);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", initWithCPLArchiver__stringClass_1304, CFSTR("itemIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v8);
        -[CPLResource setItemScopedIdentifier:](v6, "setItemScopedIdentifier:", v9);

      }
    }
  }

  return v6;
}

uint64_t __48__CPLResource_CPLArchiver__initWithCPLArchiver___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  initWithCPLArchiver__stringClass_1304 = result;
  return result;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("itemIdentifier")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("canGenerateDerivative")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLResource;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (id)normalizedResourcesFromResources:(id)a3 resourcePerResourceType:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[18];

  v33[16] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v20 = a4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "resourceType", v20));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v11, v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }

    v13 = +[CPLResource countOfResourceTypes](CPLResource, "countOfResourceTypes");
    v14 = (char *)&v21[-1] - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v14, 8 * v13);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__CPLResource_normalizedResourcesFromResources_resourcePerResourceType___block_invoke;
    v21[3] = &unk_1E60DA420;
    v15 = v6;
    v23 = &v25;
    v24 = v14;
    v22 = v15;
    +[CPLResource enumerateResourceTypesWithBlock:](CPLResource, "enumerateResourceTypesWithBlock:", v21);
    if (v26[3])
    {
      v16 = objc_retainAutorelease(v15);
      *v20 = v16;
      v17 = objc_alloc(MEMORY[0x1E0C99D20]);
      v18 = (void *)objc_msgSend(v17, "initWithObjects:count:", v14, v26[3]);
    }
    else
    {
      *v20 = (id)MEMORY[0x1E0C9AA70];
      v18 = (void *)MEMORY[0x1E0C9AA60];
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    *a4 = (id)MEMORY[0x1E0C9AA70];
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

+ (unint64_t)resourceTypeFromShortDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CPLResource_resourceTypeFromShortDescription___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (resourceTypeFromShortDescription__onceToken != -1)
    dispatch_once(&resourceTypeFromShortDescription__onceToken, block);
  objc_msgSend((id)resourceTypeFromShortDescription__mapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 0;

  return v7;
}

+ (id)descriptionForResourceType:(unint64_t)a3
{
  __CFString *v3;

  v3 = CFSTR("CPLResourceTypeUnknown");
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v3 = CFSTR("CPLResourceTypeAny");
      return v3;
    case 0uLL:
      return v3;
    case 1uLL:
      return CFSTR("CPLResourceTypeOriginal");
    case 2uLL:
      return CFSTR("CPLResourceTypeJPEGFullSize");
    case 3uLL:
      return CFSTR("CPLResourceTypeJPEGLargeSize");
    case 4uLL:
      return CFSTR("CPLResourceTypeJPEGMediumSize");
    case 5uLL:
      return CFSTR("CPLResourceTypeJPEGThumbnail");
    case 6uLL:
      return CFSTR("CPLResourceTypeVideoMediumSize");
    case 7uLL:
      return CFSTR("CPLResourceTypeVideoSmallSize");
    case 8uLL:
      return CFSTR("CPLResourceTypeSidecarAudio");
    case 9uLL:
      return CFSTR("CPLResourceTypeSidecarXMP");
    case 0xAuLL:
      return CFSTR("CPLResourceTypeMediaMetaData");
    case 0xBuLL:
      return CFSTR("CPLResourceTypeUnused1");
    case 0xCuLL:
      return CFSTR("CPLResourceTypeUnused2");
    case 0xDuLL:
      return CFSTR("CPLResourceTypeAdjustmentData");
    case 0xEuLL:
      return CFSTR("CPLResourceTypeAdjustmentSecondaryData");
    case 0xFuLL:
      return CFSTR("CPLResourceTypeAdjustmentBaseJPEGFullSize");
    case 0x10uLL:
      return CFSTR("CPLResourceTypeVideoFullSize");
    case 0x11uLL:
      return CFSTR("CPLResourceTypeOriginalAlternate");
    case 0x12uLL:
      return CFSTR("CPLResourceTypeOriginalVideoComplement");
    case 0x13uLL:
      return CFSTR("CPLResourceTypeVideoComplement");
    case 0x14uLL:
      return CFSTR("CPLResourceTypeAdjustmentBaseVideoComplement");
    case 0x15uLL:
      return CFSTR("CPLResourceTypeVideoLargeSize");
    case 0x16uLL:
      return CFSTR("CPLResourceTypeSidecarOther");
    case 0x17uLL:
      return CFSTR("CPLResourceTypeOriginalSpatialOverCapture");
    case 0x18uLL:
      return CFSTR("CPLResourceTypeOriginalSpatialOverCaptureVideoComplement");
    case 0x19uLL:
      return CFSTR("CPLResourceTypeAdjustmentBaseVideo");
    case 0x1AuLL:
      return CFSTR("CPLResourceTypeVideoMetaData");
    case 0x1BuLL:
      return CFSTR("CPLResourceTypeAdjustedMediaMetaData");
    case 0x1CuLL:
      return CFSTR("CPLResourceTypeVideoHDRMediumSize");
    case 0x1DuLL:
      return CFSTR("_CPLResourceTypeMaxNormal");
    default:
      if (a3 == 1000)
        return CFSTR("CPLResourceTypeAdjustmentOriginalResource");
      if (a3 == 1001)
        return CFSTR("CPLResourceTypeMax");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown resource type %i"), a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

+ (id)shortDescriptionForResourceType:(unint64_t)a3
{
  __CFString *v3;

  v3 = CFSTR("Unknown");
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v3 = CFSTR("Any");
      return v3;
    case 0uLL:
      return v3;
    case 1uLL:
      return CFSTR("Original");
    case 2uLL:
      return CFSTR("JPEGFull");
    case 3uLL:
      return CFSTR("JPEGLarge");
    case 4uLL:
      return CFSTR("JPEGMedium");
    case 5uLL:
      return CFSTR("JPEGThumbnail");
    case 6uLL:
      return CFSTR("VideoMedium");
    case 7uLL:
      return CFSTR("VideoSmall");
    case 8uLL:
      return CFSTR("Audio");
    case 9uLL:
      return CFSTR("SidecarXMP");
    case 0xAuLL:
      return CFSTR("MediaMetaData");
    case 0xBuLL:
      return CFSTR("Unused1");
    case 0xCuLL:
      return CFSTR("Unused2");
    case 0xDuLL:
      return CFSTR("AdjustmentData");
    case 0xEuLL:
      return CFSTR("AdjustmentSecondaryData");
    case 0xFuLL:
      return CFSTR("AdjustmentBaseFullSize");
    case 0x10uLL:
      return CFSTR("VideoFull");
    case 0x11uLL:
      return CFSTR("OriginalAlt");
    case 0x12uLL:
      return CFSTR("OriginalVidCompl");
    case 0x13uLL:
      return CFSTR("VideoCompl");
    case 0x14uLL:
      return CFSTR("AdjustmentBaseVideoCompl");
    case 0x15uLL:
      return CFSTR("VideoLarge");
    case 0x16uLL:
      return CFSTR("SidecarOther");
    case 0x17uLL:
      return CFSTR("OriginalSpatialOverCapture");
    case 0x18uLL:
      return CFSTR("OriginalSpatialOverCaptureVideoComplement");
    case 0x19uLL:
      return CFSTR("AdjustmentBaseVideo");
    case 0x1AuLL:
      return CFSTR("VideoMetaData");
    case 0x1BuLL:
      return CFSTR("AdjustedMediaMetaData");
    case 0x1CuLL:
      return CFSTR("VideoHDRMedium");
    case 0x1DuLL:
      return CFSTR("MaxNormal");
    default:
      if (a3 == 1000)
        return CFSTR("AdjustmentOriginalResource");
      if (a3 == 1001)
        return CFSTR("Max");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ResourceType-%i"), a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

+ (BOOL)shouldIgnoreResourceTypeOnUpload:(unint64_t)a3
{
  return a3 == 1000;
}

+ (BOOL)hasPriorityBoostForResourceType:(unint64_t)a3
{
  return a3 - 1 < 4;
}

+ (float)derivativeGenerationThreshold
{
  return 1.2;
}

+ (unint64_t)largeResourceSizeThreshold
{
  return 52428800;
}

+ (BOOL)cplShouldGenerateDerivatives
{
  if (cplShouldGenerateDerivatives_onceToken != -1)
    dispatch_once(&cplShouldGenerateDerivatives_onceToken, &__block_literal_global_11025);
  return cplShouldGenerateDerivatives_cplShouldGenerateDerivatives;
}

+ (BOOL)resourceTypeTrackedForUpload:(unint64_t)a3
{
  return a3 == 18 || (a3 & 0xFFFFFFFFFFFFFFEFLL) == 1 || a3 - 23 < 2;
}

+ (BOOL)resourceTypeSupportsResourceExpunge:(unint64_t)a3
{
  return a3 - 23 < 2;
}

+ (void)enumerateResourceTypesWithBlock:(id)a3
{
  void (**v3)(id, uint64_t, char *);
  uint64_t v4;
  char v5;

  v3 = (void (**)(id, uint64_t, char *))a3;
  v4 = 0;
  v5 = 0;
  while (1)
  {
    v3[2](v3, v4, &v5);
    if (v5)
      break;
    if (++v4 == 29)
    {
      v3[2](v3, 1000, &v5);
      break;
    }
  }

}

+ (BOOL)isDerivativeResourceType:(unint64_t)a3
{
  return (a3 < 0x1D) & (0x102000F8u >> a3);
}

+ (BOOL)isNonDerivativeResourceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 > 0x1C || a3 <= 0xC && ((1 << a3) & 0x1801) != 0)
    return 0;
  else
    return objc_msgSend(a1, "isDerivativeResourceType:", v3, v4) ^ 1;
}

+ (BOOL)isAdjustedResourceType:(unint64_t)a3
{
  return (a3 > 0x1B) | (0x5AF19FFu >> a3) & 1;
}

+ (void)getAllResourceTypesToDownload:(const unint64_t *)a3
{
  *a3 = (const unint64_t *)&getAllResourceTypesToDownload__result;
}

+ (void)getAllResourceTypesToDownloadPrioritizeNonDerivatives:(const unint64_t *)a3
{
  if (getAllResourceTypesToDownloadPrioritizeNonDerivatives__onceToken != -1)
    dispatch_once(&getAllResourceTypesToDownloadPrioritizeNonDerivatives__onceToken, &__block_literal_global_219);
  *a3 = (const unint64_t *)&getAllResourceTypesToDownloadPrioritizeNonDerivatives__allResourceTypes;
}

+ (unint64_t)countOfResourceTypes
{
  return 30;
}

+ (BOOL)isDynamicFingerprint:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_msgSend(v4, "hasPrefix:", CFSTR("#")) & 1) != 0
    || objc_msgSend(a1, "usesFakeDerivatives") && (objc_msgSend(v4, "hasPrefix:", CFSTR("^")) & 1) != 0;

  return v5;
}

+ (id)predicateMatchingDynamicFingerprintForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K BEGINSWITH %@"), v4, CFSTR("#"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "usesFakeDerivatives"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K BEGINSWITH %@"), v4, CFSTR("^"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3528];
    v11[0] = v5;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

+ (BOOL)usesFakeDerivatives
{
  if (usesFakeDerivatives_onceToken != -1)
    dispatch_once(&usesFakeDerivatives_onceToken, &__block_literal_global_228);
  return usesFakeDerivatives_usesFakeDerivatives;
}

void __34__CPLResource_usesFakeDerivatives__block_invoke()
{
  void *v0;
  id v1;

  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringForKey:", CFSTR("CPLFakeDynamicDerivatives"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    usesFakeDerivatives_usesFakeDerivatives = v0 != 0;

  }
}

double __69__CPLResource_getAllResourceTypesToDownloadPrioritizeNonDerivatives___block_invoke()
{
  uint64_t v0;
  __int128 *v1;
  double result;

  v0 = 0;
  v1 = &getAllResourceTypesToDownloadPrioritizeNonDerivatives__allResourceTypes;
  do
  {
    if (+[CPLResource isNonDerivativeResourceType:](CPLResource, "isNonDerivativeResourceType:", v0))
    {
      *(_QWORD *)v1 = v0;
      v1 = (__int128 *)((char *)v1 + 8);
    }
    ++v0;
  }
  while (v0 != 29);
  *(_QWORD *)&result = 5;
  *v1 = xmmword_1B053F620;
  return result;
}

- (CPLResource)initWithResourceIdentity:(id)a3 itemScopedIdentifier:(id)a4 resourceType:(unint64_t)a5
{
  id v9;
  id v10;
  CPLResource *v11;
  CPLResource *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLResource;
  v11 = -[CPLResource init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identity, a3);
    objc_storeStrong((id *)&v12->_itemScopedIdentifier, a4);
    v12->_resourceType = a5;
  }

  return v12;
}

- (void)setItemIdentifier:(id)a3
{
  CPLScopedIdentifier *v4;
  CPLScopedIdentifier *itemScopedIdentifier;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v6);
    itemScopedIdentifier = self->_itemScopedIdentifier;
    self->_itemScopedIdentifier = v4;
  }
  else
  {
    itemScopedIdentifier = self->_itemScopedIdentifier;
    self->_itemScopedIdentifier = 0;
  }

}

- (NSString)itemIdentifier
{
  return -[CPLScopedIdentifier identifier](self->_itemScopedIdentifier, "identifier");
}

- (void)setItemScopedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemScopedIdentifier, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  void *v13;
  int v14;
  const char *v15;

  -[CPLResource identity](self, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", -[CPLResource resourceType](self, "resourceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLResource itemScopedIdentifier](self, "itemScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fingerPrint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "isAvailable");
    v12 = " unavailable";
    if (v11)
      v12 = "";
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@ for %@ (%@ - %@) file: %@%s]"), v6, v7, v8, v9, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = objc_msgSend(v3, "isAvailable");
    v15 = " unavailable";
    if (v14)
      v15 = "";
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@ for %@ (%@ - %@) no file%s]"), v6, v7, v8, v9, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  const __CFString *v12;
  void *v13;

  -[CPLResource identity](self, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", -[CPLResource resourceType](self, "resourceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLResource itemScopedIdentifier](self, "itemScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fingerPrint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isAvailable");
  v11 = " unavailable";
  if (v10)
    v11 = "";
  if (v4)
    v12 = CFSTR("[%@ for %@ (%@ - %@) file: <redacted>%s]");
  else
    v12 = CFSTR("[%@ for %@ (%@ - %@) no file%s]");
  objc_msgSend(v5, "stringWithFormat:", v12, v6, v7, v8, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)bestFileNameForResource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;

  -[CPLResource identity](self, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fingerPrint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLResourceIdentity storageNameForFingerPrint:fileUTI:bucket:](CPLResourceIdentity, "storageNameForFingerPrint:fileUTI:bucket:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[CPLResource resourceType](self, "resourceType");
    v8 = CFSTR("Unknown_");
    switch(v7)
    {
      case 0uLL:
        break;
      case 1uLL:
        v8 = CFSTR("Original_");
        break;
      case 2uLL:
        v8 = CFSTR("FullSize_");
        break;
      case 3uLL:
        v8 = CFSTR("LargeSize_");
        break;
      case 4uLL:
        v8 = CFSTR("MediumSize_");
        break;
      case 5uLL:
        v8 = CFSTR("Thumb_");
        break;
      case 6uLL:
        v8 = CFSTR("VideoMedium_");
        break;
      case 7uLL:
        v8 = CFSTR("Small_");
        break;
      case 8uLL:
        v8 = CFSTR("Audio_");
        break;
      case 9uLL:
        v8 = CFSTR("SidecarXMP_");
        break;
      case 0xAuLL:
        v8 = CFSTR("MediaMetaData_");
        break;
      case 0xBuLL:
      case 0xCuLL:
        goto LABEL_7;
      case 0xDuLL:
        v8 = CFSTR("AdjustmentData_");
        break;
      case 0xEuLL:
        v8 = CFSTR("AdjustmentSecondaryData_");
        break;
      case 0xFuLL:
        v8 = CFSTR("AdjustmentBaseFullSize_");
        break;
      case 0x10uLL:
        v8 = CFSTR("VideoFull_");
        break;
      case 0x11uLL:
        v8 = CFSTR("OriginalAlt_");
        break;
      case 0x12uLL:
        v8 = CFSTR("OriginalVidCompl_");
        break;
      case 0x13uLL:
        v8 = CFSTR("VideoCompl_");
        break;
      case 0x14uLL:
        v8 = CFSTR("AdjustmentBaseVideoCompl_");
        break;
      case 0x15uLL:
        v8 = CFSTR("VideoLargeSize_");
        break;
      case 0x16uLL:
        v8 = CFSTR("SidecarOther_");
        break;
      case 0x17uLL:
        v8 = CFSTR("OriginalSpatialOverCapture_");
        break;
      case 0x18uLL:
        v8 = CFSTR("OriginalSpatialOverCaptureVidCompl_");
        break;
      case 0x19uLL:
        v8 = CFSTR("AdjustmentBaseVideo_");
        break;
      case 0x1AuLL:
        v8 = CFSTR("VideoMetaData_");
        break;
      case 0x1BuLL:
        v8 = CFSTR("AdjustedMediaMetaData_");
        break;
      case 0x1CuLL:
        v8 = CFSTR("VideoHDRMedium_");
        break;
      default:
        if (v7 == 1000)
          v8 = CFSTR("AdjustmentOriginalResource_");
        else
LABEL_7:
          v8 = CFSTR("Unsupported_");
        break;
    }
    -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isTrackedForUpload
{
  return +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", self->_resourceType);
}

- (unint64_t)estimatedResourceSize
{
  unint64_t result;
  unint64_t resourceType;

  result = -[CPLResourceIdentity fileSize](self->_identity, "fileSize");
  if (!result)
  {
    resourceType = self->_resourceType;
    result = 104857600;
    switch(resourceType)
    {
      case 1uLL:
      case 0x10uLL:
      case 0x17uLL:
      case 0x19uLL:
        goto LABEL_9;
      case 2uLL:
      case 6uLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x11uLL:
      case 0x1CuLL:
        result = 0x200000;
        break;
      case 3uLL:
      case 7uLL:
      case 9uLL:
      case 0x16uLL:
        result = 0x100000;
        break;
      case 4uLL:
        result = 614400;
        break;
      case 5uLL:
        result = 51200;
        break;
      case 8uLL:
        result = 3145728;
        break;
      case 0xAuLL:
      case 0xDuLL:
      case 0x1AuLL:
      case 0x1BuLL:
        result = 102400;
        break;
      case 0xBuLL:
      case 0xCuLL:
        return result;
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x18uLL:
        result = 0x400000;
        break;
      default:
        if (resourceType == 1000)
LABEL_9:
          result = 10485760;
        break;
    }
  }
  return result;
}

- (unint64_t)_backgroundDownloadTaskIdentifier
{
  return self->_backgroundDownloadTaskIdentifier;
}

- (void)_setBackgroundDownloadTaskIdentifier:(unint64_t)a3
{
  self->_backgroundDownloadTaskIdentifier = a3;
}

- (CPLResourceIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (CPLScopedIdentifier)itemScopedIdentifier
{
  return self->_itemScopedIdentifier;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (unint64_t)sourceResourceType
{
  return self->_sourceResourceType;
}

- (void)setSourceResourceType:(unint64_t)a3
{
  self->_sourceResourceType = a3;
}

- (BOOL)canGenerateDerivative
{
  return self->_canGenerateDerivative;
}

- (void)setCanGenerateDerivative:(BOOL)a3
{
  self->_canGenerateDerivative = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

void __43__CPLResource_cplShouldGenerateDerivatives__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CPLShouldGenerateDerivatives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 1;
  }
  cplShouldGenerateDerivatives_cplShouldGenerateDerivatives = v2;

}

void __48__CPLResource_resourceTypeFromShortDescription___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CPLResource_resourceTypeFromShortDescription___block_invoke_2;
  v8[3] = &unk_1E60DA448;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateResourceTypesWithBlock:", v8);
  v6 = (void *)resourceTypeFromShortDescription__mapping;
  resourceTypeFromShortDescription__mapping = (uint64_t)v4;
  v7 = v4;

}

void __48__CPLResource_resourceTypeFromShortDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "shortDescriptionForResourceType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
}

void __72__CPLResource_normalizedResourcesFromResources_resourcePerResourceType___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_QWORD *)(a1[6] + 8 * (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))++) = v5;

}

@end
