@implementation MUPlaceItemShareItemSource

- (NSArray)applicationActivities
{
  void *v2;

  swift_beginAccess();
  sub_191DBD608();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setApplicationActivities:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_191DBD608();
  v4 = sub_191EEB044();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MUPlaceItemShareItemSource_applicationActivities);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)activityProviders
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE234D48);
  v2 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivityProviders:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE234D48);
  v4 = sub_191EEB044();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MUPlaceItemShareItemSource_activityProviders);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)excludedActivityTypes
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE234BE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_191EFF460;
  *(_QWORD *)(v2 + 32) = sub_191EEAFC0();
  *(_QWORD *)(v2 + 40) = v3;
  v4 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NSArray)includedActivityTypes
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___MUPlaceItemShareItemSource_includedActivityTypes);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setIncludedActivityTypes:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_191EEB044();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MUPlaceItemShareItemSource_includedActivityTypes);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MUPlaceItemShareItemSource)initWithPlaceItem:(id)a3 applicationActivities:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  MUPlaceItemShareItemSource *v6;

  sub_191DBD608();
  v4 = sub_191EEB044();
  v5 = swift_unknownObjectRetain();
  v6 = (MUPlaceItemShareItemSource *)sub_191DBD334(v5, v4);
  swift_unknownObjectRelease();
  return v6;
}

- (MUPlaceItemShareItemSource)init
{
  MUPlaceItemShareItemSource *result;

  result = (MUPlaceItemShareItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
