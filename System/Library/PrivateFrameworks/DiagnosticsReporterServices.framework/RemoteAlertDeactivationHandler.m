@implementation RemoteAlertDeactivationHandler

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler *v5;

  v4 = a3;
  v5 = self;
  sub_21E27F278(v4);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_21E27F470(v6, a4);

}

- (_TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler)init
{
  _TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler *result;

  result = (_TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)remoteAlertHandleDidActivate:
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_2553D18D8 != -1)
    swift_once();
  v0 = sub_21E2803C0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2553D2688);
  oslog = sub_21E2803A8();
  v1 = sub_21E280570();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315138;
    sub_21E27F7B4(0xD000000000000020, 0x800000021E2820C0, &v5);
    sub_21E2805B8();
    _os_log_impl(&dword_21E26E000, oslog, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207ADAE4](v3, -1, -1);
    MEMORY[0x2207ADAE4](v2, -1, -1);

  }
  else
  {

  }
}

@end
