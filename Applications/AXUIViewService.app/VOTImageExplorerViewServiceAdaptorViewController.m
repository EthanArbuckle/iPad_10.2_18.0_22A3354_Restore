@implementation VOTImageExplorerViewServiceAdaptorViewController

- (void)viewDidLoad
{
  VOTImageExplorerViewController *v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *axVisionQueue;
  NSMutableArray *v9;
  NSMutableArray *detailData;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VOTImageExplorerViewServiceAdaptorViewController;
  -[VOTImageExplorerViewServiceAdaptorViewController viewDidLoad](&v11, "viewDidLoad");
  v3 = objc_alloc_init(VOTImageExplorerViewController);
  -[VOTImageExplorerViewServiceAdaptorViewController setImageExplorerViewController:](self, "setImageExplorerViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController imageExplorerViewController](self, "imageExplorerViewController"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (OS_dispatch_queue *)dispatch_queue_create("VOTImageExplorer-Vision", v6);
  axVisionQueue = self->_axVisionQueue;
  self->_axVisionQueue = v7;

  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  detailData = self->_detailData;
  self->_detailData = v9;

}

- (AXMVoiceOverVisionEngine)visionEngine
{
  AXMVoiceOverVisionEngine *visionEngine;
  AXMVoiceOverVisionEngine *v4;
  AXMVoiceOverVisionEngine *v5;

  visionEngine = self->_visionEngine;
  if (!visionEngine)
  {
    v4 = (AXMVoiceOverVisionEngine *)objc_alloc_init((Class)AXMVoiceOverVisionEngine);
    v5 = self->_visionEngine;
    self->_visionEngine = v4;

    visionEngine = self->_visionEngine;
  }
  return visionEngine;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VOTImageExplorerViewServiceAdaptorViewController;
  -[VOTImageExplorerViewServiceAdaptorViewController viewDidAppear:](&v17, "viewDidAppear:", a3);
  -[VOTImageExplorerViewServiceAdaptorViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  v4 = objc_alloc((Class)UINavigationController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController imageExplorerViewController](self, "imageExplorerViewController"));
  v6 = objc_msgSend(v4, "initWithRootViewController:", v5);

  objc_msgSend(v6, "setModalPresentationStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
  objc_msgSend(v7, "setTranslucent:", 0);

  objc_msgSend(v6, "setModalTransitionStyle:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController imageExplorerViewController](self, "imageExplorerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationController"));
  objc_msgSend(v9, "setDelegate:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
  objc_msgSend(v10, "_setAccessibilityServesAsFirstElement:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007858;
  v15[3] = &unk_1000247B0;
  v15[4] = self;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _explorerImage](self, "_explorerImage"));
  v13 = v16;
  -[VOTImageExplorerViewServiceAdaptorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100007904;
  v14[3] = &unk_100024748;
  v14[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v14, 1.0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VOTImageExplorerViewServiceAdaptorViewController;
  -[VOTImageExplorerViewServiceAdaptorViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[VOTImageExplorerViewServiceAdaptorViewController _dismiss](self, "_dismiss");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  NSObject *v8;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = VOTLogImageExplorer(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100013A60();

  if (v6)
    v6[2](v6);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char isKindOfClass;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = VOTLogImageExplorer(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100013CEC();

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AXVoiceOverImageExplorerVisionResultData));

  v13 = objc_opt_class(AXMVisionResult, v12);
  v14 = AXMSecureCodingClasses();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v49 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:](NSKeyedUnarchiver, "axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:", v11, v13, v15, &v49));
  v17 = v49;
  -[VOTImageExplorerViewServiceAdaptorViewController setVisionResult:](self, "setVisionResult:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v20 = objc_opt_class(AXMVisionResult, v19);
  LOBYTE(v15) = objc_opt_isKindOfClass(v18, v20);

  if ((v15 & 1) == 0 || v17)
  {
    v39 = VOTLogImageExplorer(v21);
    v25 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_100013C5C();
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));

    if (v22)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", AXVoiceOverImageExplorerElementInfoData));

      v48 = 0;
      v27 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AXSBImageExplorerData, v26), v25, &v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = v48;
      -[VOTImageExplorerViewServiceAdaptorViewController setElementInfo:](self, "setElementInfo:", v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));
      v32 = objc_opt_class(AXSBImageExplorerData, v31);
      isKindOfClass = objc_opt_isKindOfClass(v30, v32);

      if ((isKindOfClass & 1) == 0 || v29)
      {
        v43 = VOTLogImageExplorer(v34);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          sub_100013BCC();
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));

        if (v35)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "hostAppName"));
          -[VOTImageExplorerViewServiceAdaptorViewController setHostAppName:](self, "setHostAppName:", v38);

          -[VOTImageExplorerViewServiceAdaptorViewController _populateCaptionAndMetadata](self, "_populateCaptionAndMetadata");
          if (v7)
            v7[2](v7);
          goto LABEL_20;
        }
        v45 = VOTLogImageExplorer(v36);
        v44 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          sub_100013B54((uint64_t)self, (uint64_t)v44, v46, v47);
      }

LABEL_20:
      goto LABEL_21;
    }
    v40 = VOTLogImageExplorer(v23);
    v25 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      sub_100013ADC((uint64_t)self, (uint64_t)v25, v41, v42);
  }
LABEL_21:

}

- (void)_setupRemoteProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v2, "setOrientationChangedEventsEnabled:", 0);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v2, "setWallpaperStyle:withDuration:", 4, 0.3);

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100007DE0;
  v2[3] = &unk_100024748;
  v2[4] = self;
  -[VOTImageExplorerViewServiceAdaptorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

- (BOOL)_isAssetLocallyAvailable
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "assetMetadataFeature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetMetadata"));
  v5 = objc_msgSend(v4, "assetLocallyAvailable");

  return v5;
}

- (id)_assetLocalIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "assetMetadataFeature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localIdentifier"));

  return v5;
}

- (id)_screenGrabImage
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)UIImage);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
  v6 = objc_msgSend(v3, "initWithCIImage:", v5);

  return v6;
}

- (id)_imageURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "assetMetadataFeature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));

  return v5;
}

- (id)_photoLibraryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "assetMetadataFeature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoLibraryURL"));

  return v5;
}

- (id)_photoAssetDataWithNetWorkAccess:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = objc_alloc((Class)AXMPhotoAssetData);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _assetLocalIdentifier](self, "_assetLocalIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _photoLibraryURL](self, "_photoLibraryURL"));
  v8 = objc_msgSend(v5, "initWithImageAssetLocalIdentifier:photoLibraryURL:allowsNetworkAccess:needsImageData:", v6, v7, v3, 1);

  return v8;
}

- (id)_explorerImage
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v26;
  NSString *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v3 = -[VOTImageExplorerViewServiceAdaptorViewController _isAssetLocallyAvailable](self, "_isAssetLocallyAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _assetLocalIdentifier](self, "_assetLocalIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _imageURL](self, "_imageURL"));
  v6 = objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _screenGrabImage](self, "_screenGrabImage"));
  v7 = (void *)v6;
  v8 = 0;
  if (v4 && v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _photoAssetDataWithNetWorkAccess:](self, "_photoAssetDataWithNetWorkAccess:", 0));
    v10 = VOTLogImageExplorer(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100013E78();

    v12 = objc_alloc((Class)UIImage);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageData"));
    v8 = objc_msgSend(v12, "initWithData:", v13);

  }
  if (!v8 && v7)
  {
    v14 = VOTLogImageExplorer(v6);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_100013D84();

    v8 = v7;
    goto LABEL_21;
  }
  if (v8 || !v5)
    goto LABEL_17;
  v6 = +[AXUIViewServiceUtilities axTCCAllowsPhotoLibraryAccess](AXUIViewServiceUtilities, "axTCCAllowsPhotoLibraryAccess");
  if ((_DWORD)v6)
  {
    v16 = VOTLogImageExplorer(v6);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class(self, v18);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = 138412802;
      v30 = v28;
      v31 = 2112;
      v32 = v5;
      v33 = 2112;
      v34 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ - Using url : %@ localIdentifier : %@", (uint8_t *)&v29, 0x20u);

    }
    v19 = objc_alloc((Class)UIImage);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v8 = objc_msgSend(v19, "initWithContentsOfFile:", v20);

LABEL_17:
    if (v8)
      goto LABEL_21;
  }
  v21 = VOTLogImageExplorer(v6);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    sub_100013E00((uint64_t)self, (uint64_t)v22, v23, v24);

  v8 = 0;
LABEL_21:

  return v8;
}

- (void)_reloadImageViewIfNeeded
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[7];
  _QWORD block[4];
  id v9;
  VOTImageExplorerViewServiceAdaptorViewController *v10;
  dispatch_semaphore_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  id location;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _assetLocalIdentifier](self, "_assetLocalIdentifier"));
  if (!-[VOTImageExplorerViewServiceAdaptorViewController _isAssetLocallyAvailable](self, "_isAssetLocallyAvailable")
    && v3)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = sub_100008514;
    v18[4] = sub_100008524;
    v19 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_100008514;
    v16[4] = sub_100008524;
    v17 = 0;
    v4 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v5 = objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController axVisionQueue](self, "axVisionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000852C;
    block[3] = &unk_1000248D8;
    objc_copyWeak(&v14, &location);
    v9 = v3;
    v10 = self;
    v12 = v18;
    v13 = v16;
    v11 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008918;
    v7[3] = &unk_100024900;
    v7[4] = self;
    v7[5] = v16;
    v7[6] = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(v18, 8);
  }

}

- (void)_populateCaptionAndMetadata
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VOTImageExplorerDetailData *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  VOTImageExplorerDetailData *v25;
  id v26;
  void *v27;
  void *v28;
  VOTImageExplorerDetailData *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  VOTImageExplorerDetailData *v34;
  id v35;
  void *v36;
  void *v37;
  VOTImageExplorerDetailData *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  void *v46;
  uint64_t v47;
  VOTImageExplorerDetailData *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  VOTImageExplorerDetailData *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  VOTImageExplorerViewServiceAdaptorViewController *v67;
  id v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  void *v76;
  _BYTE v77[128];
  void *v78;
  uint64_t v79;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "axLabel"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _screenGrabImage](self, "_screenGrabImage"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _assetLocalIdentifier](self, "_assetLocalIdentifier"));

      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "axLabel"));
        objc_msgSend(v3, "axSafelyAddObject:", v11);

      }
    }
  }
  v12 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.caption.title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "customContent"));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100008F9C;
  v74[3] = &unk_100024928;
  v68 = v13;
  v75 = v68;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ax_filteredArrayUsingBlock:", v74));

  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
    objc_msgSend(v3, "axSafelyAddObject:", v18);

  }
  if (objc_msgSend(v3, "count"))
  {
    v19 = -[VOTImageExplorerDetailData initWithKey:values:]([VOTImageExplorerDetailData alloc], "initWithKey:values:", v68, v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController detailData](self, "detailData"));
    objc_msgSend(v20, "axSafelyAddObject:", v19);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _visionFeatureDescriptionOptions](self, "_visionFeatureDescriptionOptions"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "detectedCaptionFeatureDescriptionWithOptions:", v22));

  if (objc_msgSend(v23, "length"))
  {
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "axCapitalizeFirstLetter"));

    v25 = [VOTImageExplorerDetailData alloc];
    v26 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.imgDesc"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v79 = v24;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v79, 1));
    v29 = -[VOTImageExplorerDetailData initWithKey:values:](v25, "initWithKey:values:", v27, v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController detailData](self, "detailData"));
    objc_msgSend(v30, "axSafelyAddObject:", v29);

    v23 = (void *)v24;
  }
  v64 = v23;
  v65 = v16;
  v66 = v3;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController visionResult](self, "visionResult"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController _visionFeatureDescriptionOptions](self, "_visionFeatureDescriptionOptions"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "detectedSceneClassificationFeatureDescriptionWithOptions:", v32));

  if (objc_msgSend(v33, "length"))
  {
    v34 = [VOTImageExplorerDetailData alloc];
    v35 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.scenes"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v78 = v33;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
    v38 = -[VOTImageExplorerDetailData initWithKey:values:](v34, "initWithKey:values:", v36, v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController detailData](self, "detailData"));
    objc_msgSend(v39, "axSafelyAddObject:", v38);

  }
  v63 = v33;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v67 = self;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController elementInfo](self, "elementInfo"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "customContent"));

  obj = v41;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v44)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "label"));
        if (v47)
        {
          v48 = (VOTImageExplorerDetailData *)v47;
          v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "value"));
          if (v49)
          {
            v50 = (void *)v49;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "label"));
            v52 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.faces.title"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
            if ((objc_msgSend(v51, "isEqualToString:", v53) & 1) != 0)
            {

            }
            else
            {
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "label"));
              v55 = objc_msgSend(v54, "isEqualToString:", v68);

              if ((v55 & 1) != 0)
                continue;
              v56 = [VOTImageExplorerDetailData alloc];
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "label"));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "value"));
              v76 = v58;
              v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
              v48 = -[VOTImageExplorerDetailData initWithKey:values:](v56, "initWithKey:values:", v57, v59);

              v50 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerViewServiceAdaptorViewController detailData](v67, "detailData"));
              objc_msgSend(v50, "axSafelyAddObject:", v48);
            }

          }
        }
      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v43);
  }

  v61 = VOTLogImageExplorer(v60);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    sub_100014144(v67, v62);

}

- (id)_visionFeatureDescriptionOptions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](AXSettings, "sharedInstance"));
  v3 = objc_msgSend(v2, "voiceOverDiscoveredSensitiveContentFeedback");

  v8[0] = AXMFeatureDescriptionOptionLocale;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US")));
  v9[0] = v4;
  v8[1] = AXMFeatureDescriptionOptionModifyForSensitiveContent;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3 == 0));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return v6;
}

- (VOTImageExplorerViewController)imageExplorerViewController
{
  return self->_imageExplorerViewController;
}

- (void)setImageExplorerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_imageExplorerViewController, a3);
}

- (AXMVisionResult)visionResult
{
  return self->_visionResult;
}

- (void)setVisionResult:(id)a3
{
  objc_storeStrong((id *)&self->_visionResult, a3);
}

- (AXSBImageExplorerData)elementInfo
{
  return self->_elementInfo;
}

- (void)setElementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_elementInfo, a3);
}

- (NSString)hostAppName
{
  return self->_hostAppName;
}

- (void)setHostAppName:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppName, a3);
}

- (OS_dispatch_queue)axVisionQueue
{
  return self->_axVisionQueue;
}

- (void)setVisionEngine:(id)a3
{
  objc_storeStrong((id *)&self->_visionEngine, a3);
}

- (NSMutableArray)detailData
{
  return self->_detailData;
}

- (void)setDetailData:(id)a3
{
  objc_storeStrong((id *)&self->_detailData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailData, 0);
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_axVisionQueue, 0);
  objc_storeStrong((id *)&self->_hostAppName, 0);
  objc_storeStrong((id *)&self->_elementInfo, 0);
  objc_storeStrong((id *)&self->_visionResult, 0);
  objc_storeStrong((id *)&self->_imageExplorerViewController, 0);
}

@end
