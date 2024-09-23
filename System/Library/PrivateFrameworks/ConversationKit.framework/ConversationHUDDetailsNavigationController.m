@implementation ConversationHUDDetailsNavigationController

- (BOOL)isOnScreen
{
  _TtC15ConversationKit42ConversationHUDDetailsNavigationController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ConversationHUDDetailsNavigationController.isOnScreen.getter();

  return v3 & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
  _TtC15ConversationKit42ConversationHUDDetailsNavigationController *v4;

  v4 = self;
  ConversationHUDDetailsNavigationController.isOnScreen.setter(a3);

}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDDetailsNavigationController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit42ConversationHUDDetailsNavigationController *v2;

  v2 = self;
  ConversationHUDDetailsNavigationController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tapDoneButton
{
  _TtC15ConversationKit42ConversationHUDDetailsNavigationController *v2;

  v2 = self;
  ConversationHUDDetailsNavigationController.tapDoneButton()();

}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ConversationHUDDetailsNavigationController.init(navigationBarClass:toolbarClass:)();
}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithRootViewController:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDDetailsNavigationController.init(rootViewController:)();
}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ConversationHUDDetailsNavigationController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit42ConversationHUDDetailsNavigationController_detailsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit42ConversationHUDDetailsNavigationController_controlsManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit42ConversationHUDDetailsNavigationController_detailsViewController));
}

@end
