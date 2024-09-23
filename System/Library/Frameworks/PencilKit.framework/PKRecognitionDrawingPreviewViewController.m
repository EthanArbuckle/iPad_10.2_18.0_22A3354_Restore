@implementation PKRecognitionDrawingPreviewViewController

- (PKRecognitionDrawingPreviewViewController)initWithDrawingImage:(id)a3
{
  UIImage *v4;
  PKRecognitionDrawingPreviewViewController *v5;
  UIImage *drawingImage;
  objc_super v8;

  v4 = (UIImage *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKRecognitionDrawingPreviewViewController;
  v5 = -[PKRecognitionDrawingPreviewViewController init](&v8, sel_init);
  drawingImage = v5->_drawingImage;
  v5->_drawingImage = v4;

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKRecognitionDrawingPreviewViewController;
  -[PKRecognitionDrawingPreviewViewController viewDidLoad](&v21, sel_viewDidLoad);
  _PencilKitBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Drawing Preview"), CFSTR("Drawing Preview"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDrawingPreviewViewController setTitle:](self, "setTitle:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDrawingPreviewViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PKRecognitionDrawingPreviewViewController setScrollView:](self, "setScrollView:", v8);

  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumZoomScale:", 0.25);

  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaximumZoomScale:", 3.0);

  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[PKRecognitionDrawingPreviewViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[PKRecognitionDrawingPreviewViewController drawingImage](self, "drawingImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithImage:", v15);
  -[PKRecognitionDrawingPreviewViewController setImageView:](self, "setImageView:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDrawingPreviewViewController imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionDrawingPreviewViewController imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

}

- (void)viewDidLayoutSubviews
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
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double Width;
  void *v35;
  double v36;
  void *v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[PKRecognitionDrawingPreviewViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PKRecognitionDrawingPreviewViewController view](self, "view");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "safeAreaInsets");
  v14 = v5 + v13;
  v16 = v7 + v15;
  v18 = v9 - (v13 + v17);
  v20 = v11 - (v15 + v19);

  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v41.origin.x = v22;
  v41.origin.y = v23;
  v41.size.width = v24;
  v41.size.height = v25;
  v38.origin.x = v14;
  v38.origin.y = v16;
  v38.size.width = v18;
  v38.size.height = v20;
  LOBYTE(v12) = CGRectEqualToRect(v38, v41);

  if ((v12 & 1) == 0)
  {
    -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v14, v16, v18, v20);

    -[PKRecognitionDrawingPreviewViewController imageView](self, "imageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28;
    v31 = v30;
    -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setContentSize:", v29, v31);

    -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    Width = CGRectGetWidth(v39);
    -[PKRecognitionDrawingPreviewViewController imageView](self, "imageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v36 = Width / CGRectGetWidth(v40);
    -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setZoomScale:", v36);

    -[PKRecognitionDrawingPreviewViewController centerImageView](self, "centerImageView");
  }
}

- (void)centerImageView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = (v5 - v7) * 0.5;

  v9 = 0.0;
  if (v8 >= 0.0)
    v10 = v8;
  else
    v10 = 0.0;
  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentSize");
  v16 = (v13 - v15) * 0.5;

  if (v16 >= 0.0)
    v9 = v16;
  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contentSize");
  v18 = v10 + v17 * 0.5;
  -[PKRecognitionDrawingPreviewViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentSize");
  v21 = v9 + v20 * 0.5;
  -[PKRecognitionDrawingPreviewViewController imageView](self, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v18, v21);

}

- (UIImage)drawingImage
{
  return self->_drawingImage;
}

- (void)setDrawingImage:(id)a3
{
  objc_storeStrong((id *)&self->_drawingImage, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
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
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_drawingImage, 0);
}

@end
