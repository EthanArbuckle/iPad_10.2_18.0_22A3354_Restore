@implementation VideoReactionPickerViewController

- (_TtC15ConversationKit33VideoReactionPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  VideoReactionPickerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit33VideoReactionPickerViewController *v2;

  v2 = self;
  VideoReactionPickerViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit33VideoReactionPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  VideoReactionPickerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33VideoReactionPickerViewController_reactionPickerBubble, &demangling cache variable for type metadata for VideoReactionPickerBubble?);
  OUTLINED_FUNCTION_0();
}

@end
