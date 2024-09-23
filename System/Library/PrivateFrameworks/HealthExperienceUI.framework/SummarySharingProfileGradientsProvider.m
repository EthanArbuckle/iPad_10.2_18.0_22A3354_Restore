@implementation SummarySharingProfileGradientsProvider

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  id v5;
  _TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider *v6;
  id v7;
  void *v8;
  unint64_t v9;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider_fetchedResultsController);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, sel_sections);
  if (v7)
  {
    v8 = v7;
    sub_1A96710EC();
    v9 = sub_1A9A95A70();

  }
  else
  {
    v9 = 0;
  }
  sub_1A988B0E8(v9);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider)init
{
  _TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider *result;

  result = (_TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider_fetchedResultsController));
}

@end
