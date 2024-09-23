@implementation DTTimerClient

- (NSError)error
{
  os_unfair_lock_s *v2;
  DTTimerClient *v3;
  void *v4;
  void *v5;
  void *v7;

  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient__lock) + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_23A50CD74(&v7);
  os_unfair_lock_unlock(v2);
  v4 = v7;

  if (!v4)
    return (NSError *)0;
  v5 = (void *)sub_23A521830();

  return (NSError *)v5;
}

- (id)eventHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient_eventHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A506D08;
  aBlock[3] = &block_descriptor_73;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setEventHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_23A50CDB0;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___DTTimerClient_eventHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23A50BB4C(v7);
}

- (DTTimerClient)init
{
  return (DTTimerClient *)sub_23A506ED0();
}

- (DTTimerClient)initWithDispatchQueue:(id)a3
{
  id v3;
  DTTimerClient *v4;

  v3 = a3;
  v4 = (DTTimerClient *)sub_23A50BE3C();

  return v4;
}

- (DTTimerClient)initWithDispatchQueue:(id)a3 homeKitAccessoryID:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  DTTimerClient *v9;

  v5 = sub_23A521A28();
  v7 = v6;
  v8 = a3;
  v9 = (DTTimerClient *)sub_23A50BF98((uint64_t)v8, v5, v7);

  return v9;
}

- (void)dealloc
{
  uint64_t v3;
  int v4;
  DTTimerClient *v5;
  objc_super v6;

  v3 = OBJC_IVAR___DTTimerClient__monitorMode;
  v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DTTimerClient__monitorMode);
  v5 = self;
  if (v4 == 1)
  {
    sub_23A5070EC();
    *((_BYTE *)&self->super.isa + v3) = 0;
  }
  v6.receiver = v5;
  v6.super_class = (Class)DTTimerClient;
  -[DTTimerClient dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_23A50BB4C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient_eventHandler));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)activate
{
  DTTimerClient *v2;

  v2 = self;
  sub_23A5077EC((uint64_t)&unk_250B67210, (uint64_t)sub_23A50C128, (uint64_t)&block_descriptor);

}

- (void)invalidate
{
  DTTimerClient *v2;

  v2 = self;
  sub_23A5077EC((uint64_t)&unk_250B67288, (uint64_t)sub_23A50C5C0, (uint64_t)&block_descriptor_9);

}

- (NSArray)timers
{
  os_unfair_lock_s *v2;
  DTTimerClient *v3;
  void *v4;
  uint64_t v6;

  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa + OBJC_IVAR___DTTimerClient__lock) + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_23A50CD74(&v6);
  os_unfair_lock_unlock(v2);

  type metadata accessor for DTTimer(0);
  v4 = (void *)sub_23A521AC4();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NSArray)mtAlarms
{
  return (NSArray *)sub_23A508940((char *)self, (uint64_t)a2, (uint64_t)sub_23A50CF48, &qword_25698ADF0);
}

- (NSArray)mtTimers
{
  return (NSArray *)sub_23A508940((char *)self, (uint64_t)a2, (uint64_t)sub_23A50CF34, &qword_25698ADE8);
}

- (void)fetchTimersWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  DTTimerClient *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_23A508C68((uint64_t)sub_23A50CD44, v5);

  swift_release();
}

- (void)addTimer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  DTTimerClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23A5094EC(v8, (uint64_t)sub_23A50CF60, v7);

  swift_release();
}

- (void)updateTimer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  DTTimerClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23A509AF0(v8, (uint64_t)sub_23A50CF60, v7, "updateTimer: %@, %s", (void (*)(__n128 *__return_ptr))sub_23A50C1F0, 1);

  swift_release();
}

- (void)removeTimer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  DTTimerClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23A509AF0(v8, (uint64_t)sub_23A50CF60, v7, "removeTimer: %@, %s", (void (*)(__n128 *__return_ptr))sub_23A50C1F0, 2);

  swift_release();
}

- (void)snoozeTimer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  DTTimerClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23A509AF0(v8, (uint64_t)sub_23A50CF60, v7, "snoozeTimer: %@, %s", (void (*)(__n128 *__return_ptr))sub_23A50C1F0, 3);

  swift_release();
}

- (void)dismissTimer:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  DTTimerClient *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23A509AF0(v8, (uint64_t)sub_23A50CD3C, v7, "dismissTimer: %@, %s", (void (*)(__n128 *__return_ptr))sub_23A50C1F0, 4);

  swift_release();
}

+ (unint64_t)statusFlags
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  __n128 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __n128 v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  type metadata accessor for DTXPCClient();
  v6 = 0uLL;
  v7 = 0;
  LOBYTE(v8) = 10;
  v16 = 0uLL;
  DTRequestContext.init(endpoint:)(&v16, &v14);
  v12 = v14;
  v13 = v15;
  DTXPCRequest.init(request:context:)(&v6, (uint64_t)&v12, (uint64_t)&v16);
  v0 = v18;
  v1 = v19;
  v2 = v20;
  v3 = v21;
  v6 = v16;
  v7 = v17;
  v8 = v18;
  v9 = v19;
  v10 = v20;
  v11 = v21;
  v4 = sub_23A50CEC4();
  static DTXPCClient.sendSync<A>(request:)((__int128 *)&v6, (uint64_t)&type metadata for DTFetchStatusResponse, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A4FCCC0(v0, v1, v2, v3);
  return v14.n128_u64[0];
}

@end
