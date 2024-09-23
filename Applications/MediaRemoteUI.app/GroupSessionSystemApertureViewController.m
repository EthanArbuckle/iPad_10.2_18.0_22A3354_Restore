@implementation GroupSessionSystemApertureViewController

- (_TtC13MediaRemoteUI40GroupSessionSystemApertureViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000834C();
}

- (void)viewDidLoad
{
  _TtC13MediaRemoteUI40GroupSessionSystemApertureViewController *v2;

  v2 = self;
  sub_1000076E8();

}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode) = (Class)a3;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)0;
}

- (NSString)elementIdentifier
{
  _TtC13MediaRemoteUI40GroupSessionSystemApertureViewController *v2;
  NSString v3;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)preferredCustomLayout
{
  return 4;
}

- (unint64_t)presentationBehaviors
{
  return 2;
}

- (BOOL)preventsAutomaticDismissal
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (double)preferredHeightForBottomSafeArea
{
  return 44.0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext, a2);
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon));
  sub_1000082F0((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext);
}

@end
