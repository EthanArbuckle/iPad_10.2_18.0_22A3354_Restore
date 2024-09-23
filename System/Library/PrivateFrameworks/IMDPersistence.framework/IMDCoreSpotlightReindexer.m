@implementation IMDCoreSpotlightReindexer

- (IMDCoreSpotlightReindexer)initWithHandles:(id)a3 batchDeferralTime:(int64_t)a4 messageAge:(double)a5 index:(id)a6
{
  uint64_t v8;
  IMDCoreSpotlightReindexer *v9;

  v8 = sub_1ABC644A4();
  swift_unknownObjectRetain();
  v9 = (IMDCoreSpotlightReindexer *)sub_1ABC54880(v8, a4, (uint64_t)a6);
  swift_unknownObjectRelease();
  return v9;
}

- (void)reindex
{
  IMDCoreSpotlightReindexer *v2;

  v2 = self;
  SpotlightReindexer.reindex()();

}

- (IMDCoreSpotlightReindexer)init
{
  IMDCoreSpotlightReindexer *result;

  result = (IMDCoreSpotlightReindexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime;
  v4 = sub_1ABC64390();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___IMDCoreSpotlightReindexer_messageAge;
  v6 = sub_1ABC4DADC((uint64_t *)&unk_1EEC3F818);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
