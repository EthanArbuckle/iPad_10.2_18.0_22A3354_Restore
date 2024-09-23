@implementation TaskSessionQueuePool

- (_TtC10ChronoCore20TaskSessionQueuePool)init
{
  uint64_t v2;
  id v3;
  char *v4;

  sub_1D29C363C();
  v2 = sub_1D29C3630();
  v3 = objc_allocWithZone((Class)type metadata accessor for TaskSessionQueuePool());
  v4 = sub_1D28E86FC(v2, 0, 1);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC10ChronoCore20TaskSessionQueuePool *)v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
