@implementation MixedMediaLockupPlaceholderView

- (_TtC20ProductPageExtension31MixedMediaLockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31MixedMediaLockupPlaceholderView *)sub_10008156C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31MixedMediaLockupPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100082114();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31MixedMediaLockupPlaceholderView *v2;

  v2 = self;
  sub_100081BC0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31MixedMediaLockupPlaceholderView_artworkPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31MixedMediaLockupPlaceholderView_smallLockupPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31MixedMediaLockupPlaceholderView_supplementaryTextPlaceholder));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31MixedMediaLockupPlaceholderView_contentType;
  v4 = type metadata accessor for Shelf.ContentType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
