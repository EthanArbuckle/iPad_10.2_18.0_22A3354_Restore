@implementation PHImageRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE v9[24];

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setVersion:", -[PHImageRequestOptions version](self, "version"));
  objc_msgSend(v4, "setDeliveryMode:", -[PHImageRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v4, "setLoadingMode:", -[PHImageRequestOptions loadingMode](self, "loadingMode"));
  objc_msgSend(v4, "setResizeMode:", -[PHImageRequestOptions resizeMode](self, "resizeMode"));
  -[PHImageRequestOptions normalizedCropRect](self, "normalizedCropRect");
  objc_msgSend(v4, "setNormalizedCropRect:");
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHImageRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v4, "setSynchronous:", -[PHImageRequestOptions isSynchronous](self, "isSynchronous"));
  -[PHImageRequestOptions progressHandler](self, "progressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressHandler:", v5);

  objc_msgSend(v4, "setAllowPlaceholder:", -[PHImageRequestOptions allowPlaceholder](self, "allowPlaceholder"));
  -[PHImageRequestOptions resultHandlerQueue](self, "resultHandlerQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultHandlerQueue:", v6);

  -[PHImageRequestOptions cachingCompleteHandler](self, "cachingCompleteHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCachingCompleteHandler:", v7);

  objc_msgSend(v4, "setOnlyUseFetchedAssetPropertiesDuringChoosing:", -[PHImageRequestOptions onlyUseFetchedAssetPropertiesDuringChoosing](self, "onlyUseFetchedAssetPropertiesDuringChoosing"));
  objc_msgSend(v4, "setIncludeHDRGainMap:", -[PHImageRequestOptions includeHDRGainMap](self, "includeHDRGainMap"));
  objc_msgSend(v4, "setIncludeHDRGainMapInIntermediateImage:", -[PHImageRequestOptions includeHDRGainMapInIntermediateImage](self, "includeHDRGainMapInIntermediateImage"));
  objc_msgSend(v4, "setPreferHDR:", -[PHImageRequestOptions preferHDR](self, "preferHDR"));
  -[PHImageRequestOptions targetHDRHeadroom](self, "targetHDRHeadroom");
  objc_msgSend(v4, "setTargetHDRHeadroom:");
  objc_msgSend(v4, "setUseLowMemoryMode:", -[PHImageRequestOptions useLowMemoryMode](self, "useLowMemoryMode"));
  objc_msgSend(v4, "setUseLimitedLibraryMode:", -[PHImageRequestOptions useLimitedLibraryMode](self, "useLimitedLibraryMode"));
  objc_msgSend(v4, "setDownloadIntent:", -[PHImageRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setDownloadPriority:", -[PHImageRequestOptions downloadPriority](self, "downloadPriority"));
  -[PHImageRequestOptions fallbackTargetSizeIfRequestedSizeNotLocallyAvailable](self, "fallbackTargetSizeIfRequestedSizeNotLocallyAvailable");
  objc_msgSend(v4, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  objc_msgSend(v4, "setCannotReturnSmallerImage:", -[PHImageRequestOptions cannotReturnSmallerImage](self, "cannotReturnSmallerImage"));
  objc_msgSend(v4, "setIgnoreProcessWideRepairLimits:", -[PHImageRequestOptions ignoreProcessWideRepairLimits](self, "ignoreProcessWideRepairLimits"));
  -[PHImageRequestOptions videoFrameTime](self, "videoFrameTime");
  objc_msgSend(v4, "setVideoFrameTime:", v9);
  objc_msgSend(v4, "setChooseAlchemist:", -[PHImageRequestOptions chooseAlchemist](self, "chooseAlchemist"));
  objc_msgSend(v4, "setOpportunisticDegradedImagesToReturn:", -[PHImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn"));
  objc_msgSend(v4, "setUseAsyncForFastOpportunisticResult:", -[PHImageRequestOptions useAsyncForFastOpportunisticResult](self, "useAsyncForFastOpportunisticResult"));
  return v4;
}

- (PHImageRequestOptionsVersion)version
{
  return self->_version;
}

- (int64_t)loadingMode
{
  return self->_loadingMode;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setProgressHandler:(PHAssetImageProgressHandler)progressHandler
{
  objc_setProperty_nonatomic_copy(self, a2, progressHandler, 56);
}

- (PHAssetImageProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)useLimitedLibraryMode
{
  return self->_useLimitedLibraryMode;
}

- (void)setVersion:(PHImageRequestOptionsVersion)version
{
  self->_version = version;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setSynchronous:(BOOL)synchronous
{
  self->_synchronous = synchronous;
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (void)setResizeMode:(PHImageRequestOptionsResizeMode)resizeMode
{
  self->_resizeMode = resizeMode;
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (void)setNormalizedCropRect:(CGRect)normalizedCropRect
{
  self->_normalizedCropRect = normalizedCropRect;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (void)setLoadingMode:(int64_t)a3
{
  self->_loadingMode = a3;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (void)setDeliveryMode:(PHImageRequestOptionsDeliveryMode)deliveryMode
{
  self->_deliveryMode = deliveryMode;
}

- (void)setAllowSecondaryDegradedImage:(BOOL)allowSecondaryDegradedImage
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = allowSecondaryDegradedImage;
  v5 = -[PHImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[PHImageRequestOptions setOpportunisticDegradedImagesToReturn:](self, "setOpportunisticDegradedImagesToReturn:", v5 | v6);
}

- (void)setAllowPlaceholder:(BOOL)a3
{
  self->_allowPlaceholder = a3;
}

- (PHImageRequestOptionsResizeMode)resizeMode
{
  return self->_resizeMode;
}

- (BOOL)onlyUseFetchedAssetPropertiesDuringChoosing
{
  return self->_onlyUseFetchedAssetPropertiesDuringChoosing;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PHImageRequestOptions)init
{
  PHImageRequestOptions *v2;
  PHImageRequestOptions *v3;
  int64_t v4;
  CGSize v5;
  id progressHandler;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHImageRequestOptions;
  v2 = -[PHImageRequestOptions init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_loadingMode = 0;
    v2->_version = 0;
    v2->_deliveryMode = 0;
    if (init_r_onceToken != -1)
      dispatch_once(&init_r_onceToken, &__block_literal_global_42592);
    v4 = init_r_useFastResize;
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v3->_normalizedCropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v3->_normalizedCropRect.size = v5;
    v3->_networkAccessAllowed = 0;
    progressHandler = v3->_progressHandler;
    v3->_resizeMode = v4;
    v3->_progressHandler = 0;

    v3->_allowPlaceholder = 0;
    v3->_onlyUseFetchedAssetPropertiesDuringChoosing = 0;
    v3->_requestID = 0;
    v3->_useLimitedLibraryMode = PLIsLimitedLibraryClient();
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v3->_videoFrameTime.value = *MEMORY[0x1E0CA2E18];
    v3->_videoFrameTime.epoch = *(_QWORD *)(v7 + 16);
    v3->_opportunisticDegradedImagesToReturn = 1;
    v3->_targetHDRHeadroom = 1.0;
  }
  return v3;
}

- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable
{
  double width;
  double height;
  CGSize result;

  width = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width;
  height = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (BOOL)cannotReturnSmallerImage
{
  return self->_cannotReturnSmallerImage;
}

- (BOOL)allowPlaceholder
{
  return self->_allowPlaceholder;
}

- (BOOL)allowSecondaryDegradedImage
{
  return ((unint64_t)-[PHImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn") >> 1) & 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setVideoFrameTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_videoFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_videoFrameTime.value = v3;
}

- (void)setUseLimitedLibraryMode:(BOOL)a3
{
  self->_useLimitedLibraryMode = a3;
}

- (void)setOnlyUseFetchedAssetPropertiesDuringChoosing:(BOOL)a3
{
  self->_onlyUseFetchedAssetPropertiesDuringChoosing = a3;
}

- (void)setIncludeHDRGainMapInIntermediateImage:(BOOL)a3
{
  self->_includeHDRGainMapInIntermediateImage = a3;
}

- (void)setIncludeHDRGainMap:(BOOL)a3
{
  self->_includeHDRGainMap = a3;
}

- (void)setIgnoreProcessWideRepairLimits:(BOOL)a3
{
  self->_ignoreProcessWideRepairLimits = a3;
}

- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3
{
  self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = a3;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (void)setCannotReturnSmallerImage:(BOOL)a3
{
  self->_cannotReturnSmallerImage = a3;
}

- (void)setCachingCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (BOOL)includeHDRGainMap
{
  return self->_includeHDRGainMap;
}

- (BOOL)includeHDRGainMapInIntermediateImage
{
  return self->_includeHDRGainMapInIntermediateImage;
}

- (BOOL)ignoreProcessWideRepairLimits
{
  return self->_ignoreProcessWideRepairLimits;
}

- (id)cachingCompleteHandler
{
  return self->_cachingCompleteHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachingCompleteHandler, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (PHImageRequestOptionsDeliveryMode)deliveryMode
{
  return self->_deliveryMode;
}

uint64_t __29__PHImageRequestOptions_init__block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  init_r_useFastResize = result;
  return result;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  CMTime time;
  CGRect v20;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("version="));
  if (-[PHImageRequestOptions version](self, "version") == PHImageRequestOptionsVersionOriginal)
  {
    v4 = CFSTR("orig");
  }
  else if (-[PHImageRequestOptions version](self, "version") == PHImageRequestOptionsVersionUnadjusted)
  {
    v4 = CFSTR("unadj");
  }
  else if (-[PHImageRequestOptions version](self, "version"))
  {
    if (-[PHImageRequestOptions version](self, "version") != 8)
      goto LABEL_10;
    v4 = CFSTR("penult");
  }
  else
  {
    v4 = CFSTR("curr");
  }
  objc_msgSend(v3, "appendString:", v4);
LABEL_10:
  -[PHImageRequestOptions normalizedCropRect](self, "normalizedCropRect");
  if (!CGRectEqualToRect(v20, *MEMORY[0x1E0C9D648]))
  {
    -[PHImageRequestOptions normalizedCropRect](self, "normalizedCropRect");
    v6 = v5;
    -[PHImageRequestOptions normalizedCropRect](self, "normalizedCropRect");
    v8 = v7;
    -[PHImageRequestOptions normalizedCropRect](self, "normalizedCropRect");
    v10 = v9;
    -[PHImageRequestOptions normalizedCropRect](self, "normalizedCropRect");
    objc_msgSend(v3, "appendFormat:", CFSTR(", cropRect={%0.3lf,%0.3lf,%0.3lfx%0.3lf}"), v6, v8, v10, v11);
  }
  if (-[PHImageRequestOptions resizeMode](self, "resizeMode") == PHImageRequestOptionsResizeModeFast)
  {
    v12 = CFSTR(", resize=fast");
  }
  else
  {
    if (-[PHImageRequestOptions resizeMode](self, "resizeMode") != PHImageRequestOptionsResizeModeExact)
      goto LABEL_17;
    v12 = CFSTR(", resize=exact");
  }
  objc_msgSend(v3, "appendString:", v12);
LABEL_17:
  objc_msgSend(v3, "appendString:", CFSTR(", delivery="));
  if (-[PHImageRequestOptions deliveryMode](self, "deliveryMode"))
  {
    if (-[PHImageRequestOptions deliveryMode](self, "deliveryMode") == PHImageRequestOptionsDeliveryModeHighQualityFormat)
    {
      v13 = CFSTR("ask");
    }
    else if (-[PHImageRequestOptions deliveryMode](self, "deliveryMode") == PHImageRequestOptionsDeliveryModeFastFormat)
    {
      v13 = CFSTR("fst");
    }
    else
    {
      if (-[PHImageRequestOptions deliveryMode](self, "deliveryMode") != (PHImageRequestOptionsDeliveryModeFastFormat|PHImageRequestOptionsDeliveryModeHighQualityFormat))
        goto LABEL_31;
      v13 = CFSTR("ask-non-derivative");
    }
    goto LABEL_30;
  }
  objc_msgSend(v3, "appendString:", CFSTR("ask+"));
  if ((-[PHImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn") & 1) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("[fst"));
    if (-[PHImageRequestOptions useAsyncForFastOpportunisticResult](self, "useAsyncForFastOpportunisticResult"))
      objc_msgSend(v3, "appendString:", CFSTR("-async"));
    objc_msgSend(v3, "appendString:", CFSTR("]"));
  }
  if ((-[PHImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn") & 2) != 0)
  {
    v13 = CFSTR("[int]");
LABEL_30:
    objc_msgSend(v3, "appendString:", v13);
  }
LABEL_31:
  objc_msgSend(v3, "appendString:", CFSTR(", loading=img"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 1) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+data"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 0x10000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+URL"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 0x40000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+BGRA"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 0x80000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+hipriodec"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 0x100000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+nofallback"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 0x200000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+swjpeg"));
  if ((-[PHImageRequestOptions loadingMode](self, "loadingMode") & 0x400000) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("+lowmemdec"));
  if (-[PHImageRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"))
    objc_msgSend(v3, "appendString:", CFSTR("+network"));
  v14 = -[PHImageRequestOptions downloadIntent](self, "downloadIntent");
  if (v14)
  {
    _PHDownloadIntentName(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _PHDownloadPriorityName(-[PHImageRequestOptions downloadPriority](self, "downloadPriority"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("+downloadIntent:%@+downloadPriority:%@"), v15, v16);

  }
  if ((self->_videoFrameTime.flags & 1) != 0)
  {
    time = (CMTime)self->_videoFrameTime;
    v17 = (__CFString *)CMTimeCopyDescription(0, &time);
    objc_msgSend(v3, "appendFormat:", CFSTR("+videoFrameTime:%@"), v17);

  }
  return (NSString *)v3;
}

- (void)setOpportunisticDegradedImagesToReturn:(int64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImageManager.m"), 456, CFSTR("opportunisticDegradedImagesToReturn cannot be zero."));

  }
  self->_opportunisticDegradedImagesToReturn = a3;
}

- (BOOL)useAsyncForFastOpportunisticResult
{
  return self->_useAsyncForFastOpportunisticResult;
}

- (void)setUseAsyncForFastOpportunisticResult:(BOOL)a3
{
  self->_useAsyncForFastOpportunisticResult = a3;
}

- (int64_t)opportunisticDegradedImagesToReturn
{
  return self->_opportunisticDegradedImagesToReturn;
}

- (BOOL)chooseAlchemist
{
  return self->_chooseAlchemist;
}

- (void)setChooseAlchemist:(BOOL)a3
{
  self->_chooseAlchemist = a3;
}

@end
