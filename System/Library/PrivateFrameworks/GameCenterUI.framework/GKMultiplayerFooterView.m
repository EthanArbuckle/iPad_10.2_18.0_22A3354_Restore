@implementation GKMultiplayerFooterView

- (_TtC12GameCenterUI23GKMultiplayerFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI23GKMultiplayerFooterView *)GKMultiplayerFooterView.init(frame:)();
}

- (_TtC12GameCenterUI23GKMultiplayerFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB504748();
}

- (void)wantsMaterialBackgroundWithScrollOffset:(double)a3
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v3;

  v3 = self;
  sub_1AB50481C();

}

- (BOOL)startGameButtonEnabled
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB504B24();

  return v3 & 1;
}

- (void)setStartGameButtonEnabled:(BOOL)a3
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v4;

  v4 = self;
  sub_1AB504B70(a3);

}

- (BOOL)inviteFriendsButtonEnabled
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB504CA8();

  return v3 & 1;
}

- (void)setInviteFriendsButtonEnabled:(BOOL)a3
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v4;

  v4 = self;
  sub_1AB504D34(a3);

}

- (BOOL)inviteFriendsButtonHidden
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB504E38();

  return v3 & 1;
}

- (void)setInviteFriendsButtonHidden:(BOOL)a3
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v3;

  v3 = self;
  sub_1AB504EA0();

}

- (NSString)primaryButtonTitle
{
  return (NSString *)sub_1AB472580(self, (uint64_t)a2, sub_1AB504F20);
}

- (void)setPrimaryButtonTitle:(id)a3
{
  sub_1AB504FB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB504F40);
}

- (NSString)secondaryButtonTitle
{
  return (NSString *)sub_1AB472580(self, (uint64_t)a2, sub_1AB504F90);
}

- (void)setSecondaryButtonTitle:(id)a3
{
  sub_1AB504FB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB505020);
}

- (NSString)footerStatusString
{
  return (NSString *)sub_1AB472580(self, (uint64_t)a2, sub_1AB5050D4);
}

- (void)setFooterStatusString:(id)a3
{
  sub_1AB504FB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB505150);
}

- (id)startGameHandler
{
  return sub_1AB5053E4((uint64_t)self, (uint64_t)a2, sub_1AB505210, (uint64_t)&block_descriptor_25);
}

- (void)setStartGameHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI23GKMultiplayerFooterView *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB4E3E6C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AB5052A4((uint64_t)v4, v5);

}

- (id)inviteFriendsHandler
{
  return sub_1AB5053E4((uint64_t)self, (uint64_t)a2, sub_1AB50545C, (uint64_t)&block_descriptor_20);
}

- (void)setInviteFriendsHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI23GKMultiplayerFooterView *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB48638C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_1AB505540((uint64_t)v4, v5);

}

- (void)configureUsing:(id)a3
{
  id v4;
  _TtC12GameCenterUI23GKMultiplayerFooterView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB50578C();

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v2;

  v2 = self;
  sub_1AB505838();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI23GKMultiplayerFooterView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1AB505E30(width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI23GKMultiplayerFooterView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1AB4941F0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)didTapButton:(id)a3
{
  sub_1AB506070(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1AB505FE8);
}

- (void)didTapSecondaryButton:(id)a3
{
  sub_1AB506070(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1AB506000);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_primaryButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_secondaryButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_statusLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_backgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_topSeparator);
  OUTLINED_FUNCTION_69_1(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_startGameHandler);
  OUTLINED_FUNCTION_69_1(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView_inviteFriendsHandler);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView____lazy_storage___secondaryButtonFocusGuide);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23GKMultiplayerFooterView____lazy_storage___primaryButtonFocusGuide));
}

@end
