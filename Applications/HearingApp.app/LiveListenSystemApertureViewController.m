@implementation LiveListenSystemApertureViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_maximumLayoutMode) = (Class)a3;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier) = (Class)a3;
  v3 = a3;

}

- (NSString)associatedAppBundleIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->activeLayoutMode[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->activeLayoutMode[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier], a2);
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
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier);
  v7 = *(_QWORD *)&self->activeLayoutMode[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_statusBarStyleOverridesToSuppress);
}

- (void)setStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_statusBarStyleOverridesToSuppress) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredHeightForBottomSafeArea) = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor));
}

- (void)viewDidLoad
{
  _TtC10HearingApp38LiveListenSystemApertureViewController *v2;

  v2 = self;
  sub_1000025B4();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC10HearingApp38LiveListenSystemApertureViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100004654(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10HearingApp38LiveListenSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10HearingApp38LiveListenSystemApertureViewController *)sub_100004A48(v5, v7, a4);
}

- (_TtC10HearingApp38LiveListenSystemApertureViewController)initWithCoder:(id)a3
{
  return (_TtC10HearingApp38LiveListenSystemApertureViewController *)sub_100004D08(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier));
  swift_bridgeObjectRelease(*(_QWORD *)&self->activeLayoutMode[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor));
}

@end
