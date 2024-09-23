@implementation InlineRecentsViewController

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  void **v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v12.receiver = self;
  v12.super_class = (Class)InlineRecentsViewController;
  -[InlineRecentsViewController viewDidLoad](&v12, "viewDidLoad");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)qword_100012638;
  v21 = qword_100012638;
  if (!qword_100012638)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000066AC;
    v16 = &unk_10000C558;
    v17 = &v18;
    sub_1000066AC((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  if ((objc_opt_respondsToSelector(v4, "stickerRecentsController") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerRecentsController"));
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v6 = (void *)qword_100012648;
    v21 = qword_100012648;
    if (!qword_100012648)
    {
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1000067AC;
      v16 = &unk_10000C558;
      v17 = &v18;
      sub_1000067AC((uint64_t)&v13);
      v6 = (void *)v19[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v18, 8);
    v8 = objc_alloc_init(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stickerRecentsControllerForStore:", v8));

  }
  objc_msgSend(v5, "setDelegate:", self);
  -[InlineRecentsViewController addChildViewController:](self, "addChildViewController:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v9, "setAutoresizingMask:", 18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", v9);

  objc_msgSend(v5, "didMoveToParentViewController:", self);
}

- (void)stickerRecentsControllerDidRequestMemojiEditor:(id)a3
{
  id v4;

  +[AppCardViewController setNextPresentationIsFullscreenModal:](AppCardViewController, "setNextPresentationIsFullscreenModal:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "presentCard");

}

- (void)stickerRecentsControllerDidTapAppButton:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  objc_msgSend(v3, "presentCard");

}

- (void)stickerRecentsController:(id)a3 didTapSticker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageFileURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  if ((objc_opt_respondsToSelector(v11, "stageStickerWithFileHandle:url:accessibilityLabel:") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageFileURL"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_10000C888;
    v16 = v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_10000C888;
    v20 = v19;

    objc_msgSend(v11, "stageStickerWithFileHandle:url:accessibilityLabel:", v10, v16, v20);
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v21 = (void *)qword_100012650;
  v28 = qword_100012650;
  if (!qword_100012650)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100006800;
    v24[3] = &unk_10000C558;
    v24[4] = &v25;
    sub_100006800((uint64_t)v24);
    v21 = (void *)v26[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v25, 8);
  if ((objc_opt_respondsToSelector(v22, "trackStickerSentFromHostBundleIdentifier:") & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
    objc_msgSend(v22, "trackStickerSentFromHostBundleIdentifier:", v23);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InlineRecentsViewController;
  -[InlineRecentsViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentsViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "dismissCard");

}

+ (id)_remoteViewControllerInterface
{
  if (qword_100012620 != -1)
    dispatch_once(&qword_100012620, &stru_10000C7F0);
  return (id)qword_100012618;
}

+ (id)_exportedInterface
{
  if (qword_100012630 != -1)
    dispatch_once(&qword_100012630, &stru_10000C810);
  return (id)qword_100012628;
}

@end
