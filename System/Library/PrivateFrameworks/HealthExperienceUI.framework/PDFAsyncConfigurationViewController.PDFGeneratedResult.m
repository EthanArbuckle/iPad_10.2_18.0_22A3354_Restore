@implementation PDFAsyncConfigurationViewController.PDFGeneratedResult

- (Class)classForPage
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult *v7;
  uint64_t v9;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_configuration);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v6(&v9, v4, v5);
  if (v9)
  {
    if (v9 == 1)
    {

      type metadata accessor for PDFPageNumberedPage();
    }
    else
    {

    }
  }
  else
  {

    sub_1A9627620(0, &qword_1EEB18920);
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult)init
{
  _TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult *result;

  result = (_TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_configuration);
  sub_1A96492CC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_pdfData), *(_QWORD *)&self->configuration[OBJC_IVAR____TtCC18HealthExperienceUI35PDFAsyncConfigurationViewControllerP33_41892A8E3AE85A20C0CA0B347A3001CA18PDFGeneratedResult_pdfData]);
  swift_bridgeObjectRelease();
}

@end
