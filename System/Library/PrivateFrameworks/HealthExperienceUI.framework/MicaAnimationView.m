@implementation MicaAnimationView

- (_TtC18HealthExperienceUI17MicaAnimationView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18HealthExperienceUI17MicaAnimationView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_stateController) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_transitionSpeed) = 1065353216;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_previousViewSize);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_loopCount) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI17MicaAnimationView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC18HealthExperienceUI17MicaAnimationView *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGSize v8;
  double v9;
  double v10;
  double v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGSize v14;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_packageLayer);
  v3 = self;
  objc_msgSend(v2, sel_bounds);
  v5 = v4;
  v7 = v6;
  sub_1A984FCC4(&v13);
  v12 = v13;
  v14.width = v5;
  v14.height = v7;
  v8 = CGSizeApplyAffineTransform(v14, &v12);
  v9 = *(double *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_insetSize);

  v10 = v8.width + v9;
  v11 = v8.height + v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC18HealthExperienceUI17MicaAnimationView *v2;

  v2 = self;
  sub_1A984FB60();

}

- (void)stepAnimationForLayer:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI17MicaAnimationView *v5;

  v4 = a3;
  v5 = self;
  sub_1A984FFEC();

}

- (_TtC18HealthExperienceUI17MicaAnimationView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI17MicaAnimationView *result;

  result = (_TtC18HealthExperienceUI17MicaAnimationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_packageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_package));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_stateController));
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC18HealthExperienceUI17MicaAnimationView_animation));
  swift_bridgeObjectRelease();
}

@end
