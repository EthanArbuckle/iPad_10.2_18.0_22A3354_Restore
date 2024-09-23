@implementation ProductRatingsHistogramProgressBar

- (_TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar)init
{
  return (_TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar *)sub_1003AADB8();
}

- (_TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar *result;

  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar_progress) = 0;
  v4 = a3;

  result = (_TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductRatingsHistogramView.swift", 42, 2, 253, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar *v2;

  v2 = self;
  sub_1003AAFBC();

}

- (_TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar)initWithFrame:(CGRect)a3
{
  sub_1003278C4((uint64_t)self, (uint64_t)a2, (uint64_t)"AppStore.ProductRatingsHistogramProgressBar", 43);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_840DC1D510C0F7BB369C0CA7753B475934ProductRatingsHistogramProgressBar_progressView));
}

@end
