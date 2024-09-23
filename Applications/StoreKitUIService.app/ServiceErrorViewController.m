@implementation ServiceErrorViewController

- (ServiceErrorViewController)initWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 actionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ServiceErrorViewController *v14;
  id v15;
  id actionBlock;
  _UIContentUnavailableView *v17;
  _UIContentUnavailableView *errorView;
  NSBundle *v19;
  void *v20;
  void *v21;
  NSBundle *v22;
  void *v23;
  void *v24;
  _UIContentUnavailableView *v25;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)ServiceErrorViewController;
  v14 = -[ServiceErrorViewController initWithNibName:bundle:](&v29, "initWithNibName:bundle:", 0, 0);
  if (v14)
  {
    v15 = objc_retainBlock(v13);
    actionBlock = v14->_actionBlock;
    v14->_actionBlock = v15;

    v17 = (_UIContentUnavailableView *)objc_msgSend(objc_alloc((Class)_UIContentUnavailableView), "initWithFrame:title:style:", &stru_10004A1F0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    errorView = v14->_errorView;
    v14->_errorView = v17;

    if (v10)
    {
      -[_UIContentUnavailableView setTitle:](v14->_errorView, "setTitle:", v10);
    }
    else
    {
      v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIURL));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANNOT_CONNECT_TO_ITUNES_STORE"), &stru_10004A1F0, 0));
      -[_UIContentUnavailableView setTitle:](v14->_errorView, "setTitle:", v21);

    }
    -[_UIContentUnavailableView setMessage:](v14->_errorView, "setMessage:", v11);
    if (v13)
    {
      if (v12)
      {
        -[_UIContentUnavailableView setButtonTitle:](v14->_errorView, "setButtonTitle:", v12);
      }
      else
      {
        v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIURL));
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"), &stru_10004A1F0, 0));
        -[_UIContentUnavailableView setButtonTitle:](v14->_errorView, "setButtonTitle:", v24);

      }
      v25 = v14->_errorView;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100007308;
      v27[3] = &unk_100048FF8;
      v28 = v13;
      -[_UIContentUnavailableView setButtonAction:](v25, "setButtonAction:", v27);

    }
  }

  return v14;
}

- (ServiceErrorViewController)initWithActionBlock:(id)a3
{
  return -[ServiceErrorViewController initWithTitle:message:buttonTitle:actionBlock:](self, "initWithTitle:message:buttonTitle:actionBlock:", 0, 0, 0, a3);
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceErrorViewController;
  -[ServiceErrorViewController loadView](&v5, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  objc_msgSend(v3, "addSubview:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ServiceErrorViewController;
  -[ServiceErrorViewController viewWillLayoutSubviews](&v13, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (NSString)buttonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonTitle"));

  return (NSString *)v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "message"));

  return (NSString *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (void)setButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  objc_msgSend(v5, "setButtonTitle:", v4);

}

- (void)setMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  objc_msgSend(v5, "setMessage:", v4);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceErrorViewController errorView](self, "errorView"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_UIContentUnavailableView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
