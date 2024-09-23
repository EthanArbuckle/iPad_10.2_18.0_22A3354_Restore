@implementation GEOComposedRouteAdvisoryItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOServerFormattedString)attribution
{
  return self->_attribution;
}

- (GEOComposedRouteAdvisoryItem)initWithAdvisoryItem:(id)a3 routeIncidents:(id)a4 fallbackIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOComposedRouteAdvisoryItem *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  GEOServerFormattedString *v15;
  GEOComposedString *v16;
  void *v17;
  uint64_t v18;
  GEOComposedString *v19;
  void *v20;
  uint64_t v21;
  GEOServerFormattedString *v22;
  GEOComposedString *v23;
  void *v24;
  uint64_t v25;
  GEOComposedString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  GEOServerFormattedString *dateOfLastUpdateDescription;
  GEOComposedString *v32;
  void *v33;
  uint64_t v34;
  GEOComposedString *dateOfLastUpdateString;
  void *v36;
  uint64_t v37;
  GEOServerFormattedString *attribution;
  GEOComposedString *v39;
  void *v40;
  uint64_t v41;
  GEOComposedString *attributionString;
  uint64_t v43;
  void *details;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  GEOServerFormattedString *title;
  GEOComposedString *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  GEOComposedString *titleString;
  void *v55;
  void *v56;
  uint64_t v57;
  GEOServerFormattedString *subtitle;
  GEOComposedString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  GEOComposedString *subtitleString;
  uint64_t v64;
  NSDate *dateOfLastUpdate;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  NSArray *analyticsMessageValues;
  GEOComposedRouteAdvisoryItem *v73;
  NSObject *v75;
  const char *v76;
  uint8_t v77[16];
  objc_super v78;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v78.receiver = self;
  v78.super_class = (Class)GEOComposedRouteAdvisoryItem;
  v11 = -[GEOComposedRouteAdvisoryItem init](&v78, sel_init);
  if (!v11)
    goto LABEL_18;
  if ((objc_msgSend(v8, "hasAdvisoryCard") & 1) == 0 && (objc_msgSend(v8, "hasIncidentIndex") & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_WORD *)v77 = 0;
    v75 = MEMORY[0x1E0C81028];
    v76 = "Assertion failed: advisoryItem.hasAdvisoryCard || advisoryItem.hasIncidentIndex";
    goto LABEL_25;
  }
  if (!objc_msgSend(v8, "hasAdvisoryCard"))
  {
    v45 = objc_msgSend(v9, "count");
    if (v45 >= objc_msgSend(v8, "incidentIndex"))
    {
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "incidentIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "restrictionInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "titleString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "copy");
      title = v11->_title;
      v11->_title = (GEOServerFormattedString *)v48;

      v50 = [GEOComposedString alloc];
      objc_msgSend(v12, "restrictionInfo");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "titleString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[GEOComposedString initWithGeoFormattedString:](v50, "initWithGeoFormattedString:", v52);
      titleString = v11->_titleString;
      v11->_titleString = (GEOComposedString *)v53;

      objc_msgSend(v12, "restrictionInfo");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "subTitleString");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "copy");
      subtitle = v11->_subtitle;
      v11->_subtitle = (GEOServerFormattedString *)v57;

      v59 = [GEOComposedString alloc];
      objc_msgSend(v12, "restrictionInfo");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "subTitleString");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[GEOComposedString initWithGeoFormattedString:](v59, "initWithGeoFormattedString:", v61);
      subtitleString = v11->_subtitleString;
      v11->_subtitleString = (GEOComposedString *)v62;

      if ((objc_msgSend(v12, "hasUpdateTime") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v12, "updateTime"));
        v64 = objc_claimAutoreleasedReturnValue();
        dateOfLastUpdate = v11->_dateOfLastUpdate;
        v11->_dateOfLastUpdate = (NSDate *)v64;
      }
      else
      {
        dateOfLastUpdate = v11->_dateOfLastUpdate;
        v11->_dateOfLastUpdate = 0;
      }

      objc_msgSend(v12, "artwork");
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = (void *)v66;
      if (v66)
        v68 = (void *)v66;
      else
        v68 = v10;
      objc_storeStrong((id *)&v11->_artwork, v68);

      v11->_isNonTransitIncident = 1;
      -[GEOComposedRouteAdvisoryItem _detailsForIncident:](v11, "_detailsForIncident:", v12);
      v69 = objc_claimAutoreleasedReturnValue();
      details = v11->_details;
      v11->_details = (NSArray *)v69;
      goto LABEL_17;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_23:
      v73 = 0;
      goto LABEL_19;
    }
    *(_WORD *)v77 = 0;
    v75 = MEMORY[0x1E0C81028];
    v76 = "Assertion failed: incidents.count >= advisoryItem.incidentIndex";
LABEL_25:
    _os_log_fault_impl(&dword_1885A9000, v75, OS_LOG_TYPE_FAULT, v76, v77, 2u);
    goto LABEL_23;
  }
  objc_msgSend(v8, "advisoryCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  v15 = v11->_title;
  v11->_title = (GEOServerFormattedString *)v14;

  v16 = [GEOComposedString alloc];
  objc_msgSend(v12, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[GEOComposedString initWithGeoFormattedString:](v16, "initWithGeoFormattedString:", v17);
  v19 = v11->_titleString;
  v11->_titleString = (GEOComposedString *)v18;

  objc_msgSend(v12, "details");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = v11->_subtitle;
  v11->_subtitle = (GEOServerFormattedString *)v21;

  v23 = [GEOComposedString alloc];
  objc_msgSend(v12, "details");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[GEOComposedString initWithGeoFormattedString:](v23, "initWithGeoFormattedString:", v24);
  v26 = v11->_subtitleString;
  v11->_subtitleString = (GEOComposedString *)v25;

  objc_msgSend(v12, "artworkOverride");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (void *)v27;
  else
    v29 = v10;
  objc_storeStrong((id *)&v11->_artwork, v29);

  objc_msgSend(v12, "timeString");
  v30 = objc_claimAutoreleasedReturnValue();
  dateOfLastUpdateDescription = v11->_dateOfLastUpdateDescription;
  v11->_dateOfLastUpdateDescription = (GEOServerFormattedString *)v30;

  v32 = [GEOComposedString alloc];
  objc_msgSend(v12, "timeString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[GEOComposedString initWithGeoFormattedString:](v32, "initWithGeoFormattedString:", v33);
  dateOfLastUpdateString = v11->_dateOfLastUpdateString;
  v11->_dateOfLastUpdateString = (GEOComposedString *)v34;

  objc_msgSend(v12, "metadata");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "copy");
  attribution = v11->_attribution;
  v11->_attribution = (GEOServerFormattedString *)v37;

  v39 = [GEOComposedString alloc];
  objc_msgSend(v12, "metadata");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[GEOComposedString initWithGeoFormattedString:](v39, "initWithGeoFormattedString:", v40);
  attributionString = v11->_attributionString;
  v11->_attributionString = (GEOComposedString *)v41;

  objc_msgSend(v12, "action");
  v43 = objc_claimAutoreleasedReturnValue();
  details = v11->_cardAction;
  v11->_cardAction = (GEOAdvisoryCardAction *)v43;
LABEL_17:

  objc_msgSend(v8, "analyticsMessageValues");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "copy");
  analyticsMessageValues = v11->_analyticsMessageValues;
  v11->_analyticsMessageValues = (NSArray *)v71;

LABEL_18:
  v73 = v11;
LABEL_19:

  return v73;
}

- (GEOComposedRouteAdvisoryItem)initWithAdvisoryItem:(id)a3 transitIncidents:(id)a4 fallbackIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOComposedRouteAdvisoryItem *v11;
  GEOComposedRouteAdvisoryItem *v12;
  unint64_t v13;
  id *v14;
  _GEOTransitIncident *v15;
  void *v16;
  uint64_t v17;
  GEOServerFormattedString *title;
  GEOComposedString *v19;
  void *v20;
  uint64_t v21;
  GEOComposedString *titleString;
  void *v23;
  uint64_t v24;
  GEOServerFormattedString *subtitle;
  GEOComposedString *v26;
  void *v27;
  uint64_t v28;
  GEOComposedString *subtitleString;
  uint64_t v30;
  NSDate *dateOfLastUpdate;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *analyticsMessageValues;
  GEOComposedRouteAdvisoryItem *v38;
  uint8_t v40[16];
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "hasAdvisoryCard"))
  {
    v11 = -[GEOComposedRouteAdvisoryItem initWithAdvisoryItem:routeIncidents:fallbackIcon:](self, "initWithAdvisoryItem:routeIncidents:fallbackIcon:", v8, 0, v10);
LABEL_11:
    v12 = v11;
    v38 = v11;
    goto LABEL_12;
  }
  v41.receiver = self;
  v41.super_class = (Class)GEOComposedRouteAdvisoryItem;
  v12 = -[GEOComposedRouteAdvisoryItem init](&v41, sel_init);
  if (!v12)
  {
LABEL_10:
    v11 = v12;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "hasTransitIncidentIndex"))
  {
    v13 = objc_msgSend(v9, "count");
    if (v13 >= objc_msgSend(v8, "transitIncidentIndex"))
    {
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "transitIncidentIndex"));
      v14 = (id *)objc_claimAutoreleasedReturnValue();
      v15 = -[_GEOTransitIncident initWithIncident:]([_GEOTransitIncident alloc], "initWithIncident:", v14);
      -[_GEOTransitIncident title](v15, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_geo_formattedString");
      v17 = objc_claimAutoreleasedReturnValue();
      title = v12->_title;
      v12->_title = (GEOServerFormattedString *)v17;

      v19 = [GEOComposedString alloc];
      -[_GEOTransitIncident title](v15, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[GEOComposedString initWithString:](v19, "initWithString:", v20);
      titleString = v12->_titleString;
      v12->_titleString = (GEOComposedString *)v21;

      -[_GEOTransitIncident fullDescription](v15, "fullDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_geo_formattedString");
      v24 = objc_claimAutoreleasedReturnValue();
      subtitle = v12->_subtitle;
      v12->_subtitle = (GEOServerFormattedString *)v24;

      v26 = [GEOComposedString alloc];
      -[_GEOTransitIncident fullDescription](v15, "fullDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[GEOComposedString initWithString:](v26, "initWithString:", v27);
      subtitleString = v12->_subtitleString;
      v12->_subtitleString = (GEOComposedString *)v28;

      -[_GEOTransitIncident lastUpdated](v15, "lastUpdated");
      v30 = objc_claimAutoreleasedReturnValue();
      dateOfLastUpdate = v12->_dateOfLastUpdate;
      v12->_dateOfLastUpdate = (NSDate *)v30;

      -[GEOPBTransitIncident incidentTypeArtwork](v14);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      if (v32)
        v34 = (void *)v32;
      else
        v34 = v10;
      objc_storeStrong((id *)&v12->_artwork, v34);

      objc_msgSend(v8, "analyticsMessageValues");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "copy");
      analyticsMessageValues = v12->_analyticsMessageValues;
      v12->_analyticsMessageValues = (NSArray *)v36;

      goto LABEL_10;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v40 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: advisoryItem.hasTransitIncidentIndex && transitIncidents.count >= advisoryItem.transitIncidentIndex", v40, 2u);
  }
  v38 = 0;
LABEL_12:

  return v38;
}

- (id)_detailsForIncident:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GEOComposedRouteAdvisoryItemDetail *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "restrictionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restrictionDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "restrictionInfo", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "restrictionDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = -[GEOComposedRouteAdvisoryItemDetail initWithRestrictionDetails:]([GEOComposedRouteAdvisoryItemDetail alloc], "initWithRestrictionDetails:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
          if (v14)
            objc_msgSend(v7, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (GEOComposedRouteAdvisoryItem)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteAdvisoryItem *v5;
  uint64_t v6;
  GEOServerFormattedString *title;
  uint64_t v8;
  GEOComposedString *titleString;
  uint64_t v10;
  GEOServerFormattedString *subtitle;
  uint64_t v12;
  GEOComposedString *subtitleString;
  uint64_t v14;
  NSDate *dateOfLastUpdate;
  uint64_t v16;
  GEOServerFormattedString *dateOfLastUpdateDescription;
  uint64_t v18;
  GEOComposedString *dateOfLastUpdateString;
  uint64_t v20;
  GEOPBTransitArtwork *artwork;
  uint64_t v22;
  NSArray *details;
  uint64_t v24;
  GEOServerFormattedString *attribution;
  uint64_t v26;
  GEOComposedString *attributionString;
  uint64_t v28;
  NSArray *analyticsMessageValues;
  uint64_t v30;
  GEOAdvisoryCardAction *cardAction;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)GEOComposedRouteAdvisoryItem;
  v5 = -[GEOComposedRouteAdvisoryItem init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleString"));
    v8 = objc_claimAutoreleasedReturnValue();
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (GEOServerFormattedString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subtitleString"));
    v12 = objc_claimAutoreleasedReturnValue();
    subtitleString = v5->_subtitleString;
    v5->_subtitleString = (GEOComposedString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dateOfLastUpdate"));
    v14 = objc_claimAutoreleasedReturnValue();
    dateOfLastUpdate = v5->_dateOfLastUpdate;
    v5->_dateOfLastUpdate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dateOfLastUpdateDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    dateOfLastUpdateDescription = v5->_dateOfLastUpdateDescription;
    v5->_dateOfLastUpdateDescription = (GEOServerFormattedString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dateOfLastUpdateString"));
    v18 = objc_claimAutoreleasedReturnValue();
    dateOfLastUpdateString = v5->_dateOfLastUpdateString;
    v5->_dateOfLastUpdateString = (GEOComposedString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_artwork"));
    v20 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v20;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_details"));
    v22 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attribution"));
    v24 = objc_claimAutoreleasedReturnValue();
    attribution = v5->_attribution;
    v5->_attribution = (GEOServerFormattedString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attributionString"));
    v26 = objc_claimAutoreleasedReturnValue();
    attributionString = v5->_attributionString;
    v5->_attributionString = (GEOComposedString *)v26;

    v5->_isNonTransitIncident = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isNonTransitIncident"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_analyticsMessageValues"));
    v28 = objc_claimAutoreleasedReturnValue();
    analyticsMessageValues = v5->_analyticsMessageValues;
    v5->_analyticsMessageValues = (NSArray *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cardAction"));
    v30 = objc_claimAutoreleasedReturnValue();
    cardAction = v5->_cardAction;
    v5->_cardAction = (GEOAdvisoryCardAction *)v30;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOServerFormattedString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleString, CFSTR("_titleString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("_subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleString, CFSTR("_subtitleString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfLastUpdate, CFSTR("_dateOfLastUpdate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfLastUpdateDescription, CFSTR("_dateOfLastUpdateDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfLastUpdateString, CFSTR("_dateOfLastUpdateString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artwork, CFSTR("_artwork"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_details, CFSTR("_details"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attribution, CFSTR("_attribution"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributionString, CFSTR("_attributionString"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNonTransitIncident, CFSTR("_isNonTransitIncident"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsMessageValues, CFSTR("_analyticsMessageValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardAction, CFSTR("_cardAction"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 24), self->_title);
  v5 = -[GEOComposedString copy](self->_titleString, "copy");
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  objc_storeStrong((id *)(v4 + 40), self->_subtitle);
  v7 = -[GEOComposedString copy](self->_subtitleString, "copy");
  v8 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v7;

  v9 = -[NSDate copy](self->_dateOfLastUpdate, "copy");
  v10 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v9;

  objc_storeStrong((id *)(v4 + 64), self->_dateOfLastUpdateDescription);
  v11 = -[GEOComposedString copy](self->_dateOfLastUpdateString, "copy");
  v12 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v11;

  objc_storeStrong((id *)(v4 + 16), self->_artwork);
  v13 = -[NSArray copy](self->_details, "copy");
  v14 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v13;

  objc_storeStrong((id *)(v4 + 88), self->_attribution);
  v15 = -[GEOComposedString copy](self->_attributionString, "copy");
  v16 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v15;

  *(_BYTE *)(v4 + 8) = self->_isNonTransitIncident;
  objc_storeStrong((id *)(v4 + 112), self->_cardAction);
  return (id)v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ title: %@, isNonTransitIncident: %ld, subtitle: %@, dateOfLastUpdate: %@, dateOfLastUpdateDescription: %@, artwork: %@, details: %@, attribution: %@, cardAction: %@>"), v5, self->_titleString, self->_isNonTransitIncident, self->_subtitleString, self->_dateOfLastUpdate, self->_dateOfLastUpdateString, self->_artwork, self->_details, self->_attributionString, self->_cardAction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (GEOServerFormattedString)subtitle
{
  return self->_subtitle;
}

- (GEOComposedString)subtitleString
{
  return self->_subtitleString;
}

- (NSDate)dateOfLastUpdate
{
  return self->_dateOfLastUpdate;
}

- (GEOServerFormattedString)dateOfLastUpdateDescription
{
  return self->_dateOfLastUpdateDescription;
}

- (GEOComposedString)dateOfLastUpdateString
{
  return self->_dateOfLastUpdateString;
}

- (NSArray)details
{
  return self->_details;
}

- (GEOComposedString)attributionString
{
  return self->_attributionString;
}

- (BOOL)isNonTransitIncident
{
  return self->_isNonTransitIncident;
}

- (NSArray)analyticsMessageValues
{
  return self->_analyticsMessageValues;
}

- (GEOAdvisoryCardAction)cardAction
{
  return self->_cardAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardAction, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdateString, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdateDescription, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
