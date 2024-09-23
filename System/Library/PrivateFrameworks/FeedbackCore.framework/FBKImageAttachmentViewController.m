@implementation FBKImageAttachmentViewController

+ (BOOL)canDisplayURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(&unk_24E18D658, "containsObject:", v4);
  return (char)v3;
}

- (void)setImageUrl:(id)a3
{
  -[FBKImageAttachmentViewController setImageURL:](self, "setImageURL:", a3);
  -[FBKImageAttachmentViewController loadImage](self, "loadImage");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FBKImageAttachmentViewController;
  -[FBKImageAttachmentViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[FBKImageAttachmentViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);

  -[FBKImageAttachmentViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsHorizontalScrollIndicator:", 0);

  -[FBKImageAttachmentViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysBounceVertical:", 1);

  -[FBKImageAttachmentViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlwaysBounceHorizontal:", 1);

  -[FBKImageAttachmentViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumZoomScale:", 1.0);

  -[FBKImageAttachmentViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaximumZoomScale:", 6.0);

  -[FBKImageAttachmentViewController imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 1);

  -[FBKImageAttachmentViewController imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMultipleTouchEnabled:", 1);

  -[FBKImageAttachmentViewController imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKImageAttachmentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[FBKImageAttachmentViewController loadImage](self, "loadImage");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBKImageAttachmentViewController;
  -[FBKImageAttachmentViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBKImageAttachmentViewController;
  -[FBKImageAttachmentViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)loadImage
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "imageView and/or imageURL nil", v1, 2u);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (NSURL)imageURL
{
  return (NSURL *)objc_getProperty(self, a2, 984, 1);
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
