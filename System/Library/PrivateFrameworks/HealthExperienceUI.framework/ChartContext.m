@implementation ChartContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC18HealthExperienceUI12ChartContext *v2;
  void *v3;

  v2 = self;
  sub_1A975B4DC();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI12ChartContext *v5;

  v4 = a3;
  v5 = self;
  sub_1A975B7AC(v4);

}

- (_TtC18HealthExperienceUI12ChartContext)initWithCoder:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI12ChartContext *v4;

  v3 = a3;
  v4 = (_TtC18HealthExperienceUI12ChartContext *)sub_1A975C880();

  return v4;
}

- (_TtC18HealthExperienceUI12ChartContext)init
{
  _TtC18HealthExperienceUI12ChartContext *result;

  result = (_TtC18HealthExperienceUI12ChartContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI12ChartContext_date, (unint64_t *)&unk_1ED27E4A0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI12ChartContext_dateInterval, &qword_1ED27B8E0, (void (*)(uint64_t))MEMORY[0x1E0CAE5D0]);
}

@end
