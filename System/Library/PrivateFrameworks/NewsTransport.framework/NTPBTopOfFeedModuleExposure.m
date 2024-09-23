@implementation NTPBTopOfFeedModuleExposure

- (int)moduleEventType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_moduleEventType;
  else
    return 0;
}

- (void)setModuleEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_moduleEventType = a3;
}

- (void)setHasModuleEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModuleEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)moduleEventTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4CF08[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModuleEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MODULE_EVENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BREAKING_NEWS_MODULE_EVENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPECIAL_EVENTS_MODULE_EVENT_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)moduleLocation
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_moduleLocation;
  else
    return 0;
}

- (void)setModuleLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_moduleLocation = a3;
}

- (void)setHasModuleLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModuleLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)moduleLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4CF20[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModuleLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MODULE_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOR_YOU_MODULE_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_MODULE_EVENT_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setModuleItemCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_moduleItemCount = a3;
}

- (void)setHasModuleItemCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModuleItemCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasModuleExposureId
{
  return self->_moduleExposureId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
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
  v8.super_class = (Class)NTPBTopOfFeedModuleExposure;
  -[NTPBTopOfFeedModuleExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTopOfFeedModuleExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *moduleExposureId;
  NSData *feedViewExposureId;
  uint64_t moduleEventType;
  __CFString *v10;
  uint64_t moduleLocation;
  __CFString *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    moduleEventType = self->_moduleEventType;
    if (moduleEventType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_moduleEventType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_24CD4CF08[moduleEventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("module_event_type"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  moduleLocation = self->_moduleLocation;
  if (moduleLocation >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_moduleLocation);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_24CD4CF20[moduleLocation];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("module_location"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moduleItemCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("module_item_count"));

  }
LABEL_5:
  moduleExposureId = self->_moduleExposureId;
  if (moduleExposureId)
    objc_msgSend(v3, "setObject:forKey:", moduleExposureId, CFSTR("module_exposure_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTopOfFeedModuleExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_moduleExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_moduleLocation;
    *(_BYTE *)(v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_moduleEventType;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_moduleItemCount;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_moduleExposureId, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *moduleExposureId;
  NSData *feedViewExposureId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_moduleEventType != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_moduleLocation != *((_DWORD *)v4 + 9))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_moduleItemCount != *((_DWORD *)v4 + 8))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  moduleExposureId = self->_moduleExposureId;
  if ((unint64_t)moduleExposureId | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](moduleExposureId, "isEqual:"))
  {
    goto LABEL_21;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 1))
    v7 = -[NSData isEqual:](feedViewExposureId, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_moduleEventType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_moduleLocation;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_moduleItemCount;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSData hash](self->_moduleExposureId, "hash");
  return v6 ^ -[NSData hash](self->_feedViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_moduleEventType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_moduleLocation = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_4:
    self->_moduleItemCount = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBTopOfFeedModuleExposure setModuleExposureId:](self, "setModuleExposureId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBTopOfFeedModuleExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v6;
  }

}

- (int)moduleItemCount
{
  return self->_moduleItemCount;
}

- (NSData)moduleExposureId
{
  return self->_moduleExposureId;
}

- (void)setModuleExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_moduleExposureId, a3);
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
}

@end
