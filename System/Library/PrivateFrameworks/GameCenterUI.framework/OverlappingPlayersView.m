@implementation OverlappingPlayersView

- (double)overlapPercentage
{
  return sub_1AB547D54();
}

- (void)setOverlapPercentage:(double)a3
{
  sub_1AB547DA4(a3);
}

- (_TtC12GameCenterUI22OverlappingPlayersView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22OverlappingPlayersView *)OverlappingPlayersView.init(frame:)();
}

- (_TtC12GameCenterUI22OverlappingPlayersView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB547F54();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC12GameCenterUI22OverlappingPlayersView *v3;
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
  _TtC12GameCenterUI22OverlappingPlayersView *v5;
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
  v6 = sub_1AB548244();
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
  _TtC12GameCenterUI22OverlappingPlayersView *v2;

  v2 = self;
  sub_1AB5483B8();

}

- (void)applyWithPlayerAvatars:(id)a3 playerSize:(CGSize)a4
{
  double height;
  double width;
  unint64_t v7;
  _TtC12GameCenterUI22OverlappingPlayersView *v8;

  height = a4.height;
  width = a4.width;
  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFBCC0);
  v7 = sub_1AB7DB0EC();
  v8 = self;
  sub_1AB548600(v7, width, height);

  swift_bridgeObjectRelease();
}

- (void)prepareForReuse
{
  _TtC12GameCenterUI22OverlappingPlayersView *v2;

  v2 = self;
  sub_1AB548850();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
