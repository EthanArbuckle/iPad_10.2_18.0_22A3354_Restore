@implementation CPSHidingLabel

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  id v5;
  id v6;
  id v7;
  double v8;
  objc_super v9;
  SEL v10;
  CPSHidingLabel *v11;

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)CPSHidingLabel;
  -[CPSHidingLabel layoutSubviews](&v9, sel_layoutSubviews);
  v7 = (id)-[CPSHidingLabel text](v11, "text");
  v6 = (id)-[CPSHidingLabel font](v11, "font");
  v5 = (id)-[CPSHidingLabel traitCollection](v11, "traitCollection");
  objc_msgSend(v5, "displayScale");
  CPSSizeForText(v7, v6, 0, 1.79769313e308, v2);
  v8 = v3;

  -[CPSHidingLabel frame](v11, "frame");
  -[CPSHidingLabel setHidden:](v11, "setHidden:", ceil(v4) < v8);
}

@end
