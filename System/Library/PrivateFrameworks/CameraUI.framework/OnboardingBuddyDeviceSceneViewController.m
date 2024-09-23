@implementation OnboardingBuddyDeviceSceneViewController

- (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DB95C01C();
}

- (void)viewDidLoad
{
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *v2;

  v2 = self;
  sub_1DB958608();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *v4;

  v4 = self;
  sub_1DB95A184(a3);

}

- (void)scheduleDemoLoopAnimationSequence
{
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *v2;

  v2 = self;
  sub_1DB95B0C8();

}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v7;
  id v8;
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1DB95C184(a4);

}

- (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *result;

  v4 = a4;
  result = (_TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_sceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_cameraNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_deviceModelNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonRippleEffectOverlayNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonGlowLightAccentNode));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_buttonHighlightStateController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_demoLoopAnimationStateController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_graduatedNeutralDensityLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8CameraUI40OnboardingBuddyDeviceSceneViewController_progressiveBlurFilter));
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  void *v7;
  id v8;
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _TtC8CameraUI40OnboardingBuddyDeviceSceneViewController *v13;
  _QWORD v14[6];

  v7 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = objc_msgSend(v7, sel_mainQueue);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v14[4] = sub_1DB95BFD0;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1DB9585E0;
  v14[3] = &block_descriptor;
  v12 = _Block_copy(v14);
  v13 = v9;
  swift_release();
  objc_msgSend(v10, sel_addOperationWithBlock_, v12);
  _Block_release(v12);
  swift_unknownObjectRelease();

}

@end
