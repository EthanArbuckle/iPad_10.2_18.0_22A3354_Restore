@implementation QuoteView

- (_TtC8AppStore9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore9QuoteView *)sub_1000CBCF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore9QuoteView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore9QuoteView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore9QuoteView_artworkAspectRatio;
  v6 = type metadata accessor for AspectRatio(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_isFullWidthArtwork) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_artworkHasRoundedCorners) = 0;
  v7 = a3;

  result = (_TtC8AppStore9QuoteView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/QuoteView.swift", 24, 2, 404, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore9QuoteView *v2;

  v2 = self;
  sub_1000CC484();

}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->leadingQuote[OBJC_IVAR____TtC8AppStore9QuoteView_quoteGlyphs];
  swift_bridgeObjectRelease(*(_QWORD *)&self->quoteLabel[OBJC_IVAR____TtC8AppStore9QuoteView_quoteGlyphs]);
  swift_bridgeObjectRelease(v3);

  sub_1000CDA80((uint64_t)self + OBJC_IVAR____TtC8AppStore9QuoteView_artworkAspectRatio);
}

@end
