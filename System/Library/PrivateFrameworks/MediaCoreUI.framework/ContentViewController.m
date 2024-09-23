@implementation ContentViewController

- (void)viewSafeAreaInsetsDidChange
{
  _BYTE *v2;
  _BYTE *v3;
  _BYTE *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ContentViewController();
  v2 = v5.receiver;
  -[ContentViewController viewSafeAreaInsetsDidChange](&v5, sel_viewSafeAreaInsetsDidChange);
  if (v2[OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_isActive] != 1)
    goto LABEL_4;
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    sub_2412EB7E8(v3);

    v2 = v4;
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)viewDidLayoutSubviews
{
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *v2;

  v2 = self;
  sub_2412DA6AC();

}

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_isActive) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_backdropView) = 0;
  v4 = a3;

  result = (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *)sub_2414B5674();
  __break(1u);
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_statusBarStyle);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_2414946D4(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *result;

  v4 = a4;
  result = (_TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC21ContentViewController_backdropView));
}

@end
