@implementation EventHistoryAggregateStoreStateModeResolver

- (id)aggregateStore
{
  _TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D5B5A660();
  v4 = v3;

  swift_unknownObjectRelease();
  return v4;
}

- (id)generateDerivedData
{
  _TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver *v2;
  id v3;

  v2 = self;
  v3 = sub_1D5B557A4();

  return v3;
}

- (_TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver)init
{
  _TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver *result;

  result = (_TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver_personalizationData));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver_userEventHistoryAggregateStoreFactory);
  swift_release();
}

@end
