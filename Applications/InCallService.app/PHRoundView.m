@implementation PHRoundView

- (PHRoundView)initWithFrame:(CGRect)a3 cornerRadius:(float)a4
{
  PHRoundView *v5;
  PHRoundView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHRoundView;
  v5 = -[PHRoundView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRoundView layer](v5, "layer"));
    objc_msgSend(v7, "setCornerRadius:", a4);

  }
  return v6;
}

@end
