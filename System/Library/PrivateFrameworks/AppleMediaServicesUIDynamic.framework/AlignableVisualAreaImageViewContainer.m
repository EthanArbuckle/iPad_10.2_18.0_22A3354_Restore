@implementation AlignableVisualAreaImageViewContainer

- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9DDB2A8();
}

- (void)layoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer *v2;

  v2 = self;
  AlignableVisualAreaImageViewContainer.layoutSubviews()();

}

- (BOOL)hasContent
{
  _TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = AlignableVisualAreaImageViewContainer.hasContent.getter();

  return v3 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = AlignableVisualAreaImageViewContainer.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  AlignableVisualAreaImageViewContainer.measurements(fitting:in:)((uint64_t)a4, width, height);
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = 0.0;
  v14 = 0.0;
  v15 = v10;
  v16 = v12;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)init
{
  AlignableVisualAreaImageViewContainer.init()();
}

- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)initWithFrame:(CGRect)a3
{
  AlignableVisualAreaImageViewContainer.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView));
}

@end
