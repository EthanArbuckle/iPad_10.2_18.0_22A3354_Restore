@implementation CloudSecureManagerProxy

- (BCCloudSecureUserDataManager)userDataManager
{
  return (BCCloudSecureUserDataManager *)sub_227D621A0();
}

- (_TtC13BookDataStore23CloudSecureManagerProxy)init
{
  id v3;
  _TtC13BookDataStore23CloudSecureManagerProxy *v4;
  objc_class *v5;
  objc_class *v6;
  objc_super v8;

  v3 = objc_allocWithZone((Class)BDSServiceProxy);
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy) = v5;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_engagementManager) = v5;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_userDataManager) = v5;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CloudSecureManagerProxy();
  return -[CloudSecureManagerProxy init](&v8, sel_init);
}

+ (BCCloudSecureManaging)sharedManager
{
  if (qword_253F3A720 != -1)
    swift_once();
  swift_beginAccess();
  return (BCCloudSecureManaging *)(id)swift_unknownObjectRetain();
}

- (BDSSecureEngagementManaging)engagementManager
{
  return (BDSSecureEngagementManaging *)sub_227D621A0();
}

- (void)setEnableCloudSync:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy), sel_setEnableSecureCloudSync_, a3);
}

- (void)handleRemoteNotification:(id)a3
{
  uint64_t v4;
  _TtC13BookDataStore23CloudSecureManagerProxy *v5;

  v4 = sub_227E5FEDC();
  v5 = self;
  sub_227E165F4(v4);

  swift_bridgeObjectRelease();
}

- (void)handleRemoteCKNotification:(id)a3
{
  id v4;
  _TtC13BookDataStore23CloudSecureManagerProxy *v5;

  v4 = a3;
  v5 = self;
  sub_227E168A4(v4);

}

- (void)setEngagementManager:(id)a3
{
  sub_227E16BB4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_engagementManager);
}

- (void)setUserDataManager:(id)a3
{
  sub_227E16BB4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_userDataManager);
}

+ (void)setSharedManager:(id)a3
{
  uint64_t v4;

  v4 = qword_253F3A720;
  swift_unknownObjectRetain();
  if (v4 != -1)
    swift_once();
  swift_beginAccess();
  qword_253F3A710 = (uint64_t)a3;
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (*v8)(char, uint64_t);
  void *v9;
  _TtC13BookDataStore23CloudSecureManagerProxy *v10;
  _TtC13BookDataStore23CloudSecureManagerProxy *v11;
  _QWORD v12[6];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy);
    v8 = sub_227E17344;
    v12[4] = sub_227E17344;
    v12[5] = v6;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1107296256;
    v12[2] = sub_227E17004;
    v12[3] = &unk_24F08FE48;
    v9 = _Block_copy(v12);
    v10 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore23CloudSecureManagerProxy_serviceProxy);
    v11 = self;
    v9 = 0;
    v8 = 0;
  }
  objc_msgSend(v7, sel_dissociateCloudDataFromSyncWithCompletion_, v9);
  _Block_release(v9);
  sub_227D5B660((uint64_t)v8);

}

@end
