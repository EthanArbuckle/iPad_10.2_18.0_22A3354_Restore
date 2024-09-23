@implementation MUPlaceRibbonSectionController

- (MUPlaceRibbonSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7;
  MUPlaceRibbonSectionController *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceRibbonSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v13, sel_initWithMapItem_, a3);
  if (v8)
  {
    MUGetPlaceCardLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceRibbonSectionControllerInit", ", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    -[MUPlaceRibbonSectionController _setupRibbonView](v8, "_setupRibbonView");
    MUGetPlaceCardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceRibbonSectionControllerInit", ", v12, 2u);
    }

  }
  return v8;
}

- (void)_setupRibbonView
{
  MUPlaceRibbonView *v3;
  MUPlaceRibbonView *v4;
  MUPlaceRibbonView *ribbonView;
  MUPlaceSectionView *v6;
  MUPlaceSectionView *sectionView;

  v3 = [MUPlaceRibbonView alloc];
  v4 = -[MUPlaceRibbonView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  ribbonView = self->_ribbonView;
  self->_ribbonView = v4;

  -[MUPlaceRibbonView setDelegate:](self->_ribbonView, "setDelegate:", self);
  -[MUPlaceRibbonView setAnalyticsDelegate:](self->_ribbonView, "setAnalyticsDelegate:", self);
  v6 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:]([MUPlaceSectionView alloc], "initWithStyle:alwaysHideSeparators:", 0, 1);
  sectionView = self->_sectionView;
  self->_sectionView = v6;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  -[MUPlaceSectionView attachViewToContentView:](self->_sectionView, "attachViewToContentView:", self->_ribbonView);
  -[MUPlaceRibbonSectionController buildContent](self, "buildContent");
}

- (void)buildContent
{
  id v3;
  id v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  unsigned int v20;
  const __CFString *v21;
  uint64_t v22;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v23;
  void *v24;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v25;
  uint64_t v26;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *ratingViewModel;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v34;
  void *v35;
  objc_class *v36;
  MUPlaceDistanceRibbonViewModel *v37;
  void *v38;
  MUPlaceDistanceRibbonViewModel *v39;
  MUPlaceDistanceRibbonViewModel *distanceViewModel;
  void *v41;
  MUPlaceRibbonEVChargingViewModel *v42;
  MUPlaceCallToActionRibbonViewModel *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v49;
  void *v50;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v51;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v52;
  MUPlaceRatingAndSubmissionStatusRibbonViewModel *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  MUPlaceCallToActionRibbonViewModel *v57;
  uint64_t *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  MUPlaceDistanceRibbonViewModel *v63;
  void *v64;
  void *v65;
  MUPlaceDistanceRibbonViewModel *v66;
  MUPlaceDistanceRibbonViewModel *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  id v77;
  MUPlaceRibbonSectionController *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD aBlock[4];
  id v89;
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  const __CFString *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MUPlaceRibbonSectionController_buildContent__block_invoke;
  aBlock[3] = &unk_1E2E02C08;
  v4 = v3;
  v89 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonSectionController ribbonConfig](self, "ribbonConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    -[MUPlaceRibbonSectionController ribbonConfig](self, "ribbonConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ribbonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    if (v10)
    {
      v11 = v10;
      v79 = v6;
      v77 = v4;
      v12 = *(_QWORD *)v85;
      v78 = self;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v85 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v13);
          v15 = objc_msgSend(v14, "isValid");
          MUGetPlaceCardLog();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if ((v15 & 1) != 0)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v18 = objc_msgSend(v14, "type");
              *(_DWORD *)buf = 67109120;
              LODWORD(v92) = v18;
              _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_INFO, "Creating a ribbon from ribbon type %d", buf, 8u);
            }

            switch(objc_msgSend(v14, "type"))
            {
              case 0u:
                MUGetPlaceCardLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v92 = v14;
                  _os_log_impl(&dword_191DB8000, v19, OS_LOG_TYPE_ERROR, "Encountered a ribbon item %@ with an unknown type", buf, 0xCu);
                }

                break;
              case 1u:
                +[MUPlaceRibbonItemViewModel hoursItemViewModelForMapItem:](MUPlaceRibbonItemViewModel, "hoursItemViewModelForMapItem:", v79);
                v22 = objc_claimAutoreleasedReturnValue();
                goto LABEL_24;
              case 2u:
                v23 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
                -[MUPlaceRibbonSectionController _submissionStatusForRatings](self, "_submissionStatusForRatings");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = -[MUPlaceRatingAndSubmissionStatusRibbonViewModel initWithMapItem:submissionStatus:](v23, "initWithMapItem:submissionStatus:", v79, v24);
                v26 = 112;
                ratingViewModel = self->_ratingViewModel;
                self->_ratingViewModel = v25;

                goto LABEL_37;
              case 3u:
                objc_msgSend(v14, "amenityItem");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                +[MUPlaceRibbonItemViewModel amenityItemViewForMapItem:amenityItemConfiguration:](MUPlaceRibbonItemViewModel, "amenityItemViewForMapItem:amenityItemConfiguration:", v79, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v5[2](v5, v29);

                goto LABEL_25;
              case 4u:
                +[MUPlaceRibbonItemViewModel costItemViewForMapItem:](MUPlaceRibbonItemViewModel, "costItemViewForMapItem:", v79);
                v22 = objc_claimAutoreleasedReturnValue();
                goto LABEL_24;
              case 5u:
                +[MUPlaceRibbonItemViewModel guidesItemViewModelForMapItem:](MUPlaceRibbonItemViewModel, "guidesItemViewModelForMapItem:", v79);
                v22 = objc_claimAutoreleasedReturnValue();
LABEL_24:
                v28 = (void *)v22;
                v5[2](v5, (void *)v22);
                goto LABEL_25;
              case 6u:
                -[MUPlaceSectionController mapItem](self, "mapItem");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "_encyclopedicInfo");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "factoidItem");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "factoidAtIndex:", objc_msgSend(v32, "indexWithinFactoidComponent"));
                v17 = objc_claimAutoreleasedReturnValue();

                if (v17)
                {
                  +[MUPlaceRibbonItemViewModel factoidItemForFactoid:](MUPlaceRibbonItemViewModel, "factoidItemForFactoid:", v17);
                  v33 = objc_claimAutoreleasedReturnValue();
                  v5[2](v5, v33);
                }
                else
                {
                  MUGetPlaceCardLog();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v14, "factoidItem");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v45, "indexWithinFactoidComponent");
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v92) = v46;
                    _os_log_impl(&dword_191DB8000, v33, OS_LOG_TYPE_ERROR, "Failed to find a factoid with index %d", buf, 8u);

                  }
                }
                self = v78;

                goto LABEL_18;
              case 7u:
                if (MapsFeature_IsEnabled_SydneyARP())
                {
                  v34 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
                  -[MUPlaceRibbonSectionController _submissionStatusForCallToAction](self, "_submissionStatusForCallToAction");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = -[MUPlaceRatingAndSubmissionStatusRibbonViewModel initWithMapItem:submissionStatus:](v34, "initWithMapItem:submissionStatus:", 0, v35);
                  v26 = 104;
                }
                else
                {
                  v43 = [MUPlaceCallToActionRibbonViewModel alloc];
                  -[MUPlaceRibbonSectionController _submissionStatusForCallToAction](self, "_submissionStatusForCallToAction");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = -[MUPlaceCallToActionRibbonViewModel initWithSubmissionStatus:](v43, "initWithSubmissionStatus:", v35);
                  v26 = 96;
                }
                goto LABEL_35;
              case 8u:
                v37 = [MUPlaceDistanceRibbonViewModel alloc];
                -[MUPlaceSectionController mapItem](self, "mapItem");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[MUPlaceRibbonSectionControllerConfiguration etaProvider](self->_configuration, "etaProvider");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = -[MUPlaceDistanceRibbonViewModel initWithMapItem:etaProvider:](v37, "initWithMapItem:etaProvider:", v35, v38);
                v26 = 120;
                distanceViewModel = self->_distanceViewModel;
                self->_distanceViewModel = v39;

                goto LABEL_36;
              case 9u:
                -[MUPlaceRibbonSectionControllerConfiguration availability](self->_configuration, "availability");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v28, "supportsEVCharging") & 1) != 0)
                {
                  -[MUPlaceRibbonSectionControllerConfiguration evChargerAvailabilityProvider](self->_configuration, "evChargerAvailabilityProvider");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v41)
                  {
                    v42 = [MUPlaceRibbonEVChargingViewModel alloc];
                    -[MUPlaceRibbonSectionControllerConfiguration evChargerAvailabilityProvider](self->_configuration, "evChargerAvailabilityProvider");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = -[MUPlaceRibbonEVChargingViewModel initWithAvailabilityProvider:](v42, "initWithAvailabilityProvider:", v35);
                    v26 = 128;
LABEL_35:
                    v44 = *(Class *)((char *)&self->super.super.isa + v26);
                    *(Class *)((char *)&self->super.super.isa + v26) = v36;

LABEL_36:
LABEL_37:
                    v5[2](v5, *(void **)((char *)&self->super.super.isa + v26));
                  }
                }
                else
                {
LABEL_25:

                }
                break;
              default:
                break;
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v20 = objc_msgSend(v14, "type") - 1;
              v21 = CFSTR("RIBBON_ITEM_TYPE_UNKNOWN");
              if (v20 <= 8)
                v21 = off_1E2E02C28[v20];
              *(_DWORD *)buf = 138412546;
              v92 = v14;
              v93 = 2112;
              v94 = v21;
              _os_log_impl(&dword_191DB8000, v17, OS_LOG_TYPE_ERROR, "Ribbon item %@ of type %@ is invalid", buf, 0x16u);
            }
LABEL_18:

          }
          ++v13;
        }
        while (v11 != v13);
        v47 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
        v11 = v47;
      }
      while (v47);
      v4 = v77;
      v6 = v79;
    }
  }
  else
  {
    +[MUPlaceRibbonItemViewModel hoursItemViewModelForMapItem:](MUPlaceRibbonItemViewModel, "hoursItemViewModelForMapItem:", v6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v48);

    v49 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
    -[MUPlaceRibbonSectionController _submissionStatusForRatings](self, "_submissionStatusForRatings");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[MUPlaceRatingAndSubmissionStatusRibbonViewModel initWithMapItem:submissionStatus:](v49, "initWithMapItem:submissionStatus:", v6, v50);
    v52 = self->_ratingViewModel;
    self->_ratingViewModel = v51;

    v5[2](v5, self->_ratingViewModel);
    if (MapsFeature_IsEnabled_SydneyARP())
    {
      v53 = [MUPlaceRatingAndSubmissionStatusRibbonViewModel alloc];
      -[MUPlaceRibbonSectionController _submissionStatusForCallToAction](self, "_submissionStatusForCallToAction");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[MUPlaceRatingAndSubmissionStatusRibbonViewModel initWithMapItem:submissionStatus:](v53, "initWithMapItem:submissionStatus:", 0, v54);
      v56 = 104;
    }
    else
    {
      v57 = [MUPlaceCallToActionRibbonViewModel alloc];
      -[MUPlaceRibbonSectionController _submissionStatusForCallToAction](self, "_submissionStatusForCallToAction");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[MUPlaceCallToActionRibbonViewModel initWithSubmissionStatus:](v57, "initWithSubmissionStatus:", v54);
      v56 = 96;
    }
    v58 = (uint64_t *)((char *)self + v56);
    v59 = *(Class *)((char *)&self->super.super.isa + v56);
    *v58 = v55;

    v5[2](v5, (void *)*v58);
    +[MUPlaceRibbonItemViewModel guidesItemViewModelForMapItem:](MUPlaceRibbonItemViewModel, "guidesItemViewModelForMapItem:", v6);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v60);

    +[MUPlaceRibbonItemViewModel costItemViewForMapItem:](MUPlaceRibbonItemViewModel, "costItemViewForMapItem:", v6);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v61);

    +[MUPlaceRibbonItemViewModel amenityItemViewForMapItem:amenityItemConfiguration:](MUPlaceRibbonItemViewModel, "amenityItemViewForMapItem:amenityItemConfiguration:", v6, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v62);

    v63 = [MUPlaceDistanceRibbonViewModel alloc];
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceRibbonSectionControllerConfiguration etaProvider](self->_configuration, "etaProvider");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[MUPlaceDistanceRibbonViewModel initWithMapItem:etaProvider:](v63, "initWithMapItem:etaProvider:", v64, v65);
    v67 = self->_distanceViewModel;
    self->_distanceViewModel = v66;

    v5[2](v5, self->_distanceViewModel);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "_geoMapItem");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "_encyclopedicInfo");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "factoids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v71)
    {
      v72 = v71;
      v73 = v6;
      v74 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v72; ++i)
        {
          if (*(_QWORD *)v81 != v74)
            objc_enumerationMutation(v9);
          +[MUPlaceRibbonItemViewModel factoidItemForFactoid:](MUPlaceRibbonItemViewModel, "factoidItemForFactoid:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v5[2](v5, v76);

        }
        v72 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v72);
      v6 = v73;
    }
  }

  -[MUPlaceRibbonView setViewModels:](self->_ribbonView, "setViewModels:", v4);
  -[MUPlaceRibbonView reloadVisibility](self->_ribbonView, "reloadVisibility");

}

uint64_t __46__MUPlaceRibbonSectionController_buildContent__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (GEOPlaceRibbonConfiguration)ribbonConfig
{
  return -[MUPlaceRibbonSectionControllerConfiguration ribbonConfiguration](self->_configuration, "ribbonConfiguration");
}

- (BOOL)_supportsAddRatingsCallToAction
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[MUPlaceRibbonSectionControllerConfiguration availability](self->_configuration, "availability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsPhotoOnlyDataCollection");

  if ((v4 & 1) != 0)
    return 0;
  -[MUPlaceRibbonSectionControllerConfiguration availability](self->_configuration, "availability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCallToAction");

  return v7;
}

- (BOOL)_shouldShowCallToActionRibbonItem
{
  void *v3;
  BOOL v4;

  if (!-[MUPlaceRibbonSectionController _supportsAddRatingsCallToAction](self, "_supportsAddRatingsCallToAction"))
    return 0;
  -[MUPlaceRatingAndSubmissionStatusRibbonViewModel submissionStatus](self->_ratingViewModel, "submissionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)_shouldShowRatingsRibbonItem
{
  void *v3;
  void *v4;
  char v5;

  if (GEOConfigGetBOOL()
    && (-[MUPlaceSectionController mapItem](self, "mapItem"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_geoMapItem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_hasAppleRatings"),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    return !-[MUPlaceRibbonSectionController _supportsAddRatingsCallToAction](self, "_supportsAddRatingsCallToAction");
  }
  else
  {
    return 1;
  }
}

- (BOOL)hasContent
{
  return -[MUPlaceRibbonView hasContent](self->_ribbonView, "hasContent");
}

- (void)setSubmissionStatus:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  id v9;

  v5 = a3;
  v6 = self->_submissionStatus;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if (!v8)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      -[MUPlaceRibbonSectionController _updateAppearanceForSubmissionStatus](self, "_updateAppearanceForSubmissionStatus");
      v7 = (unint64_t)v9;
    }
  }

}

- (id)_submissionStatusForRatings
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MUPlaceCallToActionAppearance *v9;

  if (!MapsFeature_IsEnabled_SydneyARP())
    goto LABEL_8;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_hasAppleRatings") & 1) == 0)
  {

    goto LABEL_8;
  }
  v5 = -[MUPlaceRibbonSectionController _supportsAddRatingsCallToAction](self, "_supportsAddRatingsCallToAction");

  if (!v5)
  {
LABEL_8:
    v9 = 0;
    return v9;
  }
  -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") != 4)
  {

    goto LABEL_11;
  }
  -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ratingState");

  if (!v8)
  {
LABEL_11:
    v9 = -[MUPlaceCallToActionAppearance initWithType:]([MUPlaceCallToActionAppearance alloc], "initWithType:", 1);
    return v9;
  }
  -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
  v9 = (MUPlaceCallToActionAppearance *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)_submissionStatusForCallToAction
{
  int IsEnabled_SydneyARP;
  MUPlaceCallToActionAppearance *v4;
  MUPlaceCallToActionAppearance *v5;
  void *v6;
  uint64_t v7;
  MUPlaceCallToActionAppearance *v8;

  IsEnabled_SydneyARP = MapsFeature_IsEnabled_SydneyARP();
  -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
  v4 = (MUPlaceCallToActionAppearance *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsEnabled_SydneyARP)
  {
    if (-[MUPlaceCallToActionAppearance type](v4, "type") == 4)
    {
      -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "ratingState");

      if (v7)
      {
        -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
        v8 = (MUPlaceCallToActionAppearance *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        v5 = v8;
        return v5;
      }
    }
    else
    {

    }
    v8 = -[MUPlaceCallToActionAppearance initWithType:]([MUPlaceCallToActionAppearance alloc], "initWithType:", 1);
    goto LABEL_7;
  }
  return v5;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)_updateAppearanceForSubmissionStatus
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[MUPlaceRibbonSectionController hasContent](self, "hasContent");
  -[MUPlaceRibbonSectionController _submissionStatusForRatings](self, "_submissionStatusForRatings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRatingAndSubmissionStatusRibbonViewModel setSubmissionStatus:](self->_ratingViewModel, "setSubmissionStatus:", v4);

  -[MUPlaceRibbonSectionController _submissionStatusForCallToAction](self, "_submissionStatusForCallToAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCallToActionRibbonViewModel setSubmissionStatus:](self->_arpViewModel, "setSubmissionStatus:", v5);

  -[MUPlaceRibbonSectionController _submissionStatusForCallToAction](self, "_submissionStatusForCallToAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRatingAndSubmissionStatusRibbonViewModel setSubmissionStatus:](self->_arpViewModelSydney, "setSubmissionStatus:", v6);

  -[MUPlaceRibbonView reloadVisibility](self->_ribbonView, "reloadVisibility");
  -[MUPlaceRibbonSectionController _updateWithPreviousState:](self, "_updateWithPreviousState:", v3);
}

- (void)_updateWithPreviousState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (-[MUPlaceRibbonSectionController hasContent](self, "hasContent") != a3)
  {
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v3;
      v8 = 1024;
      v9 = -[MUPlaceRibbonSectionController hasContent](self, "hasContent");
      _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "MUPlaceHeaderButtonsSectionController: hasContent changed from %d to %d, will tell parent to update.", (uint8_t *)v7, 0xEu);
    }

    -[MUPlaceSectionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeSectionControllerDidUpdateContent:", self);

  }
}

- (void)ribbonView:(id)a3 didTapItemWithViewModel:(id)a4 withPresentationOptions:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  v7 = objc_msgSend(a4, "type");
  if (v7 == 2)
  {
    -[MUPlaceRibbonSectionController ribbonDelegate](self, "ribbonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ribbonSectionControllerDidTapHours:", self);
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 99, CFSTR("place context"), 0);
    -[MUPlaceRibbonSectionController ribbonDelegate](self, "ribbonDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceRibbonSectionController submissionStatus](self, "submissionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ribbonSectionControllerDidTapAddRatings:initialRatingState:withPresentationOptions:", self, objc_msgSend(v9, "ratingState"), v10);

LABEL_5:
  }

}

- (BOOL)ribbonView:(id)a3 shouldShowRibbonItem:(id)a4
{
  id v6;
  MUPlaceCallToActionRibbonViewModel *v7;
  MUPlaceCallToActionRibbonViewModel *v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  v7 = (MUPlaceCallToActionRibbonViewModel *)a4;
  v8 = v7;
  if (self->_arpViewModel == v7 || (MUPlaceCallToActionRibbonViewModel *)self->_arpViewModelSydney == v7)
  {
    v10 = -[MUPlaceRibbonSectionController _shouldShowCallToActionRibbonItem](self, "_shouldShowCallToActionRibbonItem");
LABEL_7:
    v9 = v10;
    goto LABEL_8;
  }
  if ((MUPlaceCallToActionRibbonViewModel *)self->_ratingViewModel == v7)
  {
    v10 = -[MUPlaceRibbonSectionController _shouldShowRatingsRibbonItem](self, "_shouldShowRatingsRibbonItem");
    goto LABEL_7;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (int)analyticsModuleType
{
  return 35;
}

- (void)performInstrumentationForScrollLeft
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 263, 0, 0);
}

- (void)performInstrumentationForScrollRight
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 262, 0, 0, 0);
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceRibbonSectionControllerDelegate)ribbonDelegate
{
  return (MUPlaceRibbonSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_ribbonDelegate);
}

- (void)setRibbonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_ribbonDelegate, a3);
}

- (BOOL)shouldShowARPCallToAction
{
  return self->_shouldShowARPCallToAction;
}

- (BOOL)isAllowedToShowRatingScoreRibbonItem
{
  return self->_isAllowedToShowRatingScoreRibbonItem;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ribbonDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_evChargingViewModel, 0);
  objc_storeStrong((id *)&self->_distanceViewModel, 0);
  objc_storeStrong((id *)&self->_ratingViewModel, 0);
  objc_storeStrong((id *)&self->_arpViewModelSydney, 0);
  objc_storeStrong((id *)&self->_arpViewModel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_ribbonView, 0);
}

@end
