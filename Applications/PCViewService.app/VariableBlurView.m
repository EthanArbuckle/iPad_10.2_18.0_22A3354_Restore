@implementation VariableBlurView

- (_TtC13PCViewService16VariableBlurView)init
{
  return (_TtC13PCViewService16VariableBlurView *)sub_10002D4F4();
}

- (_TtC13PCViewService16VariableBlurView)initWithCoder:(id)a3
{
  return (_TtC13PCViewService16VariableBlurView *)sub_10002D618(a3);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VariableBlurView();
  v2 = (char *)v4.receiver;
  -[VariableBlurView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC13PCViewService16VariableBlurView_backdropLayer];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (_TtC13PCViewService16VariableBlurView)initWithFrame:(CGRect)a3
{
  _TtC13PCViewService16VariableBlurView *result;

  result = (_TtC13PCViewService16VariableBlurView *)_swift_stdlib_reportUnimplementedInitializer("PCViewService.VariableBlurView", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13PCViewService16VariableBlurView_backdropLayer));
}

@end
