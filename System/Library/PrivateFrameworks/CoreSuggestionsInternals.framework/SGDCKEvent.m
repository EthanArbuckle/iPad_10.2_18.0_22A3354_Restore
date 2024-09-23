@implementation SGDCKEvent

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasSourceKey
{
  return self->_sourceKey != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setCreationTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationTimestamp = a3;
}

- (void)setHasCreationTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLastModifiedTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastModifiedTimestamp = a3;
}

- (void)setHasLastModifiedTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastModifiedTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasWhen
{
  return self->_when != 0;
}

- (void)setAllDay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_allDay = a3;
}

- (void)setHasAllDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAllDay
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearLocations
{
  -[NSMutableArray removeAllObjects](self->_locations, "removeAllObjects");
}

- (void)addLocations:(id)a3
{
  id v4;
  NSMutableArray *locations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  locations = self->_locations;
  v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_locations;
    self->_locations = v6;

    v4 = v8;
    locations = self->_locations;
  }
  -[NSMutableArray addObject:](locations, "addObject:", v4);

}

- (unint64_t)locationsCount
{
  return -[NSMutableArray count](self->_locations, "count");
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_locations, "objectAtIndex:", a3);
}

- (BOOL)hasExtraKey
{
  return self->_extraKey != 0;
}

- (void)setCancelled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCancelled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasSchemaOrg
{
  return self->_schemaOrg != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasTemplateName
{
  return self->_templateName != 0;
}

- (void)setCategoryType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_categoryType = a3;
}

- (void)setHasCategoryType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCategoryType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)categoryTypeAsString:(int)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)StringAsCategoryType:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[SGDCKEvent StringAsCategoryType:]", "SGDCKEvent.m", 166, "0");
}

- (BOOL)hasInteractionInfo
{
  return self->_interactionInfo != 0;
}

- (void)setParentEntityType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_parentEntityType = a3;
}

- (void)setHasParentEntityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParentEntityType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)SGDCKEvent;
  -[SGDCKEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCKEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupId;
  NSString *sourceKey;
  NSString *content;
  NSString *title;
  char has;
  void *v10;
  void *v11;
  SGDCKTimeRange *when;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSString *extraKey;
  void *v23;
  NSData *schemaOrg;
  NSString *domain;
  NSString *templateName;
  void *v27;
  void *v28;
  SGDCKInteractionInfo *interactionInfo;
  void *v30;
  void *v31;
  NSData *metadata;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  groupId = self->_groupId;
  if (groupId)
    objc_msgSend(v3, "setObject:forKey:", groupId, CFSTR("groupId"));
  sourceKey = self->_sourceKey;
  if (sourceKey)
    objc_msgSend(v4, "setObject:forKey:", sourceKey, CFSTR("sourceKey"));
  content = self->_content;
  if (content)
    objc_msgSend(v4, "setObject:forKey:", content, CFSTR("content"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationTimestamp);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("creationTimestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastModifiedTimestamp);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("lastModifiedTimestamp"));

  }
  when = self->_when;
  if (when)
  {
    -[SGDCKTimeRange dictionaryRepresentation](when, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("when"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allDay);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("allDay"));

  }
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = self->_locations;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v34);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("locations"));
  }
  extraKey = self->_extraKey;
  if (extraKey)
    objc_msgSend(v4, "setObject:forKey:", extraKey, CFSTR("extraKey"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cancelled);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("cancelled"));

  }
  schemaOrg = self->_schemaOrg;
  if (schemaOrg)
    objc_msgSend(v4, "setObject:forKey:", schemaOrg, CFSTR("schemaOrg"));
  domain = self->_domain;
  if (domain)
    objc_msgSend(v4, "setObject:forKey:", domain, CFSTR("domain"));
  templateName = self->_templateName;
  if (templateName)
    objc_msgSend(v4, "setObject:forKey:", templateName, CFSTR("templateName"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_categoryType);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("categoryType"));

  }
  interactionInfo = self->_interactionInfo;
  if (interactionInfo)
  {
    -[SGDCKInteractionInfo dictionaryRepresentation](interactionInfo, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("interactionInfo"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_parentEntityType);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("parentEntityType"));

  }
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_groupId)
    PBDataWriterWriteStringField();
  if (self->_sourceKey)
    PBDataWriterWriteStringField();
  if (self->_content)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_when)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_locations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_extraKey)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_schemaOrg)
    PBDataWriterWriteDataField();
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_templateName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_interactionInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteSint64Field();
  if (self->_metadata)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;

  v4 = a3;
  v11 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    v4 = v11;
  }
  if (self->_sourceKey)
  {
    objc_msgSend(v11, "setSourceKey:");
    v4 = v11;
  }
  if (self->_content)
  {
    objc_msgSend(v11, "setContent:");
    v4 = v11;
  }
  if (self->_title)
  {
    objc_msgSend(v11, "setTitle:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationTimestamp;
    v4[140] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_lastModifiedTimestamp;
    v4[140] |= 2u;
  }
  if (self->_when)
  {
    objc_msgSend(v11, "setWhen:");
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[136] = self->_allDay;
    v4[140] |= 0x10u;
  }
  if (-[SGDCKEvent locationsCount](self, "locationsCount"))
  {
    objc_msgSend(v11, "clearLocations");
    v6 = -[SGDCKEvent locationsCount](self, "locationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SGDCKEvent locationsAtIndex:](self, "locationsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addLocations:", v9);

      }
    }
  }
  if (self->_extraKey)
    objc_msgSend(v11, "setExtraKey:");
  v10 = v11;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v11[137] = self->_cancelled;
    v11[140] |= 0x20u;
  }
  if (self->_schemaOrg)
  {
    objc_msgSend(v11, "setSchemaOrg:");
    v10 = v11;
  }
  if (self->_domain)
  {
    objc_msgSend(v11, "setDomain:");
    v10 = v11;
  }
  if (self->_templateName)
  {
    objc_msgSend(v11, "setTemplateName:");
    v10 = v11;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_categoryType;
    v10[140] |= 8u;
  }
  if (self->_interactionInfo)
  {
    objc_msgSend(v11, "setInteractionInfo:");
    v10 = v11;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v10 + 3) = self->_parentEntityType;
    v10[140] |= 4u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v11, "setMetadata:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char has;
  id v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_groupId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_sourceKey, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  v10 = -[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationTimestamp;
    *(_BYTE *)(v5 + 140) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_lastModifiedTimestamp;
    *(_BYTE *)(v5 + 140) |= 2u;
  }
  v15 = -[SGDCKTimeRange copyWithZone:](self->_when, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v15;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 136) = self->_allDay;
    *(_BYTE *)(v5 + 140) |= 0x10u;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = self->_locations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v5, "addLocations:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v19);
  }

  v23 = -[NSString copyWithZone:](self->_extraKey, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v23;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 137) = self->_cancelled;
    *(_BYTE *)(v5 + 140) |= 0x20u;
  }
  v25 = -[NSData copyWithZone:](self->_schemaOrg, "copyWithZone:", a3, (_QWORD)v36);
  v26 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v25;

  v27 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v27;

  v29 = -[NSString copyWithZone:](self->_templateName, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v29;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_categoryType;
    *(_BYTE *)(v5 + 140) |= 8u;
  }
  v31 = -[SGDCKInteractionInfo copyWithZone:](self->_interactionInfo, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v31;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_parentEntityType;
    *(_BYTE *)(v5 + 140) |= 4u;
  }
  v33 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *groupId;
  NSString *sourceKey;
  NSString *content;
  NSString *title;
  char has;
  char v10;
  SGDCKTimeRange *when;
  NSMutableArray *locations;
  NSString *extraKey;
  NSData *schemaOrg;
  NSString *domain;
  NSString *templateName;
  char v17;
  char v18;
  SGDCKInteractionInfo *interactionInfo;
  NSData *metadata;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_64;
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:"))
      goto LABEL_64;
  }
  sourceKey = self->_sourceKey;
  if ((unint64_t)sourceKey | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceKey, "isEqual:"))
      goto LABEL_64;
  }
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](content, "isEqual:"))
      goto LABEL_64;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_64;
  }
  has = (char)self->_has;
  v10 = *((_BYTE *)v4 + 140);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 1) == 0 || self->_creationTimestamp != *((double *)v4 + 1))
      goto LABEL_64;
  }
  else if ((*((_BYTE *)v4 + 140) & 1) != 0)
  {
    goto LABEL_64;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 2) == 0 || self->_lastModifiedTimestamp != *((double *)v4 + 2))
      goto LABEL_64;
  }
  else if ((*((_BYTE *)v4 + 140) & 2) != 0)
  {
    goto LABEL_64;
  }
  when = self->_when;
  if ((unint64_t)when | *((_QWORD *)v4 + 16))
  {
    if (!-[SGDCKTimeRange isEqual:](when, "isEqual:"))
      goto LABEL_64;
    has = (char)self->_has;
    v10 = *((_BYTE *)v4 + 140);
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0)
      goto LABEL_64;
    if (self->_allDay)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_64;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_64;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_64;
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((_QWORD *)v4 + 10)
    && !-[NSMutableArray isEqual:](locations, "isEqual:"))
  {
    goto LABEL_64;
  }
  extraKey = self->_extraKey;
  if ((unint64_t)extraKey | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](extraKey, "isEqual:"))
      goto LABEL_64;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 0x20) == 0)
      goto LABEL_64;
    if (self->_cancelled)
    {
      if (!*((_BYTE *)v4 + 137))
        goto LABEL_64;
    }
    else if (*((_BYTE *)v4 + 137))
    {
      goto LABEL_64;
    }
  }
  else if ((*((_BYTE *)v4 + 140) & 0x20) != 0)
  {
    goto LABEL_64;
  }
  schemaOrg = self->_schemaOrg;
  if ((unint64_t)schemaOrg | *((_QWORD *)v4 + 12) && !-[NSData isEqual:](schemaOrg, "isEqual:"))
    goto LABEL_64;
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_64;
  }
  templateName = self->_templateName;
  if ((unint64_t)templateName | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](templateName, "isEqual:"))
      goto LABEL_64;
  }
  v17 = (char)self->_has;
  v18 = *((_BYTE *)v4 + 140);
  if ((v17 & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 8) == 0 || self->_categoryType != *((_DWORD *)v4 + 8))
      goto LABEL_64;
  }
  else if ((*((_BYTE *)v4 + 140) & 8) != 0)
  {
    goto LABEL_64;
  }
  interactionInfo = self->_interactionInfo;
  if ((unint64_t)interactionInfo | *((_QWORD *)v4 + 9))
  {
    if (-[SGDCKInteractionInfo isEqual:](interactionInfo, "isEqual:"))
    {
      v17 = (char)self->_has;
      v18 = *((_BYTE *)v4 + 140);
      goto LABEL_57;
    }
LABEL_64:
    v21 = 0;
    goto LABEL_65;
  }
LABEL_57:
  if ((v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_parentEntityType != *((_QWORD *)v4 + 3))
      goto LABEL_64;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_64;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 11))
    v21 = -[NSData isEqual:](metadata, "isEqual:");
  else
    v21 = 1;
LABEL_65:

  return v21;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double creationTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double lastModifiedTimestamp;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;

  v32 = -[NSString hash](self->_groupId, "hash");
  v31 = -[NSString hash](self->_sourceKey, "hash");
  v30 = -[NSString hash](self->_content, "hash");
  v29 = -[NSString hash](self->_title, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    creationTimestamp = self->_creationTimestamp;
    v6 = -creationTimestamp;
    if (creationTimestamp >= 0.0)
      v6 = self->_creationTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v28 = v4;
  if ((has & 2) != 0)
  {
    lastModifiedTimestamp = self->_lastModifiedTimestamp;
    v11 = -lastModifiedTimestamp;
    if (lastModifiedTimestamp >= 0.0)
      v11 = self->_lastModifiedTimestamp;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v27 = v9;
  v26 = -[SGDCKTimeRange hash](self->_when, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v14 = -[NSMutableArray hash](self->_locations, "hash", 2654435761 * self->_allDay);
  else
    v14 = -[NSMutableArray hash](self->_locations, "hash", 0);
  v15 = v14;
  v16 = -[NSString hash](self->_extraKey, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v17 = 2654435761 * self->_cancelled;
  else
    v17 = 0;
  v18 = -[NSData hash](self->_schemaOrg, "hash");
  v19 = -[NSString hash](self->_domain, "hash");
  v20 = -[NSString hash](self->_templateName, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v21 = 2654435761 * self->_categoryType;
  else
    v21 = 0;
  v22 = -[SGDCKInteractionInfo hash](self->_interactionInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v23 = 2654435761 * self->_parentEntityType;
  else
    v23 = 0;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ -[NSData hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  SGDCKTimeRange *when;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SGDCKInteractionInfo *interactionInfo;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[SGDCKEvent setGroupId:](self, "setGroupId:");
  if (*((_QWORD *)v4 + 13))
    -[SGDCKEvent setSourceKey:](self, "setSourceKey:");
  if (*((_QWORD *)v4 + 5))
    -[SGDCKEvent setContent:](self, "setContent:");
  if (*((_QWORD *)v4 + 15))
    -[SGDCKEvent setTitle:](self, "setTitle:");
  v5 = *((_BYTE *)v4 + 140);
  if ((v5 & 1) != 0)
  {
    self->_creationTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 140);
  }
  if ((v5 & 2) != 0)
  {
    self->_lastModifiedTimestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  when = self->_when;
  v7 = *((_QWORD *)v4 + 16);
  if (when)
  {
    if (v7)
      -[SGDCKTimeRange mergeFrom:](when, "mergeFrom:");
  }
  else if (v7)
  {
    -[SGDCKEvent setWhen:](self, "setWhen:");
  }
  if ((*((_BYTE *)v4 + 140) & 0x10) != 0)
  {
    self->_allDay = *((_BYTE *)v4 + 136);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = *((id *)v4 + 10);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[SGDCKEvent addLocations:](self, "addLocations:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (*((_QWORD *)v4 + 7))
    -[SGDCKEvent setExtraKey:](self, "setExtraKey:");
  if ((*((_BYTE *)v4 + 140) & 0x20) != 0)
  {
    self->_cancelled = *((_BYTE *)v4 + 137);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 12))
    -[SGDCKEvent setSchemaOrg:](self, "setSchemaOrg:");
  if (*((_QWORD *)v4 + 6))
    -[SGDCKEvent setDomain:](self, "setDomain:");
  if (*((_QWORD *)v4 + 14))
    -[SGDCKEvent setTemplateName:](self, "setTemplateName:");
  if ((*((_BYTE *)v4 + 140) & 8) != 0)
  {
    self->_categoryType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
  interactionInfo = self->_interactionInfo;
  v14 = *((_QWORD *)v4 + 9);
  if (interactionInfo)
  {
    if (v14)
      -[SGDCKInteractionInfo mergeFrom:](interactionInfo, "mergeFrom:");
  }
  else if (v14)
  {
    -[SGDCKEvent setInteractionInfo:](self, "setInteractionInfo:");
  }
  if ((*((_BYTE *)v4 + 140) & 4) != 0)
  {
    self->_parentEntityType = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 11))
    -[SGDCKEvent setMetadata:](self, "setMetadata:");

}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (void)setSourceKey:(id)a3
{
  objc_storeStrong((id *)&self->_sourceKey, a3);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (double)lastModifiedTimestamp
{
  return self->_lastModifiedTimestamp;
}

- (SGDCKTimeRange)when
{
  return self->_when;
}

- (void)setWhen:(id)a3
{
  objc_storeStrong((id *)&self->_when, a3);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (NSString)extraKey
{
  return self->_extraKey;
}

- (void)setExtraKey:(id)a3
{
  objc_storeStrong((id *)&self->_extraKey, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSData)schemaOrg
{
  return self->_schemaOrg;
}

- (void)setSchemaOrg:(id)a3
{
  objc_storeStrong((id *)&self->_schemaOrg, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)templateName
{
  return self->_templateName;
}

- (void)setTemplateName:(id)a3
{
  objc_storeStrong((id *)&self->_templateName, a3);
}

- (int)categoryType
{
  return self->_categoryType;
}

- (SGDCKInteractionInfo)interactionInfo
{
  return self->_interactionInfo;
}

- (void)setInteractionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_interactionInfo, a3);
}

- (int64_t)parentEntityType
{
  return self->_parentEntityType;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_schemaOrg, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_interactionInfo, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_extraKey, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (Class)locationsType
{
  return (Class)objc_opt_class();
}

@end
