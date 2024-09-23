@implementation FMFTintedActivityIndicatorView

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMFTintedActivityIndicatorView;
  -[FMFTintedActivityIndicatorView awakeFromNib](&v4, sel_awakeFromNib);
  -[FMFTintedActivityIndicatorView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFTintedActivityIndicatorView setColor:](self, "setColor:", v3);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMFTintedActivityIndicatorView;
  -[FMFTintedActivityIndicatorView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[FMFTintedActivityIndicatorView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFTintedActivityIndicatorView setColor:](self, "setColor:", v3);

}

@end
