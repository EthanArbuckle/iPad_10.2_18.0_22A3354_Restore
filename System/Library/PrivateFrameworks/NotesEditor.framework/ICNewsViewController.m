@implementation ICNewsViewController

- (ICNewsViewController)initWithURL:(id)a3
{
  id v4;
  ICNewsViewController *v5;
  ICNewsViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNewsViewController;
  v5 = -[ICNewsViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICNewsViewController setUrl:](v5, "setUrl:", v4);

  return v6;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ICNewsViewController;
  -[ICNewsViewController viewDidLoad](&v22, sel_viewDidLoad);
  v3 = objc_alloc(getNSSNewsViewControllerClass());
  -[ICNewsViewController url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);
  -[ICNewsViewController setNewsViewController:](self, "setNewsViewController:", v5);

  -[ICNewsViewController newsViewController](self, "newsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLinkPreviewing:", 1);

  -[ICNewsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[ICNewsViewController newsViewController](self, "newsViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

  -[ICNewsViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNewsViewController newsViewController](self, "newsViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v20);

  -[ICNewsViewController newsViewController](self, "newsViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNewsViewController addChildViewController:](self, "addChildViewController:", v21);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSSNewsViewController)newsViewController
{
  return self->_newsViewController;
}

- (void)setNewsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_newsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsViewController, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
