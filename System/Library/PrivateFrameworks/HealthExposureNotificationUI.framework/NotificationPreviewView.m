@implementation NotificationPreviewView

- (_TtC28HealthExposureNotificationUI23NotificationPreviewView)initWithFrame:(CGRect)a3
{
  return (_TtC28HealthExposureNotificationUI23NotificationPreviewView *)sub_21CD6F750(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC28HealthExposureNotificationUI23NotificationPreviewView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC28HealthExposureNotificationUI23NotificationPreviewView *result;

  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI23NotificationPreviewView_content;
  type metadata accessor for NotificationContent();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC28HealthExposureNotificationUI23NotificationPreviewView_isPresented) = 0;

  result = (_TtC28HealthExposureNotificationUI23NotificationPreviewView *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23NotificationPreviewView_content));
}

@end
