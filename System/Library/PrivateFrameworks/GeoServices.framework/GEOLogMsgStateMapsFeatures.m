@implementation GEOLogMsgStateMapsFeatures

- (BOOL)homeFavoriteSet
{
  return self->_homeFavoriteSet;
}

- (void)setHomeFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_homeFavoriteSet = a3;
}

- (void)setHasHomeFavoriteSet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasHomeFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (BOOL)workFavoriteSet
{
  return self->_workFavoriteSet;
}

- (void)setWorkFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_workFavoriteSet = a3;
}

- (void)setHasWorkFavoriteSet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasWorkFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (BOOL)schoolFavoriteSet
{
  return self->_schoolFavoriteSet;
}

- (void)setSchoolFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_schoolFavoriteSet = a3;
}

- (void)setHasSchoolFavoriteSet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasSchoolFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (int)favoritesCount
{
  return self->_favoritesCount;
}

- (void)setFavoritesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_favoritesCount = a3;
}

- (void)setHasFavoritesCount:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasFavoritesCount
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)personalCollectionsCount
{
  return self->_personalCollectionsCount;
}

- (void)setPersonalCollectionsCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_personalCollectionsCount = a3;
}

- (void)setHasPersonalCollectionsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasPersonalCollectionsCount
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)savedCollectionsCount
{
  return self->_savedCollectionsCount;
}

- (void)setSavedCollectionsCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_savedCollectionsCount = a3;
}

- (void)setHasSavedCollectionsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasSavedCollectionsCount
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)followedPublisherCount
{
  return self->_followedPublisherCount;
}

- (void)setFollowedPublisherCount:(int)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_followedPublisherCount = a3;
}

- (void)setHasFollowedPublisherCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasFollowedPublisherCount
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)submittedRatingsCount
{
  return self->_submittedRatingsCount;
}

- (void)setSubmittedRatingsCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_submittedRatingsCount = a3;
}

- (void)setHasSubmittedRatingsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasSubmittedRatingsCount
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (int)submittedPhotosCount
{
  return self->_submittedPhotosCount;
}

- (void)setSubmittedPhotosCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_submittedPhotosCount = a3;
}

- (void)setHasSubmittedPhotosCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasSubmittedPhotosCount
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (BOOL)transitFavoriteSet
{
  return self->_transitFavoriteSet;
}

- (void)setTransitFavoriteSet:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_transitFavoriteSet = a3;
}

- (void)setHasTransitFavoriteSet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasTransitFavoriteSet
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (int)librarySavedPlacesCount
{
  return self->_librarySavedPlacesCount;
}

- (void)setLibrarySavedPlacesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_librarySavedPlacesCount = a3;
}

- (void)setHasLibrarySavedPlacesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasLibrarySavedPlacesCount
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (int)libraryPlacesWithNoteCount
{
  return self->_libraryPlacesWithNoteCount;
}

- (void)setLibraryPlacesWithNoteCount:(int)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_libraryPlacesWithNoteCount = a3;
}

- (void)setHasLibraryPlacesWithNoteCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLibraryPlacesWithNoteCount
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)libraryGuidesSavedPlacesCount
{
  return self->_libraryGuidesSavedPlacesCount;
}

- (void)setLibraryGuidesSavedPlacesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_libraryGuidesSavedPlacesCount = a3;
}

- (void)setHasLibraryGuidesSavedPlacesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLibraryGuidesSavedPlacesCount
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)libraryFavoritesGuideSavedPlacesCount
{
  return self->_libraryFavoritesGuideSavedPlacesCount;
}

- (void)setLibraryFavoritesGuideSavedPlacesCount:(int)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_libraryFavoritesGuideSavedPlacesCount = a3;
}

- (void)setHasLibraryFavoritesGuideSavedPlacesCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLibraryFavoritesGuideSavedPlacesCount
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateMapsFeatures;
  -[GEOLogMsgStateMapsFeatures description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapsFeatures dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapsFeatures _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("homeFavoriteSet");
    else
      v7 = CFSTR("home_favorite_set");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 52);
  }
  if ((v5 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 51));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("workFavoriteSet");
    else
      v9 = CFSTR("work_favorite_set");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_WORD *)(a1 + 52);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("schoolFavoriteSet");
  else
    v11 = CFSTR("school_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("favoritesCount");
  else
    v13 = CFSTR("favorites_count");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("personalCollectionsCount");
  else
    v15 = CFSTR("personal_collections_count");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 36));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("savedCollectionsCount");
  else
    v17 = CFSTR("saved_collections_count");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 12));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("followedPublisherCount");
  else
    v19 = CFSTR("followed_publisher_count");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("submittedRatingsCount");
  else
    v21 = CFSTR("submitted_ratings_count");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("submittedPhotosCount");
  else
    v23 = CFSTR("submitted_photos_count");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 50));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("transitFavoriteSet");
  else
    v25 = CFSTR("transit_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 28));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("librarySavedPlacesCount");
  else
    v27 = CFSTR("library_saved_places_count");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_18:
    if ((v5 & 8) == 0)
      goto LABEL_19;
    goto LABEL_65;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 24));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("libraryPlacesWithNoteCount");
  else
    v29 = CFSTR("library_places_with_note_count");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_19:
    if ((v5 & 4) == 0)
      return v4;
    goto LABEL_69;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("libraryGuidesSavedPlacesCount");
  else
    v31 = CFSTR("library_guides_saved_places_count");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  if ((*(_WORD *)(a1 + 52) & 4) != 0)
  {
LABEL_69:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("libraryFavoritesGuideSavedPlacesCount");
    else
      v33 = CFSTR("library_favorites_guide_saved_places_count");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapsFeatures _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapsFeatures)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapsFeatures *)-[GEOLogMsgStateMapsFeatures _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
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
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("homeFavoriteSet");
      else
        v6 = CFSTR("home_favorite_set");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHomeFavoriteSet:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("workFavoriteSet");
      else
        v8 = CFSTR("work_favorite_set");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWorkFavoriteSet:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("schoolFavoriteSet");
      else
        v10 = CFSTR("school_favorite_set");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSchoolFavoriteSet:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("favoritesCount");
      else
        v12 = CFSTR("favorites_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFavoritesCount:", objc_msgSend(v13, "intValue"));

      if (a3)
        v14 = CFSTR("personalCollectionsCount");
      else
        v14 = CFSTR("personal_collections_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPersonalCollectionsCount:", objc_msgSend(v15, "intValue"));

      if (a3)
        v16 = CFSTR("savedCollectionsCount");
      else
        v16 = CFSTR("saved_collections_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSavedCollectionsCount:", objc_msgSend(v17, "intValue"));

      if (a3)
        v18 = CFSTR("followedPublisherCount");
      else
        v18 = CFSTR("followed_publisher_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFollowedPublisherCount:", objc_msgSend(v19, "intValue"));

      if (a3)
        v20 = CFSTR("submittedRatingsCount");
      else
        v20 = CFSTR("submitted_ratings_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSubmittedRatingsCount:", objc_msgSend(v21, "intValue"));

      if (a3)
        v22 = CFSTR("submittedPhotosCount");
      else
        v22 = CFSTR("submitted_photos_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSubmittedPhotosCount:", objc_msgSend(v23, "intValue"));

      if (a3)
        v24 = CFSTR("transitFavoriteSet");
      else
        v24 = CFSTR("transit_favorite_set");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitFavoriteSet:", objc_msgSend(v25, "BOOLValue"));

      if (a3)
        v26 = CFSTR("librarySavedPlacesCount");
      else
        v26 = CFSTR("library_saved_places_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLibrarySavedPlacesCount:", objc_msgSend(v27, "intValue"));

      if (a3)
        v28 = CFSTR("libraryPlacesWithNoteCount");
      else
        v28 = CFSTR("library_places_with_note_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLibraryPlacesWithNoteCount:", objc_msgSend(v29, "intValue"));

      if (a3)
        v30 = CFSTR("libraryGuidesSavedPlacesCount");
      else
        v30 = CFSTR("library_guides_saved_places_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLibraryGuidesSavedPlacesCount:", objc_msgSend(v31, "intValue"));

      if (a3)
        v32 = CFSTR("libraryFavoritesGuideSavedPlacesCount");
      else
        v32 = CFSTR("library_favorites_guide_saved_places_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLibraryFavoritesGuideSavedPlacesCount:", objc_msgSend(v33, "intValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateMapsFeatures)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapsFeatures *)-[GEOLogMsgStateMapsFeatures _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapsFeaturesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapsFeaturesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  id v5;

  v5 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_10:
    if ((flags & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_13:
    if ((flags & 8) == 0)
      goto LABEL_14;
LABEL_29:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((flags & 4) != 0)
LABEL_15:
    PBDataWriterWriteInt32Field();
LABEL_16:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateMapsFeatures readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    v5[48] = self->_homeFavoriteSet;
    *((_WORD *)v5 + 26) |= 0x400u;
    flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v5[51] = self->_workFavoriteSet;
  *((_WORD *)v5 + 26) |= 0x2000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v5[49] = self->_schoolFavoriteSet;
  *((_WORD *)v5 + 26) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 2) = self->_favoritesCount;
  *((_WORD *)v5 + 26) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 8) = self->_personalCollectionsCount;
  *((_WORD *)v5 + 26) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 9) = self->_savedCollectionsCount;
  *((_WORD *)v5 + 26) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 3) = self->_followedPublisherCount;
  *((_WORD *)v5 + 26) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 11) = self->_submittedRatingsCount;
  *((_WORD *)v5 + 26) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_10:
    if ((flags & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 10) = self->_submittedPhotosCount;
  *((_WORD *)v5 + 26) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v5[50] = self->_transitFavoriteSet;
  *((_WORD *)v5 + 26) |= 0x1000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 7) = self->_librarySavedPlacesCount;
  *((_WORD *)v5 + 26) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_13:
    if ((flags & 8) == 0)
      goto LABEL_14;
LABEL_29:
    *((_DWORD *)v5 + 5) = self->_libraryGuidesSavedPlacesCount;
    *((_WORD *)v5 + 26) |= 8u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  *((_DWORD *)v5 + 6) = self->_libraryPlacesWithNoteCount;
  *((_WORD *)v5 + 26) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((flags & 4) != 0)
  {
LABEL_15:
    *((_DWORD *)v5 + 4) = self->_libraryFavoritesGuideSavedPlacesCount;
    *((_WORD *)v5 + 26) |= 4u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    *((_BYTE *)result + 48) = self->_homeFavoriteSet;
    *((_WORD *)result + 26) |= 0x400u;
    flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 51) = self->_workFavoriteSet;
  *((_WORD *)result + 26) |= 0x2000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)result + 49) = self->_schoolFavoriteSet;
  *((_WORD *)result + 26) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 2) = self->_favoritesCount;
  *((_WORD *)result + 26) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 8) = self->_personalCollectionsCount;
  *((_WORD *)result + 26) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 9) = self->_savedCollectionsCount;
  *((_WORD *)result + 26) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 3) = self->_followedPublisherCount;
  *((_WORD *)result + 26) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 11) = self->_submittedRatingsCount;
  *((_WORD *)result + 26) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_10:
    if ((flags & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 10) = self->_submittedPhotosCount;
  *((_WORD *)result + 26) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)result + 50) = self->_transitFavoriteSet;
  *((_WORD *)result + 26) |= 0x1000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 7) = self->_librarySavedPlacesCount;
  *((_WORD *)result + 26) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_13:
    if ((flags & 8) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 6) = self->_libraryPlacesWithNoteCount;
  *((_WORD *)result + 26) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_14:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 5) = self->_libraryGuidesSavedPlacesCount;
  *((_WORD *)result + 26) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) == 0)
    return result;
LABEL_15:
  *((_DWORD *)result + 4) = self->_libraryFavoritesGuideSavedPlacesCount;
  *((_WORD *)result + 26) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_84;
  -[GEOLogMsgStateMapsFeatures readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 26);
  if ((flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0)
      goto LABEL_84;
    if (self->_homeFavoriteSet)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x2000) == 0)
      goto LABEL_84;
    if (self->_workFavoriteSet)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x2000) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x800) == 0)
      goto LABEL_84;
    if (self->_schoolFavoriteSet)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_84;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x800) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_favoritesCount != *((_DWORD *)v4 + 2))
      goto LABEL_84;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_personalCollectionsCount != *((_DWORD *)v4 + 8))
      goto LABEL_84;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_savedCollectionsCount != *((_DWORD *)v4 + 9))
      goto LABEL_84;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_followedPublisherCount != *((_DWORD *)v4 + 3))
      goto LABEL_84;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_submittedRatingsCount != *((_DWORD *)v4 + 11))
      goto LABEL_84;
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_submittedPhotosCount != *((_DWORD *)v4 + 10))
      goto LABEL_84;
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x1000) != 0)
    {
      if (self->_transitFavoriteSet)
      {
        if (!*((_BYTE *)v4 + 50))
          goto LABEL_84;
        goto LABEL_64;
      }
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_64;
    }
LABEL_84:
    v7 = 0;
    goto LABEL_85;
  }
  if ((*((_WORD *)v4 + 26) & 0x1000) != 0)
    goto LABEL_84;
LABEL_64:
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_librarySavedPlacesCount != *((_DWORD *)v4 + 7))
      goto LABEL_84;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_libraryPlacesWithNoteCount != *((_DWORD *)v4 + 6))
      goto LABEL_84;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_libraryGuidesSavedPlacesCount != *((_DWORD *)v4 + 5))
      goto LABEL_84;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_libraryFavoritesGuideSavedPlacesCount != *((_DWORD *)v4 + 4))
      goto LABEL_84;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 4) == 0;
  }
LABEL_85:

  return v7;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  -[GEOLogMsgStateMapsFeatures readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    v4 = 2654435761 * self->_homeFavoriteSet;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_workFavoriteSet;
      if ((*(_WORD *)&self->_flags & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_schoolFavoriteSet;
    if ((flags & 1) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((flags & 1) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_favoritesCount;
    if ((flags & 0x40) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_personalCollectionsCount;
    if ((flags & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_savedCollectionsCount;
    if ((flags & 2) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((flags & 2) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_followedPublisherCount;
    if ((*(_WORD *)&self->_flags & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_submittedRatingsCount;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_submittedPhotosCount;
    if ((*(_WORD *)&self->_flags & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_11:
    v13 = 2654435761 * self->_transitFavoriteSet;
    if ((flags & 0x20) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v13 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_12:
    v14 = 2654435761 * self->_librarySavedPlacesCount;
    if ((flags & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v14 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_13:
    v15 = 2654435761 * self->_libraryPlacesWithNoteCount;
    if ((flags & 8) != 0)
      goto LABEL_14;
LABEL_28:
    v16 = 0;
    if ((flags & 4) != 0)
      goto LABEL_15;
LABEL_29:
    v17 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_27:
  v15 = 0;
  if ((flags & 8) == 0)
    goto LABEL_28;
LABEL_14:
  v16 = 2654435761 * self->_libraryGuidesSavedPlacesCount;
  if ((flags & 4) == 0)
    goto LABEL_29;
LABEL_15:
  v17 = 2654435761 * self->_libraryFavoritesGuideSavedPlacesCount;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x400) != 0)
  {
    self->_homeFavoriteSet = *((_BYTE *)v5 + 48);
    *(_WORD *)&self->_flags |= 0x400u;
    v4 = *((_WORD *)v5 + 26);
    if ((v4 & 0x2000) == 0)
    {
LABEL_3:
      if ((v4 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v5 + 26) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_workFavoriteSet = *((_BYTE *)v5 + 51);
  *(_WORD *)&self->_flags |= 0x2000u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x800) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_schoolFavoriteSet = *((_BYTE *)v5 + 49);
  *(_WORD *)&self->_flags |= 0x800u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_favoritesCount = *((_DWORD *)v5 + 2);
  *(_WORD *)&self->_flags |= 1u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x40) == 0)
  {
LABEL_6:
    if ((v4 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_personalCollectionsCount = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_flags |= 0x40u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x80) == 0)
  {
LABEL_7:
    if ((v4 & 2) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_savedCollectionsCount = *((_DWORD *)v5 + 9);
  *(_WORD *)&self->_flags |= 0x80u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 2) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_followedPublisherCount = *((_DWORD *)v5 + 3);
  *(_WORD *)&self->_flags |= 2u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_submittedRatingsCount = *((_DWORD *)v5 + 11);
  *(_WORD *)&self->_flags |= 0x200u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_submittedPhotosCount = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_flags |= 0x100u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x1000) == 0)
  {
LABEL_11:
    if ((v4 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_transitFavoriteSet = *((_BYTE *)v5 + 50);
  *(_WORD *)&self->_flags |= 0x1000u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x20) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_librarySavedPlacesCount = *((_DWORD *)v5 + 7);
  *(_WORD *)&self->_flags |= 0x20u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 0x10) == 0)
  {
LABEL_13:
    if ((v4 & 8) == 0)
      goto LABEL_14;
LABEL_29:
    self->_libraryGuidesSavedPlacesCount = *((_DWORD *)v5 + 5);
    *(_WORD *)&self->_flags |= 8u;
    if ((*((_WORD *)v5 + 26) & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  self->_libraryPlacesWithNoteCount = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_flags |= 0x10u;
  v4 = *((_WORD *)v5 + 26);
  if ((v4 & 8) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v4 & 4) != 0)
  {
LABEL_15:
    self->_libraryFavoritesGuideSavedPlacesCount = *((_DWORD *)v5 + 4);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_16:

}

@end
