@implementation SuggestedRouteSystemApertureViewController

- (void)loadView
{
  _TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_10001D684();
  -[SuggestedRouteSystemApertureViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  _TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController *v2;

  v2 = self;
  sub_10001D814();

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
  return (BNPresentableContext *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext, a2);
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext, a3);
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (int64_t)presentableBehavior
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableBehavior);
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_activeLayoutMode) = (Class)a3;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)sub_10001DC98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier);
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)sub_10001DC98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_elementIdentifier));
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_contentRole);
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_maximumLayoutMode);
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredLayoutMode);
}

- (int64_t)preferredCustomLayout
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredCustomLayout);
}

- (unint64_t)presentationBehaviors
{
  return 1;
}

- (BOOL)preventsAutomaticDismissal
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView));
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredHeightForBottomSafeArea) = a3;
}

- (_TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001E138();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView));
  sub_1000082F0((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.delegate[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.delegate[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView));
}

@end
