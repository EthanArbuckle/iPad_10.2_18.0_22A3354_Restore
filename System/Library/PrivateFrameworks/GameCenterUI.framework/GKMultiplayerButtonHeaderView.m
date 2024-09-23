@implementation GKMultiplayerButtonHeaderView

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithCancelButtonHandler:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  if (v3)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v3;
    v3 = sub_1AB4E3E6C;
  }
  return (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView *)GKMultiplayerButtonHeaderView.init(cancelButtonHandler:)((uint64_t)v3);
}

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithMinimumValue:(int64_t)a3 maximumValue:(int64_t)a4 initialValue:(int64_t)a5 cancelButtonHandler:(id)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)();

  v8 = _Block_copy(a6);
  if (v8)
  {
    v10 = v8;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v12 = sub_1AB48638C;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  return (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView *)GKMultiplayerButtonHeaderView.init(minimumValue:maximumValue:initialValue:cancelButtonHandler:)(a3, a4, v9, (uint64_t)v12, v11);
}

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4E2E2C();
}

- (void)wantsMaterialBackgroundWithScrollOffset:(double)a3
{
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v3;

  v3 = self;
  GKMultiplayerButtonHeaderView.wantsMaterialBackground(scrollOffset:)();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v7;
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

  width = a3.width;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1AB4E3B3C((uint64_t)a4, (char *)v7, width);
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
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = GKMultiplayerButtonHeaderView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v2;

  v2 = self;
  GKMultiplayerButtonHeaderView.layoutSubviews()();

}

- (void)applyGame:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v5;

  v4 = a3;
  v5 = self;
  GKMultiplayerButtonHeaderView.apply(game:)(v4);

}

- (void)updateCountWithMinPlayers:(int64_t)a3 maxPlayers:(int64_t)a4
{
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v6;

  v6 = self;
  GKMultiplayerButtonHeaderView.updateCount(minPlayers:maxPlayers:)(a3, a4);

}

- (void)cancelPressed:(id)a3
{
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v4;
  _TtC12GameCenterUI29GKMultiplayerButtonHeaderView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB4E3968();

  sub_1AB46D6B8((uint64_t)v6);
}

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithFrame:(CGRect)a3
{
  GKMultiplayerButtonHeaderView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_titleLabel));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_playerCountLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_iconView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_cancelButton);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_cancelButtonHandler));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_backgroundView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_bottomSeparator));
}

@end
