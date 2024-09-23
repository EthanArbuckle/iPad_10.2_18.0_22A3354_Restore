@implementation RiverTodayCardBackgroundView

- (_TtC8AppStore28RiverTodayCardBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003E9528();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore28RiverTodayCardBackgroundView *v3;

  v3 = self;
  sub_1003E64BC((uint64_t)v3, v2);

}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[RiverTodayCardBackgroundView didMoveToWindow](&v3, "didMoveToWindow");
  sub_1003E6360();

}

- (void)willEnterForeground:(id)a3
{
  sub_1003B6C78(self, (uint64_t)a2, (uint64_t)a3, sub_1003E6360);
}

- (void)didEnterBackground:(id)a3
{
  sub_1003B6C78(self, (uint64_t)a2, (uint64_t)a3, sub_1003E6BF8);
}

- (void)reduceMotionStatusDidChange:(id)a3
{
  sub_1003B6C78(self, (uint64_t)a2, (uint64_t)a3, sub_1003E6360);
}

- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore28RiverTodayCardBackgroundView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1003E6360();

}

- (_TtC8AppStore28RiverTodayCardBackgroundView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore28RiverTodayCardBackgroundView *result;

  result = (_TtC8AppStore28RiverTodayCardBackgroundView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.RiverTodayCardBackgroundView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_colors));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_gradientBackingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_topRightGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_topLeftGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_bottomLeftGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_bottomRightGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_leftMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_rightMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_topMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_bottomMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_overlayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_meshView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_meshTransforms));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore28RiverTodayCardBackgroundView_riverViewStyling;
  v4 = type metadata accessor for RiverViewStyling(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
