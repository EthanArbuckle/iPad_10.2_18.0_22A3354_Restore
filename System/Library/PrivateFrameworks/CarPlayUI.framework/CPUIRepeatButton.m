@implementation CPUIRepeatButton

- (CPUIRepeatButton)initWithFrame:(CGRect)a3
{
  CPUIRepeatButton *v3;
  CPUIRepeatButton *v4;
  void *v5;
  uint64_t v6;
  UIImage *repeatImage;
  void *v8;
  uint64_t v9;
  UIImage *repeatOneImage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPUIRepeatButton;
  v3 = -[CPUIModernButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPUIRepeatButton traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIRepeatGlyph(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    repeatImage = v4->_repeatImage;
    v4->_repeatImage = (UIImage *)v6;

    -[CPUIRepeatButton traitCollection](v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CPUIRepeatOneGlyph(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    repeatOneImage = v4->_repeatOneImage;
    v4->_repeatOneImage = (UIImage *)v9;

    -[CPUIRepeatButton setImage:forState:](v4, "setImage:forState:", v4->_repeatImage, 0);
  }
  return v4;
}

- (void)setRepeatType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 1)
  {
    -[CPUIRepeatButton repeatOneImage](self, "repeatOneImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIRepeatButton setImage:forState:](self, "setImage:forState:", v4, 0);

    -[CPUIRepeatButton repeatOneImage](self, "repeatOneImage");
  }
  else
  {
    -[CPUIRepeatButton repeatImage](self, "repeatImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIRepeatButton setImage:forState:](self, "setImage:forState:", v5, 0);

    -[CPUIRepeatButton repeatImage](self, "repeatImage");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithTintColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIRepeatButton setImage:forState:](self, "setImage:forState:", v8, 1);

}

- (UIImage)repeatImage
{
  return self->_repeatImage;
}

- (void)setRepeatImage:(id)a3
{
  objc_storeStrong((id *)&self->_repeatImage, a3);
}

- (UIImage)repeatOneImage
{
  return self->_repeatOneImage;
}

- (void)setRepeatOneImage:(id)a3
{
  objc_storeStrong((id *)&self->_repeatOneImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatOneImage, 0);
  objc_storeStrong((id *)&self->_repeatImage, 0);
}

@end
