@implementation MedicalIDDataSourceItem

- (_TtC18HealthExperienceUI23MedicalIDDataSourceItem)init
{
  _TtC18HealthExperienceUI23MedicalIDDataSourceItem *result;

  result = (_TtC18HealthExperienceUI23MedicalIDDataSourceItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_medicalIDViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_presentingViewController));
  swift_release();
  sub_1A97B5EE0(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC18HealthExperienceUI23MedicalIDDataSourceItem_currentMedicalIDDataResultPresented));
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI23MedicalIDDataSourceItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A97B65EC();

}

- (void)medicalIDViewControllerDidCancel:(void *)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  if (a3)
  {
    v7 = a1;
    v4 = a3;
    v5 = objc_msgSend(v4, sel_navigationController);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

      v4 = v7;
      v7 = v6;
    }

  }
  else
  {
    __break(1u);
  }
}

@end
