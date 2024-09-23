@implementation MUPlaceRibbonItemViewModel

+ (id)guidesItemViewModelForMapItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MUPlaceRibbonItemViewModel *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;

  v3 = a3;
  objc_msgSend(v3, "_placeCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    _MULocalizedStringFromThisBundle(CFSTR("Guides [Placecard]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "_placeCollections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v10, "setTypeStringForAX:", CFSTR("Guides"));
    v11 = v6;
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E2E03548;
    v19 = v11;
    v13 = _Block_copy(aBlock);

    -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v10, "setTitleStringProvider:", v13);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __60__MUPlaceRibbonItemViewModel_guidesItemViewModelForMapItem___block_invoke;
    v16[3] = &unk_1E2E03548;
    v17 = v9;
    v14 = v9;
    -[MUPlaceRibbonItemViewModel setValueStringProvider:](v10, "setValueStringProvider:", v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __60__MUPlaceRibbonItemViewModel_guidesItemViewModelForMapItem___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0DC3870];
  v2 = (void *)MEMORY[0x1E0DC3888];
  v3 = *MEMORY[0x1E0DC4AD0];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithFont:scale:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "systemImageNamed:withConfiguration:", CFSTR("map.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)MEMORY[0x1E0DC12B0];
  v33 = v7;
  v11 = objc_alloc_init(v10);
  objc_msgSend(v33, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:", v12);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v13);
  v34[0] = *MEMORY[0x1E0DC1140];
  v15 = v34[0];
  v35[0] = v9;
  v16 = (void *)MEMORY[0x1E0C99D80];
  v17 = v9;
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v35, v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAttributes:range:", v18, 0, objc_msgSend(v14, "length"));
  v19 = (void *)objc_msgSend(v14, "copy");

  v20 = objc_alloc(MEMORY[0x1E0CB3498]);
  v21 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = *MEMORY[0x1E0DC1138];
  v34[1] = v15;
  v35[0] = v22;
  v35[1] = v24;
  v25 = (void *)MEMORY[0x1E0C99D80];
  v26 = v22;
  objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(v20, "initWithString:attributes:", v21, v27);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v19);
  objc_msgSend(v29, "appendAttributedString:", v28);
  v30 = (void *)objc_msgSend(v29, "copy");

  return v30;
}

+ (id)hoursItemViewModelForMapItem:(id)a3
{
  id v3;
  MUPlaceRibbonItemViewModel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;

  v3 = a3;
  objc_msgSend(v3, "_businessHours");
  v4 = (MUPlaceRibbonItemViewModel *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1A20]), "initWithMapItem:localizedHoursStringOptions:", v3, 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateHoursLabelColorWithDefaultLabelColor:", v6);

    objc_msgSend(v5, "ribbonSummaryForOpeningState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _MULocalizedStringFromThisBundle(CFSTR("Hours [Placecard]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    -[MUPlaceRibbonItemViewModel setType:](v4, "setType:", 2);
    -[MUPlaceRibbonItemViewModel setTappable:](v4, "setTappable:", 1);
    -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v4, "setTypeStringForAX:", CFSTR("Hours"));
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E2E03548;
    v19 = v9;
    v11 = _Block_copy(aBlock);

    -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v4, "setTitleStringProvider:", v11);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __59__MUPlaceRibbonItemViewModel_hoursItemViewModelForMapItem___block_invoke;
    v15[3] = &unk_1E2E03570;
    v16 = v7;
    v17 = v5;
    v12 = v5;
    v13 = v7;
    -[MUPlaceRibbonItemViewModel setValueStringProvider:](v4, "setValueStringProvider:", v15);

  }
  return v4;
}

id __59__MUPlaceRibbonItemViewModel_hoursItemViewModelForMapItem___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hoursStateLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1140];
  v13[0] = *MEMORY[0x1E0DC1138];
  v13[1] = v7;
  v14[0] = v4;
  v14[1] = v6;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v4;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v2, "initWithString:attributes:", v3, v10);
  return v11;
}

+ (id)costItemViewForMapItem:(id)a3
{
  id v3;
  void *v4;
  int v5;
  MUPlaceRibbonItemViewModel *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;

  v3 = a3;
  if (objc_msgSend(v3, "_hasPriceRange")
    && (objc_msgSend(v3, "_geoMapItem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_maxScoreForPriceRange"),
        v4,
        v5))
  {
    v6 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v6, "setTypeStringForAX:", CFSTR("Cost"));
    _MULocalizedStringFromThisBundle(CFSTR("Cost [Placecard]"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E2E03548;
    v20 = v7;
    v9 = _Block_copy(aBlock);

    -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v6, "setTitleStringProvider:", v9);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __53__MUPlaceRibbonItemViewModel_costItemViewForMapItem___block_invoke;
    v16[3] = &unk_1E2E03570;
    v11 = v3;
    v17 = v11;
    v12 = v10;
    v18 = v12;
    -[MUPlaceRibbonItemViewModel setValueStringProvider:](v6, "setValueStringProvider:", v16);
    objc_msgSend(v11, "_geoMapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceRibbonHelper costStringForValue:locale:](MUPlaceRibbonHelper, "costStringForValue:locale:", objc_msgSend(v13, "_priceRange"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceRibbonItemViewModel setPreferredAccessibilityValue:](v6, "setPreferredAccessibilityValue:", v14);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __53__MUPlaceRibbonItemViewModel_costItemViewForMapItem___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "_geoMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_priceRange");
  v43 = *MEMORY[0x1E0DC4AD0];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = v4;
  v9 = v6;
  v10 = v7;
  +[MUPlaceRibbonHelper costStringForValue:locale:](MUPlaceRibbonHelper, "costStringForValue:locale:", v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v42 = objc_alloc(MEMORY[0x1E0CB3498]);
    v12 = *MEMORY[0x1E0DC1140];
    v45 = *MEMORY[0x1E0DC1138];
    v46 = v12;
    v47 = v8;
    v48 = v9;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v2;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", &v47, &v45, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v14;
    v18 = (void *)objc_msgSend(v42, "initWithString:attributes:", v11, v17);

  }
  else
  {
    v18 = 0;
  }

  v19 = v44;
  if (objc_msgSend(v18, "length"))
    objc_msgSend(v44, "addObject:", v18);
  objc_msgSend(*(id *)(a1 + 32), "_geoMapItem", v42);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "_maxScoreForPriceRange");
  objc_msgSend(*(id *)(a1 + 32), "_geoMapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_priceRange");

  v24 = (v21 - v23);
  if ((_DWORD)v24)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v43);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(a1 + 40);
    v28 = v25;
    v29 = v26;
    v30 = v27;
    +[MUPlaceRibbonHelper costStringForValue:locale:](MUPlaceRibbonHelper, "costStringForValue:locale:", v24, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3498]);
      v33 = *MEMORY[0x1E0DC1140];
      v45 = *MEMORY[0x1E0DC1138];
      v46 = v33;
      v47 = v28;
      v48 = v29;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = v28;
      v36 = v29;
      objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", &v47, &v45, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v44;
      v38 = (void *)objc_msgSend(v32, "initWithString:attributes:", v31, v37);

    }
    else
    {
      v38 = 0;
    }

    objc_msgSend(v19, "addObject:", v38);
  }
  v39 = (void *)objc_msgSend(v19, "copy");
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v39, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (id)amenityItemViewForMapItem:(id)a3 amenityItemConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  MUPlaceRibbonItemViewModel *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD aBlock[4];
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_amenities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "indexesWithinAmenityComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v6;
    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(v6, "indexesWithinAmenityComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v57 != v14)
              objc_enumerationMutation(v11);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "unsignedIntegerValue");
            objc_msgSend(v5, "_amenities");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (v16 < v18)
            {
              objc_msgSend(v5, "_amenities");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndex:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "addObject:", v20);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        }
        while (v13);
      }

      v21 = (void *)objc_msgSend(v10, "copy");
    }
    else
    {
      objc_msgSend(v5, "_amenities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v21;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v24)
    {
      v25 = v24;
      v49 = *(_QWORD *)v53;
      v47 = *MEMORY[0x1E0DC4AD0];
LABEL_17:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v49)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v26);
        objc_msgSend(v27, "resolvedRibbonSymbolName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "length"))
        {
          v29 = v23;
          v30 = (void *)MEMORY[0x1E0DC3870];
          v31 = (void *)MEMORY[0x1E0DC3888];
          v32 = (void *)MEMORY[0x1E0DC1350];
          v33 = v28;
          objc_msgSend(v32, "preferredFontForTextStyle:", v47);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "configurationWithFont:scale:", v34, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v33, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "imageWithRenderingMode:", 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v29;
          if (v37)
            objc_msgSend(v29, "addObject:", v27);
        }
        v38 = objc_msgSend(v23, "count");

        if (v38 == 5)
          break;
        if (v25 == ++v26)
        {
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v25)
            goto LABEL_17;
          break;
        }
      }
    }

    if (objc_msgSend(v23, "count"))
    {
      v22 = objc_alloc_init(MUPlaceRibbonItemViewModel);
      -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v22, "setTypeStringForAX:", CFSTR("GoodToKnow"));
      _MULocalizedStringFromThisBundle(CFSTR("Good to Know [Placecard]"));
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
      aBlock[3] = &unk_1E2E03548;
      v61 = v39;
      v41 = _Block_copy(aBlock);

      -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v22, "setTitleStringProvider:", v41);
      v50[0] = v40;
      v50[1] = 3221225472;
      v50[2] = __81__MUPlaceRibbonItemViewModel_amenityItemViewForMapItem_amenityItemConfiguration___block_invoke;
      v50[3] = &unk_1E2E03548;
      v42 = v23;
      v51 = v42;
      -[MUPlaceRibbonItemViewModel setValueStringProvider:](v22, "setValueStringProvider:", v50);
      MUMap(v42, &__block_literal_global_33);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", CFSTR(" "));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceRibbonItemViewModel setPreferredAccessibilityValue:](v22, "setPreferredAccessibilityValue:", v44);

    }
    else
    {
      v22 = 0;
    }
    v6 = v46;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __81__MUPlaceRibbonItemViewModel_amenityItemViewForMapItem_amenityItemConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  id v23;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    v5 = *MEMORY[0x1E0DC4AD0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v6), "resolvedRibbonSymbolName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
        {
          v8 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
          v9 = (void *)MEMORY[0x1E0DC3870];
          v10 = (void *)MEMORY[0x1E0DC3888];
          v11 = (void *)MEMORY[0x1E0DC1350];
          v12 = v7;
          objc_msgSend(v11, "preferredFontForTextStyle:", v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "configurationWithFont:scale:", v13, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "imageWithRenderingMode:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setImage:", v16);
          objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v17);

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_191DB8000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: glyph.length > 0", buf, 2u);
        }

        ++v6;
      }
      while (v3 != v6);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v3 = v18;
    }
    while (v18);
  }

  v19 = (void *)objc_msgSend(v23, "copy");
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __81__MUPlaceRibbonItemViewModel_amenityItemViewForMapItem_amenityItemConfiguration___block_invoke_52(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "amenityTitle");
}

+ (id)factoidItemForFactoid:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  MUPlaceRibbonItemViewModel *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;

  +[MUFactoidViewModel viewModelForFactoid:](MUFactoidViewModel, "viewModelForFactoid:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && objc_msgSend(v5, "length"))
  {
    v6 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v6, "setTypeStringForAX:", CFSTR("Factoid"));
    v7 = v4;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E2E03548;
    v15 = v7;
    v9 = _Block_copy(aBlock);

    -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v6, "setTitleStringProvider:", v9);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __52__MUPlaceRibbonItemViewModel_factoidItemForFactoid___block_invoke;
    v11[3] = &unk_1E2E03570;
    v12 = v3;
    v13 = v5;
    -[MUPlaceRibbonItemViewModel setValueStringProvider:](v6, "setValueStringProvider:", v11);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __52__MUPlaceRibbonItemViewModel_factoidItemForFactoid___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = (_QWORD *)MEMORY[0x1E0DC4AD0];
  if (v4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildSymbolWithFont:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "symbolColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "symbolColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v13 = v11;
      v14 = (objc_class *)MEMORY[0x1E0DC12B0];
      v15 = v9;
      v16 = objc_alloc_init(v14);
      objc_msgSend(v15, "imageWithRenderingMode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setImage:", v17);
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v18);
      v46 = *MEMORY[0x1E0DC1140];
      v48 = v13;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = v13;
      objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", &v48, &v46, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "addAttributes:range:", v22, 0, objc_msgSend(v19, "length"));
      v23 = (void *)objc_msgSend(v19, "copy");

      objc_msgSend(v2, "addObject:", v23);
      v5 = (_QWORD *)MEMORY[0x1E0DC4AD0];
    }

  }
  if (objc_msgSend(v2, "count") && objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0DC1140];
    v46 = *MEMORY[0x1E0DC1138];
    v47 = v28;
    v48 = v25;
    v49 = v27;
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = v25;
    objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", &v48, &v46, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)objc_msgSend(v24, "initWithString:attributes:", CFSTR(" "), v31);
    v5 = (_QWORD *)MEMORY[0x1E0DC4AD0];

    objc_msgSend(v2, "addObject:", v32);
  }
  v33 = objc_alloc(MEMORY[0x1E0CB3498]);
  v34 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0DC1140];
  v46 = *MEMORY[0x1E0DC1138];
  v47 = v38;
  v48 = v35;
  v49 = v37;
  v39 = (void *)MEMORY[0x1E0C99D80];
  v40 = v35;
  objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", &v48, &v46, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)objc_msgSend(v33, "initWithString:attributes:", v34, v41);
  objc_msgSend(v2, "addObject:", v42);
  v43 = (void *)objc_msgSend(v2, "copy");
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v43, objc_msgSend(*(id *)(a1 + 32), "shouldReverseForRTLLayout"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (id)distanceFromCurrentLocationItemViewModelForMapItem:(id)a3 currentLocationCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  objc_msgSend(v7, "_detourInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "_detourInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "distanceToPlace");
    v12 = v11;

    if (v12 > 0.0)
    {
      objc_msgSend(v7, "_detourInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "distanceToPlace");
      v15 = v14;
      goto LABEL_13;
    }
  }
  objc_msgSend(v7, "_coordinate");
  v18 = 0;
  if (v17 >= -180.0 && v17 <= 180.0 && v16 >= -90.0 && v16 <= 90.0)
  {
    v18 = 0;
    if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
    {
      v19 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v7, "_coordinate");
      v21 = v20;
      objc_msgSend(v7, "_coordinate");
      v13 = (void *)objc_msgSend(v19, "initWithLatitude:longitude:", v21);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
      objc_msgSend(v13, "distanceFromLocation:", v22);
      v15 = v23;

LABEL_13:
      if (v15 == 0.0)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v15, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "distanceFromCurrentLocationItemViewModelForDistanceString:", v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v18;
}

+ (id)distanceFromCurrentLocationItemViewModelForDistanceString:(id)a3
{
  id v3;
  MUPlaceRibbonItemViewModel *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MUPlaceRibbonItemViewModel);
  -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v4, "setTypeStringForAX:", CFSTR("Distance"));
  _MULocalizedStringFromThisBundle(CFSTR("Distance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E2E03548;
  v14 = v5;
  v7 = v5;
  v8 = _Block_copy(aBlock);

  -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v4, "setTitleStringProvider:", v8);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __88__MUPlaceRibbonItemViewModel_distanceFromCurrentLocationItemViewModelForDistanceString___block_invoke;
  v11[3] = &unk_1E2E03548;
  v12 = v3;
  v9 = v3;
  -[MUPlaceRibbonItemViewModel setValueStringProvider:](v4, "setValueStringProvider:", v11);

  return v4;
}

id __88__MUPlaceRibbonItemViewModel_distanceFromCurrentLocationItemViewModelForDistanceString___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v42;
  void *v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0DC3870];
  v2 = (void *)MEMORY[0x1E0DC3888];
  v42 = *MEMORY[0x1E0DC4AD0];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithFont:scale:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "systemImageNamed:withConfiguration:", CFSTR("point.fill.topleft.down.curvedto.point.fill.bottomright.up"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)MEMORY[0x1E0DC12B0];
  v10 = v6;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:", v12);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v13);
  v45 = *MEMORY[0x1E0DC1140];
  v15 = v45;
  v47 = v8;
  v16 = (void *)MEMORY[0x1E0C99D80];
  v17 = v8;
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", &v47, &v45, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAttributes:range:", v18, 0, objc_msgSend(v14, "length"));
  v43 = (void *)objc_msgSend(v14, "copy");

  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  v20 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v42);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x1E0DC1138];
  v24 = v45;
  v46 = v15;
  v25 = v15;
  v47 = v21;
  v48 = v23;
  v26 = (void *)MEMORY[0x1E0C99D80];
  v27 = v21;
  objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", &v47, &v45, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v28);
  v30 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v24;
  v46 = v25;
  v47 = v31;
  v48 = v33;
  v34 = (void *)MEMORY[0x1E0C99D80];
  v35 = v31;
  objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", &v47, &v45, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)objc_msgSend(v30, "initWithString:attributes:", CFSTR(" "), v36);
  v44[0] = v43;
  v44[1] = v37;
  v44[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v38, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

+ (id)ratingSubmissionStatusViewModelForRatingState:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  MUPlaceRibbonItemViewModel *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  __CFString *v12;
  __CFString *v13;
  _QWORD aBlock[4];
  id v15;

  if ((unint64_t)a3 > 2)
  {
    v3 = &stru_1E2E05448;
    v4 = &stru_1E2E05448;
  }
  else
  {
    v3 = off_1E2E035F8[a3];
    v4 = off_1E2E03610[a3];
  }
  v5 = objc_alloc_init(MUPlaceRibbonItemViewModel);
  -[MUPlaceRibbonItemViewModel setTypeStringForAX:](v5, "setTypeStringForAX:", CFSTR("Rate"));
  -[MUPlaceRibbonItemViewModel setTappable:](v5, "setTappable:", 1);
  _MULocalizedStringFromThisBundle(CFSTR("Rate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E2E03548;
  v15 = v6;
  v8 = v6;
  v9 = _Block_copy(aBlock);

  -[MUPlaceRibbonItemViewModel setTitleStringProvider:](v5, "setTitleStringProvider:", v9);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __76__MUPlaceRibbonItemViewModel_ratingSubmissionStatusViewModelForRatingState___block_invoke;
  v11[3] = &unk_1E2E03570;
  v12 = (__CFString *)v4;
  v13 = (__CFString *)v3;
  -[MUPlaceRibbonItemViewModel setValueStringProvider:](v5, "setValueStringProvider:", v11);

  return v5;
}

id __76__MUPlaceRibbonItemViewModel_ratingSubmissionStatusViewModelForRatingState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  objc_class *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  _QWORD v53[3];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4AD0];
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "preferredFontForTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithFont:scale:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:withConfiguration:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)MEMORY[0x1E0DC12B0];
  v13 = v10;
  v14 = objc_alloc_init(v12);
  objc_msgSend(v13, "imageWithRenderingMode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setImage:", v15);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v16);
  v54[0] = *MEMORY[0x1E0DC1140];
  v18 = v54[0];
  v55[0] = v11;
  v19 = (void *)MEMORY[0x1E0C99D80];
  v20 = v11;
  objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v55, v54, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAttributes:range:", v21, 0, objc_msgSend(v17, "length"));
  v52 = (void *)objc_msgSend(v17, "copy");

  v22 = *(void **)(a1 + 40);
  v23 = (void *)MEMORY[0x1E0DC3870];
  v24 = (void *)MEMORY[0x1E0DC3888];
  v25 = (void *)MEMORY[0x1E0DC1350];
  v26 = v22;
  objc_msgSend(v25, "preferredFontForTextStyle:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configurationWithFont:scale:", v27, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "systemImageNamed:withConfiguration:", v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "imageWithRenderingMode:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = (objc_class *)MEMORY[0x1E0DC12B0];
  v33 = v30;
  v34 = objc_alloc_init(v32);
  objc_msgSend(v33, "imageWithRenderingMode:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setImage:", v35);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v36);
  v54[0] = v18;
  v55[0] = v31;
  v38 = (void *)MEMORY[0x1E0C99D80];
  v39 = v31;
  objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v55, v54, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "addAttributes:range:", v40, 0, objc_msgSend(v37, "length"));
  v41 = (void *)objc_msgSend(v37, "copy");

  v53[0] = v52;
  v42 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = *MEMORY[0x1E0DC1138];
  v54[1] = v18;
  v55[0] = v43;
  v55[1] = v44;
  v45 = (void *)MEMORY[0x1E0C99D80];
  v46 = v43;
  objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)objc_msgSend(v42, "initWithString:attributes:", CFSTR(" "), v47);
  v53[1] = v48;
  v53[2] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v49, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  MUPlaceRibbonItemViewModel *v4;
  MUPlaceRibbonItemViewModel *v5;
  MUPlaceRibbonItemViewModel *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  void (**v12)(void);
  void *v13;
  void (**v14)(void);
  void *v15;
  uint64_t v16;
  void (**v17)(void);
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(void);
  void *v25;
  void (**v26)(void);
  void *v27;

  v4 = (MUPlaceRibbonItemViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[MUPlaceRibbonItemViewModel updateDelegate](self, "updateDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceRibbonItemViewModel updateDelegate](v6, "updateDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8
      && (v9 = -[MUPlaceRibbonItemViewModel isTappable](self, "isTappable"),
          v9 == -[MUPlaceRibbonItemViewModel isTappable](v6, "isTappable")))
    {
      -[MUPlaceRibbonItemViewModel titleStringProvider](self, "titleStringProvider");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceRibbonItemViewModel titleStringProvider](v6, "titleStringProvider");
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v15 || objc_msgSend(v13, "isEqual:", v15))
      {
        v27 = v15;
        -[MUPlaceRibbonItemViewModel valueStringProvider](self, "valueStringProvider");
        v26 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v26[2]();
        v16 = objc_claimAutoreleasedReturnValue();
        -[MUPlaceRibbonItemViewModel valueStringProvider](v6, "valueStringProvider");
        v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v17[2]();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v16;
        v20 = (void *)v18;
        v25 = v19;
        if (v19 == (void *)v18 || objc_msgSend(v19, "isEqual:", v18))
        {
          v23 = v13;
          v24 = v12;
          -[MUPlaceRibbonItemViewModel typeStringForAX](self, "typeStringForAX");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlaceRibbonItemViewModel typeStringForAX](v6, "typeStringForAX");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 == v22)
            v10 = 1;
          else
            v10 = objc_msgSend(v21, "isEqual:", v22);

          v13 = v23;
          v12 = v24;
        }
        else
        {
          v10 = 0;
        }

        v15 = v27;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MUPlaceRibbonItemViewModelUpdateDelegate)updateDelegate
{
  return (MUPlaceRibbonItemViewModelUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (BOOL)isTappable
{
  return self->_tappable;
}

- (void)setTappable:(BOOL)a3
{
  self->_tappable = a3;
}

- (id)titleStringProvider
{
  return self->_titleStringProvider;
}

- (void)setTitleStringProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)valueStringProvider
{
  return self->_valueStringProvider;
}

- (void)setValueStringProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)preferredAccessibilityValue
{
  return self->_preferredAccessibilityValue;
}

- (void)setPreferredAccessibilityValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)typeStringForAX
{
  return self->_typeStringForAX;
}

- (void)setTypeStringForAX:(id)a3
{
  objc_storeStrong((id *)&self->_typeStringForAX, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeStringForAX, 0);
  objc_storeStrong((id *)&self->_preferredAccessibilityValue, 0);
  objc_storeStrong(&self->_valueStringProvider, 0);
  objc_storeStrong(&self->_titleStringProvider, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end
