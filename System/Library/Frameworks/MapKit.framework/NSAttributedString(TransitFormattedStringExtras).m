@implementation NSAttributedString(TransitFormattedStringExtras)

+ (uint64_t)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:
{
  return objc_msgSend(a1, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:variableOverrides:", a3, a4, 0);
}

+ (id)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:variableOverrides:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  memset((char *)&v14[1] + 7, 0, 5);
  BYTE2(v14[2]) = MKApplicationLayoutDirectionIsRightToLeft();
  +[MKTransitItemReferenceDateUpdater referenceDateAsTimeInterval](MKTransitItemReferenceDateUpdater, "referenceDateAsTimeInterval", 1, 0, LODWORD(v14[2]));
  v14[3] = v11;
  objc_msgSend(a1, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:variableOverrides:options:", v10, v9, v8, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:variableOverrides:options:
{
  id v9;
  id v10;
  id v11;
  MKServerFormattedStringParameters *v12;
  __int128 v13;
  MKServerFormattedStringParameters *v14;
  MKServerFormattedString *v15;
  void *v16;
  void *v17;
  _OWORD v19[2];

  if (!a3)
    return 0;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [MKServerFormattedStringParameters alloc];
  v13 = a6[1];
  v19[0] = *a6;
  v19[1] = v13;
  v14 = -[MKServerFormattedStringParameters initWithOptions:variableOverrides:](v12, "initWithOptions:variableOverrides:", v19, v9);

  v15 = -[MKServerFormattedString initWithGeoServerString:parameters:]([MKServerFormattedString alloc], "initWithGeoServerString:parameters:", v11, v14);
  -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v15, "multiPartAttributedStringWithAttributes:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "attributedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (uint64_t)_mapkit_attributedStringForComposedString:()TransitFormattedStringExtras defaultAttributes:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "_mapkit_attributedStringForComposedString:defaultAttributes:argumentOverrideHandler:", a3, a4, 0);
}

+ (id)_mapkit_attributedStringForComposedString:()TransitFormattedStringExtras defaultAttributes:argumentOverrideHandler:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MKServerFormattedString *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v7, "optionsWithArgumentHandler:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShouldUpdateFormatStrings:", 0);
      objc_msgSend(v7, "composedStringWithOptions:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v12;
    }
    v13 = -[MKServerFormattedString initWithComposedString:]([MKServerFormattedString alloc], "initWithComposedString:", v7);
    -[MKServerFormattedString multiPartAttributedStringWithAttributes:](v13, "multiPartAttributedStringWithAttributes:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (uint64_t)_mapkit_attributedLiveTransitStringFromDepartureString:()TransitFormattedStringExtras departure:darkMode:
{
  return objc_msgSend(a1, "_mapkit_attributedLiveTransitStringFromDepartureString:departure:textAttributes:darkMode:symbolOverrideColor:", a3, a4, 0, a5, 0);
}

+ (id)_mapkit_attributedLiveTransitStringFromDepartureString:()TransitFormattedStringExtras departure:textAttributes:darkMode:symbolOverrideColor:
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v12 = (objc_class *)MEMORY[0x1E0CB3498];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend([v12 alloc], "initWithString:attributes:", v16, v14);

  v18 = objc_msgSend(v15, "liveStatus");
  objc_msgSend(a1, "_mapkit_attributedLiveTransitStringFromAttributedDepartureString:liveStatus:darkMode:symbolOverrideColor:", v17, v18, a6, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_mapkit_attributedLiveTransitStringFromAttributedDepartureString:()TransitFormattedStringExtras liveStatus:darkMode:symbolOverrideColor:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v9 = a3;
  v10 = a6;
  if (a4
    && (objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_liveTransitIndicatorImageUsingDarkMode:", a5),
        (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    if (v10)
    {
      v13 = v10;
    }
    else
    {
      MKTransitLiveDepartureColorForLiveStatus(a4);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;
    objc_msgSend(v12, "_flatImageWithColor:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    objc_msgSend(v17, "setImage:", v16);
    v18 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v16, "size");
    objc_msgSend(v17, "setBounds:", v18, v19, v20, v21);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    v25 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v25, "appendAttributedString:", v24);
    objc_msgSend(v25, "appendAttributedString:", v23);
    v14 = (id)objc_msgSend(v25, "copy");

  }
  else
  {
    v14 = v9;
  }

  return v14;
}

@end
