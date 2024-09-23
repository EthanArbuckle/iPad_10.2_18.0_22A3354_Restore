@implementation InCallControlsOpenMessagesCell

- (_TtC15ConversationKit30InCallControlsOpenMessagesCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit30InCallControlsOpenMessagesCell *)InCallControlsOpenMessagesCell.init(frame:)();
}

- (_TtC15ConversationKit30InCallControlsOpenMessagesCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsOpenMessagesCell.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit30InCallControlsOpenMessagesCell *v6;
  _TtC15ConversationKit30InCallControlsOpenMessagesCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  InCallControlsOpenMessagesCell.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30InCallControlsOpenMessagesCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallControlsOpenMessagesCell_buttonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30InCallControlsOpenMessagesCell_openMessagesButton));
}

@end
