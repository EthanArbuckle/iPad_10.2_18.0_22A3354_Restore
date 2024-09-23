@implementation MKThirdPartyRatingStringBuilder

+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return +[MKStarRatingAndLabelView starRatingAndProviderAsAttributedStringForMapItem:textColor:font:showReviewsOrTips:showNumberOfReviews:ratingStyle:theme:](MKStarRatingAndLabelView, "starRatingAndProviderAsAttributedStringForMapItem:textColor:font:showReviewsOrTips:showNumberOfReviews:ratingStyle:theme:", a3, a4, a5, 0, 0, 3, a6);
}

+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  return +[MKStarRatingAndLabelView starRatingAndProviderAsAttributedStringForMapItem:textColor:font:showReviewsOrTips:showNumberOfReviews:ratingStyle:theme:](MKStarRatingAndLabelView, "starRatingAndProviderAsAttributedStringForMapItem:textColor:font:showReviewsOrTips:showNumberOfReviews:ratingStyle:theme:", a3, a4, a5, 1, 1, 3, a6);
}

+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a4;
  objc_msgSend(v7, "_normalizedUserRatingScore");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%.1f "), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v10);

  objc_msgSend(v7, "_reviewsDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "_localizedSampleSizeForUserRatingScoreString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@) "), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v18, v8);
    objc_msgSend(v13, "appendAttributedString:");
    _MKLocalizedStringFromThisBundle(CFSTR("CarPlay_SearchCell_ReviewsLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "_reviewsDisplayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v19, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v20, "initWithString:attributes:", v23, v8);

    objc_msgSend(v13, "appendAttributedString:", v24);
    if ((objc_msgSend(v7, "_hasPriceDescription") & 1) != 0)
      v25 = 1;
    else
      v25 = objc_msgSend(v7, "_hasPriceRange");
    if ((objc_msgSend(v7, "_hasPriceDescription") & 1) != 0)
      objc_msgSend(v7, "_priceDescription");
    else
      objc_msgSend(v7, "_priceRangeString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v25 && objc_msgSend(v27, "length"))
    {
      _MKLocalizedStringFromThisBundle(CFSTR(" · [List view details separator]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v32, v28);
      v33 = v18;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v29, v8);
      objc_msgSend(v13, "appendAttributedString:", v30);
      v26 = (void *)objc_msgSend(v13, "copy");

      v18 = v33;
    }
    else
    {
      v26 = (void *)objc_msgSend(v13, "copy");
    }

  }
  else
  {
    v26 = (void *)objc_msgSend(v13, "copy");
  }

  return v26;
}

+ (id)ratingSymbolName
{
  return CFSTR("star.fill");
}

+ (id)ratingColorForMapItem:(id)a3
{
  float v3;

  objc_msgSend(a3, "_normalizedUserRatingScore");
  return +[MKStarRatingView colorForRating:](MKStarRatingView, "colorForRating:", v3);
}

@end
