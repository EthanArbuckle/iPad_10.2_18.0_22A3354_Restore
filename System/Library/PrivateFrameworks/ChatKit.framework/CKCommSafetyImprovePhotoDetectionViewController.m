@implementation CKCommSafetyImprovePhotoDetectionViewController

- (CKCommSafetyImprovePhotoDetectionViewController)initWithChatItem:(id)a3
{
  id v4;
  CKCommSafetyImprovePhotoDetectionViewController *v5;
  CKCommSafetyImprovePhotoDetectionViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[CKCommSafetyImprovePhotoDetectionViewController init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[CKCommSafetyImprovePhotoDetectionViewController configureImageFromChatItem:](v5, "configureImageFromChatItem:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7);
    -[CKCommSafetyImprovePhotoDetectionViewController setImageView:](v6, "setImageView:", v8);

    -[CKCommSafetyImprovePhotoDetectionViewController imageView](v6, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCommSafetyImprovePhotoDetectionViewController view](v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__ck_makeEdgesEqualTo:", v10);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKCommSafetyImprovePhotoDetectionViewController;
  -[CKCommSafetyImprovePhotoDetectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CKCommSafetyImprovePhotoDetectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_imageView);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKCommSafetyImprovePhotoDetectionViewController;
  -[CKCommSafetyImprovePhotoDetectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CKCommSafetyImprovePhotoDetectionViewController layoutImageView](self, "layoutImageView");
}

- (id)configureImageFromChatItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D35820];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "transferForGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithContentsOfFile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)layoutImageView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[CKCommSafetyImprovePhotoDetectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[UIImageView bounds](self->_imageView, "bounds");
  v7 = v5 / v6;

  -[CKCommSafetyImprovePhotoDetectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[UIImageView bounds](self->_imageView, "bounds");
  v12 = v10 / v11;

  if (v7 >= v12)
    v7 = v12;
  -[UIImageView bounds](self->_imageView, "bounds");
  v14 = v7 * v13;
  -[UIImageView bounds](self->_imageView, "bounds");
  v16 = v7 * v15;
  -[CKCommSafetyImprovePhotoDetectionViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  -[CKCommSafetyImprovePhotoDetectionViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;

  -[CKCommSafetyImprovePhotoDetectionViewController imageView](self, "imageView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v19, v22, v14, v16);

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
}

@end
