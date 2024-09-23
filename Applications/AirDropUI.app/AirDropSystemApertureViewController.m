@implementation AirDropSystemApertureViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  _TtC9AirDropUI35AirDropSystemApertureViewController *v4;

  v4 = self;
  sub_100057358(a3);

}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  uint64_t v2;
  _TtC9AirDropUI35AirDropSystemApertureViewController *v3;
  uint64_t v4;
  int64_t v5;

  if (self->airDropTransferSession[OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_overridePreferredLayoutMode] != 1)
    return *(int64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_overridePreferredLayoutMode);
  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropTransferSession);
  v3 = self;
  v4 = swift_retain(v2);
  v5 = sub_1000574A0(v4);

  swift_release(v2);
  return v5;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_maximumLayoutMode) = (Class)a3;
}

- (BOOL)preventsInteractiveDismissal
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_preventsInteractiveDismissal);
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_preventsInteractiveDismissal) = a3;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier) = (Class)a3;
  v3 = a3;

}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor));
}

- (void)setKeyColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor) = (Class)a3;
  v3 = a3;

}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_progressView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconMitosisView));
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)0;
}

- (_TtC9AirDropUI35AirDropSystemApertureViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10005CC6C();
}

- (void)viewDidLoad
{
  _TtC9AirDropUI35AirDropSystemApertureViewController *v2;

  v2 = self;
  sub_100058798();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9AirDropUI35AirDropSystemApertureViewController *v4;

  v4 = self;
  sub_100059A30(a3);

}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  _TtC9AirDropUI35AirDropSystemApertureViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100059C10(a3);
  swift_unknownObjectRelease(a3);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI35AirDropSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9AirDropUI35AirDropSystemApertureViewController *result;

  v4 = a4;
  result = (_TtC9AirDropUI35AirDropSystemApertureViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.AirDropSystemApertureViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropTransferSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropPlatterView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropPlatterViewCustomModeLayoutConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconViewDefaultModeLayoutConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_progressView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_progressViewDefaultModeLayoutConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconMitosisView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconMitosisViewMinimalModeLayoutConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_cancellableObservers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor));
}

@end
