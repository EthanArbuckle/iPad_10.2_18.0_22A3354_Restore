@implementation IdentityProofingStatePendingViewController

- (void)viewDidLayoutSubviews
{
  _TtC9CoreIDVUI42IdentityProofingStatePendingViewController *v2;

  v2 = self;
  sub_213F79384();

}

- (void)primaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_primaryButtonClickedAction);
}

- (void)secondaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_secondaryButtonClickedAction);
}

- (void)tertiaryButtonClicked
{
  sub_213F6C010((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_tertiaryButtonClickedAction);
}

- (void)configureFonts
{
  _TtC9CoreIDVUI42IdentityProofingStatePendingViewController *v2;

  v2 = self;
  sub_213F789FC();

}

- (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_213FF9458();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController *)sub_213F7975C(v5, v7, a4);
}

- (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI42IdentityProofingStatePendingViewController *)sub_213F798DC(a3);
}

- (void).cxx_destruct
{
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_primaryButtonClickedAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_secondaryButtonClickedAction));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_tertiaryButtonClickedAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController____lazy_storage___tertiaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI42IdentityProofingStatePendingViewController_imageView));
}

@end
