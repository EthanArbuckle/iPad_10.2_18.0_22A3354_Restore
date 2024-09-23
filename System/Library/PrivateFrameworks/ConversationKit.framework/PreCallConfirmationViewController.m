@implementation PreCallConfirmationViewController

- (_TtC15ConversationKit33PreCallConfirmationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PreCallConfirmationViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit33PreCallConfirmationViewController *v2;

  v2 = self;
  PreCallConfirmationViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15ConversationKit33PreCallConfirmationViewController *v4;

  v4 = self;
  PreCallConfirmationViewController.viewWillAppear(_:)(a3);

}

- (_TtC15ConversationKit33PreCallConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  PreCallConfirmationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_confirmationCancel));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_confirmationCompletion));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController____lazy_storage___videoPreview);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController____lazy_storage___buttonsView);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController____lazy_storage___statusView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_callCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33PreCallConfirmationViewController_service);
}

@end
