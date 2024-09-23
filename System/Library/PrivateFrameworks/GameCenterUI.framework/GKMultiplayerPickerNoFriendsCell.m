@implementation GKMultiplayerPickerNoFriendsCell

+ (NSString)reuseIdentifier
{
  void *v2;

  static GKMultiplayerPickerNoFriendsCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell *)sub_1AB5284B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell)initWithCoder:(id)a3
{
  sub_1AB528668();
}

- (id)addFriendsHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = GKMultiplayerPickerNoFriendsCell.addFriendsHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_27;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setAddFriendsHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell *v6;

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
  GKMultiplayerPickerNoFriendsCell.addFriendsHandler.setter((uint64_t)v4, v5);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell *v5;
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
  double v17;
  JUMeasurements result;

  swift_unknownObjectRetain();
  v5 = self;
  GKMultiplayerPickerNoFriendsCell.measurements(fitting:in:)();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

+ (double)itemHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4
{
  double v5;

  swift_unknownObjectRetain();
  v5 = static GKMultiplayerPickerNoFriendsCell.itemHeight(fitting:in:)((uint64_t)a4);
  swift_unknownObjectRelease();
  return v5;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell *v2;

  v2 = self;
  GKMultiplayerPickerNoFriendsCell.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell_noFriendsView));
}

@end
