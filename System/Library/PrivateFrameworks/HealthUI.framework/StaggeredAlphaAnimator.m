@implementation StaggeredAlphaAnimator

- (_TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator)init
{
  _TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator *result;

  result = (_TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_backgroundAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator));
}

- (int64_t)state
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_state);
}

- (BOOL)isRunning
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_isRunning);
}

- (BOOL)isReversed
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_backgroundAnimator), sel_isReversed);
}

- (void)setReversed:(BOOL)a3
{
  sub_1D7B19120((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setReversed_);
}

- (double)fractionComplete
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_fractionComplete);
  return result;
}

- (void)setFractionComplete:(double)a3
{
  sub_1D7B19034((char *)self, a3, (uint64_t)a2, (SEL *)&selRef_setFractionComplete_);
}

- (void)startAnimation
{
  sub_1D7B190B4((char *)self, (uint64_t)a2, (SEL *)&selRef_startAnimation);
}

- (void)startAnimationAfterDelay:(double)a3
{
  sub_1D7B19034((char *)self, a3, (uint64_t)a2, (SEL *)&selRef_startAnimationAfterDelay_);
}

- (void)pauseAnimation
{
  sub_1D7B190B4((char *)self, (uint64_t)a2, (SEL *)&selRef_pauseAnimation);
}

- (void)stopAnimation:(BOOL)a3
{
  sub_1D7B19120((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_stopAnimation_);
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  void *v4;
  _TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator *v5;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_backgroundAnimator);
  v5 = self;
  objc_msgSend(v4, sel_finishAnimationAtPosition_, a3);
  objc_msgSend(*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtC8HealthUIP33_2CCCC3E80CB68C77458B1C83C70AE82122StaggeredAlphaAnimator_foregroundAnimator), sel_finishAnimationAtPosition_, a3);

}

@end
