@implementation GKHairlineView

+ (id)hairlineViewForAlignment:(int64_t)a3
{
  GKHairlineView *v4;

  v4 = objc_alloc_init(GKHairlineView);
  -[GKHairlineView setAlignment:](v4, "setAlignment:", a3);
  return v4;
}

- (GKHairlineView)init
{
  GKHairlineView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKHairlineView;
  v2 = -[GKHairlineView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "separatorLineColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKHairlineView setBackgroundColor:](v2, "setBackgroundColor:", v4);

    -[GKHairlineView setAutoresizingMask:](v2, "setAutoresizingMask:", 2);
    v2->_alignment = 0;
  }
  return v2;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (self->_alignment)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scale");
    v3 = *MEMORY[0x1E0DC55F0];
    v5 = 1.0 / v4;
  }
  else
  {
    v5 = *MEMORY[0x1E0DC55F0];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scale");
    v3 = 1.0 / v6;
  }

  v7 = v5;
  v8 = v3;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  int64_t alignment;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;

  -[GKHairlineView superview](self, "superview");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[GKHairlineView frame](self, "frame");
  if (v13)
  {
    v4 = v3;
    alignment = self->_alignment;
    objc_msgSend(v13, "bounds");
    v6 = CGRectGetWidth(v14) + -18.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = 1.0 / v8;

    if (alignment)
      v10 = v6;
    else
      v10 = v9;
    if (alignment)
      v6 = v9;
    objc_msgSend(v13, "bounds");
    -[GKHairlineView setFrame:](self, "setFrame:", round(v12 + (v11 - v6) * 0.5), v4, v6, v10);
  }

}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

@end
