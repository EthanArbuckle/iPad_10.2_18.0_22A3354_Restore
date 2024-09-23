@implementation CUIKSemiConstantCache

void __39__CUIKSemiConstantCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (CUIKSemiConstantCache)init
{
  CUIKSemiConstantCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIKSemiConstantCache;
  v2 = -[CUIKSemiConstantCache init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentCategorySizeChanged_, *MEMORY[0x1E0DC48E8], 0);

    -[CUIKSemiConstantCache updateMetrics](v2, "updateMetrics");
  }
  return v2;
}

- (void)updateMetrics
{
  UIFont *dayOccurrenceUncompressedSecondaryTextFont;

  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_dayOccurrenceMinimumCachedLineHeightCompact = _Q0;
  *(_OWORD *)&self->_dayOccurrenceMinimumCachedLineHeightSmallCompact = _Q0;
  *(_OWORD *)&self->_dayReminderIntegrationCachedLineHeightCompact = _Q0;
  *(_OWORD *)&self->_dayReminderIntegrationCachedLineHeightSmallCompact = _Q0;
  dayOccurrenceUncompressedSecondaryTextFont = self->_dayOccurrenceUncompressedSecondaryTextFont;
  self->_dayOccurrenceUncompressedSecondaryTextFont = 0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

- (double)dayOccurrenceMinimumCachedLineHeightCompact
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayOccurrenceMinimumCachedLineHeightCompact, *MEMORY[0x1E0DC4AB8], 13.0, 7.5);
  return result;
}

- (UIFont)dayOccurrenceUncompressedSecondaryTextFont
{
  UIFont *dayOccurrenceUncompressedSecondaryTextFont;
  UIFont *v4;
  UIFont *v5;

  dayOccurrenceUncompressedSecondaryTextFont = self->_dayOccurrenceUncompressedSecondaryTextFont;
  if (!dayOccurrenceUncompressedSecondaryTextFont)
  {
    -[CUIKSemiConstantCache _dayOccurrenceFontWithStyle:size:regularSize:](self, "_dayOccurrenceFontWithStyle:size:regularSize:", *MEMORY[0x1E0DC4AA0], 11.0, 11.0);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dayOccurrenceUncompressedSecondaryTextFont;
    self->_dayOccurrenceUncompressedSecondaryTextFont = v4;

    dayOccurrenceUncompressedSecondaryTextFont = self->_dayOccurrenceUncompressedSecondaryTextFont;
  }
  return dayOccurrenceUncompressedSecondaryTextFont;
}

- (id)_dayOccurrenceFontWithStyle:(id)a3 size:(double)a4 regularSize:(double)a5
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v5 = a5 / a4;
  objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingBoldFontForTextStyle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;

  CUIKRoundToScreenScale(v5 * v9);
  objc_msgSend(v6, "fontWithSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)dayOccurrenceMinimumCachedLineHeightRegular
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayOccurrenceMinimumCachedLineHeightRegular, *MEMORY[0x1E0DC4AB8], 13.0, 11.0);
  return result;
}

- (double)dayOccurrenceMinimumCachedLineHeightSmallCompact
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayOccurrenceMinimumCachedLineHeightSmallCompact, *MEMORY[0x1E0DC4AA0], 11.0, 6.5);
  return result;
}

- (double)dayOccurrenceMinimumCachedLineHeightSmallRegular
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayOccurrenceMinimumCachedLineHeightSmallRegular, *MEMORY[0x1E0DC4AA0], 11.0, 11.0);
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightCompact
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayReminderIntegrationCachedLineHeightCompact, *MEMORY[0x1E0DC4AB8], 13.0, 13.0);
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightRegular
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayReminderIntegrationCachedLineHeightRegular, *MEMORY[0x1E0DC4AB8], 13.0, 13.0);
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightSmallCompact
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayReminderIntegrationCachedLineHeightSmallCompact, *MEMORY[0x1E0DC4AA0], 11.0, 11.0);
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightSmallRegular
{
  double result;

  -[CUIKSemiConstantCache _cachedLineHeight:style:size:regularSize:](self, "_cachedLineHeight:style:size:regularSize:", &self->_dayReminderIntegrationCachedLineHeightSmallRegular, *MEMORY[0x1E0DC4AB8], 13.0, 13.0);
  return result;
}

- (double)_cachedLineHeight:(double *)a3 style:(id)a4 size:(double)a5 regularSize:(double)a6
{
  double v6;
  void *v8;
  const char *v9;

  v6 = *a3;
  if (*a3 < 0.0)
  {
    -[CUIKSemiConstantCache _dayOccurrenceFontWithStyle:size:regularSize:](self, "_dayOccurrenceFontWithStyle:size:regularSize:", a4, a5, a6, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = -[UIFont cuik_lineHeight](v8, v9);

    return *a3;
  }
  return v6;
}

- (id)commentIconStringForFont:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "tertiaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "cuik_configurationWithFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_systemImageNamed:withConfiguration:", CFSTR("message.fill"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cuik_imageWithTintColor:asTemplate:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC12B0], "cuik_textAttachmentWithImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)birthdayImageForFont:(id)a3
{
  return -[CUIKSemiConstantCache symbolImage:forFont:](self, "symbolImage:forFont:", CFSTR("gift"), a3);
}

- (id)symbolImage:(id)a3 forFont:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "cuik_configurationWithFont:scale:", a4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "cuik_systemImageNamed:withConfiguration:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CUIKSemiConstantCache symbolImage:forFont:].cold.1(v8);

    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOccurrenceUncompressedSecondaryTextFont, 0);
}

- (void)symbolImage:(os_log_t)log forFont:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_ERROR, "-symbolImage:forFont: received a nil font, returning nil", v1, 2u);
}

@end
