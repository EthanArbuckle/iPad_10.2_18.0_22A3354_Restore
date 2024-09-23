@implementation InstallConfirmationTask

- (_TtC26AppDistributionLaunchAngel23InstallConfirmationTask)init
{
  _TtC26AppDistributionLaunchAngel23InstallConfirmationTask *result;

  result = (_TtC26AppDistributionLaunchAngel23InstallConfirmationTask *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.InstallConfirmationTask", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_context;
  v4 = type metadata accessor for InstallSheetContext(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle));
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel23InstallConfirmationTask *v5;

  v4 = a3;
  v5 = self;
  sub_100015AB8();

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel23InstallConfirmationTask *v5;

  v4 = a3;
  v5 = self;
  sub_100015C70();

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC26AppDistributionLaunchAngel23InstallConfirmationTask *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100015E44((uint64_t)a4);

}

@end
