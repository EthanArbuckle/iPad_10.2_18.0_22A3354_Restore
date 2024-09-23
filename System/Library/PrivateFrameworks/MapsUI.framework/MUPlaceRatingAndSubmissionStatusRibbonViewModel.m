@implementation MUPlaceRatingAndSubmissionStatusRibbonViewModel

- (MUPlaceRatingAndSubmissionStatusRibbonViewModel)initWithMapItem:(id)a3 submissionStatus:(id)a4
{
  id v7;
  id v8;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v9;
  id *p_isa;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7 && !objc_msgSend(v7, "_hasUserRatingScore"))
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceRatingAndSubmissionStatusRibbonViewModel;
    v9 = -[MUPlaceRatingAndSubmissionStatusRibbonViewModel init](&v13, sel_init);
    p_isa = (id *)&v9->super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_mapItem, a3);
      objc_storeStrong(p_isa + 9, a4);
      objc_msgSend(p_isa, "setType:", 1);
      objc_msgSend(p_isa, "_updateStringProviders");
    }
    self = p_isa;
    v11 = self;
  }

  return v11;
}

- (void)setSubmissionStatus:(id)a3
{
  MUPlaceCallToActionAppearance *v5;
  MUPlaceCallToActionAppearance *v6;
  BOOL v7;
  MUPlaceCallToActionAppearance *v8;

  v5 = (MUPlaceCallToActionAppearance *)a3;
  v6 = v5;
  if (self->_submissionStatus != v5)
  {
    v8 = v5;
    v7 = -[MUPlaceCallToActionAppearance isEqual:](v5, "isEqual:");
    v6 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      -[MUPlaceRatingAndSubmissionStatusRibbonViewModel _updateStringProviders](self, "_updateStringProviders");
      v6 = v8;
    }
  }

}

- (void)_updateStringProviders
{
  MKMapItem *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  MKMapItem *v18;
  void *v19;
  _QWORD v20[4];
  MKMapItem *v21;
  id v22;
  id location;
  _QWORD aBlock[4];
  id v25;

  v3 = self->_mapItem;
  -[MKMapItem _geoMapItem](v3, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_sampleSizeForUserRatingScore");

  if (v3)
  {
    -[MKMapItem _geoMapItem](v3, "_geoMapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_hasAppleRatings");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CC17B0], "stringFromCount:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _MULocalizedStringFromThisBundle(CFSTR("<num> ratings"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%d %@"), 0, v5, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[MKMapItem _reviewsAttribution](v3, "_reviewsAttribution");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "providerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CC17B0], "stringFromCount:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    _MULocalizedStringFromThisBundle(CFSTR("Ratings [Placecard]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak(&location, self);
  v14 = v10;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E2E03548;
  v25 = v14;
  v16 = v14;
  v17 = _Block_copy(aBlock);

  -[MUPlaceRibbonItemViewModel setTitleStringProvider:](self, "setTitleStringProvider:", v17);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __73__MUPlaceRatingAndSubmissionStatusRibbonViewModel__updateStringProviders__block_invoke;
  v20[3] = &unk_1E2E035D8;
  objc_copyWeak(&v22, &location);
  v18 = v3;
  v21 = v18;
  -[MUPlaceRibbonItemViewModel setValueStringProvider:](self, "setValueStringProvider:", v20);
  -[MUPlaceRibbonItemViewModel updateDelegate](self, "updateDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ribbonItemViewModelDidUpdate:", self);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

id __73__MUPlaceRatingAndSubmissionStatusRibbonViewModel__updateStringProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  void *v63;
  float v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  __CFString *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isTappable"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_geoMapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_hasAppleRatings");

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CC1940], "ratingColorForMapItem:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v4;
    v8 = v10;
LABEL_9:
    +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v3, "_ratingState");
    v14 = v13;
    v69 = (void *)v12;
    v67 = v3;
    if (v13 == 2)
    {
      v15 = CFSTR("hand.thumbsup.fill");
    }
    else if (v13 == 1)
    {
      v15 = CFSTR("hand.thumbsdown.fill");
    }
    else if (v13)
    {
      v15 = 0;
    }
    else if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CC1940], "ratingSymbolNameForMapItem:");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("hand.thumbsup");
    }
    v16 = (void *)MEMORY[0x1E0DC3870];
    v17 = (void *)MEMORY[0x1E0DC3888];
    v18 = (void *)MEMORY[0x1E0DC1350];
    v19 = *MEMORY[0x1E0DC4AD0];
    v20 = v15;
    v68 = v19;
    objc_msgSend(v18, "preferredFontForTextStyle:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configurationWithFont:scale:", v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemImageNamed:withConfiguration:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v20;

    objc_msgSend(v23, "imageWithRenderingMode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v11;
    v26 = (objc_class *)MEMORY[0x1E0DC12B0];
    v27 = v24;
    v28 = objc_alloc_init(v26);
    objc_msgSend(v27, "imageWithRenderingMode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v27;

    objc_msgSend(v28, "setImage:", v29);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v30);
    v65 = *MEMORY[0x1E0DC1140];
    v72 = *MEMORY[0x1E0DC1140];
    v74 = v25;
    v32 = (void *)MEMORY[0x1E0C99D80];
    v33 = v25;
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", &v74, &v72, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "addAttributes:range:", v34, 0, objc_msgSend(v31, "length"));
    v66 = (void *)objc_msgSend(v31, "copy");

    if (v14)
    {
      v35 = CFSTR("You Rated [Placecard]");
    }
    else
    {
      v53 = *(void **)(a1 + 32);
      if (v53)
      {
        objc_msgSend(v53, "_geoMapItem");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "_hasAppleRatings");

        v56 = *(void **)(a1 + 32);
        if (v55)
        {
          objc_msgSend(v56, "_geoMapItem");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "_overallAppleRating");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "percentage");
          v60 = v59;

          v61 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v61, "setNumberStyle:", 3);
          objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setLocale:", v62);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringFromNumber:", v63);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        objc_msgSend(v56, "_normalizedUserRatingScore");
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%.1f"), v64);
        v36 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v37 = (void *)v36;
LABEL_22:
        v38 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v68);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = *MEMORY[0x1E0DC1138];
        v40 = v72;
        v73 = v65;
        v74 = v39;
        v75 = v69;
        v41 = (void *)MEMORY[0x1E0C99D80];
        v42 = v69;
        objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", &v74, &v72, 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = (void *)objc_msgSend(v38, "initWithString:attributes:", v37, v43);
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v45, "addObject:", v66);
        v46 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v68);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v40;
        v73 = v65;
        v74 = v47;
        v75 = v42;
        v48 = (void *)MEMORY[0x1E0C99D80];
        v49 = v42;
        objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", &v74, &v72, 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = (void *)objc_msgSend(v46, "initWithString:attributes:", CFSTR(" "), v50);
        objc_msgSend(v45, "addObject:", v51);

        objc_msgSend(v45, "addObject:", v44);
        +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v45, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v67;
        goto LABEL_23;
      }
      v35 = CFSTR("Rate [Placecard]");
    }
    _MULocalizedStringFromThisBundle(v35);
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v5 = 0;
LABEL_23:

  return v5;
}

- (BOOL)_canBeRated
{
  int64_t v3;

  v3 = -[MUPlaceCallToActionAppearance type](self->_submissionStatus, "type");
  if (v3 != 1)
    LOBYTE(v3) = -[MUPlaceCallToActionAppearance type](self->_submissionStatus, "type") == 4
              && -[MKUGCCallToActionViewAppearance ratingState](self->_submissionStatus, "ratingState");
  return v3;
}

- (int64_t)_ratingState
{
  if (-[MUPlaceCallToActionAppearance type](self->_submissionStatus, "type") == 4)
    return -[MKUGCCallToActionViewAppearance ratingState](self->_submissionStatus, "ratingState");
  else
    return 0;
}

- (id)typeStringForAX
{
  return CFSTR("Ratings");
}

- (BOOL)isEqual:(id)a3
{
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v4;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v5;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v6;
  MKMapItem *mapItem;
  MKMapItem *v8;
  MUPlaceCallToActionAppearance *submissionStatus;
  MUPlaceCallToActionAppearance *v10;
  char v11;
  objc_super v13;

  v4 = (MUPlaceRatingAndSubmissionStatusRibbonViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceRatingAndSubmissionStatusRibbonViewModel;
    if (-[MUPlaceRibbonItemViewModel isEqual:](&v13, sel_isEqual_, v6))
    {
      mapItem = self->_mapItem;
      -[MUPlaceRatingAndSubmissionStatusRibbonViewModel mapItem](v6, "mapItem");
      v8 = (MKMapItem *)objc_claimAutoreleasedReturnValue();
      if (mapItem == v8 || -[MKMapItem isEqual:](mapItem, "isEqual:", v8))
      {
        submissionStatus = self->_submissionStatus;
        -[MUPlaceRatingAndSubmissionStatusRibbonViewModel submissionStatus](v6, "submissionStatus");
        v10 = (MUPlaceCallToActionAppearance *)objc_claimAutoreleasedReturnValue();
        if (submissionStatus == v10)
          v11 = 1;
        else
          v11 = -[MUPlaceCallToActionAppearance isEqual:](submissionStatus, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
