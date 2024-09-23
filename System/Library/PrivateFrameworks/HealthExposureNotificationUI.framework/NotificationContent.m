@implementation NotificationContent

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent *v11;
  _TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent_notificationContainer;
  type metadata accessor for NotificationCapsuleView();
  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[NotificationContent initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_21CD6FEEC();

  return v12;
}

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent *result;

  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent_notificationContainer;
  type metadata accessor for NotificationCapsuleView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  id v3;
  _TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  type metadata accessor for NotificationCapsuleView();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;

  v5 = *MEMORY[0x24BEBE9C8];
  v6 = 85.0;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent_notificationContainer));
}

@end
