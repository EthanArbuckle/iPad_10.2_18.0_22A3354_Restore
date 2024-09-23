@implementation SubscriberStatusConditionProvider

- (_TtC7NewsUI233SubscriberStatusConditionProvider)init
{
  _TtC7NewsUI233SubscriberStatusConditionProvider *result;

  result = (_TtC7NewsUI233SubscriberStatusConditionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  void *v4;
  id v5;
  char *v6;
  id v7;

  v4 = *(void **)&a1[OBJC_IVAR____TtC7NewsUI233SubscriberStatusConditionProvider_appConfigurationManager];
  v5 = a3;
  v6 = a1;
  v7 = objc_msgSend(v4, sel_possiblyUnfetchedAppConfiguration);
  sub_1D6A16984();

  return swift_unknownObjectRelease();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  _TtC7NewsUI233SubscriberStatusConditionProvider *v5;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  sub_1D6A16984();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
