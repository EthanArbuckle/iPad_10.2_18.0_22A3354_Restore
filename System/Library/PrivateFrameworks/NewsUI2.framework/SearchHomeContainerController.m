@implementation SearchHomeContainerController

- (_TtC7NewsUI229SearchHomeContainerController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  _TtC7NewsUI229SearchHomeContainerController *result;

  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_currentSearchTerm);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = a3;

  result = (_TtC7NewsUI229SearchHomeContainerController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsUI229SearchHomeContainerController *v2;

  v2 = self;
  sub_1D6DACBC0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI229SearchHomeContainerController *v4;

  v4 = self;
  sub_1D6DACFC8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[SearchHomeContainerController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  swift_getObjectType();
  sub_1D6E1DD44();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI229SearchHomeContainerController *v2;

  v2 = self;
  sub_1D6DAD27C();

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
  -[SearchHomeContainerController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6DACE9C(v6);

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  _TtC7NewsUI229SearchHomeContainerController *v3;
  id v4;

  v3 = self;
  v4 = sub_1D6DAE01C();

  return v4;
}

- (_TtC7NewsUI229SearchHomeContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI229SearchHomeContainerController *result;

  v4 = a4;
  result = (_TtC7NewsUI229SearchHomeContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_searchHomeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_searchResultsViewController));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)willPresentSearchController:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC7NewsUI229SearchHomeContainerController *v9;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)didPresentSearchController:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC7NewsUI229SearchHomeContainerController *, id, uint64_t, uint64_t))(v6 + 16))(self, a3, ObjectType, v6);
    swift_unknownObjectRelease();
  }
}

- (void)willDismissSearchController:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC7NewsUI229SearchHomeContainerController *, id, uint64_t, uint64_t))(v6 + 24))(self, a3, ObjectType, v6);
    swift_unknownObjectRelease();
  }
}

- (void)didDismissSearchController:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  id v7;
  _TtC7NewsUI229SearchHomeContainerController *v8;

  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2))
  {
    v5 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC7NewsUI229SearchHomeContainerController *, id, uint64_t, uint64_t))(v5 + 32))(self, a3, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = a3;
    v8 = self;
  }
  sub_1D6DAC5AC(0, 0xE000000000000000, 4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC7NewsUI229SearchHomeContainerController *v10;

  v6 = sub_1D6E26978();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1D6DAC5AC(v6, v8, 4);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC7NewsUI229SearchHomeContainerController *v9;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI229SearchHomeContainerController_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 40);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

@end
