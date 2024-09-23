@implementation _MarkupViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (double)_maxImageDimensionInView
{
  return 5120.0;
}

- (CGSize)adjustedSourceImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_1000041B4();
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC16ContinuityMarkup21_MarkupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC16ContinuityMarkup21_MarkupViewController *)sub_100004254((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_1000041C8);
}

- (_TtC16ContinuityMarkup21_MarkupViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16ContinuityMarkup21_MarkupViewController *result;

  v3 = a3;
  sub_1000042C0();
  return result;
}

@end
