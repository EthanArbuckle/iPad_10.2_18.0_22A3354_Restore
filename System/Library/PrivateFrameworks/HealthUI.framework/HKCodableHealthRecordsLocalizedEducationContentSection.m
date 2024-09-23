@implementation HKCodableHealthRecordsLocalizedEducationContentSection

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSectionLocalizedContent
{
  return self->_sectionLocalizedContent != 0;
}

- (BOOL)hasSectionLocaleIdentifier
{
  return self->_sectionLocaleIdentifier != 0;
}

- (void)clearSectionValidRegionCodes
{
  -[NSMutableArray removeAllObjects](self->_sectionValidRegionCodes, "removeAllObjects");
}

- (void)addSectionValidRegionCodes:(id)a3
{
  id v4;
  NSMutableArray *sectionValidRegionCodes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionValidRegionCodes = self->_sectionValidRegionCodes;
  v8 = v4;
  if (!sectionValidRegionCodes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sectionValidRegionCodes;
    self->_sectionValidRegionCodes = v6;

    v4 = v8;
    sectionValidRegionCodes = self->_sectionValidRegionCodes;
  }
  -[NSMutableArray addObject:](sectionValidRegionCodes, "addObject:", v4);

}

- (unint64_t)sectionValidRegionCodesCount
{
  return -[NSMutableArray count](self->_sectionValidRegionCodes, "count");
}

- (id)sectionValidRegionCodesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionValidRegionCodes, "objectAtIndex:", a3);
}

+ (Class)sectionValidRegionCodesType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionAttributions
{
  -[NSMutableArray removeAllObjects](self->_sectionAttributions, "removeAllObjects");
}

- (void)addSectionAttributions:(id)a3
{
  id v4;
  NSMutableArray *sectionAttributions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionAttributions = self->_sectionAttributions;
  v8 = v4;
  if (!sectionAttributions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sectionAttributions;
    self->_sectionAttributions = v6;

    v4 = v8;
    sectionAttributions = self->_sectionAttributions;
  }
  -[NSMutableArray addObject:](sectionAttributions, "addObject:", v4);

}

- (unint64_t)sectionAttributionsCount
{
  return -[NSMutableArray count](self->_sectionAttributions, "count");
}

- (id)sectionAttributionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionAttributions, "objectAtIndex:", a3);
}

+ (Class)sectionAttributionsType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionCitations
{
  -[NSMutableArray removeAllObjects](self->_sectionCitations, "removeAllObjects");
}

- (void)addSectionCitations:(id)a3
{
  id v4;
  NSMutableArray *sectionCitations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionCitations = self->_sectionCitations;
  v8 = v4;
  if (!sectionCitations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sectionCitations;
    self->_sectionCitations = v6;

    v4 = v8;
    sectionCitations = self->_sectionCitations;
  }
  -[NSMutableArray addObject:](sectionCitations, "addObject:", v4);

}

- (unint64_t)sectionCitationsCount
{
  return -[NSMutableArray count](self->_sectionCitations, "count");
}

- (id)sectionCitationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionCitations, "objectAtIndex:", a3);
}

+ (Class)sectionCitationsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HKCodableHealthRecordsLocalizedEducationContentSection;
  -[HKCodableHealthRecordsLocalizedEducationContentSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHealthRecordsLocalizedEducationContentSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sectionLocalizedContent;
  NSString *sectionLocaleIdentifier;
  NSMutableArray *sectionValidRegionCodes;
  NSMutableArray *sectionAttributions;
  NSMutableArray *sectionCitations;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  sectionLocalizedContent = self->_sectionLocalizedContent;
  if (sectionLocalizedContent)
    objc_msgSend(v3, "setObject:forKey:", sectionLocalizedContent, CFSTR("sectionLocalizedContent"));
  sectionLocaleIdentifier = self->_sectionLocaleIdentifier;
  if (sectionLocaleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sectionLocaleIdentifier, CFSTR("sectionLocaleIdentifier"));
  sectionValidRegionCodes = self->_sectionValidRegionCodes;
  if (sectionValidRegionCodes)
    objc_msgSend(v3, "setObject:forKey:", sectionValidRegionCodes, CFSTR("sectionValidRegionCodes"));
  sectionAttributions = self->_sectionAttributions;
  if (sectionAttributions)
    objc_msgSend(v3, "setObject:forKey:", sectionAttributions, CFSTR("sectionAttributions"));
  sectionCitations = self->_sectionCitations;
  if (sectionCitations)
    objc_msgSend(v3, "setObject:forKey:", sectionCitations, CFSTR("sectionCitations"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsLocalizedEducationContentSectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_sectionLocalizedContent)
    PBDataWriterWriteStringField();
  if (self->_sectionLocaleIdentifier)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_sectionValidRegionCodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_sectionAttributions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_sectionCitations;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  id v17;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_type;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v17 = v4;
  if (self->_sectionLocalizedContent)
    objc_msgSend(v4, "setSectionLocalizedContent:");
  if (self->_sectionLocaleIdentifier)
    objc_msgSend(v17, "setSectionLocaleIdentifier:");
  if (-[HKCodableHealthRecordsLocalizedEducationContentSection sectionValidRegionCodesCount](self, "sectionValidRegionCodesCount"))
  {
    objc_msgSend(v17, "clearSectionValidRegionCodes");
    v5 = -[HKCodableHealthRecordsLocalizedEducationContentSection sectionValidRegionCodesCount](self, "sectionValidRegionCodesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HKCodableHealthRecordsLocalizedEducationContentSection sectionValidRegionCodesAtIndex:](self, "sectionValidRegionCodesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSectionValidRegionCodes:", v8);

      }
    }
  }
  if (-[HKCodableHealthRecordsLocalizedEducationContentSection sectionAttributionsCount](self, "sectionAttributionsCount"))
  {
    objc_msgSend(v17, "clearSectionAttributions");
    v9 = -[HKCodableHealthRecordsLocalizedEducationContentSection sectionAttributionsCount](self, "sectionAttributionsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HKCodableHealthRecordsLocalizedEducationContentSection sectionAttributionsAtIndex:](self, "sectionAttributionsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSectionAttributions:", v12);

      }
    }
  }
  if (-[HKCodableHealthRecordsLocalizedEducationContentSection sectionCitationsCount](self, "sectionCitationsCount"))
  {
    objc_msgSend(v17, "clearSectionCitations");
    v13 = -[HKCodableHealthRecordsLocalizedEducationContentSection sectionCitationsCount](self, "sectionCitationsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[HKCodableHealthRecordsLocalizedEducationContentSection sectionCitationsAtIndex:](self, "sectionCitationsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addSectionCitations:", v16);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_type;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sectionLocalizedContent, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[NSString copyWithZone:](self->_sectionLocaleIdentifier, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v11 = self->_sectionValidRegionCodes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v15), "copyWithZone:", a3);
        objc_msgSend(v6, "addSectionValidRegionCodes:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v13);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = self->_sectionAttributions;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v21), "copyWithZone:", a3);
        objc_msgSend(v6, "addSectionAttributions:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v19);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self->_sectionCitations;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v31;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend(v6, "addSectionCitations:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v25);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionLocalizedContent;
  NSString *sectionLocaleIdentifier;
  NSMutableArray *sectionValidRegionCodes;
  NSMutableArray *sectionAttributions;
  NSMutableArray *sectionCitations;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_type != *((_QWORD *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  sectionLocalizedContent = self->_sectionLocalizedContent;
  if ((unint64_t)sectionLocalizedContent | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](sectionLocalizedContent, "isEqual:"))
  {
    goto LABEL_17;
  }
  sectionLocaleIdentifier = self->_sectionLocaleIdentifier;
  if ((unint64_t)sectionLocaleIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionLocaleIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  sectionValidRegionCodes = self->_sectionValidRegionCodes;
  if ((unint64_t)sectionValidRegionCodes | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](sectionValidRegionCodes, "isEqual:"))
      goto LABEL_17;
  }
  sectionAttributions = self->_sectionAttributions;
  if ((unint64_t)sectionAttributions | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](sectionAttributions, "isEqual:"))
      goto LABEL_17;
  }
  sectionCitations = self->_sectionCitations;
  if ((unint64_t)sectionCitations | *((_QWORD *)v4 + 3))
    v10 = -[NSMutableArray isEqual:](sectionCitations, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sectionLocalizedContent, "hash") ^ v3;
  v5 = -[NSString hash](self->_sectionLocaleIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_sectionValidRegionCodes, "hash");
  v7 = -[NSMutableArray hash](self->_sectionAttributions, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_sectionCitations, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[7] & 1) != 0)
  {
    self->_type = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[5])
    -[HKCodableHealthRecordsLocalizedEducationContentSection setSectionLocalizedContent:](self, "setSectionLocalizedContent:");
  if (*((_QWORD *)v5 + 4))
    -[HKCodableHealthRecordsLocalizedEducationContentSection setSectionLocaleIdentifier:](self, "setSectionLocaleIdentifier:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v5 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[HKCodableHealthRecordsLocalizedEducationContentSection addSectionValidRegionCodes:](self, "addSectionValidRegionCodes:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v5 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[HKCodableHealthRecordsLocalizedEducationContentSection addSectionAttributions:](self, "addSectionAttributions:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v5 + 3);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[HKCodableHealthRecordsLocalizedEducationContentSection addSectionCitations:](self, "addSectionCitations:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)sectionLocalizedContent
{
  return self->_sectionLocalizedContent;
}

- (void)setSectionLocalizedContent:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLocalizedContent, a3);
}

- (NSString)sectionLocaleIdentifier
{
  return self->_sectionLocaleIdentifier;
}

- (void)setSectionLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLocaleIdentifier, a3);
}

- (NSMutableArray)sectionValidRegionCodes
{
  return self->_sectionValidRegionCodes;
}

- (void)setSectionValidRegionCodes:(id)a3
{
  objc_storeStrong((id *)&self->_sectionValidRegionCodes, a3);
}

- (NSMutableArray)sectionAttributions
{
  return self->_sectionAttributions;
}

- (void)setSectionAttributions:(id)a3
{
  objc_storeStrong((id *)&self->_sectionAttributions, a3);
}

- (NSMutableArray)sectionCitations
{
  return self->_sectionCitations;
}

- (void)setSectionCitations:(id)a3
{
  objc_storeStrong((id *)&self->_sectionCitations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionValidRegionCodes, 0);
  objc_storeStrong((id *)&self->_sectionLocalizedContent, 0);
  objc_storeStrong((id *)&self->_sectionLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionCitations, 0);
  objc_storeStrong((id *)&self->_sectionAttributions, 0);
}

@end
