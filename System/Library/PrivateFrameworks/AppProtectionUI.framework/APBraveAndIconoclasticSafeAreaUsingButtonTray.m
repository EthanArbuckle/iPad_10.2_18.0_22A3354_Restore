@implementation APBraveAndIconoclasticSafeAreaUsingButtonTray

- (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray)initWithFrame:(CGRect)a3
{
  return (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray *)sub_2362F9240(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2362F9CC0();
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray();
  v2 = (char *)v13.receiver;
  -[APBraveAndIconoclasticSafeAreaUsingButtonTray layoutSubviews](&v13, sel_layoutSubviews);
  objc_msgSend(v2, sel_layoutMargins, v13.receiver, v13.super_class);
  v4 = v3;
  v6 = v5;
  v7 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v7, sel_setFrame_, UIEdgeInsetsInsetRect(v8, v9, v10, v11, v4, v6));
  v12 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v12, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[APBraveAndIconoclasticSafeAreaUsingButtonTray systemLayoutSizeFittingSize:](self, sel_systemLayoutSizeFittingSize_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  -[APBraveAndIconoclasticSafeAreaUsingButtonTray layoutMargins](v9, sel_layoutMargins);
  v11 = v10;
  v13 = v12;
  UIEdgeInsetsInsetRect(0.0, 0.0, width, height, v10, v14);
  v16 = v15;
  v18 = v17;
  *(float *)&v15 = a4;
  *(float *)&v17 = a5;
  objc_msgSend(*(id *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack), sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v16, v18, v15, v17);
  v20 = v19;

  v23 = CGPointMake(width, v13 + v11 + v20, v21, v22);
  result.height = v24;
  result.width = v23;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  -[APBraveAndIconoclasticSafeAreaUsingButtonTray bounds](v2, sel_bounds);
  -[APBraveAndIconoclasticSafeAreaUsingButtonTray sizeThatFits:](v2, sel_sizeThatFits_, CGPointMake(v3, 0.0, v3, v4));
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background));
}

@end
