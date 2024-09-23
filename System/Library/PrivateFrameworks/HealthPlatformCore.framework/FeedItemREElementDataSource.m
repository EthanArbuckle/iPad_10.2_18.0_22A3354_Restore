@implementation FeedItemREElementDataSource

+ (NSString)bundleIdentifier
{
  return (NSString *)(id)sub_1BC08A3B4();
}

+ (NSString)applicationBundleIdentifier
{
  return (NSString *)0;
}

- (NSArray)supportedSections
{
  void *v2;

  if (sub_1BBFE5F2C())
  {
    v2 = (void *)sub_1BC08A4BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

+ (id)contentAttributes
{
  return (id)sub_1BC08A4BC();
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  void (*v6)(uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _TtC18HealthPlatformCore27FeedItemREElementDataSource *v11;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  v7 = v6;
  if (!a3)
  {
    v8 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = sub_1BC08A3C0();
  a3 = v9;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v7;
  v7 = sub_1BBFE6130;
LABEL_6:
  v11 = self;
  sub_1BBFE3634(v8, (unint64_t)a3, (uint64_t)v7, v10);
  sub_1BBFE60FC((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthPlatformCore27FeedItemREElementDataSource)init
{
  _TtC18HealthPlatformCore27FeedItemREElementDataSource *result;

  result = (_TtC18HealthPlatformCore27FeedItemREElementDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthPlatformCore27FeedItemREElementDataSource_store);
  swift_bridgeObjectRelease();
}

@end
