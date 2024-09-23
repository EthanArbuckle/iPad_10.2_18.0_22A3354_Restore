@implementation IdentityProofingErrorRetryViewController

- (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F6C1F0();
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI40IdentityProofingErrorRetryViewController *v2;

  v2 = self;
  sub_213F6AB2C();

}

- (BOOL)inWatchModeOnly
{
  return ((*(_QWORD **)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_proofingFlowManager))[17] & 3) == 2;
}

- (void)configureFonts
{
  _TtC9CoreIDVUI40IdentityProofingErrorRetryViewController *v2;

  v2 = self;
  sub_213F6B9CC();

}

- (void)primaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_primaryButtonTargetAction);
}

- (void)secondaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_secondaryButtonTargetAction);
}

- (void)bodyButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_bodyButtonTargetAction);
}

- (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI40IdentityProofingErrorRetryViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI40IdentityProofingErrorRetryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_viewConfig);
  swift_release();
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_primaryButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_secondaryButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController_bodyButtonTargetAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI40IdentityProofingErrorRetryViewController____lazy_storage___bodyButton));
}

@end
