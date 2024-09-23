@implementation TodayCardProtectionLayerView

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore28TodayCardProtectionLayerView *v3;

  v3 = self;
  sub_10002E5BC((uint64_t)v3, v2);

}

- (void)didMoveToSuperview
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_gradientMaskView);
  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_includeTopGradientFade) == 1)
    -[TodayCardProtectionLayerView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v3, *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_effectsView));
  else
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_gradientMaskView), "removeFromSuperview", v3, v2);
}

- (_TtC8AppStore28TodayCardProtectionLayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DD010();
}

- (_TtC8AppStore28TodayCardProtectionLayerView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore28TodayCardProtectionLayerView *result;

  result = (_TtC8AppStore28TodayCardProtectionLayerView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.TodayCardProtectionLayerView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_effectsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_gradientMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_gradientType));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_style;
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore28TodayCardProtectionLayerView_style);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 1));
  swift_bridgeObjectRelease(v4);
}

@end
