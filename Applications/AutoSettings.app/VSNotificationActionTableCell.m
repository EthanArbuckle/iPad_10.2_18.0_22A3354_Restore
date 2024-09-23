@implementation VSNotificationActionTableCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _TtC12AutoSettings29VSNotificationActionTableCell *v6;

  v6 = self;
  sub_100015C78(a3, a4);

}

- (_TtC12AutoSettings29VSNotificationActionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSString v9;
  char *v10;
  _TtC12AutoSettings29VSNotificationActionTableCell *v11;
  objc_super v13;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = (char *)self + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    v8[48] = 0;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = 0;
    v10 = (char *)self + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
    *(_OWORD *)v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_OWORD *)v10 + 2) = 0u;
    v10[48] = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for VSNotificationActionTableCell();
  v11 = -[VSTableCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v9);

  return v11;
}

- (_TtC12AutoSettings29VSNotificationActionTableCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
  v6 = (objc_class *)type metadata accessor for VSNotificationActionTableCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  v5[48] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[VSTableCell initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000058C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction), *(_QWORD *)&self->notificationAction[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction], *(_QWORD *)&self->notificationAction[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction+ 8], *(_QWORD *)&self->notificationAction[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction+ 16], *(_QWORD *)&self->notificationAction[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction+ 24], *(_QWORD *)&self->notificationAction[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction+ 32]);
}

@end
