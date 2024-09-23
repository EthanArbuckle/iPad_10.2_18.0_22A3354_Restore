@implementation MapsSuggestionsServerSideFilter

- (MapsSuggestionsServerSideFilter)init
{
  MapsSuggestionsServerSideFilter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsServerSideFilter;
  v2 = -[MapsSuggestionsServerSideFilter init](&v4, sel_init);
  if (v2)
  {
    v2->_enabledEntryTypeUnknown = GEOConfigGetBOOL();
    v2->_enabledEntryTypeHome = GEOConfigGetBOOL();
    v2->_enabledEntryTypeWork = GEOConfigGetBOOL();
    v2->_enabledEntryTypeCalendarEvent = GEOConfigGetBOOL();
    v2->_enabledEntryTypeFrequentLocation = GEOConfigGetBOOL();
    v2->_enabledEntryTypeRecentHistory = GEOConfigGetBOOL();
    v2->_enabledEntryTypeOldPreYukonFavorite = GEOConfigGetBOOL();
    v2->_enabledEntryTypeParkedCar = GEOConfigGetBOOL();
    v2->_enabledEntryTypeRestaurantReservation = GEOConfigGetBOOL();
    v2->_enabledEntryTypeRidesharing = GEOConfigGetBOOL();
    v2->_enabledEntryTypeCarPlayLowEnergy = GEOConfigGetBOOL();
    v2->_enabledEntryTypeResumeRoute = GEOConfigGetBOOL();
    v2->_enabledEntryTypeAppConnection = GEOConfigGetBOOL();
    v2->_enabledEntryTypeHotel = GEOConfigGetBOOL();
    v2->_enabledEntryTypeCarRental = GEOConfigGetBOOL();
    v2->_enabledEntryTypeTravelFlight = GEOConfigGetBOOL();
    v2->_enabledEntryTypeTicketedEvent = GEOConfigGetBOOL();
    v2->_enabledEntryTypePortrait = GEOConfigGetBOOL();
    v2->_enabledEntryTypeUserPlace = GEOConfigGetBOOL();
    v2->_enabledEntryTypeSchool = GEOConfigGetBOOL();
    v2->_enabledEntryTypeVehicleSetup = GEOConfigGetBOOL();
    v2->_enabledEntryTypeFavoriteButton = GEOConfigGetBOOL();
    v2->_enabledEntryTypeOrderStatus = GEOConfigGetBOOL();
    v2->_enabledEntryTypeContactActivity = GEOConfigGetBOOL();
  }
  return v2;
}

- (BOOL)shouldKeepEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  char BOOL;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch(objc_msgSend(v4, "type"))
    {
      case 0:
        v6 = 8;
        goto LABEL_38;
      case 1:
        v6 = 9;
        goto LABEL_38;
      case 2:
        v6 = 10;
        goto LABEL_38;
      case 3:
        v6 = 11;
        goto LABEL_38;
      case 4:
        v6 = 12;
        goto LABEL_38;
      case 5:
        v6 = 13;
        goto LABEL_38;
      case 6:
        v6 = 14;
        goto LABEL_38;
      case 7:
        v6 = 15;
        goto LABEL_38;
      case 8:
        v6 = 16;
        goto LABEL_38;
      case 9:
        v6 = 17;
        goto LABEL_38;
      case 10:
        v6 = 18;
        goto LABEL_38;
      case 11:
        v6 = 19;
        goto LABEL_38;
      case 12:
        v6 = 20;
        goto LABEL_38;
      case 13:
        v6 = 21;
        goto LABEL_38;
      case 14:
        v6 = 22;
        goto LABEL_38;
      case 15:
        v6 = 23;
        goto LABEL_38;
      case 16:
        v6 = 24;
        goto LABEL_38;
      case 17:
        v6 = 25;
        goto LABEL_38;
      case 18:
        v6 = 26;
        goto LABEL_38;
      case 19:
        v6 = 27;
        goto LABEL_38;
      case 20:
        v6 = 28;
        goto LABEL_38;
      case 21:
        if ((!MapsFeature_IsEnabled_LagunaBeach()
           || (GEODoesUserHaveValidAccountForMakingContributions() & 1) == 0)
          && !GEOConfigGetBOOL())
        {
          goto LABEL_7;
        }
        BOOL = GEOConfigGetBOOL();
        break;
      case 22:
        v6 = 29;
        goto LABEL_38;
      case 23:
        v6 = 30;
        goto LABEL_38;
      case 24:
        v6 = 31;
LABEL_38:
        BOOL = *((_BYTE *)&self->super.super.isa + v6) != 0;
        break;
      default:
        GEOFindOrCreateLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v11 = 136446978;
          v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsServerSideFilter.m";
          v13 = 1024;
          v14 = 213;
          v15 = 2082;
          v16 = "-[MapsSuggestionsServerSideFilter shouldKeepEntry:]";
          v17 = 2082;
          v18 = "YES";
          _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v11, 0x26u);
        }

        BOOL = 1;
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsServerSideFilter.m";
      v13 = 1024;
      v14 = 157;
      v15 = 2082;
      v16 = "-[MapsSuggestionsServerSideFilter shouldKeepEntry:]";
      v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v11, 0x26u);
    }

LABEL_7:
    BOOL = 0;
  }

  return BOOL;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
