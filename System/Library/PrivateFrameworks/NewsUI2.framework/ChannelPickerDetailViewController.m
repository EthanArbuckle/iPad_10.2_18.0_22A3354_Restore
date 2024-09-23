@implementation ChannelPickerDetailViewController

- (_TtC7NewsUI233ChannelPickerDetailViewController)initWithCoder:(id)a3
{
  _TtC7NewsUI233ChannelPickerDetailViewController *result;

  result = (_TtC7NewsUI233ChannelPickerDetailViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI233ChannelPickerDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI233ChannelPickerDetailViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI233ChannelPickerDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_blueprintViewController));
  sub_1D60582EC((uint64_t)self + OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_model);
}

- (void)viewDidLoad
{
  _TtC7NewsUI233ChannelPickerDetailViewController *v2;

  v2 = self;
  sub_1D6056C70();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[ChannelPickerDetailViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
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
  -[ChannelPickerDetailViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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
  -[ChannelPickerDetailViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6058110();

}

- (void)dismissVC
{
  _QWORD *v3;
  uint64_t v4;
  _TtC7NewsUI233ChannelPickerDetailViewController *v5;
  id v6;

  v3 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_eventHandler)+ 6, (*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI233ChannelPickerDetailViewController_eventHandler))[9]);
  v4 = MEMORY[0x1D82919D4](*v3 + 16);
  if (v4)
  {
    v6 = (id)v4;
    v5 = self;
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

@end
