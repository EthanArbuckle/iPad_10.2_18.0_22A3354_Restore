@implementation NTPBTodayWidgetConfig

- (void)setMinimumArticleExposureDurationToBePreseen:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumArticleExposureDurationToBePreseen = a3;
}

- (void)setHasMinimumArticleExposureDurationToBePreseen:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumArticleExposureDurationToBePreseen
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMinimumNumberOfTimesPreseenToBeSeen:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_minimumNumberOfTimesPreseenToBeSeen = a3;
}

- (void)setHasMinimumNumberOfTimesPreseenToBeSeen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumNumberOfTimesPreseenToBeSeen
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPrerollLoadingTimeout:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_prerollLoadingTimeout = a3;
}

- (void)setHasPrerollLoadingTimeout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrerollLoadingTimeout
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasExternalAnalyticsConfigurationsData
{
  return self->_externalAnalyticsConfigurationsData != 0;
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (void)setContentPrefetchEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_contentPrefetchEnabled = a3;
}

- (void)setHasContentPrefetchEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasContentPrefetchEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasAudioIndicatorColor
{
  return self->_audioIndicatorColor != 0;
}

- (void)setWidgetSystemReloadInterval:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_widgetSystemReloadInterval = a3;
}

- (void)setHasWidgetSystemReloadInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidgetSystemReloadInterval
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWidgetSystemReloadJitterMax:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_widgetSystemReloadJitterMax = a3;
}

- (void)setHasWidgetSystemReloadJitterMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidgetSystemReloadJitterMax
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setWidgetBackgroundInteractionEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_widgetBackgroundInteractionEnabled = a3;
}

- (void)setHasWidgetBackgroundInteractionEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasWidgetBackgroundInteractionEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayWidgetConfig;
  -[NTPBTodayWidgetConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayWidgetConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSData *externalAnalyticsConfigurationsData;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  void *v9;
  NSString *audioIndicatorColor;
  char v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumArticleExposureDurationToBePreseen);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("minimum_article_exposure_duration_to_be_preseen"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minimumNumberOfTimesPreseenToBeSeen);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("minimum_number_of_times_preseen_to_be_seen"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_prerollLoadingTimeout);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("preroll_loading_timeout"));

  }
LABEL_5:
  externalAnalyticsConfigurationsData = self->_externalAnalyticsConfigurationsData;
  if (externalAnalyticsConfigurationsData)
    objc_msgSend(v3, "setObject:forKey:", externalAnalyticsConfigurationsData, CFSTR("external_analytics_configurations_data"));
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight)
    objc_msgSend(v3, "setObject:forKey:", backgroundColorLight, CFSTR("background_color_light"));
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark)
    objc_msgSend(v3, "setObject:forKey:", backgroundColorDark, CFSTR("background_color_dark"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_contentPrefetchEnabled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("content_prefetch_enabled"));

  }
  audioIndicatorColor = self->_audioIndicatorColor;
  if (audioIndicatorColor)
    objc_msgSend(v3, "setObject:forKey:", audioIndicatorColor, CFSTR("audio_indicator_color"));
  v11 = (char)self->_has;
  if ((v11 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetSystemReloadJitterMax);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("widget_system_reload_jitter_max"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetSystemReloadInterval);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("widget_system_reload_interval"));

  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v11 & 0x40) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_widgetBackgroundInteractionEnabled);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("widget_background_interaction_enabled"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_externalAnalyticsConfigurationsData)
    PBDataWriterWriteDataField();
  if (self->_backgroundColorLight)
    PBDataWriterWriteStringField();
  if (self->_backgroundColorDark)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_audioIndicatorColor)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_17;
LABEL_24:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteInt64Field();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v5 & 0x40) != 0)
LABEL_18:
    PBDataWriterWriteBOOLField();
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_minimumArticleExposureDurationToBePreseen;
    *(_BYTE *)(v5 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_minimumNumberOfTimesPreseenToBeSeen;
  *(_BYTE *)(v5 + 80) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_prerollLoadingTimeout;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_externalAnalyticsConfigurationsData, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_backgroundColorLight, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_backgroundColorDark, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 76) = self->_contentPrefetchEnabled;
    *(_BYTE *)(v6 + 80) |= 0x20u;
  }
  v14 = -[NSString copyWithZone:](self->_audioIndicatorColor, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v14;

  v16 = (char)self->_has;
  if ((v16 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_16:
    *(_QWORD *)(v6 + 32) = self->_widgetSystemReloadJitterMax;
    *(_BYTE *)(v6 + 80) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return (id)v6;
    goto LABEL_10;
  }
  *(_QWORD *)(v6 + 24) = self->_widgetSystemReloadInterval;
  *(_BYTE *)(v6 + 80) |= 4u;
  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v16 & 0x40) != 0)
  {
LABEL_10:
    *(_BYTE *)(v6 + 77) = self->_widgetBackgroundInteractionEnabled;
    *(_BYTE *)(v6 + 80) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *externalAnalyticsConfigurationsData;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  char has;
  NSString *audioIndicatorColor;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_minimumArticleExposureDurationToBePreseen != *((_QWORD *)v4 + 1))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_minimumNumberOfTimesPreseenToBeSeen != *((_DWORD *)v4 + 18))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_prerollLoadingTimeout != *((double *)v4 + 2))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_46;
  }
  externalAnalyticsConfigurationsData = self->_externalAnalyticsConfigurationsData;
  if ((unint64_t)externalAnalyticsConfigurationsData | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](externalAnalyticsConfigurationsData, "isEqual:"))
  {
    goto LABEL_46;
  }
  backgroundColorLight = self->_backgroundColorLight;
  if ((unint64_t)backgroundColorLight | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](backgroundColorLight, "isEqual:"))
      goto LABEL_46;
  }
  backgroundColorDark = self->_backgroundColorDark;
  if ((unint64_t)backgroundColorDark | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](backgroundColorDark, "isEqual:"))
      goto LABEL_46;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x20) == 0)
      goto LABEL_46;
    if (self->_contentPrefetchEnabled)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  audioIndicatorColor = self->_audioIndicatorColor;
  if ((unint64_t)audioIndicatorColor | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](audioIndicatorColor, "isEqual:"))
      goto LABEL_46;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_widgetSystemReloadInterval != *((_QWORD *)v4 + 3))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_widgetSystemReloadJitterMax != *((_QWORD *)v4 + 4))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_46;
  }
  v10 = (*((_BYTE *)v4 + 80) & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x40) != 0)
    {
      if (self->_widgetBackgroundInteractionEnabled)
      {
        if (!*((_BYTE *)v4 + 77))
          goto LABEL_46;
      }
      else if (*((_BYTE *)v4 + 77))
      {
        goto LABEL_46;
      }
      v10 = 1;
      goto LABEL_47;
    }
LABEL_46:
    v10 = 0;
  }
LABEL_47:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double prerollLoadingTimeout;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    goto LABEL_13;
  }
  v3 = 2654435761 * self->_minimumArticleExposureDurationToBePreseen;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_minimumNumberOfTimesPreseenToBeSeen;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_4:
  prerollLoadingTimeout = self->_prerollLoadingTimeout;
  v6 = -prerollLoadingTimeout;
  if (prerollLoadingTimeout >= 0.0)
    v6 = self->_prerollLoadingTimeout;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  v10 = -[NSData hash](self->_externalAnalyticsConfigurationsData, "hash");
  v11 = -[NSString hash](self->_backgroundColorLight, "hash");
  v12 = -[NSString hash](self->_backgroundColorDark, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v13 = 2654435761 * self->_contentPrefetchEnabled;
  else
    v13 = 0;
  v14 = -[NSString hash](self->_audioIndicatorColor, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_18;
LABEL_21:
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_19;
LABEL_22:
    v17 = 0;
    return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
  v15 = 2654435761 * self->_widgetSystemReloadInterval;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_21;
LABEL_18:
  v16 = 2654435761 * self->_widgetSystemReloadJitterMax;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_22;
LABEL_19:
  v17 = 2654435761 * self->_widgetBackgroundInteractionEnabled;
  return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 1) != 0)
  {
    self->_minimumArticleExposureDurationToBePreseen = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 80);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_minimumNumberOfTimesPreseenToBeSeen = *((_DWORD *)v4 + 18);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
LABEL_4:
    self->_prerollLoadingTimeout = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBTodayWidgetConfig setExternalAnalyticsConfigurationsData:](self, "setExternalAnalyticsConfigurationsData:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBTodayWidgetConfig setBackgroundColorLight:](self, "setBackgroundColorLight:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBTodayWidgetConfig setBackgroundColorDark:](self, "setBackgroundColorDark:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 80) & 0x20) != 0)
  {
    self->_contentPrefetchEnabled = *((_BYTE *)v4 + 76);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBTodayWidgetConfig setAudioIndicatorColor:](self, "setAudioIndicatorColor:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 80);
  if ((v6 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0)
      goto LABEL_17;
LABEL_24:
    self->_widgetSystemReloadJitterMax = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 80) & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_widgetSystemReloadInterval = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 80);
  if ((v6 & 8) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v6 & 0x40) != 0)
  {
LABEL_18:
    self->_widgetBackgroundInteractionEnabled = *((_BYTE *)v4 + 77);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_19:

}

- (int64_t)minimumArticleExposureDurationToBePreseen
{
  return self->_minimumArticleExposureDurationToBePreseen;
}

- (unsigned)minimumNumberOfTimesPreseenToBeSeen
{
  return self->_minimumNumberOfTimesPreseenToBeSeen;
}

- (double)prerollLoadingTimeout
{
  return self->_prerollLoadingTimeout;
}

- (NSData)externalAnalyticsConfigurationsData
{
  return self->_externalAnalyticsConfigurationsData;
}

- (void)setExternalAnalyticsConfigurationsData:(id)a3
{
  objc_storeStrong((id *)&self->_externalAnalyticsConfigurationsData, a3);
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorLight, a3);
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorDark, a3);
}

- (BOOL)contentPrefetchEnabled
{
  return self->_contentPrefetchEnabled;
}

- (NSString)audioIndicatorColor
{
  return self->_audioIndicatorColor;
}

- (void)setAudioIndicatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_audioIndicatorColor, a3);
}

- (int64_t)widgetSystemReloadInterval
{
  return self->_widgetSystemReloadInterval;
}

- (int64_t)widgetSystemReloadJitterMax
{
  return self->_widgetSystemReloadJitterMax;
}

- (BOOL)widgetBackgroundInteractionEnabled
{
  return self->_widgetBackgroundInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAnalyticsConfigurationsData, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_audioIndicatorColor, 0);
}

@end
