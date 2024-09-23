@implementation EKUISemiConstantCache

- (EKUISemiConstantCache)init
{
  EKUISemiConstantCache *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUISemiConstantCache;
  v2 = -[EKUISemiConstantCache init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentCategorySizeChanged_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x1E0D0CA70], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__orientationChanged_, *MEMORY[0x1E0DC4960], 0);

    -[EKUISemiConstantCache updateMetrics](v2, "updateMetrics");
  }
  return v2;
}

- (void)updateMetrics
{
  UIFont *weekAllDayLabelFontCompact;
  UIFont *weekAllDayLabelFontRegular;
  UIFont *weekAllDayTodayLabelFontCompact;
  UIImage *inboxDisclosureImage;

  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_weekAllDayBaselineForLargeFormatWeekView = _Q0;
  *(_OWORD *)&self->_weekAllDayOccurrenceHeight = _Q0;
  weekAllDayLabelFontCompact = self->_weekAllDayLabelFontCompact;
  self->_weekAllDayLabelFontCompact = 0;

  weekAllDayLabelFontRegular = self->_weekAllDayLabelFontRegular;
  self->_weekAllDayLabelFontRegular = 0;

  weekAllDayTodayLabelFontCompact = self->_weekAllDayTodayLabelFontCompact;
  self->_weekAllDayTodayLabelFontCompact = 0;

  inboxDisclosureImage = self->_inboxDisclosureImage;
  self->_inboxDisclosureImage = 0;

  self->_minYearMonthHeaderFontSizeUsed = 0.0;
}

void __39__EKUISemiConstantCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

- (void)_localeChanged:(id)a3
{
  self->_minYearMonthHeaderFontSizeUsed = 0.0;
}

- (id)statusGlyphForStatusType:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUISemiConstantCache _participantStatusFromDetailAttendeesStatus:](self, "_participantStatusFromDetailAttendeesStatus:", a3);
  attributedStatusGlyph();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_participantStatusFromDetailAttendeesStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_1AFA13038[a3];
}

- (id)inboxDisclosureImage
{
  UIImage *inboxDisclosureImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  inboxDisclosureImage = self->_inboxDisclosureImage;
  if (!inboxDisclosureImage)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v7);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v9 = self->_inboxDisclosureImage;
    self->_inboxDisclosureImage = v8;

    inboxDisclosureImage = self->_inboxDisclosureImage;
  }
  return inboxDisclosureImage;
}

- (UIFont)weekAllDayLabelFontCompact
{
  UIFont *weekAllDayLabelFontCompact;
  int v4;
  double v5;
  UIFont *v6;
  UIFont *v7;

  weekAllDayLabelFontCompact = self->_weekAllDayLabelFontCompact;
  if (!weekAllDayLabelFontCompact)
  {
    v4 = EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
    v5 = 13.0;
    if (v4)
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 13.0, 24.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v5);
    v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v7 = self->_weekAllDayLabelFontCompact;
    self->_weekAllDayLabelFontCompact = v6;

    weekAllDayLabelFontCompact = self->_weekAllDayLabelFontCompact;
  }
  return weekAllDayLabelFontCompact;
}

- (UIFont)weekAllDayLabelFontRegular
{
  UIFont *weekAllDayLabelFontRegular;
  int v4;
  double v5;
  UIFont *v6;
  UIFont *v7;

  weekAllDayLabelFontRegular = self->_weekAllDayLabelFontRegular;
  if (!weekAllDayLabelFontRegular)
  {
    v4 = EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
    v5 = 17.0;
    if (v4)
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 17.0, 24.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v5);
    v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v7 = self->_weekAllDayLabelFontRegular;
    self->_weekAllDayLabelFontRegular = v6;

    weekAllDayLabelFontRegular = self->_weekAllDayLabelFontRegular;
  }
  return weekAllDayLabelFontRegular;
}

- (UIFont)weekAllDayTodayLabelFontCompact
{
  UIFont *weekAllDayTodayLabelFontCompact;
  int v4;
  double v5;
  UIFont *v6;
  UIFont *v7;

  weekAllDayTodayLabelFontCompact = self->_weekAllDayTodayLabelFontCompact;
  if (!weekAllDayTodayLabelFontCompact)
  {
    v4 = EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
    v5 = 13.0;
    if (v4)
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 13.0, 24.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", v5);
    v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v7 = self->_weekAllDayTodayLabelFontCompact;
    self->_weekAllDayTodayLabelFontCompact = v6;

    weekAllDayTodayLabelFontCompact = self->_weekAllDayTodayLabelFontCompact;
  }
  return weekAllDayTodayLabelFontCompact;
}

- (double)weekAllDayBaselineForLargeFormatWeekView
{
  return self->_weekAllDayBaselineForLargeFormatWeekView;
}

- (void)setWeekAllDayBaselineForLargeFormatWeekView:(double)a3
{
  self->_weekAllDayBaselineForLargeFormatWeekView = a3;
}

- (double)weekAllDayBaselineForSmallFormatWeekView
{
  return self->_weekAllDayBaselineForSmallFormatWeekView;
}

- (void)setWeekAllDayBaselineForSmallFormatWeekView:(double)a3
{
  self->_weekAllDayBaselineForSmallFormatWeekView = a3;
}

- (double)weekAllDayOccurrenceHeight
{
  return self->_weekAllDayOccurrenceHeight;
}

- (void)setWeekAllDayOccurrenceHeight:(double)a3
{
  self->_weekAllDayOccurrenceHeight = a3;
}

- (double)weekAllDayOccurrenceHeightSmallText
{
  return self->_weekAllDayOccurrenceHeightSmallText;
}

- (void)setWeekAllDayOccurrenceHeightSmallText:(double)a3
{
  self->_weekAllDayOccurrenceHeightSmallText = a3;
}

- (double)minYearMonthHeaderFontSizeUsed
{
  return self->_minYearMonthHeaderFontSizeUsed;
}

- (void)setMinYearMonthHeaderFontSizeUsed:(double)a3
{
  self->_minYearMonthHeaderFontSizeUsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxDisclosureImage, 0);
  objc_storeStrong((id *)&self->_weekAllDayTodayLabelFontCompact, 0);
  objc_storeStrong((id *)&self->_weekAllDayLabelFontRegular, 0);
  objc_storeStrong((id *)&self->_weekAllDayLabelFontCompact, 0);
}

@end
