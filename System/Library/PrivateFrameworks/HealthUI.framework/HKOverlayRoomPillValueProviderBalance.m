@implementation HKOverlayRoomPillValueProviderBalance

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  HKOverlayRoomPillValueProviderBalance *v15;
  void *v16;
  void *v17;

  sub_1D7ACBA64();
  v11 = sub_1D7B4A4AC();
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = self;
  sub_1D7B34CD0(v11);
  v17 = v16;

  swift_bridgeObjectRelease();
  return v17;
}

- (HKOverlayRoomPillValueProviderBalance)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OverlayRoomPillValueProviderBalance();
  return -[HKOverlayRoomPillValueProviderBalance init](&v3, sel_init);
}

@end
