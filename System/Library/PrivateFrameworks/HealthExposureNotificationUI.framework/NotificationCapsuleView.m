@implementation NotificationCapsuleView

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[NotificationCapsuleView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_21CD6FC70();

  return v7;
}

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView)initWithCoder:(id)a3
{
  _TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView *result;

  result = (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 9.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
