@implementation HUNCCameraPlayerPlaceholderContentViewController

- (HUNCCameraPlayerPlaceholderContentViewController)initWithImageURL:(id)a3
{
  id v5;
  HUNCCameraPlayerPlaceholderContentViewController *v6;
  HUNCCameraPlayerPlaceholderContentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUNCCameraPlayerPlaceholderContentViewController;
  v6 = -[HUNCCameraPlayerPlaceholderContentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageURL, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HUNCCameraPlayerPlaceholderContentViewController;
  -[HUNCCameraPlayerPlaceholderContentViewController viewDidLoad](&v15, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerPlaceholderContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUNCCameraPlayerPlaceholderContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  -[HUNCCameraPlayerPlaceholderContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerPlaceholderContentViewController placeholderImageView](self, "placeholderImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[HUNCCameraPlayerPlaceholderContentViewController notificationImage](self, "notificationImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNCCameraPlayerPlaceholderContentViewController imageURL](self, "imageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Displaying placeholder image using URL:%@", buf, 0xCu);

    }
    -[HUNCCameraPlayerPlaceholderContentViewController updatePlaceholderImage:](self, "updatePlaceholderImage:", v8);
  }
  v11 = (void *)MEMORY[0x1E0CB3718];
  -[HUNCCameraPlayerPlaceholderContentViewController placeholderImageView](self, "placeholderImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerPlaceholderContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v14);

}

- (void)updatePlaceholderImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUNCCameraPlayerPlaceholderContentViewController placeholderImageView](self, "placeholderImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImageView)placeholderImageView
{
  UIImageView *placeholderImageView;
  UIImageView *v4;
  UIImageView *v5;
  UIImageView *v6;

  placeholderImageView = self->_placeholderImageView;
  if (!placeholderImageView)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", 0);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_placeholderImageView;
    self->_placeholderImageView = v4;
    v6 = v4;

    -[UIImageView setContentMode:](self->_placeholderImageView, "setContentMode:", 2);
    placeholderImageView = self->_placeholderImageView;
  }
  return placeholderImageView;
}

- (UIImage)notificationImage
{
  UIImage *notificationImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  UIImage *v10;

  notificationImage = self->_notificationImage;
  if (!notificationImage)
  {
    -[HUNCCameraPlayerPlaceholderContentViewController imageURL](self, "imageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAccessingSecurityScopedResource");

    v5 = (void *)MEMORY[0x1E0C99D50];
    -[HUNCCameraPlayerPlaceholderContentViewController imageURL](self, "imageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v7);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerPlaceholderContentViewController imageURL](self, "imageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAccessingSecurityScopedResource");

    v10 = self->_notificationImage;
    self->_notificationImage = v8;

    notificationImage = self->_notificationImage;
  }
  return notificationImage;
}

- (BOOL)shouldShowPlaceholderContent
{
  return self->_shouldShowPlaceholderContent;
}

- (void)setShouldShowPlaceholderContent:(BOOL)a3
{
  self->_shouldShowPlaceholderContent = a3;
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (void)setNotificationImage:(id)a3
{
  objc_storeStrong((id *)&self->_notificationImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationImage, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
}

@end
