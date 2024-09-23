@implementation ATXMPBScreenLogUnlockSessionTracker

- (void)setSessionLengthInSeconds:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sessionLengthInSeconds = a3;
}

- (void)setHasSessionLengthInSeconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSessionLengthInSeconds
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNumEngagementsInSpotlightApps:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_numEngagementsInSpotlightApps = a3;
}

- (void)setHasNumEngagementsInSpotlightApps:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNumEngagementsInSpotlightApps
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumEngagementsInSpotlightActions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_numEngagementsInSpotlightActions = a3;
}

- (void)setHasNumEngagementsInSpotlightActions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNumEngagementsInSpotlightActions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumEngagementsInSuggestionsWidget:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_numEngagementsInSuggestionsWidget = a3;
}

- (void)setHasNumEngagementsInSuggestionsWidget:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumEngagementsInSuggestionsWidget
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumEngagementsInAppPredictionPanel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_numEngagementsInAppPredictionPanel = a3;
}

- (void)setHasNumEngagementsInAppPredictionPanel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNumEngagementsInAppPredictionPanel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumEngagementsInAppLibrary:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_numEngagementsInAppLibrary = a3;
}

- (void)setHasNumEngagementsInAppLibrary:(BOOL)a3
{
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasNumEngagementsInAppLibrary
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_spotlightEnabled = a3;
}

- (void)setHasSpotlightEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSpotlightEnabled
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSuggestionsWidgetEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_suggestionsWidgetEnabled = a3;
}

- (void)setHasSuggestionsWidgetEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSuggestionsWidgetEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAppPredictionPanelEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_appPredictionPanelEnabled = a3;
}

- (void)setHasAppPredictionPanelEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasAppPredictionPanelEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_appLibraryEnabled = a3;
}

- (void)setHasAppLibraryEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasAppLibraryEnabled
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setSpotlightAppsViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_spotlightAppsViewed = a3;
}

- (void)setHasSpotlightAppsViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSpotlightAppsViewed
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSpotlightActionsViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_spotlightActionsViewed = a3;
}

- (void)setHasSpotlightActionsViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSpotlightActionsViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSuggestionsWidgetViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_suggestionsWidgetViewed = a3;
}

- (void)setHasSuggestionsWidgetViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSuggestionsWidgetViewed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAppPredictionPanelViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_appPredictionPanelViewed = a3;
}

- (void)setHasAppPredictionPanelViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAppPredictionPanelViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAppLibraryViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_appLibraryViewed = a3;
}

- (void)setHasAppLibraryViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasAppLibraryViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSuggestionsWidgetTodayPageViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_suggestionsWidgetTodayPageViewed = a3;
}

- (void)setHasSuggestionsWidgetTodayPageViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSuggestionsWidgetTodayPageViewed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAppPredictionPanelTodayPageViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_appPredictionPanelTodayPageViewed = a3;
}

- (void)setHasAppPredictionPanelTodayPageViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAppPredictionPanelTodayPageViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumEngagementsInSuggestionsWidgetTodayPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numEngagementsInSuggestionsWidgetTodayPage = a3;
}

- (void)setHasNumEngagementsInSuggestionsWidgetTodayPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNumEngagementsInSuggestionsWidgetTodayPage
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumEngagementsInAppPredictionPanelTodayPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numEngagementsInAppPredictionPanelTodayPage = a3;
}

- (void)setHasNumEngagementsInAppPredictionPanelTodayPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumEngagementsInAppPredictionPanelTodayPage
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSuggestionsWidgetTodayPageEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_suggestionsWidgetTodayPageEnabled = a3;
}

- (void)setHasSuggestionsWidgetTodayPageEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSuggestionsWidgetTodayPageEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setAppPredictionPanelTodayPageEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_appPredictionPanelTodayPageEnabled = a3;
}

- (void)setHasAppPredictionPanelTodayPageEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAppPredictionPanelTodayPageEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
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
  v8.super_class = (Class)ATXMPBScreenLogUnlockSessionTracker;
  -[ATXMPBScreenLogUnlockSessionTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBScreenLogUnlockSessionTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $DEF734E8A820C4B152ECF3079B765D50 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sessionLengthInSeconds);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sessionLengthInSeconds"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInSpotlightApps);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("numEngagementsInSpotlightApps"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInSpotlightActions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numEngagementsInSpotlightActions"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInSuggestionsWidget);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numEngagementsInSuggestionsWidget"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInAppPredictionPanel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("numEngagementsInAppPredictionPanel"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInAppLibrary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("numEngagementsInAppLibrary"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spotlightEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("spotlightEnabled"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionsWidgetEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("suggestionsWidgetEnabled"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appPredictionPanelEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("appPredictionPanelEnabled"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appLibraryEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("appLibraryEnabled"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spotlightAppsViewed);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("spotlightAppsViewed"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spotlightActionsViewed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("spotlightActionsViewed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionsWidgetViewed);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("suggestionsWidgetViewed"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appPredictionPanelViewed);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("appPredictionPanelViewed"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appLibraryViewed);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("appLibraryViewed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionsWidgetTodayPageViewed);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("suggestionsWidgetTodayPageViewed"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appPredictionPanelTodayPageViewed);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("appPredictionPanelTodayPageViewed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInSuggestionsWidgetTodayPage);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("numEngagementsInSuggestionsWidgetTodayPage"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionsWidgetTodayPageEnabled);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("suggestionsWidgetTodayPageEnabled"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return v3;
    goto LABEL_22;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEngagementsInAppPredictionPanelTodayPage);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("numEngagementsInAppPredictionPanelTodayPage"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appPredictionPanelTodayPageEnabled);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("appPredictionPanelTodayPageEnabled"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBScreenLogUnlockSessionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $DEF734E8A820C4B152ECF3079B765D50 has;
  id v5;

  v5 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
LABEL_43:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_WORD *)&has & 0x800) != 0)
LABEL_22:
    PBDataWriterWriteBOOLField();
LABEL_23:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $DEF734E8A820C4B152ECF3079B765D50 has;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v4[9] = self->_sessionLengthInSeconds;
    v4[14] |= 0x80u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_numEngagementsInSpotlightApps;
  v4[14] |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v4[5] = self->_numEngagementsInSpotlightActions;
  v4[14] |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v4[7] = self->_numEngagementsInSuggestionsWidget;
  v4[14] |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v4[3] = self->_numEngagementsInAppPredictionPanel;
  v4[14] |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v4[2] = self->_numEngagementsInAppLibrary;
  v4[14] |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)v4 + 48) = self->_spotlightEnabled;
  v4[14] |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_BYTE *)v4 + 49) = self->_suggestionsWidgetEnabled;
  v4[14] |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_BYTE *)v4 + 42) = self->_appPredictionPanelEnabled;
  v4[14] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_BYTE *)v4 + 40) = self->_appLibraryEnabled;
  v4[14] |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_BYTE *)v4 + 47) = self->_spotlightAppsViewed;
  v4[14] |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_BYTE *)v4 + 46) = self->_spotlightActionsViewed;
  v4[14] |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)v4 + 52) = self->_suggestionsWidgetViewed;
  v4[14] |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)v4 + 45) = self->_appPredictionPanelViewed;
  v4[14] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v4 + 41) = self->_appLibraryViewed;
  v4[14] |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)v4 + 51) = self->_suggestionsWidgetTodayPageViewed;
  v4[14] |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 44) = self->_appPredictionPanelTodayPageViewed;
  v4[14] |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  v4[8] = self->_numEngagementsInSuggestionsWidgetTodayPage;
  v4[14] |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
LABEL_43:
    *((_BYTE *)v4 + 50) = self->_suggestionsWidgetTodayPageEnabled;
    v4[14] |= 0x40000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  v4[4] = self->_numEngagementsInAppPredictionPanelTodayPage;
  v4[14] |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
    goto LABEL_43;
LABEL_21:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_22:
    *((_BYTE *)v4 + 43) = self->_appPredictionPanelTodayPageEnabled;
    v4[14] |= 0x800u;
  }
LABEL_23:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  $DEF734E8A820C4B152ECF3079B765D50 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *((_DWORD *)result + 9) = self->_sessionLengthInSeconds;
    *((_DWORD *)result + 14) |= 0x80u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_numEngagementsInSpotlightApps;
  *((_DWORD *)result + 14) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 5) = self->_numEngagementsInSpotlightActions;
  *((_DWORD *)result + 14) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 7) = self->_numEngagementsInSuggestionsWidget;
  *((_DWORD *)result + 14) |= 0x20u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 3) = self->_numEngagementsInAppPredictionPanel;
  *((_DWORD *)result + 14) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 2) = self->_numEngagementsInAppLibrary;
  *((_DWORD *)result + 14) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)result + 48) = self->_spotlightEnabled;
  *((_DWORD *)result + 14) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_BYTE *)result + 49) = self->_suggestionsWidgetEnabled;
  *((_DWORD *)result + 14) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_BYTE *)result + 42) = self->_appPredictionPanelEnabled;
  *((_DWORD *)result + 14) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_BYTE *)result + 40) = self->_appLibraryEnabled;
  *((_DWORD *)result + 14) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_BYTE *)result + 47) = self->_spotlightAppsViewed;
  *((_DWORD *)result + 14) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_BYTE *)result + 46) = self->_spotlightActionsViewed;
  *((_DWORD *)result + 14) |= 0x4000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)result + 52) = self->_suggestionsWidgetViewed;
  *((_DWORD *)result + 14) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)result + 45) = self->_appPredictionPanelViewed;
  *((_DWORD *)result + 14) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)result + 41) = self->_appLibraryViewed;
  *((_DWORD *)result + 14) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)result + 51) = self->_suggestionsWidgetTodayPageViewed;
  *((_DWORD *)result + 14) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)result + 44) = self->_appPredictionPanelTodayPageViewed;
  *((_DWORD *)result + 14) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 8) = self->_numEngagementsInSuggestionsWidgetTodayPage;
  *((_DWORD *)result + 14) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 4) = self->_numEngagementsInAppPredictionPanelTodayPage;
  *((_DWORD *)result + 14) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0)
      return result;
    goto LABEL_22;
  }
LABEL_43:
  *((_BYTE *)result + 50) = self->_suggestionsWidgetTodayPageEnabled;
  *((_DWORD *)result + 14) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    return result;
LABEL_22:
  *((_BYTE *)result + 43) = self->_appPredictionPanelTodayPageEnabled;
  *((_DWORD *)result + 14) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $DEF734E8A820C4B152ECF3079B765D50 has;
  int v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_141;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 14);
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sessionLengthInSeconds != *((_DWORD *)v4 + 9))
      goto LABEL_141;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numEngagementsInSpotlightApps != *((_DWORD *)v4 + 6))
      goto LABEL_141;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_numEngagementsInSpotlightActions != *((_DWORD *)v4 + 5))
      goto LABEL_141;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numEngagementsInSuggestionsWidget != *((_DWORD *)v4 + 7))
      goto LABEL_141;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numEngagementsInAppPredictionPanel != *((_DWORD *)v4 + 3))
      goto LABEL_141;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_numEngagementsInAppLibrary != *((_DWORD *)v4 + 2))
      goto LABEL_141;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_141;
    if (self->_spotlightEnabled)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0)
      goto LABEL_141;
    if (self->_suggestionsWidgetEnabled)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0)
      goto LABEL_141;
    if (self->_appPredictionPanelEnabled)
    {
      if (!*((_BYTE *)v4 + 42))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 42))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_141;
    if (self->_appLibraryEnabled)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0)
      goto LABEL_141;
    if (self->_spotlightAppsViewed)
    {
      if (!*((_BYTE *)v4 + 47))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 47))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0)
      goto LABEL_141;
    if (self->_spotlightActionsViewed)
    {
      if (!*((_BYTE *)v4 + 46))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 46))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0)
      goto LABEL_141;
    if (self->_suggestionsWidgetViewed)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_141;
    if (self->_appPredictionPanelViewed)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0)
      goto LABEL_141;
    if (self->_appLibraryViewed)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0)
      goto LABEL_141;
    if (self->_suggestionsWidgetTodayPageViewed)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0)
      goto LABEL_141;
    if (self->_appPredictionPanelTodayPageViewed)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numEngagementsInSuggestionsWidgetTodayPage != *((_DWORD *)v4 + 8))
      goto LABEL_141;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numEngagementsInAppPredictionPanelTodayPage != *((_DWORD *)v4 + 4))
      goto LABEL_141;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0)
      goto LABEL_141;
    if (self->_suggestionsWidgetTodayPageEnabled)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_141;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) != 0)
    {
      if (self->_appPredictionPanelTodayPageEnabled)
      {
        if (!*((_BYTE *)v4 + 43))
          goto LABEL_141;
      }
      else if (*((_BYTE *)v4 + 43))
      {
        goto LABEL_141;
      }
      v7 = 1;
      goto LABEL_142;
    }
LABEL_141:
    v7 = 0;
    goto LABEL_142;
  }
  v7 = (*((_DWORD *)v4 + 14) & 0x800) == 0;
LABEL_142:

  return v7;
}

- (unint64_t)hash
{
  $DEF734E8A820C4B152ECF3079B765D50 has;
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v3 = 2654435761 * self->_sessionLengthInSeconds;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numEngagementsInSpotlightApps;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
      goto LABEL_25;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numEngagementsInSpotlightActions;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_25:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numEngagementsInSuggestionsWidget;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_6;
    goto LABEL_27;
  }
LABEL_26:
  v6 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_numEngagementsInAppPredictionPanel;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  v7 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_numEngagementsInAppLibrary;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_spotlightEnabled;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_suggestionsWidgetEnabled;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  v10 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_appPredictionPanelEnabled;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_appLibraryEnabled;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_spotlightAppsViewed;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  v13 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_spotlightActionsViewed;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_suggestionsWidgetViewed;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  v15 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_appPredictionPanelViewed;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_16;
    goto LABEL_37;
  }
LABEL_36:
  v16 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_appLibraryViewed;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_37:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_suggestionsWidgetTodayPageViewed;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_18;
    goto LABEL_39;
  }
LABEL_38:
  v18 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_appPredictionPanelTodayPageViewed;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_19;
    goto LABEL_40;
  }
LABEL_39:
  v19 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_numEngagementsInSuggestionsWidgetTodayPage;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_20;
    goto LABEL_41;
  }
LABEL_40:
  v20 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_numEngagementsInAppPredictionPanelTodayPage;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_21;
LABEL_42:
    v22 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_22;
LABEL_43:
    v23 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_41:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0)
    goto LABEL_42;
LABEL_21:
  v22 = 2654435761 * self->_suggestionsWidgetTodayPageEnabled;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_43;
LABEL_22:
  v23 = 2654435761 * self->_appPredictionPanelTodayPageEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x80) != 0)
  {
    self->_sessionLengthInSeconds = *((_DWORD *)v4 + 9);
    *(_DWORD *)&self->_has |= 0x80u;
    v5 = *((_DWORD *)v4 + 14);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_numEngagementsInSpotlightApps = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_numEngagementsInSpotlightActions = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  self->_numEngagementsInSuggestionsWidget = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  self->_numEngagementsInAppPredictionPanel = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  self->_numEngagementsInAppLibrary = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x10000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  self->_spotlightEnabled = *((_BYTE *)v4 + 48);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  self->_suggestionsWidgetEnabled = *((_BYTE *)v4 + 49);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  self->_appPredictionPanelEnabled = *((_BYTE *)v4 + 42);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x8000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  self->_appLibraryEnabled = *((_BYTE *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x8000) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  self->_spotlightAppsViewed = *((_BYTE *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  self->_spotlightActionsViewed = *((_BYTE *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x100000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  self->_suggestionsWidgetViewed = *((_BYTE *)v4 + 52);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  self->_appPredictionPanelViewed = *((_BYTE *)v4 + 45);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x200) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  self->_appLibraryViewed = *((_BYTE *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  self->_suggestionsWidgetTodayPageViewed = *((_BYTE *)v4 + 51);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  self->_appPredictionPanelTodayPageViewed = *((_BYTE *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x40) == 0)
  {
LABEL_19:
    if ((v5 & 4) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  self->_numEngagementsInSuggestionsWidgetTodayPage = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 4) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000) == 0)
      goto LABEL_21;
LABEL_43:
    self->_suggestionsWidgetTodayPageEnabled = *((_BYTE *)v4 + 50);
    *(_DWORD *)&self->_has |= 0x40000u;
    if ((*((_DWORD *)v4 + 14) & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_42:
  self->_numEngagementsInAppPredictionPanelTodayPage = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x40000) != 0)
    goto LABEL_43;
LABEL_21:
  if ((v5 & 0x800) != 0)
  {
LABEL_22:
    self->_appPredictionPanelTodayPageEnabled = *((_BYTE *)v4 + 43);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_23:

}

- (unsigned)sessionLengthInSeconds
{
  return self->_sessionLengthInSeconds;
}

- (unsigned)numEngagementsInSpotlightApps
{
  return self->_numEngagementsInSpotlightApps;
}

- (unsigned)numEngagementsInSpotlightActions
{
  return self->_numEngagementsInSpotlightActions;
}

- (unsigned)numEngagementsInSuggestionsWidget
{
  return self->_numEngagementsInSuggestionsWidget;
}

- (unsigned)numEngagementsInAppPredictionPanel
{
  return self->_numEngagementsInAppPredictionPanel;
}

- (unsigned)numEngagementsInAppLibrary
{
  return self->_numEngagementsInAppLibrary;
}

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (BOOL)suggestionsWidgetEnabled
{
  return self->_suggestionsWidgetEnabled;
}

- (BOOL)appPredictionPanelEnabled
{
  return self->_appPredictionPanelEnabled;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (BOOL)spotlightAppsViewed
{
  return self->_spotlightAppsViewed;
}

- (BOOL)spotlightActionsViewed
{
  return self->_spotlightActionsViewed;
}

- (BOOL)suggestionsWidgetViewed
{
  return self->_suggestionsWidgetViewed;
}

- (BOOL)appPredictionPanelViewed
{
  return self->_appPredictionPanelViewed;
}

- (BOOL)appLibraryViewed
{
  return self->_appLibraryViewed;
}

- (BOOL)suggestionsWidgetTodayPageViewed
{
  return self->_suggestionsWidgetTodayPageViewed;
}

- (BOOL)appPredictionPanelTodayPageViewed
{
  return self->_appPredictionPanelTodayPageViewed;
}

- (unsigned)numEngagementsInSuggestionsWidgetTodayPage
{
  return self->_numEngagementsInSuggestionsWidgetTodayPage;
}

- (unsigned)numEngagementsInAppPredictionPanelTodayPage
{
  return self->_numEngagementsInAppPredictionPanelTodayPage;
}

- (BOOL)suggestionsWidgetTodayPageEnabled
{
  return self->_suggestionsWidgetTodayPageEnabled;
}

- (BOOL)appPredictionPanelTodayPageEnabled
{
  return self->_appPredictionPanelTodayPageEnabled;
}

@end
