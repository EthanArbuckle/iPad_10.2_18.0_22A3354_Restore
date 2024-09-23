@implementation PHVideoRequestContext

- (PHVideoRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 intent:(int64_t)a8 resultHandler:(id)a9
{
  uint64_t v14;
  id v16;
  PHVideoRequestContext *v17;
  PHVideoRequestContext *v18;
  id *p_videoOptions;
  NSObject *v20;
  char v21;
  id v22;
  NSObject *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v14 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PHVideoRequestContext;
  v17 = -[PHMediaRequestContext initWithRequestID:managerID:asset:displaySpec:resultHandler:](&v26, sel_initWithRequestID_managerID_asset_displaySpec_resultHandler_, v14, a4, a5, a6, a9);
  v18 = v17;
  if (v17)
  {
    p_videoOptions = (id *)&v17->_videoOptions;
    objc_storeStrong((id *)&v17->_videoOptions, a7);
    v18->_intent = a8;
    if (objc_msgSend(*p_videoOptions, "version") && objc_msgSend(*p_videoOptions, "deliveryMode"))
    {
      PLImageManagerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Video request delivery mode is only applicable for current version requests", buf, 2u);
      }

    }
    v25 = 0;
    v21 = objc_msgSend(v16, "isValidConfigurationWithError:", &v25);
    v22 = v25;
    if ((v21 & 1) == 0)
    {
      PLImageManagerGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Invalid options configuration for video request: %@", buf, 0xCu);
      }

    }
  }

  return v18;
}

- (id)_lazyProgress
{
  NSProgress *progress;
  NSProgress *v4;
  NSProgress *v5;

  progress = self->_progress;
  if (!progress)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    v5 = self->_progress;
    self->_progress = v4;

    progress = self->_progress;
  }
  return progress;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHVideoRequestOptions isNetworkAccessAllowed](self->_videoOptions, "isNetworkAccessAllowed");
}

- (BOOL)representsShareableHighQualityResource
{
  return (unint64_t)(self->_intent - 1) < 2;
}

- (id)initialRequests
{
  PHVideoRequestBehaviorSpec *v3;
  PHVideoRequestOptions *videoOptions;
  PHVideoRequest *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  PHVideoRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  -[PHVideoRequestBehaviorSpec setNetworkAccessAllowed:](v3, "setNetworkAccessAllowed:", -[PHVideoRequestOptions isNetworkAccessAllowed](self->_videoOptions, "isNetworkAccessAllowed"));
  -[PHVideoRequestBehaviorSpec setDeliveryMode:](v3, "setDeliveryMode:", -[PHVideoRequestOptions deliveryMode](self->_videoOptions, "deliveryMode"));
  -[PHVideoRequestBehaviorSpec setVersion:](v3, "setVersion:", -[PHVideoRequestOptions version](self->_videoOptions, "version"));
  -[PHVideoRequestBehaviorSpec setStreamingAllowed:](v3, "setStreamingAllowed:", -[PHVideoRequestOptions isStreamingAllowed](self->_videoOptions, "isStreamingAllowed"));
  -[PHVideoRequestBehaviorSpec setStreamingVideoIntent:](v3, "setStreamingVideoIntent:", -[PHVideoRequestOptions streamingVideoIntent](self->_videoOptions, "streamingVideoIntent"));
  -[PHVideoRequestBehaviorSpec setVideoComplementAllowed:](v3, "setVideoComplementAllowed:", -[PHVideoRequestOptions isVideoComplementAllowed](self->_videoOptions, "isVideoComplementAllowed"));
  -[PHVideoRequestBehaviorSpec setMediumHighQualityAllowed:](v3, "setMediumHighQualityAllowed:", -[PHVideoRequestOptions isMediumHighQualityAllowed](self->_videoOptions, "isMediumHighQualityAllowed"));
  -[PHVideoRequestBehaviorSpec setRestrictToPlayableOnCurrentDevice:](v3, "setRestrictToPlayableOnCurrentDevice:", -[PHVideoRequestOptions restrictToPlayableOnCurrentDevice](self->_videoOptions, "restrictToPlayableOnCurrentDevice"));
  -[PHVideoRequestBehaviorSpec setRestrictToStreamable:](v3, "setRestrictToStreamable:", -[PHVideoRequestOptions restrictToStreamable](self->_videoOptions, "restrictToStreamable"));
  -[PHVideoRequestBehaviorSpec setRestrictToEncryptedStream:](v3, "setRestrictToEncryptedStream:", -[PHVideoRequestOptions restrictToEncryptedStream](self->_videoOptions, "restrictToEncryptedStream"));
  -[PHVideoRequestBehaviorSpec setDownloadIntent:](v3, "setDownloadIntent:", -[PHVideoRequestOptions downloadIntent](self->_videoOptions, "downloadIntent"));
  -[PHVideoRequestBehaviorSpec setDownloadPriority:](v3, "setDownloadPriority:", -[PHVideoRequestOptions downloadPriority](self->_videoOptions, "downloadPriority"));
  videoOptions = self->_videoOptions;
  if (videoOptions)
    -[PHVideoRequestOptions timeRange](videoOptions, "timeRange");
  else
    memset(v17, 0, sizeof(v17));
  -[PHVideoRequestBehaviorSpec setTimeRange:](v3, "setTimeRange:", v17);
  v5 = [PHVideoRequest alloc];
  v6 = -[PHMediaRequestContext requestID](self, "requestID");
  v7 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v8 = -[PHVideoRequestContext type](self, "type");
  v9 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext displaySpec](self, "displaySpec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PHVideoRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:](v5, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:", v6, v7, v8, v9, v10, v11, v3, self);

  -[PHVideoRequestContext _lazyProgress](self, "_lazyProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest identifierString](v12, "identifierString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v13, v14);

  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)progressHandler
{
  return -[PHVideoRequestOptions progressHandler](self->_videoOptions, "progressHandler");
}

- (id)progresses
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress"))
    return 0;
  -[PHVideoRequestContext _lazyProgress](self, "_lazyProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**resultHandler)(id, id, id, PHVideoRequestContext *);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLImageManagerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "identifierString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "info");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "[RM]: %@ finished with video URL: %@, info: %@", buf, 0x20u);

  }
  if (PHImageManagerRecordEnabled())
  {
    v13 = objc_msgSend(v7, "requestID");
    objc_msgSend(v7, "identifierString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", v13, CFSTR("[RM]: %@ finished with video URL: %@, info: %@"), v14, v15, v16);

  }
  resultHandler = (void (**)(id, id, id, PHVideoRequestContext *))self->super._resultHandler;
  if (resultHandler)
    resultHandler[2](resultHandler, v6, v7, self);

}

- (PHVideoRequestOptions)videoOptions
{
  return self->_videoOptions;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoOptions, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
