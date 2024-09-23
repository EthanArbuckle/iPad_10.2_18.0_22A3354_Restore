@implementation AuthorizationFooterView

- (_TtC28HealthExposureNotificationUI23AuthorizationFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC28HealthExposureNotificationUI23AuthorizationFooterView *)sub_21CD0BCCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC28HealthExposureNotificationUI23AuthorizationFooterView)initWithCoder:(id)a3
{
  return (_TtC28HealthExposureNotificationUI23AuthorizationFooterView *)sub_21CD0BE8C(a3);
}

- (void)didTapPrimaryButton
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC28HealthExposureNotificationUI23AuthorizationFooterView *v7;

  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate;
  if (MEMORY[0x22078BF0C]((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void)didTapSecondaryButton
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _TtC28HealthExposureNotificationUI23AuthorizationFooterView *v7;

  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate;
  if (MEMORY[0x22078BF0C]((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_21CD0CA24((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23AuthorizationFooterView_visualEffectView));
}

@end
