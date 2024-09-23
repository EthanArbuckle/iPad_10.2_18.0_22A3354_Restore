@implementation MKTransitSectionPagingFilter

+ (id)defaultFilterForDepartures
{
  MKTransitSectionPagingFilter *v3;

  v3 = objc_alloc_init(MKTransitSectionPagingFilter);
  -[MKTransitSectionPagingFilter setLimitNumLines:](v3, "setLimitNumLines:", 1);
  -[MKTransitSectionPagingFilter setNumLinesFallbackThreshold:](v3, "setNumLinesFallbackThreshold:", objc_msgSend(a1, "_kMaxLinesInSectionBeforePage"));
  -[MKTransitSectionPagingFilter setNumLinesFallbackValue:](v3, "setNumLinesFallbackValue:", objc_msgSend(a1, "_kNumLinesFallbackValue"));
  return v3;
}

+ (id)defaultFilterForInactiveLines
{
  MKTransitSectionPagingFilter *v3;

  v3 = objc_alloc_init(MKTransitSectionPagingFilter);
  -[MKTransitSectionPagingFilter setLimitNumLines:](v3, "setLimitNumLines:", 1);
  -[MKTransitSectionPagingFilter setNumLinesFallbackThreshold:](v3, "setNumLinesFallbackThreshold:", objc_msgSend(a1, "_kMaxLinesInSectionBeforePage"));
  -[MKTransitSectionPagingFilter setNumLinesFallbackValue:](v3, "setNumLinesFallbackValue:", objc_msgSend(a1, "_kNumLinesFallbackValue"));
  return v3;
}

+ (unint64_t)_kNumLinesFallbackValue
{
  return -1;
}

- (BOOL)limitNumLines
{
  return self->_limitNumLines;
}

- (void)setLimitNumLines:(BOOL)a3
{
  self->_limitNumLines = a3;
}

- (unint64_t)numLinesFallbackThreshold
{
  return self->_numLinesFallbackThreshold;
}

- (void)setNumLinesFallbackThreshold:(unint64_t)a3
{
  self->_numLinesFallbackThreshold = a3;
}

- (unint64_t)numLinesFallbackValue
{
  return self->_numLinesFallbackValue;
}

- (void)setNumLinesFallbackValue:(unint64_t)a3
{
  self->_numLinesFallbackValue = a3;
}

@end
