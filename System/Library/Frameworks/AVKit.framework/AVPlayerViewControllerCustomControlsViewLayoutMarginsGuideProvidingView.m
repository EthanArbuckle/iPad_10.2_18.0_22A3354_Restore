@implementation AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView

- (AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView)initWithFrame:(CGRect)a3
{
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v3;
  AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView;
  v3 = -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setHidden:](v3, "setHidden:", 1);
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 0);
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    LODWORD(v5) = 1.0;
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    LODWORD(v6) = 1.0;
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1112014848;
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v7);
    LODWORD(v8) = 1112014848;
    -[AVPlayerViewControllerCustomControlsViewLayoutMarginsGuideProvidingView setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v8);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 10000.0;
  v3 = 10000.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
