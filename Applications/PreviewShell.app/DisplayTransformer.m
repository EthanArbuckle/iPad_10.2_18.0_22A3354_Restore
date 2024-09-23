@implementation DisplayTransformer

- (_TtC12PreviewShell18DisplayTransformer)init
{
  return (_TtC12PreviewShell18DisplayTransformer *)sub_10000D824();
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v4;
  uint64_t inited;
  id v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;
  _BYTE v11[40];

  v4 = sub_100006658(&qword_10005F448);
  inited = swift_initStackObject(v4, v11);
  *(_OWORD *)(inited + 16) = xmmword_1000401C0;
  *(_QWORD *)(inited + 32) = a3;
  v10 = inited;
  specialized Array._endMutation()();
  v6 = a3;
  v7 = sub_10000E754(v10);
  swift_bridgeObjectRelease(v10);
  sub_10000E89C();
  sub_10000E8D8();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

@end
