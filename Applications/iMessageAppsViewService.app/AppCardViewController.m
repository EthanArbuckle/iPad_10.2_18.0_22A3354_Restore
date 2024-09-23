@implementation AppCardViewController

+ (BOOL)nextPresentationIsFullscreenModal
{
  return byte_1000125E0;
}

+ (void)setNextPresentationIsFullscreenModal:(BOOL)a3
{
  byte_1000125E0 = a3;
}

- (AppCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AppCardViewController *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AppCardViewController;
  v4 = -[AppCardViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("LoadAlliMessageApps"));

    if ((v6 & 1) == 0)
      +[IMAAppPresenter disableAutomaticAppDiscovery](IMAAppPresenter, "disableAutomaticAppDiscovery");
  }
  return v4;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  IMAAppPresenter *v5;
  IMAAppPresenter *appPresenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AppCardViewController;
  -[AppCardViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierAnimojiStickers);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[IMAAppPresenter loadAppWithIdentifierIfNeeded:](IMAAppPresenter, "loadAppWithIdentifierIfNeeded:", v4);

  v5 = (IMAAppPresenter *)objc_alloc_init((Class)IMAAppPresenter);
  appPresenter = self->_appPresenter;
  self->_appPresenter = v5;

  -[IMAAppPresenter setDelegate:](self->_appPresenter, "setDelegate:", self);
  -[AppCardViewController compactHeight](self, "compactHeight");
  -[IMAAppPresenter setCompactHeight:](self->_appPresenter, "setCompactHeight:");
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  IMAAppPresenter *appPresenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AppCardViewController;
  -[AppCardViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierAnimojiStickers);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  appPresenter = self->_appPresenter;
  if (byte_1000125E0)
  {
    -[IMAAppPresenter presentFullScreenModalAppWithBundleIdentifier:completion:](appPresenter, "presentFullScreenModalAppWithBundleIdentifier:completion:", v5, 0);
    self->_isPresentingStandaloneFullscreenModal = 1;
    byte_1000125E0 = 0;
  }
  else
  {
    -[IMAAppPresenter presentAppWithBundleIdentifier:completion:](appPresenter, "presentAppWithBundleIdentifier:completion:", v5, 0);
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
  v9.super_class = (Class)AppCardViewController;
  v7 = a4;
  -[AppCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005994;
  v8[3] = &unk_10000C5F0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)dismiss
{
  id v2;

  self->_isPresentingStandaloneFullscreenModal = 0;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismissCard");

}

- (double)compactHeight
{
  double result;

  result = self->_compactHeight;
  if (result <= 0.0)
    return 335.0;
  return result;
}

- (void)requestPasteSticker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "pasteImageAtFileHandle:", v7);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v9 = (void *)qword_100012608;
  v16 = qword_100012608;
  if (!qword_100012608)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005F5C;
    v12[3] = &unk_10000C558;
    v12[4] = &v13;
    sub_100005F5C((uint64_t)v12);
    v9 = (void *)v14[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v13, 8);
  if ((objc_opt_respondsToSelector(v10, "trackStickerSentFromHostBundleIdentifier:") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppCardViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
    objc_msgSend(v10, "trackStickerSentFromHostBundleIdentifier:", v11);

  }
}

- (void)updateCompactCardHeight:(double)a3
{
  id v5;

  if (self->_compactHeight != a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[AppCardViewController appPresenter](self, "appPresenter"));
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

- (void)addSticker:(id)a3
{
  -[AppCardViewController requestPasteSticker:](self, "requestPasteSticker:", a3);
}

- (void)addSticker:(id)a3 atDropTarget:(id)a4
{
  -[AppCardViewController requestPasteSticker:](self, "requestPasteSticker:", a3, a4);
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  if (a3)
    -[ImmediatePanGestureRecognizer setEnabled:](self->_dismissalGestureTracker, "setEnabled:", 1);
  else
    -[AppCardViewController dismiss](self, "dismiss");
}

- (void)didDragStickerToTarget:(id)a3 outsideSwitcher:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v8 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    if ((objc_opt_respondsToSelector(v7, "draggedStickerToPoint:") & 1) != 0)
    {
      objc_msgSend(v8, "screenCoordinate");
      objc_msgSend(v7, "draggedStickerToPoint:");
    }

    v6 = v8;
  }

}

- (void)overrideDropPointWithCompletion:(id)a3
{
  void (**v4)(_QWORD, double, double);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD, double, double);

  v4 = (void (**)(_QWORD, double, double))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCardViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  if ((objc_opt_respondsToSelector(v5, "requestInsertionPointCompletion:") & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005D70;
    v6[3] = &unk_10000C778;
    v7 = v4;
    objc_msgSend(v5, "requestInsertionPointCompletion:", v6);

  }
  else
  {
    v4[2](v4, CGPointZero.x, CGPointZero.y);
  }

}

- (void)appPresenterDidDismissFullscreenModal:(id)a3
{
  if (self->_isPresentingStandaloneFullscreenModal)
    -[AppCardViewController dismiss](self, "dismiss", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  if (qword_1000125F0 != -1)
    dispatch_once(&qword_1000125F0, &stru_10000C798);
  return (id)qword_1000125E8;
}

+ (id)_exportedInterface
{
  if (qword_100012600 != -1)
    dispatch_once(&qword_100012600, &stru_10000C7B8);
  return (id)qword_1000125F8;
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
