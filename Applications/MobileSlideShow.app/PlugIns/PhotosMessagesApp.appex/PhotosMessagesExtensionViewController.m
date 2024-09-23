@implementation PhotosMessagesExtensionViewController

- (PhotosMessagesExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PhotosMessagesExtensionViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PhotosMessagesExtensionViewController;
  v4 = -[PhotosMessagesExtensionViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  if (v4 && qword_1000114D0 != -1)
    dispatch_once(&qword_1000114D0, &stru_10000C450);
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PhotosMessagesExtensionViewController;
  -[PhotosMessagesExtensionViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
  if (qword_1000114D8 != -1)
    dispatch_once(&qword_1000114D8, &stru_10000C470);
}

- (void)viewDidLoad
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PhotosMessagesExtensionViewController;
  -[PhotosMessagesExtensionViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance"));
  v4 = objc_msgSend(v3, "useDebugColors");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
  }
  else if (-[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle") == (id)2
         || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController traitCollection](self, "traitCollection")),
             v7 = objc_msgSend(v6, "userInterfaceIdiom"),
             v6,
             v7 == (id)6))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  }
  v8 = (void *)v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[PhotosMessagesExtensionViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, 1.0, 0.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_contentReadyForDisplay = -[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle") != (id)2;
  v5.receiver = self;
  v5.super_class = (Class)PhotosMessagesExtensionViewController;
  -[PhotosMessagesExtensionViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (id)_assetCollectionForURL:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t Log;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;

  v3 = a3;
  v4 = PXFetchAssetCollectionForCMMShareURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  if (!v6)
  {
    Log = PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pl_redactedShareURL"));
      v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to find asset collection for URL: %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

  return v6;
}

- (BOOL)_isDrawerViewController
{
  return !self->_isModal
      && (unint64_t)-[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle") < 2;
}

- (id)_recipientsForConversation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recipientAddresses"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(objc_alloc((Class)PXRecipient), "initWithAddress:nameComponents:recipientKind:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), 0, 0);
          v15 = v14;
          if (v14)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "invalidAddressString"));

            if (!v16)
              objc_msgSend(v8, "addObject:", v15);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000068E4;
    v19[3] = &unk_10000C4B8;
    v7 = v8;
    v20 = v7;
    objc_msgSend(v4, "performChanges:", v19);

    v3 = v18;
  }

  return v7;
}

- (id)_contactsForConversation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController _recipientsForConversation:](self, "_recipientsForConversation:", v4));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "contact"));
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_stageMessageForConversation:(id)a3 withTemplateItem:(id)a4 messageURL:(id)a5 summaryText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t Log;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  _QWORD v21[5];
  uint8_t buf[16];

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = objc_alloc_init((Class)MSMessage);
  v15 = objc_msgSend(objc_alloc((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v13);

  v16 = objc_msgSend(v14, "setLayout:", v15);
  if (v11)
  {
    objc_msgSend(v14, "setURL:", v11);
  }
  else
  {
    Log = PLSharingGetLog(v16);
    v18 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Staging message with no URL", buf, 2u);
    }

  }
  objc_msgSend(v14, "setSummaryText:", v12);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance"));
  v20 = objc_msgSend(v19, "directSendMessages");

  if (v20)
  {
    objc_msgSend(v10, "sendMessage:completionHandler:", v14, &stru_10000C4F8);
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100006748;
    v21[3] = &unk_10000C520;
    v21[4] = self;
    objc_msgSend(v10, "insertMessage:completionHandler:", v14, v21);
  }

}

- (void)_contentReadyForDisplayTimeout
{
  uint64_t v3;
  NSObject *v4;
  PXTranscriptBubbleViewController *transcriptBubbleViewController;
  int v6;
  PXTranscriptBubbleViewController *v7;

  if (!self->_contentReadyForDisplay)
  {
    v3 = PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      transcriptBubbleViewController = self->_transcriptBubbleViewController;
      v6 = 138412290;
      v7 = transcriptBubbleViewController;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Content ready for display timed out for bubble %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_confirmPicking:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (+[PXSharingConfidentialityController confidentialityCheckRequired](PXSharingConfidentialityController, "confidentialityCheckRequired")&& (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchedObjects")), v9 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssets:](PXSharingConfidentialityController, "confidentialWarningRequiredForAssets:", v8), v8, v9))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006728;
    v16[3] = &unk_10000C548;
    v17 = v7;
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100006738;
    v14 = &unk_10000C548;
    v15 = v17;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXSharingConfidentialityController confidentialityAlertWithConfirmAction:abortAction:](PXSharingConfidentialityController, "confidentialityAlertWithConfirmAction:abortAction:", v16, &v11));
    -[PhotosMessagesExtensionViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v10, 1, 0, v11, v12, v13, v14);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

- (void)_finishPicking:(id)a3 withPreparationOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id obj;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  PhotosMessagesExtensionViewController *v61;
  id v62;
  id location;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v6 = a3;
  v48 = a4;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController transport](self, "transport"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController loadingStatusManager](self, "loadingStatusManager"));
  v7 = objc_alloc((Class)NSMutableSet);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "expectedPackageIdentifiers"));
  v49 = objc_msgSend(v7, "initWithSet:", v8);

  if (plsGreenTeaEnabled() && objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchedObjects"));
    v10 = PXMap(v9, &stru_10000C588);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoLibrary"));
    v13 = (uint64_t)+[PHAsset countOfAssetsWithLocationFromUUIDs:photoLibrary:](PHAsset, "countOfAssetsWithLocationFromUUIDs:photoLibrary:", v11, v12);

    if (v13 >= 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));

      plslogGreenTea(v15, 1, CFSTR("Selected %lu photo(s) with location in PhotosMessagesApp"));
    }

  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v6;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "expectedPackageIdentifiers"));
        v22 = objc_msgSend(v21, "containsObject:", v20);

        if (v22)
        {
          objc_msgSend(v49, "removeObject:", v20);
        }
        else
        {
          objc_msgSend(v52, "addPendingPackageIdentifier:", v20);
          v23 = objc_msgSend(objc_alloc((Class)AEPhotosAssetPackageGenerator), "initWithAsset:", v19);
          objc_msgSend(v23, "setPreparationOptions:", v48);
          v24 = objc_msgSend(v23, "beginGenerating");
          objc_initWeak(&location, self);
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10000649C;
          v57[3] = &unk_10000C5B0;
          v58 = v52;
          v25 = v20;
          v59 = v25;
          objc_copyWeak(&v62, &location);
          v26 = v51;
          v60 = v26;
          v61 = self;
          if ((objc_msgSend(v23, "retrieveGeneratedPackageWithCompletion:", v57) & 1) == 0)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uuid"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "willBeginLoadOperationWithItemIdentifier:", v27));

            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "progress"));
            objc_msgSend(v29, "setUserInfoObject:forKey:", v28, CFSTR("PhotosMessagesExtensionProgressTrackingIDKey"));

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "progress"));
            v31 = NSStringFromSelector("fractionCompleted");
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            objc_msgSend(v30, "addObserver:forKeyPath:options:context:", self, v32, 4, off_1000111B0);

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "progress"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController loadingProgresses](self, "loadingProgresses"));
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v25);

          }
          objc_destroyWeak(&v62);

          objc_destroyWeak(&location);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v16);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allObjects"));
  objc_msgSend(v52, "removeAllExpectedPackagesWithIdentifiers:", v35);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v36 = v35;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(_QWORD *)v54 != v38)
          objc_enumerationMutation(v36);
        v40 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController loadingProgresses](self, "loadingProgresses"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v40));

        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "userInfo"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PhotosMessagesExtensionProgressTrackingIDKey")));
          objc_msgSend(v51, "didCancelLoadOperationWithTrackingID:", v44);

          v45 = NSStringFromSelector("fractionCompleted");
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          objc_msgSend(v42, "removeObserver:forKeyPath:", self, v46);

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController loadingProgresses](self, "loadingProgresses"));
          objc_msgSend(v47, "removeObjectForKey:", v40);

        }
      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    }
    while (v37);
  }

}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  PXTranscriptBubbleViewController *transcriptBubbleViewController;
  double v6;
  double v7;
  uint64_t Log;
  NSObject *v9;
  double v10;
  double v11;
  uint8_t v12[16];
  CGSize result;

  height = a3.height;
  width = a3.width;
  transcriptBubbleViewController = self->_transcriptBubbleViewController;
  if (transcriptBubbleViewController)
  {
    -[PXTranscriptBubbleViewController contentSizeThatFits:](transcriptBubbleViewController, "contentSizeThatFits:", a3.width, a3.height);
    width = v6;
    height = v7;
  }
  else
  {
    Log = PLSharingGetLog(0);
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Asked for a transcript bubble size without a PXTranscriptBubbleViewController", v12, 2u);
    }

  }
  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)displaysAfterAppearance
{
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_contentReadyForDisplay)
    return 1;
  self->_displayStartTime = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  v4 = dispatch_time(0, 5000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006470;
  v5[3] = &unk_10000C5D8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return self->_contentReadyForDisplay;
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  unsigned __int8 v17;
  objc_super v18;
  uint8_t buf[16];

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance"));
    v6 = objc_msgSend(v5, "useDebugColors");

    if (-[PhotosMessagesExtensionViewController _isDrawerViewController](self, "_isDrawerViewController")
      || (v6 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;

      v14 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v11, v13);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000638C;
      v16[3] = &unk_10000C600;
      v17 = v6;
      v16[4] = self;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithActions:", v16));
      v4[2](v4, v15);

    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)PhotosMessagesExtensionViewController;
      -[PhotosMessagesExtensionViewController updateSnapshotWithCompletionBlock:](&v18, "updateSnapshotWithCompletionBlock:", v4);
    }
  }
  else
  {
    v7 = PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "updateSnapshotWithCompletionBlock called with missing completion block", buf, 2u);
    }

  }
}

- (void)_presentViewControllerForConversation:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  PXCMMWorkflowCoordinator *workflowCoordinator;
  PXCMMWorkflowCoordinator *v24;
  PXCMMWorkflowCoordinator *v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  BOOL *p_supportsNavigationBarTransition;
  id v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t Log;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[5];
  _QWORD v74[5];
  uint8_t v75[4];
  id v76;
  __int128 buf;
  uint64_t v78;
  uint64_t v79;

  v5 = a5;
  v72 = a3;
  v8 = -[PhotosMessagesExtensionViewController _removeAllChildViewControllersAnimated:](self, "_removeAllChildViewControllersAnimated:", v5);
  if (a4 == 3)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentedViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedURL"));
    v18 = objc_msgSend(v15, "selectedActivityType");
    if (v17
      && (v19 = v18,
          v18 = (id)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController _assetCollectionForURL:](self, "_assetCollectionForURL:", v17)), (v20 = v18) != 0)&& (v21 = objc_msgSend(objc_alloc((Class)PXCMMPhotoKitContext), "initWithAssetCollection:activityType:sourceType:", v18, v19, 1), v20, v21))
    {
      objc_msgSend(v21, "setSourceType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController _recipientsForConversation:](self, "_recipientsForConversation:", v72));
      objc_msgSend(v21, "setRecipients:", v22);

      workflowCoordinator = self->_workflowCoordinator;
      if (!workflowCoordinator)
      {
        v24 = (PXCMMWorkflowCoordinator *)objc_alloc_init((Class)PXCMMWorkflowCoordinator);
        v25 = self->_workflowCoordinator;
        self->_workflowCoordinator = v24;

        -[PXCMMWorkflowCoordinator setDelegate:](self->_workflowCoordinator, "setDelegate:", self);
        workflowCoordinator = self->_workflowCoordinator;
      }
      v26 = -[PXCMMWorkflowCoordinator workflowViewControllerWithContext:embedInNavigationControllerOfClass:](workflowCoordinator, "workflowViewControllerWithContext:embedInNavigationControllerOfClass:", v21, objc_opt_class(PUNavigationController));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      -[PhotosMessagesExtensionViewController _presentChildViewController:animated:](self, "_presentChildViewController:animated:", v27, 1);

    }
    else if (v16)
    {
      -[PhotosMessagesExtensionViewController _presentChildViewController:animated:](self, "_presentChildViewController:animated:", v16, 0);
    }
    else
    {
      v55 = PLUIGetLog(v18);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Requested a full screen view controller to present over Messages but failed to load content for it", (uint8_t *)&buf, 2u);
      }

      if (v17)
      {
        Log = PLSharingGetLog(v57);
        v59 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pl_redactedShareURL"));
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v60;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Failed to load a CMM context for a CMM bubble URL %@", (uint8_t *)&buf, 0xCu);

        }
        v61 = PXLocalizedString(CFSTR("PXMessagesFullScreenErrorTitle"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        v63 = PXLocalizedString(CFSTR("PXMessagesFullScreenCMMErrorMessage"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v65 = objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v62, v64, 1));
      }
      else
      {
        v66 = PXLocalizedString(CFSTR("PXMessagesFullScreenErrorTitle"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v67 = PXLocalizedString(CFSTR("PXMessagesFullScreenGenericErrorMessage"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v65 = objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v62, v64, 1));
      }
      v68 = (void *)v65;

      v69 = PXLocalizedString(CFSTR("PXOK"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10000618C;
      v74[3] = &unk_10000C628;
      v74[4] = self;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v70, 0, v74));
      objc_msgSend(v68, "addAction:", v71);

      -[PhotosMessagesExtensionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v68, 1, 0);
    }

    goto LABEL_38;
  }
  if (a4 == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "selectedMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderParticipantIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localParticipantIdentifier"));
    v12 = objc_msgSend(v10, "isEqual:", v11);

    v13 = objc_alloc((Class)PXCMMTranscriptBubbleViewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    v15 = objc_msgSend(v13, "initWithURL:isSender:", v14, v12);

    objc_msgSend(v15, "setDelegate:", self);
    objc_msgSend(v15, "setTouchDelegate:", self);
    objc_storeStrong((id *)&self->_transcriptBubbleViewController, v15);

  }
  else
  {
    v28 = PLAssetExplorerGetLog(v8);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Presenting default picker", (uint8_t *)&buf, 2u);
    }

    v30 = objc_alloc_init((Class)AEPackageTransport);
    objc_msgSend(v30, "setDelegate:", self);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v78 = 0x2020000000;
    v79 = 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "draftAssetArchives"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100006194;
    v73[3] = &unk_10000C650;
    v73[4] = &buf;
    v32 = PXMap(v31, v73);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v34 = objc_msgSend(v33, "count");
    if (v34)
    {
      v35 = PLAssetExplorerGetLog(v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_msgSend(v33, "count");
        *(_DWORD *)v75 = 134217984;
        v76 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Selecting %lu initial asset draft(s)", v75, 0xCu);
      }

      objc_msgSend(v30, "stagePackages:andNotify:", v33, 0);
    }
    v38 = objc_alloc((Class)PHPickerConfiguration);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    v40 = objc_msgSend(v38, "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v39);

    objc_msgSend(v40, "setSelectionLimit:", 20);
    objc_msgSend(v40, "setSelection:", 3);
    v41 = PXMap(v33, &stru_10000C690);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v40, "setPreselectedAssetIdentifiers:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "preselectedAssetIdentifiers"));
    self->_numberOfPreselectedAssets = (int64_t)objc_msgSend(v43, "count");

    if (a4)
      v44 = 10;
    else
      v44 = 15;
    objc_msgSend(v40, "setEdgesWithoutContentMargins:", v44);
    objc_msgSend(v40, "setDisabledCapabilities:", 18);
    objc_msgSend(v40, "_setAllowsEncodingPolicyModification:", 0);
    v45 = objc_alloc_init((Class)PXLoadingStatusManager);
    v46 = objc_alloc((Class)PUPickerConfiguration);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController extensionContext](self, "extensionContext"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "_auxiliaryConnection"));
    v49 = objc_msgSend(v46, "initWithPHPickerConfiguration:connection:", v40, v48);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[PXPhotoPickerSettings sharedInstance](PXPhotoPickerSettings, "sharedInstance"));
    if (objc_msgSend(v50, "useNavBarAnimatedTransition"))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController traitCollection](self, "traitCollection"));
      p_supportsNavigationBarTransition = &self->_supportsNavigationBarTransition;
      self->_supportsNavigationBarTransition = objc_msgSend(v51, "userInterfaceIdiom") == 0;

    }
    else
    {
      p_supportsNavigationBarTransition = &self->_supportsNavigationBarTransition;
      self->_supportsNavigationBarTransition = 0;
    }

    if (*p_supportsNavigationBarTransition)
      objc_msgSend(v49, "performChanges:", &stru_10000C6D0);
    v53 = objc_msgSend(objc_alloc((Class)PUPickerCoordinator), "initWithPUConfiguration:coordinatorActionHandler:loadingStatusManager:", v49, self, v45);
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "viewController"));
    -[PhotosMessagesExtensionViewController setPickerCoordinator:](self, "setPickerCoordinator:", v53);
    -[PhotosMessagesExtensionViewController setTransport:](self, "setTransport:", v30);
    -[PhotosMessagesExtensionViewController setLoadingStatusManager:](self, "setLoadingStatusManager:", v45);
    v54 = objc_alloc_init((Class)NSMutableDictionary);
    -[PhotosMessagesExtensionViewController setLoadingProgresses:](self, "setLoadingProgresses:", v54);

    _Block_object_dispose(&buf, 8);
  }
  if (v15)
  {
    -[PhotosMessagesExtensionViewController _presentChildViewController:animated:](self, "_presentChildViewController:animated:", v15, v5);
LABEL_38:

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController childViewControllers](self, "childViewControllers"));
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v7 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "supportedInterfaceOrientations");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PhotosMessagesExtensionViewController;
    v7 = -[PhotosMessagesExtensionViewController supportedInterfaceOrientations](&v11, "supportedInterfaceOrientations");
  }

  return v7;
}

- (void)_presentChildViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v4 = a4;
  v6 = a3;
  -[PhotosMessagesExtensionViewController addChildViewController:](self, "addChildViewController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v17, "setAutoresizingMask:", 18);

  if (v4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v18, "setAlpha:", 0.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v19, "addSubview:", v20);

    objc_msgSend(v6, "didMoveToParentViewController:", self);
    -[PhotosMessagesExtensionViewController _setNeedsUpdateOfSupportedInterfaceOrientations](self, "_setNeedsUpdateOfSupportedInterfaceOrientations");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100006158;
    v23[3] = &unk_10000C6F8;
    v24 = v6;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v23, 0.3);

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v21, "addSubview:", v22);

    objc_msgSend(v6, "didMoveToParentViewController:", self);
    -[PhotosMessagesExtensionViewController _setNeedsUpdateOfSupportedInterfaceOrientations](self, "_setNeedsUpdateOfSupportedInterfaceOrientations");
  }

}

- (void)_removeAllChildViewControllersAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  UIViewController *v9;
  PXTranscriptBubbleViewController *transcriptBubbleViewController;
  _QWORD v12[5];
  Block_layout *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController childViewControllers](self, "childViewControllers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(UIViewController **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        if (v3)
        {
          v13 = &stru_10000C738;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000060C0;
          v14[3] = &unk_10000C6F8;
          v14[4] = v9;
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1000060F4;
          v12[3] = &unk_10000C760;
          v12[4] = v9;
          +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v12, 0.3);

        }
        else
        {
          sub_100006104(v5, v9);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = v5;
    }
    while (v5);
  }

  transcriptBubbleViewController = self->_transcriptBubbleViewController;
  self->_transcriptBubbleViewController = 0;

}

- (void)_updatePresentedViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t Log;
  NSObject *v11;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedURL"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    Log = PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Presenting a modal with both a CMM workflow and a presented view controller. Only one will be shown", (uint8_t *)&v15, 2u);
    }

    goto LABEL_13;
  }
  if (v4)
  {
LABEL_13:
    v13 = PLSharingGetLog(v5);
    v9 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pl_redactedShareURL"));
      v15 = 138543362;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting modal presentation for CMM flow: %{public}@", (uint8_t *)&v15, 0xCu);

    }
LABEL_15:

    -[PhotosMessagesExtensionViewController requestPresentationStyle:](self, "requestPresentationStyle:", 3);
    goto LABEL_16;
  }
  if (v5)
  {
    v8 = PLSharingGetLog(v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting modal presentation for view controller: %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_dismissDrawerViewControllerWithDesiredState:(int64_t)a3
{
  char v4;
  uint64_t v5;
  _QWORD *v6;
  id pendingDidPresentBlock;
  _QWORD v8[4];
  id v9;
  char v10;
  id location;

  if (a3 == 3)
  {
    if (!-[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle"))
      return;
    v5 = 0;
    v4 = 1;
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    if (-[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle") == (id)1)
      return;
    v4 = 0;
    v5 = 1;
    goto LABEL_10;
  }
  if (a3 == 1 && -[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle"))
  {
    v4 = 0;
    v5 = 0;
LABEL_10:
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005FDC;
    v8[3] = &unk_10000C788;
    v10 = v4;
    objc_copyWeak(&v9, &location);
    v6 = objc_retainBlock(v8);
    pendingDidPresentBlock = self->_pendingDidPresentBlock;
    self->_pendingDidPresentBlock = v6;

    -[PhotosMessagesExtensionViewController requestPresentationStyle:](self, "requestPresentationStyle:", v5);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)incrementShareCountAndLogAnalyticsForStagedAssetIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];

  v4 = a3;
  v5 = objc_alloc((Class)PHPhotoLibrary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL"));
  v7 = objc_msgSend(v5, "initWithPhotoLibraryURL:", v6);

  v21 = v7;
  v22 = v4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "librarySpecificFetchOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v4));
  PXIncrementShareCountForAssets();
  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = CPAnalyticsPayloadAssetsKey;
    v16 = CPAnalyticsPayloadClassNameKey;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v17);
        v28[0] = v15;
        v28[1] = v16;
        v29[0] = v18;
        v29[1] = v11;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
        +[CPAnalytics sendEvent:withPayload:](CPAnalytics, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.stagedForSharingInMessages"), v19);

        v17 = (char *)v17 + 1;
      }
      while (v13 != v17);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v13);
  }

}

- (void)packageTransport:(id)a3 didStagePackages:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  PhotosMessagesExtensionViewController *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v5 = a4;
  v19 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController activeConversation](self, "activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v20 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v20));
        v15 = v20;
        v16 = v15;
        if (v14)
        {
          objc_msgSend(v6, "_insertAssetArchive:completionHandler:", v14, &stru_10000C7A8);
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
          objc_msgSend(v7, "addObject:", v17);
        }
        else
        {
          v18 = PLUIGetLog(v15);
          v17 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Archiving error: %@", buf, 0xCu);
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
    -[PhotosMessagesExtensionViewController incrementShareCountAndLogAnalyticsForStagedAssetIDs:](v19, "incrementShareCountAndLogAnalyticsForStagedAssetIDs:", v7);
  v19->numberOfStagedAssetsBeforeSend = 0;

}

- (void)packageTransport:(id)a3 didUnstagePackageWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController activeConversation](self, "activeConversation"));
  objc_msgSend(v6, "_removeAssetArchiveWithIdentifier:completionHandler:", v5, &stru_10000C7C8);
  self->numberOfStagedAssetsBeforeSend = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController pickerCoordinator](self, "pickerCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v5));

  v10 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v7, "deselectAssetsWithIdentifiers:", v9);

}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t numberOfStagedAssetsBeforeSend;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v4 = a3;
  if (!self->numberOfStagedAssetsBeforeSend)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController transport](self, "transport"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "orderedStagedIdentifiers"));
    self->numberOfStagedAssetsBeforeSend = (unint64_t)objc_msgSend(v6, "count");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController transport](self, "transport"));
  objc_msgSend(v7, "unstagePackageWithIdentifier:andNotify:", v4, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController transport](self, "transport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "orderedStagedIdentifiers"));
  if (objc_msgSend(v9, "count"))
  {

  }
  else
  {
    numberOfStagedAssetsBeforeSend = self->numberOfStagedAssetsBeforeSend;

    if (numberOfStagedAssetsBeforeSend)
    {
      v20[0] = CPAnalyticsPayloadGenericAssetCountKey;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->numberOfStagedAssetsBeforeSend));
      v21[0] = v11;
      v20[1] = CPAnalyticsPayloadClassNameKey;
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v21[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      +[CPAnalytics sendEvent:withPayload:](CPAnalytics, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetExplorerSharedInMessages"), v15);

      self->numberOfStagedAssetsBeforeSend = 0;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController pickerCoordinator](self, "pickerCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset localIdentifierWithUUID:](PHAsset, "localIdentifierWithUUID:", v4));
  v19 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  objc_msgSend(v16, "deselectAssetsWithIdentifiers:", v18);

}

- (void)explorerViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005E80;
  v9[3] = &unk_10000C4B8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performChanges:", v9);

}

- (void)explorerViewController:(id)a3 dismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel", a3, a4, a5));
  objc_msgSend(v6, "performChanges:", &stru_10000C808);
  objc_msgSend((id)qword_1000114C0, "dismiss");
  v5 = (void *)qword_1000114C0;
  qword_1000114C0 = 0;

}

- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4
{
  return 2;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  uint64_t v8;
  id v9;

  if (-[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle", a3, a4, a5))
    v8 = 2;
  else
    v8 = 1;
  -[PhotosMessagesExtensionViewController _dismissDrawerViewControllerWithDesiredState:](self, "_dismissDrawerViewControllerWithDesiredState:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
  objc_msgSend(v9, "performChanges:", &stru_10000C828);
  if (a6 != 1 && self->_isModal)
    -[PhotosMessagesExtensionViewController dismiss](self, "dismiss");

}

- (void)workflowCoordinator:(id)a3 didPublishToURL:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController activeConversation](self, "activeConversation"));
  v7 = objc_alloc_init((Class)MSMessageTemplateLayout);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController _assetCollectionForURL:](self, "_assetCollectionForURL:", v5));
  if (objc_msgSend(v8, "assetCollectionType") == (id)7)
  {
    v27 = v6;
    v28 = 0;
    v29 = 0;
    PXCMMTitleAndSubtitleForAssetCollection(v8, &v29, &v28);
    v9 = v29;
    v26 = v28;
    objc_msgSend(v7, "setCaption:", v9);
    v10 = PXLocalizedAssetCountForUsage(objc_msgSend(v8, "assetCount"), objc_msgSend(v8, "aggregateMediaType"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "setSubcaption:", v11);
    v12 = 0;
    if (v9 && v11)
    {
      v13 = PXLocalizedString(CFSTR("PXMessagesNotificationSummaryFormat"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = PFStringWithValidatedFormat(v14, CFSTR("%@ %@"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preview"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "previewImageData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v18));
      objc_msgSend(v7, "setImage:", v19);

    }
    v6 = v27;
  }
  else
  {
    v20 = PXLocalizedString(CFSTR("PXCompleteMyMomentMessagesTemplateBubbleText"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localParticipantIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
    v23 = PFStringWithValidatedFormat(v21, CFSTR("%@"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v7, "setCaption:", v24);

    v12 = 0;
  }
  -[PhotosMessagesExtensionViewController _stageMessageForConversation:withTemplateItem:messageURL:summaryText:](self, "_stageMessageForConversation:withTemplateItem:messageURL:summaryText:", v6, v7, v5, v12);

}

- (void)bubbleDidBecomeReadyForDisplay:(id)a3
{
  id v4;
  double Current;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  int v10;
  double v11;
  __int16 v12;
  id v13;

  v4 = a3;
  if (!self->_contentReadyForDisplay)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = PLUIGetLog(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = Current - self->_displayStartTime;
      v10 = 134218242;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Triggering display of live bubble after %lf seconds: %@", (uint8_t *)&v10, 0x16u);
    }

    self->_contentReadyForDisplay = 1;
    -[PhotosMessagesExtensionViewController setReadyForDisplay](self, "setReadyForDisplay");
  }

}

- (UIEdgeInsets)safeAreaInsetsForBubble:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[PhotosMessagesExtensionViewController _balloonMaskEdgeInsets](self, "_balloonMaskEdgeInsets", a3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)requestResizeForBubble:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  Log = PLSharingGetLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resize requested by bubble: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PhotosMessagesExtensionViewController requestResize](self, "requestResize");
}

- (void)transcriptBubbleViewController:(id)a3 didSelectMomentShare:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t Log;
  NSObject *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController activeConversation](self, "activeConversation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedMessage"));
  v8 = objc_msgSend(v7, "isPending");

  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v5, "isSender"))
      v9 = 3;
    else
      v9 = 2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100005E0C;
    v18 = &unk_10000C850;
    v11 = v5;
    v19 = v11;
    v20 = v9;
    objc_msgSend(v10, "performChanges:", &v15);
    v12 = objc_msgSend(v10, "isDrawerActive", v15, v16, v17, v18);
    if ((v12 & 1) == 0)
    {
      Log = PLSharingGetLog(v12);
      v14 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presenting modal from bubble tap: %@", buf, 0xCu);
      }

      -[PhotosMessagesExtensionViewController requestPresentationStyle:](self, "requestPresentationStyle:", 3);
    }

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  if (off_1000111B8 != a5)
    abort();
  if ((v6 & 0x19) != 0)
  {
    v9 = v8;
    -[PhotosMessagesExtensionViewController _updatePresentedViewController](self, "_updatePresentedViewController");
    v8 = v9;
  }

}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v5 = a3;
  v6 = a4;
  v7 = PLUIGetLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handle text input payload: %@ with payload ID: %@", buf, 0x16u);
  }

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.messages.datadetectors.photos")) & 1) != 0
    || (v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.messages.photos")), (_DWORD)v9))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Photos")));
    v11 = v10;
    if (v10 && (v10 = -[NSObject count](v10, "count")) != 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("Text")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("Timestamp")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100005DC4;
      v21[3] = &unk_10000C878;
      v22 = v13;
      v23 = v14;
      v16 = v14;
      v17 = v13;
      objc_msgSend(v15, "performChanges:", v21);

    }
    else
    {
      v18 = PLUIGetLog(v10);
      v12 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No array of photos in payload: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v20 = PLUIGetLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unexpected payload ID: %@", buf, 0xCu);
    }
  }

  return 0;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  id v5;
  uint64_t Log;
  NSObject *v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PhotosMessagesExtensionViewController;
  v4 = a3;
  v5 = -[PhotosMessagesExtensionViewController willBecomeActiveWithConversation:](&v13, "willBecomeActiveWithConversation:", v4);
  Log = PLAssetExplorerGetLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will become active", v12, 2u);
  }

  v8 = -[PhotosMessagesExtensionViewController presentationStyle](self, "presentationStyle");
  if (v8 == (id)3)
  {
    objc_storeStrong((id *)&qword_1000114C0, self);
    self->_isModal = 1;
  }
  v9 = -[PhotosMessagesExtensionViewController _isDrawerViewController](self, "_isDrawerViewController");
  -[PhotosMessagesExtensionViewController _presentViewControllerForConversation:presentationStyle:animated:](self, "_presentViewControllerForConversation:presentationStyle:animated:", v4, v8, v9);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
    objc_msgSend(v10, "registerChangeObserver:context:", self, off_1000111B8);
    objc_msgSend(v10, "performChanges:", &stru_10000C898);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "_didStageBubble:", CFSTR("DidStageBubble"), 0);

    +[AEPhotosAssetPackageGenerator deleteTemporaryStorageWithTimeout:](AEPhotosAssetPackageGenerator, "deleteTemporaryStorageWithTimeout:", 1.0);
  }
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PhotosMessagesExtensionViewController;
  v4 = -[PhotosMessagesExtensionViewController didBecomeActiveWithConversation:](&v8, "didBecomeActiveWithConversation:", a3);
  Log = PLAssetExplorerGetLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did become active", v7, 2u);
  }

  self->_didBecomeActive = 1;
}

- (void)didResignActiveWithConversation:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PhotosMessagesExtensionViewController;
  v4 = -[PhotosMessagesExtensionViewController didResignActiveWithConversation:](&v10, "didResignActiveWithConversation:", a3);
  Log = PLAssetExplorerGetLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did resign active", v9, 2u);
  }

  if (-[PhotosMessagesExtensionViewController _isDrawerViewController](self, "_isDrawerViewController"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
    objc_msgSend(v7, "performChanges:", &stru_10000C8B8);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("DidStageBubble"), 0);

  }
}

- (void)willResignActiveWithConversation:(id)a3
{
  id v3;
  uint64_t Log;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PhotosMessagesExtensionViewController;
  v3 = -[PhotosMessagesExtensionViewController willResignActiveWithConversation:](&v8, "willResignActiveWithConversation:", a3);
  Log = PLAssetExplorerGetLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will resign active", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
  objc_msgSend(v6, "performChanges:", &stru_10000C8D8);

}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;
  uint8_t buf[4];
  unint64_t v13;

  self->_transitioningPresentationStyles = 1;
  v11.receiver = self;
  v11.super_class = (Class)PhotosMessagesExtensionViewController;
  v5 = -[PhotosMessagesExtensionViewController willTransitionToPresentationStyle:](&v11, "willTransitionToPresentationStyle:");
  Log = PLAssetExplorerGetLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will transition to presentation style %{public}lu", buf, 0xCu);
  }

  if (!self->_supportsNavigationBarTransition)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController pickerCoordinator](self, "pickerCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005D30;
    v10[3] = &unk_10000C8F8;
    v10[4] = a3;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  void (**v8)(_QWORD);
  id pendingDidPresentBlock;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  unint64_t v13;

  v11.receiver = self;
  v11.super_class = (Class)PhotosMessagesExtensionViewController;
  v5 = -[PhotosMessagesExtensionViewController didTransitionToPresentationStyle:](&v11, "didTransitionToPresentationStyle:");
  Log = PLAssetExplorerGetLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Did transition to presentation style %{public}lu", buf, 0xCu);
  }

  v8 = (void (**)(_QWORD))objc_retainBlock(self->_pendingDidPresentBlock);
  pendingDidPresentBlock = self->_pendingDidPresentBlock;
  self->_pendingDidPresentBlock = 0;

  if (v8)
    v8[2](v8);
  if (!a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PXMessagesExtensionViewModel sharedRootViewModel](PXMessagesExtensionViewModel, "sharedRootViewModel"));
    objc_msgSend(v10, "performChanges:", &stru_10000C918);

  }
  self->_transitioningPresentationStyles = 0;

}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;

  v12.receiver = self;
  v12.super_class = (Class)PhotosMessagesExtensionViewController;
  v5 = a3;
  -[PhotosMessagesExtensionViewController didCancelSendingMessage:conversation:](&v12, "didCancelSendingMessage:conversation:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL", v12.receiver, v12.super_class));

  Log = PLSharingGetLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(Log);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pl_redactedShareURL"));
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User cancelled send of CMM for URL: %{public}@", buf, 0xCu);

    }
    PXExpungeMomentShareForURL(v6, 0);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User cancelled send of CMM with no URL", buf, 2u);
    }

  }
}

- (void)_didStageBubble:(id)a3
{
  -[PhotosMessagesExtensionViewController requestPresentationStyle:](self, "requestPresentationStyle:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;

  v10 = a4;
  v11 = v10;
  if (off_1000111B0 == a6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005CA8;
    v13[3] = &unk_10000C940;
    v13[4] = self;
    v14 = v10;
    px_dispatch_on_main_queue(v13);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PhotosMessagesExtensionViewController;
    -[PhotosMessagesExtensionViewController observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (void)coordinator:(id)a3 didFinishPicking:(id)a4 additionalSelectionState:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t numberOfPreselectedAssets;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  numberOfPreselectedAssets = self->_numberOfPreselectedAssets;
  if (numberOfPreselectedAssets < 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController previouslySelectedObjectIDs](self, "previouslySelectedObjectIDs"));
    if (!objc_msgSend(v13, "count") && !objc_msgSend(v9, "count"))
    {

      -[PhotosMessagesExtensionViewController setPreviouslySelectedObjectIDs:](self, "setPreviouslySelectedObjectIDs:", v9);
      goto LABEL_12;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController previouslySelectedObjectIDs](self, "previouslySelectedObjectIDs"));
    v15 = objc_msgSend(v14, "isEqualToOrderedSet:", v9);

    -[PhotosMessagesExtensionViewController setPreviouslySelectedObjectIDs:](self, "setPreviouslySelectedObjectIDs:", v9);
    if (v15)
      goto LABEL_12;
  }
  else
  {
    v12 = objc_msgSend(v9, "count");
    self->_numberOfPreselectedAssets = 0;
    -[PhotosMessagesExtensionViewController setPreviouslySelectedObjectIDs:](self, "setPreviouslySelectedObjectIDs:", v9);
    if ((id)numberOfPreselectedAssets == v12)
    {
LABEL_12:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController traitCollection](self, "traitCollection"));
      if (objc_msgSend(v23, "userInterfaceIdiom") != (id)1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController traitCollection](self, "traitCollection"));
        if (objc_msgSend(v24, "userInterfaceIdiom") != (id)6)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "window"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "windowScene"));
          v28 = (char *)objc_msgSend(v27, "interfaceOrientation") - 3;

          if ((unint64_t)v28 >= 2)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController pickerCoordinator](self, "pickerCoordinator"));
            objc_msgSend(v29, "resignSearchBarAsFirstResponder");

            -[PhotosMessagesExtensionViewController requestPresentationStyle:](self, "requestPresentationStyle:", 0);
            goto LABEL_17;
          }
          goto LABEL_16;
        }

      }
LABEL_16:
      -[PhotosMessagesExtensionViewController dismiss](self, "dismiss");
      goto LABEL_17;
    }
  }
  v16 = objc_alloc((Class)PHManualFetchResult);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "array"));
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = &__NSArray0__struct;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v21 = objc_msgSend(v16, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v19, v20, PHFetchTypeAsset, 0, 0, 0);

  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100005BF8;
  v30[3] = &unk_10000C9A8;
  v31 = v10;
  objc_copyWeak(&v33, &location);
  v22 = v21;
  v32 = v22;
  -[PhotosMessagesExtensionViewController _confirmPicking:completionHandler:](self, "_confirmPicking:completionHandler:", v22, v30);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

LABEL_17:
}

- (void)viewSafeAreaInsetsDidChange
{
  id v3;
  uint64_t Log;
  NSObject *v5;
  void *v6;
  NSString *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  UIEdgeInsets v12;

  v9.receiver = self;
  v9.super_class = (Class)PhotosMessagesExtensionViewController;
  v3 = -[PhotosMessagesExtensionViewController viewSafeAreaInsetsDidChange](&v9, "viewSafeAreaInsetsDidChange");
  Log = PLAssetExplorerGetLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhotosMessagesExtensionViewController view](self, "view"));
    objc_msgSend(v6, "safeAreaInsets");
    v7 = NSStringFromUIEdgeInsets(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received new safe area insets %{public}@", buf, 0xCu);

  }
}

- (AEPackageTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (PUPickerCoordinator)pickerCoordinator
{
  return self->_pickerCoordinator;
}

- (void)setPickerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pickerCoordinator, a3);
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStatusManager, a3);
}

- (NSMutableDictionary)loadingProgresses
{
  return self->_loadingProgresses;
}

- (void)setLoadingProgresses:(id)a3
{
  objc_storeStrong((id *)&self->_loadingProgresses, a3);
}

- (NSOrderedSet)previouslySelectedObjectIDs
{
  return self->_previouslySelectedObjectIDs;
}

- (void)setPreviouslySelectedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySelectedObjectIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_loadingProgresses, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_pickerCoordinator, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong(&self->_pendingDidPresentBlock, 0);
  objc_storeStrong((id *)&self->_workflowCoordinator, 0);
  objc_storeStrong((id *)&self->_transcriptBubbleViewController, 0);
}

+ (void)initialize
{
  if (qword_1000114C8 != -1)
    dispatch_once(&qword_1000114C8, &stru_10000C430);
}

@end
