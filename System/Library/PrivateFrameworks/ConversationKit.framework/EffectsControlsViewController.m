@implementation EffectsControlsViewController

- (BOOL)effectsButtonIsVisible
{
  char v2;

  EffectsControlsViewController.effectsButtonIsVisible.getter();
  return v2 & 1;
}

- (void)setEffectsButtonIsVisible:(BOOL)a3
{
  _TtC15ConversationKit29EffectsControlsViewController *v4;

  v4 = self;
  EffectsControlsViewController.effectsButtonIsVisible.setter(a3);

}

- (_TtC15ConversationKit19InCallControlButton)effectsButton
{
  return (_TtC15ConversationKit19InCallControlButton *)EffectsControlsViewController.effectsButton.getter();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit29EffectsControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  EffectsControlsViewController.init(coder:)();
}

- (_TtC15ConversationKit29EffectsControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  EffectsControlsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_effectsBrowserViewController));
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_effectsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_backgroundBlurView));
}

@end
