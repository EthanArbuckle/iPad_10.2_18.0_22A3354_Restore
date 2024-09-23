@implementation GEOPlaceLineTemplate(MUPlaceTileViewModel)

- (id)attributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  switch(objc_msgSend(a1, "type"))
  {
    case 1u:
      objc_msgSend(a1, "_categoryStringForFont:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2u:
      objc_msgSend(a1, "_businessHoursAttributedStringForFont:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3u:
      objc_msgSend(a1, "_ratingSummaryAttributedStringForFont:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4u:
      objc_msgSend(a1, "_factoidAttributedStringForFont:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5u:
      objc_msgSend(a1, "_locationAttributedStringForFont:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_businessHoursAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CC1A20]);
  objc_msgSend(a1, "businessHours");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithBusinessHours:timeZone:localizedHoursStringOptions:", v6, v7, 128);

  objc_msgSend(v8, "localizedOpenState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (objc_msgSend(v9, "length"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0DC1140];
    v19[0] = *MEMORY[0x1E0DC1138];
    v19[1] = v13;
    v20[0] = v10;
    v20[1] = v12;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v10;
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(v11, "initWithString:attributes:", v9, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_categoryStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "categoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1140];
    v15[0] = *MEMORY[0x1E0DC1138];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v8;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v6;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v7, "initWithString:attributes:", v5, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_ratingSummaryAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[3];
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "ratingSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (void *)MEMORY[0x1E0CC17B0];
    objc_msgSend(a1, "ratingSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sampleSizeUsedForScore");
    objc_msgSend(v7, "stringFromCount:", (unint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@)"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1448]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_ratingGlyphAttributedStringForFont:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "ratingSummary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAppleRating");

    if ((v16 & 1) == 0)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "ratingSummary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "vendorName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@\n"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v17, "initWithString:", v21);

      objc_msgSend(v12, "appendAttributedString:", v22);
    }
    v31 = *MEMORY[0x1E0DC1138];
    v32[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v23);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v23);
    v30[0] = v14;
    v30[1] = v24;
    v30[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "appendAttributedString:", v27);
    v28 = (void *)objc_msgSend(v12, "copy");

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)_ratingGlyphAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  float v10;
  uint64_t v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "ratingSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleRating");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CC17B8], "ratingSymbolName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "ratingSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "normalizedUserRatingScore");
    objc_msgSend(v8, "localizedStringWithFormat:", CFSTR("%lu%%"), (unint64_t)v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CC1968];
    objc_msgSend(a1, "ratingSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "normalizedUserRatingScore");
    objc_msgSend(v12, "colorForRating:", v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "ratingSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "normalizedUserRatingScore");
    objc_msgSend(v15, "localizedStringWithFormat:", CFSTR("%.1f"), v16);
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("star.fill");
  }

  v17 = (void *)MEMORY[0x1E0DC3870];
  v18 = (void *)MEMORY[0x1E0DC3888];
  v19 = v4;
  v20 = v7;
  objc_msgSend(v18, "configurationWithFont:scale:", v19, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "imageWithRenderingMode:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v23, "setImage:", v35);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v24;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  v39[1] = v25;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v11);
  v39[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v27, 1);
  v28 = (void *)v11;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  v31 = *MEMORY[0x1E0DC1138];
  v37[0] = *MEMORY[0x1E0DC1140];
  v37[1] = v31;
  v38[0] = v36;
  v38[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAttributes:range:", v32, 0, objc_msgSend(v30, "length"));

  v33 = (void *)objc_msgSend(v30, "copy");
  return v33;
}

- (id)_factoidAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "factoid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MUFactoidStringForFactoid((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_locationAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "locationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1140];
    v15[0] = *MEMORY[0x1E0DC1138];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v8;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v6;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v7, "initWithString:attributes:", v5, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
