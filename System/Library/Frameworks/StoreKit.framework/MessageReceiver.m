@implementation MessageReceiver

- (void)pendingMessages:(id)a3
{
  uint64_t v3;

  v3 = (uint64_t)a3;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC66768);
    v3 = sub_1AC0F7BC4();
  }
  swift_retain();
  sub_1AC08FFE4(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC8StoreKit15MessageReceiver)init
{
  sub_1AC090440();
}

@end
