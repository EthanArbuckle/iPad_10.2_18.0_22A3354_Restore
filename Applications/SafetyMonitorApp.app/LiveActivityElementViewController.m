@implementation LiveActivityElementViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea) = a3;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)sub_10000463C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier);
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
  sub_1000046A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier);
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)sub_10000463C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier);
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  sub_1000046A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier);
}

- (NSURL)launchURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC16SafetyMonitorApp33LiveActivityElementViewController *v7;
  uint64_t v8;
  uint64_t v9;
  NSURL *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = sub_100009788(&qword_100019FF8);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1000047B0((uint64_t)v6);

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return (NSURL *)v11;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView));
}

- (void)viewDidLoad
{
  _TtC16SafetyMonitorApp33LiveActivityElementViewController *v2;

  v2 = self;
  sub_100004FE8();

}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _TtC16SafetyMonitorApp33LiveActivityElementViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100005948(a3);
  swift_unknownObjectRelease(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16SafetyMonitorApp33LiveActivityElementViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16SafetyMonitorApp33LiveActivityElementViewController *)sub_1000090D0(v5, v7, a4);
}

- (_TtC16SafetyMonitorApp33LiveActivityElementViewController)initWithCoder:(id)a3
{
  return (_TtC16SafetyMonitorApp33LiveActivityElementViewController *)sub_10000934C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->activeLayoutMode[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->activeLayoutMode[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_sessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet));
}

@end
