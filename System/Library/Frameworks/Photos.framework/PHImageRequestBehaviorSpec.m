@implementation PHImageRequestBehaviorSpec

+ (id)imageRequestInitialBehaviorSpecWithImageRequestOptions:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  unint64_t v12;
  PHImageRequestBehaviorSpec *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "deliveryMode");
  if (v8)
  {
    v9 = 3;
    if (v8 == 2)
      v9 = 0;
    v10 = v8 == 3 || v8 != 2;
    if (v8 == 3)
      v11 = 4;
    else
      v11 = v9;
  }
  else if ((objc_msgSend(v6, "isSynchronous") & 1) != 0)
  {
    v10 = 1;
    v11 = 3;
  }
  else
  {
    v10 = 0;
    if (objc_msgSend(v6, "opportunisticDegradedImagesToReturn") == 2)
      v11 = 2;
    else
      v11 = 1;
  }
  v12 = +[PHImageRequestBehaviorSpec loadingOptionsFromLoadingMode:](PHImageRequestBehaviorSpec, "loadingOptionsFromLoadingMode:", objc_msgSend(v6, "loadingMode"));
  v13 = objc_alloc_init(PHImageRequestBehaviorSpec);
  -[PHImageRequestBehaviorSpec setChoosingPolicy:](v13, "setChoosingPolicy:", v11);
  -[PHImageRequestBehaviorSpec setLoadingOptions:](v13, "setLoadingOptions:", v12);
  -[PHImageRequestBehaviorSpec setAllowPlaceholder:](v13, "setAllowPlaceholder:", objc_msgSend(v6, "allowPlaceholder"));
  if (v10)
    v14 = objc_msgSend(v6, "isNetworkAccessAllowed");
  else
    v14 = 0;
  -[PHImageRequestBehaviorSpec setNetworkAccessAllowed:](v13, "setNetworkAccessAllowed:", v14);
  -[PHImageRequestBehaviorSpec setVersion:](v13, "setVersion:", objc_msgSend(v6, "version"));
  -[PHImageRequestBehaviorSpec setResizeMode:](v13, "setResizeMode:", objc_msgSend(v6, "resizeMode"));
  -[PHImageRequestBehaviorSpec setOnlyUseFetchedAssetPropertiesDuringChoosing:](v13, "setOnlyUseFetchedAssetPropertiesDuringChoosing:", objc_msgSend(v6, "onlyUseFetchedAssetPropertiesDuringChoosing"));
  -[PHImageRequestBehaviorSpec setIncludeHDRGainMap:](v13, "setIncludeHDRGainMap:", objc_msgSend(a1, "_shouldLoadHDRGainMapBasedOnChoosingPolicy:options:asset:", v11, v6, v7));
  v15 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", v11, objc_msgSend(v6, "preferHDR"), v7);

  -[PHImageRequestBehaviorSpec setDecodeAsHDR:](v13, "setDecodeAsHDR:", v15);
  objc_msgSend(v6, "targetHDRHeadroom");
  -[PHImageRequestBehaviorSpec setTargetHDRHeadroom:](v13, "setTargetHDRHeadroom:");
  -[PHImageRequestBehaviorSpec setUseLowMemoryMode:](v13, "setUseLowMemoryMode:", objc_msgSend(v6, "useLowMemoryMode"));
  -[PHImageRequestBehaviorSpec setUseLimitedLibraryMode:](v13, "setUseLimitedLibraryMode:", objc_msgSend(v6, "useLimitedLibraryMode"));
  v16 = objc_msgSend(v6, "loadingMode");
  v17 = 100.0;
  if ((v16 & 0x400000) == 0)
    v17 = 0.0;
  -[PHImageRequestBehaviorSpec setMinimumTableThumbnailLongSide:](v13, "setMinimumTableThumbnailLongSide:", v17);
  if (objc_msgSend(v6, "deliveryMode"))
  {
    v18 = objc_msgSend(v6, "isSynchronous");
  }
  else if ((objc_msgSend(v6, "opportunisticDegradedImagesToReturn") & 1) != 0)
  {
    v18 = objc_msgSend(v6, "useAsyncForFastOpportunisticResult") ^ 1;
  }
  else
  {
    v18 = 0;
  }
  -[PHImageRequestBehaviorSpec setSynchronous:](v13, "setSynchronous:", v18);
  -[PHImageRequestBehaviorSpec setDownloadIntent:](v13, "setDownloadIntent:", objc_msgSend(v6, "downloadIntent"));
  -[PHImageRequestBehaviorSpec setDownloadPriority:](v13, "setDownloadPriority:", objc_msgSend(v6, "downloadPriority"));
  -[PHImageRequestBehaviorSpec setCannotReturnSmallerImage:](v13, "setCannotReturnSmallerImage:", objc_msgSend(v6, "cannotReturnSmallerImage"));

  return v13;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)useLimitedLibraryMode
{
  return self->_useLimitedLibraryMode;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (void)setIncludeHDRGainMap:(BOOL)a3
{
  self->_includeHDRGainMap = a3;
}

- (void)setDecodeAsHDR:(BOOL)a3
{
  self->_decodeAsHDR = a3;
}

- (void)setChoosingPolicy:(int64_t)a3
{
  self->_choosingPolicy = a3;
}

+ (BOOL)_shouldLoadHDRGainMapBasedOnChoosingPolicy:(int64_t)a3 options:(id)a4 asset:(id)a5
{
  id v7;
  char v8;
  BOOL v9;

  v7 = a4;
  if ((objc_msgSend(a5, "mediaSubtypes") & 0x200) == 0)
    goto LABEL_8;
  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 == 2 && objc_msgSend(v7, "includeHDRGainMap"))
    {
      v8 = objc_msgSend(v7, "includeHDRGainMapInIntermediateImage");
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v7, "includeHDRGainMap");
LABEL_7:
  v9 = v8;
LABEL_9:

  return v9;
}

- (unint64_t)loadingOptions
{
  return self->_loadingOptions;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (BOOL)decodeAsHDR
{
  return self->_decodeAsHDR;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (BOOL)includeHDRGainMap
{
  return self->_includeHDRGainMap;
}

- (void)setAllowPlaceholder:(BOOL)a3
{
  self->_allowPlaceholder = a3;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setUseLimitedLibraryMode:(BOOL)a3
{
  self->_useLimitedLibraryMode = a3;
}

- (void)setResizeMode:(int64_t)a3
{
  self->_resizeMode = a3;
}

- (void)setOnlyUseFetchedAssetPropertiesDuringChoosing:(BOOL)a3
{
  self->_onlyUseFetchedAssetPropertiesDuringChoosing = a3;
}

- (void)setMinimumTableThumbnailLongSide:(double)a3
{
  self->_minimumTableThumbnailLongSide = a3;
}

- (void)setLoadingOptions:(unint64_t)a3
{
  self->_loadingOptions = a3;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (void)setCannotReturnSmallerImage:(BOOL)a3
{
  self->_cannotReturnSmallerImage = a3;
}

+ (unint64_t)loadingOptionsFromLoadingMode:(int64_t)a3
{
  _BOOL8 v4;

  v4 = (a3 & 0x7C0000) != 0 || a3 == 0;
  return ((unint64_t)a3 >> 14) & 4 | (2 * (a3 & 1)) | ((unint64_t)a3 >> 15) & 0xF8 | v4;
}

+ (id)imageRequestBestBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v10, "setSynchronous:", objc_msgSend(v9, "isSynchronous"));
  objc_msgSend(v10, "setChoosingPolicy:", 3);
  objc_msgSend(v10, "setIncludeHDRGainMap:", objc_msgSend(a1, "_shouldLoadHDRGainMapBasedOnChoosingPolicy:options:asset:", 3, v9, v8));
  v11 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", 3, objc_msgSend(v9, "preferHDR"), v8);

  objc_msgSend(v10, "setDecodeAsHDR:", v11);
  objc_msgSend(v9, "targetHDRHeadroom");
  objc_msgSend(v10, "setTargetHDRHeadroom:");
  v12 = objc_msgSend(v9, "isNetworkAccessAllowed");

  objc_msgSend(v10, "setNetworkAccessAllowed:", v12);
  return v10;
}

- (int64_t)choosingPolicy
{
  return self->_choosingPolicy;
}

- (int64_t)resizeMode
{
  return self->_resizeMode;
}

- (BOOL)shouldLoadURL
{
  return (LOBYTE(self->_loadingOptions) >> 2) & 1;
}

- (BOOL)shouldLoadImage
{
  return self->_loadingOptions & 1;
}

- (BOOL)shouldLoadData
{
  return (LOBYTE(self->_loadingOptions) >> 1) & 1;
}

- (BOOL)onlyUseFetchedAssetPropertiesDuringChoosing
{
  return self->_onlyUseFetchedAssetPropertiesDuringChoosing;
}

- (double)minimumTableThumbnailLongSide
{
  return self->_minimumTableThumbnailLongSide;
}

- (BOOL)shouldLoadDataOrURL
{
  return (self->_loadingOptions & 6) != 0;
}

+ (id)imageRequestIntermediateBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v10, "setSynchronous:", 0);
  objc_msgSend(v10, "setNetworkAccessAllowed:", 0);
  objc_msgSend(v10, "setChoosingPolicy:", 2);
  objc_msgSend(v10, "setIncludeHDRGainMap:", objc_msgSend(a1, "_shouldLoadHDRGainMapBasedOnChoosingPolicy:options:asset:", 2, v9, v8));
  v11 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", 2, objc_msgSend(v9, "preferHDR"), v8);

  objc_msgSend(v10, "setDecodeAsHDR:", v11);
  objc_msgSend(v9, "targetHDRHeadroom");
  v13 = v12;

  objc_msgSend(v10, "setTargetHDRHeadroom:", v13);
  objc_msgSend(v10, "setAllowPlaceholder:", 0);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(PHImageRequestBehaviorSpec);
  *((_QWORD *)result + 3) = self->_choosingPolicy;
  *((_QWORD *)result + 4) = self->_loadingOptions;
  *((_QWORD *)result + 5) = self->_version;
  *((_BYTE *)result + 8) = self->_synchronous;
  *((_BYTE *)result + 9) = self->_networkAccessAllowed;
  *((_BYTE *)result + 10) = self->_allowPlaceholder;
  *((_QWORD *)result + 6) = self->_resizeMode;
  *((_BYTE *)result + 11) = self->_onlyUseFetchedAssetPropertiesDuringChoosing;
  *((_BYTE *)result + 12) = self->_includeHDRGainMap;
  *((_BYTE *)result + 13) = self->_includeHDRGainMapInIntermediateImage;
  *((_BYTE *)result + 14) = self->_decodeAsHDR;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_targetHDRHeadroom;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_minimumTableThumbnailLongSide;
  *((_BYTE *)result + 15) = self->_useLowMemoryMode;
  *((_BYTE *)result + 16) = self->_useLimitedLibraryMode;
  *((_QWORD *)result + 9) = self->_downloadIntent;
  *((_QWORD *)result + 10) = self->_downloadPriority;
  *((_BYTE *)result + 17) = self->_cannotReturnSmallerImage;
  return result;
}

- (id)shortDescription
{
  unint64_t choosingPolicy;
  const __CFString *v4;
  void *v5;
  _BOOL4 networkAccessAllowed;
  _BOOL4 synchronous;
  unint64_t loadingOptions;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int64_t version;
  const __CFString *v14;
  unint64_t resizeMode;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;

  choosingPolicy = self->_choosingPolicy;
  if (choosingPolicy > 4)
    v4 = CFSTR("best");
  else
    v4 = off_1E35DEFD0[choosingPolicy];
  v5 = (void *)MEMORY[0x1E0CB3940];
  networkAccessAllowed = self->_networkAccessAllowed;
  synchronous = self->_synchronous;
  loadingOptions = self->_loadingOptions;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((loadingOptions & 1) != 0)
  {
    v11 = CFSTR("img");
  }
  else if ((loadingOptions & 2) != 0)
  {
    v11 = CFSTR("data");
  }
  else if ((loadingOptions & 4) != 0)
  {
    v11 = CFSTR("url");
  }
  else if ((loadingOptions & 8) != 0)
  {
    v11 = CFSTR("bgra");
  }
  else
  {
    if ((loadingOptions & 0x10) == 0)
      goto LABEL_15;
    v11 = CFSTR("hipri");
  }
  objc_msgSend(v9, "addObject:", v11);
LABEL_15:
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("|"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  version = self->_version;
  v14 = 0;
  switch(version)
  {
    case 0:
      v14 = CFSTR("curr");
      break;
    case 1:
      v14 = CFSTR("unadj");
      break;
    case 2:
      v14 = CFSTR("orig");
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
      v14 = CFSTR("penult");
      break;
    default:
      if (version == 16)
        v14 = CFSTR("adjustment");
      else
        v14 = 0;
      break;
  }
  resizeMode = self->_resizeMode;
  if (resizeMode > 2)
    v16 = 0;
  else
    v16 = off_1E35DEFF8[resizeMode];
  if (synchronous)
    v17 = CFSTR("Y");
  else
    v17 = CFSTR("N");
  if (networkAccessAllowed)
    v18 = CFSTR("Y");
  else
    v18 = CFSTR("N");
  if (self->_allowPlaceholder)
    v19 = CFSTR("Y");
  else
    v19 = CFSTR("N");
  _PHDownloadIntentName(self->_downloadIntent);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _PHDownloadPriorityName(self->_downloadPriority);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("net: %@, sync: %@, choose: %@, load: %@, ver: %@, resize: %@, allow-pl-hdr: %@, intent: %@, priority: %@"), v18, v17, v4, v12, v14, v16, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImageRequestBehaviorSpec shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isExplicitUserAction
{
  return (self->_downloadIntent < 0xDuLL) & (0x238u >> self->_downloadIntent);
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)allowPlaceholder
{
  return self->_allowPlaceholder;
}

- (BOOL)includeHDRGainMapInIntermediateImage
{
  return self->_includeHDRGainMapInIntermediateImage;
}

- (void)setIncludeHDRGainMapInIntermediateImage:(BOOL)a3
{
  self->_includeHDRGainMapInIntermediateImage = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (BOOL)cannotReturnSmallerImage
{
  return self->_cannotReturnSmallerImage;
}

+ (id)contentEditingInputImageBehaviorSpecForBaseVersion:(int64_t)a3 isNetworkAccessAllowed:(BOOL)a4 downloadIntent:(int64_t)a5 shouldUseRAWAsUnadjustedBase:(BOOL)a6 asset:(id)a7
{
  _BOOL8 v9;
  id v11;
  PHImageRequestBehaviorSpec *v12;
  unint64_t v13;
  int64_t v14;

  v9 = a4;
  v11 = a7;
  v12 = objc_alloc_init(PHImageRequestBehaviorSpec);
  -[PHImageRequestBehaviorSpec setChoosingPolicy:](v12, "setChoosingPolicy:", 3);
  -[PHImageRequestBehaviorSpec setLoadingOptions:](v12, "setLoadingOptions:", 4);
  -[PHImageRequestBehaviorSpec setNetworkAccessAllowed:](v12, "setNetworkAccessAllowed:", v9);
  -[PHImageRequestBehaviorSpec setDownloadIntent:](v12, "setDownloadIntent:", a5);
  v13 = objc_msgSend(v11, "mediaSubtypes");

  -[PHImageRequestBehaviorSpec setIncludeHDRGainMap:](v12, "setIncludeHDRGainMap:", (v13 >> 9) & 1);
  if (a3 || !a6)
    v14 = +[PHAdjustmentData imageRequestVersionFromAdjustmentBaseVersion:](PHAdjustmentData, "imageRequestVersionFromAdjustmentBaseVersion:", a3);
  else
    v14 = 2;
  -[PHImageRequestBehaviorSpec setVersion:](v12, "setVersion:", v14);
  return v12;
}

+ (id)livePhotoRequestInitialBehaviorSpecWithLivePhotoRequestOptions:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  PHImageRequestBehaviorSpec *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "deliveryMode");
  v9 = objc_alloc_init(PHImageRequestBehaviorSpec);
  -[PHImageRequestBehaviorSpec setLoadingOptions:](v9, "setLoadingOptions:", 1);
  v10 = v8 == 0;
  v11 = 3;
  if (!v8)
    v11 = 1;
  if (v8 == 2)
    v12 = 0;
  else
    v12 = v11;
  -[PHImageRequestBehaviorSpec setChoosingPolicy:](v9, "setChoosingPolicy:", v12);
  -[PHImageRequestBehaviorSpec setNetworkAccessAllowed:](v9, "setNetworkAccessAllowed:", objc_msgSend(v7, "isNetworkAccessAllowed"));
  -[PHImageRequestBehaviorSpec setVersion:](v9, "setVersion:", objc_msgSend(v7, "version"));
  -[PHImageRequestBehaviorSpec setDownloadIntent:](v9, "setDownloadIntent:", objc_msgSend(v7, "downloadIntent"));
  -[PHImageRequestBehaviorSpec setDownloadPriority:](v9, "setDownloadPriority:", objc_msgSend(v7, "downloadPriority"));
  v13 = objc_msgSend(v7, "preferHDR");

  v14 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", v12, v13, v6);
  -[PHImageRequestBehaviorSpec setDecodeAsHDR:](v9, "setDecodeAsHDR:", v14);
  -[PHImageRequestBehaviorSpec setResizeMode:](v9, "setResizeMode:", 1);
  -[PHImageRequestBehaviorSpec setSynchronous:](v9, "setSynchronous:", v10);
  return v9;
}

+ (id)livePhotoRequestBestBehaviorSpecWithPreviousBehaviorSpec:(id)a3 options:(id)a4 asset:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v10, "setSynchronous:", 0);
  objc_msgSend(v10, "setChoosingPolicy:", 3);
  v11 = objc_msgSend(v9, "preferHDR");

  v12 = objc_msgSend(a1, "_shouldDecodeAsHDRBasedOnChoosingPolicy:optionsPreferHDR:asset:", 3, v11, v8);
  objc_msgSend(v10, "setDecodeAsHDR:", v12);
  return v10;
}

+ (BOOL)_shouldDecodeAsHDRBasedOnChoosingPolicy:(int64_t)a3 optionsPreferHDR:(BOOL)a4 asset:(id)a5
{
  return (objc_msgSend(a5, "mediaSubtypes") & 0x800200) != 0 && (unint64_t)(a3 - 2) < 3 && a4;
}

@end
