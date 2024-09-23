@implementation RecordStoreRegistry

- (id)recordStoreFor:(int64_t)a3
{
  return (id)sub_2177B963C(a3);
}

- (id)deletingStoreFor:(int64_t)a3
{
  return (id)sub_2177B96C4(a3);
}

- (id)assetStore
{
  return (id)sub_2177B9778();
}

- (void)registerRecordStoreWithType:(int64_t)a3 store:(id)a4
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  swift_beginAccess();
  swift_unknownObjectRetain_n();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *(_QWORD *)self->recordStore;
  *(_QWORD *)self->recordStore = 0x8000000000000000;
  sub_2177F87A0((uint64_t)a4, a3, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)self->recordStore = v8;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_release();
}

@end
