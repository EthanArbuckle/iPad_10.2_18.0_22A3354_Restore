@implementation VSNotificationHeaderView

- (_TtC12AutoSettings24VSNotificationHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  _TtC12AutoSettings24VSNotificationHeaderView *v7;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem] = 0;
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
    *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem] = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VSNotificationHeaderView();
  v7 = -[VSNotificationHeaderView initWithReuseIdentifier:](&v9, "initWithReuseIdentifier:", v6);

  return v7;
}

- (_TtC12AutoSettings24VSNotificationHeaderView)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VSNotificationHeaderView();
  return -[VSNotificationHeaderView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
