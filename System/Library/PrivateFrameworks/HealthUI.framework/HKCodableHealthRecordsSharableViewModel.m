@implementation HKCodableHealthRecordsSharableViewModel

- (BOOL)hasConceptIdentifier
{
  return self->_conceptIdentifier != 0;
}

- (void)setCategory:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPreferredName
{
  return self->_preferredName != 0;
}

- (BOOL)hasEduContent
{
  return self->_eduContent != 0;
}

- (void)setIsPinned:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isPinned = a3;
}

- (void)setHasIsPinned:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPinned
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasLocalizedEducationContent
{
  return self->_localizedEducationContent != 0;
}

- (BOOL)hasLatestRecord
{
  return self->_latestRecord != 0;
}

- (void)clearAllRecords
{
  -[NSMutableArray removeAllObjects](self->_allRecords, "removeAllObjects");
}

- (void)addAllRecords:(id)a3
{
  id v4;
  NSMutableArray *allRecords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allRecords = self->_allRecords;
  v8 = v4;
  if (!allRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_allRecords;
    self->_allRecords = v6;

    v4 = v8;
    allRecords = self->_allRecords;
  }
  -[NSMutableArray addObject:](allRecords, "addObject:", v4);

}

- (unint64_t)allRecordsCount
{
  return -[NSMutableArray count](self->_allRecords, "count");
}

- (id)allRecordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allRecords, "objectAtIndex:", a3);
}

+ (Class)allRecordsType
{
  return (Class)objc_opt_class();
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)HKCodableHealthRecordsSharableViewModel;
  -[HKCodableHealthRecordsSharableViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHealthRecordsSharableViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *conceptIdentifier;
  void *v6;
  NSString *preferredName;
  HKCodableHealthRecordsEduContent *eduContent;
  void *v9;
  void *v10;
  HKCodableHealthRecordsLocalizedEducationContent *localizedEducationContent;
  void *v12;
  HKCodableHealthRecordsIndividualRecord *latestRecord;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char has;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  conceptIdentifier = self->_conceptIdentifier;
  if (conceptIdentifier)
    objc_msgSend(v3, "setObject:forKey:", conceptIdentifier, CFSTR("conceptIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_category);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("category"));

  }
  preferredName = self->_preferredName;
  if (preferredName)
    objc_msgSend(v4, "setObject:forKey:", preferredName, CFSTR("preferredName"));
  eduContent = self->_eduContent;
  if (eduContent)
  {
    -[HKCodableHealthRecordsEduContent dictionaryRepresentation](eduContent, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("eduContent"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPinned);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("isPinned"));

  }
  localizedEducationContent = self->_localizedEducationContent;
  if (localizedEducationContent)
  {
    -[HKCodableHealthRecordsLocalizedEducationContent dictionaryRepresentation](localizedEducationContent, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("localizedEducationContent"));

  }
  latestRecord = self->_latestRecord;
  if (latestRecord)
  {
    -[HKCodableHealthRecordsIndividualRecord dictionaryRepresentation](latestRecord, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("latestRecord"));

  }
  if (-[NSMutableArray count](self->_allRecords, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_allRecords, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = self->_allRecords;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("allRecords"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("minimumSupportedVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsSharableViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_conceptIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_preferredName)
    PBDataWriterWriteStringField();
  if (self->_eduContent)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_latestRecord)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_allRecords;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_localizedEducationContent)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_conceptIdentifier)
  {
    objc_msgSend(v4, "setConceptIdentifier:");
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_category;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  if (self->_preferredName)
  {
    objc_msgSend(v11, "setPreferredName:");
    v4 = v11;
  }
  if (self->_eduContent)
  {
    objc_msgSend(v11, "setEduContent:");
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_isPinned;
    *((_BYTE *)v4 + 84) |= 8u;
  }
  if (self->_latestRecord)
    objc_msgSend(v11, "setLatestRecord:");
  if (-[HKCodableHealthRecordsSharableViewModel allRecordsCount](self, "allRecordsCount"))
  {
    objc_msgSend(v11, "clearAllRecords");
    v5 = -[HKCodableHealthRecordsSharableViewModel allRecordsCount](self, "allRecordsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HKCodableHealthRecordsSharableViewModel allRecordsAtIndex:](self, "allRecordsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAllRecords:", v8);

      }
    }
  }
  has = (char)self->_has;
  v10 = v11;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v11 + 2) = self->_latestSupportedVersion;
    *((_BYTE *)v11 + 84) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)v11 + 3) = self->_minimumSupportedVersion;
    *((_BYTE *)v11 + 84) |= 4u;
  }
  if (self->_localizedEducationContent)
  {
    objc_msgSend(v11, "setLocalizedEducationContent:");
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
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char has;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_conceptIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_category;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_preferredName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  v10 = -[HKCodableHealthRecordsEduContent copyWithZone:](self->_eduContent, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_isPinned;
    *(_BYTE *)(v5 + 84) |= 8u;
  }
  v12 = -[HKCodableHealthRecordsIndividualRecord copyWithZone:](self->_latestRecord, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_allRecords;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addAllRecords:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 84) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 84) |= 4u;
  }
  v21 = -[HKCodableHealthRecordsLocalizedEducationContent copyWithZone:](self->_localizedEducationContent, "copyWithZone:", a3, (_QWORD)v24);
  v22 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *conceptIdentifier;
  NSString *preferredName;
  HKCodableHealthRecordsEduContent *eduContent;
  HKCodableHealthRecordsIndividualRecord *latestRecord;
  NSMutableArray *allRecords;
  HKCodableHealthRecordsLocalizedEducationContent *localizedEducationContent;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  conceptIdentifier = self->_conceptIdentifier;
  if ((unint64_t)conceptIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](conceptIdentifier, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_category != *((_QWORD *)v4 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_37;
  }
  preferredName = self->_preferredName;
  if ((unint64_t)preferredName | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](preferredName, "isEqual:"))
  {
    goto LABEL_37;
  }
  eduContent = self->_eduContent;
  if ((unint64_t)eduContent | *((_QWORD *)v4 + 6))
  {
    if (!-[HKCodableHealthRecordsEduContent isEqual:](eduContent, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) != 0)
    {
      if (self->_isPinned)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_37;
        goto LABEL_21;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_21;
    }
LABEL_37:
    v11 = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 84) & 8) != 0)
    goto LABEL_37;
LABEL_21:
  latestRecord = self->_latestRecord;
  if ((unint64_t)latestRecord | *((_QWORD *)v4 + 7)
    && !-[HKCodableHealthRecordsIndividualRecord isEqual:](latestRecord, "isEqual:"))
  {
    goto LABEL_37;
  }
  allRecords = self->_allRecords;
  if ((unint64_t)allRecords | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](allRecords, "isEqual:"))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 3))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_37;
  }
  localizedEducationContent = self->_localizedEducationContent;
  if ((unint64_t)localizedEducationContent | *((_QWORD *)v4 + 8))
    v11 = -[HKCodableHealthRecordsLocalizedEducationContent isEqual:](localizedEducationContent, "isEqual:");
  else
    v11 = 1;
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_conceptIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_category;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_preferredName, "hash");
  v6 = -[HKCodableHealthRecordsEduContent hash](self->_eduContent, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v7 = 2654435761 * self->_isPinned;
  else
    v7 = 0;
  v8 = -[HKCodableHealthRecordsIndividualRecord hash](self->_latestRecord, "hash");
  v9 = -[NSMutableArray hash](self->_allRecords, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_9;
LABEL_11:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[HKCodableHealthRecordsLocalizedEducationContent hash](self->_localizedEducationContent, "hash");
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_9:
  v11 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[HKCodableHealthRecordsLocalizedEducationContent hash](self->_localizedEducationContent, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableHealthRecordsEduContent *eduContent;
  uint64_t v6;
  HKCodableHealthRecordsIndividualRecord *latestRecord;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  HKCodableHealthRecordsLocalizedEducationContent *localizedEducationContent;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[HKCodableHealthRecordsSharableViewModel setConceptIdentifier:](self, "setConceptIdentifier:");
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_category = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 9))
    -[HKCodableHealthRecordsSharableViewModel setPreferredName:](self, "setPreferredName:");
  eduContent = self->_eduContent;
  v6 = *((_QWORD *)v4 + 6);
  if (eduContent)
  {
    if (v6)
      -[HKCodableHealthRecordsEduContent mergeFrom:](eduContent, "mergeFrom:");
  }
  else if (v6)
  {
    -[HKCodableHealthRecordsSharableViewModel setEduContent:](self, "setEduContent:");
  }
  if ((*((_BYTE *)v4 + 84) & 8) != 0)
  {
    self->_isPinned = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 8u;
  }
  latestRecord = self->_latestRecord;
  v8 = *((_QWORD *)v4 + 7);
  if (latestRecord)
  {
    if (v8)
      -[HKCodableHealthRecordsIndividualRecord mergeFrom:](latestRecord, "mergeFrom:");
  }
  else if (v8)
  {
    -[HKCodableHealthRecordsSharableViewModel setLatestRecord:](self, "setLatestRecord:");
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = *((id *)v4 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[HKCodableHealthRecordsSharableViewModel addAllRecords:](self, "addAllRecords:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v14 = *((_BYTE *)v4 + 84);
  if ((v14 & 2) != 0)
  {
    self->_latestSupportedVersion = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v14 = *((_BYTE *)v4 + 84);
  }
  if ((v14 & 4) != 0)
  {
    self->_minimumSupportedVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  localizedEducationContent = self->_localizedEducationContent;
  v16 = *((_QWORD *)v4 + 8);
  if (localizedEducationContent)
  {
    if (v16)
      -[HKCodableHealthRecordsLocalizedEducationContent mergeFrom:](localizedEducationContent, "mergeFrom:");
  }
  else if (v16)
  {
    -[HKCodableHealthRecordsSharableViewModel setLocalizedEducationContent:](self, "setLocalizedEducationContent:");
  }

}

- (NSString)conceptIdentifier
{
  return self->_conceptIdentifier;
}

- (void)setConceptIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_conceptIdentifier, a3);
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (void)setPreferredName:(id)a3
{
  objc_storeStrong((id *)&self->_preferredName, a3);
}

- (HKCodableHealthRecordsEduContent)eduContent
{
  return self->_eduContent;
}

- (void)setEduContent:(id)a3
{
  objc_storeStrong((id *)&self->_eduContent, a3);
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (HKCodableHealthRecordsLocalizedEducationContent)localizedEducationContent
{
  return self->_localizedEducationContent;
}

- (void)setLocalizedEducationContent:(id)a3
{
  objc_storeStrong((id *)&self->_localizedEducationContent, a3);
}

- (HKCodableHealthRecordsIndividualRecord)latestRecord
{
  return self->_latestRecord;
}

- (void)setLatestRecord:(id)a3
{
  objc_storeStrong((id *)&self->_latestRecord, a3);
}

- (NSMutableArray)allRecords
{
  return self->_allRecords;
}

- (void)setAllRecords:(id)a3
{
  objc_storeStrong((id *)&self->_allRecords, a3);
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_localizedEducationContent, 0);
  objc_storeStrong((id *)&self->_latestRecord, 0);
  objc_storeStrong((id *)&self->_eduContent, 0);
  objc_storeStrong((id *)&self->_conceptIdentifier, 0);
  objc_storeStrong((id *)&self->_allRecords, 0);
}

@end
