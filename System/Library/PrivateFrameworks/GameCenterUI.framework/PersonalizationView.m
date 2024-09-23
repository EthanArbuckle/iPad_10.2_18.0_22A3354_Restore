@implementation PersonalizationView

- (_TtC12GameCenterUI19PersonalizationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5E559C();
}

- (void)dealloc
{
  _TtC12GameCenterUI19PersonalizationView *v2;

  v2 = self;
  sub_1AB5E5BD0();
}

- (void).cxx_destruct
{
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_delegate);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_editAvatarView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_reachability);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_nicknameContainer);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_nicknameTextField);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_nicknameMessageLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_activityIndicator);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_primaryTrayButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_gameCenterIcon);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19PersonalizationView_avatarContainer));
}

- (void)primaryAction
{
  _TtC12GameCenterUI19PersonalizationView *v2;

  v2 = self;
  sub_1AB5E5D08();

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI19PersonalizationView *v2;

  v2 = self;
  sub_1AB5E5DAC();

}

- (void)nicknameCancelAction
{
  _TtC12GameCenterUI19PersonalizationView *v2;

  v2 = self;
  sub_1AB5E605C();

}

@end
