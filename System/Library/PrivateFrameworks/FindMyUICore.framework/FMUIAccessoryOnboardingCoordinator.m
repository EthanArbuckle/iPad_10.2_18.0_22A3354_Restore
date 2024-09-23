@implementation FMUIAccessoryOnboardingCoordinator

- (FMUIAccessoryOnboardingCoordinatorDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_delegate;
  swift_beginAccess();
  return (FMUIAccessoryOnboardingCoordinatorDelegate *)(id)MEMORY[0x24260DA50](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (FMUIAccessoryOnboardingCoordinator)initWithPresenter:(id)a3 accessory:(id)a4
{
  return (FMUIAccessoryOnboardingCoordinator *)AccessoryOnboardingCoordinator.init(presenter:accessory:)(a3, a4);
}

- (FMUIAccessoryOnboardingCoordinator)initWithPopoverPresenter:(id)a3 accessory:(id)a4
{
  return (FMUIAccessoryOnboardingCoordinator *)AccessoryOnboardingCoordinator.init(presenter:accessory:)(a3, a4);
}

- (BOOL)shouldShowFMOnboardingFlow
{
  FMUIAccessoryOnboardingCoordinator *v2;
  id v3;
  void *v4;
  char ApplePencil;

  v2 = self;
  swift_retain();
  v3 = (id)MobileGestalt_get_current_device();
  if (v3)
  {
    v4 = v3;
    ApplePencil = MobileGestalt_get_deviceSupportsFindApplePencil();

    swift_release();
    LOBYTE(v3) = ApplePencil;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (void)start
{
  FMUIAccessoryOnboardingCoordinator *v2;

  v2 = self;
  AccessoryOnboardingCoordinator.start()();

}

- (FMUIAccessoryOnboardingCoordinator)init
{
  FMUIAccessoryOnboardingCoordinator *result;

  result = (FMUIAccessoryOnboardingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23BB01658((uint64_t)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  sub_23B989D60((uint64_t)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_viewModel, &qword_256A642C0);
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___FMUIAccessoryOnboardingCoordinator_logger;
  v4 = sub_23BB891C4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
