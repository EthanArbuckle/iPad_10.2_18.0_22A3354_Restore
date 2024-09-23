@implementation PersistanceStore

- (void)dealloc
{
  _TtC13FTMInternal_416PersistanceStore *v2;

  v2 = self;
  sub_1001BD144();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore____lazy_storage___database));
  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_database[OBJC_IVAR____TtC13FTMInternal_416PersistanceStore_recordedTime]);

  sub_10014C77C((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore_storeDelegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore_hardwareManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore____lazy_storage___coreTelephonyService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FTMInternal_416PersistanceStore____lazy_storage___metricService));

}

- (_TtC13FTMInternal_416PersistanceStore)init
{
  _TtC13FTMInternal_416PersistanceStore *result;

  result = (_TtC13FTMInternal_416PersistanceStore *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.PersistanceStore", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
