@implementation ProfileSharingFlowView

- (_TtC18HealthExperienceUI22ProfileSharingFlowView)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI22ProfileSharingFlowView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileBeingSharedView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileReceivingSharedProfileView) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUI22ProfileSharingFlowView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI22ProfileSharingFlowView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI22ProfileSharingFlowView *result;

  result = (_TtC18HealthExperienceUI22ProfileSharingFlowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileBeingShared);
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileReceivingSharedProfile;
  v4 = sub_1A9A93190();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileBeingSharedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileReceivingSharedProfileView));
}

@end
