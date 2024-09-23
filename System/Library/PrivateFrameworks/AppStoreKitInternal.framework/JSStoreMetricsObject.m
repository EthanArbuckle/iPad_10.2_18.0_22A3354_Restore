@implementation JSStoreMetricsObject

- (id)recordEvent:(id)a3 :(id)a4
{
  id v7;
  id v8;
  _TtC19AppStoreKitInternal20JSStoreMetricsObject *v9;
  void *v10;
  void *v11;

  sub_1D8501868();
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_1D892B870();
  v11 = (void *)sub_1D892B87C();

  return v11;
}

- (id)flushUnrecordedEvents
{
  _TtC19AppStoreKitInternal20JSStoreMetricsObject *v3;
  void *v4;
  void *v5;

  sub_1D8501868();
  v3 = self;
  v4 = (void *)sub_1D892B870();
  v5 = (void *)sub_1D892B87C();

  return v5;
}

- (_TtC19AppStoreKitInternal20JSStoreMetricsObject)init
{
  _TtC19AppStoreKitInternal20JSStoreMetricsObject *result;

  result = (_TtC19AppStoreKitInternal20JSStoreMetricsObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal20JSStoreMetricsObject_metricsRecorder);
}

@end
