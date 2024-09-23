@implementation ICDocCamPageContentViewController

+ (double)leadingTrailingOffset:(int64_t)a3
{
  return 0.0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICDocCamPageContentViewController;
  -[ICDocCamPageContentViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[ICDocCamPageContentViewController image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamPageContentViewController imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleSingleTap_);
  objc_msgSend(v5, "setNumberOfTapsRequired:", 1);
  -[ICDocCamPageContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

- (void)handleSingleTap:(id)a3
{
  id v4;

  -[ICDocCamPageContentViewController tapDelegate](self, "tapDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageContentViewDidTap:", -[ICDocCamPageContentViewController pageIndex](self, "pageIndex"));

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICDocCamPageContentViewController;
  -[ICDocCamPageContentViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (ICDocCamPageContentViewTapDelegate)tapDelegate
{
  return (ICDocCamPageContentViewTapDelegate *)objc_loadWeakRetained((id *)&self->_tapDelegate);
}

- (void)setTapDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tapDelegate, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_tapDelegate);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
