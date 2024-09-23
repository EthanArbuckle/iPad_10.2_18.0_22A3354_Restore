@implementation LicenseResolutionTask

- (_TtC26AppDistributionLaunchAngel21LicenseResolutionTask)init
{
  _TtC26AppDistributionLaunchAngel21LicenseResolutionTask *result;

  result = (_TtC26AppDistributionLaunchAngel21LicenseResolutionTask *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.LicenseResolutionTask", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_context;
  v4 = type metadata accessor for LicenseResolutionContext(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle));
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel21LicenseResolutionTask *v5;

  v4 = a3;
  v5 = self;
  sub_1000252A4();

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel21LicenseResolutionTask *v5;

  v4 = a3;
  v5 = self;
  sub_10002545C();

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC26AppDistributionLaunchAngel21LicenseResolutionTask *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100025630((uint64_t)a4);

}

@end
