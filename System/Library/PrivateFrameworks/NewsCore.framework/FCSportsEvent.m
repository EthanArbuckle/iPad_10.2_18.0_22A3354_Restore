@implementation FCSportsEvent

- (FCSportsEvent)initWithSportsEventRecord:(id)a3 eventCompetitorTags:(id)a4 eventLeagueTag:(id)a5 assetManager:(id)a6 interestToken:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FCSportsEvent *v17;
  void *v18;
  uint64_t v19;
  NSString *identifier;
  void *v21;
  uint64_t v22;
  NSString *versionKey;
  uint64_t v24;
  NSDate *loadDate;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDate *fetchDate;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSDate *lastModifiedDate;
  uint64_t v36;
  NSArray *allowedStorefrontIDs;
  uint64_t v38;
  NSArray *blockedStorefrontIDs;
  uint64_t v40;
  NSString *highlightsArticleListID;
  uint64_t v42;
  NSString *superfeedConfigResourceID;
  uint64_t v44;
  NSString *eventArticleListID;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSString *sportsData;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSDictionary *rosterResourceIDs;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  id v71;
  id v72;
  void *context;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  objc_super v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v75 = a7;
  v80.receiver = self;
  v80.super_class = (Class)FCSportsEvent;
  v17 = -[FCSportsEvent init](&v80, sel_init);
  if (v17)
  {
    v74 = v16;
    context = (void *)MEMORY[0x1A8580B64]();
    objc_storeStrong((id *)&v17->_sportsEventRecord, a3);
    objc_storeStrong((id *)&v17->_interestToken, a7);
    objc_msgSend(v13, "base");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v19;

    objc_msgSend(v13, "base");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "changeTag");
    v22 = objc_claimAutoreleasedReturnValue();
    versionKey = v17->_versionKey;
    v17->_versionKey = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = objc_claimAutoreleasedReturnValue();
    loadDate = v17->_loadDate;
    v17->_loadDate = (NSDate *)v24;

    v26 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v13, "base");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fetchDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateWithPBDate:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    fetchDate = v17->_fetchDate;
    v17->_fetchDate = (NSDate *)v29;

    v31 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v13, "base");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "modificationDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dateWithPBDate:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v17->_lastModifiedDate;
    v17->_lastModifiedDate = (NSDate *)v34;

    objc_msgSend(v13, "allowedStorefrontIDs");
    v36 = objc_claimAutoreleasedReturnValue();
    allowedStorefrontIDs = v17->_allowedStorefrontIDs;
    v17->_allowedStorefrontIDs = (NSArray *)v36;

    objc_msgSend(v13, "blockedStorefrontIDs");
    v38 = objc_claimAutoreleasedReturnValue();
    blockedStorefrontIDs = v17->_blockedStorefrontIDs;
    v17->_blockedStorefrontIDs = (NSArray *)v38;

    v17->_minimumNewsVersion = objc_msgSend(v13, "minimumNewsVersion");
    objc_msgSend(v13, "highlightsArticleListID");
    v40 = objc_claimAutoreleasedReturnValue();
    highlightsArticleListID = v17->_highlightsArticleListID;
    v17->_highlightsArticleListID = (NSString *)v40;

    objc_msgSend(v13, "superfeedConfigResourceID");
    v42 = objc_claimAutoreleasedReturnValue();
    superfeedConfigResourceID = v17->_superfeedConfigResourceID;
    v17->_superfeedConfigResourceID = (NSString *)v42;

    objc_storeStrong((id *)&v17->_eventCompetitorTags, a4);
    objc_storeStrong((id *)&v17->_eventLeagueTag, a5);
    objc_msgSend(v13, "eventArticleListID");
    v44 = objc_claimAutoreleasedReturnValue();
    eventArticleListID = v17->_eventArticleListID;
    v17->_eventArticleListID = (NSString *)v44;

    v17->_isDeprecated = objc_msgSend(v13, "isDeprecated");
    objc_msgSend(v13, "sportsData");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "length");

    if (v47)
    {
      v71 = v15;
      objc_msgSend(v13, "sportsData");
      v48 = objc_claimAutoreleasedReturnValue();
      sportsData = v17->_sportsData;
      v17->_sportsData = (NSString *)v48;

      v50 = (void *)MEMORY[0x1E0C99D80];
      v72 = v13;
      objc_msgSend(v13, "sportsData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "fc_dictionaryFromJSON:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCSportsEvent _inflateSportsDataFromJSONDictionary:](v17, "_inflateSportsDataFromJSONDictionary:", v52);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v52;
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("competitorRosters"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v77 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("competitorTagID"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v60)
            {
              objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("rosterResourceID"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setObject:forKeyedSubscript:", v61, v60);

            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
        }
        while (v56);
      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v53);
      v62 = objc_claimAutoreleasedReturnValue();
      rosterResourceIDs = v17->_rosterResourceIDs;
      v17->_rosterResourceIDs = (NSDictionary *)v62;

      v13 = v72;
      v15 = v71;
    }
    objc_msgSend(v13, "sportsTheme");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "length");

    if (v65)
    {
      v66 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v13, "sportsTheme");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "fc_dictionaryFromJSON:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCSportsEvent _inflateSportsThemeFromJSONDictionary:](v17, "_inflateSportsThemeFromJSONDictionary:", v68);
    }
    objc_autoreleasePoolPop(context);
    v16 = v74;
  }

  return v17;
}

+ (BOOL)isSportsEventIdentifier:(id)a3
{
  return +[FCSportsEventRecordSource recognizesRecordID:](FCSportsEventRecordSource, "recognizesRecordID:", a3);
}

- (void)_inflateSportsDataFromJSONDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *UMCCanonicalID;
  NSString *v7;
  NSString *sportsPrimaryName;
  NSString *v9;
  NSString *sportsNameAbbreviation;
  NSString *v11;
  NSString *sportsSecondaryName;
  NSString *v13;
  NSString *sportsSecondaryShortName;
  NSString *v15;
  NSString *sportsFullName;
  NSString *v17;
  NSString *topLevelSportTagIdentifier;
  NSArray *v19;
  NSArray *topLevelGroupsTagIdentifiers;
  NSString *v21;
  NSString *sportsNickname;
  NSString *v23;
  NSString *sportsLocation;
  NSString *v25;
  NSString *sportsTypeDisplayName;
  NSString *v27;
  NSString *sportsTypePluralizedDisplayName;
  NSDate *v29;
  NSDate *sportsEventStartTime;
  FCSportsData *v31;

  v4 = a3;
  v31 = -[FCSportsData initWithDictionary:]([FCSportsData alloc], "initWithDictionary:", v4);

  -[FCSportsData UMCCanonicalID](v31, "UMCCanonicalID");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  UMCCanonicalID = self->_UMCCanonicalID;
  self->_UMCCanonicalID = v5;

  -[FCSportsData sportsPrimaryName](v31, "sportsPrimaryName");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsPrimaryName = self->_sportsPrimaryName;
  self->_sportsPrimaryName = v7;

  -[FCSportsData sportsNameAbbreviation](v31, "sportsNameAbbreviation");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsNameAbbreviation = self->_sportsNameAbbreviation;
  self->_sportsNameAbbreviation = v9;

  -[FCSportsData sportsSecondaryName](v31, "sportsSecondaryName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsSecondaryName = self->_sportsSecondaryName;
  self->_sportsSecondaryName = v11;

  -[FCSportsData sportsSecondaryShortName](v31, "sportsSecondaryShortName");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsSecondaryShortName = self->_sportsSecondaryShortName;
  self->_sportsSecondaryShortName = v13;

  -[FCSportsData sportsFullName](v31, "sportsFullName");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsFullName = self->_sportsFullName;
  self->_sportsFullName = v15;

  -[FCSportsData topLevelSportTagIdentifier](v31, "topLevelSportTagIdentifier");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  topLevelSportTagIdentifier = self->_topLevelSportTagIdentifier;
  self->_topLevelSportTagIdentifier = v17;

  -[FCSportsData topLevelGroupsTagIdentifiers](v31, "topLevelGroupsTagIdentifiers");
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topLevelGroupsTagIdentifiers = self->_topLevelGroupsTagIdentifiers;
  self->_topLevelGroupsTagIdentifiers = v19;

  -[FCSportsData sportsNickname](v31, "sportsNickname");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsNickname = self->_sportsNickname;
  self->_sportsNickname = v21;

  -[FCSportsData sportsLocation](v31, "sportsLocation");
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsLocation = self->_sportsLocation;
  self->_sportsLocation = v23;

  self->_hideLocationInMasthead = -[FCSportsData hideLocationInMasthead](v31, "hideLocationInMasthead");
  self->_sportsType = -[FCSportsData sportsType](v31, "sportsType");
  -[FCSportsData sportsTypeDisplayName](v31, "sportsTypeDisplayName");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsTypeDisplayName = self->_sportsTypeDisplayName;
  self->_sportsTypeDisplayName = v25;

  -[FCSportsData sportsTypePluralizedDisplayName](v31, "sportsTypePluralizedDisplayName");
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  sportsTypePluralizedDisplayName = self->_sportsTypePluralizedDisplayName;
  self->_sportsTypePluralizedDisplayName = v27;

  self->_sportsLeagueType = -[FCSportsData sportsLeagueType](v31, "sportsLeagueType");
  -[FCSportsData sportsEventStartTime](v31, "sportsEventStartTime");
  v29 = (NSDate *)objc_claimAutoreleasedReturnValue();
  sportsEventStartTime = self->_sportsEventStartTime;
  self->_sportsEventStartTime = v29;

}

- (void)_inflateSportsThemeFromJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  FCColor *v6;
  FCColor *sportsPrimaryColor;
  void *v8;
  FCColor *v9;
  FCColor *sportsSecondaryColor;
  void *v11;
  FCColor *v12;
  FCColor *sportsEventNavigationForegroundColor;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v5);
  v6 = (FCColor *)objc_claimAutoreleasedReturnValue();
  sportsPrimaryColor = self->_sportsPrimaryColor;
  self->_sportsPrimaryColor = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondaryColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v8);
  v9 = (FCColor *)objc_claimAutoreleasedReturnValue();
  sportsSecondaryColor = self->_sportsSecondaryColor;
  self->_sportsSecondaryColor = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsLogoMastheadVisibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sportsLogoMastheadVisibility = (unint64_t)FCMastheadLogoVisibilityFromString(v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsEventNavigationForegroundColor"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v14);
  v12 = (FCColor *)objc_claimAutoreleasedReturnValue();
  sportsEventNavigationForegroundColor = self->_sportsEventNavigationForegroundColor;
  self->_sportsEventNavigationForegroundColor = v12;

}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__FCSportsEvent_contentArchive__block_invoke;
  v5[3] = &unk_1E463AA30;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

void __31__FCSportsEvent_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(_QWORD *)(v4 + 384);
  else
    v5 = 0;
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v6);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "eventCompetitorTags", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v12)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "conformsToProtocol:", &unk_1EE666C30))
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v14 = v13;
        objc_msgSend(v14, "contentArchive");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObject:", v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "eventLeagueTag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE666C30))
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  objc_msgSend(v19, "contentArchive");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v20);

}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[5];

  v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__FCSportsEvent_contentManifest__block_invoke;
  v7[3] = &unk_1E463AA30;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithManifests:](v3, "initWithManifests:", v4);

  return v5;
}

void __32__FCSportsEvent_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 384);
  else
    v5 = 0;
  objc_msgSend(v5, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v7);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "eventCompetitorTags", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v13)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "conformsToProtocol:", &unk_1EE666C30))
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v15 = v14;
        objc_msgSend(v15, "contentManifest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "eventLeagueTag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EE666C30))
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  objc_msgSend(v20, "contentManifest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v21);

}

- (BOOL)isRouteable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FCSportsEvent superfeedConfigResourceID](self, "superfeedConfigResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FCSportsEvent eventCompetitorTags](self, "eventCompetitorTags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCSportsEvent versionKey](self, "versionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "versionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  return v9;
}

- (FCChannelProviding)asChannel
{
  return 0;
}

- (FCSectionProviding)asSection
{
  return 0;
}

- (BOOL)isSports
{
  return 1;
}

- (BOOL)isSportsEvent
{
  return 1;
}

- (BOOL)isMySports
{
  return 0;
}

- (BOOL)isPuzzleHub
{
  return 0;
}

- (BOOL)isPuzzleType
{
  return 0;
}

- (BOOL)hasEvergreenArticleList
{
  return 0;
}

- (FCPuzzleTypeProviding)asPuzzleType
{
  return 0;
}

- (unint64_t)tagType
{
  return 1;
}

- (NSString)nameCompact
{
  return 0;
}

- (BOOL)hideAccessoryText
{
  return 0;
}

- (NSString)language
{
  return 0;
}

- (int64_t)contentProvider
{
  return 0;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return 0;
}

- (FCAssetHandle)feedNavImageAssetHandle
{
  return 0;
}

- (FCAssetHandle)feedNavImageHQAssetHandle
{
  return 0;
}

- (FCColor)groupTitleColor
{
  return 0;
}

- (FCColor)groupDarkStyleTitleColor
{
  return 0;
}

- (NSArray)iAdCategories
{
  return 0;
}

- (NSArray)iAdKeywords
{
  return 0;
}

- (BOOL)isExplicitContent
{
  return 0;
}

- (BOOL)isNotificationEnabled
{
  return 0;
}

- (BOOL)isPublic
{
  return 1;
}

- (BOOL)isSubscribable
{
  return 0;
}

- (NSString)magazineGenre
{
  return 0;
}

- (NSString)primaryAudience
{
  return 0;
}

- (NSString)publisherPaidAuthorizationURL
{
  return 0;
}

- (NSArray)publisherPaidFeldsparablePurchaseIDs
{
  return 0;
}

- (NSArray)publisherPaidBundlePurchaseIDs
{
  return 0;
}

- (NSArray)publisherPaidOfferableConfigurations
{
  return 0;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return 0;
}

- (NSString)publisherPaidVerificationURL
{
  return 0;
}

- (FCAssetHandle)nameImageMaskWidgetLQAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageMaskWidgetHQAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageCompactAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageLargeAssetHandle
{
  return 0;
}

- (FCAssetHandle)nameImageLargeMaskAssetHandle
{
  return 0;
}

- (BOOL)isBlockedExplicitContent
{
  return 0;
}

- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings
{
  return 0;
}

- (unint64_t)groupingEligibility
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isRealTimeTrackingEnabled
{
  return 0;
}

- (BOOL)isArticleReadCountReportingEnabled
{
  return 0;
}

- (BOOL)isAutoDarkModeEnabled
{
  return 0;
}

- (BOOL)disableFollow
{
  return 0;
}

- (BOOL)disableBlock
{
  return 0;
}

- (BOOL)useCompactNameForPersonalizedPaywall
{
  return 0;
}

- (BOOL)sponsoredFeedEligible
{
  return 0;
}

- (BOOL)isInternal
{
  return 0;
}

- (BOOL)isSandbox
{
  return 0;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isSensitiveTopic
{
  return 0;
}

- (BOOL)isNewspaper
{
  return 0;
}

- (BOOL)isMagazine
{
  return 0;
}

- (NSString)articleRecirculationConfigJSON
{
  return 0;
}

- (BOOL)publisherPaidWebAccessOptIn
{
  return 0;
}

- (NSString)publisherPaidWebAccessURL
{
  return 0;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  return 0;
}

- (NSDictionary)publisherSpecifiedArticles
{
  return 0;
}

- (FCPaywallConfiguration)paidBundlePaywallConfiguration
{
  return 0;
}

- (NSDate)publisherSpecifiedArticleIDsModifiedDate
{
  return 0;
}

- (NSString)replacementID
{
  return 0;
}

- (int64_t)score
{
  return 0;
}

- (FCTagStocksFields)stocksFields
{
  return 0;
}

- (double)subscriptionRate
{
  return 0.0;
}

- (NSString)subtitle
{
  return 0;
}

- (FCFeedTheming)theme
{
  return 0;
}

- (unint64_t)userFacingTagType
{
  return 1;
}

- (id)authorizationURL
{
  return 0;
}

- (id)feedIDForBin:(int64_t)a3
{
  return 0;
}

- (id)freeFeedIDForBin:(int64_t)a3
{
  return 0;
}

- (BOOL)isAuthenticationSetup
{
  return 0;
}

- (BOOL)isNoLongerAvailable
{
  return 0;
}

- (BOOL)isPurchaseSetup
{
  return 0;
}

- (id)paidFeedIDForBin:(int64_t)a3
{
  return 0;
}

- (id)prefetchPurchaseOffer
{
  return 0;
}

- (FCSportsRecommendationMappings)sportsRecommendationMappings
{
  return 0;
}

- (NSData)sportsRecommendationMappingsJSON
{
  return 0;
}

- (BOOL)isSportsRecommendable
{
  return 0;
}

- (NSArray)sportsParentTagIdentifiers
{
  return 0;
}

- (int64_t)sportsLogoMastheadHorizontalPaddingOffset
{
  return 0;
}

- (int64_t)sportsLogoMastheadLeadingOffset
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)versionKey
{
  return self->_versionKey;
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)titleDisplayPrefix
{
  return self->_titleDisplayPrefix;
}

- (void)setTitleDisplayPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)titleDisplaySuffix
{
  return self->_titleDisplaySuffix;
}

- (void)setTitleDisplaySuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)adTargetingKeywords
{
  return self->_adTargetingKeywords;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)highlightsArticleListID
{
  return self->_highlightsArticleListID;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (NSArray)eventCompetitorTags
{
  return self->_eventCompetitorTags;
}

- (FCSportsProviding)eventLeagueTag
{
  return self->_eventLeagueTag;
}

- (NSString)eventArticleListID
{
  return self->_eventArticleListID;
}

- (NSDictionary)rosterResourceIDs
{
  return self->_rosterResourceIDs;
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (NSString)UMCCanonicalID
{
  return self->_UMCCanonicalID;
}

- (NSString)sportsPrimaryName
{
  return self->_sportsPrimaryName;
}

- (NSString)sportsNameAbbreviation
{
  return self->_sportsNameAbbreviation;
}

- (NSString)sportsSecondaryName
{
  return self->_sportsSecondaryName;
}

- (NSString)sportsSecondaryShortName
{
  return self->_sportsSecondaryShortName;
}

- (NSString)sportsFullName
{
  return self->_sportsFullName;
}

- (NSString)sportsNickname
{
  return self->_sportsNickname;
}

- (NSString)sportsLocation
{
  return self->_sportsLocation;
}

- (BOOL)hideLocationInMasthead
{
  return self->_hideLocationInMasthead;
}

- (unint64_t)sportsType
{
  return self->_sportsType;
}

- (NSString)sportsTypeDisplayName
{
  return self->_sportsTypeDisplayName;
}

- (NSString)sportsTypePluralizedDisplayName
{
  return self->_sportsTypePluralizedDisplayName;
}

- (unint64_t)sportsLeagueType
{
  return self->_sportsLeagueType;
}

- (NSString)topLevelSportTagIdentifier
{
  return self->_topLevelSportTagIdentifier;
}

- (NSArray)topLevelGroupsTagIdentifiers
{
  return self->_topLevelGroupsTagIdentifiers;
}

- (NSDate)sportsEventStartTime
{
  return self->_sportsEventStartTime;
}

- (FCAssetHandle)sportsLogoImageAssetHandle
{
  return self->_sportsLogoImageAssetHandle;
}

- (FCAssetHandle)sportsLogoImageCompactAssetHandle
{
  return self->_sportsLogoImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoImageLargeAssetHandle
{
  return self->_sportsLogoImageLargeAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageAssetHandle
{
  return self->_sportsLogoAltImageAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageCompactAssetHandle
{
  return self->_sportsLogoAltImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageLargeAssetHandle
{
  return self->_sportsLogoAltImageLargeAssetHandle;
}

- (FCColor)sportsPrimaryColor
{
  return self->_sportsPrimaryColor;
}

- (FCColor)sportsSecondaryColor
{
  return self->_sportsSecondaryColor;
}

- (unint64_t)sportsLogoMastheadVisibility
{
  return self->_sportsLogoMastheadVisibility;
}

- (FCColor)sportsEventNavigationForegroundColor
{
  return self->_sportsEventNavigationForegroundColor;
}

- (NSString)supergroupConfigJson
{
  return self->_supergroupConfigJson;
}

- (NSString)supergroupKnobsJson
{
  return self->_supergroupKnobsJson;
}

- (FCSectionSupergroupKnobs)supergroupKnobs
{
  return self->_supergroupKnobs;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_sportsEventRecord, 0);
  objc_storeStrong((id *)&self->_supergroupKnobs, 0);
  objc_storeStrong((id *)&self->_supergroupKnobsJson, 0);
  objc_storeStrong((id *)&self->_supergroupConfigJson, 0);
  objc_storeStrong((id *)&self->_sportsEventNavigationForegroundColor, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryColor, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryColor, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsEventStartTime, 0);
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_topLevelSportTagIdentifier, 0);
  objc_storeStrong((id *)&self->_sportsTypePluralizedDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsTypeDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsLocation, 0);
  objc_storeStrong((id *)&self->_sportsNickname, 0);
  objc_storeStrong((id *)&self->_sportsFullName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryShortName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryName, 0);
  objc_storeStrong((id *)&self->_sportsNameAbbreviation, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryName, 0);
  objc_storeStrong((id *)&self->_UMCCanonicalID, 0);
  objc_storeStrong((id *)&self->_sportsData, 0);
  objc_storeStrong((id *)&self->_rosterResourceIDs, 0);
  objc_storeStrong((id *)&self->_eventArticleListID, 0);
  objc_storeStrong((id *)&self->_eventLeagueTag, 0);
  objc_storeStrong((id *)&self->_eventCompetitorTags, 0);
  objc_storeStrong((id *)&self->_superfeedConfigResourceID, 0);
  objc_storeStrong((id *)&self->_highlightsArticleListID, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_adTargetingKeywords, 0);
  objc_storeStrong((id *)&self->_titleDisplaySuffix, 0);
  objc_storeStrong((id *)&self->_titleDisplayPrefix, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_versionKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
