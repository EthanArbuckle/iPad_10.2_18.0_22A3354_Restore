@implementation OAuthAuthorizationTask

- (_TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask)init
{
  _TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask *result;

  result = (_TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.OAuthAuthorizationTask", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_context;
  v4 = type metadata accessor for OAuthAuthorizationContext(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle));
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask *v5;

  v4 = a3;
  v5 = self;
  sub_10000971C();

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask *v5;

  v4 = a3;
  v5 = self;
  sub_1000098D4();

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100009AA8((uint64_t)a4);

}

@end
