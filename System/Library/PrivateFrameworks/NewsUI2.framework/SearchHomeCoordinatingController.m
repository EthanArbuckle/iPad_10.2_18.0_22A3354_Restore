@implementation SearchHomeCoordinatingController

- (_TtC7NewsUI232SearchHomeCoordinatingController)initWithCoder:(id)a3
{
  id v5;
  _TtC7NewsUI232SearchHomeCoordinatingController *result;

  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7NewsUI232SearchHomeCoordinatingController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsUI232SearchHomeCoordinatingController *v2;

  v2 = self;
  sub_1D65513E8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  char *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[SearchHomeCoordinatingController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = (char *)objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_searchHomeContainerController], sel_parentViewController, v7.receiver, v7.super_class);
  if (!v5 || (v6 = v5, v5, v6 != v4))
    sub_1D6550E7C(0);

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI232SearchHomeCoordinatingController *v2;

  v2 = self;
  sub_1D6551580();

}

- (_TtC7NewsUI232SearchHomeCoordinatingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI232SearchHomeCoordinatingController *result;

  v4 = a4;
  result = (_TtC7NewsUI232SearchHomeCoordinatingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_searchHomeContainerController));
}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  _TtC7NewsUI232SearchHomeCoordinatingController *v5;

  v4 = a3;
  v5 = self;
  sub_1D655177C((uint64_t)v4);

}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  _TtC7NewsUI232SearchHomeCoordinatingController *v5;

  v4 = a3;
  v5 = self;
  sub_1D65518BC((uint64_t)v4);

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  _TtC7NewsUI232SearchHomeCoordinatingController *v5;

  v4 = a3;
  v5 = self;
  sub_1D65519FC((uint64_t)v4);

}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  _TtC7NewsUI232SearchHomeCoordinatingController *v5;

  v4 = a3;
  v5 = self;
  sub_1D6551B3C((uint64_t)v4);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _TtC7NewsUI232SearchHomeCoordinatingController *v10;
  id v11;
  void *v12;
  _TtC7NewsUI232SearchHomeCoordinatingController *v13;
  id v14;
  id v15;

  v6 = sub_1D6E26978();
  v8 = v7;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI232SearchHomeCoordinatingController_searchHomeContainerController);
  v15 = a3;
  v10 = self;
  v11 = objc_msgSend(v9, sel_parentViewController);
  if (v11)
  {
    v12 = v11;
    sub_1D601B5CC();
    v13 = v10;
    v14 = v12;
    LOBYTE(v12) = sub_1D6E27B78();

    if ((v12 & 1) != 0)
      sub_1D6DAC5AC(v6, v8, 4);
  }

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtC7NewsUI232SearchHomeCoordinatingController *v5;

  v4 = a3;
  v5 = self;
  sub_1D6551DB8();

}

@end
