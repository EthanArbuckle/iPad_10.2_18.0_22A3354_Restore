@implementation STransferMetricsStore

- (NSString)description
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC13FTMInternal_421STransferMetricsStore *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  uint64_t v12;

  KeyPath = swift_getKeyPath(&unk_100241678);
  v4 = swift_getKeyPath(&unk_1002416A0);
  v5 = self;
  static Published.subscript.getter(&v12, v5, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v6 = v12;
  v7 = type metadata accessor for STransferMetrics(0);
  Dictionary.description.getter(v6, &type metadata for Int, v7, &protocol witness table for Int);
  v9 = v8;

  swift_bridgeObjectRelease(v6);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return (NSString *)v10;
}

- (_TtC13FTMInternal_421STransferMetricsStore)init
{
  return (_TtC13FTMInternal_421STransferMetricsStore *)sub_10015F6DC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_421STransferMetricsStore__metrics;
  v4 = sub_100146438(&qword_1002B4AC8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_421STransferMetricsStore____lazy_storage___queue));
}

@end
