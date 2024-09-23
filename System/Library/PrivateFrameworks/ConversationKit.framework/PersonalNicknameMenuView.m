@implementation PersonalNicknameMenuView

- (_TtC15ConversationKit24PersonalNicknameMenuView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PersonalNicknameMenuView.init(coder:)();
}

- (void)didTapWithSender:(id)a3
{
  id v4;
  _TtC15ConversationKit24PersonalNicknameMenuView *v5;

  v4 = a3;
  v5 = self;
  PersonalNicknameMenuView.didTap(sender:)((UITapGestureRecognizer *)v5);

}

- (_TtC15ConversationKit24PersonalNicknameMenuView)initWithFrame:(CGRect)a3
{
  PersonalNicknameMenuView.init(frame:)();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_31((uint64_t)nicknamesDefaults.value._identifier_);
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + (unint64_t)nicknamesDefaults.value._container_));
  OUTLINED_FUNCTION_31(*(uint64_t *)&nicknamesDefaults.is_nil);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___nameLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___subtitleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___labelStackView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___containerStackView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView____lazy_storage___tapRecognizer);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24PersonalNicknameMenuView_personalNicknameMenuViewDelegate);
}

@end
