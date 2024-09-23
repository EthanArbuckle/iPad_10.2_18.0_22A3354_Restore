@implementation MedicalIDCache

- (_TtC16HealthExperience14MedicalIDCache)init
{
  _TtC16HealthExperience14MedicalIDCache *result;

  result = (_TtC16HealthExperience14MedicalIDCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16HealthExperience14MedicalIDCache__medicalIDDataResult;
  sub_1BC8808E4(0, &qword_1ED6AC910, MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience14MedicalIDCache_medicalIDChangeObserver));

}

- (void)medicalIDDidChange
{
  void (*v2)(void);
  _TtC16HealthExperience14MedicalIDCache *v3;

  v2 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x108);
  v3 = self;
  v2();

}

@end
