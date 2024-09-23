@implementation AlarmApertureElementController

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_presentationBehaviors) = (Class)a3;
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  _TtC10ClockAngel30AlarmApertureElementController *v2;
  id v3;
  double result;
  void *v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double Height;
  double v16;
  CGRect v17;

  v2 = self;
  v3 = -[AlarmApertureElementController view](v2, "view");
  if (v3)
  {
    v5 = v3;
    v6 = objc_msgSend(v3, "SBUISA_systemApertureObstructedAreaLayoutGuide");

    objc_msgSend(v6, "layoutFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v17.origin.x = v8;
    v17.origin.y = v10;
    v17.size.width = v12;
    v17.size.height = v14;
    Height = CGRectGetHeight(v17);
    v16 = *(double *)((char *)&v2->super.super.super.super.isa
                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_buttonSize);

    return v16 + 34.0 - Height;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSURL)launchURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  _BYTE v14[24];

  v3 = sub_10000A58C((uint64_t *)&unk_1000B0040);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL;
  swift_beginAccess(v6, v14, 0, 0);
  sub_100026838((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v10;
}

- (void)setLaunchURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC10ClockAngel30AlarmApertureElementController *v11;
  _BYTE v13[24];

  v5 = sub_10000A58C((uint64_t *)&unk_1000B0040);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL, v13, 33, 0);
  v11 = self;
  sub_1000267F0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (NSString)associatedAppBundleIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier);
  v7 = *(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier) = (Class)a3;
  v3 = a3;

}

- (BOOL)preventsInteractiveDismissal
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preventsInteractiveDismissal);
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preventsInteractiveDismissal) = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_keyColor));
}

- (void)viewDidLoad
{
  _TtC10ClockAngel30AlarmApertureElementController *v2;

  v2 = self;
  sub_1000202BC();

}

- (_TtC10ClockAngel30AlarmApertureElementController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel30AlarmApertureElementController *)sub_1000208BC(a3);
}

- (_TtC10ClockAngel30AlarmApertureElementController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10ClockAngel30AlarmApertureElementController *)sub_100020D64(v5, v7, a4);
}

- (void)dealloc
{
  _TtC10ClockAngel30AlarmApertureElementController *v2;

  v2 = self;
  sub_100021278();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_observerId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_sessionId]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_activeConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_compressedSnoozeTrailingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_compressedSnoozeLeadingHost));
  sub_100011484((uint64_t)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL, (uint64_t *)&unk_1000B0040);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_timerObserverIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_keyColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmAlertLeadingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmAlertTrailingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmSnoozeExpandedHostLeading));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmSnoozeExpandedHostTrailing));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_voiceOverTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmAnimationView));
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10ClockAngel30AlarmApertureElementController *v4;

  v4 = self;
  sub_1000216C0(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AlarmApertureElementController(0);
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[AlarmApertureElementController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_10009F2E8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_1000267A0;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100074F90;
  v12[3] = &unk_10009F300;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)collapse
{
  _TtC10ClockAngel30AlarmApertureElementController *v2;
  id v3;

  v2 = self;
  v3 = -[AlarmApertureElementController systemApertureElementContext](v2, "systemApertureElementContext");
  objc_msgSend(v3, "requestTransitionToPreferredLayoutMode");

  swift_unknownObjectRelease(v3);
}

- (_TtC10ClockAngel30AlarmApertureElementController)init
{
  _TtC10ClockAngel30AlarmApertureElementController *result;

  result = (_TtC10ClockAngel30AlarmApertureElementController *)_swift_stdlib_reportUnimplementedInitializer("ClockAngel.AlarmApertureElementController", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
