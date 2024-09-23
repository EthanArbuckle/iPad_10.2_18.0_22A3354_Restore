@implementation MixedMediaLockupPlaceholderView

- (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView *)sub_100091ED8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100092AC0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView *v2;

  v2 = self;
  sub_10009252C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_smallLockupPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_supplementaryTextPlaceholder));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension31MixedMediaLockupPlaceholderView_contentType;
  v4 = type metadata accessor for Shelf.ContentType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
