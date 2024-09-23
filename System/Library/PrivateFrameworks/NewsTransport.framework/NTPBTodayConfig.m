@implementation NTPBTodayConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBTodayConfig setTodayQueueConfigs:](self, "setTodayQueueConfigs:", 0);
  -[NTPBTodayConfig setBackgroundColorLight:](self, "setBackgroundColorLight:", 0);
  -[NTPBTodayConfig setBackgroundColorDark:](self, "setBackgroundColorDark:", 0);
  -[NTPBTodayConfig setWidgetIdentifier:](self, "setWidgetIdentifier:", 0);
  -[NTPBTodayConfig setAudioIndicatorColor:](self, "setAudioIndicatorColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayConfig;
  -[NTPBTodayConfig dealloc](&v3, sel_dealloc);
}

- (void)clearTodayQueueConfigs
{
  -[NSMutableArray removeAllObjects](self->_todayQueueConfigs, "removeAllObjects");
}

- (void)addTodayQueueConfigs:(id)a3
{
  NSMutableArray *todayQueueConfigs;

  todayQueueConfigs = self->_todayQueueConfigs;
  if (!todayQueueConfigs)
  {
    todayQueueConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_todayQueueConfigs = todayQueueConfigs;
  }
  -[NSMutableArray addObject:](todayQueueConfigs, "addObject:", a3);
}

- (unint64_t)todayQueueConfigsCount
{
  return -[NSMutableArray count](self->_todayQueueConfigs, "count");
}

- (id)todayQueueConfigsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_todayQueueConfigs, "objectAtIndex:", a3);
}

+ (Class)todayQueueConfigsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (BOOL)hasAudioIndicatorColor
{
  return self->_audioIndicatorColor != 0;
}

- (void)setWidgetSystemReloadInterval:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_widgetSystemReloadInterval = a3;
}

- (void)setHasWidgetSystemReloadInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetSystemReloadInterval
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWidgetSystemReloadJitterMax:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_widgetSystemReloadJitterMax = a3;
}

- (void)setHasWidgetSystemReloadJitterMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetSystemReloadJitterMax
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTodayConfig description](&v3, sel_description), -[NTPBTodayConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *todayQueueConfigs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  NSString *widgetIdentifier;
  NSString *audioIndicatorColor;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSMutableArray count](self->_todayQueueConfigs, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_todayQueueConfigs, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    todayQueueConfigs = self->_todayQueueConfigs;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayQueueConfigs, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(todayQueueConfigs);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayQueueConfigs, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("today_queue_configs"));

  }
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight)
    objc_msgSend(v3, "setObject:forKey:", backgroundColorLight, CFSTR("background_color_light"));
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark)
    objc_msgSend(v3, "setObject:forKey:", backgroundColorDark, CFSTR("background_color_dark"));
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier)
    objc_msgSend(v3, "setObject:forKey:", widgetIdentifier, CFSTR("widget_identifier"));
  audioIndicatorColor = self->_audioIndicatorColor;
  if (audioIndicatorColor)
    objc_msgSend(v3, "setObject:forKey:", audioIndicatorColor, CFSTR("audio_indicator_color"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetSystemReloadInterval), CFSTR("widget_system_reload_interval"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetSystemReloadJitterMax), CFSTR("widget_system_reload_jitter_max"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *todayQueueConfigs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char has;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  todayQueueConfigs = self->_todayQueueConfigs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayQueueConfigs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(todayQueueConfigs);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayQueueConfigs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  if (self->_backgroundColorLight)
    PBDataWriterWriteStringField();
  if (self->_backgroundColorDark)
    PBDataWriterWriteStringField();
  if (self->_widgetIdentifier)
    PBDataWriterWriteStringField();
  if (self->_audioIndicatorColor)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *todayQueueConfigs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  todayQueueConfigs = self->_todayQueueConfigs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayQueueConfigs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(todayQueueConfigs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTodayQueueConfigs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayQueueConfigs, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_backgroundColorLight, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_backgroundColorDark, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_widgetIdentifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_audioIndicatorColor, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_widgetSystemReloadInterval;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_widgetSystemReloadJitterMax;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *todayQueueConfigs;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  NSString *widgetIdentifier;
  NSString *audioIndicatorColor;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    todayQueueConfigs = self->_todayQueueConfigs;
    if (!((unint64_t)todayQueueConfigs | *((_QWORD *)a3 + 6))
      || (v5 = -[NSMutableArray isEqual:](todayQueueConfigs, "isEqual:")) != 0)
    {
      backgroundColorLight = self->_backgroundColorLight;
      if (!((unint64_t)backgroundColorLight | *((_QWORD *)a3 + 5))
        || (v5 = -[NSString isEqual:](backgroundColorLight, "isEqual:")) != 0)
      {
        backgroundColorDark = self->_backgroundColorDark;
        if (!((unint64_t)backgroundColorDark | *((_QWORD *)a3 + 4))
          || (v5 = -[NSString isEqual:](backgroundColorDark, "isEqual:")) != 0)
        {
          widgetIdentifier = self->_widgetIdentifier;
          if (!((unint64_t)widgetIdentifier | *((_QWORD *)a3 + 7))
            || (v5 = -[NSString isEqual:](widgetIdentifier, "isEqual:")) != 0)
          {
            audioIndicatorColor = self->_audioIndicatorColor;
            if (!((unint64_t)audioIndicatorColor | *((_QWORD *)a3 + 3))
              || (v5 = -[NSString isEqual:](audioIndicatorColor, "isEqual:")) != 0)
            {
              if ((*(_BYTE *)&self->_has & 1) != 0)
              {
                if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_widgetSystemReloadInterval != *((_QWORD *)a3 + 1))
                  goto LABEL_21;
              }
              else if ((*((_BYTE *)a3 + 64) & 1) != 0)
              {
LABEL_21:
                LOBYTE(v5) = 0;
                return v5;
              }
              LOBYTE(v5) = (*((_BYTE *)a3 + 64) & 2) == 0;
              if ((*(_BYTE *)&self->_has & 2) != 0)
              {
                if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_widgetSystemReloadJitterMax != *((_QWORD *)a3 + 2))
                  goto LABEL_21;
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSMutableArray hash](self->_todayQueueConfigs, "hash");
  v4 = -[NSString hash](self->_backgroundColorLight, "hash");
  v5 = -[NSString hash](self->_backgroundColorDark, "hash");
  v6 = -[NSString hash](self->_widgetIdentifier, "hash");
  v7 = -[NSString hash](self->_audioIndicatorColor, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_widgetSystemReloadInterval;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_widgetSystemReloadJitterMax;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NTPBTodayConfig addTodayQueueConfigs:](self, "addTodayQueueConfigs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if (*((_QWORD *)a3 + 5))
    -[NTPBTodayConfig setBackgroundColorLight:](self, "setBackgroundColorLight:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBTodayConfig setBackgroundColorDark:](self, "setBackgroundColorDark:");
  if (*((_QWORD *)a3 + 7))
    -[NTPBTodayConfig setWidgetIdentifier:](self, "setWidgetIdentifier:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBTodayConfig setAudioIndicatorColor:](self, "setAudioIndicatorColor:");
  v10 = *((_BYTE *)a3 + 64);
  if ((v10 & 1) != 0)
  {
    self->_widgetSystemReloadInterval = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v10 = *((_BYTE *)a3 + 64);
  }
  if ((v10 & 2) != 0)
  {
    self->_widgetSystemReloadJitterMax = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (NSMutableArray)todayQueueConfigs
{
  return self->_todayQueueConfigs;
}

- (void)setTodayQueueConfigs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)audioIndicatorColor
{
  return self->_audioIndicatorColor;
}

- (void)setAudioIndicatorColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)widgetSystemReloadInterval
{
  return self->_widgetSystemReloadInterval;
}

- (int64_t)widgetSystemReloadJitterMax
{
  return self->_widgetSystemReloadJitterMax;
}

@end
