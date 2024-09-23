@implementation WebViewerViewController

- (_TtC7NewsUI223WebViewerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  _TtC7NewsUI223WebViewerViewController *result;

  v5 = OBJC_IVAR____TtC7NewsUI223WebViewerViewController_coverViewManager;
  sub_1D6E1D678();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1D6E1D66C();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_webView) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_url;
  v8 = sub_1D6E15BE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_config) = 0;

  result = (_TtC7NewsUI223WebViewerViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI223WebViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI223WebViewerViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI223WebViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_styler);
  swift_unknownObjectRelease();
  swift_release();

  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_url, (uint64_t (*)(_QWORD))sub_1D5F53614);
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI223WebViewerViewController *v2;

  v2 = self;
  sub_1D6DBA2B4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[WebViewerViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI223WebViewerViewController *v2;

  v2 = self;
  sub_1D6DBA434();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[WebViewerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1D6E1D630();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[WebViewerViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6DBB6E8();

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC7NewsUI223WebViewerViewController *v15;
  uint64_t v16;

  v7 = type metadata accessor for WebViewerState();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1D82919D4]((*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI223WebViewerViewController_eventHandler))[4]+ 16);
  if (v10)
  {
    v11 = v10;
    swift_storeEnumTagMultiPayload();
    v12 = MEMORY[0x1D82919D4](v11 + 16);
    v13 = a3;
    v14 = a4;
    v15 = self;
    if (v12)
    {
      sub_1D6DBB0B0((uint64_t)v9);
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    sub_1D5E8D20C((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for WebViewerState);

  }
}

- (void)webView:(void *)a3 didFailNavigation:(void *)a4 withError:(void *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = a1;
  sub_1D68C5EAC(v11);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC7NewsUI223WebViewerViewController *v10;

  v5 = *(_QWORD *)((*(_QWORD **)((char *)&self->super.super.super.isa
                               + OBJC_IVAR____TtC7NewsUI223WebViewerViewController_eventHandler))[4]
                 + 32);
  if (MEMORY[0x1D82919D4](v5 + 24, a2))
  {
    v6 = *(_QWORD *)(v5 + 32);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC7NewsUI223WebViewerViewController *v5;
  char v6;

  v6 = 1;
  v4 = a3;
  v5 = self;
  sub_1D6444AD4(&v6);

}

@end
