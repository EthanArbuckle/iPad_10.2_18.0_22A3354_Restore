@implementation ConversationHUDDetailsViewController

- (BOOL)isOnScreen
{
  return ConversationHUDDetailsViewController.isOnScreen.getter() & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
  _TtC15ConversationKit36ConversationHUDDetailsViewController *v4;

  v4 = self;
  ConversationHUDDetailsViewController.isOnScreen.setter(a3);

}

- (_TtC15ConversationKit36ConversationHUDDetailsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDDetailsViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit36ConversationHUDDetailsViewController *v2;

  v2 = self;
  ConversationHUDDetailsViewController.viewDidLoad()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ConversationKit36ConversationHUDDetailsViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  ConversationHUDDetailsViewController.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit36ConversationHUDDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ConversationHUDDetailsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit36ConversationHUDDetailsViewController_detailsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit36ConversationHUDDetailsViewController_controlsManager));
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit36ConversationHUDDetailsViewController_linkShareCoordinator, (uint64_t *)&demangling cache variable for type metadata for LinkShareCoordinatorProtocol?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit36ConversationHUDDetailsViewController_detailsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit36ConversationHUDDetailsViewController_peoplePickerViewController));
}

- (void)dismissPeoplePicker
{
  _TtC15ConversationKit36ConversationHUDDetailsViewController *v2;

  v2 = self;
  ConversationHUDDetailsViewController.dismissPeoplePicker()();

}

@end
