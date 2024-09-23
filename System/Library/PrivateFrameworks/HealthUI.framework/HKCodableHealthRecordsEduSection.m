@implementation HKCodableHealthRecordsEduSection

- (void)setSectionType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sectionType = a3;
}

- (void)setHasSectionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSectionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSectionLocalizedContent
{
  return self->_sectionLocalizedContent != 0;
}

- (void)clearSectionLocaleIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_sectionLocaleIdentifiers, "removeAllObjects");
}

- (void)addSectionLocaleIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *sectionLocaleIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  v8 = v4;
  if (!sectionLocaleIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sectionLocaleIdentifiers;
    self->_sectionLocaleIdentifiers = v6;

    v4 = v8;
    sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  }
  -[NSMutableArray addObject:](sectionLocaleIdentifiers, "addObject:", v4);

}

- (unint64_t)sectionLocaleIdentifiersCount
{
  return -[NSMutableArray count](self->_sectionLocaleIdentifiers, "count");
}

- (id)sectionLocaleIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionLocaleIdentifiers, "objectAtIndex:", a3);
}

+ (Class)sectionLocaleIdentifiersType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HKCodableHealthRecordsEduSection;
  -[HKCodableHealthRecordsEduSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHealthRecordsEduSection dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *sectionLocaleIdentifiers;
  NSMutableArray *sectionValidRegionCodes;
  NSMutableArray *sectionAttributions;
  NSMutableArray *sectionCitations;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sectionType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sectionType"));

  }
  sectionLocalizedContent = self->_sectionLocalizedContent;
  if (sectionLocalizedContent)
    objc_msgSend(v3, "setObject:forKey:", sectionLocalizedContent, CFSTR("sectionLocalizedContent"));
  sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  if (sectionLocaleIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", sectionLocaleIdentifiers, CFSTR("sectionLocaleIdentifiers"));
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
  return HKCodableHealthRecordsEduSectionReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_sectionLocalizedContent)
    PBDataWriterWriteStringField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_sectionLocaleIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_sectionValidRegionCodes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_sectionAttributions;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_sectionCitations;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  id v21;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_sectionType;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v21 = v4;
  if (self->_sectionLocalizedContent)
    objc_msgSend(v4, "setSectionLocalizedContent:");
  if (-[HKCodableHealthRecordsEduSection sectionLocaleIdentifiersCount](self, "sectionLocaleIdentifiersCount"))
  {
    objc_msgSend(v21, "clearSectionLocaleIdentifiers");
    v5 = -[HKCodableHealthRecordsEduSection sectionLocaleIdentifiersCount](self, "sectionLocaleIdentifiersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HKCodableHealthRecordsEduSection sectionLocaleIdentifiersAtIndex:](self, "sectionLocaleIdentifiersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSectionLocaleIdentifiers:", v8);

      }
    }
  }
  if (-[HKCodableHealthRecordsEduSection sectionValidRegionCodesCount](self, "sectionValidRegionCodesCount"))
  {
    objc_msgSend(v21, "clearSectionValidRegionCodes");
    v9 = -[HKCodableHealthRecordsEduSection sectionValidRegionCodesCount](self, "sectionValidRegionCodesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HKCodableHealthRecordsEduSection sectionValidRegionCodesAtIndex:](self, "sectionValidRegionCodesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSectionValidRegionCodes:", v12);

      }
    }
  }
  if (-[HKCodableHealthRecordsEduSection sectionAttributionsCount](self, "sectionAttributionsCount"))
  {
    objc_msgSend(v21, "clearSectionAttributions");
    v13 = -[HKCodableHealthRecordsEduSection sectionAttributionsCount](self, "sectionAttributionsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[HKCodableHealthRecordsEduSection sectionAttributionsAtIndex:](self, "sectionAttributionsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSectionAttributions:", v16);

      }
    }
  }
  if (-[HKCodableHealthRecordsEduSection sectionCitationsCount](self, "sectionCitationsCount"))
  {
    objc_msgSend(v21, "clearSectionCitations");
    v17 = -[HKCodableHealthRecordsEduSection sectionCitationsCount](self, "sectionCitationsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[HKCodableHealthRecordsEduSection sectionCitationsAtIndex:](self, "sectionCitationsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSectionCitations:", v20);

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
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_sectionType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sectionLocalizedContent, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = self->_sectionLocaleIdentifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v47;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend(v6, "addSectionLocaleIdentifiers:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v11);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = self->_sectionValidRegionCodes;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v19), "copyWithZone:", a3);
        objc_msgSend(v6, "addSectionValidRegionCodes:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v17);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = self->_sectionAttributions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v25), "copyWithZone:", a3);
        objc_msgSend(v6, "addSectionAttributions:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v23);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = self->_sectionCitations;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v31), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend(v6, "addSectionCitations:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v29);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionLocalizedContent;
  NSMutableArray *sectionLocaleIdentifiers;
  NSMutableArray *sectionValidRegionCodes;
  NSMutableArray *sectionAttributions;
  NSMutableArray *sectionCitations;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_sectionType != *((_QWORD *)v4 + 1))
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
  sectionLocaleIdentifiers = self->_sectionLocaleIdentifiers;
  if ((unint64_t)sectionLocaleIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](sectionLocaleIdentifiers, "isEqual:"))
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_sectionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sectionLocalizedContent, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_sectionLocaleIdentifiers, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_sectionValidRegionCodes, "hash");
  v7 = -[NSMutableArray hash](self->_sectionAttributions, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_sectionCitations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_sectionType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[HKCodableHealthRecordsEduSection setSectionLocalizedContent:](self, "setSectionLocalizedContent:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = v5[4];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        -[HKCodableHealthRecordsEduSection addSectionLocaleIdentifiers:](self, "addSectionLocaleIdentifiers:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v5[6];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        -[HKCodableHealthRecordsEduSection addSectionValidRegionCodes:](self, "addSectionValidRegionCodes:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v13);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v5[2];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        -[HKCodableHealthRecordsEduSection addSectionAttributions:](self, "addSectionAttributions:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v5[3];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[HKCodableHealthRecordsEduSection addSectionCitations:](self, "addSectionCitations:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * m), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSString)sectionLocalizedContent
{
  return self->_sectionLocalizedContent;
}

- (void)setSectionLocalizedContent:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLocalizedContent, a3);
}

- (NSMutableArray)sectionLocaleIdentifiers
{
  return self->_sectionLocaleIdentifiers;
}

- (void)setSectionLocaleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionLocaleIdentifiers, a3);
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
  objc_storeStrong((id *)&self->_sectionLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionCitations, 0);
  objc_storeStrong((id *)&self->_sectionAttributions, 0);
}

@end
