@implementation GKMultiplayerPickerNearbyInstructionCell

- (_TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell *result;

  sub_1AB7A240C();
  return result;
}

- (_TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell)initWithCoder:(id)a3
{
  sub_1AB7A28A4();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell *v2;

  v2 = self;
  GKMultiplayerPickerNearbyInstructionCell.layoutSubviews()();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell *v5;
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
  GKMultiplayerPickerNearbyInstructionCell.measurements(fitting:in:)();
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
  void *v4;
  double v5;
  double v6;

  swift_getObjCClassMetadata();
  v4 = (void *)swift_unknownObjectRetain();
  static GKMultiplayerPickerNearbyInstructionCell.itemHeight(fitting:in:)(v4);
  v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell_textField));
}

@end
