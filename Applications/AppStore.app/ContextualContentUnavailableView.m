@implementation ContextualContentUnavailableView

- (_TtC8AppStore32ContextualContentUnavailableView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10057D8CC();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[ContextualContentUnavailableView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore32ContextualContentUnavailableView_emptyReason];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_10057D284();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore32ContextualContentUnavailableView_emptyReason), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC8AppStore32ContextualContentUnavailableView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore32ContextualContentUnavailableView *result;

  result = (_TtC8AppStore32ContextualContentUnavailableView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ContextualContentUnavailableView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ContextualContentUnavailableView_emptyReason));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ContextualContentUnavailableView_queryContext));
}

@end
