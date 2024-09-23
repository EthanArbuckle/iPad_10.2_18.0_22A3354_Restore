@implementation CUIKORStringGenerator

+ (id)_attributedTitleWithState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E6EBAE30;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(a1, "_defaultAttributesForState:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DC1138]);

  objc_msgSend(v4, "titleTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1140]);

  v13 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (objc_msgSend(v4, "needsReply") && (objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0DC12B0];
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKORImageUtils scaledCalendarInvitationDotForFont:](CUIKORImageUtils, "scaledCalendarInvitationDotForFont:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cuik_textAttachmentWithImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendAttributedString:", v18);

  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);

  objc_msgSend(v13, "appendAttributedString:", v19);
  objc_msgSend(v13, "addAttributes:range:", v9, 0, objc_msgSend(v13, "length"));

  return v13;
}

+ (id)_defaultAttributesForState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E6EBAE30;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  -[__CFString componentsSeparatedByString:](v8, "componentsSeparatedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = (unint64_t)objc_msgSend(v9, "count") < 2;
  v10 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v10, "setParagraphSpacing:", 3.0);
  LODWORD(v11) = 1045220557;
  objc_msgSend(v10, "setHyphenationFactor:", v11);
  objc_msgSend(a1, "_defaultMinimumLineHeightForState:", v4);
  objc_msgSend(v10, "setMinimumLineHeight:");
  objc_msgSend(v10, "setLineBreakMode:", 4 * v8);
  v12 = *MEMORY[0x1E0DC1150];
  v17[0] = *MEMORY[0x1E0DC1178];
  v17[1] = v12;
  v18[0] = v10;
  v18[1] = &unk_1E6ED7148;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if ((objc_msgSend(v4, "isCancelled") & 1) != 0 || objc_msgSend(v4, "isDeclined"))
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DC11A8]);
    objc_msgSend(v4, "strikethroughColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DC11A0]);

  }
  return v14;
}

+ (double)_defaultMinimumLineHeightForState:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "usesSmallText");
  result = 9.0;
  if (v3)
    return 8.0;
  return result;
}

+ (double)minNaturalTextHeightForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  double v15;
  void *v16;
  double v17;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "minimumNaturalHeightForPrimaryTextUsingSmallText:sizeClass:", v6, a5);
  v10 = v9;
  +[CUIKSemiConstantCache sharedInstance](CUIKSemiConstantCache, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dayOccurrenceUncompressedSecondaryTextFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIFont cuik_lineHeight](v12, v13);

  v15 = v10 + v14;
  objc_msgSend(v8, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -0.0;
  if (v16)
    v17 = v14;
  return v15 + v17;
}

+ (double)_minimumPrimaryFontLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;

  v9 = a3;
  CUIKMultiwindowAssert(a4 != 0, CFSTR("Unspecified size class"), a3, a4, v4, v5, v6, v7, v15);
  +[CUIKSemiConstantCache sharedInstance](CUIKSemiConstantCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (a4 == 1)
      objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightSmallCompact");
    else
      objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightSmallRegular");
  }
  else if (a4 == 1)
  {
    objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightCompact");
  }
  else
  {
    objc_msgSend(v10, "dayOccurrenceMinimumCachedLineHeightRegular");
  }
  v13 = v12;

  return v13;
}

+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  _BOOL8 v5;
  double v7;
  double v8;
  double result;

  v5 = a3;
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  v8 = v7;
  objc_msgSend(a1, "attributedStringMinimumLineHeightUsingSmallText:sizeClass:", v5, a4);
  if (v8 >= result)
    return v8;
  return result;
}

+ (double)attributedStringMinimumLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  double v4;
  double v5;
  double result;

  if (a3)
    v4 = 8.0;
  else
    v4 = 9.0;
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  result = CUIKCeilToScreenScale(v5);
  if (v4 >= result)
    return v4;
  return result;
}

+ (double)naturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  double v4;

  objc_msgSend(a1, "_naturalHeightForPrimaryTextUsingSmallText:sizeClass:", a3, a4);
  return CUIKCeilToScreenScale(v4);
}

+ (double)_naturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v15;

  v9 = a3;
  CUIKMultiwindowAssert(a4 != 0, CFSTR("Unspecified size class"), a3, a4, v4, v5, v6, v7, v15);
  +[CUIKSemiConstantCache sharedInstance](CUIKSemiConstantCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (a4 == 1)
      objc_msgSend(v10, "dayReminderIntegrationCachedLineHeightSmallCompact");
    else
      objc_msgSend(v10, "dayReminderIntegrationCachedLineHeightSmallRegular");
  }
  else if (a4 == 1)
  {
    objc_msgSend(v10, "dayReminderIntegrationCachedLineHeightCompact");
  }
  else
  {
    objc_msgSend(v10, "dayReminderIntegrationCachedLineHeightRegular");
  }
  v13 = v12;

  return v13;
}

- (id)generateContentStringsWithState:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  char v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  CUIKORContentStrings *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;

  v6 = a3;
  objc_msgSend(v6, "locationImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_attributedTitleWithState:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v6, "textSpace");
  v11 = v10;
  v12 = objc_msgSend(v6, "isAllDay");
  objc_msgSend(v6, "primaryTextFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UIFont cuik_lineHeight](v13, v14);

  objc_msgSend(v6, "secondaryTextFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIFont cuik_lineHeight](v16, v17);

  v19 = objc_alloc_init(CUIKORContentStrings);
  -[CUIKORContentStrings setTitleString:](v19, "setTitleString:", v8);
  -[CUIKORStringGenerator generateTrailingStringWithState:](self, "generateTrailingStringWithState:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKORContentStrings setTrailingString:](v19, "setTrailingString:", v20);

  if ((v12 & 1) == 0)
  {
    if (v11 >= v15 + v18)
    {
      objc_msgSend((id)objc_opt_class(), "_attributedTimeWithState:options:locationImageName:", v6, a4, v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_attributedLocationWithState:locationImageName:", v6, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKORContentStrings setTimeString:](v19, "setTimeString:", v23);
      -[CUIKORContentStrings setLocationString:](v19, "setLocationString:", v30);
      v35 = objc_msgSend(v30, "length");
      v36 = objc_msgSend(v23, "length");
      if (v35)
      {
        objc_msgSend(v30, "attributesAtIndex:effectiveRange:", objc_msgSend(v30, "length") - 1, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v7;
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v37);
        objc_msgSend(v9, "appendAttributedString:", v39);

        v7 = v38;
        objc_msgSend(v9, "appendAttributedString:", v30);

      }
      if (!v36)
        goto LABEL_10;
      objc_msgSend(v23, "attributesAtIndex:effectiveRange:", objc_msgSend(v23, "length") - 1, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v31);
      objc_msgSend(v9, "appendAttributedString:", v40);

      objc_msgSend(v9, "appendAttributedString:", v23);
LABEL_9:

LABEL_10:
      goto LABEL_11;
    }
    objc_msgSend(v6, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (v22)
    {
      objc_msgSend((id)objc_opt_class(), "_defaultAttributesForState:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "secondaryTextFont");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0DC1138];
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0DC1138]);

      objc_msgSend(v6, "locationTextColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "cuik_colorWithAlphaScaled:", CUIKOccurrenceLeadingIconAlphaScale(objc_msgSend(v6, "userInterfaceStyle")));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0DC1140]);

      v28 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(v23, "objectForKeyedSubscript:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "cuik_configurationWithFont:scale:", v29, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "cuik_privateSystemImageNamed:withConfiguration:", v7, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC12B0], "cuik_textAttachmentWithImage:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:attributes:", v32, v23);
      v42 = v7;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v23);
      objc_msgSend(v9, "appendAttributedString:", v34);

      objc_msgSend(v9, "appendAttributedString:", v33);
      v7 = v42;

      goto LABEL_9;
    }
  }
LABEL_11:
  -[CUIKORContentStrings setCombinedString:](v19, "setCombinedString:", v9);

  return v19;
}

- (id)generateTravelTimeStringWithState:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "travelTime");
  CUIKDisplayStringTravelTimeAndDuration(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
    objc_msgSend((id)objc_opt_class(), "_defaultAttributesForState:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CUIKORFontUtils defaultOccurrenceSecondaryTextFont](CUIKORFontUtils, "defaultOccurrenceSecondaryTextFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1138]);

    objc_msgSend(v6, "setAttributes:range:", v7, 0, objc_msgSend(v6, "length"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)generateTrailingStringWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "moreText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CUIKInterface shared](CUIKInterface, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "layoutDirectionOrOverride") == 0;

    +[CUIKORStringGenerator _defaultAttributesForState:](CUIKORStringGenerator, "_defaultAttributesForState:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryTextFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1138]);

    objc_msgSend(v3, "moreTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC1140]);

    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setAlignment:", 2 * v6);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DC1178]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_attributedTimeWithState:(id)a3 options:(unint64_t)a4 locationImageName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  _BOOL4 v95;
  void *v96;
  uint64_t v97;
  void *v98;
  int v99;
  void *v100;
  id v101;

  v7 = a3;
  v101 = a5;
  if ((_bitmaskContainsOption() & 1) != 0 || (objc_msgSend(v7, "hidesTime") & 1) != 0)
  {
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v7, "secondaryTextFont");
  v97 = objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "occurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "occurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "cal_isMultidayEventForUIWithStartDate:endDate:", v11, v13);

  objc_msgSend(v7, "occurrence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectiveTimeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "occurrence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CUIKShouldShowTimezoneClarification(v16, v18);

  v98 = v9;
  v95 = v19;
  if ((v14 & 1) != 0)
  {
    v99 = 0;
    v20 = (void *)v97;
  }
  else
  {
    objc_msgSend(v7, "occurrence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endTimeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "occurrence");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "endDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (CUIKShouldShowTimezoneClarification(v22, v24))
    {
      objc_msgSend(v7, "occurrence");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "effectiveTimeZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "occurrence");
      v93 = a1;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endTimeZone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CalEqualObjects() & v19 ^ 1;

      v30 = v29;
      a1 = v93;
      v19 = v95;

      v9 = v98;
    }
    else
    {
      v30 = 0;
    }
    v20 = (void *)v97;

    v99 = v30;
    if (!v19 || (v30 & 1) != 0)
    {
      objc_msgSend(v7, "occurrence");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "startDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "occurrence");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "endDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKTimeIntervalTextProvider timeIntervalAttributedTextWithStartDate:endDate:calendar:font:](CUIKTimeIntervalTextProvider, "timeIntervalAttributedTextWithStartDate:endDate:calendar:font:", v32, v35, v9, v97);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v36, "mutableCopy");

      goto LABEL_13;
    }
  }
  objc_msgSend(v7, "occurrence");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "startDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKTimeTextProvider timeAttributedTextWithDate:calendar:font:options:](CUIKTimeTextProvider, "timeAttributedTextWithDate:calendar:font:options:", v32, v9, v20, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "mutableCopy");
LABEL_13:

  objc_msgSend(a1, "_defaultAttributesForState:", v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeTextColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0DC1140]);

  objc_msgSend(v34, "addAttributes:range:", v37, 0, objc_msgSend(v34, "length"));
  v40 = (void *)objc_msgSend(v37, "mutableCopy");
  objc_msgSend(v7, "timeTextColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "cuik_colorWithAlphaScaled:", CUIKOccurrenceLeadingIconAlphaScale(objc_msgSend(v7, "userInterfaceStyle")));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, v39);

  v43 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1138]);
  objc_msgSend(a1, "_widthForWidestPossibleIconIncludingTrailingPadding:locationImageName:", v20, v101);
  v45 = v44;
  objc_msgSend(a1, "_attributedStringWithSystemImageName:symbolAttributes:widthForSymbol:baseString:", CFSTR("clock.time.1009"), v40, v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v95 | v99) == 1)
  {
    v90 = v40;
    v91 = v34;
    v94 = a1;
    objc_msgSend(v7, "occurrence");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "effectiveTimeZone");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = (void *)objc_msgSend(v98, "copy");
    objc_msgSend(v96, "setTimeZone:", v47);
    v48 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v7, "occurrence");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "startDate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v47;
    objc_msgSend(v47, "abbreviationForDate:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)objc_msgSend(v48, "initWithString:", v51);

    v52 = (void *)objc_msgSend(v37, "mutableCopy");
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v20, v43);
    objc_msgSend(v7, "occurrence");
    if (v99)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "endTimeZone");
      v54 = objc_claimAutoreleasedReturnValue();

      v87 = (void *)v54;
      v88 = (void *)objc_msgSend(v98, "copy");
      v55 = (void *)v54;
      objc_msgSend(v88, "setTimeZone:", v54);
      v56 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v7, "occurrence");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "endDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "abbreviationForDate:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend(v56, "initWithString:", v59);

      v100 = v52;
      objc_msgSend(v7, "occurrence");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "startDate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKTimeTextProvider timeAttributedTextWithDate:calendar:font:options:](CUIKTimeTextProvider, "timeAttributedTextWithDate:calendar:font:options:", v62, v96, v20, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "occurrence");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "endDate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKTimeTextProvider timeAttributedTextWithDate:calendar:font:options:](CUIKTimeTextProvider, "timeAttributedTextWithDate:calendar:font:options:", v65, v88, v20, 0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = (void *)MEMORY[0x1E0CB3498];
      v67 = objc_alloc(MEMORY[0x1E0CB3498]);
      CUIKBundle();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("time range with multiple time zones"), CFSTR("(%@ %@ - %@ %@)"), 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)objc_msgSend(v67, "initWithString:attributes:", v69, v100);
      objc_msgSend(v66, "localizedAttributedStringWithFormat:", v70, v63, v92, v86, v60);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = v88;
      v73 = v87;

      v52 = v100;
    }
    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "startDate");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[CUIKTimeTextProvider timeAttributedTextWithDate:calendar:font:options:](CUIKTimeTextProvider, "timeAttributedTextWithDate:calendar:font:options:", v75, v96, v20, 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = (void *)MEMORY[0x1E0CB3498];
      v77 = objc_alloc(MEMORY[0x1E0CB3498]);
      CUIKBundle();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("time range then time zone"), CFSTR("(%@ %@)"), 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v77, "initWithString:attributes:");
      objc_msgSend(v76, "localizedAttributedStringWithFormat:", v63, v73, v92);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v78 = (void *)MEMORY[0x1E0CB3778];
    v79 = objc_alloc(MEMORY[0x1E0CB3498]);
    CUIKBundle();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("time zone clarifier format %@ %@"), CFSTR("%@ %@"), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)objc_msgSend(v79, "initWithString:attributes:", v81, v52);
    objc_msgSend(v78, "localizedAttributedStringWithFormat:", v82, v8, v71);
    v83 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v83;
    a1 = v94;
    v20 = (void *)v97;
    v40 = v90;
    v34 = v91;
  }
  objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:string:indentAmount:", v84, v8, v45);

LABEL_19:
  return v8;
}

+ (id)_attributedLocationWithState:(id)a3 locationImageName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(a1, "_defaultAttributesForState:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryTextFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1138]);

    objc_msgSend(v6, "locationTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC1140]);

    objc_msgSend(v10, "addAttributes:range:", v11, 0, objc_msgSend(v10, "length"));
    v16 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v6, "locationTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cuik_colorWithAlphaScaled:", CUIKOccurrenceLeadingIconAlphaScale(objc_msgSend(v6, "userInterfaceStyle")));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v15);

    objc_msgSend(v16, "objectForKeyedSubscript:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_widthForWidestPossibleIconIncludingTrailingPadding:locationImageName:", v19, v7);
    v21 = v20;

    objc_msgSend(a1, "_attributedStringWithSystemImageName:symbolAttributes:widthForSymbol:baseString:", v7, v16, v10, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:string:indentAmount:", v23, v22, v21);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (double)_widthForWidestPossibleIconIncludingTrailingPadding:(id)a3 locationImageName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (void *)MEMORY[0x1E0DC3888];
  v6 = a4;
  objc_msgSend(v5, "cuik_configurationWithFont:scale:", a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_privateSystemImageNamed:withConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "size");
  v10 = v9;
  +[CUIKORImageUtils iconToTextPadding](CUIKORImageUtils, "iconToTextPadding");
  v12 = v10 + v11;

  return v12;
}

+ (id)_attributedStringWithSystemImageName:(id)a3 symbolAttributes:(id)a4 widthForSymbol:(double)a5 baseString:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  v9 = (void *)MEMORY[0x1E0DC3888];
  v10 = *MEMORY[0x1E0DC1138];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cuik_configurationWithFont:scale:", v14, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "cuik_privateSystemImageNamed:withConfiguration:", v13, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC12B0], "cuik_textAttachmentWithImage:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v18 = v17;
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "capHeight");
  *(float *)&v20 = v20 - v18;
  v21 = (float)(roundf(*(float *)&v20) * 0.5);
  objc_msgSend(v15, "size");
  objc_msgSend(v16, "setBounds:", 0.0, v21, v22, v18);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v15, "size");
  objc_msgSend(v24, "setBounds:", 0.0, 0.0, a5 - v25, 0.0);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁠"));
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v23);
  objc_msgSend(v28, "appendAttributedString:", v27);
  objc_msgSend(v28, "appendAttributedString:", v26);
  objc_msgSend(v28, "appendAttributedString:", v27);
  objc_msgSend(v28, "addAttributes:range:", v12, 0, objc_msgSend(v28, "length"));

  objc_msgSend(v28, "appendAttributedString:", v11);
  return v28;
}

+ (void)_indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:(id)a3 string:(id)a4 indentAmount:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  double v19;
  _QWORD v20[3];
  char v21;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "setHeadIndent:", a5);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 1;
  objc_msgSend(v8, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__CUIKORStringGenerator__indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle_string_indentAmount___block_invoke;
  v15[3] = &unk_1E6EB72F8;
  v18 = v20;
  v13 = v9;
  v16 = v13;
  v19 = a5;
  v14 = v8;
  v17 = v14;
  objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 0, v15);

  _Block_object_dispose(v20, 8);
}

void __113__CUIKORStringGenerator__indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle_string_indentAmount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v7 = 0.0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v7 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "setFirstLineHeadIndent:", v7);
  v8 = *MEMORY[0x1E0DC1178];
  v9 = *(void **)(a1 + 40);
  v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v9, "addAttribute:value:range:", v8, v10, a3, a4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

@end
