@implementation WebEmbedContainerViewController

- (_TtC7NewsUI231WebEmbedContainerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  objc_class *v11;
  _TtC7NewsUI231WebEmbedContainerViewController *result;
  uint64_t v13;

  v5 = sub_1D6E24248();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_embedLocation;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0D5D760], v5);
  v10 = a3;
  v11 = (objc_class *)sub_1D6E2423C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(Class *)((char *)&self->super.super.super.isa + v9) = v11;

  result = (_TtC7NewsUI231WebEmbedContainerViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231WebEmbedContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI231WebEmbedContainerViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI231WebEmbedContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_styler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_layoutAttributesFactory);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_webEmbedViewController));
  sub_1D6392000((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_resource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_embedLocation));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231WebEmbedContainerViewController_webEmbedDataSourceService);
}

- (void)viewDidLoad
{
  _TtC7NewsUI231WebEmbedContainerViewController *v2;

  v2 = self;
  sub_1D6B55134();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC7NewsUI231WebEmbedContainerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D6B55F08((uint64_t)a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI231WebEmbedContainerViewController *v2;

  v2 = self;
  sub_1D6B56064();

}

@end
