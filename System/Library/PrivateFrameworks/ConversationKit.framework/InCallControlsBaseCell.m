@implementation InCallControlsBaseCell

- (UILabel)titleLabel
{
  return (UILabel *)InCallControlsBaseCell.titleLabel.getter();
}

- (_TtC15ConversationKit19InCallControlButton)button
{
  return (_TtC15ConversationKit19InCallControlButton *)InCallControlsBaseCell.button.getter();
}

- (_TtC15ConversationKit22InCallControlsBaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit22InCallControlsBaseCell *)InCallControlsBaseCell.init(frame:)();
}

- (_TtC15ConversationKit22InCallControlsBaseCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsBaseCell.init(coder:)();
}

- (void)didTapButton:(id)a3
{
  id v4;
  _TtC15ConversationKit22InCallControlsBaseCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsBaseCell.didTapButton(_:)();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit22InCallControlsBaseCell *v6;
  _TtC15ConversationKit22InCallControlsBaseCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  InCallControlsBaseCell.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_titleLabel));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_button);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_nameLabelFirstBaselineLayoutConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_nameLabelLastBaselineLayoutConstraint);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22InCallControlsBaseCell_delegate);
}

@end
