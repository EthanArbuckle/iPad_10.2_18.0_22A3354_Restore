@implementation _NTKCompoundKeylineImageView

- (void)setSecondaryKeylineView:(id)a3
{
  NTKKeylineView *v4;
  NTKKeylineView *secondaryKeylineView;
  NTKKeylineView *v6;
  NTKKeylineView *v7;
  NTKKeylineView *v8;
  NTKKeylineView *v9;

  v4 = (NTKKeylineView *)a3;
  secondaryKeylineView = self->_secondaryKeylineView;
  if (secondaryKeylineView != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_secondaryKeylineView;
    self->_secondaryKeylineView = v6;
    v8 = secondaryKeylineView;

    -[NTKKeylineView removeFromSuperview](v8, "removeFromSuperview");
    -[_NTKCompoundKeylineImageView addSubview:](self, "addSubview:", self->_secondaryKeylineView);

    v4 = v9;
  }

}

+ (id)keylineWithImage:(id)a3 secondaryKeylineView:(id)a4
{
  id v5;
  id v6;
  _NTKCompoundKeylineImageView *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CLKUIColoringImageView initWithImage:]([_NTKCompoundKeylineImageView alloc], "initWithImage:", v6);

  -[_NTKCompoundKeylineImageView setSecondaryKeylineView:](v7, "setSecondaryKeylineView:", v5);
  return v7;
}

- (void)layoutSubviews
{
  NTKKeylineView *secondaryKeylineView;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NTKCompoundKeylineImageView;
  -[_NTKCompoundKeylineImageView layoutSubviews](&v7, sel_layoutSubviews);
  -[NTKKeylineView sizeToFit](self->_secondaryKeylineView, "sizeToFit");
  secondaryKeylineView = self->_secondaryKeylineView;
  -[_NTKCompoundKeylineImageView bounds](self, "bounds");
  v5 = v4 * 0.5;
  -[_NTKCompoundKeylineImageView bounds](self, "bounds");
  -[NTKKeylineView setCenter:](secondaryKeylineView, "setCenter:", v5, v6 * 0.5);
}

- (void)setColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NTKCompoundKeylineImageView;
  v4 = a3;
  -[_NTKKeylineImageView setColor:](&v5, sel_setColor_, v4);
  -[NTKKeylineView setColor:](self->_secondaryKeylineView, "setColor:", v4, v5.receiver, v5.super_class);

}

- (void)setUsesLegibility:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_NTKCompoundKeylineImageView;
  -[CLKUIColoringImageView setUsesLegibility:](&v5, sel_setUsesLegibility_);
  -[NTKKeylineView setUsesLegibility:](self->_secondaryKeylineView, "setUsesLegibility:", v3);
}

- (void)setOverrideColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_NTKCompoundKeylineImageView;
  v4 = a3;
  -[CLKUIColoringImageView setOverrideColor:](&v5, sel_setOverrideColor_, v4);
  -[NTKKeylineView setOverrideColor:](self->_secondaryKeylineView, "setOverrideColor:", v4, v5.receiver, v5.super_class);

}

- (NTKKeylineView)secondaryKeylineView
{
  return self->_secondaryKeylineView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryKeylineView, 0);
}

@end
