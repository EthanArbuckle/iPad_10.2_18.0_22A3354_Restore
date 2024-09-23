@implementation CUIKOROccurrenceState

- (UIColor)titleTextColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[CUIKOROccurrenceState occurrence](self, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKOccurrenceTextColor(v4, -[CUIKOROccurrenceState isCancelled](self, "isCancelled"), -[CUIKOROccurrenceState isDeclined](self, "isDeclined"), -[CUIKOROccurrenceState isSelected](self, "isSelected"), -[CUIKOROccurrenceState needsReply](self, "needsReply"), -[CUIKOROccurrenceState isReminder](self, "isReminder"), -[CUIKOROccurrenceState isCompleted](self, "isCompleted"), -[CUIKOROccurrenceState drawReminderAsEditable](self, "drawReminderAsEditable"), -[CUIKOROccurrenceState isBirthday](self, "isBirthday"), -[CUIKOROccurrenceState userInterfaceStyle](self, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v5;
}

- (BOOL)isCancelled
{
  return -[EKEvent status](self->_occurrence, "status") == EKEventStatusCanceled;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)needsReply
{
  return CUIKEventDisplaysAsNeedsReply(self->_occurrence);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)isDeclined
{
  return CUIKEventDisplaysAsDeclined(self->_occurrence);
}

- (unint64_t)fontCompressionDegree
{
  int64_t v3;
  double v4;
  double v5;
  void *v7;
  const char *v8;
  double v9;

  v3 = -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass");
  -[CUIKOROccurrenceState textSpace](self, "textSpace");
  v5 = v4;
  if (-[CUIKOROccurrenceState isAllDay](self, "isAllDay") || -[CUIKOROccurrenceState isBirthday](self, "isBirthday"))
    return 0;
  if (-[CUIKOROccurrenceState usesSmallText](self, "usesSmallText"))
    +[CUIKORFontUtils defaultOccurrenceSmallPrimaryTextFontForSizeClass:](CUIKORFontUtils, "defaultOccurrenceSmallPrimaryTextFontForSizeClass:", v3);
  else
    +[CUIKORFontUtils defaultOccurrencePrimaryTextFontForSizeClass:](CUIKORFontUtils, "defaultOccurrencePrimaryTextFontForSizeClass:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIFont cuik_lineHeight](v7, v8);

  if (v5 >= v9 * 0.75)
    return v5 < v9;
  else
    return 2;
}

- (BOOL)isAllDay
{
  void *v3;
  void *v4;
  char v5;

  -[CUIKOROccurrenceState allDayOverride](self, "allDayOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[EKEvent isAllDay](self->_occurrence, "isAllDay");
  -[CUIKOROccurrenceState allDayOverride](self, "allDayOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (CGSize)textSpace
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CUIKOROccurrenceState languageAwareInsets](self, "languageAwareInsets");
  v4 = v3;
  v6 = v5;
  -[CUIKOROccurrenceState estimatedTextFrame](self, "estimatedTextFrame");
  v8 = v7;
  v10 = v9 - (v4 + v6);
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGRect)estimatedTextFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGRect v60;
  CGRect result;

  x = self->_estimatedTextFrame.origin.x;
  y = self->_estimatedTextFrame.origin.y;
  width = self->_estimatedTextFrame.size.width;
  height = self->_estimatedTextFrame.size.height;
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  if (CGRectEqualToRect(v60, *MEMORY[0x1E0C9D628]))
  {
    -[CUIKOROccurrenceState backgroundRect](self, "backgroundRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[CUIKOROccurrenceState travelTime](self, "travelTime");
    v16 = v15;
    v17 = -[CUIKOROccurrenceState isAllDay](self, "isAllDay");
    if (v16 > 0.0 && !v17)
    {
      -[CUIKOROccurrenceState travelTimeHeight](self, "travelTimeHeight");
      v10 = v18;
      v14 = v14 - v18;
    }
    -[CUIKOROccurrenceState padding](self, "padding");
    v20 = v19;
    v22 = v10 + v21;
    v24 = v19 + v23;
    v26 = v14 - (v21 + v25);
    if (-[CUIKOROccurrenceState isReminder](self, "isReminder"))
    {
      +[CUIKORStringGenerator naturalHeightForPrimaryTextUsingSmallText:sizeClass:](CUIKORStringGenerator, "naturalHeightForPrimaryTextUsingSmallText:sizeClass:", self->_usesSmallText, self->_horizontalSizeClass);
      v28 = v26 - v27;
      v29 = v28 * 0.5;
      v26 = v26 - fmax(v28, 0.0);
      v30 = v28 <= 0.0;
      v31 = -0.0;
      if (!v30)
        v31 = v29;
      v22 = v22 + v31;
    }
    v32 = v8 + v20;
    v59 = v12 - v24;
    v33 = 0.0;
    if (!-[CUIKOROccurrenceState isAllDay](self, "isAllDay")
      && !-[CUIKOROccurrenceState isReminder](self, "isReminder"))
    {
      +[CUIKORImageUtils occurrencePadding](CUIKORImageUtils, "occurrencePadding");
      v35 = v34;
      +[CUIKORImageUtils colorBarThickness](CUIKORImageUtils, "colorBarThickness");
      v33 = v35 + v36 + 0.0;
    }
    v37 = *MEMORY[0x1E0DC49E8];
    v38 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v40 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v39 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    +[CUIKInterface shared](CUIKInterface, "shared");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "interfaceIsLeftToRight");

    if (v42)
      v43 = v33;
    else
      v43 = v38;
    if (v42)
      v44 = v39;
    else
      v44 = v33;
    v45 = v32 + v43;
    v46 = v22 + v37;
    v47 = v59 - (v43 + v44);
    v48 = v26 - (v37 + v40);
    -[CUIKOROccurrenceState visibleHeight](self, "visibleHeight");
    if (v49 < v48)
      v48 = v49;
    -[CUIKOROccurrenceState languageAwareInsets](self, "languageAwareInsets");
    x = CUIKRoundRectToScreenScale(v45, v46 - v50, v47, v48 + v50 + v51);
    y = v52;
    height = v53;
    self->_estimatedTextFrame.origin.x = x;
    self->_estimatedTextFrame.origin.y = v52;
    width = fmax(v54, 0.0);
    self->_estimatedTextFrame.size.width = width;
    self->_estimatedTextFrame.size.height = v53;
  }
  v55 = x;
  v56 = y;
  v57 = width;
  v58 = height;
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v55;
  return result;
}

- (BOOL)isBirthday
{
  void *v3;
  BOOL v4;

  -[EKEvent calendar](self->_occurrence, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") == 4 || -[CUIKOROccurrenceState birthdayCount](self, "birthdayCount") > 0;

  return v4;
}

void __49__CUIKOROccurrenceState_performChangesWithState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "occurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOccurrences:", v5);

  objc_msgSend(v4, "setOccurrenceIsFirstVisibleDayOfEvent:", objc_msgSend(*(id *)(a1 + 32), "occurrenceIsFirstVisibleDayOfEvent"));
  objc_msgSend(v4, "setIsProposedTime:", objc_msgSend(*(id *)(a1 + 32), "isProposedTime"));
  objc_msgSend(v4, "setIsSelected:", objc_msgSend(*(id *)(a1 + 32), "isSelected"));
  objc_msgSend(v4, "setIsDimmed:", objc_msgSend(*(id *)(a1 + 32), "isDimmed"));
  objc_msgSend(v4, "setUsesSmallText:", objc_msgSend(*(id *)(a1 + 32), "usesSmallText"));
  objc_msgSend(*(id *)(a1 + 32), "travelTime");
  objc_msgSend(v4, "setTravelTime:");
  objc_msgSend(*(id *)(a1 + 32), "backgroundRect");
  objc_msgSend(v4, "setBackgroundRect:");
  objc_msgSend(*(id *)(a1 + 32), "travelTimeHeight");
  objc_msgSend(v4, "setTravelTimeHeight:");
  objc_msgSend(*(id *)(a1 + 32), "visibleHeight");
  objc_msgSend(v4, "setVisibleHeight:");
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "userInterfaceStyle"));
  objc_msgSend(v4, "setHorizontalSizeClass:", objc_msgSend(*(id *)(a1 + 32), "horizontalSizeClass"));
  objc_msgSend(v4, "setBirthdayCount:", objc_msgSend(*(id *)(a1 + 32), "birthdayCount"));
  objc_msgSend(v4, "setIsMiniPreviewInEventDetail:", objc_msgSend(*(id *)(a1 + 32), "isMiniPreviewInEventDetail"));
  objc_msgSend(*(id *)(a1 + 32), "allDayOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllDayOverride:", v6);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setTraitCollection:", v7);

}

- (UIEdgeInsets)languageAwareInsets
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "languageAwareInsetsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "CUIKEdgeInsetsValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v16 = (double *)MEMORY[0x1E0DC49E8];
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    +[CUIKORFontUtils defaultOccurrencePrimaryTextFontForSizeClass:](CUIKORFontUtils, "defaultOccurrencePrimaryTextFontForSizeClass:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (CTFontGetLanguageAwareOutsets())
    {
      v9 = CUIKCeilToScreenScale(0.0);
      v13 = CUIKCeilToScreenScale(0.0);
    }
    else
    {
      v13 = v16[2];
      v9 = *v16;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCUIKEdgeInsets:", v9, v11, v13, v15, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, v5);

  }
  -[CUIKOROccurrenceState title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "tallCharacterSetCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "rangeOfCharacterFromSet:", v19);

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v13 + 4.0;
    v9 = v9 + 4.0;
  }

  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (NSString)title
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKEvent *occurrence;
  void *v11;
  uint64_t v12;

  if (-[CUIKOROccurrenceState birthdayCount](self, "birthdayCount") < 2)
  {
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("New Event"), &stru_1E6EBAE30, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    occurrence = self->_occurrence;
    if (occurrence)
    {
      -[EKEvent title](occurrence, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        CUIKDisplayedTitleForEvent(self->_occurrence);
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }
      v4 = v9;

      v7 = v4;
    }
    else
    {
      v4 = v9;
      v7 = v4;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ birthdays"), &stru_1E6EBAE30, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKLocalizedStringForInteger(self->_birthdayCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (int64_t)birthdayCount
{
  return self->_birthdayCount;
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

+ (NSCache)languageAwareInsetsCache
{
  if (languageAwareInsetsCache_onceToken != -1)
    dispatch_once(&languageAwareInsetsCache_onceToken, &__block_literal_global_25);
  return (NSCache *)(id)languageAwareInsetsCache_cache;
}

- (void)setVisibleHeight:(double)a3
{
  CGSize v3;

  if (vabdd_f64(a3, self->_visibleHeight) >= 2.22044605e-16)
  {
    self->_visibleHeight = a3;
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_estimatedTextFrame.size = v3;
  }
}

- (void)setUsesSmallText:(BOOL)a3
{
  self->_usesSmallText = a3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setTravelTimeHeight:(double)a3
{
  self->_travelTimeHeight = a3;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (void)setTraitCollection:(id)a3
{
  CGSize v4;

  objc_storeStrong((id *)&self->_traitCollection, a3);
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_estimatedTextFrame.size = v4;
}

- (void)setOccurrence:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *occurrences;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_occurrence, a3);
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    occurrences = self->_occurrences;
    self->_occurrences = v6;
  }
  else
  {
    occurrences = self->_occurrences;
    self->_occurrences = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void)setIsProposedTime:(BOOL)a3
{
  self->_isProposedTime = a3;
}

- (void)setIsDimmed:(BOOL)a3
{
  self->_isDimmed = a3;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (void)setBirthdayCount:(int64_t)a3
{
  self->_birthdayCount = a3;
}

- (void)setBackgroundRect:(CGRect)a3
{
  CGSize v4;

  if (a3.size.width != self->_backgroundRect.size.width || a3.size.height != self->_backgroundRect.size.height)
  {
    self->_backgroundRect = a3;
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_estimatedTextFrame.size = v4;
  }
}

- (double)travelTime
{
  return self->_travelTime;
}

- (CGRect)backgroundRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundRect.origin.x;
  y = self->_backgroundRect.origin.y;
  width = self->_backgroundRect.size.width;
  height = self->_backgroundRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)visibleHeight
{
  return self->_visibleHeight;
}

- (UIFont)primaryTextFont
{
  return (UIFont *)-[CUIKOROccurrenceState primaryTextFontBold:](self, "primaryTextFontBold:", 1);
}

- (BOOL)usesSmallText
{
  return -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass") != 2 && self->_usesSmallText;
}

- (UIEdgeInsets)padding
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "defaultPadding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CUIKOROccurrenceState usesSmallText](self, "usesSmallText")
    && !-[CUIKOROccurrenceState isMiniPreviewInEventDetail](self, "isMiniPreviewInEventDetail"))
  {
    +[CUIKInterface shared](CUIKInterface, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "interfaceIsLeftToRight");

    if (v12)
      v10 = 0.0;
    else
      v10 = 2.0;
    if (v12)
      v6 = 2.0;
    else
      v6 = 0.0;
    CUIKRoundToScreenScale(4.0);
    v4 = v13;
  }
  v14 = v8 + (double)(-[CUIKOROccurrenceState reminderStackDepth](self, "reminderStackDepth") - 1) * 2.0;
  v15 = v4;
  v16 = v6;
  v17 = v10;
  result.right = v17;
  result.bottom = v14;
  result.left = v16;
  result.top = v15;
  return result;
}

- (EKEvent)occurrence
{
  return self->_occurrence;
}

+ (UIEdgeInsets)defaultPadding
{
  void *v2;
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  +[CUIKInterface shared](CUIKInterface, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceIsLeftToRight");

  v4 = 4.0;
  if (v3)
    v5 = 4.0;
  else
    v5 = 6.0;
  if (v3)
    v6 = 6.0;
  else
    v6 = 4.0;
  v7 = 4.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v7;
  return result;
}

- (double)travelTimeHeight
{
  return self->_travelTimeHeight;
}

- (BOOL)isTentative
{
  return (CUIKEventDisplaysAsTentative(self->_occurrence) & 1) != 0 || self->_isProposedTime;
}

- (BOOL)isDimmed
{
  return self->_isDimmed;
}

- (UIColor)displayColor
{
  void *v2;
  void *v3;

  -[EKEvent calendar](self->_occurrence, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (id)status
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (-[CUIKOROccurrenceState isDeclined](self, "isDeclined"))
  {
    CUIKBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("DECLINED");
  }
  else
  {
    if (!-[CUIKOROccurrenceState isCancelled](self, "isCancelled"))
    {
      v6 = 0;
      return v6;
    }
    CUIKBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CANCELED");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E6EBAE30, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performChangesWithState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CUIKOROccurrenceState_performChangesWithState___block_invoke;
  v6[3] = &unk_1E6EB7628;
  v7 = v4;
  v5 = v4;
  -[CUIKOROccurrenceState performChanges:](self, "performChanges:", v6);

}

- (void)performChanges:(id)a3
{
  id v5;
  BOOL isPerformingChanges;
  void *v7;
  id v8;

  v5 = a3;
  isPerformingChanges = self->_isPerformingChanges;
  v8 = v5;
  if (isPerformingChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIKOROccurrenceState.m"), 951, CFSTR("Re-entry not currently supported"));

    v5 = v8;
  }
  (*((void (**)(id, CUIKOROccurrenceState *))v5 + 2))(v5, self);
  self->_isPerformingChanges = isPerformingChanges;

}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  _BOOL8 occurrenceIsFirstVisibleDayOfEvent;
  unint64_t v6;
  int64_t userInterfaceStyle;
  int64_t horizontalSizeClass;

  v3 = self->_isDimmed + (unint64_t)self->_isSelected;
  v4 = -[EKEvent hash](self->_occurrence, "hash");
  occurrenceIsFirstVisibleDayOfEvent = self->_occurrenceIsFirstVisibleDayOfEvent;
  v6 = (unint64_t)((double)(unint64_t)((double)(unint64_t)(self->_backgroundRect.size.width
                                                                              + self->_backgroundRect.size.height
                                                                              + (double)(occurrenceIsFirstVisibleDayOfEvent
                                                                                       + self->_usesSmallText
                                                                                       + v3
                                                                                       + 13
                                                                                       * (-[UIColor hash](self->_displayColor, "hash")+ v4)))+ self->_travelTimeHeight * 13.0)+ self->_visibleHeight * 13.0);
  userInterfaceStyle = self->_userInterfaceStyle;
  horizontalSizeClass = self->_horizontalSizeClass;
  return v6
       + 13 * (horizontalSizeClass + userInterfaceStyle + -[UITraitCollection hash](self->_traitCollection, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  EKEvent *occurrence;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  double v9;
  double travelTimeHeight;
  double visibleHeight;
  int64_t userInterfaceStyle;
  int64_t horizontalSizeClass;
  uint64_t v14;
  uint64_t v15;
  UITraitCollection *traitCollection;
  uint64_t v17;
  char v18;
  double v19;
  BOOL v21;
  char v22;
  double v23;
  char v24;
  BOOL v27;
  CGSize v29;
  int8x16_t v30;
  CGSize size;
  int8x16_t v32;
  char v33;
  int v34;
  int occurrenceIsFirstVisibleDayOfEvent;
  int v36;
  int isSelected;
  char v38;
  BOOL v39;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = *((unsigned __int8 *)v4 + 12);
    isSelected = self->_isSelected;
    v39 = self->_isDimmed == *((unsigned __int8 *)v4 + 13);
    occurrence = self->_occurrence;
    v6 = v4[2];
    v7 = v4;
    v38 = -[EKEvent isEqual:](occurrence, "isEqual:", v6);
    v34 = v7[15];
    occurrenceIsFirstVisibleDayOfEvent = self->_occurrenceIsFirstVisibleDayOfEvent;
    v33 = -[UIColor isEqual:](self->_displayColor, "isEqual:", *((_QWORD *)v7 + 4));
    LODWORD(occurrence) = self->_usesSmallText;
    v8 = v7[14];
    size = self->_backgroundRect.size;
    v32 = *(int8x16_t *)(v7 + 120);
    v29 = self->_estimatedTextFrame.size;
    v30 = *(int8x16_t *)(v7 + 152);
    v9 = *((double *)v7 + 8);
    travelTimeHeight = self->_travelTimeHeight;
    visibleHeight = self->_visibleHeight;
    userInterfaceStyle = self->_userInterfaceStyle;
    horizontalSizeClass = self->_horizontalSizeClass;
    v15 = *((_QWORD *)v7 + 10);
    v14 = *((_QWORD *)v7 + 11);
    traitCollection = self->_traitCollection;
    v17 = *((_QWORD *)v7 + 12);

    v18 = -[UITraitCollection isEqual:](traitCollection, "isEqual:", v17);
    v19 = vabdd_f64(visibleHeight, v9);
    v21 = (_DWORD)occurrence == v8 && userInterfaceStyle == v15;
    if (v19 <= 0.001)
      v22 = v18;
    else
      v22 = 0;
    v23 = vabdd_f64(travelTimeHeight, v9);
    v24 = v39 & ~vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL), (float64x2_t)vextq_s8(v30, v30, 8uLL)), (int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)size, (int8x16_t)size, 8uLL), (float64x2_t)vextq_s8(v32, v32, 8uLL))))));
    if (isSelected != v36 || occurrenceIsFirstVisibleDayOfEvent != v34)
      v24 = 0;
    if (v23 > 0.001 || horizontalSizeClass != v14)
      v21 = 0;
    v27 = v24 & v21 & v22 & v33 & v38;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSAttributedString)location
{
  id v2;
  id v4;
  id v5;

  v4 = 0;
  v5 = 0;
  -[CUIKOROccurrenceState _location:locationImageName:](self, "_location:locationImageName:", &v5, &v4);
  v2 = v5;

  return (NSAttributedString *)v2;
}

- (BOOL)hasNewTimeProposed
{
  return -[EKEvent hasAttendeeProposedTimes](self->_occurrence, "hasAttendeeProposedTimes");
}

+ (NSCache)locationCache
{
  if (locationCache_onceToken != -1)
    dispatch_once(&locationCache_onceToken, &__block_literal_global_57);
  return (NSCache *)(id)locationCache_cache;
}

- (UIFont)secondaryTextFont
{
  unint64_t v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v2 = -[CUIKOROccurrenceState fontCompressionDegree](self, "fontCompressionDegree");
  v3 = 0.0;
  if (v2 <= 2)
    v3 = dbl_1B8BA4938[v2];
  v4 = v3 / 11.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7;

  CUIKRoundToScreenScale(v4 * v8);
  objc_msgSend(v5, "fontWithSize:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v9;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)isValid
{
  EKEvent *occurrence;
  int64_t birthdayCount;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;

  occurrence = self->_occurrence;
  birthdayCount = self->_birthdayCount;
  -[CUIKOROccurrenceState backgroundRect](self, "backgroundRect");
  v6 = v5;
  v8 = v7;
  -[CUIKOROccurrenceState estimatedTextFrame](self, "estimatedTextFrame");
  if (occurrence)
    v11 = 0;
  else
    v11 = birthdayCount <= 0;
  v12 = !v11;
  if (v6 < 0.0)
    v12 = 0;
  if (v8 < 0.0)
    v12 = 0;
  if (v9 <= 0.0)
    v12 = 0;
  return v10 > 0.0 && v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CUIKOROccurrenceState *v4;
  uint64_t v5;
  UIColor *displayColor;
  CGPoint origin;
  uint64_t v8;
  UITraitCollection *traitCollection;

  v4 = -[CUIKOROccurrenceState init](+[CUIKOROccurrenceState allocWithZone:](CUIKOROccurrenceState, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_occurrence, self->_occurrence);
  objc_storeStrong((id *)&v4->_occurrences, self->_occurrences);
  v4->_occurrenceIsFirstVisibleDayOfEvent = self->_occurrenceIsFirstVisibleDayOfEvent;
  v4->_isProposedTime = self->_isProposedTime;
  v4->_isSelected = self->_isSelected;
  v4->_isDimmed = self->_isDimmed;
  v4->_usesSmallText = self->_usesSmallText;
  v4->_travelTime = self->_travelTime;
  v5 = -[UIColor copy](self->_displayColor, "copy");
  displayColor = v4->_displayColor;
  v4->_displayColor = (UIColor *)v5;

  origin = self->_backgroundRect.origin;
  v4->_backgroundRect.size = self->_backgroundRect.size;
  v4->_backgroundRect.origin = origin;
  v4->_travelTimeHeight = self->_travelTimeHeight;
  v4->_visibleHeight = self->_visibleHeight;
  v4->_visibleHeight = self->_visibleHeight;
  v4->_userInterfaceStyle = self->_userInterfaceStyle;
  v4->_horizontalSizeClass = self->_horizontalSizeClass;
  v4->_birthdayCount = self->_birthdayCount;
  v4->_isMiniPreviewInEventDetail = self->_isMiniPreviewInEventDetail;
  objc_storeStrong((id *)&v4->_allDayOverride, self->_allDayOverride);
  v8 = -[UITraitCollection copy](self->_traitCollection, "copy");
  traitCollection = v4->_traitCollection;
  v4->_traitCollection = (UITraitCollection *)v8;

  return v4;
}

- (CUIKOROccurrenceState)init
{
  CUIKOROccurrenceState *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUIKOROccurrenceState;
  result = -[CUIKOROccurrenceState init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_estimatedTextFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_estimatedTextFrame.size = v3;
    result->_visibleHeight = 1.79769313e308;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_allDayOverride, 0);
  objc_storeStrong((id *)&self->_displayColor, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_occurrence, 0);
}

uint64_t __38__CUIKOROccurrenceState_locationCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)locationCache_cache;
  locationCache_cache = (uint64_t)v0;

  objc_msgSend((id)locationCache_cache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  objc_msgSend((id)locationCache_cache, "setCountLimit:", 500);
  return notify_register_check((const char *)*MEMORY[0x1E0CF9658], &apHiddenAppsNotifyToken);
}

void __49__CUIKOROccurrenceState_languageAwareInsetsCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)languageAwareInsetsCache_cache;
  languageAwareInsetsCache_cache = (uint64_t)v0;

}

+ (id)tallCharacterSetCache
{
  if (tallCharacterSetCache_onceToken != -1)
    dispatch_once(&tallCharacterSetCache_onceToken, &__block_literal_global_43);
  return (id)tallCharacterSetCache_cache;
}

void __46__CUIKOROccurrenceState_tallCharacterSetCache__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  objc_msgSend(MEMORY[0x1E0CB3500], "_emojiCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v0, "invertedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formIntersectionWithCharacterSet:", v2);

  v3 = (void *)tallCharacterSetCache_cache;
  tallCharacterSetCache_cache = (uint64_t)v1;

}

- (void)setOccurrences:(id)a3
{
  NSArray *v4;
  EKEvent *v5;
  EKEvent *occurrence;
  NSArray *occurrences;

  v4 = (NSArray *)a3;
  -[NSArray firstObject](v4, "firstObject");
  v5 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  occurrence = self->_occurrence;
  self->_occurrence = v5;

  occurrences = self->_occurrences;
  self->_occurrences = v4;

}

- (BOOL)isReminder
{
  return -[EKEvent isIntegrationEvent](self->_occurrence, "isIntegrationEvent");
}

- (int)reminderStackDepth
{
  NSUInteger v2;

  v2 = -[NSArray count](self->_occurrences, "count");
  if (v2 >= 3)
    LODWORD(v2) = 3;
  return v2;
}

- (BOOL)isReminderStack
{
  return -[CUIKOROccurrenceState reminderStackDepth](self, "reminderStackDepth") > 1;
}

- (BOOL)isCompleted
{
  return -[EKEvent completed](self->_occurrence, "completed");
}

- (BOOL)drawReminderAsEditable
{
  return -[EKEvent CUIK_reminderShouldBeEditable](self->_occurrence, "CUIK_reminderShouldBeEditable");
}

- (NSString)locationImageName
{
  id v2;
  __CFString *v3;
  __CFString *v4;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  -[CUIKOROccurrenceState _location:locationImageName:](self, "_location:locationImageName:", &v7, &v6);
  v2 = v7;
  v3 = (__CFString *)v6;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("location.pin.point.of.interest");

  return (NSString *)v4;
}

+ (void)clearLocationCache
{
  id v2;

  objc_msgSend(a1, "locationCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_location:(id *)a3 locationImageName:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  _BOOL4 v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  CUIKOROccurrenceStateCachedLocation *v28;
  id v29;
  id v30;
  _BOOL8 v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id *v37;
  id *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  char v42;
  int check;

  check = 0;
  notify_check(apHiddenAppsNotifyToken, &check);
  if (check)
    objc_msgSend((id)objc_opt_class(), "clearLocationCache");
  objc_msgSend((id)objc_opt_class(), "locationCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent eventIdentifier](self->_occurrence, "eventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "generatedLocationString");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationImageName");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEvent location](self->_occurrence, "location");
  v10 = objc_claimAutoreleasedReturnValue();
  -[EKEvent locationWithoutPrediction](self->_occurrence, "locationWithoutPrediction");
  v11 = objc_claimAutoreleasedReturnValue();
  -[EKEvent preferredLocation](self->_occurrence, "preferredLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v12, "isPrediction");

  -[EKEvent virtualConference](self->_occurrence, "virtualConference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "joinMethods");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if ((-[EKEvent conferenceURLForDisplayCached](self->_occurrence, "conferenceURLForDisplayCached") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    {
      -[EKEvent conferenceURLForDisplay](self->_occurrence, "conferenceURLForDisplay");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  v37 = a3;
  v38 = a4;
  v17 = objc_msgSend(v9, "originalOccurrenceLocationIsPrediction");
  objc_msgSend(v9, "originalOccurrenceLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v10;
  v19 = CalEqualStrings();

  objc_msgSend(v9, "originalOccurrenceLocationWithoutPrediction");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v11;
  v21 = CalEqualStrings();

  v22 = -[CUIKOROccurrenceState hasNewTimeProposed](self, "hasNewTimeProposed");
  v23 = objc_msgSend(v9, "originalHasNewTimeProposed");
  objc_msgSend(v9, "originalConferenceURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = CalEqualObjects();

  if (v19 && v21 && ((v41 ^ v17) & 1) == 0 && ((v22 ^ v23) & 1) == 0 && v25
    || (v42 = 0,
        +[CUIKLocationDescriptionGenerator locationStringForEvent:options:incomplete:leadingImageName:](CUIKLocationDescriptionGenerator, "locationStringForEvent:options:incomplete:leadingImageName:", self->_occurrence, 422, &v42, v38), *v37 = (id)objc_claimAutoreleasedReturnValue(), v42))
  {
    v27 = v39;
    v26 = v40;
  }
  else
  {
    v28 = [CUIKOROccurrenceStateCachedLocation alloc];
    v29 = *v37;
    v30 = *v38;
    v31 = -[CUIKOROccurrenceState hasNewTimeProposed](self, "hasNewTimeProposed");
    v32 = v29;
    v33 = v30;
    v27 = v39;
    v26 = v40;
    v34 = -[CUIKOROccurrenceStateCachedLocation initWithGeneratedLocationString:locationImageName:originalOccurrenceLocation:originalOccurrenceLocationWithoutPrediction:originalOccurrenceLocationIsPrediction:originalHasNewTimeProposed:originalConferenceURL:](v28, "initWithGeneratedLocationString:locationImageName:originalOccurrenceLocation:originalOccurrenceLocationWithoutPrediction:originalOccurrenceLocationIsPrediction:originalHasNewTimeProposed:originalConferenceURL:", v32, v33, v40, v39, v41, v31, v16);

    objc_msgSend((id)objc_opt_class(), "locationCache");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent eventIdentifier](self->_occurrence, "eventIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKey:", v34, v36);

    v9 = (void *)v34;
  }

}

- (BOOL)hidesTime
{
  if (-[EKEvent isAllDay](self->_occurrence, "isAllDay")
    || (-[EKEvent isReminderIntegrationEvent](self->_occurrence, "isReminderIntegrationEvent") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return !-[CUIKOROccurrenceState occurrenceIsFirstVisibleDayOfEvent](self, "occurrenceIsFirstVisibleDayOfEvent");
  }
}

- (NSString)moreText
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CUIKOROccurrenceState occurrences](self, "occurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v9 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ReminderStackMoreFormat"), CFSTR("%lu more"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKOROccurrenceState occurrences](self, "occurrences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, objc_msgSend(v8, "count") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v9;
}

- (id)secondaryTitleTextColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[CUIKOROccurrenceState occurrence](self, "occurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKOccurrenceSecondaryTextColor(v4, -[CUIKOROccurrenceState isCancelled](self, "isCancelled"), -[CUIKOROccurrenceState isDeclined](self, "isDeclined"), -[CUIKOROccurrenceState isSelected](self, "isSelected"), -[CUIKOROccurrenceState needsReply](self, "needsReply"), -[CUIKOROccurrenceState isReminder](self, "isReminder"), -[CUIKOROccurrenceState isCompleted](self, "isCompleted"), -[CUIKOROccurrenceState drawReminderAsEditable](self, "drawReminderAsEditable"), -[CUIKOROccurrenceState isBirthday](self, "isBirthday"), -[CUIKOROccurrenceState userInterfaceStyle](self, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIColor)moreTextColor
{
  -[CUIKOROccurrenceState isSelected](self, "isSelected");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)strikethroughColor
{
  return (UIColor *)CUIKStrikethroughColor(-[CUIKOROccurrenceState isSelected](self, "isSelected"));
}

- (UIColor)baseColor
{
  void *v3;
  void *v4;

  -[CUIKOROccurrenceState displayColor](self, "displayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKBaseColor(v3, -[CUIKOROccurrenceState userInterfaceStyle](self, "userInterfaceStyle"), -[CUIKOROccurrenceState needsReply](self, "needsReply"), -[CUIKOROccurrenceState isDeclined](self, "isDeclined"), -[CUIKOROccurrenceState isReminder](self, "isReminder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (UIColor)colorBarColor
{
  void *v3;
  void *v4;

  -[CUIKOROccurrenceState displayColor](self, "displayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKColorBarColor(v3, -[CUIKOROccurrenceState userInterfaceStyle](self, "userInterfaceStyle"), -[CUIKOROccurrenceState needsReply](self, "needsReply"), -[CUIKOROccurrenceState isDeclined](self, "isDeclined"), -[CUIKOROccurrenceState isReminder](self, "isReminder"), -[CUIKOROccurrenceState isSelected](self, "isSelected"), -[CUIKOROccurrenceState isCancelled](self, "isCancelled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (BOOL)requiresLanguageAwarePadding
{
  double v3;
  double v4;

  -[CUIKOROccurrenceState languageAwareInsets](self, "languageAwareInsets");
  if (v3 <= 4.0)
    return 0;
  -[CUIKOROccurrenceState languageAwareInsets](self, "languageAwareInsets");
  return v4 > 4.0;
}

- (double)totalLanguageAwareHeightPadding
{
  double v3;
  double v4;
  double v5;

  -[CUIKOROccurrenceState languageAwareInsets](self, "languageAwareInsets");
  v4 = v3;
  -[CUIKOROccurrenceState languageAwareInsets](self, "languageAwareInsets");
  return (v4 + v5) * 0.5;
}

- (id)_leadingSymbolSizeConfigurationForReminder:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3888];
  -[CUIKOROccurrenceState primaryTextFont](self, "primaryTextFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = 3.0;
  if (v3)
    v7 = 2.0;
  v8 = v7 + v6;
  if (v3)
    v9 = 7;
  else
    v9 = 4;
  objc_msgSend(v4, "configurationWithPointSize:weight:scale:", v9, 2, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIImage)leadingIcon
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (-[CUIKOROccurrenceState isReminder](self, "isReminder"))
  {
    -[CUIKOROccurrenceState reminderIcon](self, "reminderIcon");
    return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CUIKOROccurrenceState isSelected](self, "isSelected"))
      -[CUIKOROccurrenceState titleTextColor](self, "titleTextColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "cuik_systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3888];
    v14[0] = v4;
    -[CUIKOROccurrenceState colorBarColor](self, "colorBarColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIKOROccurrenceState _leadingSymbolSizeConfigurationForReminder:](self, "_leadingSymbolSizeConfigurationForReminder:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIKOROccurrenceState occurrence](self, "occurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CUIK_symbolName");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v12 || !-[CUIKOROccurrenceState isAllDay](self, "isAllDay"))
    {
      if (v12 == CFSTR("calendar.circle.fill") && !-[CUIKOROccurrenceState isAllDay](self, "isAllDay"))
      {

        v12 = 0;
      }
    }
    else
    {
      v12 = CFSTR("calendar.circle.fill");
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "cuik_systemImageNamed:withConfiguration:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return (UIImage *)v13;
  }
}

- (id)trailingIconsColor
{
  void *v3;

  if (-[CUIKOROccurrenceState isReminder](self, "isReminder"))
  {
    if (-[CUIKOROccurrenceState isSelected](self, "isSelected"))
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CUIKOROccurrenceState locationTextColor](self, "locationTextColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSArray)trailingIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CUIKOROccurrenceState isReminderStack](self, "isReminderStack")
    && !-[CUIKOROccurrenceState fontCompressionDegree](self, "fontCompressionDegree"))
  {
    -[CUIKOROccurrenceState occurrence](self, "occurrence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKOROccurrenceState trailingIconsColor](self, "trailingIconsColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3888];
    -[CUIKOROccurrenceState secondaryTextFont](self, "secondaryTextFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cuik_configurationWithFont:scale:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "CUIK_attendeesIconSymbolWithAttendeesIconState:myParticipantStatus:", objc_msgSend(v4, "CUIK_attendeesIconState"), objc_msgSend(v4, "selfParticipantStatus"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      goto LABEL_11;
    -[CUIKOROccurrenceState occurrence](self, "occurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isOrWasPartOfRecurringSeries"))
    {
      -[CUIKOROccurrenceState occurrence](self, "occurrence");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isOriginalItemPhantom") & 1) != 0
        || -[CUIKOROccurrenceState isBirthday](self, "isBirthday"))
      {

      }
      else
      {
        -[CUIKOROccurrenceState occurrence](self, "occurrence");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "calendar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isHolidayCalendar");

        if ((v21 & 1) != 0)
          goto LABEL_9;
        objc_msgSend(MEMORY[0x1E0DC3870], "cuik_systemImageNamed:withConfiguration:", CFSTR("repeat"), v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "cuik_imageWithTintColor:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v11);
      }
    }

LABEL_9:
    -[CUIKOROccurrenceState occurrence](self, "occurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasAttachment");

    if (!v14)
    {
LABEL_12:

      return (NSArray *)v3;
    }
    v10 = CFSTR("paperclip");
LABEL_11:
    objc_msgSend(MEMORY[0x1E0DC3870], "cuik_systemImageNamed:withConfiguration:", v10, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cuik_imageWithTintColor:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v16);
    goto LABEL_12;
  }
  return (NSArray *)v3;
}

- (id)reminderIcon
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[CUIKOROccurrenceState occurrence](self, "occurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CUIK_symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CUIKOROccurrenceState isSelected](self, "isSelected"))
  {
    -[CUIKOROccurrenceState titleTextColor](self, "titleTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[CUIKOROccurrenceState drawReminderAsEditable](self, "drawReminderAsEditable");
    -[CUIKOROccurrenceState occurrence](self, "occurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "CUIK_symbolColor");
    else
      objc_msgSend(v7, "CUIK_disabledSymbolColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[CUIKOROccurrenceState isReminderStack](self, "isReminderStack"))
  {
    objc_msgSend(v5, "cuik_alphaComponent");
    objc_msgSend(v5, "colorWithAlphaComponent:", v9 * 0.2);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  -[CUIKOROccurrenceState _leadingSymbolSizeConfigurationForReminder:](self, "_leadingSymbolSizeConfigurationForReminder:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_systemImageNamed:withConfiguration:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cuik_imageWithTintColor:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)minimumNaturalHeightAllText
{
  double v3;
  double v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  double v13;

  +[CUIKORFontUtils minimumNaturalHeightForPrimaryTextUsingSmallText:sizeClass:](CUIKORFontUtils, "minimumNaturalHeightForPrimaryTextUsingSmallText:sizeClass:", self->_usesSmallText, -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass"));
  v4 = v3;
  v5 = -[CUIKOROccurrenceState hidesTime](self, "hidesTime");
  -[CUIKOROccurrenceState location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7 && v5)
    return v4;
  v9 = 1;
  if (!v5)
    v9 = 2;
  if (v7)
    v10 = v9;
  else
    v10 = !v5;
  -[CUIKOROccurrenceState secondaryTextFont](self, "secondaryTextFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIFont cuik_lineHeight](v11, v12);

  return v4 + v13 * (double)v10;
}

- (double)enoughHeightForOneLine
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_opt_class();
  -[CUIKOROccurrenceState occurrence](self, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enoughHeightForOneLineForEvent:usingSmallText:sizeClass:", v4, -[CUIKOROccurrenceState usesSmallText](self, "usesSmallText"), -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass"));
  v6 = v5;

  return v6;
}

+ (double)enoughHeightForOneLineForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a4;
  v7 = a3;
  +[CUIKORFontUtils minimumNaturalHeightForPrimaryTextUsingSmallText:sizeClass:](CUIKORFontUtils, "minimumNaturalHeightForPrimaryTextUsingSmallText:sizeClass:", v6, a5);
  v9 = v8;
  if ((objc_msgSend(v7, "isAllDay") & 1) == 0)
  {
    objc_msgSend(v7, "startCalendarDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "minute");

    if (v11)
    {
      CUIKRoundToScreenScale(0.5);
      v9 = v9 - v12;
    }
  }
  objc_msgSend((id)objc_opt_class(), "defaultMarginFromEKDayOccurrenceView");
  v14 = v13;
  v16 = v15;
  objc_msgSend((id)objc_opt_class(), "defaultPaddingFromEKDayOccurrenceView");
  CUIKRoundToScreenScale(v9 + v18 + v14 + v16 + v17);
  v20 = v19;

  return v20;
}

+ (UIEdgeInsets)defaultMarginFromEKDayOccurrenceView
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (UIEdgeInsets)defaultPaddingFromEKDayOccurrenceView
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 3.5;
  v3 = 5.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)primaryTextFontNonBold
{
  return -[CUIKOROccurrenceState primaryTextFontBold:](self, "primaryTextFontBold:", 0);
}

- (id)primaryTextFontBold:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  int64_t v6;
  _BOOL4 v7;
  BOOL v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  v3 = a3;
  v5 = -[CUIKOROccurrenceState fontCompressionDegree](self, "fontCompressionDegree");
  v6 = -[CUIKOROccurrenceState horizontalSizeClass](self, "horizontalSizeClass");
  v7 = -[CUIKOROccurrenceState usesSmallText](self, "usesSmallText");
  v8 = v7;
  if (v6 == 2)
  {
    v9 = (id)*MEMORY[0x1E0DC4AB8];
    v10 = 0.0;
    v11 = 11.0;
    v12 = 12.0;
  }
  else
  {
    if (v7)
    {
      v9 = (id)*MEMORY[0x1E0DC4AA0];
      v10 = 0.0;
      v11 = 6.5;
      v12 = 8.5;
      v13 = 11.0;
      goto LABEL_7;
    }
    v9 = (id)*MEMORY[0x1E0DC4AB8];
    v10 = 0.0;
    v11 = 7.5;
    v12 = 10.0;
  }
  v13 = 13.0;
LABEL_7:
  if (!v5)
    v10 = v13;
  if (v5 == 1)
    v10 = v12;
  if (v5 == 2)
    v14 = v11;
  else
    v14 = v10;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingBoldFontForTextStyle:", v9, v10);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "cuik_preferredTightLeadingFontForTextStyle:", v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 13.0;
  if (v6 == 1 && v8)
    v17 = 11.0;
  v18 = v14 / v17;
  objc_msgSend(v15, "fontDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pointSize");
  v21 = v20;

  CUIKRoundToScreenScale(v18 * v21);
  objc_msgSend(v16, "fontWithSize:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CUIKOROccurrenceState;
  -[CUIKOROccurrenceState description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKOROccurrenceState title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKOROccurrenceState backgroundRect](self, "backgroundRect");
  CUIKStringFromCGRect(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKOROccurrenceState estimatedTextFrame](self, "estimatedTextFrame");
  CUIKStringFromCGRect(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <title: %@, backgroundRect: %@, estimatedTextFrame: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSArray)occurrences
{
  return self->_occurrences;
}

- (void)setDisplayColor:(id)a3
{
  objc_storeStrong((id *)&self->_displayColor, a3);
}

- (BOOL)isMiniPreviewInEventDetail
{
  return self->_isMiniPreviewInEventDetail;
}

- (void)setIsMiniPreviewInEventDetail:(BOOL)a3
{
  self->_isMiniPreviewInEventDetail = a3;
}

- (NSNumber)allDayOverride
{
  return self->_allDayOverride;
}

- (void)setAllDayOverride:(id)a3
{
  objc_storeStrong((id *)&self->_allDayOverride, a3);
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return self->_occurrenceIsFirstVisibleDayOfEvent;
}

- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3
{
  self->_occurrenceIsFirstVisibleDayOfEvent = a3;
}

- (void)setEstimatedTextFrame:(CGRect)a3
{
  self->_estimatedTextFrame = a3;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end
