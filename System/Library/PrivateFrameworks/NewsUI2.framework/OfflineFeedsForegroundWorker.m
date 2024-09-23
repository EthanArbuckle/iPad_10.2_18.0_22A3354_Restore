@implementation OfflineFeedsForegroundWorker

- (_TtC7NewsUI228OfflineFeedsForegroundWorker)init
{
  _TtC7NewsUI228OfflineFeedsForegroundWorker *result;

  result = (_TtC7NewsUI228OfflineFeedsForegroundWorker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228OfflineFeedsForegroundWorker_offlineFeedsSupervisor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228OfflineFeedsForegroundWorker_offlineFeatures);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228OfflineFeedsForegroundWorker_sharedItemManager);
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t updated;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7NewsUI228OfflineFeedsForegroundWorker *v12;
  uint64_t v13;
  char v14;

  updated = type metadata accessor for OfflineFeedUpdateCondition(0);
  MEMORY[0x1E0C80A78](updated);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = 0;
  swift_storeEnumTagMultiPayload();
  v11 = a3;
  v12 = self;
  sub_1D64F051C(&v14, (uint64_t)v10);
  sub_1D64F156C((uint64_t)v10);

}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  uint64_t updated;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC7NewsUI228OfflineFeedsForegroundWorker *v10;
  uint64_t v11;
  char v12;

  updated = type metadata accessor for OfflineFeedUpdateCondition(0);
  MEMORY[0x1E0C80A78](updated);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 10;
  swift_storeEnumTagMultiPayload();
  v9 = a3;
  v10 = self;
  sub_1D64F051C(&v12, (uint64_t)v8);
  sub_1D64F156C((uint64_t)v8);

}

- (void)audioPlaylistDidChange:(id)a3
{
  uint64_t updated;
  uint64_t v5;
  char *v6;
  _TtC7NewsUI228OfflineFeedsForegroundWorker *v7;
  uint64_t v8;
  char v9;

  updated = type metadata accessor for OfflineFeedUpdateCondition(0);
  MEMORY[0x1E0C80A78](updated);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 9;
  swift_storeEnumTagMultiPayload();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1D64F051C(&v9, (uint64_t)v6);
  sub_1D64F156C((uint64_t)v6);
  swift_unknownObjectRelease();

}

- (void)networkReachabilityConnectivityDidChange:(id)a3
{
  _TtC7NewsUI228OfflineFeedsForegroundWorker *v3;

  if (a3)
  {
    v3 = self;
    if (objc_msgSend((id)swift_unknownObjectRetain(), sel_isNetworkReachable))
      sub_1D64F013C();
    swift_unknownObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

@end
