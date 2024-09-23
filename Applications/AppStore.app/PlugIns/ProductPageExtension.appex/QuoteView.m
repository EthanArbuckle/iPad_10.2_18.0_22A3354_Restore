@implementation QuoteView

- (_TtC20ProductPageExtension9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension9QuoteView *)sub_100335E9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension9QuoteView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension9QuoteView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkAspectRatio;
  v6 = type metadata accessor for AspectRatio(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_isFullWidthArtwork) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkHasRoundedCorners) = 0;
  v7 = a3;

  result = (_TtC20ProductPageExtension9QuoteView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/QuoteView.swift", 36, 2, 404, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension9QuoteView *v2;

  v2 = self;
  sub_10033662C();

}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_leadingQuote));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_trailingQuote));

  v3 = *(_QWORD *)&self->leadingQuote[OBJC_IVAR____TtC20ProductPageExtension9QuoteView_quoteGlyphs];
  swift_bridgeObjectRelease(*(_QWORD *)&self->quoteLabel[OBJC_IVAR____TtC20ProductPageExtension9QuoteView_quoteGlyphs]);
  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_creditLabel));
  sub_1001EA5A0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkAspectRatio);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkView));
}

@end
