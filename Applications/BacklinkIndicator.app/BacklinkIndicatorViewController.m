@implementation BacklinkIndicatorViewController

- (BacklinkIndicatorViewController)init
{
  BacklinkIndicatorViewController *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NPNotePreviewProvider *previewProvider;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)BacklinkIndicatorViewController;
  v2 = -[BacklinkIndicatorViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)qword_10000E688;
    v13 = qword_10000E688;
    if (!qword_10000E688)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100003B18;
      v9[3] = &unk_100008328;
      v9[4] = &v10;
      sub_100003B18((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shared"));
    previewProvider = v2->_previewProvider;
    v2->_previewProvider = (NPNotePreviewProvider *)v5;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v29;
  objc_super v30;
  _QWORD v31[4];

  v30.receiver = self;
  v30.super_class = (Class)BacklinkIndicatorViewController;
  -[BacklinkIndicatorViewController viewDidLoad](&v30, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc_init((Class)UIImageView);
  -[BacklinkIndicatorViewController setImageView:](self, "setImageView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
  objc_msgSend(v7, "addSubview:", v8);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v31[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v31[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v10));
  v31[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v31[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  -[BacklinkIndicatorViewController _updateUI](self, "_updateUI");
}

- (void)setUserActivity:(id)a3
{
  NSUserActivity *v5;
  NSUserActivity *v6;

  v5 = (NSUserActivity *)a3;
  if (self->_userActivity != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userActivity, a3);
    -[BacklinkIndicatorViewController _updateUI](self, "_updateUI");
    v5 = v6;
  }

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 buf;
  uint64_t v21;
  uint64_t v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController viewIfLoaded](self, "viewIfLoaded"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController userActivity](self, "userActivity"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController previewProvider](self, "previewProvider"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController userActivity](self, "userActivity"));
      v19 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previewForUserActivity:error:", v6, &v19));
      v8 = v19;

      if (v8)
      {
        v9 = sub_100002020();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100003E0C(self, (uint64_t)v8, v10);

      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v21 = 0x2020000000;
      v11 = (_QWORD *)qword_10000E698;
      v22 = qword_10000E698;
      if (!qword_10000E698)
      {
        v12 = (void *)sub_100003B6C();
        v11 = dlsym(v12, "NPNotePreviewKeyPreview");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
        qword_10000E698 = (uint64_t)v11;
      }
      _Block_object_dispose(&buf, 8);
      if (!v11)
        sub_100003D98();
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *v11));
      if (!v13)
      {
        v14 = sub_100002020();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController userActivity](self, "userActivity"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_syLoggableDescription"));
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "found no preview for user activity: %@", (uint8_t *)&buf, 0xCu);

        }
      }

    }
    else
    {
      v13 = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController imageView](self, "imageView"));
    objc_msgSend(v18, "setImage:", v13);

  }
}

- (void)actionButtonTapped
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController delegate](self, "delegate"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController delegate](self, "delegate"));
    objc_msgSend(v4, "backlinkIndicatorViewControllerDidReceiveTap:", self);

  }
}

- (void)willAnimatePictureInPictureStop
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController delegate](self, "delegate"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BacklinkIndicatorViewController delegate](self, "delegate"));
    objc_msgSend(v4, "backlinkIndicatorViewControllerWillDismiss:", self);

  }
}

- (BacklinkIndicatorViewControllerDelegate)delegate
{
  return (BacklinkIndicatorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NPNotePreviewProvider)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_previewProvider, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
