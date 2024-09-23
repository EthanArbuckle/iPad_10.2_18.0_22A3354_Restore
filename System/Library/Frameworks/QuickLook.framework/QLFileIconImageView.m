@implementation QLFileIconImageView

- (QLFileIconImageView)initWithCoder:(id)a3
{
  QLFileIconImageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLFileIconImageView;
  v3 = -[QLFileIconImageView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[QLFileIconImageView setCornerRadius:](v3, "setCornerRadius:", 3.0);
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  void *v4;
  id v5;

  -[QLFileIconImageView layer](self, "layer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 3.0);

  -[QLFileIconImageView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
