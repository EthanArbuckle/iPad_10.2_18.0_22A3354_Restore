@implementation ICDocCamThumbnailDecorationView

- (ICDocCamThumbnailDecorationView)initWithFrame:(CGRect)a3
{
  ICDocCamThumbnailDecorationView *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICDocCamThumbnailDecorationView;
  v3 = -[ICDocCamThumbnailDecorationView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[ICDocCamThumbnailDecorationView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowColor:", v5);

    -[ICDocCamThumbnailDecorationView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowRadius:", 1.0);

    -[ICDocCamThumbnailDecorationView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowOffset:", 0.0, 0.0);

    -[ICDocCamThumbnailDecorationView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1045220557;
    objc_msgSend(v9, "setShadowOpacity:", v10);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamThumbnailDecorationView setBackgroundColor:](v3, "setBackgroundColor:", v11);

  }
  return v3;
}

@end
