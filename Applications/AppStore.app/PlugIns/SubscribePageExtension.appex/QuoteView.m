@implementation QuoteView

- (_TtC22SubscribePageExtension9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension9QuoteView *)sub_100146394(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension9QuoteView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension9QuoteView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkAspectRatio;
  v6 = type metadata accessor for AspectRatio(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_isFullWidthArtwork) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkHasRoundedCorners) = 0;
  v7 = a3;

  result = (_TtC22SubscribePageExtension9QuoteView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/QuoteView.swift", 38, 2, 404, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension9QuoteView *v2;

  v2 = self;
  sub_100146B24();

}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_leadingQuote));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_trailingQuote));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_quoteLabel));
  v3 = *(_QWORD *)&self->leadingQuote[OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_quoteGlyphs];
  swift_bridgeObjectRelease(*(_QWORD *)&self->quoteLabel[OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_quoteGlyphs]);
  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_creditLabel));
  sub_100098884((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkAspectRatio);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkView));
}

@end
