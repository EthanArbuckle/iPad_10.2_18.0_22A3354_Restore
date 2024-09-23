@implementation PDFAsyncConfigurationViewController

- (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI35PDFAsyncConfigurationViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v3;
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_currentTask))
  {
    v3 = self;
    swift_retain();
    sub_1A9A95B9C();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PDFAsyncConfigurationViewController();
  -[PDFAsyncConfigurationViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___actionBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_pinchAnimationBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_pinchAnimationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_pinchedPageImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController____lazy_storage___pdfHeightConstraint));
  sub_1A9A26874(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_state), *((_BYTE *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_state));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_previewDataSource));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v2;

  v2 = self;
  sub_1A9A20D5C();

}

- (void)viewDidLayoutSubviews
{
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v2;

  v2 = self;
  sub_1A9A21650();

}

- (void)didTapCancel:(id)a3
{
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  -[PDFAsyncConfigurationViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapSave:(id)a3
{
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v4;
  char *v5;

  v5 = (char *)a3;
  v4 = self;
  sub_1A9A21B18(v5);

}

- (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v11;
  int64_t v12;

  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
  v7 = v6[3];
  v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
  v10 = a3;
  v11 = self;
  v12 = v9(v7, v8);

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  v12 = PDFAsyncConfigurationViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_1A9A921DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1A9A92164();
  objc_msgSend(v10, sel_deselectRowAtIndexPath_animated_, v12, 1);

  v13 = *(uint64_t *)((char *)&v11->super._overrideTransitioningDelegate
                   + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
  v14 = *(uint64_t *)((char *)&v11->super._view
                   + OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v11->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI35PDFAsyncConfigurationViewController_configurationDataSource), v13);
  v15 = sub_1A9A92194();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v15, v13, v14);
  sub_1A9A222BC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)didPinchPDF:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI35PDFAsyncConfigurationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A9A24118(v4);

}

@end
