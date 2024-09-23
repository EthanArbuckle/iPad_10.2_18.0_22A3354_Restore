@implementation MKRatingStringBuilder

+ (id)ratingSymbolNameForMapItem:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", a3), "ratingSymbolName");
}

+ (Class)ratingStringProviderForMapItem:(id)a3
{
  void *v3;

  objc_msgSend(a3, "_geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_hasAppleRatings");

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)ratingSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v13), "ratingSummaryAttributedStringForMapItem:textColor:font:theme:", v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ratingAndReviewSummaryAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5 theme:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v13), "ratingAndReviewSummaryAttributedStringForMapItem:textColor:font:theme:", v13, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)delimitedPriceRangeAttributedStringForMapItem:(id)a3 textColor:(id)a4 font:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "_priceRangeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Delimiter [Nano]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CEA098];
    v17[0] = *MEMORY[0x1E0CEA0A0];
    v17[1] = v12;
    v18[0] = v7;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v11);
    objc_msgSend(v14, "setAttributes:range:", v13, 0, objc_msgSend(v14, "length"));
    v15 = (id)objc_msgSend(v14, "copy");

  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB3498]);
  }

  return v15;
}

+ (id)priceLabelStringFromMapItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "_hasPriceDescription"))
  {
    objc_msgSend(v3, "_priceDescription");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "_hasPriceRange"))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "_priceRangeString");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

+ (id)carPlayHeaderStringForMapItem:(id)a3 titleAttributes:(id)a4 providerAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v10), "carPlayHeaderStringForMapItem:titleAttributes:providerAttributes:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ratingColorForMapItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "ratingStringProviderForMapItem:", v4), "ratingColorForMapItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
