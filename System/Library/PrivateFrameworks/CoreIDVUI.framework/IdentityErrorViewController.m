@implementation IdentityErrorViewController

- (_TtC9CoreIDVUI27IdentityErrorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213FB37AC();
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI27IdentityErrorViewController *v2;

  v2 = self;
  sub_213FB1D88();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for IdentityErrorViewController();
  v4 = (char *)v7.receiver;
  -[IdentityErrorViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingToParentViewController, v7.receiver, v7.super_class))
  {
    v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
    if (v5)
    {
      v6 = swift_retain();
      v5(v6);
      sub_213F4BE68((uint64_t)v5);
    }
  }

}

- (void)configureFonts
{
  _TtC9CoreIDVUI27IdentityErrorViewController *v2;

  v2 = self;
  sub_213FB2DF4();

}

- (void)primaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction);
}

- (void)secondaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction);
}

- (_TtC9CoreIDVUI27IdentityErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9CoreIDVUI27IdentityErrorViewController *result;

  v4 = a4;
  result = (_TtC9CoreIDVUI27IdentityErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_tertiaryButtonTargetAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___bottomTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController____lazy_storage___secondaryButton));
}

@end
