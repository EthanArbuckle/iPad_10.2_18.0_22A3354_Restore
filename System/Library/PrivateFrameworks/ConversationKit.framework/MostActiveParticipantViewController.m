@implementation MostActiveParticipantViewController

- (int64_t)frontBoardInterfaceOrientation
{
  return MostActiveParticipantViewController.frontBoardInterfaceOrientation.getter();
}

- (void)setFrontBoardInterfaceOrientation:(int64_t)a3
{
  MostActiveParticipantViewController.frontBoardInterfaceOrientation.setter(a3);
}

- (_TtC15ConversationKit35MostActiveParticipantViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  MostActiveParticipantViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC15ConversationKit35MostActiveParticipantViewController *v2;

  v2 = self;
  MostActiveParticipantViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit35MostActiveParticipantViewController *v2;

  v2 = self;
  MostActiveParticipantViewController.viewDidLayoutSubviews()();

}

- (_TtC15ConversationKit35MostActiveParticipantViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  MostActiveParticipantViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of AccountUpdateNotice((uint64_t)self + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController_localParticipant, type metadata accessor for Participant);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController_focusedParticipant, &demangling cache variable for type metadata for Participant?);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController_participantsViewControllerDelegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___remoteParticipantView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___localParticipantView);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___flashView);
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___insulatingView));
}

@end
