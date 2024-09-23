@implementation MKStarRatingAndLabelView

+ (id)reviewsString:(unint64_t)a3 providerName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    v9 = objc_msgSend(v5, "length");
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (v9)
    {
      _MKLocalizedStringFromThisBundle(CFSTR("%1$d review on %2$@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v6;
    }
    else
    {
      _MKLocalizedStringFromThisBundle(CFSTR("%d review"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "localizedStringWithFormat:", v8, 1, v16);
    goto LABEL_12;
  }
  if (a3)
  {
    v11 = objc_msgSend(v5, "length");
    v12 = (void *)MEMORY[0x1E0CB3940];
    if (v11)
    {
      _MKLocalizedStringFromThisBundle(CFSTR("PlacecardReviewProvider_Plural"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, a3, v6);
    }
    else
    {
      _MKLocalizedStringFromThisBundle(CFSTR("PlacecardReview_Plural"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, a3, v16);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "length"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("No reviews on %@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v6, v16);
LABEL_12:
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    _MKLocalizedStringFromThisBundle(CFSTR("No reviews"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v14;
}

+ (id)ratingAndReviewsAsAttributedString:(double)a3 style:(int64_t)a4 font:(id)a5 numberOfReviews:(unint64_t)a6 textColor:(id)a7 theme:(id)a8
{
  void *v8;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a7;
  v16 = a8;
  +[MKStarRatingView ratingAsAttributedString:baseFont:style:theme:](MKStarRatingView, "ratingAsAttributedString:baseFont:style:theme:", v14, a4, v16, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  +[MKStarRatingAndLabelView reviewsString:providerName:](MKStarRatingAndLabelView, "reviewsString:providerName:", a6, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = *MEMORY[0x1E0CEA0A0];
  v20 = v15;
  if (!v15)
  {
    objc_msgSend(v16, "textColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[0] = v20;
  v37[1] = *MEMORY[0x1E0CEA098];
  v21 = v14;
  if (!v14)
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitleFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v22);

  if (v14)
  {
    if (v15)
      goto LABEL_7;
  }
  else
  {

    if (v15)
      goto LABEL_7;
  }

LABEL_7:
  v24 = objc_alloc(MEMORY[0x1E0CB3778]);
  _MKLocalizedStringFromThisBundle(CFSTR("PlaceCard_StarAndReviewCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithString:", v25);

  objc_msgSend(v26, "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "rangeOfString:", CFSTR("%1$@"));
  v30 = v29;

  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v26, "replaceCharactersInRange:withAttributedString:", v28, v30, v17);
  objc_msgSend(v26, "string");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "rangeOfString:", CFSTR("%2$@"));
  v34 = v33;

  if (v32 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v26, "replaceCharactersInRange:withAttributedString:", v32, v34, v23);
  v35 = (void *)objc_msgSend(v26, "copy");

  return v35;
}

+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 theme:(id)a7
{
  return (id)objc_msgSend(a1, "starRatingAndProviderAsAttributedStringForMapItem:textColor:font:showReviewsOrTips:showNumberOfReviews:ratingStyle:theme:", a3, a4, a5, a6, 1, 3, a7);
}

+ (id)starRatingAndProviderAsAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 showReviewsOrTips:(BOOL)a6 showNumberOfReviews:(BOOL)a7 ratingStyle:(int64_t)a8 theme:(id)a9
{
  void *v9;
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  id v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v11 = a7;
  v12 = a6;
  v55[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v54[0] = *MEMORY[0x1E0CEA098];
  v19 = v17;
  if (!v17)
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subtitleFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[0] = v19;
  v54[1] = *MEMORY[0x1E0CEA0A0];
  v20 = v16;
  if (!v16)
  {
    objc_msgSend(v18, "textColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v53 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v17)
      goto LABEL_7;
  }
  else
  {

    if (v17)
      goto LABEL_7;
  }

LABEL_7:
  if (objc_msgSend(v15, "_sampleSizeForUserRatingScore"))
  {
    objc_msgSend(v15, "_normalizedUserRatingScore");
    v52 = v18;
    +[MKStarRatingView ratingAsAttributedString:baseFont:style:theme:](MKStarRatingView, "ratingAsAttributedString:baseFont:style:theme:", v17, a8, v18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_reviewsDisplayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length") == 0;

    if (v24 && v11)
      v25 = CFSTR("Place_Header_Reviews_No_Provider_Layout");
    else
      v25 = CFSTR("Place_Header_Reviews_Layout");
    if (v24 && v11 || v11)
    {
      _MKLocalizedStringFromThisBundle(v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = CFSTR("%1$@");
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v26, v53);
    objc_msgSend(v29, "string");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "rangeOfString:", CFSTR("%1$@"));
    v33 = v32;

    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v29, "replaceCharactersInRange:withAttributedString:", v31, v33, v22);
    objc_msgSend(v29, "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "rangeOfString:", CFSTR("%2$d"));
    v37 = v36;

    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v15, "_localizedSampleSizeForUserRatingScoreString");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      if (v38)
        v40 = (const __CFString *)v38;
      else
        v40 = &stru_1E20DFC00;
      objc_msgSend(v29, "replaceCharactersInRange:withString:", v35, v37, v40);

    }
    objc_msgSend(v29, "string");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "rangeOfString:", CFSTR("%3$@"));
    v44 = v43;

    v18 = v52;
    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v15, "_reviewsDisplayName");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v45;
      if (v45)
        v47 = (const __CFString *)v45;
      else
        v47 = &stru_1E20DFC00;
      objc_msgSend(v29, "replaceCharactersInRange:withString:", v42, v44, v47);

    }
    v48 = (void *)objc_msgSend(v29, "copy");

    v49 = (void *)v53;
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v12)
      v28 = CFSTR("No Reviews");
    else
      v28 = CFSTR("No Tips");
    _MKLocalizedStringFromThisBundle(v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v27;
    v49 = (void *)v53;
    v48 = (void *)objc_msgSend(v50, "initWithString:attributes:", v22, v53);
  }

  return v48;
}

@end
