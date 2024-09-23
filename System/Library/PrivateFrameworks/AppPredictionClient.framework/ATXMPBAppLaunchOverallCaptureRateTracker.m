@implementation ATXMPBAppLaunchOverallCaptureRateTracker

- (int)captureType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_captureType;
  else
    return 0;
}

- (void)setCaptureType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_captureType = a3;
}

- (void)setHasCaptureType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)captureTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E4D5D1C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCaptureType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreen")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenDock")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Spotlight")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLibrary")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenOrTodayWidget")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppPredictionPanel")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppPredictionPanelToday")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SuggestionsWidget")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SuggestionsWidgetToday")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)iconLocation
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_iconLocation;
  else
    return 0;
}

- (void)setIconLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_iconLocation = a3;
}

- (void)setHasIconLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIconLocation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)iconLocationAsString:(int)a3
{
  if (a3 < 9)
    return off_1E4D5D210[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIconLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotOnHomeScreen")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dock")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Page1")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Page2")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Page3")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Page4")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Page5")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Page6")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OtherPages")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_spotlightEnabled = a3;
}

- (void)setHasSpotlightEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSpotlightEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_appLibraryEnabled = a3;
}

- (void)setHasAppLibraryEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppLibraryEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAppPredictionPanelEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_appPredictionPanelEnabled = a3;
}

- (void)setHasAppPredictionPanelEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppPredictionPanelEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAppPredictionPanelTodayEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_appPredictionPanelTodayEnabled = a3;
}

- (void)setHasAppPredictionPanelTodayEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAppPredictionPanelTodayEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSuggestionsWidgetEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_suggestionsWidgetEnabled = a3;
}

- (void)setHasSuggestionsWidgetEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSuggestionsWidgetEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSuggestionsWidgetTodayEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_suggestionsWidgetTodayEnabled = a3;
}

- (void)setHasSuggestionsWidgetTodayEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSuggestionsWidgetTodayEnabled
{
  return *(_BYTE *)&self->_has >> 7;
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
  v8.super_class = (Class)ATXMPBAppLaunchOverallCaptureRateTracker;
  -[ATXMPBAppLaunchOverallCaptureRateTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBAppLaunchOverallCaptureRateTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t captureType;
  __CFString *v6;
  uint64_t iconLocation;
  __CFString *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    captureType = self->_captureType;
    if (captureType >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_captureType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E4D5D1C0[captureType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("captureType"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    iconLocation = self->_iconLocation;
    if (iconLocation >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_iconLocation);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D5D210[iconLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("iconLocation"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spotlightEnabled);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("spotlightEnabled"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appLibraryEnabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("appLibraryEnabled"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appPredictionPanelEnabled);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("appPredictionPanelEnabled"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0)
      goto LABEL_16;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionsWidgetEnabled);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("suggestionsWidgetEnabled"));

    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      return v3;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionsWidgetTodayEnabled);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("suggestionsWidgetTodayEnabled"));

    return v3;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appPredictionPanelTodayEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("appPredictionPanelTodayEnabled"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_22;
LABEL_16:
  if (has < 0)
    goto LABEL_23;
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAppLaunchOverallCaptureRateTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    PBDataWriterWriteBOOLField();
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_captureType;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_iconLocation;
  *((_BYTE *)v4 + 24) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)v4 + 19) = self->_spotlightEnabled;
  *((_BYTE *)v4 + 24) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)v4 + 16) = self->_appLibraryEnabled;
  *((_BYTE *)v4 + 24) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)v4 + 17) = self->_appPredictionPanelEnabled;
  *((_BYTE *)v4 + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    *((_BYTE *)v4 + 20) = self->_suggestionsWidgetEnabled;
    *((_BYTE *)v4 + 24) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    *((_BYTE *)v4 + 21) = self->_suggestionsWidgetTodayEnabled;
    *((_BYTE *)v4 + 24) |= 0x80u;
    goto LABEL_9;
  }
LABEL_15:
  *((_BYTE *)v4 + 18) = self->_appPredictionPanelTodayEnabled;
  *((_BYTE *)v4 + 24) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (has < 0)
    goto LABEL_17;
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_captureType;
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_iconLocation;
  *((_BYTE *)result + 24) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 19) = self->_spotlightEnabled;
  *((_BYTE *)result + 24) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 16) = self->_appLibraryEnabled;
  *((_BYTE *)result + 24) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 17) = self->_appPredictionPanelEnabled;
  *((_BYTE *)result + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *((_BYTE *)result + 18) = self->_appPredictionPanelTodayEnabled;
  *((_BYTE *)result + 24) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      return result;
LABEL_17:
    *((_BYTE *)result + 21) = self->_suggestionsWidgetTodayEnabled;
    *((_BYTE *)result + 24) |= 0x80u;
    return result;
  }
LABEL_16:
  *((_BYTE *)result + 20) = self->_suggestionsWidgetEnabled;
  *((_BYTE *)result + 24) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    goto LABEL_17;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_54;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[24] & 1) == 0 || self->_captureType != *((_DWORD *)v4 + 2))
      goto LABEL_54;
  }
  else if ((v4[24] & 1) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[24] & 2) == 0 || self->_iconLocation != *((_DWORD *)v4 + 3))
      goto LABEL_54;
  }
  else if ((v4[24] & 2) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[24] & 0x20) == 0)
      goto LABEL_54;
    if (self->_spotlightEnabled)
    {
      if (!v4[19])
        goto LABEL_54;
    }
    else if (v4[19])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[24] & 4) == 0)
      goto LABEL_54;
    if (self->_appLibraryEnabled)
    {
      if (!v4[16])
        goto LABEL_54;
    }
    else if (v4[16])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[24] & 8) == 0)
      goto LABEL_54;
    if (self->_appPredictionPanelEnabled)
    {
      if (!v4[17])
        goto LABEL_54;
    }
    else if (v4[17])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[24] & 0x10) == 0)
      goto LABEL_54;
    if (self->_appPredictionPanelTodayEnabled)
    {
      if (!v4[18])
        goto LABEL_54;
    }
    else if (v4[18])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[24] & 0x40) == 0)
      goto LABEL_54;
    if (self->_suggestionsWidgetEnabled)
    {
      if (!v4[20])
        goto LABEL_54;
    }
    else if (v4[20])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 0x40) != 0)
  {
    goto LABEL_54;
  }
  v5 = v4[24] >= 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if (v4[24] < 0)
    {
      if (self->_suggestionsWidgetTodayEnabled)
      {
        if (!v4[21])
          goto LABEL_54;
      }
      else if (v4[21])
      {
        goto LABEL_54;
      }
      v5 = 1;
      goto LABEL_55;
    }
LABEL_54:
    v5 = 0;
  }
LABEL_55:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_captureType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_iconLocation;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_spotlightEnabled;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_appLibraryEnabled;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_appPredictionPanelEnabled;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_appPredictionPanelTodayEnabled;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_suggestionsWidgetEnabled;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_suggestionsWidgetTodayEnabled;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_captureType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_iconLocation = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_spotlightEnabled = *((_BYTE *)v4 + 19);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_appLibraryEnabled = *((_BYTE *)v4 + 16);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  self->_appPredictionPanelEnabled = *((_BYTE *)v4 + 17);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
LABEL_16:
    self->_suggestionsWidgetEnabled = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v4 + 24) & 0x80) == 0)
      goto LABEL_9;
LABEL_17:
    self->_suggestionsWidgetTodayEnabled = *((_BYTE *)v4 + 21);
    *(_BYTE *)&self->_has |= 0x80u;
    goto LABEL_9;
  }
LABEL_15:
  self->_appPredictionPanelTodayEnabled = *((_BYTE *)v4 + 18);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 0x40) != 0)
    goto LABEL_16;
LABEL_8:
  if (v5 < 0)
    goto LABEL_17;
LABEL_9:

}

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (BOOL)appPredictionPanelEnabled
{
  return self->_appPredictionPanelEnabled;
}

- (BOOL)appPredictionPanelTodayEnabled
{
  return self->_appPredictionPanelTodayEnabled;
}

- (BOOL)suggestionsWidgetEnabled
{
  return self->_suggestionsWidgetEnabled;
}

- (BOOL)suggestionsWidgetTodayEnabled
{
  return self->_suggestionsWidgetTodayEnabled;
}

@end
