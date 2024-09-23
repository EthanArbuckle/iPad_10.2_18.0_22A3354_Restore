@implementation JSGameCenter

- (id)fetchFriendsThatPlayGame:(id)a3
{
  return sub_1D84DF148(self);
}

- (id)fetchAchievementSummaryForGame:(id)a3
{
  return sub_1D84DF148(self);
}

- (id)fetchRecentlyPlayedGamesWithinSeconds:(id)a3 :(int64_t)a4 :(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC19AppStoreKitInternal12JSGameCenter *v15;
  void *v16;
  void *v17;
  void *v18;
  _BYTE v20[16];
  uint64_t v21;
  uint64_t v22;
  _TtC19AppStoreKitInternal12JSGameCenter *v23;
  int64_t v24;
  int64_t v25;
  _BYTE *v26;

  v8 = sub_1D8928210();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_1D892ADB4();
  v14 = v13;
  sub_1D8929F14();
  v15 = self;
  sub_1D8929F08();
  sub_1D89281F8();
  sub_1D892B5F4();
  v16 = (void *)sub_1D8929F08();
  sub_1D89281EC();

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v17 = (void *)sub_1D892B870();
  v21 = v12;
  v22 = v14;
  v23 = v15;
  v24 = a4;
  v25 = a5;
  v26 = v11;
  v18 = (void *)sub_1D892B87C();

  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  return v18;
}

- (id)fetchGamesPopularWithFriends:(id)a3 :(int64_t)a4
{
  return sub_1D84E0968(self);
}

- (id)fetchActivityFeedCards:(id)a3 :(int64_t)a4
{
  return sub_1D84E0968(self);
}

- (id)fetchSuggestedFriends:(int64_t)a3
{
  uint64_t v3;
  _TtC19AppStoreKitInternal12JSGameCenter *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = qword_1EDA25820;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_1D892AA00();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EDA68040);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B010);
  sub_1D89295A8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8931D70;
  sub_1D8929518();
  sub_1D892A778();
  swift_bridgeObjectRelease();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v6 = (void *)sub_1D892B870();
  MEMORY[0x1E0C80A78](v6);
  v7 = (void *)sub_1D892B87C();

  return v7;
}

- (id)fetchRengagementDataForLocalPlayer
{
  _TtC19AppStoreKitInternal12JSGameCenter *v3;
  void *v4;
  void *v5;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v3 = self;
  v4 = (void *)sub_1D892B870();
  v5 = (void *)sub_1D892B87C();

  return v5;
}

- (id)fetchGameInfo:(id)a3
{
  _TtC19AppStoreKitInternal12JSGameCenter *v4;
  void *v5;
  void *v6;

  sub_1D892ADB4();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v4 = self;
  v5 = (void *)sub_1D892B870();
  v6 = (void *)sub_1D892B87C();

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC19AppStoreKitInternal12JSGameCenter)init
{
  _TtC19AppStoreKitInternal12JSGameCenter *result;

  result = (_TtC19AppStoreKitInternal12JSGameCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
