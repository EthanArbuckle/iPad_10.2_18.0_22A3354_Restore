@implementation ClimateCarView

- (_TtC7Climate14ClimateCarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100021078();
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGAffineTransform v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ClimateCarView(0);
  v7 = (char *)v13.receiver;
  -[ClimateCarView drawRect:](&v13, "drawRect:", x, y, width, height);
  sub_10001FF4C();
  v9 = v8;
  v10 = *(void **)&v7[OBJC_IVAR____TtC7Climate14ClimateCarView_carImageView];
  CGAffineTransformMakeTranslation(&v12, 0.0, v8);
  objc_msgSend(v10, "setTransform:", &v12);
  v11 = *(void **)&v7[OBJC_IVAR____TtC7Climate14ClimateCarView_positionViews];
  CGAffineTransformMakeTranslation(&v12, 0.0, v9);
  objc_msgSend(v11, "setTransform:", &v12);

}

- (_TtC7Climate14ClimateCarView)initWithFrame:(CGRect)a3
{
  _TtC7Climate14ClimateCarView *result;

  result = (_TtC7Climate14ClimateCarView *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateCarView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC7Climate14ClimateCarView_climateSystem, type metadata accessor for ClimateSystemManager);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7Climate14ClimateCarView_activeZoneTracker));

  sub_10000AB60((uint64_t)self + OBJC_IVAR____TtC7Climate14ClimateCarView_assets, type metadata accessor for ClimateAssets);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate14ClimateCarView_cancellables));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7Climate14ClimateCarView_imageActiveHeightConstraint));
}

- (void)layoutSubviews
{
  _TtC7Climate14ClimateCarView *v2;

  v2 = self;
  sub_1000204A8();

}

@end
