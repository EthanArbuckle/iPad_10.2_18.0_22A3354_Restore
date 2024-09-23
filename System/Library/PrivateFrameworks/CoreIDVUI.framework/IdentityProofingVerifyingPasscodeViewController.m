@implementation IdentityProofingVerifyingPasscodeViewController

- (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F3F140();
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityProofingVerifyingPasscodeViewController();
  v2 = v7.receiver;
  -[IdentityProofingVerifyingPasscodeViewController viewDidLoad](&v7, sel_viewDidLoad);
  sub_213F3D870();
  sub_213F3F7CC(0, &qword_254D5BE10);
  v3 = sub_213FF9680();
  MEMORY[0x2199C76AC](v3, sel_configureTextFieldViewColors);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5E6D0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_213FFBF20;
  v5 = sub_213FF8D50();
  v6 = MEMORY[0x24BEBCB18];
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  MEMORY[0x2199C76AC](v4, sel_updateUI_previousTraitCollection_);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *v4;

  v4 = self;
  sub_213F3C77C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *v2;

  v2 = self;
  sub_213F3D550();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingVerifyingPasscodeViewController();
  v4 = (char *)v5.receiver;
  -[IdentityProofingVerifyingPasscodeViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_thresholdTimer], sel_invalidate, v5.receiver, v5.super_class);

}

- (void)updateUI:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213F3F4DC(a4);

}

- (void)configureFonts
{
  _TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *v2;

  v2 = self;
  sub_213F3E678();

}

- (void)configureTextFieldViewColors
{
  _TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *v2;

  v2 = self;
  sub_213F3E934();

}

- (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_thresholdTimer));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_secondaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_imageViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController____lazy_storage___textFieldView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingVerifyingPasscodeViewController_config));
}

@end
