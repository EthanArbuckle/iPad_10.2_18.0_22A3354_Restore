@implementation ContextualContentUnavailableView

- (_TtC22SubscribePageExtension32ContextualContentUnavailableView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10006CB38();
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension32ContextualContentUnavailableView_emptyReason];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
  sub_10006C478();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension32ContextualContentUnavailableView_emptyReason), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC22SubscribePageExtension32ContextualContentUnavailableView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension32ContextualContentUnavailableView *result;

  result = (_TtC22SubscribePageExtension32ContextualContentUnavailableView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ContextualContentUnavailableView", 55, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ContextualContentUnavailableView_emptyReason));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ContextualContentUnavailableView_queryContext));
}

@end
