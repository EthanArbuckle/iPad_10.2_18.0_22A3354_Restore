@implementation CPSPagingControlButton

- (CPSPagingControlButton)initWithFrame:(CGRect)a3
{
  CPSPagingControlButton *v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  CPSPagingControlButton *v9;
  CGRect v10;

  v10 = a3;
  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CPSPagingControlButton;
  v9 = -[CPSPagingControlButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v5 = (id)-[CPSPagingControlButton layer](v9, "layer");
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    v6 = (id)-[CPSPagingControlButton layer](v9, "layer");
    objc_msgSend(v6, "setCornerRadius:", 2.0);

  }
  v4 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPSPagingControlButton *v4;
  CPSPagingControlButton *v5;
  id v6;
  CPSPagingControlButton *v7;
  id v8;
  BOOL v10;
  id v11;
  id location[2];
  CPSPagingControlButton *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = (CPSPagingControlButton *)(id)objc_msgSend(location[0], "nextFocusedItem");
  v10 = v4 != v13;

  if (v10)
  {
    -[CPSPagingControlButton setTintColor:](v13, "setTintColor:");
    -[CPSPagingControlButton setBackgroundColor:](v13, "setBackgroundColor:", 0);
  }
  else
  {
    v5 = v13;
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    -[CPSPagingControlButton setBackgroundColor:](v5, "setBackgroundColor:");

    v7 = v13;
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    -[CPSPagingControlButton setTintColor:](v7, "setTintColor:");

  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

@end
