@implementation OverlappingPlayersPhotoView

- (double)overlapPercentage
{
  return sub_1AB5F3C50();
}

- (void)setOverlapPercentage:(double)a3
{
  sub_1AB5F3CB0(a3);
}

- (_TtC12GameCenterUI27OverlappingPlayersPhotoView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27OverlappingPlayersPhotoView *)OverlappingPlayersPhotoView.init(frame:)();
}

- (_TtC12GameCenterUI27OverlappingPlayersPhotoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5F3F8C();
}

- (NSArray)playerViews
{
  void *v2;

  sub_1AB5F40A8();
  sub_1AB46D7C0(0, &qword_1EEC02DD8);
  v2 = (void *)sub_1AB7DB0E0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setPlayerViews:(id)a3
{
  uint64_t v4;
  _TtC12GameCenterUI27OverlappingPlayersPhotoView *v5;

  sub_1AB46D7C0(0, &qword_1EEC02DD8);
  v4 = sub_1AB7DB0EC();
  v5 = self;
  sub_1AB5F4124(v4);

}

+ (double)knockoutAvatarSpace
{
  return 2.0;
}

- (BOOL)enableKnockoutSpace
{
  return sub_1AB5F4480() & 1;
}

- (void)setEnableKnockoutSpace:(BOOL)a3
{
  sub_1AB5F44E4(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI27OverlappingPlayersPhotoView *v3;
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

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI27OverlappingPlayersPhotoView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1AB5F45AC();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI27OverlappingPlayersPhotoView *v2;

  v2 = self;
  sub_1AB5F4720();

}

- (void)applyWithPlayerAvatars:(id)a3
{
  _TtC12GameCenterUI27OverlappingPlayersPhotoView *v4;

  sub_1AB46D7C0(0, (unint64_t *)&qword_1EEBFC5B8);
  sub_1AB7DB0EC();
  v4 = self;
  sub_1AB5F48E4();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
