@implementation StickersAppCardViewController

+ (BOOL)nextPresentationIsFullscreenModal
{
  return byte_100012590;
}

+ (void)setNextPresentationIsFullscreenModal:(BOOL)a3
{
  byte_100012590 = a3;
}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  IMAAppPresenter *v8;
  IMAAppPresenter *appPresenter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)StickersAppCardViewController;
  v3 = -[StickersAppCardViewController viewDidLoad](&v10, "viewDidLoad");
  v4 = IMStickersExtensionIdentifier(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = IMBalloonExtensionIDWithSuffix();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[IMAAppPresenter loadAppWithIdentifierIfNeeded:](IMAAppPresenter, "loadAppWithIdentifierIfNeeded:", v7);

  v8 = (IMAAppPresenter *)objc_alloc_init((Class)IMAAppPresenter);
  appPresenter = self->_appPresenter;
  self->_appPresenter = v8;

  -[IMAAppPresenter setDelegate:](self->_appPresenter, "setDelegate:", self);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  IMAAppPresenter *appPresenter;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)StickersAppCardViewController;
  v4 = -[StickersAppCardViewController viewDidAppear:](&v17, "viewDidAppear:", a3);
  v5 = IMStickersExtensionIdentifier(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = IMBalloonExtensionIDWithSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (byte_100012590)
  {
    -[IMAAppPresenter presentFullScreenModalAppWithBundleIdentifier:completion:](self->_appPresenter, "presentFullScreenModalAppWithBundleIdentifier:completion:", v8, 0);
    self->_isPresentingStandaloneFullscreenModal = 1;
    byte_100012590 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController traitCollection](self, "traitCollection"));
    v11 = objc_msgSend(v10, "horizontalSizeClass");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 != (id)1 || v11 == (id)1)
    {
      appPresenter = self->_appPresenter;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000030D0;
      v15[3] = &unk_10000C5C8;
      v16 = v9;
      -[IMAAppPresenter presentAppWithBundleIdentifier:completion:](appPresenter, "presentAppWithBundleIdentifier:completion:", v8, v15);

    }
    else
    {
      objc_msgSend(v9, "stickerPickerCardDidLoad");
    }

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)StickersAppCardViewController;
  v7 = a4;
  -[StickersAppCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000318C;
  v8[3] = &unk_10000C5F0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)dismiss
{
  id v2;

  self->_isPresentingStandaloneFullscreenModal = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismissCard");

}

- (void)requestStageSticker:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Class v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 buf;
  Class (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;

  v4 = a3;
  v5 = sub_100006854();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerIdentifier"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Staging sticker with identifier %@", (uint8_t *)&buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representations"));
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
    v11 = v10 == 0;

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSSticker _stickerRepresentationsForImageFileURL:](MSSticker, "_stickerRepresentationsForImageFileURL:", v12));

    }
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerIdentifier"));
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
    v16 = v15;
    if (v15)
    {
      v13 = v15;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));

    }
  }
  v18 = NSClassFromString(CFSTR("_UISticker"));
  if (v18)
  {
    v19 = (void *)objc_opt_new(v18);
    objc_msgSend(v19, "setIdentifier:", v13);
    objc_msgSend(v19, "setRepresentations:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerName"));
    objc_msgSend(v19, "setName:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerEffectType"));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerEffectType"));
      objc_msgSend(v19, "setEffectType:", objc_msgSend(v22, "integerValue"));

    }
    else
    {
      objc_msgSend(v19, "setEffectType:", -1);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "externalURI"));
    objc_msgSend(v19, "setExternalURI:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));
    objc_msgSend(v19, "setAccessibilityLabel:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));
    objc_msgSend(v19, "setMetadata:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ckAttributionInfo"));
    objc_msgSend(v19, "setAttributionInfo:", v28);

    objc_msgSend(v8, "stageSticker:", v19);
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "externalURI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));
    objc_msgSend(v8, "stageStickerWithIdentifier:representations:name:externalURI:accessibilityLabel:", v13, v9, v19, v23, v24);

  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100003678;
  v35[3] = &unk_10000C618;
  v29 = v4;
  v36 = v29;
  v30 = v13;
  v37 = v30;
  v31 = v9;
  v38 = v31;
  objc_msgSend(v8, "remoteHandlesRecentsStickerDonationWithCompletionHandler:", v35);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v32 = (void *)qword_1000125C8;
  v42 = qword_1000125C8;
  if (!qword_1000125C8)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v44 = sub_100004D68;
    v45 = &unk_10000C558;
    v46 = &v39;
    sub_100004D68((uint64_t)&buf);
    v32 = (void *)v40[3];
  }
  v33 = objc_retainAutorelease(v32);
  _Block_object_dispose(&v39, 8);
  if ((objc_opt_respondsToSelector(v33, "trackStickerSentFromHostBundleIdentifier:") & 1) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
    objc_msgSend(v33, "trackStickerSentFromHostBundleIdentifier:", v34);

  }
}

- (void)updateCompactCardHeight:(double)a3
{
  id v5;

  if (self->_compactHeight != a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController appPresenter](self, "appPresenter"));
    objc_msgSend(v5, "setCompactHeight:", a3);
    if (self->_compactHeight < a3)
      objc_msgSend(v5, "updateAppFrameForRotation");
    self->_compactHeight = a3;

  }
}

- (void)animateCardHiddenWithCompletion:(id)a3
{
  -[IMAAppPresenter hideAppViewControllerAnimated:completion:](self->_appPresenter, "hideAppViewControllerAnimated:completion:", 1, a3);
}

- (void)presentPopoverAtWindowLocation:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  IMAAppPresenter *appPresenter;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = IMStickersExtensionIdentifier(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = IMBalloonExtensionIDWithSuffix();
  v15 = (id)objc_claimAutoreleasedReturnValue(v12);

  appPresenter = self->_appPresenter;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController view](self, "view"));
  -[IMAAppPresenter presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:](appPresenter, "presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:", v15, v14, v9, x, y, width, height);

}

- (void)updatePopoverWindowLocation:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  IMAAppPresenter *appPresenter;
  id v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  appPresenter = self->_appPresenter;
  v10 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController view](self, "view"));
  -[IMAAppPresenter updatePopoverWindowLocation:inView:completion:](appPresenter, "updatePopoverWindowLocation:inView:completion:", v11, v10, x, y, width, height);

}

- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  objc_msgSend(v7, "_animatedStickerCreationProgressChanged:progress:", v6, a4);

}

- (void)addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  v9 = (void *)v8;
  if (v8 && (objc_opt_respondsToSelector(v8, "_addStickerToStoreWithRepresentations:completionHandler:") & 1) != 0)
  {
    location = 0;
    objc_initWeak(&location, v9);
    v10 = sub_100006854();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Adding sticker to store with %lu representations", buf, 0xCu);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003D20;
    v16[3] = &unk_10000C640;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    v17 = v7;
    objc_msgSend(v9, "_addStickerToStoreWithRepresentations:completionHandler:", v6, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v13 = sub_100006854();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100006AA8();

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IMAErrorDomain, 1, 0));
    (*((void (**)(id, void *, CGFloat, CGFloat, CGFloat, CGFloat))v7 + 2))(v7, v15, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

  }
}

- (void)addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  v9 = (void *)v8;
  if (v8
    && (objc_opt_respondsToSelector(v8, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:") & 1) != 0)
  {
    location = 0;
    objc_initWeak(&location, v9);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004090;
    v13[3] = &unk_10000C668;
    objc_copyWeak(&v15, &location);
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v9, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:", v6, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v10 = sub_100006854();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100006AA8();

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IMAErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, void *, CGFloat, CGFloat, CGFloat, CGFloat))v7 + 2))(v7, 0, v12, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

  }
}

- (void)addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  v14 = (void *)v13;
  if (v13
    && (objc_opt_respondsToSelector(v13, "_addStickerToStoreWithRepresentations:sourceRect:completion:") & 1) != 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100004338;
    v18[3] = &unk_10000C690;
    v19 = v12;
    objc_msgSend(v14, "_addStickerToStoreWithRepresentations:sourceRect:completion:", v11, v18, x, y, width, height);
    v15 = v19;
LABEL_8:

    goto LABEL_9;
  }
  if (v12)
  {
    v16 = sub_100006854();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100006AA8();

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IMAErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v15);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  if ((objc_opt_respondsToSelector(v13, "_addStickerToStoreWithUISticker:sourceRect:completion:") & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100004510;
    v17[3] = &unk_10000C690;
    v18 = v12;
    objc_msgSend(v13, "_addStickerToStoreWithUISticker:sourceRect:completion:", v11, v17, x, y, width, height);
    v14 = v18;
LABEL_7:

    goto LABEL_8;
  }
  if (v12)
  {
    v15 = sub_100006854();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100006AA8();

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IMAErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v14);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)addStickerAnimationDidFinishWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  v4 = objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  v5 = (void *)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "_addStickerAnimationDidFinishWithCompletion:") & 1) != 0)
    objc_msgSend(v5, "_addStickerAnimationDidFinishWithCompletion:", v6);
  else
    v6[2]();

}

- (void)didRemoveStickerPreview
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(-[StickersAppCardViewController stickersHostViewController](self, "stickersHostViewController"));
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector(v2, "_didRemoveStickerPreview");
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "_didRemoveStickerPreview");
      v3 = v5;
    }
  }

}

- (void)addSticker:(id)a3
{
  -[StickersAppCardViewController requestStageSticker:](self, "requestStageSticker:", a3);
}

- (void)addSticker:(id)a3 atDropTarget:(id)a4
{
  -[StickersAppCardViewController requestStageSticker:](self, "requestStageSticker:", a3, a4);
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  if (a3)
    -[ImmediatePanGestureRecognizer setEnabled:](self->_dismissalGestureTracker, "setEnabled:", 1);
  else
    -[StickersAppCardViewController dismiss](self, "dismiss");
}

- (void)overrideDropPointWithCompletion:(id)a3
{
  (*((void (**)(id, CGFloat, CGFloat))a3 + 2))(a3, CGPointZero.x, CGPointZero.y);
}

- (void)appPresenterDidDismissFullscreenModal:(id)a3
{
  if (self->_isPresentingStandaloneFullscreenModal)
    -[StickersAppCardViewController dismiss](self, "dismiss", a3);
}

- (void)appPresenterCardDidDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)qword_1000125D8;
  v12 = qword_1000125D8;
  if (!qword_1000125D8)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004E5C;
    v8[3] = &unk_10000C558;
    v8[4] = &v9;
    sub_100004E5C((uint64_t)v8);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharedInstance"));
  if ((objc_msgSend(v7, "stickerDragActiveInCurrentProcess") & 1) == 0)
    -[StickersAppCardViewController dismiss](self, "dismiss");

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  if (qword_1000125A0 != -1)
    dispatch_once(&qword_1000125A0, &stru_10000C6B0);
  return (id)qword_100012598;
}

+ (id)_exportedInterface
{
  if (qword_1000125B0 != -1)
    dispatch_once(&qword_1000125B0, &stru_10000C6D0);
  return (id)qword_1000125A8;
}

- (id)stickersHostViewController
{
  int v3;
  IMAAppPresenter *appPresenter;
  id v5;
  void *v6;

  v3 = IMIsStickersStripInCling(self, a2);
  appPresenter = self->_appPresenter;
  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[IMAAppPresenter currentStickerViewController](appPresenter, "currentStickerViewController"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMAAppPresenter currentAppViewController](appPresenter, "currentAppViewController"));
    if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___IMAStickerViewController))
      v5 = v6;
    else
      v5 = 0;

  }
  return v5;
}

- (IMAAppPresenter)appPresenter
{
  return self->_appPresenter;
}

- (void)setAppPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_appPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPresenter, 0);
  objc_storeStrong((id *)&self->_dismissalView, 0);
  objc_storeStrong((id *)&self->_dismissalGestureTracker, 0);
}

@end
