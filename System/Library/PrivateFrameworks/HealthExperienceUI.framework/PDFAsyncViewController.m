@implementation PDFAsyncViewController

- (_TtC18HealthExperienceUI22PDFAsyncViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI22PDFAsyncViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  _TtC18HealthExperienceUI22PDFAsyncViewController *v2;

  v2 = self;
  PDFAsyncViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_pdfFileNameProvider);
  sub_1A98470D0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareButtonBehavior));
  sub_1A9847408((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_configuration);
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_analyticsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_shareItemSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController____lazy_storage___spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController____lazy_storage___pdfView));
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI22PDFAsyncViewController *v2;

  v2 = self;
  sub_1A9844968();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PDFAsyncViewController();
  -[PDFAsyncViewController viewWillAppear:](&v4, sel_viewWillAppear_, v3);
}

- (void)didTapDone
{
  -[PDFAsyncViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)didTapShare:(id)a3
{
  _TtC18HealthExperienceUI22PDFAsyncViewController *v4;
  _BYTE v5[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9845FE0((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (Class)classForPage
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI22PDFAsyncViewController_pageNumberFormat);
  if (v2)
  {
    if (v2 == 1)
      type metadata accessor for PDFPageNumberedPage();
  }
  else
  {
    sub_1A9627620(0, &qword_1EEB18920);
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthExperienceUI22PDFAsyncViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI22PDFAsyncViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI22PDFAsyncViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
