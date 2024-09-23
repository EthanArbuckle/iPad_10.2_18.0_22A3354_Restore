@implementation BackdropHostView

- (_TtC11MediaCoreUI16BackdropHostView)initWithCoder:(id)a3
{
  id v4;
  _TtC11MediaCoreUI16BackdropHostView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_renderer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_image) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_isPaused) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_intensity) = 1045220557;
  v4 = a3;

  result = (_TtC11MediaCoreUI16BackdropHostView *)sub_2414B5674();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[BackdropHostView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_contentView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (_TtC11MediaCoreUI16BackdropHostView)initWithFrame:(CGRect)a3
{
  _TtC11MediaCoreUI16BackdropHostView *result;

  result = (_TtC11MediaCoreUI16BackdropHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
