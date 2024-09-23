@implementation HRPDFConfigurationViewController

- (HRPDFConfigurationViewController)initWithProfile:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  HRPDFConfigurationViewController *v8;
  _OWORD v10[4];
  uint64_t v11;

  memset(v10, 0, sizeof(v10));
  v11 = 0;
  objc_allocWithZone((Class)type metadata accessor for PDFConfigurationViewController());
  v6 = a3;
  v7 = a4;
  v8 = (HRPDFConfigurationViewController *)PDFConfigurationViewController.init(profile:account:category:)(v6, a4, (uint64_t *)v10);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (HRPDFConfigurationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC46B860();
}

- (void)viewDidLoad
{
  HRPDFConfigurationViewController *v2;

  v2 = self;
  sub_1BC466514();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PDFConfigurationViewController();
  v4 = v6.receiver;
  -[HRPDFConfigurationViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  if (qword_1ED6A3198 != -1)
    swift_once();
  v5 = 11;
  sub_1BC4E4100(1, 13, 0, &v5, 0);

}

- (void)viewDidLayoutSubviews
{
  HRPDFConfigurationViewController *v2;

  v2 = self;
  sub_1BC467224();

}

- (void)didTapCancel:(id)a3
{
  HRPDFConfigurationViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BC62D088();
  swift_unknownObjectRelease();
  -[HRPDFConfigurationViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (void)didTapSave:(id)a3
{
  id v4;
  HRPDFConfigurationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC467654((uint64_t)v4);

}

- (HRPDFConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1BC46B6E4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___actionBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_pinchAnimationBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_pinchAnimationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_pinchedPageImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController____lazy_storage___pdfHeightConstraint));
  sub_1BC46C050(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRPDFConfigurationViewController_state), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR___HRPDFConfigurationViewController_state), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___HRPDFConfigurationViewController_state), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate + OBJC_IVAR___HRPDFConfigurationViewController_state));
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRPDFConfigurationViewController_previewDataSource));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1BC358494((uint64_t)self + OBJC_IVAR___HRPDFConfigurationViewController_pdfGenerationToken, (uint64_t)&qword_1ED6A4840, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC34B508);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HRPDFConfigurationViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = PDFConfigurationViewController.tableView(_:cellForRowAt:)(v10);

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
  HRPDFConfigurationViewController *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BC62A928();
  objc_msgSend(v10, sel_deselectRowAtIndexPath_animated_, v12, 1);

  v13 = sub_1BC55E918((uint64_t)v9, v11);
  sub_1BC469A38(v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)didPinchPDF:(id)a3
{
  id v4;
  HRPDFConfigurationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BC469DBC(v4);

}

@end
