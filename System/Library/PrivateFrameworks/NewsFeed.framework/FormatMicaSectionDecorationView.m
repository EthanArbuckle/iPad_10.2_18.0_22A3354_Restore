@implementation FormatMicaSectionDecorationView

- (_TtC8NewsFeed31FormatMicaSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed31FormatMicaSectionDecorationView *)sub_1BB075514(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed31FormatMicaSectionDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB076BDC();
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  v5 = a3;
  -[FormatMicaSectionDecorationView willMoveToSuperview:](&v8, sel_willMoveToSuperview_, v5);
  v6 = sub_1BB8736CC();
  if (v6)
  {
    v7 = (void *)v6;
    sub_1BB86F46C();

    v5 = v4;
    v4 = v7;
  }

}

- (void)didMoveToSuperview
{
  id v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  -[FormatMicaSectionDecorationView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  v3 = sub_1BB8736CC();
  if (v3)
  {
    v4 = (void *)v3;
    sub_1BB86F460();

    v2 = v4;
  }

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[FormatMicaSectionDecorationView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_1BB8736F0();

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC8NewsFeed31FormatMicaSectionDecorationView *v5;

  v4 = a3;
  v5 = self;
  sub_1BB075850(v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8NewsFeed31FormatMicaSectionDecorationView *v6;

  v5 = a3;
  v6 = self;
  sub_1BB075F44((uint64_t)a3);

}

- (void)gutterViewBoundsDidChange
{
  _TtC8NewsFeed31FormatMicaSectionDecorationView *v2;

  v2 = self;
  sub_1BB873744();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatMicaSectionDecorationView_micaView));
  swift_bridgeObjectRelease();
  sub_1BB07678C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31FormatMicaSectionDecorationView_model);
}

@end
