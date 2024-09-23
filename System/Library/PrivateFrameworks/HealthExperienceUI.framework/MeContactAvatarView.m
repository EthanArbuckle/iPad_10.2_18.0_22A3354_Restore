@implementation MeContactAvatarView

- (_TtC18HealthExperienceUI19MeContactAvatarView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC18HealthExperienceUI19MeContactAvatarView *result;

  v5 = OBJC_IVAR____TtC18HealthExperienceUI19MeContactAvatarView_defaultAvatarImageSymbolConfiguration;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_configurationWithPointSize_weight_scale_, 4, 2, 28.0);

  result = (_TtC18HealthExperienceUI19MeContactAvatarView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI19MeContactAvatarView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI19MeContactAvatarView *result;

  result = (_TtC18HealthExperienceUI19MeContactAvatarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19MeContactAvatarView_defaultAvatarImageSymbolConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19MeContactAvatarView_publisherImageView));
}

@end
