@implementation IdentityProofingViewController

- (UILabel)titleLabel
{
  _TtC9CoreIDVUI30IdentityProofingViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_213FD83DC();

  return (UILabel *)v3;
}

- (void)setTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel) = (Class)a3;
  v3 = a3;

}

- (UIImageView)imageView
{
  _TtC9CoreIDVUI30IdentityProofingViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_213FD89BC();

  return (UIImageView *)v3;
}

- (void)setImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView) = (Class)a3;
  v3 = a3;

}

- (_TtC9CoreIDVUI30IdentityProofingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213FDDEEC();
}

- (void)primaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction);
}

- (void)secondaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction);
}

- (void)cancelButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction);
}

- (void)tertiaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction);
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI30IdentityProofingViewController *v2;

  v2 = self;
  sub_213FDC698();

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v4 = v10.receiver;
  -[IdentityProofingViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  sub_213F5F2B8((uint64_t)v4 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v7);
  v5 = v8;
  v6 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 136))(v5, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  if ((v3 & 1) != 0)
    sub_213FD8DBC();

}

- (void)viewDidLayoutSubviews
{
  _TtC9CoreIDVUI30IdentityProofingViewController *v2;

  v2 = self;
  sub_213FDD204();

}

- (void)updateViewLayout:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC9CoreIDVUI30IdentityProofingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213FDD958(a4);

}

- (_TtC9CoreIDVUI30IdentityProofingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI30IdentityProofingViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI30IdentityProofingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView));
}

@end
