@implementation PHVideoRequestOptions

- (BOOL)isCurrentVersion
{
  return -[PHVideoRequestOptions version](self, "version") == PHVideoRequestOptionsVersionCurrent;
}

- (PHVideoRequestOptions)init
{
  PHVideoRequestOptions *v2;
  PHVideoRequestOptions *v3;
  id progressHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHVideoRequestOptions;
  v2 = -[PHVideoRequestOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_includeTimeRangeMapper = 0;
    *(_WORD *)&v2->_networkAccessAllowed = 0;
    v2->_allowMediumHighQuality = 0;
    v2->_version = 0;
    v2->_deliveryMode = 0;
    progressHandler = v2->_progressHandler;
    v2->_progressHandler = 0;

    *(_WORD *)&v3->_restrictToPlayableOnCurrentDevice = 1;
    v3->_restrictToEncryptedStream = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setVersion:", -[PHVideoRequestOptions version](self, "version"));
  objc_msgSend(v4, "setDeliveryMode:", -[PHVideoRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHVideoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v4, "setStreamingAllowed:", -[PHVideoRequestOptions isStreamingAllowed](self, "isStreamingAllowed"));
  objc_msgSend(v4, "setStreamingVideoIntent:", -[PHVideoRequestOptions streamingVideoIntent](self, "streamingVideoIntent"));
  objc_msgSend(v4, "setVideoComplementAllowed:", -[PHVideoRequestOptions isVideoComplementAllowed](self, "isVideoComplementAllowed"));
  -[PHVideoRequestOptions progressHandler](self, "progressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgressHandler:", v5);

  -[PHVideoRequestOptions targetSize](self, "targetSize");
  objc_msgSend(v4, "setTargetSize:");
  objc_msgSend(v4, "setContentMode:", -[PHVideoRequestOptions contentMode](self, "contentMode"));
  objc_msgSend(v4, "setRestrictToPlayableOnCurrentDevice:", -[PHVideoRequestOptions restrictToPlayableOnCurrentDevice](self, "restrictToPlayableOnCurrentDevice"));
  objc_msgSend(v4, "setRestrictToStreamable:", -[PHVideoRequestOptions restrictToStreamable](self, "restrictToStreamable"));
  objc_msgSend(v4, "setRestrictToEncryptedStream:", -[PHVideoRequestOptions restrictToEncryptedStream](self, "restrictToEncryptedStream"));
  objc_msgSend(v4, "setAllowMediumHighQuality:", -[PHVideoRequestOptions isMediumHighQualityAllowed](self, "isMediumHighQualityAllowed"));
  -[PHVideoRequestOptions resultHandlerQueue](self, "resultHandlerQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultHandlerQueue:", v6);

  objc_msgSend(v4, "setLiveRenderVideoIfNeeded:", -[PHVideoRequestOptions liveRenderVideoIfNeeded](self, "liveRenderVideoIfNeeded"));
  objc_msgSend(v4, "setLiveRenderAndOnDemandRenderVideoConcurrently:", -[PHVideoRequestOptions liveRenderAndOnDemandRenderVideoConcurrently](self, "liveRenderAndOnDemandRenderVideoConcurrently"));
  objc_msgSend(v4, "setDownloadIntent:", -[PHVideoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setDownloadPriority:", -[PHVideoRequestOptions downloadPriority](self, "downloadPriority"));
  -[PHVideoRequestOptions timeRange](self, "timeRange");
  objc_msgSend(v4, "setTimeRange:", &v8);
  objc_msgSend(v4, "setIncludeTimeRangeMapper:", -[PHVideoRequestOptions includeTimeRangeMapper](self, "includeTimeRangeMapper"));
  return v4;
}

- (BOOL)isValidConfigurationWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  const __CFString *v8;

  if (-[PHVideoRequestOptions restrictToStreamable](self, "restrictToStreamable"))
  {
    if (-[PHVideoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"))
    {
      if (-[PHVideoRequestOptions isStreamingAllowed](self, "isStreamingAllowed"))
        goto LABEL_4;
      v8 = CFSTR("Restricting to streamable assets with streamable disallowed");
    }
    else
    {
      v8 = CFSTR("Restricting to streamable assets with network access disallowed");
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3306, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_4:
  v5 = 0;
  v6 = 1;
  if (a3)
LABEL_5:
    *a3 = objc_retainAutorelease(v5);
LABEL_6:

  return v6;
}

- (void)setRestrictToStreamable:(BOOL)a3
{
  self->_restrictToStreamable = a3;
  if (a3)
  {
    -[PHVideoRequestOptions setStreamingAllowed:](self, "setStreamingAllowed:", 1);
    -[PHVideoRequestOptions setNetworkAccessAllowed:](self, "setNetworkAccessAllowed:", 1);
  }
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  const __CFAllocator *v10;
  __CFString *v11;
  CMTimeRange range;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("version="));
  if (-[PHVideoRequestOptions version](self, "version") == PHVideoRequestOptionsVersionOriginal)
  {
    v4 = CFSTR("orig");
LABEL_3:
    objc_msgSend(v3, "appendString:", v4);
    goto LABEL_5;
  }
  if (-[PHVideoRequestOptions version](self, "version") == PHVideoRequestOptionsVersionCurrent)
  {
    objc_msgSend(v3, "appendString:", CFSTR("curr"));
    if (-[PHVideoRequestOptions deliveryMode](self, "deliveryMode") == PHVideoRequestOptionsDeliveryModeAutomatic)
    {
      v4 = CFSTR("+auto");
      goto LABEL_3;
    }
    if (-[PHVideoRequestOptions deliveryMode](self, "deliveryMode") == PHVideoRequestOptionsDeliveryModeHighQualityFormat)
    {
      v4 = CFSTR("+high");
      goto LABEL_3;
    }
    if (-[PHVideoRequestOptions deliveryMode](self, "deliveryMode") == PHVideoRequestOptionsDeliveryModeMediumQualityFormat)
    {
      v4 = CFSTR("+med");
      goto LABEL_3;
    }
    if (-[PHVideoRequestOptions deliveryMode](self, "deliveryMode") == PHVideoRequestOptionsDeliveryModeFastFormat)
    {
      v4 = CFSTR("+fst");
      goto LABEL_3;
    }
    if (-[PHVideoRequestOptions deliveryMode](self, "deliveryMode") == 4)
    {
      v4 = CFSTR("+large");
      goto LABEL_3;
    }
  }
LABEL_5:
  if (-[PHVideoRequestOptions isMediumHighQualityAllowed](self, "isMediumHighQualityAllowed"))
    objc_msgSend(v3, "appendString:", CFSTR("+HQ"));
  if (-[PHVideoRequestOptions isStreamingAllowed](self, "isStreamingAllowed"))
    objc_msgSend(v3, "appendString:", CFSTR("+stream"));
  v5 = -[PHVideoRequestOptions streamingVideoIntent](self, "streamingVideoIntent");
  if (v5)
  {
    _PHStreamingVideoIntentName(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("+streamingIntent:%@"), v6);

  }
  v7 = -[PHVideoRequestOptions downloadIntent](self, "downloadIntent");
  if (v7)
  {
    _PHDownloadIntentName(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _PHDownloadPriorityName(-[PHVideoRequestOptions downloadPriority](self, "downloadPriority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("+downloadIntent:%@+downloadPriority:%@"), v8, v9);

  }
  if (-[PHVideoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"))
    objc_msgSend(v3, "appendString:", CFSTR("+network"));
  if (-[PHVideoRequestOptions hasValidTimeRange](self, "hasValidTimeRange"))
  {
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    -[PHVideoRequestOptions timeRange](self, "timeRange");
    v11 = (__CFString *)CMTimeRangeCopyDescription(v10, &range);
    objc_msgSend(v3, "appendString:", CFSTR("+timeRange="));
    objc_msgSend(v3, "appendString:", v11);

  }
  if (-[PHVideoRequestOptions includeTimeRangeMapper](self, "includeTimeRangeMapper"))
    objc_msgSend(v3, "appendString:", CFSTR("+timeRangeMapper"));
  if (-[PHVideoRequestOptions restrictToStreamable](self, "restrictToStreamable"))
    objc_msgSend(v3, "appendString:", CFSTR("+streamOnly"));
  if (-[PHVideoRequestOptions restrictToEncryptedStream](self, "restrictToEncryptedStream"))
    objc_msgSend(v3, "appendString:", CFSTR("+encrypted"));
  return (NSString *)v3;
}

- (BOOL)hasValidTimeRange
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  -[PHVideoRequestOptions timeRange](self, "timeRange");
  if ((v7 & 1) == 0)
    return 0;
  -[PHVideoRequestOptions timeRange](self, "timeRange");
  if ((v6 & 1) == 0)
    return 0;
  -[PHVideoRequestOptions timeRange](self, "timeRange");
  if (v5)
    return 0;
  -[PHVideoRequestOptions timeRange](self, "timeRange");
  return v4 >= 0;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (PHVideoRequestOptionsVersion)version
{
  return self->_version;
}

- (void)setVersion:(PHVideoRequestOptionsVersion)version
{
  self->_version = version;
}

- (PHVideoRequestOptionsDeliveryMode)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setDeliveryMode:(PHVideoRequestOptionsDeliveryMode)deliveryMode
{
  self->_deliveryMode = deliveryMode;
}

- (PHAssetVideoProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(PHAssetVideoProgressHandler)progressHandler
{
  objc_setProperty_nonatomic_copy(self, a2, progressHandler, 40);
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (void)setStreamingAllowed:(BOOL)a3
{
  self->_streamingAllowed = a3;
}

- (int64_t)streamingVideoIntent
{
  return self->_streamingVideoIntent;
}

- (void)setStreamingVideoIntent:(int64_t)a3
{
  self->_streamingVideoIntent = a3;
}

- (BOOL)isVideoComplementAllowed
{
  return self->_videoComplementAllowed;
}

- (void)setVideoComplementAllowed:(BOOL)a3
{
  self->_videoComplementAllowed = a3;
}

- (BOOL)isMediumHighQualityAllowed
{
  return self->_allowMediumHighQuality;
}

- (void)setAllowMediumHighQuality:(BOOL)a3
{
  self->_allowMediumHighQuality = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return self->_restrictToPlayableOnCurrentDevice;
}

- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3
{
  self->_restrictToPlayableOnCurrentDevice = a3;
}

- (BOOL)restrictToStreamable
{
  return self->_restrictToStreamable;
}

- (BOOL)restrictToEncryptedStream
{
  return self->_restrictToEncryptedStream;
}

- (void)setRestrictToEncryptedStream:(BOOL)a3
{
  self->_restrictToEncryptedStream = a3;
}

- (BOOL)liveRenderVideoIfNeeded
{
  return self->_liveRenderVideoIfNeeded;
}

- (void)setLiveRenderVideoIfNeeded:(BOOL)a3
{
  self->_liveRenderVideoIfNeeded = a3;
}

- (BOOL)liveRenderAndOnDemandRenderVideoConcurrently
{
  return self->_liveRenderAndOnDemandRenderVideoConcurrently;
}

- (void)setLiveRenderAndOnDemandRenderVideoConcurrently:(BOOL)a3
{
  self->_liveRenderAndOnDemandRenderVideoConcurrently = a3;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- ($C628252E21E0084D991546AFB91829E6)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (BOOL)includeTimeRangeMapper
{
  return self->_includeTimeRangeMapper;
}

- (void)setIncludeTimeRangeMapper:(BOOL)a3
{
  self->_includeTimeRangeMapper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (BOOL)isSynchronous
{
  return 0;
}

@end
