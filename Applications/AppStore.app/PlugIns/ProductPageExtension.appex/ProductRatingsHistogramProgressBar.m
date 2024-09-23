@implementation ProductRatingsHistogramProgressBar

- (_TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar)init
{
  return (_TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar *)sub_100084C58();
}

- (_TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar *result;

  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar_progress) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductRatingsHistogramView.swift", 54, 2, 253, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar *v2;

  v2 = self;
  sub_100084E5C();

}

- (_TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar)initWithFrame:(CGRect)a3
{
  sub_100068FF4((uint64_t)self, (uint64_t)a2, (uint64_t)"ProductPageExtension.ProductRatingsHistogramProgressBar", 55);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_95941BD34515C691DC8D8E2915DD56D934ProductRatingsHistogramProgressBar_progressView));
}

@end
