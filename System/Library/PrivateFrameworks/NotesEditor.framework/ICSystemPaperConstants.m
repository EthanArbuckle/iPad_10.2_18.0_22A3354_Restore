@implementation ICSystemPaperConstants

+ (double)linkBarHeight
{
  return 42.0;
}

+ (double)noteLeadingMargin
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)v3 >= *MEMORY[0x1E0DC48C0])
  {
    v5 = 0x4048000000000000;
LABEL_10:
    v4 = *(double *)&v5;
    goto LABEL_11;
  }
  if ((unint64_t)v3 >= *MEMORY[0x1E0DC48C8])
  {
    v5 = 0x4044000000000000;
    goto LABEL_10;
  }
  if ((unint64_t)v3 >= *MEMORY[0x1E0DC48D8])
  {
    v5 = 0x4040000000000000;
    goto LABEL_10;
  }
  if ((unint64_t)v3 >= *MEMORY[0x1E0DC48F8])
    v4 = 24.0;
  else
    v4 = 16.0;
LABEL_11:

  return v4;
}

+ (double)linkBarItemsHeight
{
  return 24.0;
}

+ (double)linkBarAnimationDuration
{
  return 0.33;
}

+ (double)delayBeforePageControlFadesInInitially
{
  return 0.33;
}

@end
