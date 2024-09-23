@implementation PinnedContentStore

- (id)exportedInterface
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256CEB3A0);
}

- (id)remoteInterface
{
  return (id)_s09HealthAppA13DaemonSupport18PinnedContentStoreC15serverInterfaceSo14NSXPCInterfaceCvgZ_0();
}

- (_TtC28HealthAppHealthDaemonSupport18PinnedContentStore)init
{
  _TtC28HealthAppHealthDaemonSupport18PinnedContentStore *result;

  result = (_TtC28HealthAppHealthDaemonSupport18PinnedContentStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider));
}

@end
