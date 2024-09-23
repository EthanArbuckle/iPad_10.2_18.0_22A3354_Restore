@implementation AXMotionCuesService

+ (AXMotionCuesService)sharedInstance
{
  if (qword_254299E40 != -1)
    swift_once();
  return (AXMotionCuesService *)(id)qword_254299E38;
}

- (AXMotionCuesService)init
{
  objc_class *ObjectType;
  uint64_t v4;
  AXMotionCuesService *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXMotionCuesService__client) = 0;
  v4 = OBJC_IVAR___AXMotionCuesService_movingHandlers;
  v5 = self;
  v6 = MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_235CBD3C0(MEMORY[0x24BEE4AF8]);
  v7 = OBJC_IVAR___AXMotionCuesService_visibleHandlers;
  *(Class *)((char *)&v5->super.isa + v7) = (Class)sub_235CBD3C0(v6);

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return -[AXMotionCuesService init](&v9, sel_init);
}

- (void)enableWithCompletionBlock:(id)a3
{
  sub_235CBD344(self, (int)a2, a3, (uint64_t)&unk_250715638, (uint64_t)sub_235CC15A4, (void (*)(uint64_t, uint64_t))AXMotionCuesService.enable(completionBlock:));
}

- (void)disable:(id)a3
{
  sub_235CBD344(self, (int)a2, a3, (uint64_t)&unk_250715610, (uint64_t)sub_235CC11D4, (void (*)(uint64_t, uint64_t))AXMotionCuesService.disable(_:));
}

- (id)registerMotionCuesMoving:(id)a3
{
  return sub_235CBEAB8(self, (uint64_t)a2, a3, (uint64_t)&unk_2507155E8, (uint64_t)sub_235CC15E4, (void (*)(uint64_t, uint64_t))AXMotionCuesService.registerMotionCuesMoving(_:));
}

- (void)unregisterMotionCuesMoving:(id)a3
{
  sub_235CBECF0(self);
}

- (id)registerMotionCuesVisible:(id)a3
{
  return sub_235CBEAB8(self, (uint64_t)a2, a3, (uint64_t)&unk_2507155C0, (uint64_t)sub_235CC11C0, (void (*)(uint64_t, uint64_t))AXMotionCuesService.registerMotionCuesVisible(_:));
}

- (void)unregisterMotionCuesVisible:(id)a3
{
  sub_235CBECF0(self);
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(int64_t)a5 error:(id *)a6
{
  uint64_t v9;
  id v10;
  AXMotionCuesService *v11;
  void *v12;

  if (a4)
    v9 = sub_235CC1678();
  else
    v9 = 0;
  v10 = a3;
  v11 = self;
  sub_235CC0C8C(v9, a5);

  swift_bridgeObjectRelease();
  v12 = (void *)sub_235CC166C();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  return objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5;
  AXMotionCuesService *v6;

  v5 = a3;
  v6 = self;
  AXMotionCuesService.connectionWithServiceWasInterrupted(forUserInterfaceClient:)(a3);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
