@implementation NXCloudServer

- (NSString)description
{
  _TtC11NexusDaemon13NXCloudServer *v2;
  void *v3;

  v2 = self;
  sub_24306CBF4();

  v3 = (void *)sub_2430A1D68();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  _TtC11NexusDaemon13NXCloudServer *v16;

  if (a6)
  {
    v10 = sub_2430A1D74();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_24306FA7C(a3, a5, v10, v12);

  swift_bridgeObjectRelease();
}

- (_TtC11NexusDaemon13NXCloudServer)init
{
  _TtC11NexusDaemon13NXCloudServer *result;

  result = (_TtC11NexusDaemon13NXCloudServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC11NexusDaemon13NXCloudServer__environment);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
