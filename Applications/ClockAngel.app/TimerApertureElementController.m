@implementation TimerApertureElementController

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_presentationBehaviors) = (Class)a3;
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  _TtC10ClockAngel30TimerApertureElementController *v2;
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
  v3 = -[TimerApertureElementController view](v2, "view");
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
                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_buttonSize);

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
  v6 = (char *)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL;
  swift_beginAccess(v6, v14, 0, 0);
  sub_100011440((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1000B0040);
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
  _TtC10ClockAngel30TimerApertureElementController *v11;
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
  v10 = (char *)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL, v13, 33, 0);
  v11 = self;
  sub_10001E928((uint64_t)v7, (uint64_t)v10, (uint64_t *)&unk_1000B0040);
  swift_endAccess(v13);

}

- (NSString)associatedAppBundleIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier]);
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
                 + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier);
  v7 = *(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier) = (Class)a3;
  v3 = a3;

}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_keyColor));
}

- (void)viewDidLoad
{
  _TtC10ClockAngel30TimerApertureElementController *v2;

  v2 = self;
  sub_100069744();

}

- (_TtC10ClockAngel30TimerApertureElementController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel30TimerApertureElementController *)sub_100069FC4(a3);
}

- (_TtC10ClockAngel30TimerApertureElementController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10ClockAngel30TimerApertureElementController *)sub_10006A4F4(v5, v7, a4);
}

- (void)dealloc
{
  _TtC10ClockAngel30TimerApertureElementController *v2;

  v2 = self;
  sub_10006AA90();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_observerId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_sessionId]);
  sub_100011484((uint64_t)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL, (uint64_t *)&unk_1000B0040);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_timerObserverIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_keyColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_compressedRunningHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_compressedPausedHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_expandedLabelHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_expandedCountdownHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_expandedTimerAlertingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_voiceOverTimer));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_compactCountdownAnimation));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_minimalCountdownAnimation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_pausePlayPackage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_stopButton));
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10ClockAngel30TimerApertureElementController *v4;

  v4 = self;
  sub_10006AE04(a3);

}

- (void)playPausedAction
{
  _TtC10ClockAngel30TimerApertureElementController *v2;

  v2 = self;
  sub_1000700A0();

}

- (void)stopAction
{
  _TtC10ClockAngel30TimerApertureElementController *v2;

  v2 = self;
  sub_10007067C();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC10ClockAngel30TimerApertureElementController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100070A14(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)collapse
{
  _TtC10ClockAngel30TimerApertureElementController *v2;
  id v3;

  v2 = self;
  v3 = -[TimerApertureElementController systemApertureElementContext](v2, "systemApertureElementContext");
  objc_msgSend(v3, "requestTransitionToPreferredLayoutMode");

  swift_unknownObjectRelease(v3);
}

- (_TtC10ClockAngel30TimerApertureElementController)init
{
  _TtC10ClockAngel30TimerApertureElementController *result;

  result = (_TtC10ClockAngel30TimerApertureElementController *)_swift_stdlib_reportUnimplementedInitializer("ClockAngel.TimerApertureElementController", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC10ClockAngel30TimerApertureElementController *v6;

  v5 = a3;
  v6 = self;
  sub_1000738F0(a3);

}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10ClockAngel30TimerApertureElementController *v9;
  Class isa;
  objc_class *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  Class v15;
  objc_super v17;

  v5 = type metadata accessor for DateInterval(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = DateInterval._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for TimerApertureElementController(0);
  v17.receiver = v9;
  v17.super_class = v11;
  v12 = -[TimerApertureElementController _timelinesForDateInterval:](&v17, "_timelinesForDateInterval:", isa);

  v13 = sub_100015494(0, (unint64_t *)&unk_1000B2E30, BLSAlwaysOnTimeline_ptr);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return v15;
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _TtC10ClockAngel30TimerApertureElementController *v12;
  objc_super v13;
  _QWORD aBlock[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1000A1B78, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject(&unk_1000A1BA0, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_100073E58;
  *(_QWORD *)(v8 + 24) = v7;
  aBlock[4] = sub_10004B868;
  v15 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C5FC;
  aBlock[3] = &unk_1000A1BB8;
  v9 = _Block_copy(aBlock);
  v10 = v15;
  v11 = a3;
  v12 = self;
  swift_retain(v7);
  swift_release(v10);
  v13.receiver = v12;
  v13.super_class = (Class)type metadata accessor for TimerApertureElementController(0);
  -[TimerApertureElementController _updateWithFrameSpecifier:completion:](&v13, "_updateWithFrameSpecifier:completion:", v11, v9);
  _Block_release(v9);

  swift_release(v7);
}

@end
