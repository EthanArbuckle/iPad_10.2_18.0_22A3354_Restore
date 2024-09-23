@implementation TelemetrySessionManager

- (void)networkEventMonitor:(id)a3 loggedEvent:(id)a4 inSession:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  swift_retain();
  sub_1D6E169B8();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = v8;
  v12 = v9;
  sub_1D6E16C10();

  swift_release();
  swift_release();
  swift_release();
}

@end
