@implementation APHiddenAppConfirmationViewController

- (_TtC15AppProtectionUI37APHiddenAppConfirmationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2362F8160();
}

- (_TtC15AppProtectionUI37APHiddenAppConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_2362F8160();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15AppProtectionUI37APHiddenAppConfirmationViewController *v4;

  v4 = self;
  sub_2362F7E28(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC15AppProtectionUI37APHiddenAppConfirmationViewController *v2;

  v2 = self;
  sub_2362F7F24();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_app));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button));
  sub_2362F5438((uint64_t)self + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate);
}

- (id)buttonTrayForAssistant:(id)a3
{
  id v4;
  _TtC15AppProtectionUI37APHiddenAppConfirmationViewController *v5;
  id result;
  id v7;
  id v8;

  v4 = a3;
  v5 = self;
  result = -[APHiddenAppConfirmationViewController view](v5, sel_view);
  if (result)
  {
    v7 = result;
    type metadata accessor for APWelcomeControllerWithBraveButtonTrayView();
    v8 = objc_retainAutoreleaseReturnValue(*(id *)(swift_dynamicCastClassUnconditional()
                                                 + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
