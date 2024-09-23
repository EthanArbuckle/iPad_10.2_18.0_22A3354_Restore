@implementation IMNetworkMonitor

- (IMNetworkMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4
{
  void *v6;
  IMNetworkMonitor *v7;

  if (a3)
  {
    sub_19E36F888();
    swift_unknownObjectRetain();
    v6 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
    v6 = 0;
  }
  v7 = -[IMNetworkMonitor initWithRemoteHost:delegate:supportsConstrainedNetwork:](self, sel_initWithRemoteHost_delegate_supportsConstrainedNetwork_, v6, a4, 0);

  swift_unknownObjectRelease();
  return v7;
}

- (IMNetworkMonitor)initWithRemoteHost:(id)a3 delegate:(id)a4 supportsConstrainedNetwork:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a5;
  if (a3)
  {
    v7 = sub_19E36F888();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  swift_unknownObjectRetain();
  return (IMNetworkMonitor *)sub_19E353404(v7, v9, (uint64_t)a4, v5);
}

- (void)clear
{
  IMNetworkMonitor *v2;

  v2 = self;
  nw_path_evaluator_cancel();
  swift_unknownObjectWeakAssign();

}

- (NSString)remoteHost
{
  void *v2;

  if (*(_QWORD *)&self->queue[OBJC_IVAR___IMNetworkMonitor_host])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (id)description
{
  IMNetworkMonitor *v2;
  void *v3;

  v2 = self;
  sub_19E353BE4();

  v3 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)immediatelyReachable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMNetworkMonitor_networkAvailable);
}

- (IMNetworkMonitor)init
{
  IMNetworkMonitor *result;

  result = (IMNetworkMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_19E323244((uint64_t)self + OBJC_IVAR___IMNetworkMonitor_delegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
