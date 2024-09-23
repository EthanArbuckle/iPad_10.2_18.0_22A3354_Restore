@implementation ParticipantGridViewController

- (_TtC15ConversationKit29ParticipantGridViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantGridViewController.init(coder:)();
}

- (void)loadView
{
  _TtC15ConversationKit29ParticipantGridViewController *v2;

  v2 = self;
  ParticipantGridViewController.loadView()();

}

- (void)viewDidLoad
{
  _TtC15ConversationKit29ParticipantGridViewController *v2;

  v2 = self;
  ParticipantGridViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)forceBumpPriority
{
  _TtC15ConversationKit29ParticipantGridViewController *v2;

  v2 = self;
  ParticipantGridViewController.forceBumpPriority()();

}

- (_TtC15ConversationKit29ParticipantGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ParticipantGridViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21_32();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_forceAudioPriorityButton));
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_focusedParticipant);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_sashedParticipant);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_selectedParticipant);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_fullScreenFocusedParticipant);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_participantsViewControllerDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_participantGridViewControllerDelegate);
}

@end
