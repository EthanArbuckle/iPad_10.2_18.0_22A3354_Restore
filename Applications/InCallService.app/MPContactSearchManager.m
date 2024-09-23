@implementation MPContactSearchManager

- (MPContactSearchManager)initWithType:(int64_t)a3 contactStore:(id)a4
{
  id v6;

  v6 = a4;
  return (MPContactSearchManager *)sub_100171B0C(a3, a4);
}

- (NSArray)contacts
{
  MPContactSearchManager *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_100171E88();

  sub_10010BBE8(0, (unint64_t *)&unk_1002D8380, CNContact_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)searchFor:(NSString *)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  NSString *v10;
  MPContactSearchManager *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10028BC60, 48, 7);
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_10018236C((uint64_t)&unk_1002DA8D8, v9);
}

- (void)cancelPreviousSearch
{
  MPContactSearchManager *v2;

  v2 = self;
  sub_1001739B8();

}

- (MPContactSearchManager)init
{
  sub_100173B3C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100135FA0(OBJC_IVAR___MPContactSearchManager_featureFlags);
  sub_100135FA0(OBJC_IVAR___MPContactSearchManager____lazy_storage___ranker);
  sub_100135FA0(OBJC_IVAR___MPContactSearchManager_accessQueue);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contactStore[OBJC_IVAR___MPContactSearchManager__searchString]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___MPContactSearchManager__contactSearchResults));
  v3 = (char *)self + OBJC_IVAR___MPContactSearchManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
