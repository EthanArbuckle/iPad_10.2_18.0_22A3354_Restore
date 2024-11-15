@implementation StopwatchApertureController

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_presentationBehaviors) = (Class)a3;
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  _TtC10ClockAngel27StopwatchApertureController *v2;
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
  v3 = -[StopwatchApertureController view](v2, "view");
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
    if (qword_1000AED10 != -1)
      swift_once(&qword_1000AED10, sub_100074524);
    v16 = *(double *)&qword_1000B7030;

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
  v6 = (char *)self + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_launchURL;
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
  _TtC10ClockAngel27StopwatchApertureController *v11;
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
  v10 = (char *)self + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_launchURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_launchURL, v13, 33, 0);
  v11 = self;
  sub_1000267F0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (NSString)associatedAppBundleIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.stopwatchId[OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_associatedAppBundleIdentifier];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->super.stopwatchId[OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_associatedAppBundleIdentifier]);
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_associatedAppBundleIdentifier);
  v7 = *(_QWORD *)&self->super.stopwatchId[OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_associatedAppBundleIdentifier];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_elementIdentifier) = (Class)a3;
  v3 = a3;

}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_keyColor));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC10ClockAngel27StopwatchApertureController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100076E50(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  _TtC10ClockAngel27StopwatchApertureController *v14;

  v14 = self;
  sub_100077764(a7, a8, a3, a4, a5, a6);

}

- (void)didPauseLapTimer
{
  _TtC10ClockAngel27StopwatchApertureController *v2;

  v2 = self;
  sub_100077AA8();

}

- (void)didResumeLapTimer
{
  _TtC10ClockAngel27StopwatchApertureController *v2;

  v2 = self;
  sub_100077C94();

}

- (_TtC10ClockAngel27StopwatchApertureController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel27StopwatchApertureController *)sub_100078220(a3);
}

- (_TtC10ClockAngel27StopwatchApertureController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10ClockAngel27StopwatchApertureController *)sub_1000785F4(v5, v7, a4);
}

- (void).cxx_destruct
{
  sub_100011484((uint64_t)self + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_launchURL, (uint64_t *)&unk_1000B0040);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.stopwatchId[OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_associatedAppBundleIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.stopwatchId[OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_timerObserverIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_keyColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_compressedLeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_compressedTrailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_customLeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_customTrailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_customTrailingLapView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_customTrailingTimeView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_compressedAnimation));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel27StopwatchApertureController_minimalAnimation));
}

@end
