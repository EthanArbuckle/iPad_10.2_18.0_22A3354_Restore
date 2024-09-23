@implementation ICTableClipView

- (ICTableClipView)initWithFrame:(CGRect)a3
{
  ICTableClipView *v3;
  ICTableClipView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTableClipView;
  v3 = -[ICTableClipView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ICTableClipView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

  }
  return v4;
}

@end
