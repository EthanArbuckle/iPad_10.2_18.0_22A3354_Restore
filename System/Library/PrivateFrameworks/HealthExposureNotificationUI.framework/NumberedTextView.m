@implementation NumberedTextView

- (int64_t)number
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC28HealthExposureNotificationUI16NumberedTextView_number);
}

- (NSString)title
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI16NumberedTextView_title))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_21CD7658C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)details
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21CD7658C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC28HealthExposureNotificationUI16NumberedTextView)initWithCoder:(id)a3
{
  _TtC28HealthExposureNotificationUI16NumberedTextView *result;

  result = (_TtC28HealthExposureNotificationUI16NumberedTextView *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI16NumberedTextView)initWithFrame:(CGRect)a3
{
  sub_21CD2145C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
