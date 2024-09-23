@implementation DiagnosticsReporter

- (void)errorDidOccur:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  v9 = static RenderPipelineDiagnostics.error(of:)(v8);
  if (v9)
  {
    v10 = v9;
    sub_1005EB3A0(v9);
    swift_errorRelease(v10);
  }
  v11 = swift_release();
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v11);
}

- (void)incidentsDidOccur:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = swift_retain(self);
  v10 = static RenderPipelineDiagnostics.incidents(of:)(v8, v9);
  if (v10)
  {
    v11 = v10;
    sub_1005EBB34(v10);
    swift_release();
    v12 = swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = swift_release();
  }
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v12);
}

@end
