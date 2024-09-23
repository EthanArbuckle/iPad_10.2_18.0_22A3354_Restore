@implementation ConversationControlsShareCardViewController

- (_TtC15ConversationKit43ConversationControlsShareCardViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationControlsShareCardViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  self;
  ConversationControlsShareCardViewController.viewDidLoad()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v4;

  v4 = self;
  ConversationControlsShareCardViewController.viewDidDisappear(_:)(a3);

}

- (int64_t)modalPresentationStyle
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v2;
  id v3;

  v2 = self;
  v3 = ConversationControlsShareCardViewController.modalPresentationStyle.getter();

  return (int64_t)v3;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v4;

  v4 = self;
  ConversationControlsShareCardViewController.modalPresentationStyle.setter(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v2;

  v2 = self;
  ConversationControlsShareCardViewController.viewDidLayoutSubviews()();

}

- (void)didTapScreenShareButton
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v2;

  v2 = self;
  ConversationControlsShareCardViewController.didTapScreenShareButton()();

}

- (void)didTapAskToScreenShareButton:(id)a3
{
  id v5;
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v6;

  v5 = a3;
  v6 = self;
  ConversationControlsShareCardViewController.didTapAskToScreenShareButton(_:)(a3);

}

- (void)didTapCollaborateButton
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v2;

  v2 = self;
  ConversationControlsShareCardViewController.didTapCollaborateButton()();

}

- (void)didTapCloseButton
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v2;

  v2 = self;
  ConversationControlsShareCardViewController.didTapCloseButton()();

}

- (void)didTapEndSharePlay
{
  _TtC15ConversationKit43ConversationControlsShareCardViewController *v2;

  v2 = self;
  ConversationControlsShareCardViewController.didTapEndSharePlay()();

}

- (_TtC15ConversationKit43ConversationControlsShareCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ConversationControlsShareCardViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController_delegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController_conversationControlsManager);
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController_updateSheetDetent));
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___backgroundMaterialView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___headerView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___closeButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___scrollView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___scrollViewContent);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___controlsView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___sharePlayDiscoverabilityView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___gelatoDiscoverabilityView));
}

@end
