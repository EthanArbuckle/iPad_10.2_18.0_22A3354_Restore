@implementation RemoteViewControllerClient

- (_TtC22HomePlatformSettingsUI26RemoteViewControllerClient)init
{
  _TtC22HomePlatformSettingsUI26RemoteViewControllerClient *result;

  result = (_TtC22HomePlatformSettingsUI26RemoteViewControllerClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_224D9709C((uint64_t)self + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl));
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6;
  id v7;
  _TtC22HomePlatformSettingsUI26RemoteViewControllerClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_224D9693C();

}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC22HomePlatformSettingsUI26RemoteViewControllerClient *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_224D96A68((uint64_t)a5);

}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC22HomePlatformSettingsUI26RemoteViewControllerClient *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_224D96AFC((uint64_t)a5);

}

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  id v6;
  id v7;
  _TtC22HomePlatformSettingsUI26RemoteViewControllerClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_224D96F24();

}

@end
