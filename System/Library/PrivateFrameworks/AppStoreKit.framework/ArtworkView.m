@implementation ArtworkView

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  -[ArtworkView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC11AppStoreKit11ArtworkView *v9;
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
  objc_super v21;
  objc_super v22;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v23.receiver = self;
  v23.super_class = ObjectType;
  v9 = self;
  -[ArtworkView frame](&v23, sel_frame);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v22.receiver = v9;
  v22.super_class = ObjectType;
  -[ArtworkView frame](&v22, sel_frame);
  if (v19 != width || v18 != height)
    *((_BYTE *)&v9->super.super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_isCornerRadiusInvalid) = 1;
  v21.receiver = v9;
  v21.super_class = ObjectType;
  -[ArtworkView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  sub_1D81DB83C(v11, v13, v15, v17);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC11AppStoreKit11ArtworkView *v6;
  _TtC11AppStoreKit11ArtworkView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ArtworkView.traitCollectionDidChange(_:)(v8);

}

- (_TtC11AppStoreKit11ArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC11AppStoreKit11ArtworkView *)ArtworkView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC11AppStoreKit11ArtworkView *v2;

  v2 = self;
  ArtworkView.layoutSubviews()();

}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC11AppStoreKit11ArtworkView *v6;

  v5 = a3;
  v6 = self;
  ArtworkView.backgroundColor.setter(a3);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_internalBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_placeholderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit11ArtworkView_artworkTintColor));
}

@end
