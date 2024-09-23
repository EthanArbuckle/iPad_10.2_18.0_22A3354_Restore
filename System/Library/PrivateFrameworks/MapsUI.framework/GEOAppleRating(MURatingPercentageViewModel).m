@implementation GEOAppleRating(MURatingPercentageViewModel)

- (id)categoryTitle
{
  if (objc_msgSend(a1, "ratingType"))
    objc_msgSend(a1, "localizedTitle");
  else
    _MULocalizedStringFromThisBundle(CFSTR("Overall [Placecard]"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)displayPercentage
{
  double v1;

  objc_msgSend(a1, "percentage");
  return (unint64_t)(v1 * 100.0);
}

- (uint64_t)hasSubtitle
{
  return 1;
}

- (BOOL)hasPercentage
{
  unint64_t UInteger;

  UInteger = GEOConfigGetUInteger();
  return UInteger <= (int)objc_msgSend(a1, "numberOfRatingsUsedForScore");
}

@end
