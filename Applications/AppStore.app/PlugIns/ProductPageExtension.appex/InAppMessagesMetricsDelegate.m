@implementation InAppMessagesMetricsDelegate

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _TtC20ProductPageExtension28InAppMessagesMetricsDelegate *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _TtC20ProductPageExtension28InAppMessagesMetricsDelegate *v24;
  uint64_t v25;

  v24 = self;
  v25 = type metadata accessor for MetricsFieldsContext(0);
  v6 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MetricsPipeline(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MetricsData(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v23 = a3;
  v18 = v24;
  v19 = swift_bridgeObjectRetain(v17);
  MetricsData.init(fields:includingFields:excludingFields:shouldFlush:)(v19, &_swiftEmptySetSingleton, &_swiftEmptySetSingleton, 0);
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, (uint64_t)v18 + OBJC_IVAR____TtC20ProductPageExtension28InAppMessagesMetricsDelegate_metricsPipeline, v9);
  static MetricsFieldsContext.emptyContext.getter(v20);
  v21 = MetricsPipeline.process(_:using:)(v16, v8);
  swift_release(v21);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v25);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);

  swift_bridgeObjectRelease(v17);
}

- (_TtC20ProductPageExtension28InAppMessagesMetricsDelegate)init
{
  _TtC20ProductPageExtension28InAppMessagesMetricsDelegate *result;

  result = (_TtC20ProductPageExtension28InAppMessagesMetricsDelegate *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.InAppMessagesMetricsDelegate", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension28InAppMessagesMetricsDelegate_metricsPipeline;
  v3 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
