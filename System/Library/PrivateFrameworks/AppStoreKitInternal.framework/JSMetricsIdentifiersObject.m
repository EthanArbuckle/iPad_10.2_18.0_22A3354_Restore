@implementation JSMetricsIdentifiersObject

- (NSString)currentTopic
{
  void *v2;

  MetricsTopicProvider.currentMetricsTopic.getter();
  v2 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)getIdentifierForContext:(id)a3
{
  return sub_1D85A4F28(self, (uint64_t)a2, a3);
}

- (id)getIdentifierForContextSync:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternal26JSMetricsIdentifiersObject *v6;
  void *v7;
  void *v8;

  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D892B870();
  v8 = (void *)sub_1D892B87C();

  return v8;
}

- (id)getMetricsFieldsForContexts:(id)a3
{
  return sub_1D85A4F28(self, (uint64_t)a2, a3);
}

- (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject)init
{
  _TtC19AppStoreKitInternal26JSMetricsIdentifiersObject *result;

  result = (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
