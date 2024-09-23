@implementation APLockedAppDisclosureViewController

- (_TtC15AppProtectionUI35APLockedAppDisclosureViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2362F85EC();
}

- (_TtC15AppProtectionUI35APLockedAppDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  sub_2362F85EC();
}

- (id)buttonTrayForAssistant:(id)a3
{
  id v4;
  _TtC15AppProtectionUI35APLockedAppDisclosureViewController *v5;
  id result;
  id v7;
  id v8;

  v4 = a3;
  v5 = self;
  result = -[APLockedAppDisclosureViewController view](v5, sel_view);
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

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APLockedAppDisclosureViewController();
  v2 = (char *)v5.receiver;
  -[APLockedAppDisclosureViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant];
  v4 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController], sel_scrollView, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_performAdjustmentsForScrollView_, v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button));
  sub_2362F5438((uint64_t)self + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate);
}

@end
