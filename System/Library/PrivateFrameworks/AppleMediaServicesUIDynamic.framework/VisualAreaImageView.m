@implementation VisualAreaImageView

- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9DDBC9C();
}

- (void)layoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic19VisualAreaImageView *v2;

  v2 = self;
  VisualAreaImageView.layoutSubviews()();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC27AppleMediaServicesUIDynamic19VisualAreaImageView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  JUMeasurements result;

  width = a3.width;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = VisualAreaImageView.measurements(fitting:in:)(width);
  v9 = v8;
  v11 = v10;
  swift_unknownObjectRelease();

  v12 = 0.0;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.var3 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (BOOL)hasContent
{
  _TtC27AppleMediaServicesUIDynamic19VisualAreaImageView *v2;
  char v3;
  char v4;

  v2 = self;
  VisualAreaImageView.hasContent.getter();
  v4 = v3;

  return v4 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC27AppleMediaServicesUIDynamic19VisualAreaImageView *v4;
  unint64_t v5;
  CGSize v6;
  double v7;
  double height;
  CGSize result;

  width = a3.width;
  v4 = self;
  v6 = VisualAreaImageView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, *(unint64_t *)&width));

  v7 = v6.width;
  height = v6.height;
  result.height = height;
  result.width = v7;
  return result;
}

- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)init
{
  VisualAreaImageView.init()();
}

- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)initWithFrame:(CGRect)a3
{
  VisualAreaImageView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView));
  __swift_destroy_boxed_opaque_existential_2((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints);
  sub_1B9D63180(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_applyCachedArtwork));
}

@end
