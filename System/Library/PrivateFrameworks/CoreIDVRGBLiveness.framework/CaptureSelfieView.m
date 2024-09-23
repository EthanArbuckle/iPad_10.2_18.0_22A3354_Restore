@implementation CaptureSelfieView

- (UILabel)nagPrompt
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_nagPrompt));
}

- (UILabel)coachingPrompt
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPrompt));
}

- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)sub_21398F8B8();
}

- (void)setCoachingPromptText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC18CoreIDVRGBLiveness17CaptureSelfieView *v6;
  UILabel *v7;
  void *v8;

  if (a3)
  {
    sub_213A14378();
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  v7 = -[CaptureSelfieView coachingPrompt](v6, sel_coachingPrompt);
  if (v5)
    v8 = (void *)sub_213A14348();
  else
    v8 = 0;
  -[UILabel setText:](v7, sel_setText_, v8);

  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa+ OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptScrollView), sel_setContentOffset_, 0.0, 0.0);
  swift_bridgeObjectRelease();
}

- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)initWithFrame:(CGRect)a3
{
  _TtC18CoreIDVRGBLiveness17CaptureSelfieView *result;

  result = (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[560];

  memcpy(v3, (char *)self + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_captureConfig, sizeof(v3));
  sub_2139906F0((uint64_t)v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_cameraFeed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_topContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_bottomContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_nagContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_nagPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_selfieView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_livenessButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_axOptionsPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_expandButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_livenessPrimaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_livenessSecondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_inlineStepUpView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_axOptionsPromptBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_topContainerLivenessHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_bottomContainerSelfieHeightConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewCenterYConstraintLarge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewCenterYConstraintSmall));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewWidthConstraintLarge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewWidthConstraintSmall));
  sub_2139907E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_onExpandButtonTapped));
  sub_2139907E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_onLivenessPrimaryButtonTapped));
  sub_2139907E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_onLivenessSecondaryButtonTapped));
}

@end
