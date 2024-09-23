@implementation ConcreteCategoriesPrimitives

- (id)resolveBundleIdentifier:(id)a3 from:(int64_t)a4 to:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = sub_18FBCD0DC();
  v9 = v8;
  swift_retain();
  sub_18FBA4BC4(v7, v9, a4, a5);
  v11 = v10;
  swift_release();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v12 = (void *)sub_18FBCD0B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end
