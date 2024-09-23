@implementation TagFeedViewerBarCompressionAnimating

- (double)topOffset
{
  double v2;

  swift_retain();
  v2 = sub_1D6555CBC();
  swift_release();
  return v2;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (BOOL)shouldAlwaysScrollToTopOnTap
{
  return 1;
}

- (void)prepareForUpdates
{
  *(_QWORD *)self->percentage = 0;
}

- (void)updateWithPercentage:(double)a3
{
  *(double *)self->percentage = a3;
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  swift_retain();
  sub_1D655603C(a3, a4);
  swift_release();
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  swift_retain();
  v4 = sub_1D65564AC();

  swift_release();
  return v4;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

@end
