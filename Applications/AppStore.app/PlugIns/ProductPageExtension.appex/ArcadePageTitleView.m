@implementation ArcadePageTitleView

- (_TtC20ProductPageExtension19ArcadePageTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19ArcadePageTitleView *)sub_1003B585C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension19ArcadePageTitleView)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  id v8;
  _TtC20ProductPageExtension19ArcadePageTitleView *result;

  swift_unknownObjectWeakInit(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_safeAreaDelegate], 0);
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView__contentOffset];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSize];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSizeWithTabBar];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC20ProductPageExtension19ArcadePageTitleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ArcadePageTitleView.swift", 46, 2, 61, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC20ProductPageExtension19ArcadePageTitleView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1003B5D88();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension19ArcadePageTitleView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MinX;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v4 = self;
  -[ArcadePageTitleView layoutSubviews](&v13, "layoutSubviews");
  v5 = *(void **)&v4->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_lockupView];
  LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "measurementsWithFitting:in:", v4, v6, v7, v13.receiver, v13.super_class);
  v9 = v8;
  v11 = v10;
  v14.origin.x = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  MinX = CGRectGetMinX(v14);
  v15.origin.x = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", MinX, CGRectGetMaxY(v15) - v11, v9, v11);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  _TtC20ProductPageExtension19ArcadePageTitleView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = *(void **)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_lockupView];
  v5 = self;
  objc_msgSend(v4, "sizeThatFits:", CGSize.subtracting(insets:)(-[ArcadePageTitleView layoutMargins](v5, "layoutMargins")));
  v7 = v6;
  sub_1003B5C70();
  v9 = v8;

  v10 = v7 + v9;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  objc_class *ObjectType;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSize];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_cachedIntrinsicContentSizeWithTabBar];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[ArcadePageTitleView invalidateIntrinsicContentSize](&v6, "invalidateIntrinsicContentSize");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension19ArcadePageTitleView *v6;

  v5 = a3;
  v6 = self;
  sub_1003B6098(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC20ProductPageExtension19ArcadePageTitleView_safeAreaDelegate]);

}

@end
