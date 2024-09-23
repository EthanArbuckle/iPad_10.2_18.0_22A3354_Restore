@implementation DIPSystemNotificationClient

- (_TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient)init
{
  return (_TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient *)sub_230EF7B34();
}

- (void)dealloc
{
  void *v2;
  _TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DIPSystemNotificationClient();
  -[DIPSystemNotificationClient dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection));
  swift_unknownObjectRelease();
}

@end
