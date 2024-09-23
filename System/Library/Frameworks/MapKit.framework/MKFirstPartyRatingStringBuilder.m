@implementation MKFirstPartyRatingStringBuilder

+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return (id)objc_msgSend(a1, "thumbRecommendStringWithMapItem:font:includeGlyph:", a3, a5, 1, a6);
}

+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return (id)objc_msgSend(a1, "percentageStringForMapItem:showNumberOfRatings:textColor:font:theme:", a3, 1, a4, a5, a6);
}

+ (id)userRecommendedRatingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return (id)objc_msgSend(a1, "percentageStringForMapItem:showNumberOfRatings:textColor:font:theme:", a3, 0, a4, a5, a6);
}

+ (id)ratingSymbolName
{
  return CFSTR("hand.thumbsup.fill");
}

+ (id)_colorForPercentage:(double)a3
{
  void *v3;
  void *v4;

  if (a3 <= 0.5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)thumbRecommendStringWithMapItem:(id)a3 font:(id)a4 includeGlyph:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "_geoMapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_overallAppleRating");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "percentage");
  objc_msgSend(a1, "ratingStringForPercentage:font:color:includeGlyph:", v8, 0, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_stringForPercentage:(double)a3
{
  void *v4;
  void *v5;

  _MKLocalizedStringFromThisBundle(CFSTR("%lu%% [UGC]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, (unint64_t)(a3 * 100.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ratingStringForPercentage:(double)a3 font:(id)a4 color:(id)a5 includeGlyph:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v33;
  _BOOL4 v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v6 = a6;
  v37[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (a3 < 0.0 || a3 > 1.0)
  {
    v31 = (void *)objc_opt_new();
  }
  else
  {
    v34 = v6;
    v13 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    v14 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a1, "ratingSymbolName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_mapkit_systemImageNamed:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(v10, "pointSize");
    v18 = *MEMORY[0x1E0CEB5D0];
    objc_msgSend(v17, "_mapkit_configurationWithPointSize:weight:scale:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_mapkit_imageWithSymbolConfiguration:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setImage:", v20);
    v21 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendAttributedString:", v22);

    if (!v11)
    {
      objc_msgSend(a1, "_colorForPercentage:", a3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v35 = v10;
    v36[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(v10, "_mapkit_fontWithWeight:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = *MEMORY[0x1E0CEA0A0];
    v37[0] = v23;
    v37[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addAttributes:range:", v24, 0, objc_msgSend(v21, "length"));
    objc_msgSend(a1, "_stringForPercentage:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), 0);
    objc_msgSend(v26, "appendAttributedString:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v25);
    objc_msgSend(v26, "appendAttributedString:", v28);

    objc_msgSend(v26, "setAttributes:range:", v24, 0, objc_msgSend(v26, "length"));
    v29 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v30 = v29;
    if (v34)
      objc_msgSend(v29, "appendAttributedString:", v21);
    objc_msgSend(v30, "appendAttributedString:", v26);
    v31 = (void *)objc_msgSend(v30, "copy");

    v10 = v35;
  }

  return v31;
}

+ (id)compactUserRecommendedRatingSummaryStringForMapItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  objc_msgSend(a3, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_overallAppleRating");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Percentage (Count) [UGC]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "percentage");
    objc_msgSend(a1, "_stringForPercentage:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFirstPartyRatingFormatter stringFromCount:](MKFirstPartyRatingFormatter, "stringFromCount:", (int)objc_msgSend(v5, "numberOfRatingsUsedForScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: overallRating != ((void *)0)", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)ratingPercentageAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  void *v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  uint8_t buf[8];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v24 = a6;
  objc_msgSend(a3, "_geoMapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_overallAppleRating");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Recommend (%@) [UGC]"));
    v14 = objc_claimAutoreleasedReturnValue();
    +[MKFirstPartyRatingFormatter stringFromCount:](MKFirstPartyRatingFormatter, "stringFromCount:", (int)objc_msgSend(v13, "numberOfRatingsUsedForScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v16);
    v26[0] = *MEMORY[0x1E0CEA098];
    v18 = v11;
    if (!v11)
    {
      +[MKFontManager sharedManager](MKFontManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subtitleFont");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27[0] = v18;
    v26[1] = *MEMORY[0x1E0CEA0A0];
    v19 = v10;
    if (!v10)
    {
      objc_msgSend(v24, "textColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v11)
      {
LABEL_8:
        objc_msgSend(v17, "setAttributes:range:", v20, 0, objc_msgSend(v17, "length"));
        v21 = (void *)objc_msgSend(v17, "copy");

        goto LABEL_9;
      }
    }
    else
    {

      if (v11)
        goto LABEL_8;
    }

    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: overallRating != ((void *)0)", buf, 2u);
  }
  v21 = 0;
LABEL_9:

  return v21;
}

+ (id)percentageStringForMapItem:(id)a3 showNumberOfRatings:(BOOL)a4 textColor:(id)a5 font:(id)a6 theme:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[3];

  v10 = a4;
  v28[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a1, "thumbRecommendStringWithMapItem:font:includeGlyph:", v12, v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0x1E0CB3000;
  if (!(_DWORD)v10)
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Recommend [UGC]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = *MEMORY[0x1E0CEA098];
    v20 = v14;
    if (!v14)
    {
      +[MKFontManager sharedManager](MKFontManager, "sharedManager");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "subtitleFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28[0] = v20;
    v27[1] = *MEMORY[0x1E0CEA0A0];
    v21 = v13;
    if (!v13)
    {
      objc_msgSend(v15, "textColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (v14)
      {
LABEL_9:
        v17 = 0x1E0CB3000uLL;
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v19, v22);

        goto LABEL_10;
      }
    }
    else
    {

      if (v14)
        goto LABEL_9;
    }

    goto LABEL_9;
  }
  objc_msgSend(a1, "ratingPercentageAttributedStringForMapItem:textColor:font:theme:", v12, v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v23 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v23, "appendAttributedString:", v16);
  v24 = (void *)objc_msgSend(objc_alloc(*(Class *)(v17 + 1176)), "initWithString:attributes:", CFSTR(" "), 0);
  objc_msgSend(v23, "appendAttributedString:", v24);

  objc_msgSend(v23, "appendAttributedString:", v18);
  v25 = (void *)objc_msgSend(v23, "copy");

  return v25;
}

+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  objc_msgSend(a3, "_geoMapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_overallAppleRating");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "percentage");
  v11 = v10;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0A0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ratingStringForPercentage:font:color:includeGlyph:", v12, v13, 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)userRecommendationStringWithFont:(id)a3 ratingState:(int64_t)a4 numberOfPhotosAdded:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v40;
  unint64_t v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v10 = (void *)objc_opt_new();
  v11 = (uint64_t *)MEMORY[0x1E0CEA0A0];
  v12 = 0x1E0C99000;
  if (a4)
  {
    v41 = a5;
    v13 = (void *)MEMORY[0x1E0CEA638];
    if (a4 == 2)
    {
      objc_msgSend(a1, "ratingSymbolName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_mapkit_systemImageNamed:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 1.0;
      v17 = CFSTR("You Recommend [UGC]");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_systemImageNamed:", CFSTR("hand.thumbsdown.fill"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0.0;
      v17 = CFSTR("You Dislike [UGC]");
    }
    _MKLocalizedStringFromThisBundle(v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_colorForPercentage:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v19, "_mapkit_configurationWithPointSize:weight:scale:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_mapkit_imageWithSymbolConfiguration:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "imageWithRenderingMode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v8;
    v24 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    objc_msgSend(v24, "setImage:", v22);
    objc_msgSend(v10, "addObject:", v40);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendAttributedString:", v25);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v9, "appendAttributedString:", v26);

    v11 = (uint64_t *)MEMORY[0x1E0CEA0A0];
    v27 = *MEMORY[0x1E0CEA0A0];
    v44[0] = *MEMORY[0x1E0CEA098];
    v44[1] = v27;
    v45[0] = v23;
    v45[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v28, 0, objc_msgSend(v9, "length"));

    v8 = v23;
    v12 = 0x1E0C99000uLL;

    a5 = v41;
  }
  if (a5)
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Number Of Photos [UGC]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v29, a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v30);

  }
  _MKLocalizedStringFromThisBundle(CFSTR(" · [Delimeter]"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v32);
  v34 = *v11;
  v42[0] = *MEMORY[0x1E0CEA098];
  v42[1] = v34;
  v43[0] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v35;
  objc_msgSend(*(id *)(v12 + 3456), "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "addAttributes:range:", v36, 0, objc_msgSend(v32, "length"));
  v37 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v38 = v37;
  if (a4)
    objc_msgSend(v37, "appendAttributedString:", v9);
  objc_msgSend(v38, "appendAttributedString:", v33);

  return v38;
}

+ (id)ratingColorForMapItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_overallAppleRating");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "percentage");
  objc_msgSend(a1, "_colorForPercentage:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
