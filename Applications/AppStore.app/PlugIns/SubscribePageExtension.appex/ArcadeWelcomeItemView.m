@implementation ArcadeWelcomeItemView

- (_TtC22SubscribePageExtension21ArcadeWelcomeItemView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21ArcadeWelcomeItemView *)sub_1003D10BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21ArcadeWelcomeItemView)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension21ArcadeWelcomeItemView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_artwork) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_artworkLoader) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_shouldUpdateArtwork) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension21ArcadeWelcomeItemView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ArcadeWelcomeItemView.swift", 50, 2, 57, 0);
  __break(1u);
  return result;
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
  -[ArcadeWelcomeItemView frame](&v6, "frame");
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
  _TtC22SubscribePageExtension21ArcadeWelcomeItemView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1003D14E8(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension21ArcadeWelcomeItemView *v2;

  v2 = self;
  sub_1003D15F8();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension21ArcadeWelcomeItemView *v8;
  __n128 v9;
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
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9.n128_f64[0] = width;
  v10 = sub_1003D1C14((uint64_t)a4, v9, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_unknownObjectRelease(a4);

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension21ArcadeWelcomeItemView *v6;

  v5 = a3;
  v6 = self;
  sub_1003D2058((uint64_t)a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_artworkView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_artwork));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomeItemView_artworkLoader));
}

@end
