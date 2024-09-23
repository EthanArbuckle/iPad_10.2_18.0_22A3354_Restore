@implementation InAppMessagesMetricsDelegate

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _TtC8AppStore28InAppMessagesMetricsDelegate *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27[24];

  v7 = type metadata accessor for MetricsFieldsContext(0);
  v25 = *(_QWORD *)(v7 - 8);
  v26 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MetricsPipeline(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MetricsData(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v24 = a3;
  v19 = self;
  v20 = swift_bridgeObjectRetain(v18);
  MetricsData.init(fields:includingFields:excludingFields:shouldFlush:)(v20, &_swiftEmptySetSingleton, &_swiftEmptySetSingleton, 0);
  v21 = (char *)v19 + OBJC_IVAR____TtC8AppStore28InAppMessagesMetricsDelegate_metricsPipeline;
  swift_beginAccess((char *)v19 + OBJC_IVAR____TtC8AppStore28InAppMessagesMetricsDelegate_metricsPipeline, v27, 0, 0);
  v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v11 + 16))(v13, v21, v10);
  static MetricsFieldsContext.emptyContext.getter(v22);
  v23 = MetricsPipeline.process(_:using:)(v17, v9);
  swift_release(v23);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);

  swift_bridgeObjectRelease(v18);
}

- (_TtC8AppStore28InAppMessagesMetricsDelegate)init
{
  _TtC8AppStore28InAppMessagesMetricsDelegate *result;

  result = (_TtC8AppStore28InAppMessagesMetricsDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppStore.InAppMessagesMetricsDelegate", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8AppStore28InAppMessagesMetricsDelegate_metricsPipeline;
  v3 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
