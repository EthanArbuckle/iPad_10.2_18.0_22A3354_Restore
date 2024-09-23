@implementation NTKProtoPigmentCollectionConfig

- (BOOL)hasDefaultColorOptionName
{
  return self->_defaultColorOptionName != 0;
}

- (BOOL)hasFallbackDefaultColorOptionName
{
  return self->_fallbackDefaultColorOptionName != 0;
}

- (BOOL)hasDefaultConfigAttributeName
{
  return self->_defaultConfigAttributeName != 0;
}

- (void)clearDefaultGalleryColorNames
{
  -[NSMutableArray removeAllObjects](self->_defaultGalleryColorNames, "removeAllObjects");
}

- (void)addDefaultGalleryColorNames:(id)a3
{
  id v4;
  NSMutableArray *defaultGalleryColorNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  defaultGalleryColorNames = self->_defaultGalleryColorNames;
  v8 = v4;
  if (!defaultGalleryColorNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_defaultGalleryColorNames;
    self->_defaultGalleryColorNames = v6;

    v4 = v8;
    defaultGalleryColorNames = self->_defaultGalleryColorNames;
  }
  -[NSMutableArray addObject:](defaultGalleryColorNames, "addObject:", v4);

}

- (unint64_t)defaultGalleryColorNamesCount
{
  return -[NSMutableArray count](self->_defaultGalleryColorNames, "count");
}

- (id)defaultGalleryColorNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_defaultGalleryColorNames, "objectAtIndex:", a3);
}

+ (Class)defaultGalleryColorNamesType
{
  return (Class)objc_opt_class();
}

- (void)setSensitivity:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sensitivity = a3;
}

- (void)setHasSensitivity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSensitivity
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsAddable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isAddable = a3;
}

- (void)setHasIsAddable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAddable
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSortedByHue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sortedByHue = a3;
}

- (void)setHasSortedByHue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSortedByHue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSupportsSlider:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_supportsSlider = a3;
}

- (void)setHasSupportsSlider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsSlider
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasFeatureFlag
{
  return self->_featureFlag != 0;
}

- (void)setExcludesDuotone:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_excludesDuotone = a3;
}

- (void)setHasExcludesDuotone:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExcludesDuotone
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearExclusions
{
  -[NSMutableArray removeAllObjects](self->_exclusions, "removeAllObjects");
}

- (void)addExclusions:(id)a3
{
  id v4;
  NSMutableArray *exclusions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  exclusions = self->_exclusions;
  v8 = v4;
  if (!exclusions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_exclusions;
    self->_exclusions = v6;

    v4 = v8;
    exclusions = self->_exclusions;
  }
  -[NSMutableArray addObject:](exclusions, "addObject:", v4);

}

- (unint64_t)exclusionsCount
{
  return -[NSMutableArray count](self->_exclusions, "count");
}

- (id)exclusionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_exclusions, "objectAtIndex:", a3);
}

+ (Class)exclusionsType
{
  return (Class)objc_opt_class();
}

- (void)clearMigrations
{
  -[NSMutableArray removeAllObjects](self->_migrations, "removeAllObjects");
}

- (void)addMigration:(id)a3
{
  id v4;
  NSMutableArray *migrations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  migrations = self->_migrations;
  v8 = v4;
  if (!migrations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_migrations;
    self->_migrations = v6;

    v4 = v8;
    migrations = self->_migrations;
  }
  -[NSMutableArray addObject:](migrations, "addObject:", v4);

}

- (unint64_t)migrationsCount
{
  return -[NSMutableArray count](self->_migrations, "count");
}

- (id)migrationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_migrations, "objectAtIndex:", a3);
}

+ (Class)migrationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCollectionOverride
{
  return self->_collectionOverride != 0;
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
  v8.super_class = (Class)NTKProtoPigmentCollectionConfig;
  -[NTKProtoPigmentCollectionConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoPigmentCollectionConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *defaultColorOptionName;
  NSString *fallbackDefaultColorOptionName;
  NSString *defaultConfigAttributeName;
  NSMutableArray *defaultGalleryColorNames;
  char has;
  void *v10;
  NSString *featureFlag;
  void *v12;
  NSMutableArray *exclusions;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSString *collectionOverride;
  void *v23;
  void *v24;
  void *v25;
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
  defaultColorOptionName = self->_defaultColorOptionName;
  if (defaultColorOptionName)
    objc_msgSend(v3, "setObject:forKey:", defaultColorOptionName, CFSTR("defaultColorOptionName"));
  fallbackDefaultColorOptionName = self->_fallbackDefaultColorOptionName;
  if (fallbackDefaultColorOptionName)
    objc_msgSend(v4, "setObject:forKey:", fallbackDefaultColorOptionName, CFSTR("fallbackDefaultColorOptionName"));
  defaultConfigAttributeName = self->_defaultConfigAttributeName;
  if (defaultConfigAttributeName)
    objc_msgSend(v4, "setObject:forKey:", defaultConfigAttributeName, CFSTR("defaultConfigAttributeName"));
  defaultGalleryColorNames = self->_defaultGalleryColorNames;
  if (defaultGalleryColorNames)
    objc_msgSend(v4, "setObject:forKey:", defaultGalleryColorNames, CFSTR("defaultGalleryColorNames"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sensitivity);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("sensitivity"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAddable);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("isAddable"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sortedByHue);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("sortedByHue"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSlider);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("supportsSlider"));

  }
LABEL_14:
  featureFlag = self->_featureFlag;
  if (featureFlag)
    objc_msgSend(v4, "setObject:forKey:", featureFlag, CFSTR("featureFlag"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_excludesDuotone);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("excludesDuotone"));

  }
  exclusions = self->_exclusions;
  if (exclusions)
    objc_msgSend(v4, "setObject:forKey:", exclusions, CFSTR("exclusions"));
  if (-[NSMutableArray count](self->_migrations, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_migrations, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = self->_migrations;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("migration"));
  }
  collectionOverride = self->_collectionOverride;
  if (collectionOverride)
    objc_msgSend(v4, "setObject:forKey:", collectionOverride, CFSTR("collectionOverride"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoPigmentCollectionConfigReadFrom(self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
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
  if (self->_defaultColorOptionName)
    PBDataWriterWriteStringField();
  if (self->_fallbackDefaultColorOptionName)
    PBDataWriterWriteStringField();
  if (self->_defaultConfigAttributeName)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_defaultGalleryColorNames;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_16:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_18:
    PBDataWriterWriteBOOLField();
LABEL_19:
  if (self->_featureFlag)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_exclusions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
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
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_migrations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
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
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if (self->_collectionOverride)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  _BYTE *v18;

  v18 = a3;
  if (self->_defaultColorOptionName)
    objc_msgSend(v18, "setDefaultColorOptionName:");
  if (self->_fallbackDefaultColorOptionName)
    objc_msgSend(v18, "setFallbackDefaultColorOptionName:");
  if (self->_defaultConfigAttributeName)
    objc_msgSend(v18, "setDefaultConfigAttributeName:");
  if (-[NTKProtoPigmentCollectionConfig defaultGalleryColorNamesCount](self, "defaultGalleryColorNamesCount"))
  {
    objc_msgSend(v18, "clearDefaultGalleryColorNames");
    v4 = -[NTKProtoPigmentCollectionConfig defaultGalleryColorNamesCount](self, "defaultGalleryColorNamesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NTKProtoPigmentCollectionConfig defaultGalleryColorNamesAtIndex:](self, "defaultGalleryColorNamesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addDefaultGalleryColorNames:", v7);

      }
    }
  }
  has = (char)self->_has;
  v9 = v18;
  if ((has & 4) != 0)
  {
    v18[74] = self->_sensitivity;
    v18[80] |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v18[73] = self->_isAddable;
  v18[80] |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_33:
  v18[75] = self->_sortedByHue;
  v18[80] |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    v18[76] = self->_supportsSlider;
    v18[80] |= 0x10u;
  }
LABEL_16:
  if (self->_featureFlag)
  {
    objc_msgSend(v18, "setFeatureFlag:");
    v9 = v18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9[72] = self->_excludesDuotone;
    v9[80] |= 1u;
  }
  if (-[NTKProtoPigmentCollectionConfig exclusionsCount](self, "exclusionsCount"))
  {
    objc_msgSend(v18, "clearExclusions");
    v10 = -[NTKProtoPigmentCollectionConfig exclusionsCount](self, "exclusionsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[NTKProtoPigmentCollectionConfig exclusionsAtIndex:](self, "exclusionsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addExclusions:", v13);

      }
    }
  }
  if (-[NTKProtoPigmentCollectionConfig migrationsCount](self, "migrationsCount"))
  {
    objc_msgSend(v18, "clearMigrations");
    v14 = -[NTKProtoPigmentCollectionConfig migrationsCount](self, "migrationsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[NTKProtoPigmentCollectionConfig migrationAtIndex:](self, "migrationAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMigration:", v17);

      }
    }
  }
  if (self->_collectionOverride)
    objc_msgSend(v18, "setCollectionOverride:");

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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char has;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  uint64_t v33;
  void *v34;
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
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_defaultColorOptionName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_fallbackDefaultColorOptionName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_defaultConfigAttributeName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = self->_defaultGalleryColorNames;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDefaultGalleryColorNames:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v14);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 74) = self->_sensitivity;
    *(_BYTE *)(v5 + 80) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 73) = self->_isAddable;
  *(_BYTE *)(v5 + 80) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_32:
  *(_BYTE *)(v5 + 75) = self->_sortedByHue;
  *(_BYTE *)(v5 + 80) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *(_BYTE *)(v5 + 76) = self->_supportsSlider;
    *(_BYTE *)(v5 + 80) |= 0x10u;
  }
LABEL_13:
  v19 = -[NSString copyWithZone:](self->_featureFlag, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_excludesDuotone;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v21 = self->_exclusions;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addExclusions:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v23);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = self->_migrations;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v5, "addMigration:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v29);
  }

  v33 = -[NSString copyWithZone:](self->_collectionOverride, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *defaultColorOptionName;
  NSString *fallbackDefaultColorOptionName;
  NSString *defaultConfigAttributeName;
  NSMutableArray *defaultGalleryColorNames;
  char has;
  NSString *featureFlag;
  NSMutableArray *exclusions;
  NSMutableArray *migrations;
  NSString *collectionOverride;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  defaultColorOptionName = self->_defaultColorOptionName;
  if ((unint64_t)defaultColorOptionName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](defaultColorOptionName, "isEqual:"))
      goto LABEL_59;
  }
  fallbackDefaultColorOptionName = self->_fallbackDefaultColorOptionName;
  if ((unint64_t)fallbackDefaultColorOptionName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](fallbackDefaultColorOptionName, "isEqual:"))
      goto LABEL_59;
  }
  defaultConfigAttributeName = self->_defaultConfigAttributeName;
  if ((unint64_t)defaultConfigAttributeName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](defaultConfigAttributeName, "isEqual:"))
      goto LABEL_59;
  }
  defaultGalleryColorNames = self->_defaultGalleryColorNames;
  if ((unint64_t)defaultGalleryColorNames | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](defaultGalleryColorNames, "isEqual:"))
      goto LABEL_59;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0)
      goto LABEL_59;
    if (self->_sensitivity)
    {
      if (!*((_BYTE *)v4 + 74))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 74))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0)
      goto LABEL_59;
    if (self->_isAddable)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0)
      goto LABEL_59;
    if (self->_sortedByHue)
    {
      if (!*((_BYTE *)v4 + 75))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 75))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0)
      goto LABEL_59;
    if (self->_supportsSlider)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_59;
  }
  featureFlag = self->_featureFlag;
  if ((unint64_t)featureFlag | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](featureFlag, "isEqual:"))
      goto LABEL_59;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) != 0)
    {
      if (self->_excludesDuotone)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_59;
        goto LABEL_53;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_53;
    }
LABEL_59:
    v14 = 0;
    goto LABEL_60;
  }
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
    goto LABEL_59;
LABEL_53:
  exclusions = self->_exclusions;
  if ((unint64_t)exclusions | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](exclusions, "isEqual:"))
  {
    goto LABEL_59;
  }
  migrations = self->_migrations;
  if ((unint64_t)migrations | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](migrations, "isEqual:"))
      goto LABEL_59;
  }
  collectionOverride = self->_collectionOverride;
  if ((unint64_t)collectionOverride | *((_QWORD *)v4 + 1))
    v14 = -[NSString isEqual:](collectionOverride, "isEqual:");
  else
    v14 = 1;
LABEL_60:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v16;

  v16 = -[NSString hash](self->_defaultColorOptionName, "hash");
  v3 = -[NSString hash](self->_fallbackDefaultColorOptionName, "hash");
  v4 = -[NSString hash](self->_defaultConfigAttributeName, "hash");
  v5 = -[NSMutableArray hash](self->_defaultGalleryColorNames, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_sensitivity;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_isAddable;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761 * self->_sortedByHue;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_supportsSlider;
    goto LABEL_10;
  }
LABEL_9:
  v9 = 0;
LABEL_10:
  v10 = -[NSString hash](self->_featureFlag, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_excludesDuotone;
  else
    v11 = 0;
  v12 = v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v13 = -[NSMutableArray hash](self->_exclusions, "hash");
  v14 = v13 ^ -[NSMutableArray hash](self->_migrations, "hash");
  return v12 ^ v14 ^ -[NSString hash](self->_collectionOverride, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
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
  if (*((_QWORD *)v4 + 2))
    -[NTKProtoPigmentCollectionConfig setDefaultColorOptionName:](self, "setDefaultColorOptionName:");
  if (*((_QWORD *)v4 + 6))
    -[NTKProtoPigmentCollectionConfig setFallbackDefaultColorOptionName:](self, "setFallbackDefaultColorOptionName:");
  if (*((_QWORD *)v4 + 3))
    -[NTKProtoPigmentCollectionConfig setDefaultConfigAttributeName:](self, "setDefaultConfigAttributeName:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[NTKProtoPigmentCollectionConfig addDefaultGalleryColorNames:](self, "addDefaultGalleryColorNames:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 80);
  if ((v10 & 4) != 0)
  {
    self->_sensitivity = *((_BYTE *)v4 + 74);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)v4 + 80);
    if ((v10 & 2) == 0)
    {
LABEL_16:
      if ((v10 & 8) == 0)
        goto LABEL_17;
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 2) == 0)
  {
    goto LABEL_16;
  }
  self->_isAddable = *((_BYTE *)v4 + 73);
  *(_BYTE *)&self->_has |= 2u;
  v10 = *((_BYTE *)v4 + 80);
  if ((v10 & 8) == 0)
  {
LABEL_17:
    if ((v10 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_42:
  self->_sortedByHue = *((_BYTE *)v4 + 75);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
LABEL_18:
    self->_supportsSlider = *((_BYTE *)v4 + 76);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_19:
  if (*((_QWORD *)v4 + 7))
    -[NTKProtoPigmentCollectionConfig setFeatureFlag:](self, "setFeatureFlag:");
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_excludesDuotone = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 1u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v4 + 5);
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
        -[NTKProtoPigmentCollectionConfig addExclusions:](self, "addExclusions:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 8);
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
        -[NTKProtoPigmentCollectionConfig addMigration:](self, "addMigration:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v4 + 1))
    -[NTKProtoPigmentCollectionConfig setCollectionOverride:](self, "setCollectionOverride:");

}

- (NSString)defaultColorOptionName
{
  return self->_defaultColorOptionName;
}

- (void)setDefaultColorOptionName:(id)a3
{
  objc_storeStrong((id *)&self->_defaultColorOptionName, a3);
}

- (NSString)fallbackDefaultColorOptionName
{
  return self->_fallbackDefaultColorOptionName;
}

- (void)setFallbackDefaultColorOptionName:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackDefaultColorOptionName, a3);
}

- (NSString)defaultConfigAttributeName
{
  return self->_defaultConfigAttributeName;
}

- (void)setDefaultConfigAttributeName:(id)a3
{
  objc_storeStrong((id *)&self->_defaultConfigAttributeName, a3);
}

- (NSMutableArray)defaultGalleryColorNames
{
  return self->_defaultGalleryColorNames;
}

- (void)setDefaultGalleryColorNames:(id)a3
{
  objc_storeStrong((id *)&self->_defaultGalleryColorNames, a3);
}

- (BOOL)sensitivity
{
  return self->_sensitivity;
}

- (BOOL)isAddable
{
  return self->_isAddable;
}

- (BOOL)sortedByHue
{
  return self->_sortedByHue;
}

- (BOOL)supportsSlider
{
  return self->_supportsSlider;
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlag, a3);
}

- (BOOL)excludesDuotone
{
  return self->_excludesDuotone;
}

- (NSMutableArray)exclusions
{
  return self->_exclusions;
}

- (void)setExclusions:(id)a3
{
  objc_storeStrong((id *)&self->_exclusions, a3);
}

- (NSMutableArray)migrations
{
  return self->_migrations;
}

- (void)setMigrations:(id)a3
{
  objc_storeStrong((id *)&self->_migrations, a3);
}

- (NSString)collectionOverride
{
  return self->_collectionOverride;
}

- (void)setCollectionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_collectionOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrations, 0);
  objc_storeStrong((id *)&self->_featureFlag, 0);
  objc_storeStrong((id *)&self->_fallbackDefaultColorOptionName, 0);
  objc_storeStrong((id *)&self->_exclusions, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColorNames, 0);
  objc_storeStrong((id *)&self->_defaultConfigAttributeName, 0);
  objc_storeStrong((id *)&self->_defaultColorOptionName, 0);
  objc_storeStrong((id *)&self->_collectionOverride, 0);
}

@end
