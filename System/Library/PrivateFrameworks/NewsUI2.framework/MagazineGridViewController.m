@implementation MagazineGridViewController

- (_TtC7NewsUI226MagazineGridViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6A32A24();
}

- (_TtC7NewsUI226MagazineGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI226MagazineGridViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI226MagazineGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_viewControllerConfig));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_offlineAlertControllerFactory);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___selectAllBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___doneBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___downloadBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___removeIssuesAndDownloadsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___removeDownloadsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___selectionCountBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController____lazy_storage___selectionCountLabel));
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI226MagazineGridViewController *v2;

  v2 = self;
  sub_1D6A2D5C0();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[MagazineGridViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7NewsUI226MagazineGridViewController *v4;

  v4 = self;
  sub_1D6A2DB14(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsUI226MagazineGridViewController *v4;

  v4 = self;
  sub_1D6A2DD28(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC7NewsUI226MagazineGridViewController *v6;
  objc_super v7;
  objc_super v8;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = self;
  -[MagazineGridViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  if (*((_BYTE *)&v6->super.super.super.super.isa
       + OBJC_IVAR____TtC7NewsUI226MagazineGridViewController_viewControllerConfig) == 1)
  {
    swift_getObjectType();
    sub_1D6E1DD44();
    if (-[MagazineGridViewController isEditing](v6, sel_isEditing))
    {
      v7.receiver = v6;
      v7.super_class = ObjectType;
      -[MagazineGridViewController setEditing:animated:](&v7, sel_setEditing_animated_, 0, v3);
      sub_1D6A2E044(0, v3, 1);
    }
  }

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
  -[MagazineGridViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6A32AD4();

}

- (id)contentScrollView
{
  _TtC7NewsUI226MagazineGridViewController *v2;
  void *v3;

  v2 = self;
  sub_1D6E1E9BC();
  v3 = (void *)sub_1D6E1E224();

  swift_release();
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v6 = v7.receiver;
  -[MagazineGridViewController setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
  sub_1D6A2E044(v5, v4, 1);

}

- (void)doSelectAllAction
{
  _TtC7NewsUI226MagazineGridViewController *v2;

  v2 = self;
  sub_1D6A2F88C();

}

- (void)doDoneAction
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[MagazineGridViewController setEditing:animated:](&v3, sel_setEditing_animated_, 0, 1);
  sub_1D6A2E044(0, 1, 1);

}

- (void)doDownloadAction
{
  _TtC7NewsUI226MagazineGridViewController *v2;

  v2 = self;
  sub_1D6A3008C();

}

- (void)doRemoveIssuesAndDownloadsAction
{
  _TtC7NewsUI226MagazineGridViewController *v2;

  v2 = self;
  sub_1D6A30670();

}

- (void)doRemoveDownloadsAction
{
  _TtC7NewsUI226MagazineGridViewController *v2;

  v2 = self;
  sub_1D6A308B0();

}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7NewsUI226MagazineGridViewController *v4;
  id v5;

  v3 = a3;
  v4 = self;
  sub_1D6E1E9BC();
  v5 = (id)sub_1D6E1E224();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);

}

@end
