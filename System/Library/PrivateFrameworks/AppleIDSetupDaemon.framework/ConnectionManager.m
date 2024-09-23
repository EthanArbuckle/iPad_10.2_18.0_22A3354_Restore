@implementation ConnectionManager

- (void)dealloc
{
  _TtC18AppleIDSetupDaemon17ConnectionManager *v2;

  v2 = self;
  sub_23668C23C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AppleIDSetupDaemon17ConnectionManager_aisDaemonServiceListener));
}

- (_TtC18AppleIDSetupDaemon17ConnectionManager)init
{
  _TtC18AppleIDSetupDaemon17ConnectionManager *result;

  result = (_TtC18AppleIDSetupDaemon17ConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC18AppleIDSetupDaemon17ConnectionManager *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23668CEBC(v7);

  return v9 & 1;
}

@end
