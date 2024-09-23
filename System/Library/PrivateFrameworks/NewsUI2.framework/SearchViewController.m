@implementation SearchViewController

- (_TtC7NewsUI220SearchViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D63474C8();
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC7NewsUI220SearchViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1D6E1C874();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[SearchViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220SearchViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_sceneStateManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220SearchViewController_searchAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI220SearchViewController_clearAction));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_offlineProvider);
}

- (_TtC7NewsUI220SearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI220SearchViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI220SearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsUI220SearchViewController *v2;

  v2 = self;
  sub_1D6345720();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1D6345A24(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))MEMORY[0x1E0DB6960]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1D6345A24(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (void (*)(id))MEMORY[0x1E0DB6930]);
}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI220SearchViewController *v2;

  v2 = self;
  sub_1D6345AA8();

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
  -[SearchViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D634759C();

}

- (id)contentScrollView
{
  _TtC7NewsUI220SearchViewController *v2;
  void *v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (void *)sub_1D6E1E224();

  swift_release();
  return v3;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  _TtC7NewsUI220SearchViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D63477B4();

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtC7NewsUI220SearchViewController *v5;

  v4 = a3;
  v5 = self;
  MEMORY[0x1D8288AD0]();

}

- (void)didDismissSearchController:(id)a3
{
  uint64_t v3;
  uint64_t ObjectType;

  v3 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC7NewsUI220SearchViewController_eventHandler))[5];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v3 + 80))(ObjectType, v3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v5;
  id v6;
  _TtC7NewsUI220SearchViewController *v7;

  v5 = (void *)MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI220SearchViewController_searchBar, a2);
  v6 = a3;
  v7 = self;
  if (v5)
  {
    objc_msgSend(v5, sel_resignFirstResponder);

  }
  sub_1D6E1EA10();

}

@end
