@implementation IdentityProofingExtendedReviewViewController

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingExtendedReviewViewController();
  v2 = v6.receiver;
  -[IdentityProofingExtendedReviewViewController viewDidLoad](&v6, sel_viewDidLoad);
  sub_213F46494();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5E6D0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_213FFBF20;
  v4 = sub_213FF8D50();
  v5 = MEMORY[0x24BEBCB18];
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  MEMORY[0x2199C76AC](v3, sel_configureFonts);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingExtendedReviewViewController();
  v4 = v5.receiver;
  -[IdentityProofingExtendedReviewViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_213FF8618();
  sub_213F4A688();
  swift_bridgeObjectRelease();

}

- (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F4AE6C();
}

- (void)configureFonts
{
  _TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController *v2;

  v2 = self;
  sub_213F474D0();

}

- (void)secondaryButtonClicked
{
  _TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController *v2;

  v2 = self;
  sub_213F490B4();

}

- (void)primaryButtonClicked
{
  _TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController *v2;

  v2 = self;
  sub_213F492D0();

}

- (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___tertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI44IdentityProofingExtendedReviewViewController____lazy_storage___secondaryButton));
}

@end
