@implementation HGMLConfigurationInternal

+ (HGMLConfigurationInternal)defaultMLConfiguration
{
  return (HGMLConfigurationInternal *)sub_23DA66CB8((uint64_t)a1, (uint64_t)a2, &qword_256CDAFC0, (id *)&qword_256CDB5A8);
}

+ (HGMLConfigurationInternal)defaultEmptyMLConfiguration
{
  return (HGMLConfigurationInternal *)sub_23DA66CB8((uint64_t)a1, (uint64_t)a2, &qword_256CDAFC8, (id *)&qword_256CDB5B0);
}

+ (HGMLConfigurationInternal)defaultTestMLConfiguration
{
  return (HGMLConfigurationInternal *)sub_23DA66CB8((uint64_t)a1, (uint64_t)a2, &qword_256CDAFD0, (id *)&qword_256CDB5B8);
}

- (HGMLConfigurationInternal)init
{
  HGMLConfigurationInternal *result;

  result = (HGMLConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23DA68CF4((uint64_t)self + OBJC_IVAR___HGMLConfigurationInternal_testModelURL);
}

@end
