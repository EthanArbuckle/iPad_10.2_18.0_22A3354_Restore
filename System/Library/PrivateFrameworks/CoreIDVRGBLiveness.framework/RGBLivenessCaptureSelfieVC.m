@implementation RGBLivenessCaptureSelfieVC

- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)captureSelfieView
{
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v2;
  _TtC18CoreIDVRGBLiveness17CaptureSelfieView *result;

  v2 = self;
  result = (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)-[RGBLivenessCaptureSelfieVC view](v2, sel_view);
  if (result)
  {

    type metadata accessor for CaptureSelfieView();
    return (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)(id)swift_dynamicCastClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213A0CC6C();
}

- (void)loadView
{
  id v3;
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = objc_allocWithZone((Class)type metadata accessor for CaptureSelfieView());
  v4 = self;
  v5 = swift_retain();
  sub_21398AB64(v5);
  v7 = v6;
  -[RGBLivenessCaptureSelfieVC setView:](v4, sel_setView_, v6);

}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[RGBLivenessCaptureSelfieVC viewDidLoad](&v4, sel_viewDidLoad);
  sub_2139FA0DC();
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v2, sel_cancelFromStitchDetectionWithNotification_, *MEMORY[0x24BE1C5D8], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[RGBLivenessCaptureSelfieVC viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_sharedApplication, v9.receiver, v9.super_class);
  v7 = objc_msgSend(v6, sel_isIdleTimerDisabled);

  v4[OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_originalIdleTimerDisabled] = v7;
  v8 = objc_msgSend(v5, sel_sharedApplication);
  objc_msgSend(v8, sel_setIdleTimerDisabled_, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (unsigned __int8 *)v6.receiver;
  -[RGBLivenessCaptureSelfieVC viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setIdleTimerDisabled_, v4[OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_originalIdleTimerDisabled]);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v4;

  v4 = self;
  RGBLivenessCaptureSelfieVC.viewDidDisappear(_:)(a3);

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)restartSelfieCapture
{
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v2;

  v2 = self;
  sub_2139FB318();

}

- (void)cancelFromStitchDetectionWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v9;
  uint64_t v10;

  v4 = sub_213A13C40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213A13C28();
  v9 = self;
  sub_2139FC2D4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)showAXOptions
{
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v2;

  v2 = self;
  sub_2139FDD3C();

}

- (void)presentSkipGestureAlert
{
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v2;

  v2 = self;
  sub_213A03790();

}

- (void)presentCoachingSuccess:(id)a3
{
  void *v4;
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_213A0CEC8(v5, (void (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)performClosuresAwaitingImageQualityVerification
{
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *v2;

  v2 = self;
  sub_213A08FB0();

}

- (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *result;

  v4 = a4;
  result = (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_weakDestroy();
  swift_release();
  sub_2139907E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_livenessPrimaryClosure));
  sub_2139907E4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_livenessSecondaryClosure));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_gestureDetectedTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_hapticGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_latestImageQualityError));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_errorReminderTimer));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC____lazy_storage___flashIndicator));
}

@end
