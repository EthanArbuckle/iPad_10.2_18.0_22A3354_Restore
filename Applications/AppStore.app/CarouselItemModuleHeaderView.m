@implementation CarouselItemModuleHeaderView

- (_TtC8AppStore28CarouselItemModuleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28CarouselItemModuleHeaderView *)sub_100410C88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28CarouselItemModuleHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004120DC();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC8AppStore28CarouselItemModuleHeaderView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v18.receiver = self;
  v18.super_class = ObjectType;
  v4 = self;
  -[CarouselItemModuleHeaderView layoutSubviews](&v18, "layoutSubviews");
  sub_100411578(v15);
  v5 = v16;
  v6 = v17;
  sub_100060B40(v15, v16);
  *(_QWORD *)&v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CarouselItemModuleHeaderView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore28CarouselItemModuleHeaderView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[CarouselItemModuleHeaderView traitCollection](v5, "traitCollection");
  sub_100411578(v14);
  v7 = v15;
  v8 = v16;
  sub_100060B40(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, width, height);
  v11 = v10;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_badgeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_titleLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleHeaderView_titleLabel));
}

@end
