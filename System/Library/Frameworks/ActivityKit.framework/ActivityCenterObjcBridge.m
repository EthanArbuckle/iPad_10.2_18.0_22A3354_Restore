@implementation ActivityCenterObjcBridge

+ (_TtC11ActivityKit24ActivityCenterObjcBridge)shared
{
  if (qword_2542372D8 != -1)
    swift_once();
  return (_TtC11ActivityKit24ActivityCenterObjcBridge *)(id)qword_2542372D0;
}

- (_TtC11ActivityKit24ActivityCenterObjcBridge)init
{
  return (_TtC11ActivityKit24ActivityCenterObjcBridge *)sub_232E507F0();
}

- (BOOL)areActivitiesEnabled
{
  return _s11ActivityKit0A6CenterC23liveActivitiesSupportedSbvgZ_0() & 1;
}

- (id)observeDescriptorsWithHandler:(id)a3
{
  return sub_232E52418(self, (int)a2, a3, (uint64_t)&unk_25042DBA8, (uint64_t)sub_232E53004, (uint64_t (*)(uint64_t, uint64_t))sub_232E50A70);
}

- (BOOL)isActivityActiveWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11ActivityKit24ActivityCenterObjcBridge *v7;

  v4 = sub_232E6F1EC();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_232E50F4C(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)endActivity:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11ActivityKit24ActivityCenterObjcBridge *v7;

  v4 = sub_232E6F1EC();
  v6 = v5;
  v7 = self;
  sub_232E51154(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)disableActivitiesWithBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11ActivityKit24ActivityCenterObjcBridge *v7;

  v4 = sub_232E6F1EC();
  v6 = v5;
  v7 = self;
  sub_232E52AE8(v4, v6);

  swift_bridgeObjectRelease();
}

- (id)observeActivityContentUpdatesWithHandler:(id)a3
{
  return sub_232E52418(self, (int)a2, a3, (uint64_t)&unk_25042DB80, (uint64_t)sub_232DFD874, (uint64_t (*)(uint64_t, uint64_t))sub_232E51390);
}

- (id)observeActivitiesExceedingReducedPushBudgetWithHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC11ActivityKit24ActivityCenterObjcBridge *v6;
  id v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_232E50120((uint64_t)sub_232E52FA0, v5);

  swift_release();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end
