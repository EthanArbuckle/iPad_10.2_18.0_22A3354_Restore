@implementation FCPingBasedOnlineNetworkTransitionMonitor

- (FCPingBasedOnlineNetworkTransitionMonitor)initWithConfigurationManager:(id)a3 hostName:(id)a4 port:(unsigned __int16)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FCPingBasedOnlineNetworkTransitionMonitor *v10;

  v6 = sub_1A1E55174();
  v8 = v7;
  v9 = swift_unknownObjectRetain();
  v10 = (FCPingBasedOnlineNetworkTransitionMonitor *)sub_1A1C4E500(v9, v6, v8, a5);
  swift_unknownObjectRelease();
  return v10;
}

- (id)notifyWhenTransitionOccursOnQueue:(id)a3 withBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  FCPingBasedOnlineNetworkTransitionMonitor *v9;
  id v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_1A1C4C8E8(v8, (uint64_t)sub_1A1C4ED80, v7);

  swift_release();
  return v10;
}

- (NSDate)dateOfLastTransition
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  FCPingBasedOnlineNetworkTransitionMonitor *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0F79C0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___FCPingBasedOnlineNetworkTransitionMonitor_dateOfLastTransitionLock);
  v7 = v6 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_1A1C4D07C(v7, (uint64_t)v5);
  os_unfair_lock_unlock(v8);

  v10 = sub_1A1E55060();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    v12 = (void *)sub_1A1E55048();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  return (NSDate *)v12;
}

- (FCPingBasedOnlineNetworkTransitionMonitor)init
{
  FCPingBasedOnlineNetworkTransitionMonitor *result;

  result = (FCPingBasedOnlineNetworkTransitionMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
