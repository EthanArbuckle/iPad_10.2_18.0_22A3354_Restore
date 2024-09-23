@implementation PHContentEditingInputRequestContext

- (PHContentEditingInputRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8
{
  uint64_t v13;
  id v15;
  PHContentEditingInputRequestContext *v16;
  PHContentEditingInputRequestContext *v17;
  PHContentEditingInputResult *v18;
  PHContentEditingInputResult *contentEditingInputResult;
  NSMutableIndexSet *v20;
  NSMutableIndexSet *requestIndexesOfAssetResourceRequests;
  objc_super v23;

  v13 = *(_QWORD *)&a3;
  v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PHContentEditingInputRequestContext;
  v16 = -[PHMediaRequestContext initWithRequestID:managerID:asset:displaySpec:resultHandler:](&v23, sel_initWithRequestID_managerID_asset_displaySpec_resultHandler_, v13, a4, a5, 0, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_options, a6);
    v17->_useRAWAsUnadjustedBase = a7;
    v17->_lock._os_unfair_lock_opaque = 0;
    v18 = -[PHCompositeMediaResult initWithRequestID:]([PHContentEditingInputResult alloc], "initWithRequestID:", v13);
    contentEditingInputResult = v17->_contentEditingInputResult;
    v17->_contentEditingInputResult = v18;

    v20 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    requestIndexesOfAssetResourceRequests = v17->_requestIndexesOfAssetResourceRequests;
    v17->_requestIndexesOfAssetResourceRequests = v20;

  }
  return v17;
}

- (BOOL)_shouldRequestImage
{
  void *v2;
  char v3;

  -[PHMediaRequestContext asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPhoto");

  return v3;
}

- (BOOL)_shouldRequestVideo
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[PHMediaRequestContext asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPhotoIris"))
  {
    if (-[PHContentEditingInputRequestOptions forceReturnFullLivePhoto](self->_options, "forceReturnFullLivePhoto"))
    {
      v4 = 1;
    }
    else
    {
      -[PHMediaRequestContext asset](self, "asset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "canPlayPhotoIris") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[PHMediaRequestContext asset](self, "asset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "canPlayMirror") & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          -[PHMediaRequestContext asset](self, "asset");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v7, "canPlayAutoloop");

        }
      }

    }
  }
  else
  {
    v4 = 0;
  }

  -[PHMediaRequestContext asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isVideo") | v4;

  return v9;
}

- (id)_lazyAdjustmentProgress
{
  NSProgress *v3;
  NSProgress *adjustmentProgress;

  if (!self->_adjustmentProgress && -[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 10);
    v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    adjustmentProgress = self->_adjustmentProgress;
    self->_adjustmentProgress = v3;

  }
  return self->_adjustmentProgress;
}

- (id)_lazyImageProgress
{
  uint64_t v3;
  NSProgress *v4;
  NSProgress *imageProgress;

  if (!self->_imageProgress && -[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress"))
  {
    if (-[PHContentEditingInputRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
      v3 = 45;
    else
      v3 = 90;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v3);
    v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    imageProgress = self->_imageProgress;
    self->_imageProgress = v4;

  }
  return self->_imageProgress;
}

- (id)_lazyVideoProgress
{
  uint64_t v3;
  NSProgress *v4;
  NSProgress *videoProgress;

  if (!self->_videoProgress && -[PHMediaRequestContext shouldReportProgress](self, "shouldReportProgress"))
  {
    if (-[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage"))
      v3 = 45;
    else
      v3 = 90;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v3);
    v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    videoProgress = self->_videoProgress;
    self->_videoProgress = v4;

  }
  return self->_videoProgress;
}

- (id)_videoBehaviorSpecForBaseVersion:(int64_t)a3
{
  PHVideoRequestBehaviorSpec *v5;
  void *v6;

  v5 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  -[PHVideoRequestBehaviorSpec setDeliveryMode:](v5, "setDeliveryMode:", 1);
  -[PHVideoRequestBehaviorSpec setNetworkAccessAllowed:](v5, "setNetworkAccessAllowed:", -[PHContentEditingInputRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  -[PHMediaRequestContext asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHVideoRequestBehaviorSpec setVideoComplementAllowed:](v5, "setVideoComplementAllowed:", objc_msgSend(v6, "isPhotoIris"));

  -[PHVideoRequestBehaviorSpec setDownloadIntent:](v5, "setDownloadIntent:", -[PHContentEditingInputRequestContext downloadIntent](self, "downloadIntent"));
  -[PHVideoRequestBehaviorSpec setVersion:](v5, "setVersion:", +[PHAdjustmentData videoRequestVersionFromAdjustmentBaseVersion:](PHAdjustmentData, "videoRequestVersionFromAdjustmentBaseVersion:", a3));
  return v5;
}

- (int64_t)_adjustmentBaseVersionFromResult:(id)a3 request:(id)a4 canHandleAdjustmentData:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = 0;
  -[PHContentEditingInputRequestContext options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "forceRunAsUnadjustedAsset");

  if (v11)
  {
    PLImageManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "identifierString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "[RM] %@ Force run as unadjusted base", buf, 0xCu);

    }
    v14 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v8, "adjustmentData");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D71C78]))
  {
    if (objc_msgSend(v15, "code") == 3)
    {

LABEL_10:
      v15 = 0;
      v12 = 0;
LABEL_13:
      v14 = 0;
      goto LABEL_14;
    }
    v17 = objc_msgSend(v15, "code");

    if (v17 == 4)
      goto LABEL_10;
  }
  else
  {

  }
  if (!v12)
    goto LABEL_13;
  -[PHContentEditingInputRequestOptions canHandleAdjustmentData](self->_options, "canHandleAdjustmentData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSObject _contentEditing_requiredBaseVersionReadableByClient:verificationBlock:](v12, "_contentEditing_requiredBaseVersionReadableByClient:verificationBlock:", &v24, v18);

LABEL_14:
  PLImageManagerGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "identifierString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 > 2)
      v21 = CFSTR("unknown");
    else
      v21 = off_1E35DA790[v14];
    v22 = v21;
    *(_DWORD *)buf = 138543874;
    v26 = v20;
    v27 = 2114;
    v28 = v22;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Calculated adjustment base: %{public}@ from adjustment data: %@", buf, 0x20u);

  }
LABEL_20:

  if (a5)
    *a5 = v24;

  return v14;
}

- (BOOL)_canSkipMediaMetadataCheckWithBaseVersion:(int64_t)a3
{
  return 1;
}

- (void)_renderVideoFromVideoURL:(id)a3 asset:(id)a4 adjustmentData:(id)a5 canHandleAdjustmentData:(BOOL)a6 resultHandler:(id)a7
{
  id v12;
  void (**v13)(id, id, _QWORD);
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, id, _QWORD);

  v12 = a3;
  v13 = (void (**)(id, id, _QWORD))a7;
  v14 = (objc_class *)MEMORY[0x1E0D75308];
  v15 = a5;
  v16 = a4;
  v17 = [v14 alloc];
  objc_msgSend(v15, "formatIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "formatVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v17, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v18, v19, v20, 0, 0, 0);
  LOBYTE(v17) = objc_msgSend(v16, "isPhotoIris");

  if ((v17 & 1) != 0 || a6 || (objc_msgSend(v21, "isRecognizedFormat") & 1) == 0)
  {
    v13[2](v13, v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v22, v21);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __123__PHContentEditingInputRequestContext__renderVideoFromVideoURL_asset_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke;
    v24[3] = &unk_1E35DD990;
    v25 = v13;
    -[PHContentEditingInputRequestContext _renderTemporaryVideoForObjectBuilder:resultHandler:](self, "_renderTemporaryVideoForObjectBuilder:resultHandler:", v23, v24);

  }
}

- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0C89E98];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke;
  v8[3] = &unk_1E35DD9B8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a3, "requestExportSessionWithExportPreset:resultHandler:", v6, v8);

}

- (id)_baseMediaRequestsForBaseVersion:(int64_t)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  NSObject *v14;
  unint64_t v15;
  int v16;
  void *v17;
  PHVideoRequest *v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  PHVideoRequest *v26;
  _BOOL8 v27;
  int64_t v28;
  _BOOL8 useRAWAsUnadjustedBase;
  void *v30;
  PHImageResourceChooser *v31;
  void *v32;
  PHImageResourceChooser *v33;
  PHImageResourceChooser *backupChooser;
  PHImageRequest *v35;
  uint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  void *v41;
  PHImageRequest *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  unint64_t v47;
  uint64_t v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int64_t v56;
  void *v57;
  int64_t v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  NSObject *v62;
  PHVideoRequest *v63;
  PHVideoRequest *videoRequest;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  char v71;
  unint64_t v72;
  uint64_t v73;
  __CFString *v74;
  PHRepairRequest *repairRequest;
  unint64_t v76;
  int v77;
  unint64_t v78;
  uint64_t v79;
  __CFString *v80;
  _BOOL4 v81;
  NSObject *v82;
  unint64_t v83;
  uint64_t v84;
  __CFString *v85;
  __CFString *v86;
  void *v87;
  __CFString *v88;
  uint64_t v89;
  __CFString *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  unint64_t v94;
  uint64_t v95;
  __CFString *v96;
  __CFString *v97;
  __CFString *v98;
  void *v99;
  __CFString *v100;
  PHRepairRequest *v101;
  uint64_t v102;
  void *v103;
  unint64_t v104;
  int64_t v105;
  unint64_t v106;
  void *v107;
  void *v108;
  unint64_t v109;
  PHRepairRequest *v110;
  PHRepairRequest *v111;
  void *v112;
  __CFString *v114;
  const char *v115;
  void *v116;
  PHVideoRequest *v117;
  uint8_t buf[4];
  unint64_t v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  const __CFString *v124;
  __int16 v125;
  const __CFString *v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PLImageManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[PHMediaRequestContext managerID](self, "managerID");
    v9 = -[PHMediaRequestContext requestID](self, "requestID");
    if (-[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage"))
      v10 = CFSTR("Y");
    else
      v10 = CFSTR("N");
    *(_DWORD *)buf = 134218754;
    if (-[PHContentEditingInputRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
      v11 = CFSTR("Y");
    else
      v11 = CFSTR("N");
    v120 = v8;
    v121 = 2048;
    v122 = v9;
    v123 = 2112;
    v124 = v10;
    v125 = 2112;
    v126 = v11;
    _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld Preparing media requests, for images: %@, video: %@", buf, 0x2Au);
  }

  -[PHContentEditingInputRequestContext options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "forcePrepareCurrentBaseVersionInAddition");

  if (a3 != 2 && v13)
  {
    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = -[PHMediaRequestContext managerID](self, "managerID");
      v16 = -[PHMediaRequestContext requestID](self, "requestID");
      *(_DWORD *)buf = 134218240;
      v120 = v15;
      v121 = 2048;
      v122 = v16;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld Can handle adjustment data, but also need adjusted FullSizeRenders for extensions (like Markup), kicking off additional requests", buf, 0x16u);
    }

    if (-[PHContentEditingInputRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
    {
      -[PHContentEditingInputRequestContext _videoBehaviorSpecForBaseVersion:](self, "_videoBehaviorSpecForBaseVersion:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [PHVideoRequest alloc];
      v19 = -[PHMediaRequestContext requestID](self, "requestID");
      v20 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
      v21 = -[PHContentEditingInputRequestContext type](self, "type");
      v22 = a3;
      v23 = -[PHMediaRequestContext managerID](self, "managerID");
      -[PHMediaRequestContext asset](self, "asset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      a3 = v22;
      v26 = -[PHVideoRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:](v18, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:", v19, v20, v21, v25, v24, 0, v17, self);

      objc_msgSend(v6, "addObject:", v26);
    }
    if (-[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage"))
    {
      v27 = -[PHContentEditingInputRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed");
      v28 = -[PHContentEditingInputRequestContext downloadIntent](self, "downloadIntent");
      useRAWAsUnadjustedBase = self->_useRAWAsUnadjustedBase;
      -[PHMediaRequestContext asset](self, "asset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImageRequestBehaviorSpec contentEditingInputImageBehaviorSpecForBaseVersion:isNetworkAccessAllowed:downloadIntent:shouldUseRAWAsUnadjustedBase:asset:](PHImageRequestBehaviorSpec, "contentEditingInputImageBehaviorSpecForBaseVersion:isNetworkAccessAllowed:downloadIntent:shouldUseRAWAsUnadjustedBase:asset:", 2, v27, v28, useRAWAsUnadjustedBase, v30);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = [PHImageResourceChooser alloc];
      -[PHMediaRequestContext asset](self, "asset");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PHImageResourceChooser initWithAsset:resourceHandler:](v31, "initWithAsset:resourceHandler:", v32, 0);
      backupChooser = self->_backupChooser;
      self->_backupChooser = v33;

      v35 = [PHImageRequest alloc];
      v36 = -[PHMediaRequestContext requestID](self, "requestID");
      v37 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
      v38 = -[PHContentEditingInputRequestContext type](self, "type");
      v39 = -[PHMediaRequestContext managerID](self, "managerID");
      -[PHMediaRequestContext asset](self, "asset");
      v40 = a3;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v35, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v36, v37, v38, v39, v41, 0, v116, self->_backupChooser, self);

      a3 = v40;
      objc_msgSend(v6, "addObject:", v42);

    }
  }
  if (!-[PHContentEditingInputRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
  {
    if (-[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage"))
      goto LABEL_48;
LABEL_52:
    v87 = 0;
    goto LABEL_70;
  }
  -[PHMediaRequestContext asset](self, "asset");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "isPhotoIris"))
    v44 = 3;
  else
    v44 = 1;
  v45 = -[PHContentEditingInputRequestContext _assetResourceTypeForResourceType:withBaseVersion:](self, "_assetResourceTypeForResourceType:withBaseVersion:", v44, a3);

  PLImageManagerGetLog();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    v47 = -[PHMediaRequestContext managerID](self, "managerID");
    v48 = -[PHMediaRequestContext requestID](self, "requestID");
    _PHAssetResourceTypeDescription(v45);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a3 > 2)
      v50 = CFSTR("unknown");
    else
      v50 = off_1E35DA790[a3];
    v51 = v50;
    *(_DWORD *)buf = 134218754;
    v120 = v47;
    v121 = 2048;
    v122 = v48;
    v123 = 2112;
    v124 = v49;
    v125 = 2112;
    v126 = v51;
    _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld determined video asset resource type: %@ for base version: %@", buf, 0x2Au);

  }
  -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    -[PHMediaRequestContext asset](self, "asset");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isPhotoIris");

    if (v69)
    {
      -[PHMediaRequestContext asset](self, "asset");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "canPlayPhotoIris");

      if (a3 && (v71 & 1) == 0)
      {
        PLImageManagerGetLog();
        v62 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v72 = -[PHMediaRequestContext managerID](self, "managerID");
        v73 = -[PHMediaRequestContext requestID](self, "requestID");
        if ((unint64_t)a3 > 2)
          v74 = CFSTR("unknown");
        else
          v74 = off_1E35DA790[a3];
        v114 = v74;
        *(_DWORD *)buf = 134218498;
        v120 = v72;
        v121 = 2048;
        v122 = v73;
        v123 = 2112;
        v124 = v114;
        v115 = "[RM] %ld-%ld Live photo edit request allowing missing video, reason: unplayable, base version: %@";
LABEL_77:
        _os_log_impl(&dword_1991EC000, v62, OS_LOG_TYPE_DEFAULT, v115, buf, 0x20u);

        goto LABEL_30;
      }
      repairRequest = self->_repairRequest;
      if (a3 == 1)
      {
        if (repairRequest)
        {
          PLImageManagerGetLog();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v76 = -[PHMediaRequestContext managerID](self, "managerID");
            v77 = -[PHMediaRequestContext requestID](self, "requestID");
            *(_DWORD *)buf = 134218240;
            v120 = v76;
            v121 = 2048;
            v122 = v77;
            _os_log_impl(&dword_1991EC000, v62, OS_LOG_TYPE_DEFAULT, "[RM] %ld-%ld Live photo edit request allowing missing video, reason: missing penultimate", buf, 0x16u);
          }
          goto LABEL_30;
        }
      }
      else if (repairRequest)
      {
        PLImageManagerGetLog();
        v62 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v78 = -[PHMediaRequestContext managerID](self, "managerID");
        v79 = -[PHMediaRequestContext requestID](self, "requestID");
        if ((unint64_t)a3 > 2)
          v80 = CFSTR("unknown");
        else
          v80 = off_1E35DA790[a3];
        v114 = v80;
        *(_DWORD *)buf = 134218498;
        v120 = v78;
        v121 = 2048;
        v122 = v79;
        v123 = 2112;
        v124 = v114;
        v115 = "[RM] %ld-%ld Live photo edit request allowing missing video, reason: zero videos found, base version: %@";
        goto LABEL_77;
      }
    }
    v67 = 1;
    goto LABEL_46;
  }
  -[PHContentEditingInputRequestContext _videoBehaviorSpecForBaseVersion:](self, "_videoBehaviorSpecForBaseVersion:", a3);
  v53 = objc_claimAutoreleasedReturnValue();
  v117 = [PHVideoRequest alloc];
  v54 = -[PHMediaRequestContext requestID](self, "requestID");
  v55 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v56 = -[PHContentEditingInputRequestContext type](self, "type");
  v57 = v52;
  v58 = a3;
  v59 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v59;
  a3 = v58;
  v52 = v57;
  v62 = v53;
  v63 = -[PHVideoRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:](v117, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:delegate:", v54, v55, v56, v61, v60, 0, v53, self);
  videoRequest = self->_videoRequest;
  self->_videoRequest = v63;

  -[PHContentEditingInputRequestContext _lazyVideoProgress](self, "_lazyVideoProgress");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest identifierString](self->_videoRequest, "identifierString");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v65, v66);

  objc_msgSend(v6, "addObject:", self->_videoRequest);
LABEL_30:

  v67 = 0;
  v45 = 1;
LABEL_46:

  v81 = -[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage");
  if ((v67 & 1) != 0 || !v81)
  {
    if (v67)
      goto LABEL_57;
    goto LABEL_52;
  }
LABEL_48:
  v45 = -[PHContentEditingInputRequestContext _assetResourceTypeForResourceType:withBaseVersion:](self, "_assetResourceTypeForResourceType:withBaseVersion:", 0, a3);
  PLImageManagerGetLog();
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
  {
    v83 = -[PHMediaRequestContext managerID](self, "managerID");
    v84 = -[PHMediaRequestContext requestID](self, "requestID");
    _PHAssetResourceTypeDescription(v45);
    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a3 > 2)
      v86 = CFSTR("unknown");
    else
      v86 = off_1E35DA790[a3];
    v88 = v86;
    *(_DWORD *)buf = 134218754;
    v120 = v83;
    v121 = 2048;
    v122 = v84;
    v123 = 2112;
    v124 = v85;
    v125 = 2112;
    v126 = v88;
    _os_log_impl(&dword_1991EC000, v82, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld determined image asset resource type: %@ for base version: %@", buf, 0x2Au);

  }
  -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", v45);
  v89 = objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    v90 = (__CFString *)v89;
    -[PHContentEditingInputRequestContext _lazyImageProgress](self, "_lazyImageProgress");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v90, 1, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    self->_imageBaseRequestIndex = objc_msgSend(v92, "requestIndex");
    objc_msgSend(v6, "addObject:", v92);

    goto LABEL_66;
  }
LABEL_57:
  PLImageManagerGetLog();
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
  {
    v94 = -[PHMediaRequestContext managerID](self, "managerID");
    v95 = -[PHMediaRequestContext requestID](self, "requestID");
    if ((unint64_t)a3 > 2)
      v96 = CFSTR("unknown");
    else
      v96 = off_1E35DA790[a3];
    v97 = v96;
    _PHAssetResourceTypeDescription(v45);
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v120 = v94;
    v121 = 2048;
    v122 = v95;
    v123 = 2112;
    v124 = v97;
    v125 = 2112;
    v126 = v98;
    _os_log_impl(&dword_1991EC000, v93, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld Base version needed is %@, but did not find asset resource of type %@", buf, 0x2Au);

  }
  if (self->_repairRequest)
  {

    v99 = (void *)MEMORY[0x1E0CB35C8];
    if ((unint64_t)a3 > 2)
      v100 = CFSTR("unknown");
    else
      v100 = off_1E35DA790[a3];
    v90 = v100;
    _PHAssetResourceTypeDescription(v45);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "ph_errorWithCode:localizedDescription:", 3306, CFSTR("Base version needed is %@, but did not find asset resource of type %@"), v90, v112);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    goto LABEL_69;
  }
  v101 = [PHRepairRequest alloc];
  v102 = -[PHMediaRequestContext requestID](self, "requestID");
  v103 = v6;
  v104 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v105 = -[PHContentEditingInputRequestContext type](self, "type");
  v106 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E3655FD8);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v104;
  v6 = v103;
  v110 = -[PHRepairRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:errorCodes:delegate:](v101, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:errorCodes:delegate:", v102, v109, v105, v106, v107, 0, v108, self);

  objc_msgSend(v103, "removeAllObjects");
  v111 = self->_repairRequest;
  self->_repairRequest = v110;
  v90 = v110;

  objc_msgSend(v103, "addObject:", self->_repairRequest);
LABEL_66:
  v87 = 0;
LABEL_69:

LABEL_70:
  if (a4)
    *a4 = objc_retainAutorelease(v87);

  return v6;
}

- (void)_prepareAndAddMediaRequestsToChildRequests:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  BOOL v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  unint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  PHContentEditingInputResult *contentEditingInputResult;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  id v48;
  uint8_t buf[4];
  unint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHContentEditingInputResult baseVersionNeeded](self->_contentEditingInputResult, "baseVersionNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v48 = 0;
  -[PHContentEditingInputRequestContext _baseMediaRequestsForBaseVersion:error:](self, "_baseMediaRequestsForBaseVersion:error:", v6, &v48);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v48;
  if (v7)
    v9 = 0;
  else
    v9 = v6 == 1;
  if (v9)
  {
    v10 = -[PHContentEditingInputRequestOptions disallowFallbackAdjustmentBase](self->_options, "disallowFallbackAdjustmentBase");
    PLImageManagerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        v13 = -[PHMediaRequestContext managerID](self, "managerID");
        v14 = -[PHMediaRequestContext requestID](self, "requestID");
        v15 = CFSTR("penultimate");
        *(_DWORD *)buf = 134218754;
        v50 = v13;
        v51 = 2048;
        v52 = v14;
        v53 = 2114;
        v54 = CFSTR("penultimate");
        v55 = 2112;
        v56 = v8;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld Could not find media with base version %{public}@, error: %@", buf, 0x2Au);

      }
      goto LABEL_28;
    }
    if (v12)
    {
      v16 = -[PHMediaRequestContext managerID](self, "managerID");
      v17 = -[PHMediaRequestContext requestID](self, "requestID");
      v18 = CFSTR("penultimate");
      v19 = CFSTR("current");
      *(_DWORD *)buf = 134218754;
      v50 = v16;
      v51 = 2048;
      v52 = v17;
      v53 = 2114;
      v54 = CFSTR("penultimate");
      v55 = 2114;
      v56 = CFSTR("current");
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld Could not find media with base version %{public}@, retrying with base version %{public}@", buf, 0x2Au);

    }
    v47 = v8;
    -[PHContentEditingInputRequestContext _baseMediaRequestsForBaseVersion:error:](self, "_baseMediaRequestsForBaseVersion:error:", 2, &v47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v47;

    if (!v7)
    {
      v8 = v20;
LABEL_28:
      PLImageManagerGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = -[PHMediaRequestContext managerID](self, "managerID");
        v33 = -[PHMediaRequestContext requestID](self, "requestID");
        *(_DWORD *)buf = 134218240;
        v50 = v32;
        v51 = 2048;
        v52 = v33;
        _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld No media requests", buf, 0x16u);
      }

      -[PHCompositeMediaResult setErrorIfNone:](self->_contentEditingInputResult, "setErrorIfNone:", v8);
      goto LABEL_51;
    }
    -[PHContentEditingInputResult clearAdjustmentData](self->_contentEditingInputResult, "clearAdjustmentData");
    v6 = 2;
    v8 = v20;
  }
  else if (!v7)
  {
    goto LABEL_28;
  }
  contentEditingInputResult = self->_contentEditingInputResult;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingInputResult setBaseVersionNeeded:](contentEditingInputResult, "setBaseVersionNeeded:", v22);

  objc_msgSend(v4, "addObjectsFromArray:", v7);
  if (-[PHContentEditingInputRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
  {
    -[PHMediaRequestContext asset](self, "asset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isPhotoIris"))
      v24 = 15;
    else
      v24 = 14;

    -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v25, 1, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

    }
    if (-[PHContentEditingInputRequestOptions requireOriginalsDownloaded](self->_options, "requireOriginalsDownloaded"))
    {
      -[PHMediaRequestContext asset](self, "asset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isPhotoIris"))
        v28 = 9;
      else
        v28 = 2;

      -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v29, 1, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v30);

        v25 = (void *)v29;
      }
      else
      {
        v25 = 0;
      }
    }

  }
  if (-[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage"))
  {
    -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", 13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v34, 1, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v35);

    }
    if (-[PHContentEditingInputRequestOptions requireOriginalsDownloaded](self->_options, "requireOriginalsDownloaded"))
    {
      -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v36, 1, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v37);

      }
      -[PHMediaRequestContext asset](self, "asset");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isRAWPlusJPEG");

      if (v39)
      {
        -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", 4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v34, 1, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v40);

        }
      }
      else
      {
        v34 = v36;
      }
    }

  }
  if (v6 != 2)
  {
    -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", 110);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v41, 1, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v42);

    }
  }
  PLImageManagerGetLog();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v44 = -[PHMediaRequestContext managerID](self, "managerID");
    v45 = -[PHMediaRequestContext requestID](self, "requestID");
    v46 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134218496;
    v50 = v44;
    v51 = 2048;
    v52 = v45;
    v53 = 2048;
    v54 = (const __CFString *)v46;
    _os_log_impl(&dword_1991EC000, v43, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld Starting %ld child media requests", buf, 0x20u);
  }

LABEL_51:
}

- (int64_t)_assetResourceTypeForResourceType:(unsigned int)a3 withBaseVersion:(int64_t)a4
{
  void *v5;
  int v6;
  int64_t v8;
  BOOL v9;
  int64_t v10;
  void *v12;

  if (a3 == 3)
  {
    v8 = 9;
    if (a4 == 2)
      v8 = 10;
    v9 = a4 == 1;
    v10 = 11;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHContentEditingInputRequestContext.m"), 576, CFSTR("Invalid resource type, valid options are image, video, or video complement"));

      }
      else
      {
        if (a4 == 2)
          return 5;
        if (a4 == 1)
          return 8;
        if (!a4 && self->_useRAWAsUnadjustedBase)
        {
          -[PHMediaRequestContext asset](self, "asset");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "isRAWPlusJPEG");

          if (v6)
            return 4;
          else
            return 1;
        }
      }
      return 1;
    }
    v8 = 2;
    if (a4 == 2)
      v8 = 6;
    v9 = a4 == 1;
    v10 = 12;
  }
  if (v9)
    return v10;
  else
    return v8;
}

- (id)_assetResources
{
  NSArray *assetResources;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  assetResources = self->_assetResources;
  if (!assetResources)
  {
    -[PHMediaRequestContext asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:", v4, 1, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_assetResources;
    self->_assetResources = v5;

    assetResources = self->_assetResources;
  }
  return assetResources;
}

- (id)_assetResourceForType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  -[PHContentEditingInputRequestContext _assetResources](self, "_assetResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PHContentEditingInputRequestContext__assetResourceForType___block_invoke;
  v8[3] = &__block_descriptor_40_e32_B32__0__PHAssetResource_8Q16_B24l;
  v8[4] = a3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_largestUnadjustedDerivativeImageResource
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PHContentEditingInputRequestContext _assetResources](self, "_assetResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "backingResourceIdentity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "version");

        if (!v10)
        {
          if (objc_msgSend(v8, "cplResourceType") == 2)
            goto LABEL_14;
          if (objc_msgSend(v8, "cplResourceType") == 3)
          {
            if (objc_msgSend(v5, "cplResourceType") != 2)
              goto LABEL_14;
          }
          else if (objc_msgSend(v8, "cplResourceType") == 4
                 && objc_msgSend(v5, "cplResourceType") != 2
                 && objc_msgSend(v5, "cplResourceType") != 3)
          {
LABEL_14:
            v11 = v8;

            v5 = v11;
            continue;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (!v4)
        goto LABEL_19;
    }
  }
  v5 = 0;
LABEL_19:

  return v5;
}

- (id)_resourceRequestForAssetResource:(id)a3 wantsURLOnly:(BOOL)a4 progress:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  PHMediaResourceRequest *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  PHMediaResourceRequest *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
    v22 = [PHMediaResourceRequest alloc];
    v11 = -[PHMediaRequestContext requestID](self, "requestID");
    v12 = -[PHContentEditingInputRequestContext type](self, "type");
    v13 = -[PHMediaRequestContext managerID](self, "managerID");
    -[PHMediaRequestContext asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInputRequestContext options](self, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v21) = a4;
    LOBYTE(v20) = objc_msgSend(v15, "isNetworkAccessAllowed");
    v16 = -[PHMediaResourceRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:](v22, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:", v11, v10, v12, v13, v14, v8, v20, -[PHContentEditingInputRequestContext downloadIntent](self, "downloadIntent"), 0, v21, self);

    -[NSMutableIndexSet addIndex:](self->_requestIndexesOfAssetResourceRequests, "addIndex:", v10);
    if (v9)
    {
      -[PHMediaRequest identifierString](v16, "identifierString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v9, v17);
      objc_initWeak(&location, self);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __94__PHContentEditingInputRequestContext__resourceRequestForAssetResource_wantsURLOnly_progress___block_invoke;
      v23[3] = &unk_1E35DDA00;
      objc_copyWeak(&v25, &location);
      v18 = v17;
      v24 = v18;
      -[PHMediaResourceRequest setProgressHandler:](v16, "setProgressHandler:", v23);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)start
{
  __CFString *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v19 = -[PHMediaRequestContext managerID](self, "managerID");
    v18 = -[PHMediaRequestContext requestID](self, "requestID");
    -[PHMediaRequestContext asset](self, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHContentEditingInputRequestContext options](self, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("N");
    v8 = CFSTR("Y");
    if (objc_msgSend(v6, "isNetworkAccessAllowed"))
      v9 = CFSTR("Y");
    else
      v9 = CFSTR("N");
    v17 = v9;
    -[PHContentEditingInputRequestContext options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "forceRunAsUnadjustedAsset"))
      v8 = CFSTR("N");
    -[PHContentEditingInputRequestContext options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldForceOriginalChoice");
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[PHContentEditingInputRequestContext options](self, "options");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "originalChoice");
      if (v14 > 3)
        v15 = 0;
      else
        v15 = off_1E35DA698[v14];
      v2 = v15;
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Y (%@)"), v2);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 134350338;
    v23 = v19;
    v24 = 2050;
    v25 = v18;
    v26 = 2114;
    v27 = v5;
    v28 = 2114;
    v29 = v17;
    v30 = 2114;
    v31 = v8;
    v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_DEFAULT, "[RM] %{public}ld-%{public}ld starting edit request for asset %{public}@, net: %{public}@, force unadjusted: %{public}@, set original choice: %{public}@", buf, 0x3Eu);
    if (v12)
    {

    }
  }

  v21.receiver = self;
  v21.super_class = (Class)PHContentEditingInputRequestContext;
  -[PHMediaRequestContext start](&v21, sel_start);
}

- (int64_t)type
{
  return 4;
}

- (BOOL)isNetworkAccessAllowed
{
  return -[PHContentEditingInputRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed");
}

- (int64_t)downloadIntent
{
  int64_t result;

  result = -[PHContentEditingInputRequestOptions downloadIntent](self->_options, "downloadIntent");
  if (!result)
    return 4;
  return result;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHContentEditingInputRequestContext;
  -[PHMediaRequestContext cancel](&v3, sel_cancel);
  os_unfair_lock_lock(&self->_lock);
  -[PHCompositeMediaResult setCancelled:](self->_contentEditingInputResult, "setCancelled:", 1);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)initialRequests
{
  PHAdjustmentDataRequestBehaviorSpec *v3;
  PHAdjustmentDataRequest *v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  PHAdjustmentDataRequest *v10;
  PHAdjustmentDataRequest *adjustmentRequest;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PHAdjustmentDataRequestBehaviorSpec);
  -[PHAdjustmentDataRequestBehaviorSpec setNetworkAccessAllowed:](v3, "setNetworkAccessAllowed:", -[PHContentEditingInputRequestOptions isNetworkAccessAllowed](self->_options, "isNetworkAccessAllowed"));
  v4 = [PHAdjustmentDataRequest alloc];
  v5 = -[PHMediaRequestContext requestID](self, "requestID");
  v6 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
  v7 = -[PHContentEditingInputRequestContext type](self, "type");
  v8 = -[PHMediaRequestContext managerID](self, "managerID");
  -[PHMediaRequestContext asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHAdjustmentDataRequest initWithRequestID:requestIndex:contextType:managerID:asset:behaviorSpec:delegate:](v4, "initWithRequestID:requestIndex:contextType:managerID:asset:behaviorSpec:delegate:", v5, v6, v7, v8, v9, v3, self);
  adjustmentRequest = self->_adjustmentRequest;
  self->_adjustmentRequest = v10;

  -[PHContentEditingInputRequestContext _lazyAdjustmentProgress](self, "_lazyAdjustmentProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest identifierString](self->_adjustmentRequest, "identifierString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext setProgress:forRequestIdentifier:](self, "setProgress:forRequestIdentifier:", v12, v13);

  v16[0] = self->_adjustmentRequest;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  PHRepairRequest *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  PHRepairRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  PHContentEditingInputRequestOptions *options;
  void *v19;
  void *v20;
  uint64_t (**v21)(_QWORD, _QWORD);
  char v22;
  NSObject *v23;
  void *v24;
  int64_t v25;
  PHContentEditingInputResult *contentEditingInputResult;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *assetResources;
  PHImageDisplaySpec *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  _BOOL8 v46;
  int64_t v47;
  _BOOL8 useRAWAsUnadjustedBase;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  PHImageRequest *v58;
  PHImageRequest *displayImageRequest;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  PHImageRequest *v69;
  PHImageRequest *v70;
  uint64_t v71;
  void *v72;
  PHRepairRequest *v73;
  unsigned __int8 v74;
  uint8_t buf[4];
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = (PHRepairRequest *)a3;
  v9 = a6;
  v10 = -[PHMediaRequestContext isCancelled](self, "isCancelled");
  v11 = 0;
  if (v9 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PHRepairRequest *)self->_adjustmentRequest == v8)
    {
      v74 = 0;
      v25 = -[PHContentEditingInputRequestContext _adjustmentBaseVersionFromResult:request:canHandleAdjustmentData:](self, "_adjustmentBaseVersionFromResult:request:canHandleAdjustmentData:", v9, v8, &v74);
      contentEditingInputResult = self->_contentEditingInputResult;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInputResult setBaseVersionNeeded:](contentEditingInputResult, "setBaseVersionNeeded:", v27);

      -[PHContentEditingInputResult setCanHandleAdjustmentData:](self->_contentEditingInputResult, "setCanHandleAdjustmentData:", v74);
      if (!v25)
      {
        -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", 16);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          -[PHContentEditingInputRequestContext _lazyAdjustmentProgress](self, "_lazyAdjustmentProgress");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v28, 0, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "addObject:", v30);
          PLImageManagerGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v30, "identifierString");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v76 = v32;
            _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_DEBUG, "[RM] %@ Base version is unadjusted, starting request for original adjustment envelope", buf, 0xCu);

          }
        }

      }
      if (!-[PHContentEditingInputRequestContext _canSkipMediaMetadataCheckWithBaseVersion:](self, "_canSkipMediaMetadataCheckWithBaseVersion:", v25))
      {
        v33 = v25 ? 105 : 104;
        -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", v33);
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)v34;
          -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v34, 0, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v36);

LABEL_31:
          os_unfair_lock_lock(&self->_lock);
          self->_inflightMediaRequestCount += objc_msgSend(v11, "count");
          os_unfair_lock_unlock(&self->_lock);
          goto LABEL_32;
        }
      }
    }
    else if (self->_repairRequest == v8)
    {
      -[PHMediaRequestContext asset](self, "asset");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHAssetResource assetResourcesForAsset:includeDerivatives:includeMetadata:](PHAssetResource, "assetResourcesForAsset:includeDerivatives:includeMetadata:", v37, 1, 1);
      v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
      assetResources = self->_assetResources;
      self->_assetResources = v38;

    }
    else if (!-[NSMutableIndexSet containsIndex:](self->_requestIndexesOfAssetResourceRequests, "containsIndex:", -[PHMediaRequest requestIndex](v8, "requestIndex"))|| -[PHRepairRequest resourceType](v8, "resourceType") != 104&& -[PHRepairRequest resourceType](v8, "resourceType") != 105)
    {
      if (-[PHMediaRequest requestIndex](v8, "requestIndex") == self->_imageBaseRequestIndex)
      {
        objc_msgSend(v9, "imageURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = v8;
          v14 = (void *)MEMORY[0x1E0CEC3F8];
          objc_msgSend(v9, "uniformTypeIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "typeWithIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

          options = self->_options;
          if (v17)
          {
            -[PHContentEditingInputRequestOptions canHandleRAW](options, "canHandleRAW");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v9, "imagePropertiesLoadIfNeeded:", 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHContentEditingInputRequestOptions canHandleRAW](self->_options, "canHandleRAW");
              v21 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v22 = ((uint64_t (**)(_QWORD, void *))v21)[2](v21, v20);

              if ((v22 & 1) == 0)
              {
                PLImageManagerGetLog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  -[PHMediaRequest identifierString](v13, "identifierString");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v76 = v24;
                  _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_DEBUG, "[RM] %@ Image request for RAW completed, but client decided that this RAW is invalid, re-requesting JPEG", buf, 0xCu);

                }
                if (-[PHRepairRequest resourceType](v13, "resourceType") == 4)
                  -[PHContentEditingInputRequestContext _assetResourceForType:](self, "_assetResourceForType:", 1);
                else
                  -[PHContentEditingInputRequestContext _largestUnadjustedDerivativeImageResource](self, "_largestUnadjustedDerivativeImageResource");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (v66)
                {
                  -[PHContentEditingInputRequestContext _resourceRequestForAssetResource:wantsURLOnly:progress:](self, "_resourceRequestForAssetResource:wantsURLOnly:progress:", v66, 1, 0);
                  v67 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "addObject:", v67);
                  self->_imageBaseRequestIndex = -[NSObject requestIndex](v67, "requestIndex");
                }
                else
                {
                  PLImageManagerGetLog();
                  v67 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                  {
                    -[PHMediaRequest identifierString](v13, "identifierString");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v76 = v68;
                    _os_log_impl(&dword_1991EC000, v67, OS_LOG_TYPE_ERROR, "%@ Client decided that this RAW is invalid, but no unadjusted JPEG resources available, returning the RAW anyway", buf, 0xCu);

                  }
                }

              }
            }
          }
          else if (!-[PHContentEditingInputRequestOptions skipDisplaySizeImage](options, "skipDisplaySizeImage"))
          {
            v41 = [PHImageDisplaySpec alloc];
            -[PHContentEditingInputRequestOptions targetSize](self->_options, "targetSize");
            v71 = -[PHImageDisplaySpec initWithTargetSize:contentMode:](v41, "initWithTargetSize:contentMode:", -[PHContentEditingInputRequestOptions contentMode](self->_options, "contentMode"), v42, v43);
            -[PHContentEditingInputResult baseVersionNeeded](self->_contentEditingInputResult, "baseVersionNeeded");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "integerValue");

            v46 = -[PHContentEditingInputRequestContext isNetworkAccessAllowed](self, "isNetworkAccessAllowed");
            v73 = v13;
            v47 = -[PHContentEditingInputRequestContext downloadIntent](self, "downloadIntent");
            useRAWAsUnadjustedBase = self->_useRAWAsUnadjustedBase;
            -[PHMediaRequestContext asset](self, "asset");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImageRequestBehaviorSpec contentEditingInputImageBehaviorSpecForBaseVersion:isNetworkAccessAllowed:downloadIntent:shouldUseRAWAsUnadjustedBase:asset:](PHImageRequestBehaviorSpec, "contentEditingInputImageBehaviorSpecForBaseVersion:isNetworkAccessAllowed:downloadIntent:shouldUseRAWAsUnadjustedBase:asset:", v45, v46, v47, useRAWAsUnadjustedBase, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v50, "setLoadingOptions:", 1);
            objc_msgSend(v50, "setResizeMode:", 2);
            v69 = [PHImageRequest alloc];
            v51 = -[PHMediaRequestContext requestID](self, "requestID");
            v52 = -[PHMediaRequestContext nextRequestIndex](self, "nextRequestIndex");
            v53 = -[PHMediaRequestContext managerID](self, "managerID");
            -[PHMediaRequestContext asset](self, "asset");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[PHMediaRequestContext imageResourceChooser](self, "imageResourceChooser");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v50;
            v56 = v52;
            v57 = (void *)v71;
            v58 = -[PHImageRequest initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:](v69, "initWithRequestID:requestIndex:contextType:managerID:asset:displaySpec:behaviorSpec:chooser:delegate:", v51, v56, 4, v53, v54, v71, v50, v55, self);
            displayImageRequest = self->_displayImageRequest;
            self->_displayImageRequest = v58;

            v13 = v73;
            v60 = (void *)MEMORY[0x1E0D71880];
            -[PHRepairRequest resource](v73, "resource");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "uniformTypeIdentifier");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v60) = objc_msgSend(v60, "isPrimaryImageFormatForUTI:", v62);

            if ((_DWORD)v60)
            {
              v70 = self->_displayImageRequest;
              objc_msgSend(v9, "imageURL");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "uniformTypeIdentifier");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "exifOrientation");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHImageRequest configureWithURL:uniformTypeIdentifier:exifOrientation:](v70, "configureWithURL:uniformTypeIdentifier:exifOrientation:", v63, v64, objc_msgSend(v65, "intValue"));

              v57 = (void *)v71;
            }
            objc_msgSend(v11, "addObject:", self->_displayImageRequest);

          }
        }
      }
      goto LABEL_31;
    }
    -[PHContentEditingInputRequestContext _prepareAndAddMediaRequestsToChildRequests:](self, "_prepareAndAddMediaRequestsToChildRequests:", v11);
    goto LABEL_31;
  }
LABEL_32:

  return v11;
}

- (id)progressHandler
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  -[PHContentEditingInputRequestOptions progressHandler](self->_options, "progressHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PHContentEditingInputRequestContext_progressHandler__block_invoke;
    aBlock[3] = &unk_1E35DDA28;
    v7 = v2;
    v4 = _Block_copy(aBlock);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)progresses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PHContentEditingInputRequestContext _lazyAdjustmentProgress](self, "_lazyAdjustmentProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PHContentEditingInputRequestContext _shouldRequestImage](self, "_shouldRequestImage"))
  {
    -[PHContentEditingInputRequestContext _lazyImageProgress](self, "_lazyImageProgress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if (-[PHContentEditingInputRequestContext _shouldRequestVideo](self, "_shouldRequestVideo"))
  {
    -[PHContentEditingInputRequestContext _lazyVideoProgress](self, "_lazyVideoProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  return v5;
}

- (void)processAndReturnResultsWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void (**v10)(_QWORD, _QWORD, double);
  void (**resultHandler)(id, PHContentEditingInputResult *, id, PHContentEditingInputRequestContext *);
  _BYTE v12[12];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v12 = 134218240;
    *(_QWORD *)&v12[4] = -[PHMediaRequestContext managerID](self, "managerID");
    v13 = 2048;
    v14 = -[PHMediaRequestContext requestID](self, "requestID");
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld All content editing requests complete, building content editing input", v12, 0x16u);
  }

  -[PHContentEditingInputRequestOptions progressHandler](self->_options, "progressHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[PHMediaRequestContext totalProgressFraction](self, "totalProgressFraction");
    v9 = v8;

    if (v9 < 1.0)
    {
      v12[0] = 0;
      -[PHContentEditingInputRequestOptions progressHandler](self->_options, "progressHandler", *(_QWORD *)v12);
      v10 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _BYTE *, double))v10)[2](v10, v12, 1.0);

    }
  }
  resultHandler = (void (**)(id, PHContentEditingInputResult *, id, PHContentEditingInputRequestContext *))self->super._resultHandler;
  if (resultHandler)
    resultHandler[2](resultHandler, self->_contentEditingInputResult, v4, self);

}

- (void)_finishIfAllCompleteWithRequest:(id)a3
{
  unint64_t inflightMediaRequestCount;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  inflightMediaRequestCount = self->_inflightMediaRequestCount;
  os_unfair_lock_unlock(&self->_lock);
  if (!inflightMediaRequestCount)
    -[PHContentEditingInputRequestContext processAndReturnResultsWithRequest:](self, "processAndReturnResultsWithRequest:", v5);

}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  void *v4;
  id v7;
  PHAdjustmentDataRequest *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PHAdjustmentDataRequest *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  PHContentEditingInputRequestContext *v22;
  PHAdjustmentDataRequest *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *p_lock;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  NSObject *v69;
  os_log_type_t v70;
  uint32_t v71;
  _QWORD v72[4];
  id v73;
  PHContentEditingInputRequestContext *v74;
  PHAdjustmentDataRequest *v75;
  uint64_t v76;
  void *v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  uint64_t v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (PHAdjustmentDataRequest *)a4;
  if (objc_msgSend(v7, "isInCloud"))
  {
    if ((objc_msgSend(v7, "containsValidData") & 1) == 0)
    {
      objc_msgSend(v7, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[PHContentEditingInputRequestContext options](self, "options");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isNetworkAccessAllowed");

        if ((v11 & 1) != 0)
        {
          v12 = (void *)MEMORY[0x1E0CB35C8];
          v84 = *MEMORY[0x1E0CB2D50];
          v85[0] = CFSTR("Download failed");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setError:", v14);

        }
        else
        {
          PHNetworkAccessAllowedRequiredError();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setError:", v15);

        }
      }
    }
  }
  if (self->_adjustmentRequest == v8)
  {
    PLImageManagerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](v8, "identifierString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "info");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v79 = v20;
      v80 = 2112;
      v81 = (uint64_t)v7;
      v82 = 2112;
      v83 = v21;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing adjustment data request finished with result: %@, info: %@", buf, 0x20u);

    }
    -[PHContentEditingInputRequestContext _lazyAdjustmentProgress](self, "_lazyAdjustmentProgress");
    v16 = (PHAdjustmentDataRequest *)objc_claimAutoreleasedReturnValue();
    -[PHAdjustmentDataRequest setCompletedUnitCount:](v16, "setCompletedUnitCount:", -[PHAdjustmentDataRequest totalUnitCount](v16, "totalUnitCount"));
    os_unfair_lock_lock(&self->_lock);
    -[PHContentEditingInputResult addAdjustmentDataResult:](self->_contentEditingInputResult, "addAdjustmentDataResult:", v7);
    os_unfair_lock_unlock(&self->_lock);
    v22 = self;
    v23 = v8;
    goto LABEL_48;
  }
  if ((PHAdjustmentDataRequest *)self->_displayImageRequest == v8)
  {
    PLImageManagerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](v8, "identifierString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "info");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v79 = v25;
      v80 = 2112;
      v81 = (uint64_t)v7;
      v82 = 2112;
      v83 = v26;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing image request finished with result: %@, info: %@", buf, 0x20u);

    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    --self->_inflightMediaRequestCount;
    -[PHContentEditingInputResult addImageResult:](self->_contentEditingInputResult, "addImageResult:", v7);
    goto LABEL_77;
  }
  if ((PHAdjustmentDataRequest *)self->_videoRequest != v8)
  {
    if (-[NSMutableIndexSet containsIndex:](self->_requestIndexesOfAssetResourceRequests, "containsIndex:", -[PHMediaRequest requestIndex](v8, "requestIndex")))
    {
      v16 = v8;
      if ((objc_msgSend(v7, "containsValidData") & 1) == 0)
      {
        PLImageManagerGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "error");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v79 = v50;
          _os_log_impl(&dword_1991EC000, v49, OS_LOG_TYPE_ERROR, "Media resource request failed to return valid data or url with error: %@", buf, 0xCu);

        }
        objc_msgSend(v7, "error");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v51)
        {
          v52 = (void *)MEMORY[0x1E0CB35C8];
          v76 = *MEMORY[0x1E0CB2938];
          v53 = (void *)MEMORY[0x1E0CB3940];
          -[PHMediaRequest identifierString](v16, "identifierString");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", CFSTR("request %@ failed but did not provide error,"), v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v55;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3303, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setError:", v57);

        }
        -[PHContentEditingInputResult mergeInfoDictionaryFromResult:](self->_contentEditingInputResult, "mergeInfoDictionaryFromResult:", v7);
        goto LABEL_47;
      }
      v17 = -[PHAdjustmentDataRequest resourceType](v16, "resourceType");
      if (v17 > 102)
      {
        if ((unint64_t)(v17 - 104) < 2)
        {
          PLImageManagerGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            goto LABEL_84;
          -[PHMediaRequest identifierString](v16, "identifierString");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v79 = v67;
          v68 = "[RM] %@ Content editing found renderable media metadata";
          v69 = v18;
          v70 = OS_LOG_TYPE_DEBUG;
          v71 = 12;
LABEL_83:
          _os_log_impl(&dword_1991EC000, v69, v70, v68, buf, v71);

          goto LABEL_84;
        }
        if (v17 == 103)
          goto LABEL_56;
        if (v17 == 110)
        {
          os_unfair_lock_lock(&self->_lock);
          -[PHContentEditingInputResult addAdjustmentSecondaryDataResult:](self->_contentEditingInputResult, "addAdjustmentSecondaryDataResult:", v7);
          os_unfair_lock_unlock(&self->_lock);
          goto LABEL_47;
        }
      }
      else if ((unint64_t)v17 <= 0x10)
      {
        if (((1 << v17) & 0xFE44) == 0)
        {
          if (((1 << v17) & 0x132) == 0)
          {
            if (v17 == 16)
            {
              objc_msgSend(v7, "adjustmentData");
              v18 = objc_claimAutoreleasedReturnValue();
              -[PHContentEditingInputResult setOriginalAdjustmentData:](self->_contentEditingInputResult, "setOriginalAdjustmentData:", v18);
LABEL_84:

              goto LABEL_47;
            }
            goto LABEL_81;
          }
LABEL_56:
          if (-[PHMediaRequest requestIndex](v16, "requestIndex") == self->_imageBaseRequestIndex)
          {
            PLImageManagerGetLog();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              -[PHMediaRequest identifierString](v16, "identifierString");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "info");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v79 = v61;
              v80 = 2112;
              v81 = (uint64_t)v7;
              v82 = 2112;
              v83 = v62;
              _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing resource request for base image finished with result: %@, info: %@", buf, 0x20u);

            }
            -[PHContentEditingInputResult addImageResult:](self->_contentEditingInputResult, "addImageResult:", v7);
          }
        }
LABEL_47:
        os_unfair_lock_lock(&self->_lock);
        --self->_inflightMediaRequestCount;
        os_unfair_lock_unlock(&self->_lock);
        v22 = self;
        v23 = v16;
LABEL_48:
        -[PHContentEditingInputRequestContext _finishIfAllCompleteWithRequest:](v22, "_finishIfAllCompleteWithRequest:", v23);

        goto LABEL_78;
      }
LABEL_81:
      PLImageManagerGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_84;
      -[PHMediaRequest identifierString](v16, "identifierString");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v79 = v67;
      v80 = 2048;
      v81 = -[PHAdjustmentDataRequest resourceType](v16, "resourceType");
      v68 = "[RM] %@ Content editing made request for invalid resource type for edit: %lu";
      v69 = v18;
      v70 = OS_LOG_TYPE_ERROR;
      v71 = 22;
      goto LABEL_83;
    }
    if ((PHAdjustmentDataRequest *)self->_repairRequest == v8)
    {
      PLImageManagerGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        -[PHMediaRequest identifierString](v8, "identifierString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "error");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "error");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR(" with error: %@"), v4);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v39 = &stru_1E35DFFF8;
        }
        *(_DWORD *)buf = 138412546;
        v79 = v36;
        v80 = 2112;
        v81 = (uint64_t)v39;
        _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_DEFAULT, "[RM] %@ repair request finished%@", buf, 0x16u);
        if (v37)
        {

        }
      }

    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    --self->_inflightMediaRequestCount;
LABEL_77:
    os_unfair_lock_unlock(p_lock);
    -[PHContentEditingInputRequestContext _finishIfAllCompleteWithRequest:](self, "_finishIfAllCompleteWithRequest:", v8);
    goto LABEL_78;
  }
  PLImageManagerGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](v8, "identifierString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "info");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v79 = v29;
    v80 = 2112;
    v81 = (uint64_t)v7;
    v82 = 2112;
    v83 = v30;
    _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing video request finished with result: %@, info: %@", buf, 0x20u);

  }
  if (!objc_msgSend(v7, "containsValidData"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    --self->_inflightMediaRequestCount;
    -[PHMediaRequestContext asset](self, "asset");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "isPhotoIris"))
    {
      -[PHMediaRequestContext asset](self, "asset");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v41, "canPlayPhotoIris"))
      {
        -[PHVideoRequest behaviorSpec](self->_videoRequest, "behaviorSpec");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "version");

        if (v59 != 1)
        {
          PLImageManagerGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            -[PHMediaRequest identifierString](v8, "identifierString");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v79 = v47;
            v48 = "[RM] %@ Live photo edit request continuing with missing video, reason: unplayable";
            goto LABEL_73;
          }
LABEL_74:

          goto LABEL_77;
        }
LABEL_36:
        -[PHMediaRequestContext asset](self, "asset");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "isPhotoIris"))
        {
          -[PHVideoRequest behaviorSpec](self->_videoRequest, "behaviorSpec");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "version") == 8)
          {
            objc_msgSend(v7, "error");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v44, "code") == 3303)
            {
              v45 = objc_msgSend(v7, "isInCloud");

              if ((v45 & 1) == 0)
              {
                PLImageManagerGetLog();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  -[PHMediaRequest identifierString](v8, "identifierString");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v79 = v47;
                  v48 = "[RM] %@ Live photo edit request continuing with missing video, reason: missing penultimate";
LABEL_73:
                  _os_log_impl(&dword_1991EC000, v46, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);

                  goto LABEL_74;
                }
                goto LABEL_74;
              }
LABEL_69:
              -[PHMediaRequestContext asset](self, "asset");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v63, "isPhotoIris") & 1) != 0)
              {
                objc_msgSend(v7, "error");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "userInfo");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E0D72EE8]);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                if (v66)
                {
                  PLImageManagerGetLog();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    -[PHMediaRequest identifierString](v8, "identifierString");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v79 = v47;
                    v48 = "[RM] %@ Live photo edit request continuing with missing video, reason: zero videos found";
                    goto LABEL_73;
                  }
                  goto LABEL_74;
                }
              }
              else
              {

              }
              -[PHContentEditingInputResult addVideoResult:](self->_contentEditingInputResult, "addVideoResult:", v7);
              goto LABEL_77;
            }

          }
        }

        goto LABEL_69;
      }

    }
    goto LABEL_36;
  }
  objc_msgSend(v7, "videoURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequestContext asset](self, "asset");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoAdjustmentData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PHContentEditingInputResult canHandleAdjustmentData](self->_contentEditingInputResult, "canHandleAdjustmentData");
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __69__PHContentEditingInputRequestContext_processMediaResult_forRequest___block_invoke;
  v72[3] = &unk_1E35DDA50;
  v73 = v7;
  v74 = self;
  v75 = v8;
  -[PHContentEditingInputRequestContext _renderVideoFromVideoURL:asset:adjustmentData:canHandleAdjustmentData:resultHandler:](self, "_renderVideoFromVideoURL:asset:adjustmentData:canHandleAdjustmentData:resultHandler:", v31, v32, v33, v34, v72);

LABEL_78:
}

- (PHContentEditingInputRequestOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_imageConversionClient, 0);
  objc_storeStrong((id *)&self->_requestIndexesOfAssetResourceRequests, 0);
  objc_storeStrong((id *)&self->_assetResources, 0);
  objc_storeStrong((id *)&self->_backupChooser, 0);
  objc_storeStrong((id *)&self->_repairRequest, 0);
  objc_storeStrong((id *)&self->_imageProgress, 0);
  objc_storeStrong((id *)&self->_videoProgress, 0);
  objc_storeStrong((id *)&self->_adjustmentProgress, 0);
  objc_storeStrong((id *)&self->_displayImageRequest, 0);
  objc_storeStrong((id *)&self->_videoRequest, 0);
  objc_storeStrong((id *)&self->_adjustmentRequest, 0);
  objc_storeStrong((id *)&self->_contentEditingInputResult, 0);
}

void __69__PHContentEditingInputRequestContext_processMediaResult_forRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v7 = *(id *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v7, "setVideoURL:", a2);
  objc_msgSend(v7, "setErrorIfNone:", v6);

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 200));
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 208);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "addVideoResult:", v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 200));
  objc_msgSend(*(id *)(a1 + 40), "_finishIfAllCompleteWithRequest:", *(_QWORD *)(a1 + 48));

}

uint64_t __54__PHContentEditingInputRequestContext_progressHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PHContentEditingInputRequestContext__resourceRequestForAssetResource_wantsURLOnly_progress___block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  id *v7;
  id v8;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "requestWithIdentifier:didReportProgress:completed:error:", *(_QWORD *)(a1 + 32), a2, v8, a4);

}

BOOL __61__PHContentEditingInputRequestContext__assetResourceForType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

void __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RenderedContent-%@.MOV"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(v3, "setOutputURL:", v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2;
    v12[3] = &unk_1E35DF3B8;
    v13 = v3;
    v10 = *(id *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v11 = v9;
    objc_msgSend(v13, "exportAsynchronouslyWithCompletionHandler:", v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString **v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Rendering video failed");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = (const __CFString **)v11;
    v5 = &v10;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "status") != 5)
      goto LABEL_7;
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9 = CFSTR("Rendering video cancelled");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = &v9;
    v5 = &v8;
  }
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __123__PHContentEditingInputRequestContext__renderVideoFromVideoURL_asset_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)shouldUseRAWResourceAsUnadjustedBaseForAsset:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  if (PHDeviceSupportsRAW_onceToken != -1)
    dispatch_once(&PHDeviceSupportsRAW_onceToken, &__block_literal_global_16549);
  if (PHDeviceSupportsRAW_deviceSupportsRAW && (objc_msgSend(v6, "dontAllowRAW") & 1) == 0)
  {
    if (objc_msgSend(v6, "shouldForceOriginalChoice"))
      v8 = objc_msgSend(v6, "originalChoice");
    else
      v8 = objc_msgSend(v5, "originalResourceChoice");
    v7 = objc_msgSend(v5, "shouldUseRAWResourceWithOriginalResourceChoice:", v8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)contentEditingInputRequestContextForAsset:(id)a3 requestID:(int)a4 managerID:(unint64_t)a5 networkAccessAllowed:(BOOL)a6 downloadIntent:(int64_t)a7 progressHandler:(id)a8 resultHandler:(id)a9
{
  _BOOL8 v11;
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  PHContentEditingInputRequestOptions *v19;
  void *v20;

  v11 = a6;
  v13 = *(_QWORD *)&a4;
  v16 = a9;
  v17 = a8;
  v18 = a3;
  v19 = objc_alloc_init(PHContentEditingInputRequestOptions);
  -[PHContentEditingInputRequestOptions setNetworkAccessAllowed:](v19, "setNetworkAccessAllowed:", v11);
  -[PHContentEditingInputRequestOptions setDownloadIntent:](v19, "setDownloadIntent:", a7);
  -[PHContentEditingInputRequestOptions setCanHandleAdjustmentData:](v19, "setCanHandleAdjustmentData:", &__block_literal_global_32842);
  -[PHContentEditingInputRequestOptions setProgressHandler:](v19, "setProgressHandler:", v17);

  -[PHContentEditingInputRequestOptions setForceReturnFullLivePhoto:](v19, "setForceReturnFullLivePhoto:", 1);
  -[PHContentEditingInputRequestOptions setSkipDisplaySizeImage:](v19, "setSkipDisplaySizeImage:", 1);
  -[PHContentEditingInputRequestOptions setSkipLivePhotoImageAndAVAsset:](v19, "setSkipLivePhotoImageAndAVAsset:", 1);
  -[PHContentEditingInputRequestOptions setDisallowFallbackAdjustmentBase:](v19, "setDisallowFallbackAdjustmentBase:", 1);
  +[PHMediaRequestContext contentEditingInputRequestContextWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:](PHMediaRequestContext, "contentEditingInputRequestContextWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:", v13, a5, v18, v19, objc_msgSend(a1, "shouldUseRAWResourceAsUnadjustedBaseForAsset:options:", v18, v19), v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void *__167__PHContentEditingInputRequestContext_contentEditingInputRequestContextForAsset_requestID_managerID_networkAccessAllowed_downloadIntent_progressHandler_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v2 = a2;
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "formatVersion");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v2, "formatIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0D75308];
        objc_msgSend(v2, "formatIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "formatVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v7) = objc_msgSend(v7, "isRecognizedSlowMotionFormatWithIdentifier:version:", v8, v9);

        if ((v7 & 1) == 0)
        {
          v10 = (void *)MEMORY[0x1E0D71988];
          objc_msgSend(v2, "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "formatIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "formatVersion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0;
          v3 = (void *)objc_msgSend(v10, "validateAdjustmentData:formatIdentifier:formatVersion:error:", v11, v12, v13, &v15);

          goto LABEL_8;
        }
      }
    }
    else
    {

    }
    v3 = 0;
  }
LABEL_8:

  return v3;
}

@end
