@implementation GEOClientACSuggestionEntry

- (GEOClientACSuggestionEntry)init
{
  GEOClientACSuggestionEntry *v2;
  GEOClientACSuggestionEntry *v3;
  GEOClientACSuggestionEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOClientACSuggestionEntry;
  v2 = -[GEOClientACSuggestionEntry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOClientACSuggestionEntry)initWithData:(id)a3
{
  GEOClientACSuggestionEntry *v3;
  GEOClientACSuggestionEntry *v4;
  GEOClientACSuggestionEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOClientACSuggestionEntry;
  v3 = -[GEOClientACSuggestionEntry initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)suggestionType
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
    return self->_suggestionType;
  else
    return 0;
}

- (void)setSuggestionType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000004000000uLL;
  self->_suggestionType = a3;
}

- (void)setHasSuggestionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000004000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSuggestionType
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (id)suggestionTypeAsString:(int)a3
{
  if (a3 < 0xF)
    return *((id *)&off_1E1C14968 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuggestionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_COREROUTINE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MESSAGES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_QUERY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_PLACE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CONTACTS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_FAVORITE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_SERVER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_USER_LOCATION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PARKED_CAR")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MARKED_LOCATION")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PROACTIVE")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shownToUser
{
  return self->_shownToUser;
}

- (void)setShownToUser:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2200000000000uLL;
  self->_shownToUser = a3;
}

- (void)setHasShownToUser:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2200000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasShownToUser
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 5) & 1;
}

- (double)fractionOfMatch
{
  return self->_fractionOfMatch;
}

- (void)setFractionOfMatch:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000004uLL;
  self->_fractionOfMatch = a3;
}

- (void)setHasFractionOfMatch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000004;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasFractionOfMatch
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)distanceToSuggestion
{
  return self->_distanceToSuggestion;
}

- (void)setDistanceToSuggestion:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000400uLL;
  self->_distanceToSuggestion = a3;
}

- (void)setHasDistanceToSuggestion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000400;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasDistanceToSuggestion
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (double)contactRelevanceScore
{
  return self->_contactRelevanceScore;
}

- (void)setContactRelevanceScore:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000001uLL;
  self->_contactRelevanceScore = a3;
}

- (void)setHasContactRelevanceScore:(BOOL)a3
{
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x2000000000000);
}

- (BOOL)hasContactRelevanceScore
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)matchedUsingName
{
  return self->_matchedUsingName;
}

- (void)setMatchedUsingName:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2020000000000uLL;
  self->_matchedUsingName = a3;
}

- (void)setHasMatchedUsingName:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2020000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingName
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 1) & 1;
}

- (BOOL)matchedUsingOrganization
{
  return self->_matchedUsingOrganization;
}

- (void)setMatchedUsingOrganization:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2040000000000uLL;
  self->_matchedUsingOrganization = a3;
}

- (void)setHasMatchedUsingOrganization:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2040000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingOrganization
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 2) & 1;
}

- (BOOL)matchedUsingAddress
{
  return self->_matchedUsingAddress;
}

- (void)setMatchedUsingAddress:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2004000000000uLL;
  self->_matchedUsingAddress = a3;
}

- (void)setHasMatchedUsingAddress:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2004000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingAddress
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 6) & 1;
}

- (BOOL)matchedUsingLabel
{
  return self->_matchedUsingLabel;
}

- (void)setMatchedUsingLabel:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2010000000000uLL;
  self->_matchedUsingLabel = a3;
}

- (void)setHasMatchedUsingLabel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2010000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingLabel
{
  return *((_BYTE *)&self->_flags + 5) & 1;
}

- (BOOL)matchedUsingEventName
{
  return self->_matchedUsingEventName;
}

- (void)setMatchedUsingEventName:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2008000000000uLL;
  self->_matchedUsingEventName = a3;
}

- (void)setHasMatchedUsingEventName:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2008000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingEventName
{
  return *((unsigned __int8 *)&self->_flags + 4) >> 7;
}

- (int)peopleSuggesterRank
{
  return self->_peopleSuggesterRank;
}

- (void)setPeopleSuggesterRank:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000800uLL;
  self->_peopleSuggesterRank = a3;
}

- (void)setHasPeopleSuggesterRank:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000800;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasPeopleSuggesterRank
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (int)age
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0)
    return self->_age;
  else
    return -1;
}

- (void)setAge:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000100uLL;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000100;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasAge
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (int)serverEntryType
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x800000) != 0)
    return self->_serverEntryType;
  else
    return 0;
}

- (void)setServerEntryType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000800000uLL;
  self->_serverEntryType = a3;
}

- (void)setHasServerEntryType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000800000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasServerEntryType
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (id)serverEntryTypeAsString:(int)a3
{
  if (a3 < 4)
    return *((id *)&off_1E1C149E0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServerEntryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2001000000000uLL;
  self->_isFavorite = a3;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2001000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasIsFavorite
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 4) & 1;
}

- (int)poiOpenState
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0)
    return self->_poiOpenState;
  else
    return 0;
}

- (void)setPoiOpenState:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000001000uLL;
  self->_poiOpenState = a3;
}

- (void)setHasPoiOpenState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000001000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasPoiOpenState
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)poiOpenStateAsString:(int)a3
{
  if (a3 < 5)
    return *((id *)&off_1E1C14A00 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPoiOpenState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IS_CURRENTLY_CLOSED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IS_PERMANENTLY_CLOSED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IS_CURRENTLY_OPEN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IS_OPENING_SOON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_IS_CLOSING_SOON")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)mapsSuggestionsContactRevelanceScore
{
  return self->_mapsSuggestionsContactRevelanceScore;
}

- (void)setMapsSuggestionsContactRevelanceScore:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000008uLL;
  self->_mapsSuggestionsContactRevelanceScore = a3;
}

- (void)setHasMapsSuggestionsContactRevelanceScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000008;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasMapsSuggestionsContactRevelanceScore
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)mapsSuggestionsPoiRevelanceScore
{
  return self->_mapsSuggestionsPoiRevelanceScore;
}

- (void)setMapsSuggestionsPoiRevelanceScore:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000020uLL;
  self->_mapsSuggestionsPoiRevelanceScore = a3;
}

- (void)setHasMapsSuggestionsPoiRevelanceScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000020;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasMapsSuggestionsPoiRevelanceScore
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (double)mapsSuggestionsIsTouristScore
{
  return self->_mapsSuggestionsIsTouristScore;
}

- (void)setMapsSuggestionsIsTouristScore:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000010uLL;
  self->_mapsSuggestionsIsTouristScore = a3;
}

- (void)setHasMapsSuggestionsIsTouristScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000010;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasMapsSuggestionsIsTouristScore
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)discreteFeatureValuesAvailable
{
  return self->_discreteFeatureValuesAvailable;
}

- (void)setDiscreteFeatureValuesAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000010000000uLL;
  self->_discreteFeatureValuesAvailable = a3;
}

- (void)setHasDiscreteFeatureValuesAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000010000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasDiscreteFeatureValuesAvailable
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (void)_readSuggestionSectionType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 222) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientACSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionSectionType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasSuggestionSectionType
{
  -[GEOClientACSuggestionEntry _readSuggestionSectionType]((uint64_t)self);
  return self->_suggestionSectionType != 0;
}

- (NSString)suggestionSectionType
{
  -[GEOClientACSuggestionEntry _readSuggestionSectionType]((uint64_t)self);
  return self->_suggestionSectionType;
}

- (void)setSuggestionSectionType:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x3000000000000uLL;
  objc_storeStrong((id *)&self->_suggestionSectionType, a3);
}

- (BOOL)isProminentResult
{
  return self->_isProminentResult;
}

- (void)setIsProminentResult:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2002000000000uLL;
  self->_isProminentResult = a3;
}

- (void)setHasIsProminentResult:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2002000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasIsProminentResult
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 5) & 1;
}

- (void)_readSubactionMetaData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 221) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientACSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubactionMetaData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasSubactionMetaData
{
  -[GEOClientACSuggestionEntry _readSubactionMetaData]((uint64_t)self);
  return self->_subactionMetaData != 0;
}

- (GEOSubactionMetaData)subactionMetaData
{
  -[GEOClientACSuggestionEntry _readSubactionMetaData]((uint64_t)self);
  return self->_subactionMetaData;
}

- (void)setSubactionMetaData:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x2800000000000uLL;
  objc_storeStrong((id *)&self->_subactionMetaData, a3);
}

- (int)autocompleteResultCellType
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0)
    return self->_autocompleteResultCellType;
  else
    return 0;
}

- (void)setAutocompleteResultCellType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000200uLL;
  self->_autocompleteResultCellType = a3;
}

- (void)setHasAutocompleteResultCellType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000200;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasAutocompleteResultCellType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)autocompleteResultCellTypeAsString:(int)a3
{
  if (a3 < 5)
    return *((id *)&off_1E1C14A28 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAutocompleteResultCellType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)serverSectionIndex
{
  return self->_serverSectionIndex;
}

- (void)setServerSectionIndex:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000002000000uLL;
  self->_serverSectionIndex = a3;
}

- (void)setHasServerSectionIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000002000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasServerSectionIndex
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (int)serverItemIndexInSection
{
  return self->_serverItemIndexInSection;
}

- (void)setServerItemIndexInSection:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000001000000uLL;
  self->_serverItemIndexInSection = a3;
}

- (void)setHasServerItemIndexInSection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000001000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasServerItemIndexInSection
{
  return *((_BYTE *)&self->_flags + 3) & 1;
}

- (int)tapBehavior
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
    return self->_tapBehavior;
  else
    return 0;
}

- (void)setTapBehavior:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000008000000uLL;
  self->_tapBehavior = a3;
}

- (void)setHasTapBehavior:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000008000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTapBehavior
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (id)tapBehaviorAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SHOW_RESULTS_ON_MAP");
  if (a3 == 1)
  {
    v3 = CFSTR("SHOW_RESULTS_IN_LIST_VIEW");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsTapBehavior:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_RESULTS_ON_MAP")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_RESULTS_IN_LIST_VIEW"));

  return v4;
}

- (double)distanceToSuggestionFromViewportCenter
{
  return self->_distanceToSuggestionFromViewportCenter;
}

- (void)setDistanceToSuggestionFromViewportCenter:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000002uLL;
  self->_distanceToSuggestionFromViewportCenter = a3;
}

- (void)setHasDistanceToSuggestionFromViewportCenter:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000002;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDistanceToSuggestionFromViewportCenter
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)timeSinceLastInteractedSeconds
{
  return self->_timeSinceLastInteractedSeconds;
}

- (void)setTimeSinceLastInteractedSeconds:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000040uLL;
  self->_timeSinceLastInteractedSeconds = a3;
}

- (void)setHasTimeSinceLastInteractedSeconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000040;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTimeSinceLastInteractedSeconds
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)isContainedInViewport
{
  return self->_isContainedInViewport;
}

- (void)setIsContainedInViewport:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000800000000uLL;
  self->_isContainedInViewport = a3;
}

- (void)setHasIsContainedInViewport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000800000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasIsContainedInViewport
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (double)timeSinceMapViewportChangedSeconds
{
  return self->_timeSinceMapViewportChangedSeconds;
}

- (void)setTimeSinceMapViewportChangedSeconds:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000000080uLL;
  self->_timeSinceMapViewportChangedSeconds = a3;
}

- (void)setHasTimeSinceMapViewportChangedSeconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000000080;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTimeSinceMapViewportChangedSeconds
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readHyperlinkMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 221) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOClientACSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHyperlinkMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasHyperlinkMetadata
{
  -[GEOClientACSuggestionEntry _readHyperlinkMetadata]((uint64_t)self);
  return self->_hyperlinkMetadata != 0;
}

- (GEOHyperlinkMetaData)hyperlinkMetadata
{
  -[GEOClientACSuggestionEntry _readHyperlinkMetadata]((uint64_t)self);
  return self->_hyperlinkMetadata;
}

- (void)setHyperlinkMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x2400000000000uLL;
  objc_storeStrong((id *)&self->_hyperlinkMetadata, a3);
}

- (BOOL)isContactWithHomeLocation
{
  return self->_isContactWithHomeLocation;
}

- (void)setIsContactWithHomeLocation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000020000000uLL;
  self->_isContactWithHomeLocation = a3;
}

- (void)setHasIsContactWithHomeLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000020000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithHomeLocation
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (BOOL)isContactWithWorkLocation
{
  return self->_isContactWithWorkLocation;
}

- (void)setIsContactWithWorkLocation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000400000000uLL;
  self->_isContactWithWorkLocation = a3;
}

- (void)setHasIsContactWithWorkLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000400000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithWorkLocation
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)isContactWithSchoolLocation
{
  return self->_isContactWithSchoolLocation;
}

- (void)setIsContactWithSchoolLocation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000200000000uLL;
  self->_isContactWithSchoolLocation = a3;
}

- (void)setHasIsContactWithSchoolLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000200000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithSchoolLocation
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 1) & 1;
}

- (BOOL)isContactWithOtherLocation
{
  return self->_isContactWithOtherLocation;
}

- (void)setIsContactWithOtherLocation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000100000000uLL;
  self->_isContactWithOtherLocation = a3;
}

- (void)setHasIsContactWithOtherLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000100000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithOtherLocation
{
  return *((_BYTE *)&self->_flags + 4) & 1;
}

- (BOOL)isContactWithLiveLocation
{
  return self->_isContactWithLiveLocation;
}

- (void)setIsContactWithLiveLocation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000040000000uLL;
  self->_isContactWithLiveLocation = a3;
}

- (void)setHasIsContactWithLiveLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000040000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithLiveLocation
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (BOOL)isContactWithNoLocation
{
  return self->_isContactWithNoLocation;
}

- (void)setIsContactWithNoLocation:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2000080000000uLL;
  self->_isContactWithNoLocation = a3;
}

- (void)setHasIsContactWithNoLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000080000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithNoLocation
{
  return *((unsigned __int8 *)&self->_flags + 3) >> 7;
}

- (float)prefixLastTokenMatchCover
{
  return self->_prefixLastTokenMatchCover;
}

- (void)setPrefixLastTokenMatchCover:(float)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000002000uLL;
  self->_prefixLastTokenMatchCover = a3;
}

- (void)setHasPrefixLastTokenMatchCover:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000002000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPrefixLastTokenMatchCover
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (float)prefixMatchCover
{
  return self->_prefixMatchCover;
}

- (void)setPrefixMatchCover:(float)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000004000uLL;
  self->_prefixMatchCover = a3;
}

- (void)setHasPrefixMatchCover:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000004000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPrefixMatchCover
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)prefixMatchPosition
{
  return self->_prefixMatchPosition;
}

- (void)setPrefixMatchPosition:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000008000uLL;
  self->_prefixMatchPosition = a3;
}

- (void)setHasPrefixMatchPosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000008000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasPrefixMatchPosition
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (int)prefixMatchWordBoundary
{
  return self->_prefixMatchWordBoundary;
}

- (void)setPrefixMatchWordBoundary:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000010000uLL;
  self->_prefixMatchWordBoundary = a3;
}

- (void)setHasPrefixMatchWordBoundary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000010000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasPrefixMatchWordBoundary
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (int)prefixTokenMatchLengthFirstQueryToken
{
  return self->_prefixTokenMatchLengthFirstQueryToken;
}

- (void)setPrefixTokenMatchLengthFirstQueryToken:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000020000uLL;
  self->_prefixTokenMatchLengthFirstQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLengthFirstQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000020000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFDFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLengthFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (int)prefixTokenMatchPositionFirstQueryToken
{
  return self->_prefixTokenMatchPositionFirstQueryToken;
}

- (void)setPrefixTokenMatchPositionFirstQueryToken:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000200000uLL;
  self->_prefixTokenMatchPositionFirstQueryToken = a3;
}

- (void)setHasPrefixTokenMatchPositionFirstQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000200000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchPositionFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)prefixTokenIsNumberFirstQueryToken
{
  return self->_prefixTokenIsNumberFirstQueryToken;
}

- (void)setPrefixTokenIsNumberFirstQueryToken:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2080000000000uLL;
  self->_prefixTokenIsNumberFirstQueryToken = a3;
}

- (void)setHasPrefixTokenIsNumberFirstQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2080000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenIsNumberFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 3) & 1;
}

- (int)prefixTokenMatchLocationFirstQueryToken
{
  return self->_prefixTokenMatchLocationFirstQueryToken;
}

- (void)setPrefixTokenMatchLocationFirstQueryToken:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000080000uLL;
  self->_prefixTokenMatchLocationFirstQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLocationFirstQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000080000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLocationFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (int)prefixTokenMatchLengthSecondQueryToken
{
  return self->_prefixTokenMatchLengthSecondQueryToken;
}

- (void)setPrefixTokenMatchLengthSecondQueryToken:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000040000uLL;
  self->_prefixTokenMatchLengthSecondQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLengthSecondQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000040000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLengthSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (int)prefixTokenMatchPositionSecondQueryToken
{
  return self->_prefixTokenMatchPositionSecondQueryToken;
}

- (void)setPrefixTokenMatchPositionSecondQueryToken:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000400000uLL;
  self->_prefixTokenMatchPositionSecondQueryToken = a3;
}

- (void)setHasPrefixTokenMatchPositionSecondQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000400000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchPositionSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)prefixTokenIsNumberSecondQueryToken
{
  return self->_prefixTokenIsNumberSecondQueryToken;
}

- (void)setPrefixTokenIsNumberSecondQueryToken:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x2100000000000uLL;
  self->_prefixTokenIsNumberSecondQueryToken = a3;
}

- (void)setHasPrefixTokenIsNumberSecondQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2100000000000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenIsNumberSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 4) & 1;
}

- (int)prefixTokenMatchLocationSecondQueryToken
{
  return self->_prefixTokenMatchLocationSecondQueryToken;
}

- (void)setPrefixTokenMatchLocationSecondQueryToken:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x2000000100000uLL;
  self->_prefixTokenMatchLocationSecondQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLocationSecondQueryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (a3)
    v3 = 0x2000000100000;
  self->_flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLocationSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOClientACSuggestionEntry;
  -[GEOClientACSuggestionEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientACSuggestionEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientACSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  id v47;
  double v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  id v52;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  const __CFString *v97;
  int v98;
  __CFString *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  const __CFString *v106;
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  const __CFString *v113;

  if (!a1)
  {
    v52 = 0;
    return v52;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x4000000) != 0)
  {
    v6 = *(int *)(a1 + 188);
    if (v6 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 188));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)*((_QWORD *)&off_1E1C14968 + v6);
    }
    if (a2)
      v8 = CFSTR("suggestionType");
    else
      v8 = CFSTR("suggestion_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_QWORD *)(a1 + 216);
  }
  if ((v5 & 0x200000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 213));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("shownToUser");
    else
      v20 = CFSTR("shown_to_user");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v5 = *(_QWORD *)(a1 + 216);
    if ((v5 & 4) == 0)
    {
LABEL_12:
      if ((v5 & 0x400) == 0)
        goto LABEL_13;
      goto LABEL_53;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("fractionOfMatch");
  else
    v22 = CFSTR("fraction_of_match");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x400) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0)
      goto LABEL_14;
    goto LABEL_57;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 124));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("distanceToSuggestion");
  else
    v24 = CFSTR("distance_to_suggestion");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 1) == 0)
  {
LABEL_14:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_15;
    goto LABEL_61;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("contactRelevanceScore");
  else
    v26 = CFSTR("contact_relevance_score");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_16;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 209));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("matchedUsingName"));

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_17;
    goto LABEL_63;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 210));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("matchedUsingOrganization"));

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_18;
    goto LABEL_64;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 206));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("matchedUsingAddress"));

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_19;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 208));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("matchedUsingLabel"));

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 207));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("matchedUsingEventName"));

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x800) == 0)
  {
LABEL_20:
    if ((v5 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_70;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 128));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v33 = CFSTR("peopleSuggesterRank");
  else
    v33 = CFSTR("people_suggester_rank");
  objc_msgSend(v4, "setObject:forKey:", v32, v33);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x100) == 0)
  {
LABEL_21:
    if ((v5 & 0x800000) == 0)
      goto LABEL_22;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 116));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("age"));

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x800000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_23;
    goto LABEL_192;
  }
LABEL_71:
  v35 = *(int *)(a1 + 176);
  if (v35 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 176));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = (void *)*((_QWORD *)&off_1E1C149E0 + v35);
  }
  if (a2)
    v88 = CFSTR("serverEntryType");
  else
    v88 = CFSTR("server_entry_type");
  objc_msgSend(v4, "setObject:forKey:", v36, v88);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_196;
  }
LABEL_192:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 204));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v90 = CFSTR("isFavorite");
  else
    v90 = CFSTR("is_favorite");
  objc_msgSend(v4, "setObject:forKey:", v89, v90);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x1000) == 0)
  {
LABEL_24:
    if ((v5 & 8) == 0)
      goto LABEL_25;
    goto LABEL_219;
  }
LABEL_196:
  v91 = *(int *)(a1 + 132);
  if (v91 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v92 = (void *)*((_QWORD *)&off_1E1C14A00 + v91);
  }
  if (a2)
    v100 = CFSTR("poiOpenState");
  else
    v100 = CFSTR("poi_open_state");
  objc_msgSend(v4, "setObject:forKey:", v92, v100);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 8) == 0)
  {
LABEL_25:
    if ((v5 & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_223;
  }
LABEL_219:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v102 = CFSTR("mapsSuggestionsContactRevelanceScore");
  else
    v102 = CFSTR("maps_suggestions_contact_revelance_score");
  objc_msgSend(v4, "setObject:forKey:", v101, v102);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x20) == 0)
  {
LABEL_26:
    if ((v5 & 0x10) == 0)
      goto LABEL_27;
    goto LABEL_227;
  }
LABEL_223:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v104 = CFSTR("mapsSuggestionsPoiRevelanceScore");
  else
    v104 = CFSTR("maps_suggestions_poi_revelance_score");
  objc_msgSend(v4, "setObject:forKey:", v103, v104);

  v5 = *(_QWORD *)(a1 + 216);
  if ((v5 & 0x10) == 0)
  {
LABEL_27:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_32;
    goto LABEL_28;
  }
LABEL_227:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v106 = CFSTR("mapsSuggestionsIsTouristScore");
  else
    v106 = CFSTR("maps_suggestions_is_tourist_score");
  objc_msgSend(v4, "setObject:forKey:", v105, v106);

  if ((*(_QWORD *)(a1 + 216) & 0x10000000) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 196));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("discreteFeatureValuesAvailable");
    else
      v10 = CFSTR("discrete_feature_values_available");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_32:
  objc_msgSend((id)a1, "suggestionSectionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("suggestionSectionType");
    else
      v12 = CFSTR("suggestion_section_type");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  if ((*(_BYTE *)(a1 + 220) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 205));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("isProminentResult");
    else
      v14 = CFSTR("is_prominent_result");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "subactionMetaData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("subactionMetaData");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("subaction_meta_data");
    }
    v37 = v17;

    objc_msgSend(v4, "setObject:forKey:", v37, v18);
  }

  v38 = *(_QWORD *)(a1 + 216);
  if ((v38 & 0x200) != 0)
  {
    v45 = *(int *)(a1 + 120);
    if (v45 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 120));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = (void *)*((_QWORD *)&off_1E1C14A28 + v45);
    }
    if (a2)
      v93 = CFSTR("autocompleteResultCellType");
    else
      v93 = CFSTR("autocomplete_result_cell_type");
    objc_msgSend(v4, "setObject:forKey:", v46, v93);

    v38 = *(_QWORD *)(a1 + 216);
    if ((v38 & 0x2000000) == 0)
    {
LABEL_77:
      if ((v38 & 0x1000000) == 0)
        goto LABEL_78;
      goto LABEL_207;
    }
  }
  else if ((v38 & 0x2000000) == 0)
  {
    goto LABEL_77;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 184));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v95 = CFSTR("serverSectionIndex");
  else
    v95 = CFSTR("server_section_index");
  objc_msgSend(v4, "setObject:forKey:", v94, v95);

  v38 = *(_QWORD *)(a1 + 216);
  if ((v38 & 0x1000000) == 0)
  {
LABEL_78:
    if ((v38 & 0x8000000) == 0)
      goto LABEL_79;
    goto LABEL_211;
  }
LABEL_207:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 180));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v97 = CFSTR("serverItemIndexInSection");
  else
    v97 = CFSTR("server_item_index_in_section");
  objc_msgSend(v4, "setObject:forKey:", v96, v97);

  v38 = *(_QWORD *)(a1 + 216);
  if ((v38 & 0x8000000) == 0)
  {
LABEL_79:
    if ((v38 & 2) == 0)
      goto LABEL_80;
    goto LABEL_238;
  }
LABEL_211:
  v98 = *(_DWORD *)(a1 + 192);
  if (v98)
  {
    if (v98 == 1)
    {
      v99 = CFSTR("SHOW_RESULTS_IN_LIST_VIEW");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 192));
      v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v99 = CFSTR("SHOW_RESULTS_ON_MAP");
  }
  if (a2)
    v107 = CFSTR("tapBehavior");
  else
    v107 = CFSTR("tap_behavior");
  objc_msgSend(v4, "setObject:forKey:", v99, v107);

  v38 = *(_QWORD *)(a1 + 216);
  if ((v38 & 2) == 0)
  {
LABEL_80:
    if ((v38 & 0x40) == 0)
      goto LABEL_81;
    goto LABEL_242;
  }
LABEL_238:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v109 = CFSTR("distanceToSuggestionFromViewportCenter");
  else
    v109 = CFSTR("distance_to_suggestion_from_viewport_center");
  objc_msgSend(v4, "setObject:forKey:", v108, v109);

  v38 = *(_QWORD *)(a1 + 216);
  if ((v38 & 0x40) == 0)
  {
LABEL_81:
    if ((v38 & 0x800000000) == 0)
      goto LABEL_82;
    goto LABEL_246;
  }
LABEL_242:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v111 = CFSTR("timeSinceLastInteractedSeconds");
  else
    v111 = CFSTR("time_since_last_interacted_seconds");
  objc_msgSend(v4, "setObject:forKey:", v110, v111);

  v38 = *(_QWORD *)(a1 + 216);
  if ((v38 & 0x800000000) == 0)
  {
LABEL_82:
    if ((v38 & 0x80) == 0)
      goto LABEL_87;
    goto LABEL_83;
  }
LABEL_246:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 203));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v113 = CFSTR("isContainedInViewport");
  else
    v113 = CFSTR("is_contained_in_viewport");
  objc_msgSend(v4, "setObject:forKey:", v112, v113);

  if ((*(_QWORD *)(a1 + 216) & 0x80) != 0)
  {
LABEL_83:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("timeSinceMapViewportChangedSeconds");
    else
      v40 = CFSTR("time_since_map_viewport_changed_seconds");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
LABEL_87:
  objc_msgSend((id)a1, "hyperlinkMetadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("hyperlinkMetadata");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("hyperlink_metadata");
    }
    v47 = v43;

    objc_msgSend(v4, "setObject:forKey:", v47, v44);
  }

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 197));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v55 = CFSTR("isContactWithHomeLocation");
    else
      v55 = CFSTR("is_contact_with_home_location");
    objc_msgSend(v4, "setObject:forKey:", v54, v55);

    v49 = *(_QWORD *)(a1 + 216);
    if ((v49 & 0x400000000) == 0)
    {
LABEL_96:
      if ((v49 & 0x200000000) == 0)
        goto LABEL_97;
      goto LABEL_126;
    }
  }
  else if ((v49 & 0x400000000) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 202));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v57 = CFSTR("isContactWithWorkLocation");
  else
    v57 = CFSTR("is_contact_with_work_location");
  objc_msgSend(v4, "setObject:forKey:", v56, v57);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x200000000) == 0)
  {
LABEL_97:
    if ((v49 & 0x100000000) == 0)
      goto LABEL_98;
    goto LABEL_130;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 201));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v59 = CFSTR("isContactWithSchoolLocation");
  else
    v59 = CFSTR("is_contact_with_school_location");
  objc_msgSend(v4, "setObject:forKey:", v58, v59);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x100000000) == 0)
  {
LABEL_98:
    if ((v49 & 0x40000000) == 0)
      goto LABEL_99;
    goto LABEL_134;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 200));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v61 = CFSTR("isContactWithOtherLocation");
  else
    v61 = CFSTR("is_contact_with_other_location");
  objc_msgSend(v4, "setObject:forKey:", v60, v61);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x40000000) == 0)
  {
LABEL_99:
    if ((v49 & 0x80000000) == 0)
      goto LABEL_100;
    goto LABEL_138;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 198));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v63 = CFSTR("isContactWithLiveLocation");
  else
    v63 = CFSTR("is_contact_with_live_location");
  objc_msgSend(v4, "setObject:forKey:", v62, v63);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x80000000) == 0)
  {
LABEL_100:
    if ((v49 & 0x2000) == 0)
      goto LABEL_101;
    goto LABEL_142;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 199));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v65 = CFSTR("isContactWithNoLocation");
  else
    v65 = CFSTR("is_contact_with_no_location");
  objc_msgSend(v4, "setObject:forKey:", v64, v65);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x2000) == 0)
  {
LABEL_101:
    if ((v49 & 0x4000) == 0)
      goto LABEL_102;
    goto LABEL_146;
  }
LABEL_142:
  LODWORD(v48) = *(_DWORD *)(a1 + 136);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v67 = CFSTR("prefixLastTokenMatchCover");
  else
    v67 = CFSTR("prefix_last_token_match_cover");
  objc_msgSend(v4, "setObject:forKey:", v66, v67);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x4000) == 0)
  {
LABEL_102:
    if ((v49 & 0x8000) == 0)
      goto LABEL_103;
    goto LABEL_150;
  }
LABEL_146:
  LODWORD(v48) = *(_DWORD *)(a1 + 140);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v69 = CFSTR("prefixMatchCover");
  else
    v69 = CFSTR("prefix_match_cover");
  objc_msgSend(v4, "setObject:forKey:", v68, v69);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x8000) == 0)
  {
LABEL_103:
    if ((v49 & 0x10000) == 0)
      goto LABEL_104;
    goto LABEL_154;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 144));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v71 = CFSTR("prefixMatchPosition");
  else
    v71 = CFSTR("prefix_match_position");
  objc_msgSend(v4, "setObject:forKey:", v70, v71);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x10000) == 0)
  {
LABEL_104:
    if ((v49 & 0x20000) == 0)
      goto LABEL_105;
    goto LABEL_158;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 148));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v73 = CFSTR("prefixMatchWordBoundary");
  else
    v73 = CFSTR("prefix_match_word_boundary");
  objc_msgSend(v4, "setObject:forKey:", v72, v73);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x20000) == 0)
  {
LABEL_105:
    if ((v49 & 0x200000) == 0)
      goto LABEL_106;
    goto LABEL_162;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 152));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v75 = CFSTR("prefixTokenMatchLengthFirstQueryToken");
  else
    v75 = CFSTR("prefix_token_match_length_first_query_token");
  objc_msgSend(v4, "setObject:forKey:", v74, v75);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x200000) == 0)
  {
LABEL_106:
    if ((v49 & 0x80000000000) == 0)
      goto LABEL_107;
    goto LABEL_166;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 168));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v77 = CFSTR("prefixTokenMatchPositionFirstQueryToken");
  else
    v77 = CFSTR("prefix_token_match_position_first_query_token");
  objc_msgSend(v4, "setObject:forKey:", v76, v77);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x80000000000) == 0)
  {
LABEL_107:
    if ((v49 & 0x80000) == 0)
      goto LABEL_108;
    goto LABEL_170;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 211));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v79 = CFSTR("prefixTokenIsNumberFirstQueryToken");
  else
    v79 = CFSTR("prefix_token_is_number_first_query_token");
  objc_msgSend(v4, "setObject:forKey:", v78, v79);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x80000) == 0)
  {
LABEL_108:
    if ((v49 & 0x40000) == 0)
      goto LABEL_109;
    goto LABEL_174;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 160));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v81 = CFSTR("prefixTokenMatchLocationFirstQueryToken");
  else
    v81 = CFSTR("prefix_token_match_location_first_query_token");
  objc_msgSend(v4, "setObject:forKey:", v80, v81);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x40000) == 0)
  {
LABEL_109:
    if ((v49 & 0x400000) == 0)
      goto LABEL_110;
    goto LABEL_178;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 156));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v83 = CFSTR("prefixTokenMatchLengthSecondQueryToken");
  else
    v83 = CFSTR("prefix_token_match_length_second_query_token");
  objc_msgSend(v4, "setObject:forKey:", v82, v83);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x400000) == 0)
  {
LABEL_110:
    if ((v49 & 0x100000000000) == 0)
      goto LABEL_111;
LABEL_182:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 212));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v87 = CFSTR("prefixTokenIsNumberSecondQueryToken");
    else
      v87 = CFSTR("prefix_token_is_number_second_query_token");
    objc_msgSend(v4, "setObject:forKey:", v86, v87);

    if ((*(_QWORD *)(a1 + 216) & 0x100000) == 0)
      goto LABEL_116;
    goto LABEL_112;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 172));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v85 = CFSTR("prefixTokenMatchPositionSecondQueryToken");
  else
    v85 = CFSTR("prefix_token_match_position_second_query_token");
  objc_msgSend(v4, "setObject:forKey:", v84, v85);

  v49 = *(_QWORD *)(a1 + 216);
  if ((v49 & 0x100000000000) != 0)
    goto LABEL_182;
LABEL_111:
  if ((v49 & 0x100000) != 0)
  {
LABEL_112:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 164));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v51 = CFSTR("prefixTokenMatchLocationSecondQueryToken");
    else
      v51 = CFSTR("prefix_token_match_location_second_query_token");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

  }
LABEL_116:
  v52 = v4;

  return v52;
}

- (id)jsonRepresentation
{
  return -[GEOClientACSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOClientACSuggestionEntry)initWithDictionary:(id)a3
{
  return (GEOClientACSuggestionEntry *)-[GEOClientACSuggestionEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  GEOSubactionMetaData *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  id v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  id v64;
  uint64_t v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  GEOHyperlinkMetaData *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  const __CFString *v113;
  void *v114;

  v5 = a2;
  if (!a1)
    goto LABEL_317;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_317;
  if (a3)
    v6 = CFSTR("suggestionType");
  else
    v6 = CFSTR("suggestion_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_COREROUTINE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MESSAGES")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MAIL")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_QUERY")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_PLACE")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CONTACTS")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_FAVORITE")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_SERVER")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_USER_LOCATION")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PARKED_CAR")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MARKED_LOCATION")) & 1) != 0)
    {
      v9 = 13;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PROACTIVE")))
    {
      v9 = 14;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_42;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setSuggestionType:", v9);
LABEL_42:

  if (a3)
    v10 = CFSTR("shownToUser");
  else
    v10 = CFSTR("shown_to_user");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShownToUser:", objc_msgSend(v11, "BOOLValue"));

  if (a3)
    v12 = CFSTR("fractionOfMatch");
  else
    v12 = CFSTR("fraction_of_match");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(a1, "setFractionOfMatch:");
  }

  if (a3)
    v14 = CFSTR("distanceToSuggestion");
  else
    v14 = CFSTR("distance_to_suggestion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDistanceToSuggestion:", objc_msgSend(v15, "intValue"));

  if (a3)
    v16 = CFSTR("contactRelevanceScore");
  else
    v16 = CFSTR("contact_relevance_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(a1, "setContactRelevanceScore:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedUsingName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMatchedUsingName:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedUsingOrganization"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMatchedUsingOrganization:", objc_msgSend(v19, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedUsingAddress"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMatchedUsingAddress:", objc_msgSend(v20, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedUsingLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMatchedUsingLabel:", objc_msgSend(v21, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedUsingEventName"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMatchedUsingEventName:", objc_msgSend(v22, "BOOLValue"));

  if (a3)
    v23 = CFSTR("peopleSuggesterRank");
  else
    v23 = CFSTR("people_suggester_rank");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPeopleSuggesterRank:", objc_msgSend(v24, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("age"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAge:", objc_msgSend(v25, "intValue"));

  if (a3)
    v26 = CFSTR("serverEntryType");
  else
    v26 = CFSTR("server_entry_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
    {
      v29 = 0;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
    {
      v29 = 1;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v29 = 2;
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("CATEGORY")))
    {
      v29 = 3;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_96;
    v29 = objc_msgSend(v27, "intValue");
  }
  objc_msgSend(a1, "setServerEntryType:", v29);
LABEL_96:

  if (a3)
    v30 = CFSTR("isFavorite");
  else
    v30 = CFSTR("is_favorite");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFavorite:", objc_msgSend(v31, "BOOLValue"));

  if (a3)
    v32 = CFSTR("poiOpenState");
  else
    v32 = CFSTR("poi_open_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI_IS_CURRENTLY_CLOSED")) & 1) != 0)
    {
      v35 = 0;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI_IS_PERMANENTLY_CLOSED")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI_IS_CURRENTLY_OPEN")) & 1) != 0)
    {
      v35 = 2;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POI_IS_OPENING_SOON")) & 1) != 0)
    {
      v35 = 3;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("POI_IS_CLOSING_SOON")))
    {
      v35 = 4;
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_120;
    v35 = objc_msgSend(v33, "intValue");
  }
  objc_msgSend(a1, "setPoiOpenState:", v35);
LABEL_120:

  if (a3)
    v36 = CFSTR("mapsSuggestionsContactRevelanceScore");
  else
    v36 = CFSTR("maps_suggestions_contact_revelance_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v37, "doubleValue");
    objc_msgSend(a1, "setMapsSuggestionsContactRevelanceScore:");
  }

  if (a3)
    v38 = CFSTR("mapsSuggestionsPoiRevelanceScore");
  else
    v38 = CFSTR("maps_suggestions_poi_revelance_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v39, "doubleValue");
    objc_msgSend(a1, "setMapsSuggestionsPoiRevelanceScore:");
  }

  if (a3)
    v40 = CFSTR("mapsSuggestionsIsTouristScore");
  else
    v40 = CFSTR("maps_suggestions_is_tourist_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v41, "doubleValue");
    objc_msgSend(a1, "setMapsSuggestionsIsTouristScore:");
  }

  if (a3)
    v42 = CFSTR("discreteFeatureValuesAvailable");
  else
    v42 = CFSTR("discrete_feature_values_available");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDiscreteFeatureValuesAvailable:", objc_msgSend(v43, "BOOLValue"));

  if (a3)
    v44 = CFSTR("suggestionSectionType");
  else
    v44 = CFSTR("suggestion_section_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(a1, "setSuggestionSectionType:", v46);

  }
  if (a3)
    v47 = CFSTR("isProminentResult");
  else
    v47 = CFSTR("is_prominent_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsProminentResult:", objc_msgSend(v48, "BOOLValue"));

  if (a3)
    v49 = CFSTR("subactionMetaData");
  else
    v49 = CFSTR("subaction_meta_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = [GEOSubactionMetaData alloc];
    if ((a3 & 1) != 0)
      v52 = -[GEOSubactionMetaData initWithJSON:](v51, "initWithJSON:", v50);
    else
      v52 = -[GEOSubactionMetaData initWithDictionary:](v51, "initWithDictionary:", v50);
    v53 = (void *)v52;
    objc_msgSend(a1, "setSubactionMetaData:", v52);

  }
  if (a3)
    v54 = CFSTR("autocompleteResultCellType");
  else
    v54 = CFSTR("autocomplete_result_cell_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v55;
    if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT")) & 1) != 0)
    {
      v57 = 0;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY")) & 1) != 0)
    {
      v57 = 1;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT")) & 1) != 0)
    {
      v57 = 2;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE")) & 1) != 0)
    {
      v57 = 3;
    }
    else if (objc_msgSend(v56, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE")))
    {
      v57 = 4;
    }
    else
    {
      v57 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_177;
    v57 = objc_msgSend(v55, "intValue");
  }
  objc_msgSend(a1, "setAutocompleteResultCellType:", v57);
LABEL_177:

  if (a3)
    v58 = CFSTR("serverSectionIndex");
  else
    v58 = CFSTR("server_section_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setServerSectionIndex:", objc_msgSend(v59, "intValue"));

  if (a3)
    v60 = CFSTR("serverItemIndexInSection");
  else
    v60 = CFSTR("server_item_index_in_section");
  objc_msgSend(v5, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setServerItemIndexInSection:", objc_msgSend(v61, "intValue"));

  if (a3)
    v62 = CFSTR("tapBehavior");
  else
    v62 = CFSTR("tap_behavior");
  objc_msgSend(v5, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = v63;
    if ((objc_msgSend(v64, "isEqualToString:", CFSTR("SHOW_RESULTS_ON_MAP")) & 1) != 0)
      v65 = 0;
    else
      v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("SHOW_RESULTS_IN_LIST_VIEW"));

    goto LABEL_197;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = objc_msgSend(v63, "intValue");
LABEL_197:
    objc_msgSend(a1, "setTapBehavior:", v65);
  }

  if (a3)
    v66 = CFSTR("distanceToSuggestionFromViewportCenter");
  else
    v66 = CFSTR("distance_to_suggestion_from_viewport_center");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v67, "doubleValue");
    objc_msgSend(a1, "setDistanceToSuggestionFromViewportCenter:");
  }

  if (a3)
    v68 = CFSTR("timeSinceLastInteractedSeconds");
  else
    v68 = CFSTR("time_since_last_interacted_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v69, "doubleValue");
    objc_msgSend(a1, "setTimeSinceLastInteractedSeconds:");
  }

  if (a3)
    v70 = CFSTR("isContainedInViewport");
  else
    v70 = CFSTR("is_contained_in_viewport");
  objc_msgSend(v5, "objectForKeyedSubscript:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContainedInViewport:", objc_msgSend(v71, "BOOLValue"));

  if (a3)
    v72 = CFSTR("timeSinceMapViewportChangedSeconds");
  else
    v72 = CFSTR("time_since_map_viewport_changed_seconds");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v73, "doubleValue");
    objc_msgSend(a1, "setTimeSinceMapViewportChangedSeconds:");
  }

  if (a3)
    v74 = CFSTR("hyperlinkMetadata");
  else
    v74 = CFSTR("hyperlink_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = [GEOHyperlinkMetaData alloc];
    if ((a3 & 1) != 0)
      v77 = -[GEOHyperlinkMetaData initWithJSON:](v76, "initWithJSON:", v75);
    else
      v77 = -[GEOHyperlinkMetaData initWithDictionary:](v76, "initWithDictionary:", v75);
    v78 = (void *)v77;
    objc_msgSend(a1, "setHyperlinkMetadata:", v77);

  }
  if (a3)
    v79 = CFSTR("isContactWithHomeLocation");
  else
    v79 = CFSTR("is_contact_with_home_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContactWithHomeLocation:", objc_msgSend(v80, "BOOLValue"));

  if (a3)
    v81 = CFSTR("isContactWithWorkLocation");
  else
    v81 = CFSTR("is_contact_with_work_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContactWithWorkLocation:", objc_msgSend(v82, "BOOLValue"));

  if (a3)
    v83 = CFSTR("isContactWithSchoolLocation");
  else
    v83 = CFSTR("is_contact_with_school_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContactWithSchoolLocation:", objc_msgSend(v84, "BOOLValue"));

  if (a3)
    v85 = CFSTR("isContactWithOtherLocation");
  else
    v85 = CFSTR("is_contact_with_other_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContactWithOtherLocation:", objc_msgSend(v86, "BOOLValue"));

  if (a3)
    v87 = CFSTR("isContactWithLiveLocation");
  else
    v87 = CFSTR("is_contact_with_live_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContactWithLiveLocation:", objc_msgSend(v88, "BOOLValue"));

  if (a3)
    v89 = CFSTR("isContactWithNoLocation");
  else
    v89 = CFSTR("is_contact_with_no_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsContactWithNoLocation:", objc_msgSend(v90, "BOOLValue"));

  if (a3)
    v91 = CFSTR("prefixLastTokenMatchCover");
  else
    v91 = CFSTR("prefix_last_token_match_cover");
  objc_msgSend(v5, "objectForKeyedSubscript:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v92, "floatValue");
    objc_msgSend(a1, "setPrefixLastTokenMatchCover:");
  }

  if (a3)
    v93 = CFSTR("prefixMatchCover");
  else
    v93 = CFSTR("prefix_match_cover");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v94, "floatValue");
    objc_msgSend(a1, "setPrefixMatchCover:");
  }

  if (a3)
    v95 = CFSTR("prefixMatchPosition");
  else
    v95 = CFSTR("prefix_match_position");
  objc_msgSend(v5, "objectForKeyedSubscript:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixMatchPosition:", objc_msgSend(v96, "intValue"));

  if (a3)
    v97 = CFSTR("prefixMatchWordBoundary");
  else
    v97 = CFSTR("prefix_match_word_boundary");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixMatchWordBoundary:", objc_msgSend(v98, "intValue"));

  if (a3)
    v99 = CFSTR("prefixTokenMatchLengthFirstQueryToken");
  else
    v99 = CFSTR("prefix_token_match_length_first_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenMatchLengthFirstQueryToken:", objc_msgSend(v100, "intValue"));

  if (a3)
    v101 = CFSTR("prefixTokenMatchPositionFirstQueryToken");
  else
    v101 = CFSTR("prefix_token_match_position_first_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenMatchPositionFirstQueryToken:", objc_msgSend(v102, "intValue"));

  if (a3)
    v103 = CFSTR("prefixTokenIsNumberFirstQueryToken");
  else
    v103 = CFSTR("prefix_token_is_number_first_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenIsNumberFirstQueryToken:", objc_msgSend(v104, "BOOLValue"));

  if (a3)
    v105 = CFSTR("prefixTokenMatchLocationFirstQueryToken");
  else
    v105 = CFSTR("prefix_token_match_location_first_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenMatchLocationFirstQueryToken:", objc_msgSend(v106, "intValue"));

  if (a3)
    v107 = CFSTR("prefixTokenMatchLengthSecondQueryToken");
  else
    v107 = CFSTR("prefix_token_match_length_second_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenMatchLengthSecondQueryToken:", objc_msgSend(v108, "intValue"));

  if (a3)
    v109 = CFSTR("prefixTokenMatchPositionSecondQueryToken");
  else
    v109 = CFSTR("prefix_token_match_position_second_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenMatchPositionSecondQueryToken:", objc_msgSend(v110, "intValue"));

  if (a3)
    v111 = CFSTR("prefixTokenIsNumberSecondQueryToken");
  else
    v111 = CFSTR("prefix_token_is_number_second_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenIsNumberSecondQueryToken:", objc_msgSend(v112, "BOOLValue"));

  if (a3)
    v113 = CFSTR("prefixTokenMatchLocationSecondQueryToken");
  else
    v113 = CFSTR("prefix_token_match_location_second_query_token");
  objc_msgSend(v5, "objectForKeyedSubscript:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrefixTokenMatchLocationSecondQueryToken:", objc_msgSend(v114, "intValue"));

  a1 = a1;
LABEL_317:

  return a1;
}

- (GEOClientACSuggestionEntry)initWithJSON:(id)a3
{
  return (GEOClientACSuggestionEntry *)-[GEOClientACSuggestionEntry _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_75;
    else
      v8 = (int *)&readAll__nonRecursiveTag_75;
    GEOClientACSuggestionEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOSubactionMetaData readAll:](self->_subactionMetaData, "readAll:", 1);
    -[GEOHyperlinkMetaData readAll:](self->_hyperlinkMetadata, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientACSuggestionEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientACSuggestionEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;
  $CD8BBF1E49DB7E485009711ADA3FCADB v6;
  $CD8BBF1E49DB7E485009711ADA3FCADB v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOClientACSuggestionEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_105;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOClientACSuggestionEntry readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x200000000000) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_61;
    }
  }
  else if ((*(_QWORD *)&flags & 0x200000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&flags & 0x20000000000) == 0)
      goto LABEL_9;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x20000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&flags & 0x40000000000) == 0)
      goto LABEL_10;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x40000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&flags & 0x4000000000) == 0)
      goto LABEL_11;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x4000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&flags & 0x10000000000) == 0)
      goto LABEL_12;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&flags & 0x8000000000) == 0)
      goto LABEL_13;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x8000000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x800000) == 0)
      goto LABEL_16;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x800000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&flags & 0x1000000000) == 0)
      goto LABEL_17;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x1000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_19;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
LABEL_22:
    PBDataWriterWriteBOOLField();
LABEL_23:
  if (self->_suggestionSectionType)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_flags + 4) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_subactionMetaData)
    PBDataWriterWriteSubmessage();
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0)
        goto LABEL_32;
      goto LABEL_80;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      goto LABEL_33;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_34;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_35;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v6 & 0x800000000) == 0)
      goto LABEL_36;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteDoubleField();
  v6 = self->_flags;
  if ((*(_QWORD *)&v6 & 0x800000000) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_flags & 0x80) != 0)
LABEL_37:
    PBDataWriterWriteDoubleField();
LABEL_38:
  if (self->_hyperlinkMetadata)
    PBDataWriterWriteSubmessage();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_flags;
    if ((*(_QWORD *)&v7 & 0x400000000) == 0)
    {
LABEL_42:
      if ((*(_QWORD *)&v7 & 0x200000000) == 0)
        goto LABEL_43;
      goto LABEL_88;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x400000000) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x200000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v7 & 0x100000000) == 0)
      goto LABEL_44;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x100000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0)
      goto LABEL_45;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0)
      goto LABEL_46;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_47;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_48;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteFloatField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_49;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteFloatField();
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_50;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_51;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_52;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_52:
    if ((*(_QWORD *)&v7 & 0x80000000000) == 0)
      goto LABEL_53;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x80000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_54;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_55;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v7 & 0x100000000000) == 0)
      goto LABEL_57;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x100000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_105;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_flags & 0x100000) != 0)
LABEL_103:
    PBDataWriterWriteInt32Field();
LABEL_105:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;
  $CD8BBF1E49DB7E485009711ADA3FCADB v6;
  $CD8BBF1E49DB7E485009711ADA3FCADB v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOClientACSuggestionEntry readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 26) = self->_readerMarkPos;
  *((_DWORD *)v8 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v8;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    *((_DWORD *)v8 + 47) = self->_suggestionType;
    v8[27] = (id)((unint64_t)v8[27] | 0x4000000);
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x200000000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_60;
    }
  }
  else if ((*(_QWORD *)&flags & 0x200000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v8 + 213) = self->_shownToUser;
  v8[27] = (id)((unint64_t)v8[27] | 0x200000000000);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_61;
  }
LABEL_60:
  v8[4] = *(id *)&self->_fractionOfMatch;
  v8[27] = (id)((unint64_t)v8[27] | 4);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v8 + 31) = self->_distanceToSuggestion;
  v8[27] = (id)((unint64_t)v8[27] | 0x400);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_6:
    if ((*(_QWORD *)&flags & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_63;
  }
LABEL_62:
  v8[2] = *(id *)&self->_contactRelevanceScore;
  v8[27] = (id)((unint64_t)v8[27] | 1);
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(_QWORD *)&flags & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_64;
  }
LABEL_63:
  *((_BYTE *)v8 + 209) = self->_matchedUsingName;
  v8[27] = (id)((unint64_t)v8[27] | 0x20000000000);
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&flags & 0x4000000000) == 0)
      goto LABEL_9;
    goto LABEL_65;
  }
LABEL_64:
  *((_BYTE *)v8 + 210) = self->_matchedUsingOrganization;
  v8[27] = (id)((unint64_t)v8[27] | 0x40000000000);
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x4000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&flags & 0x10000000000) == 0)
      goto LABEL_10;
    goto LABEL_66;
  }
LABEL_65:
  *((_BYTE *)v8 + 206) = self->_matchedUsingAddress;
  v8[27] = (id)((unint64_t)v8[27] | 0x4000000000);
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x10000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&flags & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_67;
  }
LABEL_66:
  *((_BYTE *)v8 + 208) = self->_matchedUsingLabel;
  v8[27] = (id)((unint64_t)v8[27] | 0x10000000000);
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_68;
  }
LABEL_67:
  *((_BYTE *)v8 + 207) = self->_matchedUsingEventName;
  v8[27] = (id)((unint64_t)v8[27] | 0x8000000000);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v8 + 32) = self->_peopleSuggesterRank;
  v8[27] = (id)((unint64_t)v8[27] | 0x800);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&flags & 0x800000) == 0)
      goto LABEL_14;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v8 + 29) = self->_age;
  v8[27] = (id)((unint64_t)v8[27] | 0x100);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x800000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&flags & 0x1000000000) == 0)
      goto LABEL_15;
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v8 + 44) = self->_serverEntryType;
  v8[27] = (id)((unint64_t)v8[27] | 0x800000);
  flags = self->_flags;
  if ((*(_QWORD *)&flags & 0x1000000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_72;
  }
LABEL_71:
  *((_BYTE *)v8 + 204) = self->_isFavorite;
  v8[27] = (id)((unint64_t)v8[27] | 0x1000000000);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_17;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v8 + 33) = self->_poiOpenState;
  v8[27] = (id)((unint64_t)v8[27] | 0x1000);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_74;
  }
LABEL_73:
  v8[6] = *(id *)&self->_mapsSuggestionsContactRevelanceScore;
  v8[27] = (id)((unint64_t)v8[27] | 8);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&flags & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_75;
  }
LABEL_74:
  v8[8] = *(id *)&self->_mapsSuggestionsPoiRevelanceScore;
  v8[27] = (id)((unint64_t)v8[27] | 0x20);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&flags & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_75:
  v8[7] = *(id *)&self->_mapsSuggestionsIsTouristScore;
  v8[27] = (id)((unint64_t)v8[27] | 0x10);
  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
  {
LABEL_20:
    *((_BYTE *)v8 + 196) = self->_discreteFeatureValuesAvailable;
    v8[27] = (id)((unint64_t)v8[27] | 0x10000000);
  }
LABEL_21:
  if (self->_suggestionSectionType)
  {
    objc_msgSend(v8, "setSuggestionSectionType:");
    v4 = v8;
  }
  if ((*((_BYTE *)&self->_flags + 4) & 0x20) != 0)
  {
    *((_BYTE *)v4 + 205) = self->_isProminentResult;
    v4[27] = (id)((unint64_t)v4[27] | 0x2000000000);
  }
  if (self->_subactionMetaData)
  {
    objc_msgSend(v8, "setSubactionMetaData:");
    v4 = v8;
  }
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_autocompleteResultCellType;
    v4[27] = (id)((unint64_t)v4[27] | 0x200);
    v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0)
        goto LABEL_30;
      goto LABEL_79;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_29;
  }
  *((_DWORD *)v4 + 46) = self->_serverSectionIndex;
  v4[27] = (id)((unint64_t)v4[27] | 0x2000000);
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v4 + 45) = self->_serverItemIndexInSection;
  v4[27] = (id)((unint64_t)v4[27] | 0x1000000);
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_32;
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v4 + 48) = self->_tapBehavior;
  v4[27] = (id)((unint64_t)v4[27] | 0x8000000);
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_82;
  }
LABEL_81:
  v4[3] = *(id *)&self->_distanceToSuggestionFromViewportCenter;
  v4[27] = (id)((unint64_t)v4[27] | 2);
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v6 & 0x800000000) == 0)
      goto LABEL_34;
    goto LABEL_83;
  }
LABEL_82:
  v4[11] = *(id *)&self->_timeSinceLastInteractedSeconds;
  v4[27] = (id)((unint64_t)v4[27] | 0x40);
  v6 = self->_flags;
  if ((*(_QWORD *)&v6 & 0x800000000) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_83:
  *((_BYTE *)v4 + 203) = self->_isContainedInViewport;
  v4[27] = (id)((unint64_t)v4[27] | 0x800000000);
  if ((*(_QWORD *)&self->_flags & 0x80) != 0)
  {
LABEL_35:
    v4[12] = *(id *)&self->_timeSinceMapViewportChangedSeconds;
    v4[27] = (id)((unint64_t)v4[27] | 0x80);
  }
LABEL_36:
  if (self->_hyperlinkMetadata)
  {
    objc_msgSend(v8, "setHyperlinkMetadata:");
    v4 = v8;
  }
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    *((_BYTE *)v4 + 197) = self->_isContactWithHomeLocation;
    v4[27] = (id)((unint64_t)v4[27] | 0x20000000);
    v7 = self->_flags;
    if ((*(_QWORD *)&v7 & 0x400000000) == 0)
    {
LABEL_40:
      if ((*(_QWORD *)&v7 & 0x200000000) == 0)
        goto LABEL_41;
      goto LABEL_87;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x400000000) == 0)
  {
    goto LABEL_40;
  }
  *((_BYTE *)v4 + 202) = self->_isContactWithWorkLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x400000000);
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x200000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v7 & 0x100000000) == 0)
      goto LABEL_42;
    goto LABEL_88;
  }
LABEL_87:
  *((_BYTE *)v4 + 201) = self->_isContactWithSchoolLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x200000000);
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x100000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0)
      goto LABEL_43;
    goto LABEL_89;
  }
LABEL_88:
  *((_BYTE *)v4 + 200) = self->_isContactWithOtherLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x100000000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_90;
  }
LABEL_89:
  *((_BYTE *)v4 + 198) = self->_isContactWithLiveLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x40000000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_45;
    goto LABEL_91;
  }
LABEL_90:
  *((_BYTE *)v4 + 199) = self->_isContactWithNoLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x80000000);
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_46;
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 34) = LODWORD(self->_prefixLastTokenMatchCover);
  v4[27] = (id)((unint64_t)v4[27] | 0x2000);
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_47;
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 35) = LODWORD(self->_prefixMatchCover);
  v4[27] = (id)((unint64_t)v4[27] | 0x4000);
  v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_48;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v4 + 36) = self->_prefixMatchPosition;
  v4[27] = (id)((unint64_t)v4[27] | 0x8000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_49;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 37) = self->_prefixMatchWordBoundary;
  v4[27] = (id)((unint64_t)v4[27] | 0x10000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_50;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v4 + 38) = self->_prefixTokenMatchLengthFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x20000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&v7 & 0x80000000000) == 0)
      goto LABEL_51;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 42) = self->_prefixTokenMatchPositionFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x200000);
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x80000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_52;
    goto LABEL_98;
  }
LABEL_97:
  *((_BYTE *)v4 + 211) = self->_prefixTokenIsNumberFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x80000000000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_53;
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v4 + 40) = self->_prefixTokenMatchLocationFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x80000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_54;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v4 + 39) = self->_prefixTokenMatchLengthSecondQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x40000);
  v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&v7 & 0x100000000000) == 0)
      goto LABEL_55;
LABEL_101:
    *((_BYTE *)v4 + 212) = self->_prefixTokenIsNumberSecondQueryToken;
    v4[27] = (id)((unint64_t)v4[27] | 0x100000000000);
    if ((*(_QWORD *)&self->_flags & 0x100000) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_100:
  *((_DWORD *)v4 + 43) = self->_prefixTokenMatchPositionSecondQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x400000);
  v7 = self->_flags;
  if ((*(_QWORD *)&v7 & 0x100000000000) != 0)
    goto LABEL_101;
LABEL_55:
  if ((*(_DWORD *)&v7 & 0x100000) != 0)
  {
LABEL_56:
    *((_DWORD *)v4 + 41) = self->_prefixTokenMatchLocationSecondQueryToken;
    v4[27] = (id)((unint64_t)v4[27] | 0x100000);
  }
LABEL_57:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  $CD8BBF1E49DB7E485009711ADA3FCADB v14;
  id v15;
  void *v16;
  $CD8BBF1E49DB7E485009711ADA3FCADB v17;
  id v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOClientACSuggestionEntry readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x4000000) != 0)
    {
      *(_DWORD *)(v5 + 188) = self->_suggestionType;
      *(_QWORD *)(v5 + 216) |= 0x4000000uLL;
      flags = self->_flags;
      if ((*(_QWORD *)&flags & 0x200000000000) == 0)
      {
LABEL_7:
        if ((*(_BYTE *)&flags & 4) == 0)
          goto LABEL_8;
        goto LABEL_59;
      }
    }
    else if ((*(_QWORD *)&flags & 0x200000000000) == 0)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(v5 + 213) = self->_shownToUser;
    *(_QWORD *)(v5 + 216) |= 0x200000000000uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_9;
      goto LABEL_60;
    }
LABEL_59:
    *(double *)(v5 + 32) = self->_fractionOfMatch;
    *(_QWORD *)(v5 + 216) |= 4uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_10;
      goto LABEL_61;
    }
LABEL_60:
    *(_DWORD *)(v5 + 124) = self->_distanceToSuggestion;
    *(_QWORD *)(v5 + 216) |= 0x400uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_10:
      if ((*(_QWORD *)&flags & 0x20000000000) == 0)
        goto LABEL_11;
      goto LABEL_62;
    }
LABEL_61:
    *(double *)(v5 + 16) = self->_contactRelevanceScore;
    *(_QWORD *)(v5 + 216) |= 1uLL;
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x20000000000) == 0)
    {
LABEL_11:
      if ((*(_QWORD *)&flags & 0x40000000000) == 0)
        goto LABEL_12;
      goto LABEL_63;
    }
LABEL_62:
    *(_BYTE *)(v5 + 209) = self->_matchedUsingName;
    *(_QWORD *)(v5 + 216) |= 0x20000000000uLL;
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x40000000000) == 0)
    {
LABEL_12:
      if ((*(_QWORD *)&flags & 0x4000000000) == 0)
        goto LABEL_13;
      goto LABEL_64;
    }
LABEL_63:
    *(_BYTE *)(v5 + 210) = self->_matchedUsingOrganization;
    *(_QWORD *)(v5 + 216) |= 0x40000000000uLL;
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x4000000000) == 0)
    {
LABEL_13:
      if ((*(_QWORD *)&flags & 0x10000000000) == 0)
        goto LABEL_14;
      goto LABEL_65;
    }
LABEL_64:
    *(_BYTE *)(v5 + 206) = self->_matchedUsingAddress;
    *(_QWORD *)(v5 + 216) |= 0x4000000000uLL;
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x10000000000) == 0)
    {
LABEL_14:
      if ((*(_QWORD *)&flags & 0x8000000000) == 0)
        goto LABEL_15;
      goto LABEL_66;
    }
LABEL_65:
    *(_BYTE *)(v5 + 208) = self->_matchedUsingLabel;
    *(_QWORD *)(v5 + 216) |= 0x10000000000uLL;
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x8000000000) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&flags & 0x800) == 0)
        goto LABEL_16;
      goto LABEL_67;
    }
LABEL_66:
    *(_BYTE *)(v5 + 207) = self->_matchedUsingEventName;
    *(_QWORD *)(v5 + 216) |= 0x8000000000uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_68;
    }
LABEL_67:
    *(_DWORD *)(v5 + 128) = self->_peopleSuggesterRank;
    *(_QWORD *)(v5 + 216) |= 0x800uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&flags & 0x800000) == 0)
        goto LABEL_18;
      goto LABEL_69;
    }
LABEL_68:
    *(_DWORD *)(v5 + 116) = self->_age;
    *(_QWORD *)(v5 + 216) |= 0x100uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x800000) == 0)
    {
LABEL_18:
      if ((*(_QWORD *)&flags & 0x1000000000) == 0)
        goto LABEL_19;
      goto LABEL_70;
    }
LABEL_69:
    *(_DWORD *)(v5 + 176) = self->_serverEntryType;
    *(_QWORD *)(v5 + 216) |= 0x800000uLL;
    flags = self->_flags;
    if ((*(_QWORD *)&flags & 0x1000000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&flags & 0x1000) == 0)
        goto LABEL_20;
      goto LABEL_71;
    }
LABEL_70:
    *(_BYTE *)(v5 + 204) = self->_isFavorite;
    *(_QWORD *)(v5 + 216) |= 0x1000000000uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_20:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_21;
      goto LABEL_72;
    }
LABEL_71:
    *(_DWORD *)(v5 + 132) = self->_poiOpenState;
    *(_QWORD *)(v5 + 216) |= 0x1000uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_22;
      goto LABEL_73;
    }
LABEL_72:
    *(double *)(v5 + 48) = self->_mapsSuggestionsContactRevelanceScore;
    *(_QWORD *)(v5 + 216) |= 8uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_74;
    }
LABEL_73:
    *(double *)(v5 + 64) = self->_mapsSuggestionsPoiRevelanceScore;
    *(_QWORD *)(v5 + 216) |= 0x20uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&flags & 0x10000000) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
LABEL_74:
    *(double *)(v5 + 56) = self->_mapsSuggestionsIsTouristScore;
    *(_QWORD *)(v5 + 216) |= 0x10uLL;
    if ((*(_QWORD *)&self->_flags & 0x10000000) == 0)
    {
LABEL_25:
      v10 = -[NSString copyWithZone:](self->_suggestionSectionType, "copyWithZone:", a3);
      v11 = *(void **)(v5 + 80);
      *(_QWORD *)(v5 + 80) = v10;

      if ((*((_BYTE *)&self->_flags + 4) & 0x20) != 0)
      {
        *(_BYTE *)(v5 + 205) = self->_isProminentResult;
        *(_QWORD *)(v5 + 216) |= 0x2000000000uLL;
      }
      v12 = -[GEOSubactionMetaData copyWithZone:](self->_subactionMetaData, "copyWithZone:", a3);
      v13 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = v12;

      v14 = self->_flags;
      if ((*(_WORD *)&v14 & 0x200) != 0)
      {
        *(_DWORD *)(v5 + 120) = self->_autocompleteResultCellType;
        *(_QWORD *)(v5 + 216) |= 0x200uLL;
        v14 = self->_flags;
        if ((*(_DWORD *)&v14 & 0x2000000) == 0)
        {
LABEL_29:
          if ((*(_DWORD *)&v14 & 0x1000000) == 0)
            goto LABEL_30;
          goto LABEL_78;
        }
      }
      else if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      {
        goto LABEL_29;
      }
      *(_DWORD *)(v5 + 184) = self->_serverSectionIndex;
      *(_QWORD *)(v5 + 216) |= 0x2000000uLL;
      v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      {
LABEL_30:
        if ((*(_DWORD *)&v14 & 0x8000000) == 0)
          goto LABEL_31;
        goto LABEL_79;
      }
LABEL_78:
      *(_DWORD *)(v5 + 180) = self->_serverItemIndexInSection;
      *(_QWORD *)(v5 + 216) |= 0x1000000uLL;
      v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x8000000) == 0)
      {
LABEL_31:
        if ((*(_BYTE *)&v14 & 2) == 0)
          goto LABEL_32;
        goto LABEL_80;
      }
LABEL_79:
      *(_DWORD *)(v5 + 192) = self->_tapBehavior;
      *(_QWORD *)(v5 + 216) |= 0x8000000uLL;
      v14 = self->_flags;
      if ((*(_BYTE *)&v14 & 2) == 0)
      {
LABEL_32:
        if ((*(_BYTE *)&v14 & 0x40) == 0)
          goto LABEL_33;
        goto LABEL_81;
      }
LABEL_80:
      *(double *)(v5 + 24) = self->_distanceToSuggestionFromViewportCenter;
      *(_QWORD *)(v5 + 216) |= 2uLL;
      v14 = self->_flags;
      if ((*(_BYTE *)&v14 & 0x40) == 0)
      {
LABEL_33:
        if ((*(_QWORD *)&v14 & 0x800000000) == 0)
          goto LABEL_34;
        goto LABEL_82;
      }
LABEL_81:
      *(double *)(v5 + 88) = self->_timeSinceLastInteractedSeconds;
      *(_QWORD *)(v5 + 216) |= 0x40uLL;
      v14 = self->_flags;
      if ((*(_QWORD *)&v14 & 0x800000000) == 0)
      {
LABEL_34:
        if ((*(_BYTE *)&v14 & 0x80) == 0)
          goto LABEL_36;
        goto LABEL_35;
      }
LABEL_82:
      *(_BYTE *)(v5 + 203) = self->_isContainedInViewport;
      *(_QWORD *)(v5 + 216) |= 0x800000000uLL;
      if ((*(_QWORD *)&self->_flags & 0x80) == 0)
      {
LABEL_36:
        v15 = -[GEOHyperlinkMetaData copyWithZone:](self->_hyperlinkMetadata, "copyWithZone:", a3);
        v16 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v15;

        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x20000000) != 0)
        {
          *(_BYTE *)(v5 + 197) = self->_isContactWithHomeLocation;
          *(_QWORD *)(v5 + 216) |= 0x20000000uLL;
          v17 = self->_flags;
          if ((*(_QWORD *)&v17 & 0x400000000) == 0)
          {
LABEL_38:
            if ((*(_QWORD *)&v17 & 0x200000000) == 0)
              goto LABEL_39;
            goto LABEL_86;
          }
        }
        else if ((*(_QWORD *)&v17 & 0x400000000) == 0)
        {
          goto LABEL_38;
        }
        *(_BYTE *)(v5 + 202) = self->_isContactWithWorkLocation;
        *(_QWORD *)(v5 + 216) |= 0x400000000uLL;
        v17 = self->_flags;
        if ((*(_QWORD *)&v17 & 0x200000000) == 0)
        {
LABEL_39:
          if ((*(_QWORD *)&v17 & 0x100000000) == 0)
            goto LABEL_40;
          goto LABEL_87;
        }
LABEL_86:
        *(_BYTE *)(v5 + 201) = self->_isContactWithSchoolLocation;
        *(_QWORD *)(v5 + 216) |= 0x200000000uLL;
        v17 = self->_flags;
        if ((*(_QWORD *)&v17 & 0x100000000) == 0)
        {
LABEL_40:
          if ((*(_DWORD *)&v17 & 0x40000000) == 0)
            goto LABEL_41;
          goto LABEL_88;
        }
LABEL_87:
        *(_BYTE *)(v5 + 200) = self->_isContactWithOtherLocation;
        *(_QWORD *)(v5 + 216) |= 0x100000000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x40000000) == 0)
        {
LABEL_41:
          if ((*(_DWORD *)&v17 & 0x80000000) == 0)
            goto LABEL_42;
          goto LABEL_89;
        }
LABEL_88:
        *(_BYTE *)(v5 + 198) = self->_isContactWithLiveLocation;
        *(_QWORD *)(v5 + 216) |= 0x40000000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x80000000) == 0)
        {
LABEL_42:
          if ((*(_WORD *)&v17 & 0x2000) == 0)
            goto LABEL_43;
          goto LABEL_90;
        }
LABEL_89:
        *(_BYTE *)(v5 + 199) = self->_isContactWithNoLocation;
        *(_QWORD *)(v5 + 216) |= 0x80000000uLL;
        v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x2000) == 0)
        {
LABEL_43:
          if ((*(_WORD *)&v17 & 0x4000) == 0)
            goto LABEL_44;
          goto LABEL_91;
        }
LABEL_90:
        *(float *)(v5 + 136) = self->_prefixLastTokenMatchCover;
        *(_QWORD *)(v5 + 216) |= 0x2000uLL;
        v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x4000) == 0)
        {
LABEL_44:
          if ((*(_WORD *)&v17 & 0x8000) == 0)
            goto LABEL_45;
          goto LABEL_92;
        }
LABEL_91:
        *(float *)(v5 + 140) = self->_prefixMatchCover;
        *(_QWORD *)(v5 + 216) |= 0x4000uLL;
        v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x8000) == 0)
        {
LABEL_45:
          if ((*(_DWORD *)&v17 & 0x10000) == 0)
            goto LABEL_46;
          goto LABEL_93;
        }
LABEL_92:
        *(_DWORD *)(v5 + 144) = self->_prefixMatchPosition;
        *(_QWORD *)(v5 + 216) |= 0x8000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x10000) == 0)
        {
LABEL_46:
          if ((*(_DWORD *)&v17 & 0x20000) == 0)
            goto LABEL_47;
          goto LABEL_94;
        }
LABEL_93:
        *(_DWORD *)(v5 + 148) = self->_prefixMatchWordBoundary;
        *(_QWORD *)(v5 + 216) |= 0x10000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x20000) == 0)
        {
LABEL_47:
          if ((*(_DWORD *)&v17 & 0x200000) == 0)
            goto LABEL_48;
          goto LABEL_95;
        }
LABEL_94:
        *(_DWORD *)(v5 + 152) = self->_prefixTokenMatchLengthFirstQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x20000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x200000) == 0)
        {
LABEL_48:
          if ((*(_QWORD *)&v17 & 0x80000000000) == 0)
            goto LABEL_49;
          goto LABEL_96;
        }
LABEL_95:
        *(_DWORD *)(v5 + 168) = self->_prefixTokenMatchPositionFirstQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x200000uLL;
        v17 = self->_flags;
        if ((*(_QWORD *)&v17 & 0x80000000000) == 0)
        {
LABEL_49:
          if ((*(_DWORD *)&v17 & 0x80000) == 0)
            goto LABEL_50;
          goto LABEL_97;
        }
LABEL_96:
        *(_BYTE *)(v5 + 211) = self->_prefixTokenIsNumberFirstQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x80000000000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x80000) == 0)
        {
LABEL_50:
          if ((*(_DWORD *)&v17 & 0x40000) == 0)
            goto LABEL_51;
          goto LABEL_98;
        }
LABEL_97:
        *(_DWORD *)(v5 + 160) = self->_prefixTokenMatchLocationFirstQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x80000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x40000) == 0)
        {
LABEL_51:
          if ((*(_DWORD *)&v17 & 0x400000) == 0)
            goto LABEL_52;
          goto LABEL_99;
        }
LABEL_98:
        *(_DWORD *)(v5 + 156) = self->_prefixTokenMatchLengthSecondQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x40000uLL;
        v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x400000) == 0)
        {
LABEL_52:
          if ((*(_QWORD *)&v17 & 0x100000000000) == 0)
            goto LABEL_53;
          goto LABEL_100;
        }
LABEL_99:
        *(_DWORD *)(v5 + 172) = self->_prefixTokenMatchPositionSecondQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x400000uLL;
        v17 = self->_flags;
        if ((*(_QWORD *)&v17 & 0x100000000000) == 0)
        {
LABEL_53:
          if ((*(_DWORD *)&v17 & 0x100000) == 0)
          {
LABEL_55:
            v18 = (id)v5;
            goto LABEL_56;
          }
LABEL_54:
          *(_DWORD *)(v5 + 164) = self->_prefixTokenMatchLocationSecondQueryToken;
          *(_QWORD *)(v5 + 216) |= 0x100000uLL;
          goto LABEL_55;
        }
LABEL_100:
        *(_BYTE *)(v5 + 212) = self->_prefixTokenIsNumberSecondQueryToken;
        *(_QWORD *)(v5 + 216) |= 0x100000000000uLL;
        if ((*(_QWORD *)&self->_flags & 0x100000) == 0)
          goto LABEL_55;
        goto LABEL_54;
      }
LABEL_35:
      *(double *)(v5 + 96) = self->_timeSinceMapViewportChangedSeconds;
      *(_QWORD *)(v5 + 216) |= 0x80uLL;
      goto LABEL_36;
    }
LABEL_24:
    *(_BYTE *)(v5 + 196) = self->_discreteFeatureValuesAvailable;
    *(_QWORD *)(v5 + 216) |= 0x10000000uLL;
    goto LABEL_25;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 6) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOClientACSuggestionEntryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_56:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;
  uint64_t v6;
  NSString *suggestionSectionType;
  GEOSubactionMetaData *subactionMetaData;
  GEOHyperlinkMetaData *hyperlinkMetadata;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_295;
  -[GEOClientACSuggestionEntry readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_QWORD *)v4 + 27);
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_suggestionType != *((_DWORD *)v4 + 47))
      goto LABEL_295;
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x200000000000) != 0)
  {
    if ((v6 & 0x200000000000) == 0)
      goto LABEL_295;
    if (self->_shownToUser)
    {
      if (!*((_BYTE *)v4 + 213))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 213))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x200000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fractionOfMatch != *((double *)v4 + 4))
      goto LABEL_295;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_distanceToSuggestion != *((_DWORD *)v4 + 31))
      goto LABEL_295;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_contactRelevanceScore != *((double *)v4 + 2))
      goto LABEL_295;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0)
      goto LABEL_295;
    if (self->_matchedUsingName)
    {
      if (!*((_BYTE *)v4 + 209))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 209))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x40000000000) != 0)
  {
    if ((v6 & 0x40000000000) == 0)
      goto LABEL_295;
    if (self->_matchedUsingOrganization)
    {
      if (!*((_BYTE *)v4 + 210))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 210))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x40000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_295;
    if (self->_matchedUsingAddress)
    {
      if (!*((_BYTE *)v4 + 206))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 206))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0)
      goto LABEL_295;
    if (self->_matchedUsingLabel)
    {
      if (!*((_BYTE *)v4 + 208))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 208))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_295;
    if (self->_matchedUsingEventName)
    {
      if (!*((_BYTE *)v4 + 207))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 207))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_peopleSuggesterRank != *((_DWORD *)v4 + 32))
      goto LABEL_295;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_age != *((_DWORD *)v4 + 29))
      goto LABEL_295;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_serverEntryType != *((_DWORD *)v4 + 44))
      goto LABEL_295;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0)
      goto LABEL_295;
    if (self->_isFavorite)
    {
      if (!*((_BYTE *)v4 + 204))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 204))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_poiOpenState != *((_DWORD *)v4 + 33))
      goto LABEL_295;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mapsSuggestionsContactRevelanceScore != *((double *)v4 + 6))
      goto LABEL_295;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_mapsSuggestionsPoiRevelanceScore != *((double *)v4 + 8))
      goto LABEL_295;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapsSuggestionsIsTouristScore != *((double *)v4 + 7))
      goto LABEL_295;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0)
      goto LABEL_295;
    if (self->_discreteFeatureValuesAvailable)
    {
      if (!*((_BYTE *)v4 + 196))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 196))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_295;
  }
  suggestionSectionType = self->_suggestionSectionType;
  if ((unint64_t)suggestionSectionType | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](suggestionSectionType, "isEqual:"))
      goto LABEL_295;
    flags = self->_flags;
    v6 = *((_QWORD *)v4 + 27);
  }
  if ((*(_QWORD *)&flags & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0)
      goto LABEL_295;
    if (self->_isProminentResult)
    {
      if (!*((_BYTE *)v4 + 205))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 205))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_295;
  }
  subactionMetaData = self->_subactionMetaData;
  if ((unint64_t)subactionMetaData | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOSubactionMetaData isEqual:](subactionMetaData, "isEqual:"))
      goto LABEL_295;
    flags = self->_flags;
    v6 = *((_QWORD *)v4 + 27);
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_autocompleteResultCellType != *((_DWORD *)v4 + 30))
      goto LABEL_295;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_serverSectionIndex != *((_DWORD *)v4 + 46))
      goto LABEL_295;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_serverItemIndexInSection != *((_DWORD *)v4 + 45))
      goto LABEL_295;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_tapBehavior != *((_DWORD *)v4 + 48))
      goto LABEL_295;
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_distanceToSuggestionFromViewportCenter != *((double *)v4 + 3))
      goto LABEL_295;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_timeSinceLastInteractedSeconds != *((double *)v4 + 11))
      goto LABEL_295;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0)
      goto LABEL_295;
    if (self->_isContainedInViewport)
    {
      if (!*((_BYTE *)v4 + 203))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 203))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_timeSinceMapViewportChangedSeconds != *((double *)v4 + 12))
      goto LABEL_295;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_295;
  }
  hyperlinkMetadata = self->_hyperlinkMetadata;
  if ((unint64_t)hyperlinkMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOHyperlinkMetaData isEqual:](hyperlinkMetadata, "isEqual:"))
      goto LABEL_295;
    flags = self->_flags;
    v6 = *((_QWORD *)v4 + 27);
  }
  if ((*(_DWORD *)&flags & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0)
      goto LABEL_295;
    if (self->_isContactWithHomeLocation)
    {
      if (!*((_BYTE *)v4 + 197))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 197))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0)
      goto LABEL_295;
    if (self->_isContactWithWorkLocation)
    {
      if (!*((_BYTE *)v4 + 202))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 202))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0)
      goto LABEL_295;
    if (self->_isContactWithSchoolLocation)
    {
      if (!*((_BYTE *)v4 + 201))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0)
      goto LABEL_295;
    if (self->_isContactWithOtherLocation)
    {
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 200))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0)
      goto LABEL_295;
    if (self->_isContactWithLiveLocation)
    {
      if (!*((_BYTE *)v4 + 198))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 198))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0)
      goto LABEL_295;
    if (self->_isContactWithNoLocation)
    {
      if (!*((_BYTE *)v4 + 199))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 199))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_prefixLastTokenMatchCover != *((float *)v4 + 34))
      goto LABEL_295;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_prefixMatchCover != *((float *)v4 + 35))
      goto LABEL_295;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_prefixMatchPosition != *((_DWORD *)v4 + 36))
      goto LABEL_295;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_prefixMatchWordBoundary != *((_DWORD *)v4 + 37))
      goto LABEL_295;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_prefixTokenMatchLengthFirstQueryToken != *((_DWORD *)v4 + 38))
      goto LABEL_295;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_prefixTokenMatchPositionFirstQueryToken != *((_DWORD *)v4 + 42))
      goto LABEL_295;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x80000000000) != 0)
  {
    if ((v6 & 0x80000000000) == 0)
      goto LABEL_295;
    if (self->_prefixTokenIsNumberFirstQueryToken)
    {
      if (!*((_BYTE *)v4 + 211))
        goto LABEL_295;
    }
    else if (*((_BYTE *)v4 + 211))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x80000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_prefixTokenMatchLocationFirstQueryToken != *((_DWORD *)v4 + 40))
      goto LABEL_295;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_prefixTokenMatchLengthSecondQueryToken != *((_DWORD *)v4 + 39))
      goto LABEL_295;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_prefixTokenMatchPositionSecondQueryToken != *((_DWORD *)v4 + 43))
      goto LABEL_295;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_QWORD *)&flags & 0x100000000000) == 0)
  {
    if ((v6 & 0x100000000000) == 0)
      goto LABEL_290;
LABEL_295:
    v10 = 0;
    goto LABEL_296;
  }
  if ((v6 & 0x100000000000) == 0)
    goto LABEL_295;
  if (!self->_prefixTokenIsNumberSecondQueryToken)
  {
    if (!*((_BYTE *)v4 + 212))
      goto LABEL_290;
    goto LABEL_295;
  }
  if (!*((_BYTE *)v4 + 212))
    goto LABEL_295;
LABEL_290:
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_prefixTokenMatchLocationSecondQueryToken != *((_DWORD *)v4 + 41))
      goto LABEL_295;
    v10 = 1;
  }
  else
  {
    v10 = (v6 & 0x100000) == 0;
  }
LABEL_296:

  return v10;
}

- (unint64_t)hash
{
  $CD8BBF1E49DB7E485009711ADA3FCADB flags;
  double fractionOfMatch;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  double contactRelevanceScore;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double mapsSuggestionsContactRevelanceScore;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double mapsSuggestionsPoiRevelanceScore;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double mapsSuggestionsIsTouristScore;
  double v26;
  long double v27;
  double v28;
  $CD8BBF1E49DB7E485009711ADA3FCADB v29;
  double distanceToSuggestionFromViewportCenter;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  double timeSinceLastInteractedSeconds;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  double timeSinceMapViewportChangedSeconds;
  double v42;
  long double v43;
  double v44;
  $CD8BBF1E49DB7E485009711ADA3FCADB v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  float prefixLastTokenMatchCover;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  float prefixMatchCover;
  double v57;
  long double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  NSUInteger v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;

  -[GEOClientACSuggestionEntry readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
    v101 = 0;
    if ((*(_QWORD *)&flags & 0x200000000000) != 0)
      goto LABEL_3;
LABEL_9:
    v100 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v101 = 2654435761 * self->_suggestionType;
  if ((*(_QWORD *)&flags & 0x200000000000) == 0)
    goto LABEL_9;
LABEL_3:
  v100 = 2654435761 * self->_shownToUser;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_10;
LABEL_4:
  fractionOfMatch = self->_fractionOfMatch;
  v5 = -fractionOfMatch;
  if (fractionOfMatch >= 0.0)
    v5 = self->_fractionOfMatch;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    v98 = 2654435761 * self->_distanceToSuggestion;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_15;
LABEL_20:
    v13 = 0;
    goto LABEL_23;
  }
  v98 = 0;
  if ((*(_BYTE *)&flags & 1) == 0)
    goto LABEL_20;
LABEL_15:
  contactRelevanceScore = self->_contactRelevanceScore;
  v10 = -contactRelevanceScore;
  if (contactRelevanceScore >= 0.0)
    v10 = self->_contactRelevanceScore;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_23:
  if ((*(_QWORD *)&flags & 0x20000000000) != 0)
  {
    v97 = 2654435761 * self->_matchedUsingName;
    if ((*(_QWORD *)&flags & 0x40000000000) != 0)
    {
LABEL_25:
      v96 = 2654435761 * self->_matchedUsingOrganization;
      if ((*(_QWORD *)&flags & 0x4000000000) != 0)
        goto LABEL_26;
      goto LABEL_40;
    }
  }
  else
  {
    v97 = 0;
    if ((*(_QWORD *)&flags & 0x40000000000) != 0)
      goto LABEL_25;
  }
  v96 = 0;
  if ((*(_QWORD *)&flags & 0x4000000000) != 0)
  {
LABEL_26:
    v95 = 2654435761 * self->_matchedUsingAddress;
    if ((*(_QWORD *)&flags & 0x10000000000) != 0)
      goto LABEL_27;
    goto LABEL_41;
  }
LABEL_40:
  v95 = 0;
  if ((*(_QWORD *)&flags & 0x10000000000) != 0)
  {
LABEL_27:
    v94 = 2654435761 * self->_matchedUsingLabel;
    if ((*(_QWORD *)&flags & 0x8000000000) != 0)
      goto LABEL_28;
    goto LABEL_42;
  }
LABEL_41:
  v94 = 0;
  if ((*(_QWORD *)&flags & 0x8000000000) != 0)
  {
LABEL_28:
    v93 = 2654435761 * self->_matchedUsingEventName;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_29;
    goto LABEL_43;
  }
LABEL_42:
  v93 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_29:
    v92 = 2654435761 * self->_peopleSuggesterRank;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_30;
    goto LABEL_44;
  }
LABEL_43:
  v92 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_30:
    v91 = 2654435761 * self->_age;
    if ((*(_DWORD *)&flags & 0x800000) != 0)
      goto LABEL_31;
    goto LABEL_45;
  }
LABEL_44:
  v91 = 0;
  if ((*(_DWORD *)&flags & 0x800000) != 0)
  {
LABEL_31:
    v90 = 2654435761 * self->_serverEntryType;
    if ((*(_QWORD *)&flags & 0x1000000000) != 0)
      goto LABEL_32;
    goto LABEL_46;
  }
LABEL_45:
  v90 = 0;
  if ((*(_QWORD *)&flags & 0x1000000000) != 0)
  {
LABEL_32:
    v89 = 2654435761 * self->_isFavorite;
    if ((*(_WORD *)&flags & 0x1000) != 0)
      goto LABEL_33;
LABEL_47:
    v88 = 0;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_34;
LABEL_48:
    v18 = 0;
    goto LABEL_51;
  }
LABEL_46:
  v89 = 0;
  if ((*(_WORD *)&flags & 0x1000) == 0)
    goto LABEL_47;
LABEL_33:
  v88 = 2654435761 * self->_poiOpenState;
  if ((*(_BYTE *)&flags & 8) == 0)
    goto LABEL_48;
LABEL_34:
  mapsSuggestionsContactRevelanceScore = self->_mapsSuggestionsContactRevelanceScore;
  v15 = -mapsSuggestionsContactRevelanceScore;
  if (mapsSuggestionsContactRevelanceScore >= 0.0)
    v15 = self->_mapsSuggestionsContactRevelanceScore;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_51:
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    mapsSuggestionsPoiRevelanceScore = self->_mapsSuggestionsPoiRevelanceScore;
    v21 = -mapsSuggestionsPoiRevelanceScore;
    if (mapsSuggestionsPoiRevelanceScore >= 0.0)
      v21 = self->_mapsSuggestionsPoiRevelanceScore;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    mapsSuggestionsIsTouristScore = self->_mapsSuggestionsIsTouristScore;
    v26 = -mapsSuggestionsIsTouristScore;
    if (mapsSuggestionsIsTouristScore >= 0.0)
      v26 = self->_mapsSuggestionsIsTouristScore;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  v87 = v24;
  if ((*(_DWORD *)&flags & 0x10000000) != 0)
    v86 = 2654435761 * self->_discreteFeatureValuesAvailable;
  else
    v86 = 0;
  v85 = -[NSString hash](self->_suggestionSectionType, "hash");
  if ((*((_BYTE *)&self->_flags + 4) & 0x20) != 0)
    v84 = 2654435761 * self->_isProminentResult;
  else
    v84 = 0;
  v83 = -[GEOSubactionMetaData hash](self->_subactionMetaData, "hash");
  v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x200) != 0)
  {
    v82 = 2654435761 * self->_autocompleteResultCellType;
    if ((*(_DWORD *)&v29 & 0x2000000) != 0)
    {
LABEL_75:
      v81 = 2654435761 * self->_serverSectionIndex;
      if ((*(_DWORD *)&v29 & 0x1000000) != 0)
        goto LABEL_76;
      goto LABEL_84;
    }
  }
  else
  {
    v82 = 0;
    if ((*(_DWORD *)&v29 & 0x2000000) != 0)
      goto LABEL_75;
  }
  v81 = 0;
  if ((*(_DWORD *)&v29 & 0x1000000) != 0)
  {
LABEL_76:
    v80 = 2654435761 * self->_serverItemIndexInSection;
    if ((*(_DWORD *)&v29 & 0x8000000) != 0)
      goto LABEL_77;
LABEL_85:
    v79 = 0;
    if ((*(_BYTE *)&v29 & 2) != 0)
      goto LABEL_78;
LABEL_86:
    v34 = 0;
    goto LABEL_89;
  }
LABEL_84:
  v80 = 0;
  if ((*(_DWORD *)&v29 & 0x8000000) == 0)
    goto LABEL_85;
LABEL_77:
  v79 = 2654435761 * self->_tapBehavior;
  if ((*(_BYTE *)&v29 & 2) == 0)
    goto LABEL_86;
LABEL_78:
  distanceToSuggestionFromViewportCenter = self->_distanceToSuggestionFromViewportCenter;
  v31 = -distanceToSuggestionFromViewportCenter;
  if (distanceToSuggestionFromViewportCenter >= 0.0)
    v31 = self->_distanceToSuggestionFromViewportCenter;
  v32 = floor(v31 + 0.5);
  v33 = (v31 - v32) * 1.84467441e19;
  v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0)
      v34 += (unint64_t)v33;
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
LABEL_89:
  v99 = v8;
  if ((*(_BYTE *)&v29 & 0x40) != 0)
  {
    timeSinceLastInteractedSeconds = self->_timeSinceLastInteractedSeconds;
    v37 = -timeSinceLastInteractedSeconds;
    if (timeSinceLastInteractedSeconds >= 0.0)
      v37 = self->_timeSinceLastInteractedSeconds;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  if ((*(_QWORD *)&v29 & 0x800000000) != 0)
    v76 = 2654435761 * self->_isContainedInViewport;
  else
    v76 = 0;
  v77 = v35;
  v78 = v34;
  if ((*(_BYTE *)&v29 & 0x80) != 0)
  {
    timeSinceMapViewportChangedSeconds = self->_timeSinceMapViewportChangedSeconds;
    v42 = -timeSinceMapViewportChangedSeconds;
    if (timeSinceMapViewportChangedSeconds >= 0.0)
      v42 = self->_timeSinceMapViewportChangedSeconds;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  v75 = -[GEOHyperlinkMetaData hash](self->_hyperlinkMetadata, "hash");
  v45 = self->_flags;
  if ((*(_DWORD *)&v45 & 0x20000000) != 0)
  {
    v74 = 2654435761 * self->_isContactWithHomeLocation;
    if ((*(_QWORD *)&v45 & 0x400000000) != 0)
    {
LABEL_110:
      v73 = 2654435761 * self->_isContactWithWorkLocation;
      if ((*(_QWORD *)&v45 & 0x200000000) != 0)
        goto LABEL_111;
      goto LABEL_116;
    }
  }
  else
  {
    v74 = 0;
    if ((*(_QWORD *)&v45 & 0x400000000) != 0)
      goto LABEL_110;
  }
  v73 = 0;
  if ((*(_QWORD *)&v45 & 0x200000000) != 0)
  {
LABEL_111:
    v72 = 2654435761 * self->_isContactWithSchoolLocation;
    if ((*(_QWORD *)&v45 & 0x100000000) != 0)
      goto LABEL_112;
LABEL_117:
    v71 = 0;
    if ((*(_DWORD *)&v45 & 0x40000000) != 0)
      goto LABEL_113;
    goto LABEL_118;
  }
LABEL_116:
  v72 = 0;
  if ((*(_QWORD *)&v45 & 0x100000000) == 0)
    goto LABEL_117;
LABEL_112:
  v71 = 2654435761 * self->_isContactWithOtherLocation;
  if ((*(_DWORD *)&v45 & 0x40000000) != 0)
  {
LABEL_113:
    v46 = 2654435761 * self->_isContactWithLiveLocation;
    goto LABEL_119;
  }
LABEL_118:
  v46 = 0;
LABEL_119:
  v47 = v19;
  if ((*(_DWORD *)&v45 & 0x80000000) != 0)
    v48 = 2654435761 * self->_isContactWithNoLocation;
  else
    v48 = 0;
  v49 = v18;
  if ((*(_WORD *)&v45 & 0x2000) != 0)
  {
    prefixLastTokenMatchCover = self->_prefixLastTokenMatchCover;
    v52 = prefixLastTokenMatchCover;
    if (prefixLastTokenMatchCover < 0.0)
      v52 = -prefixLastTokenMatchCover;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  if ((*(_WORD *)&v45 & 0x4000) != 0)
  {
    prefixMatchCover = self->_prefixMatchCover;
    v57 = prefixMatchCover;
    if (prefixMatchCover < 0.0)
      v57 = -prefixMatchCover;
    v58 = floor(v57 + 0.5);
    v59 = (v57 - v58) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0)
        v55 += (unint64_t)v59;
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    v55 = 0;
  }
  if ((*(_WORD *)&v45 & 0x8000) != 0)
  {
    v60 = 2654435761 * self->_prefixMatchPosition;
    if ((*(_DWORD *)&v45 & 0x10000) != 0)
    {
LABEL_140:
      v61 = 2654435761 * self->_prefixMatchWordBoundary;
      if ((*(_DWORD *)&v45 & 0x20000) != 0)
        goto LABEL_141;
      goto LABEL_151;
    }
  }
  else
  {
    v60 = 0;
    if ((*(_DWORD *)&v45 & 0x10000) != 0)
      goto LABEL_140;
  }
  v61 = 0;
  if ((*(_DWORD *)&v45 & 0x20000) != 0)
  {
LABEL_141:
    v62 = 2654435761 * self->_prefixTokenMatchLengthFirstQueryToken;
    if ((*(_DWORD *)&v45 & 0x200000) != 0)
      goto LABEL_142;
    goto LABEL_152;
  }
LABEL_151:
  v62 = 0;
  if ((*(_DWORD *)&v45 & 0x200000) != 0)
  {
LABEL_142:
    v63 = 2654435761 * self->_prefixTokenMatchPositionFirstQueryToken;
    if ((*(_QWORD *)&v45 & 0x80000000000) != 0)
      goto LABEL_143;
    goto LABEL_153;
  }
LABEL_152:
  v63 = 0;
  if ((*(_QWORD *)&v45 & 0x80000000000) != 0)
  {
LABEL_143:
    v64 = 2654435761 * self->_prefixTokenIsNumberFirstQueryToken;
    if ((*(_DWORD *)&v45 & 0x80000) != 0)
      goto LABEL_144;
    goto LABEL_154;
  }
LABEL_153:
  v64 = 0;
  if ((*(_DWORD *)&v45 & 0x80000) != 0)
  {
LABEL_144:
    v65 = 2654435761 * self->_prefixTokenMatchLocationFirstQueryToken;
    if ((*(_DWORD *)&v45 & 0x40000) != 0)
      goto LABEL_145;
    goto LABEL_155;
  }
LABEL_154:
  v65 = 0;
  if ((*(_DWORD *)&v45 & 0x40000) != 0)
  {
LABEL_145:
    v66 = 2654435761 * self->_prefixTokenMatchLengthSecondQueryToken;
    if ((*(_DWORD *)&v45 & 0x400000) != 0)
      goto LABEL_146;
    goto LABEL_156;
  }
LABEL_155:
  v66 = 0;
  if ((*(_DWORD *)&v45 & 0x400000) != 0)
  {
LABEL_146:
    v67 = 2654435761 * self->_prefixTokenMatchPositionSecondQueryToken;
    if ((*(_QWORD *)&v45 & 0x100000000000) != 0)
      goto LABEL_147;
LABEL_157:
    v68 = 0;
    if ((*(_DWORD *)&v45 & 0x100000) != 0)
      goto LABEL_148;
LABEL_158:
    v69 = 0;
    return v100 ^ v101 ^ v99 ^ v98 ^ v13 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v49 ^ v47 ^ v87 ^ v86 ^ v84 ^ v85 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v40 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v46 ^ v48 ^ v50 ^ v55 ^ v60 ^ v61 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68 ^ v69;
  }
LABEL_156:
  v67 = 0;
  if ((*(_QWORD *)&v45 & 0x100000000000) == 0)
    goto LABEL_157;
LABEL_147:
  v68 = 2654435761 * self->_prefixTokenIsNumberSecondQueryToken;
  if ((*(_DWORD *)&v45 & 0x100000) == 0)
    goto LABEL_158;
LABEL_148:
  v69 = 2654435761 * self->_prefixTokenMatchLocationSecondQueryToken;
  return v100 ^ v101 ^ v99 ^ v98 ^ v13 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v49 ^ v47 ^ v87 ^ v86 ^ v84 ^ v85 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v40 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v46 ^ v48 ^ v50 ^ v55 ^ v60 ^ v61 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68 ^ v69;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  GEOSubactionMetaData *subactionMetaData;
  uint64_t v7;
  uint64_t v8;
  GEOHyperlinkMetaData *hyperlinkMetadata;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x4000000) != 0)
  {
    self->_suggestionType = *((_DWORD *)v12 + 47);
    *(_QWORD *)&self->_flags |= 0x4000000uLL;
    v5 = *((_QWORD *)v12 + 27);
    if ((v5 & 0x200000000000) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x200000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_shownToUser = *((_BYTE *)v12 + 213);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  self->_fractionOfMatch = *((double *)v12 + 4);
  *(_QWORD *)&self->_flags |= 4uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  self->_distanceToSuggestion = *((_DWORD *)v12 + 31);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000000000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  self->_contactRelevanceScore = *((double *)v12 + 2);
  *(_QWORD *)&self->_flags |= 1uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  self->_matchedUsingName = *((_BYTE *)v12 + 209);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000000000) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  self->_matchedUsingOrganization = *((_BYTE *)v12 + 210);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000000000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  self->_matchedUsingAddress = *((_BYTE *)v12 + 206);
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  self->_matchedUsingLabel = *((_BYTE *)v12 + 208);
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  self->_matchedUsingEventName = *((_BYTE *)v12 + 207);
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  self->_peopleSuggesterRank = *((_DWORD *)v12 + 32);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x800000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  self->_age = *((_DWORD *)v12 + 29);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x800000) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000000000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  self->_serverEntryType = *((_DWORD *)v12 + 44);
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  self->_isFavorite = *((_BYTE *)v12 + 204);
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  self->_poiOpenState = *((_DWORD *)v12 + 33);
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  self->_mapsSuggestionsContactRevelanceScore = *((double *)v12 + 6);
  *(_QWORD *)&self->_flags |= 8uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x20) == 0)
  {
LABEL_18:
    if ((v5 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  self->_mapsSuggestionsPoiRevelanceScore = *((double *)v12 + 8);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  v5 = *((_QWORD *)v12 + 27);
  if ((v5 & 0x10) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_45:
  self->_mapsSuggestionsIsTouristScore = *((double *)v12 + 7);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  if ((*((_QWORD *)v12 + 27) & 0x10000000) != 0)
  {
LABEL_20:
    self->_discreteFeatureValuesAvailable = *((_BYTE *)v12 + 196);
    *(_QWORD *)&self->_flags |= 0x10000000uLL;
  }
LABEL_21:
  if (*((_QWORD *)v12 + 10))
  {
    -[GEOClientACSuggestionEntry setSuggestionSectionType:](self, "setSuggestionSectionType:");
    v4 = v12;
  }
  if ((*((_BYTE *)v4 + 220) & 0x20) != 0)
  {
    self->_isProminentResult = *((_BYTE *)v4 + 205);
    *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  }
  subactionMetaData = self->_subactionMetaData;
  v7 = *((_QWORD *)v4 + 9);
  if (subactionMetaData)
  {
    if (!v7)
      goto LABEL_50;
    -[GEOSubactionMetaData mergeFrom:](subactionMetaData, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_50;
    -[GEOClientACSuggestionEntry setSubactionMetaData:](self, "setSubactionMetaData:");
  }
  v4 = v12;
LABEL_50:
  v8 = *((_QWORD *)v4 + 27);
  if ((v8 & 0x200) != 0)
  {
    self->_autocompleteResultCellType = *((_DWORD *)v4 + 30);
    *(_QWORD *)&self->_flags |= 0x200uLL;
    v8 = *((_QWORD *)v4 + 27);
    if ((v8 & 0x2000000) == 0)
    {
LABEL_52:
      if ((v8 & 0x1000000) == 0)
        goto LABEL_53;
      goto LABEL_64;
    }
  }
  else if ((v8 & 0x2000000) == 0)
  {
    goto LABEL_52;
  }
  self->_serverSectionIndex = *((_DWORD *)v4 + 46);
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  v8 = *((_QWORD *)v4 + 27);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x8000000) == 0)
      goto LABEL_54;
    goto LABEL_65;
  }
LABEL_64:
  self->_serverItemIndexInSection = *((_DWORD *)v4 + 45);
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  v8 = *((_QWORD *)v4 + 27);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_54:
    if ((v8 & 2) == 0)
      goto LABEL_55;
    goto LABEL_66;
  }
LABEL_65:
  self->_tapBehavior = *((_DWORD *)v4 + 48);
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  v8 = *((_QWORD *)v4 + 27);
  if ((v8 & 2) == 0)
  {
LABEL_55:
    if ((v8 & 0x40) == 0)
      goto LABEL_56;
    goto LABEL_67;
  }
LABEL_66:
  self->_distanceToSuggestionFromViewportCenter = *((double *)v4 + 3);
  *(_QWORD *)&self->_flags |= 2uLL;
  v8 = *((_QWORD *)v4 + 27);
  if ((v8 & 0x40) == 0)
  {
LABEL_56:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_57;
    goto LABEL_68;
  }
LABEL_67:
  self->_timeSinceLastInteractedSeconds = *((double *)v4 + 11);
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v8 = *((_QWORD *)v4 + 27);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_57:
    if ((v8 & 0x80) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_68:
  self->_isContainedInViewport = *((_BYTE *)v4 + 203);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  if ((*((_QWORD *)v4 + 27) & 0x80) != 0)
  {
LABEL_58:
    self->_timeSinceMapViewportChangedSeconds = *((double *)v4 + 12);
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
LABEL_59:
  hyperlinkMetadata = self->_hyperlinkMetadata;
  v10 = *((_QWORD *)v4 + 5);
  if (hyperlinkMetadata)
  {
    if (!v10)
      goto LABEL_73;
    -[GEOHyperlinkMetaData mergeFrom:](hyperlinkMetadata, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_73;
    -[GEOClientACSuggestionEntry setHyperlinkMetadata:](self, "setHyperlinkMetadata:");
  }
  v4 = v12;
LABEL_73:
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x20000000) != 0)
  {
    self->_isContactWithHomeLocation = *((_BYTE *)v4 + 197);
    *(_QWORD *)&self->_flags |= 0x20000000uLL;
    v11 = *((_QWORD *)v4 + 27);
    if ((v11 & 0x400000000) == 0)
    {
LABEL_75:
      if ((v11 & 0x200000000) == 0)
        goto LABEL_76;
      goto LABEL_95;
    }
  }
  else if ((v11 & 0x400000000) == 0)
  {
    goto LABEL_75;
  }
  self->_isContactWithWorkLocation = *((_BYTE *)v4 + 202);
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x200000000) == 0)
  {
LABEL_76:
    if ((v11 & 0x100000000) == 0)
      goto LABEL_77;
    goto LABEL_96;
  }
LABEL_95:
  self->_isContactWithSchoolLocation = *((_BYTE *)v4 + 201);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_78;
    goto LABEL_97;
  }
LABEL_96:
  self->_isContactWithOtherLocation = *((_BYTE *)v4 + 200);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_78:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_79;
    goto LABEL_98;
  }
LABEL_97:
  self->_isContactWithLiveLocation = *((_BYTE *)v4 + 198);
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_79:
    if ((v11 & 0x2000) == 0)
      goto LABEL_80;
    goto LABEL_99;
  }
LABEL_98:
  self->_isContactWithNoLocation = *((_BYTE *)v4 + 199);
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x2000) == 0)
  {
LABEL_80:
    if ((v11 & 0x4000) == 0)
      goto LABEL_81;
    goto LABEL_100;
  }
LABEL_99:
  self->_prefixLastTokenMatchCover = *((float *)v4 + 34);
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x4000) == 0)
  {
LABEL_81:
    if ((v11 & 0x8000) == 0)
      goto LABEL_82;
    goto LABEL_101;
  }
LABEL_100:
  self->_prefixMatchCover = *((float *)v4 + 35);
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x8000) == 0)
  {
LABEL_82:
    if ((v11 & 0x10000) == 0)
      goto LABEL_83;
    goto LABEL_102;
  }
LABEL_101:
  self->_prefixMatchPosition = *((_DWORD *)v4 + 36);
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x10000) == 0)
  {
LABEL_83:
    if ((v11 & 0x20000) == 0)
      goto LABEL_84;
    goto LABEL_103;
  }
LABEL_102:
  self->_prefixMatchWordBoundary = *((_DWORD *)v4 + 37);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x20000) == 0)
  {
LABEL_84:
    if ((v11 & 0x200000) == 0)
      goto LABEL_85;
    goto LABEL_104;
  }
LABEL_103:
  self->_prefixTokenMatchLengthFirstQueryToken = *((_DWORD *)v4 + 38);
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x200000) == 0)
  {
LABEL_85:
    if ((v11 & 0x80000000000) == 0)
      goto LABEL_86;
    goto LABEL_105;
  }
LABEL_104:
  self->_prefixTokenMatchPositionFirstQueryToken = *((_DWORD *)v4 + 42);
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x80000000000) == 0)
  {
LABEL_86:
    if ((v11 & 0x80000) == 0)
      goto LABEL_87;
    goto LABEL_106;
  }
LABEL_105:
  self->_prefixTokenIsNumberFirstQueryToken = *((_BYTE *)v4 + 211);
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x80000) == 0)
  {
LABEL_87:
    if ((v11 & 0x40000) == 0)
      goto LABEL_88;
    goto LABEL_107;
  }
LABEL_106:
  self->_prefixTokenMatchLocationFirstQueryToken = *((_DWORD *)v4 + 40);
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x40000) == 0)
  {
LABEL_88:
    if ((v11 & 0x400000) == 0)
      goto LABEL_89;
    goto LABEL_108;
  }
LABEL_107:
  self->_prefixTokenMatchLengthSecondQueryToken = *((_DWORD *)v4 + 39);
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x400000) == 0)
  {
LABEL_89:
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_90;
LABEL_109:
    self->_prefixTokenIsNumberSecondQueryToken = *((_BYTE *)v4 + 212);
    *(_QWORD *)&self->_flags |= 0x100000000000uLL;
    if ((*((_QWORD *)v4 + 27) & 0x100000) == 0)
      goto LABEL_92;
    goto LABEL_91;
  }
LABEL_108:
  self->_prefixTokenMatchPositionSecondQueryToken = *((_DWORD *)v4 + 43);
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  v11 = *((_QWORD *)v4 + 27);
  if ((v11 & 0x100000000000) != 0)
    goto LABEL_109;
LABEL_90:
  if ((v11 & 0x100000) != 0)
  {
LABEL_91:
    self->_prefixTokenMatchLocationSecondQueryToken = *((_DWORD *)v4 + 41);
    *(_QWORD *)&self->_flags |= 0x100000uLL;
  }
LABEL_92:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionSectionType, 0);
  objc_storeStrong((id *)&self->_subactionMetaData, 0);
  objc_storeStrong((id *)&self->_hyperlinkMetadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
