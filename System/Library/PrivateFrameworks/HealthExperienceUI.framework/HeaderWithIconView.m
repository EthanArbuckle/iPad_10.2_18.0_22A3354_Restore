@implementation HeaderWithIconView

- (_TtC18HealthExperienceUI18HeaderWithIconView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI18HeaderWithIconView *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI18HeaderWithIconView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI18HeaderWithIconView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI18HeaderWithIconView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI18HeaderWithIconView *result;

  result = (_TtC18HealthExperienceUI18HeaderWithIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI18HeaderWithIconView_configuration;
  v4 = sub_1A9A94048();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI18HeaderWithIconView_item, (uint64_t (*)(_QWORD))sub_1A9618454);
}

@end
