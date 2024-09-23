@implementation WDClinicalAccountAddedViewController

- (id)dismissHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___WDClinicalAccountAddedViewController_dismissHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC39BE70;
  aBlock[3] = &block_descriptor_46;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1BC486A8C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WDClinicalAccountAddedViewController_dismissHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1BC36D770(v7);
}

- (WDClinicalAccountAddedViewController)initWithOnboardingSession:(id)a3 account:(id)a4
{
  WDClinicalAccountAddedViewController *result;

  AccountAddedViewController.init(onboardingSession:account:)(a3, a4);
  return result;
}

- (void)viewDidLoad
{
  WDClinicalAccountAddedViewController *v2;

  v2 = self;
  sub_1BC4F89C0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountAddedViewController();
  v4 = v6.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1BC521AC8((uint64_t)sub_1BC4F9DE8, v5);

  swift_release_n();
}

- (void)hxui_primaryFooterButtonTapped
{
  WDClinicalAccountAddedViewController *v2;

  v2 = self;
  sub_1BC4F9024();

}

- (WDClinicalAccountAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  WDClinicalAccountAddedViewController *result;

  result = (WDClinicalAccountAddedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (WDClinicalAccountAddedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  WDClinicalAccountAddedViewController *result;

  v6 = a5;
  result = (WDClinicalAccountAddedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_notificationsManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___WDClinicalAccountAddedViewController____lazy_storage___brandView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC36D770(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___WDClinicalAccountAddedViewController_dismissHandler));
}

@end
