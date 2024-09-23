@implementation SummarySharingProfileTileEscalatedDetailsProvider

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider *v5;
  id v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_sections);
  if (v6)
  {
    v7 = v6;
    sub_1A96710EC();
    v8 = sub_1A9A95A70();

  }
  else
  {
    v8 = 0;
  }
  sub_1A9950734(v8);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider)init
{
  _TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider *result;

  result = (_TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);

  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider__alertsCount;
  sub_1A961D9E8(0, &qword_1EEB20608, MEMORY[0x1E0DEB418], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
  v5 = v4;
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider__changesCount, v5);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider_frc));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider_sourceProfile));
}

@end
