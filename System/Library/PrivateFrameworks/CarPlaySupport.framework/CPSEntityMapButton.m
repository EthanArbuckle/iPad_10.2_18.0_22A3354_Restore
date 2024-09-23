@implementation CPSEntityMapButton

+ (CPSEntityMapButton)buttonWithEntityMapButtonType:(unint64_t)a3
{
  id v4;
  objc_super v5;
  id v6[2];
  unint64_t v7;
  SEL v8;
  id v9;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6[1] = 0;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CPSEntityMapButton;
  v6[0] = objc_msgSendSuper2(&v5, sel_buttonWithType_, 0);
  objc_msgSend(v6[0], "setEntityMapButtonType:", v7);
  v4 = v6[0];
  objc_storeStrong(v6, 0);
  return (CPSEntityMapButton *)v4;
}

- (CPSEntityMapButton)initWithFrame:(CGRect)a3
{
  CPSEntityMapButton *v4;
  CPSEntityMapButton *v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;
  SEL v10;
  CPSEntityMapButton *v11;
  CGRect v12;

  v12 = a3;
  v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)CPSEntityMapButton;
  v11 = -[CPSActionButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    -[CPSActionButton setLayoutDelegate:](v11, "setLayoutDelegate:", v11);
    v5 = v11;
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    -[CPSActionButton setTintColor:forState:](v5, "setTintColor:forState:");

    v8 = +[CPSEntityStyles mapButtonDropShadow](CPSEntityStyles, "mapButtonDropShadow");
    v7 = (id)-[CPSEntityMapButton layer](v11, "layer");
    objc_msgSend(v8, "applyShadowToLayer:");

  }
  v4 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v4;
}

- (void)setEntityMapButtonType:(unint64_t)a3
{
  if (self->_entityMapButtonType != a3)
  {
    self->_entityMapButtonType = a3;
    -[CPSEntityMapButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNeedsLayout
{
  unint64_t v2;
  id v3;
  objc_super v4;
  SEL v5;
  CPSEntityMapButton *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSEntityMapButton;
  -[CPSEntityMapButton setNeedsLayout](&v4, sel_setNeedsLayout);
  v3 = 0;
  v2 = -[CPSEntityMapButton entityMapButtonType](v6, "entityMapButtonType");
  if (v2 <= 4)
    __asm { BR              X8 }
  -[CPSActionButton setButtonImage:](v6, "setButtonImage:", v3);
  objc_storeStrong(&v3, 0);
}

- (void)layoutSubviews
{
  CGFloat v2;
  id v3;
  objc_super v4;
  SEL v5;
  CPSEntityMapButton *v6;
  CGRect v7;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSEntityMapButton;
  -[CPSActionButton layoutSubviews](&v4, sel_layoutSubviews);
  -[CPSEntityMapButton frame](v6, "frame");
  v2 = CGRectGetWidth(v7) * 0.5;
  v3 = (id)-[CPSEntityMapButton layer](v6, "layer");
  objc_msgSend(v3, "setCornerRadius:", v2);

}

- (id)buttonAttributes
{
  return MEMORY[0x24BDBD1B8];
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_10();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)buttonGlyphSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_10();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)buttonBackgroundColor
{
  id v2;
  char v4;
  id v5;
  char v6;
  id v7;
  void *v8;

  v6 = 0;
  v4 = 0;
  if ((-[CPSEntityMapButton isFocused](self, "isFocused") & 1) != 0)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v6 = 1;
    v2 = v7;
  }
  else
  {
    v5 = +[CPSEntityStyles mapButtonBackgroundColor](CPSEntityStyles, "mapButtonBackgroundColor");
    v4 = 1;
    v2 = v5;
  }
  v8 = v2;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  return v8;
}

- (id)buttonImageTintColor
{
  id v2;
  char v4;
  id v5;
  char v6;
  id v7;
  void *v8;

  v6 = 0;
  v4 = 0;
  if ((-[CPSEntityMapButton isFocused](self, "isFocused") & 1) != 0)
  {
    v7 = +[CPSEntityStyles mapButtonBackgroundColor](CPSEntityStyles, "mapButtonBackgroundColor");
    v6 = 1;
    v2 = v7;
  }
  else
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v4 = 1;
    v2 = v5;
  }
  v8 = v2;
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  return v8;
}

- (unint64_t)entityMapButtonType
{
  return self->_entityMapButtonType;
}

@end
