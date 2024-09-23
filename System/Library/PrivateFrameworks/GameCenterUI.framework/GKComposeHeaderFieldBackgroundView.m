@implementation GKComposeHeaderFieldBackgroundView

- (GKComposeHeaderFieldBackgroundView)init
{
  GKComposeHeaderFieldBackgroundView *v2;
  GKComposeHeaderFieldBackgroundView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKComposeHeaderFieldBackgroundView;
  v2 = -[GKComposeHeaderFieldBackgroundView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GKComposeHeaderFieldBackgroundView setOpaque:](v2, "setOpaque:", 0);
    -[GKComposeHeaderFieldBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", 0);
    -[GKComposeHeaderFieldBackgroundView setContentMode:](v3, "setContentMode:", 0);
    v3->_location = 6;
  }
  return v3;
}

- (void)resetBackgroundImage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposeHeaderFieldBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[GKComposeHeaderFieldBackgroundView setImage:](self, "setImage:", 0);
}

- (void)setLocation:(unsigned int)a3
{
  if (self->_location != a3)
  {
    self->_location = a3;
    -[GKComposeHeaderFieldBackgroundView setImage:](self, "setImage:", 0);
    -[GKComposeHeaderFieldBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKComposeHeaderFieldBackgroundView;
  -[GKComposeHeaderFieldBackgroundView layoutSubviews](&v4, sel_layoutSubviews);
  -[GKComposeHeaderFieldBackgroundView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[GKComposeHeaderFieldBackgroundView resetBackgroundImage](self, "resetBackgroundImage");
}

- (unsigned)location
{
  return self->_location;
}

@end
