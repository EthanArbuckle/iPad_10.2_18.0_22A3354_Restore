@implementation iFBAAnnouncementViewController

- (iFBAAnnouncementViewController)initWithCoder:(id)a3
{
  iFBAAnnouncementViewController *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)iFBAAnnouncementViewController;
  v3 = -[iFBAAnnouncementViewController initWithCoder:](&v14, "initWithCoder:", a3);
  if (v3)
  {
    v4 = objc_alloc_init((Class)WKWebViewConfiguration);
    objc_msgSend(v4, "setSelectionGranularity:", 1);
    objc_msgSend(v4, "_setColorFilterEnabled:", 1);
    v5 = objc_msgSend(objc_alloc((Class)WKWebView), "initWithFrame:configuration:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[iFBAAnnouncementViewController setWebView:](v3, "setWebView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](v3, "webView"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](v3, "webView"));
    objc_msgSend(v7, "setNavigationDelegate:", v3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](v3, "webView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](v3, "webView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scrollView"));
    objc_msgSend(v12, "setBackgroundColor:", v10);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)iFBAAnnouncementViewController;
  -[iFBAAnnouncementViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
  objc_msgSend(v6, "addSubview:", v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "preferredContentSizeCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));

  if (v4 != v6)
    -[iFBAAnnouncementViewController updateWebView](self, "updateWebView");
}

- (void)setContentItem:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD *v11;
  _QWORD v12[5];

  v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032380;
  v12[3] = &unk_1000E61B8;
  v12[4] = self;
  v6 = objc_retainBlock(v12);
  objc_storeStrong((id *)&self->_contentItem, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController contentItem](self, "contentItem"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController contentItem](self, "contentItem"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000323A8;
    v10[3] = &unk_1000E7420;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v8, "refreshAnnouncementFromContentItem:completion:", v9, v10);

  }
  else
  {
    ((void (*)(_QWORD *))v6[2])(v6);
  }

}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setTitle:", v4);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setTitle:", &stru_1000EA660);
  }

}

- (void)updateWebView
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;

  v3 = objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement")),
        v6 = objc_msgSend(v5, "isStub"),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fullHTMLContent"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fullHTMLContent"));

    }
    else
    {
      v15 = &stru_1000EA660;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants appleSeedURL](iFBAConstants, "appleSeedURL"));
    v14 = objc_msgSend(v8, "loadHTMLString:baseURL:", v15, v13);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("about://blank")));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v7));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
    v9 = objc_msgSend(v8, "loadRequest:", v15);
  }

}

- (void)markAnnouncementRead
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v3 = objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));
  if (v3)
  {
    v9 = (id)v3;
    v4 = objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController contentItem](self, "contentItem"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController contentItem](self, "contentItem"));
      v7 = objc_msgSend(v6, "unread");

      if (!v7)
        return;
      v9 = (id)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController announcement](self, "announcement"));
      objc_msgSend(v9, "markAnnouncementRead:completion:", v8, 0);

    }
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
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
  id v21;

  v21 = (id)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController view](self, "view", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  objc_msgSend(v16, "setActive:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAAnnouncementViewController webView](self, "webView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
  objc_msgSend(v20, "setActive:", 1);

}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  -[iFBAAnnouncementViewController markAnnouncementRead](self, "markAnnouncementRead", a3, a4);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  _QWORD *v6;
  id v7;
  void (*v8)(_QWORD *, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = a5;
  v7 = objc_msgSend(v12, "navigationType");
  v8 = (void (*)(_QWORD *, uint64_t))v6[2];
  if (v7 == (id)-1)
  {
    v8(v6, 1);
  }
  else
  {
    v8(v6, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "request"));
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = v10;
    if (v6 && objc_msgSend(v10, "canOpenURL:", v6))
      objc_msgSend(v11, "openURL:options:completionHandler:", v6, &__NSDictionary0__struct, 0);

  }
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (FBKAnnouncement)announcement
{
  return self->_announcement;
}

- (void)setAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_announcement, a3);
}

- (WKWebView)webView
{
  return (WKWebView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWebView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_announcement, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
