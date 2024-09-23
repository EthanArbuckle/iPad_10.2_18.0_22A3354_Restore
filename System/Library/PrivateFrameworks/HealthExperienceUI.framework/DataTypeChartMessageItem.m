@implementation DataTypeChartMessageItem

- (_TtC18HealthExperienceUI24DataTypeChartMessageItem)init
{
  _TtC18HealthExperienceUI24DataTypeChartMessageItem *result;

  result = (_TtC18HealthExperienceUI24DataTypeChartMessageItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24DataTypeChartMessageItem____lazy_storage___cnCapabilitiesManager));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24DataTypeChartMessageItem_viewConfiguration));

  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24DataTypeChartMessageItem_profileInformation;
  v4 = sub_1A9A9346C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
