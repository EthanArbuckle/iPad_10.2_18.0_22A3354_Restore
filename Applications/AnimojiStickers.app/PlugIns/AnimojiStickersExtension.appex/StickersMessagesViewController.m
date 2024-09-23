@implementation StickersMessagesViewController

- (void)updateWithPresentationContext:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_isFromKeyboard = a3 == 2;
  self->_allowsEditing = a3 != 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    objc_msgSend(v5, "setAllowEditing:", self->_allowsEditing);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)StickersMessagesViewController;
  -[StickersMessagesViewController viewDidLoad](&v9, "viewDidLoad");
  -[StickersMessagesViewController updateWithPresentationContext:](self, "updateWithPresentationContext:", -[StickersMessagesViewController presentationContext](self, "presentationContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIColorRepository appBackgroundColor](AVTUIColorRepository, "appBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[StickersMessagesViewController setShouldShowDisclosureWarning:](self, "setShouldShowDisclosureWarning:", AVTUIStickersShowDisclosureWarning());
  v5 = objc_alloc_init((Class)AVTAvatarStore);
  -[StickersMessagesViewController setAvatarStore:](self, "setAvatarStore:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIControllerPresentation pendingGlobalPresentation](AVTUIControllerPresentation, "pendingGlobalPresentation"));
  if (!v6)
  {
    -[StickersMessagesViewController setupStickerView](self, "setupStickerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v8, "setAlpha:", 0.0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StickersMessagesViewController;
  -[StickersMessagesViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "strongPopupPresentationNotification:", CFSTR("BaseMessagesViewControllerStrongPopupPresentationNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)StickersMessagesViewController;
  -[StickersMessagesViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController usageTrackingSession](self, "usageTrackingSession"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUsageTracker currentSession](AVTUsageTracker, "currentSession"));
    -[StickersMessagesViewController setUsageTrackingSession:](self, "setUsageTrackingSession:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController usageTrackingSession](self, "usageTrackingSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController avatarStore](self, "avatarStore"));
  objc_msgSend(v6, "beginWithStore:", v7);

  -[StickersMessagesViewController addStickerViewToHiearchyIfNeeded](self, "addStickerViewToHiearchyIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StickersMessagesViewController;
  -[StickersMessagesViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("BaseMessagesViewControllerStrongPopupPresentationNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController usageTrackingSession](self, "usageTrackingSession"));
  objc_msgSend(v5, "end");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StickersMessagesViewController;
  -[StickersMessagesViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
  objc_msgSend(v4, "removeFromParentViewController");

}

- (void)addStickerViewToHiearchyIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
  if (v3)
  {
    v11 = (id)v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewController"));
    if (v5)
    {

LABEL_7:
      return;
    }
    v6 = -[StickersMessagesViewController presentationStyle](self, "presentationStyle");

    if (v6 != (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
      -[StickersMessagesViewController addChildViewController:](self, "addChildViewController:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController view](self, "view"));
      objc_msgSend(v9, "bounds");
      objc_msgSend(v11, "setFrame:");

      objc_msgSend(v11, "setAutoresizingMask:", 18);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController view](self, "view"));
      objc_msgSend(v10, "addSubview:", v11);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
      objc_msgSend(v4, "didMoveToParentViewController:", self);
      goto LABEL_7;
    }
  }
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v3;

  if (a3 == 1)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController usageTrackingSession](self, "usageTrackingSession"));
    objc_msgSend(v3, "didShowExpandedMode");

  }
}

- (BOOL)shouldPresentEditorFromKeyboardSplashScreen
{
  void *v3;
  BOOL v4;

  if (!-[StickersMessagesViewController isFromKeyboard](self, "isFromKeyboard")
    || -[StickersMessagesViewController presentationStyle](self, "presentationStyle") != (id)3)
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIControllerPresentation pendingGlobalPresentation](AVTUIControllerPresentation, "pendingGlobalPresentation"));
  v4 = v3 == 0;

  return v4;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;

  v8.receiver = self;
  v8.super_class = (Class)StickersMessagesViewController;
  -[StickersMessagesViewController willBecomeActiveWithConversation:](&v8, "willBecomeActiveWithConversation:", a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[StickersMessagesViewController presentationContext](self, "presentationContext");
    v5 = -[StickersMessagesViewController presentationStyle](self, "presentationStyle");
    *(_DWORD *)buf = 134218240;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[StickersView] willBecomeActiveWithConversation context:%lu style:%lu", buf, 0x16u);
  }
  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:andApp:](STDynamicActivityAttributionPublisher, "setCurrentAttributionKey:andApp:", 0, CFSTR("com.apple.Animoji.StickersApp"));
  -[StickersMessagesViewController updateWithPresentationContext:](self, "updateWithPresentationContext:", -[StickersMessagesViewController presentationContext](self, "presentationContext"));
  if (-[StickersMessagesViewController shouldPresentEditorFromKeyboardSplashScreen](self, "shouldPresentEditorFromKeyboardSplashScreen"))
  {
    -[StickersMessagesViewController showEditorViewControllerFromKeyboardSplashScreen](self, "showEditorViewControllerFromKeyboardSplashScreen");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setAlpha:", 1.0);

  }
}

- (void)setupStickerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController avatarStore](self, "avatarStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVTStickerViewController stickerViewControllerForStore:allowEditing:allowPeel:](AVTStickerViewController, "stickerViewControllerForStore:allowEditing:allowPeel:", v3, -[StickersMessagesViewController allowsEditing](self, "allowsEditing"), 1));
  -[StickersMessagesViewController setStickerController:](self, "setStickerController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
  objc_msgSend(v5, "setDisclosureValidationDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
  objc_msgSend(v6, "setPresenterDelegate:", self);

  -[StickersMessagesViewController addStickerViewToHiearchyIfNeeded](self, "addStickerViewToHiearchyIfNeeded");
}

- (void)showEditorViewControllerFromKeyboardSplashScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    objc_msgSend(v4, "removeFromParentViewController");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v6, "removeFromSuperview");

    -[StickersMessagesViewController setStickerController:](self, "setStickerController:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController avatarStore](self, "avatarStore"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:](AVTAvatarEditorViewController, "viewControllerForCreatingAvatarInStore:", v7));

  objc_msgSend(v13, "setDelegate:", self);
  v8 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v13);
  -[StickersMessagesViewController addChildViewController:](self, "addChildViewController:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(v8, "didMoveToParentViewController:", self);
  -[StickersMessagesViewController setEditorViewController:](self, "setEditorViewController:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController delegate](self, "delegate"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController delegate](self, "delegate"));
    objc_msgSend(v12, "didPresentEditorViewController");

  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006850;
  v12[3] = &unk_10000C450;
  v14 = v7;
  v15 = v9;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "snapshotInBlock:", v12);

}

- (BOOL)shouldAllowUserActionOnSticker:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  v5 = -[StickersMessagesViewController shouldShowDisclosureWarning](self, "shouldShowDisclosureWarning");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVTAlertController alertControllerWithTitle:message:preferredStyle:](AVTAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Animoji Disclosure"), CFSTR("Are you sure every person in this conversation is disclosed on Memoji Stickers?"), 1));
    objc_initWeak(&location, self);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100006B28;
    v16 = &unk_10000C478;
    objc_copyWeak(&v17, &location);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Yes"), 0, &v13));
    objc_msgSend(v6, "addAction:", v7, v13, v14, v15, v16);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("No"), 1, 0));
    objc_msgSend(v6, "addAction:", v8);

    objc_msgSend(v6, "_setShouldAlignToKeyboard:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
    objc_msgSend(v11, "presentViewController:animated:completion:", v6, 0, 0);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v5 ^ 1;
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation setPendingGlobalPresentation:](AVTUIControllerPresentation, "setPendingGlobalPresentation:", a3, a4);
  -[StickersMessagesViewController requestPresentationStyle:](self, "requestPresentationStyle:", 3);
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVTUIControllerPresentation pendingGlobalPresentation](AVTUIControllerPresentation, "pendingGlobalPresentation", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modalMessagesController"));
  objc_msgSend(v4, "dismiss");

  +[AVTUIControllerPresentation setPendingGlobalPresentation:](AVTUIControllerPresentation, "setPendingGlobalPresentation:", 0);
}

- (void)strongPopupPresentationNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BaseMessagesViewControllerStrongPopupPresentedKey")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StickersMessagesViewController stickerController](self, "stickerController"));
    v9 = v8;
    if (v6)
      objc_msgSend(v8, "stickerControllerDidEnterBackground");
    else
      objc_msgSend(v8, "stickerControllerWillEnterForeground");

  }
}

- (AVTAvatarEditorViewController)editorViewController
{
  return (AVTAvatarEditorViewController *)objc_loadWeakRetained((id *)&self->_editorViewController);
}

- (void)setEditorViewController:(id)a3
{
  objc_storeWeak((id *)&self->_editorViewController, a3);
}

- (StickersParentMessagesViewController)delegate
{
  return (StickersParentMessagesViewController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFromKeyboard
{
  return self->_isFromKeyboard;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (AVTStickerViewController)stickerController
{
  return self->_stickerController;
}

- (void)setStickerController:(id)a3
{
  objc_storeStrong((id *)&self->_stickerController, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStore, a3);
}

- (AVTUsageTrackingSession)usageTrackingSession
{
  return self->_usageTrackingSession;
}

- (void)setUsageTrackingSession:(id)a3
{
  objc_storeStrong((id *)&self->_usageTrackingSession, a3);
}

- (BOOL)shouldShowDisclosureWarning
{
  return self->_shouldShowDisclosureWarning;
}

- (void)setShouldShowDisclosureWarning:(BOOL)a3
{
  self->_shouldShowDisclosureWarning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageTrackingSession, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_stickerController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_editorViewController);
}

@end
