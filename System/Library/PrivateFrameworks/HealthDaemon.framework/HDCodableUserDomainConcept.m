@implementation HDCodableUserDomainConcept

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)setMajorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMajorVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPatchVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_patchVersion = a3;
}

- (void)setHasPatchVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPatchVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLinksData
{
  return self->_linksData != 0;
}

- (void)clearCodings
{
  -[NSMutableArray removeAllObjects](self->_codings, "removeAllObjects");
}

- (void)addCodings:(id)a3
{
  id v4;
  NSMutableArray *codings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  codings = self->_codings;
  v8 = v4;
  if (!codings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_codings;
    self->_codings = v6;

    v4 = v8;
    codings = self->_codings;
  }
  -[NSMutableArray addObject:](codings, "addObject:", v4);

}

- (unint64_t)codingsCount
{
  return -[NSMutableArray count](self->_codings, "count");
}

- (id)codingsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_codings, "objectAtIndex:", a3);
}

+ (Class)codingsType
{
  return (Class)objc_opt_class();
}

- (void)clearLinks
{
  -[NSMutableArray removeAllObjects](self->_links, "removeAllObjects");
}

- (void)addLinks:(id)a3
{
  id v4;
  NSMutableArray *links;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  links = self->_links;
  v8 = v4;
  if (!links)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_links;
    self->_links = v6;

    v4 = v8;
    links = self->_links;
  }
  -[NSMutableArray addObject:](links, "addObject:", v4);

}

- (unint64_t)linksCount
{
  return -[NSMutableArray count](self->_links, "count");
}

- (id)linksAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_links, "objectAtIndex:", a3);
}

+ (Class)linksType
{
  return (Class)objc_opt_class();
}

- (void)clearProperties
{
  -[NSMutableArray removeAllObjects](self->_properties, "removeAllObjects");
}

- (void)addProperties:(id)a3
{
  id v4;
  NSMutableArray *properties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  properties = self->_properties;
  v8 = v4;
  if (!properties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_properties;
    self->_properties = v6;

    v4 = v8;
    properties = self->_properties;
  }
  -[NSMutableArray addObject:](properties, "addObject:", v4);

}

- (unint64_t)propertiesCount
{
  return -[NSMutableArray count](self->_properties, "count");
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_properties, "objectAtIndex:", a3);
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

- (void)clearLocalizedStringProperties
{
  -[NSMutableArray removeAllObjects](self->_localizedStringProperties, "removeAllObjects");
}

- (void)addLocalizedStringProperties:(id)a3
{
  id v4;
  NSMutableArray *localizedStringProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  localizedStringProperties = self->_localizedStringProperties;
  v8 = v4;
  if (!localizedStringProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_localizedStringProperties;
    self->_localizedStringProperties = v6;

    v4 = v8;
    localizedStringProperties = self->_localizedStringProperties;
  }
  -[NSMutableArray addObject:](localizedStringProperties, "addObject:", v4);

}

- (unint64_t)localizedStringPropertiesCount
{
  return -[NSMutableArray count](self->_localizedStringProperties, "count");
}

- (id)localizedStringPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_localizedStringProperties, "objectAtIndex:", a3);
}

+ (Class)localizedStringPropertiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasOntologyLocalizedEducationContent
{
  return self->_ontologyLocalizedEducationContent != 0;
}

- (void)clearNamedQuantities
{
  -[NSMutableArray removeAllObjects](self->_namedQuantities, "removeAllObjects");
}

- (void)addNamedQuantities:(id)a3
{
  id v4;
  NSMutableArray *namedQuantities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  namedQuantities = self->_namedQuantities;
  v8 = v4;
  if (!namedQuantities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_namedQuantities;
    self->_namedQuantities = v6;

    v4 = v8;
    namedQuantities = self->_namedQuantities;
  }
  -[NSMutableArray addObject:](namedQuantities, "addObject:", v4);

}

- (unint64_t)namedQuantitiesCount
{
  return -[NSMutableArray count](self->_namedQuantities, "count");
}

- (id)namedQuantitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_namedQuantities, "objectAtIndex:", a3);
}

+ (Class)namedQuantitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasTypeData
{
  return self->_typeData != 0;
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
  v8.super_class = (Class)HDCodableUserDomainConcept;
  -[HDCodableUserDomainConcept description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConcept dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  HDCodableUserDomainConceptTypeIdentifier *identifier;
  void *v7;
  char has;
  void *v9;
  NSString *build;
  char v11;
  void *v12;
  NSData *linksData;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  HDCodableOntologyLocalizedEducationContent *ontologyLocalizedEducationContent;
  void *v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  HDCodableSyncIdentity *syncIdentity;
  void *v52;
  NSData *typeData;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  identifier = self->_identifier;
  if (identifier)
  {
    -[HDCodableUserDomainConceptTypeIdentifier dictionaryRepresentation](identifier, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("identifier"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("creationDate"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("modificationDate"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("deleted"));

  }
LABEL_9:
  build = self->_build;
  if (build)
    objc_msgSend(v4, "setObject:forKey:", build, CFSTR("build"));
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_majorVersion);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("majorVersion"));

    v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_13:
      if ((v11 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minorVersion);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("minorVersion"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_patchVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("patchVersion"));

  }
LABEL_15:
  linksData = self->_linksData;
  if (linksData)
    objc_msgSend(v4, "setObject:forKey:", linksData, CFSTR("linksData"));
  if (-[NSMutableArray count](self->_codings, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_codings, "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v15 = self->_codings;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v76 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("codings"));
  }
  if (-[NSMutableArray count](self->_links, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_links, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v22 = self->_links;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v72 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      }
      while (v24);
    }

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("links"));
  }
  if (-[NSMutableArray count](self->_properties, "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_properties, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v29 = self->_properties;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v68;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v68 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v31);
    }

    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("properties"));
  }
  if (-[NSMutableArray count](self->_localizedStringProperties, "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_localizedStringProperties, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v36 = self->_localizedStringProperties;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v64;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v64 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * m), "dictionaryRepresentation");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v41);

        }
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
      }
      while (v38);
    }

    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("localizedStringProperties"));
  }
  ontologyLocalizedEducationContent = self->_ontologyLocalizedEducationContent;
  if (ontologyLocalizedEducationContent)
  {
    -[HDCodableOntologyLocalizedEducationContent dictionaryRepresentation](ontologyLocalizedEducationContent, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("ontologyLocalizedEducationContent"));

  }
  if (-[NSMutableArray count](self->_namedQuantities, "count"))
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_namedQuantities, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v45 = self->_namedQuantities;
    v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v60;
      do
      {
        for (n = 0; n != v47; ++n)
        {
          if (*(_QWORD *)v60 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v59);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v50);

        }
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
      }
      while (v47);
    }

    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("namedQuantities"));
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("syncIdentity"));

  }
  typeData = self->_typeData;
  if (typeData)
    objc_msgSend(v4, "setObject:forKey:", typeData, CFSTR("typeData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uuid)
    PBDataWriterWriteDataField();
  if (self->_identifier)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_build)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (self->_linksData)
    PBDataWriterWriteDataField();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = self->_codings;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = self->_links;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = self->_properties;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = self->_localizedStringProperties;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  if (self->_ontologyLocalizedEducationContent)
    PBDataWriterWriteSubmessage();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self->_namedQuantities;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage();
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();
  if (self->_typeData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  void *v26;
  void *v27;
  id v28;

  v4 = a3;
  v28 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v28;
  }
  if (self->_identifier)
  {
    objc_msgSend(v28, "setIdentifier:");
    v4 = v28;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 140) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_modificationDate;
  *((_BYTE *)v4 + 140) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 136) = self->_deleted;
    *((_BYTE *)v4 + 140) |= 0x20u;
  }
LABEL_9:
  if (self->_build)
  {
    objc_msgSend(v28, "setBuild:");
    v4 = v28;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_majorVersion;
    *((_BYTE *)v4 + 140) |= 4u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 19) = self->_minorVersion;
  *((_BYTE *)v4 + 140) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 24) = self->_patchVersion;
    *((_BYTE *)v4 + 140) |= 0x10u;
  }
LABEL_15:
  if (self->_linksData)
    objc_msgSend(v28, "setLinksData:");
  if (-[HDCodableUserDomainConcept codingsCount](self, "codingsCount"))
  {
    objc_msgSend(v28, "clearCodings");
    v7 = -[HDCodableUserDomainConcept codingsCount](self, "codingsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[HDCodableUserDomainConcept codingsAtIndex:](self, "codingsAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addCodings:", v10);

      }
    }
  }
  if (-[HDCodableUserDomainConcept linksCount](self, "linksCount"))
  {
    objc_msgSend(v28, "clearLinks");
    v11 = -[HDCodableUserDomainConcept linksCount](self, "linksCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[HDCodableUserDomainConcept linksAtIndex:](self, "linksAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addLinks:", v14);

      }
    }
  }
  if (-[HDCodableUserDomainConcept propertiesCount](self, "propertiesCount"))
  {
    objc_msgSend(v28, "clearProperties");
    v15 = -[HDCodableUserDomainConcept propertiesCount](self, "propertiesCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[HDCodableUserDomainConcept propertiesAtIndex:](self, "propertiesAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addProperties:", v18);

      }
    }
  }
  if (-[HDCodableUserDomainConcept localizedStringPropertiesCount](self, "localizedStringPropertiesCount"))
  {
    objc_msgSend(v28, "clearLocalizedStringProperties");
    v19 = -[HDCodableUserDomainConcept localizedStringPropertiesCount](self, "localizedStringPropertiesCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[HDCodableUserDomainConcept localizedStringPropertiesAtIndex:](self, "localizedStringPropertiesAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addLocalizedStringProperties:", v22);

      }
    }
  }
  if (self->_ontologyLocalizedEducationContent)
    objc_msgSend(v28, "setOntologyLocalizedEducationContent:");
  if (-[HDCodableUserDomainConcept namedQuantitiesCount](self, "namedQuantitiesCount"))
  {
    objc_msgSend(v28, "clearNamedQuantities");
    v23 = -[HDCodableUserDomainConcept namedQuantitiesCount](self, "namedQuantitiesCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
      {
        -[HDCodableUserDomainConcept namedQuantitiesAtIndex:](self, "namedQuantitiesAtIndex:", n);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addNamedQuantities:", v26);

      }
    }
  }
  if (self->_syncIdentity)
    objc_msgSend(v28, "setSyncIdentity:");
  v27 = v28;
  if (self->_typeData)
  {
    objc_msgSend(v28, "setTypeData:");
    v27 = v28;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  id v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v6;

  v8 = -[HDCodableUserDomainConceptTypeIdentifier copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 140) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_modificationDate;
  *(_BYTE *)(v5 + 140) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 136) = self->_deleted;
    *(_BYTE *)(v5 + 140) |= 0x20u;
  }
LABEL_5:
  v11 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_majorVersion;
    *(_BYTE *)(v5 + 140) |= 4u;
    v13 = (char)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_7:
      if ((v13 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 76) = self->_minorVersion;
  *(_BYTE *)(v5 + 140) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 96) = self->_patchVersion;
    *(_BYTE *)(v5 + 140) |= 0x10u;
  }
LABEL_9:
  v14 = -[NSData copyWithZone:](self->_linksData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v16 = self->_codings;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v70 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCodings:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v18);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v22 = self->_links;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v66 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLinks:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    }
    while (v24);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v28 = self->_properties;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProperties:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v30);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v34 = self->_localizedStringProperties;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v58 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLocalizedStringProperties:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    }
    while (v36);
  }

  v40 = -[HDCodableOntologyLocalizedEducationContent copyWithZone:](self->_ontologyLocalizedEducationContent, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v40;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v42 = self->_namedQuantities;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v44; ++n)
      {
        if (*(_QWORD *)v54 != v45)
          objc_enumerationMutation(v42);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v53);
        objc_msgSend((id)v5, "addNamedQuantities:", v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v44);
  }

  v48 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v48;

  v50 = -[NSData copyWithZone:](self->_typeData, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v50;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  HDCodableUserDomainConceptTypeIdentifier *identifier;
  char has;
  char v8;
  NSString *build;
  NSData *linksData;
  NSMutableArray *codings;
  NSMutableArray *links;
  NSMutableArray *properties;
  NSMutableArray *localizedStringProperties;
  HDCodableOntologyLocalizedEducationContent *ontologyLocalizedEducationContent;
  NSMutableArray *namedQuantities;
  HDCodableSyncIdentity *syncIdentity;
  NSData *typeData;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 16))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_60;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[HDCodableUserDomainConceptTypeIdentifier isEqual:](identifier, "isEqual:"))
      goto LABEL_60;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 140);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 140) & 1) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 2) == 0 || self->_modificationDate != *((double *)v4 + 2))
      goto LABEL_60;
  }
  else if ((*((_BYTE *)v4 + 140) & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 140) & 0x20) == 0)
      goto LABEL_60;
    if (self->_deleted)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_60;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_60;
    }
  }
  else if ((*((_BYTE *)v4 + 140) & 0x20) != 0)
  {
    goto LABEL_60;
  }
  build = self->_build;
  if (!((unint64_t)build | *((_QWORD *)v4 + 3)))
    goto LABEL_27;
  if (!-[NSString isEqual:](build, "isEqual:"))
  {
LABEL_60:
    v19 = 0;
    goto LABEL_61;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 140);
LABEL_27:
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_majorVersion != *((_DWORD *)v4 + 18))
      goto LABEL_60;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_minorVersion != *((_DWORD *)v4 + 19))
      goto LABEL_60;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_patchVersion != *((_DWORD *)v4 + 24))
      goto LABEL_60;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  linksData = self->_linksData;
  if ((unint64_t)linksData | *((_QWORD *)v4 + 7) && !-[NSData isEqual:](linksData, "isEqual:"))
    goto LABEL_60;
  codings = self->_codings;
  if ((unint64_t)codings | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](codings, "isEqual:"))
      goto LABEL_60;
  }
  links = self->_links;
  if ((unint64_t)links | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](links, "isEqual:"))
      goto LABEL_60;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](properties, "isEqual:"))
      goto LABEL_60;
  }
  localizedStringProperties = self->_localizedStringProperties;
  if ((unint64_t)localizedStringProperties | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](localizedStringProperties, "isEqual:"))
      goto LABEL_60;
  }
  ontologyLocalizedEducationContent = self->_ontologyLocalizedEducationContent;
  if ((unint64_t)ontologyLocalizedEducationContent | *((_QWORD *)v4 + 11))
  {
    if (!-[HDCodableOntologyLocalizedEducationContent isEqual:](ontologyLocalizedEducationContent, "isEqual:"))
      goto LABEL_60;
  }
  namedQuantities = self->_namedQuantities;
  if ((unint64_t)namedQuantities | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](namedQuantities, "isEqual:"))
      goto LABEL_60;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 14))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_60;
  }
  typeData = self->_typeData;
  if ((unint64_t)typeData | *((_QWORD *)v4 + 15))
    v19 = -[NSData isEqual:](typeData, "isEqual:");
  else
    v19 = 1;
LABEL_61:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  char has;
  unint64_t v6;
  double creationDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double modificationDate;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v3 = -[NSData hash](self->_uuid, "hash");
  v4 = -[HDCodableUserDomainConceptTypeIdentifier hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v8 = -creationDate;
    if (creationDate >= 0.0)
      v8 = self->_creationDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
  {
    modificationDate = self->_modificationDate;
    v13 = -modificationDate;
    if (modificationDate >= 0.0)
      v13 = self->_modificationDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((has & 0x20) != 0)
    v16 = 2654435761 * self->_deleted;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_build, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v18 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_22;
LABEL_25:
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_23;
LABEL_26:
    v20 = 0;
    goto LABEL_27;
  }
  v18 = 2654435761 * self->_majorVersion;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_25;
LABEL_22:
  v19 = 2654435761 * self->_minorVersion;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_26;
LABEL_23:
  v20 = 2654435761 * self->_patchVersion;
LABEL_27:
  v21 = v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17;
  v22 = v18 ^ v19 ^ v20 ^ -[NSData hash](self->_linksData, "hash");
  v23 = v21 ^ v22 ^ -[NSMutableArray hash](self->_codings, "hash");
  v24 = -[NSMutableArray hash](self->_links, "hash");
  v25 = v24 ^ -[NSMutableArray hash](self->_properties, "hash");
  v26 = v25 ^ -[NSMutableArray hash](self->_localizedStringProperties, "hash");
  v27 = v23 ^ v26 ^ -[HDCodableOntologyLocalizedEducationContent hash](self->_ontologyLocalizedEducationContent, "hash");
  v28 = -[NSMutableArray hash](self->_namedQuantities, "hash");
  v29 = v28 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  return v27 ^ v29 ^ -[NSData hash](self->_typeData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableUserDomainConceptTypeIdentifier *identifier;
  uint64_t v6;
  char v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  HDCodableOntologyLocalizedEducationContent *ontologyLocalizedEducationContent;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v37;
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
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 16))
    -[HDCodableUserDomainConcept setUuid:](self, "setUuid:");
  identifier = self->_identifier;
  v6 = *((_QWORD *)v4 + 5);
  if (identifier)
  {
    if (v6)
      -[HDCodableUserDomainConceptTypeIdentifier mergeFrom:](identifier, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableUserDomainConcept setIdentifier:](self, "setIdentifier:");
  }
  v7 = *((_BYTE *)v4 + 140);
  if ((v7 & 1) != 0)
  {
    self->_creationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 140);
    if ((v7 & 2) == 0)
    {
LABEL_10:
      if ((v7 & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 140) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_modificationDate = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 140) & 0x20) != 0)
  {
LABEL_11:
    self->_deleted = *((_BYTE *)v4 + 136);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 3))
    -[HDCodableUserDomainConcept setBuild:](self, "setBuild:");
  v8 = *((_BYTE *)v4 + 140);
  if ((v8 & 4) != 0)
  {
    self->_majorVersion = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 4u;
    v8 = *((_BYTE *)v4 + 140);
    if ((v8 & 8) == 0)
    {
LABEL_16:
      if ((v8 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 140) & 8) == 0)
  {
    goto LABEL_16;
  }
  self->_minorVersion = *((_DWORD *)v4 + 19);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 140) & 0x10) != 0)
  {
LABEL_17:
    self->_patchVersion = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 7))
    -[HDCodableUserDomainConcept setLinksData:](self, "setLinksData:");
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = *((id *)v4 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v9);
        -[HDCodableUserDomainConcept addCodings:](self, "addCodings:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = *((id *)v4 + 6);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v14);
        -[HDCodableUserDomainConcept addLinks:](self, "addLinks:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v16);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = *((id *)v4 + 13);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v19);
        -[HDCodableUserDomainConcept addProperties:](self, "addProperties:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v21);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = *((id *)v4 + 8);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v43;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v24);
        -[HDCodableUserDomainConcept addLocalizedStringProperties:](self, "addLocalizedStringProperties:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v26);
  }

  ontologyLocalizedEducationContent = self->_ontologyLocalizedEducationContent;
  v30 = *((_QWORD *)v4 + 11);
  if (ontologyLocalizedEducationContent)
  {
    if (v30)
      -[HDCodableOntologyLocalizedEducationContent mergeFrom:](ontologyLocalizedEducationContent, "mergeFrom:");
  }
  else if (v30)
  {
    -[HDCodableUserDomainConcept setOntologyLocalizedEducationContent:](self, "setOntologyLocalizedEducationContent:");
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = *((id *)v4 + 10);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        -[HDCodableUserDomainConcept addNamedQuantities:](self, "addNamedQuantities:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * n), (_QWORD)v38);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
    }
    while (v33);
  }

  syncIdentity = self->_syncIdentity;
  v37 = *((_QWORD *)v4 + 14);
  if (syncIdentity)
  {
    if (v37)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v37)
  {
    -[HDCodableUserDomainConcept setSyncIdentity:](self, "setSyncIdentity:");
  }
  if (*((_QWORD *)v4 + 15))
    -[HDCodableUserDomainConcept setTypeData:](self, "setTypeData:");

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HDCodableUserDomainConceptTypeIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
}

- (NSData)linksData
{
  return self->_linksData;
}

- (void)setLinksData:(id)a3
{
  objc_storeStrong((id *)&self->_linksData, a3);
}

- (NSMutableArray)codings
{
  return self->_codings;
}

- (void)setCodings:(id)a3
{
  objc_storeStrong((id *)&self->_codings, a3);
}

- (NSMutableArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSMutableArray)localizedStringProperties
{
  return self->_localizedStringProperties;
}

- (void)setLocalizedStringProperties:(id)a3
{
  objc_storeStrong((id *)&self->_localizedStringProperties, a3);
}

- (HDCodableOntologyLocalizedEducationContent)ontologyLocalizedEducationContent
{
  return self->_ontologyLocalizedEducationContent;
}

- (void)setOntologyLocalizedEducationContent:(id)a3
{
  objc_storeStrong((id *)&self->_ontologyLocalizedEducationContent, a3);
}

- (NSMutableArray)namedQuantities
{
  return self->_namedQuantities;
}

- (void)setNamedQuantities:(id)a3
{
  objc_storeStrong((id *)&self->_namedQuantities, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (NSData)typeData
{
  return self->_typeData;
}

- (void)setTypeData:(id)a3
{
  objc_storeStrong((id *)&self->_typeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_typeData, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_ontologyLocalizedEducationContent, 0);
  objc_storeStrong((id *)&self->_namedQuantities, 0);
  objc_storeStrong((id *)&self->_localizedStringProperties, 0);
  objc_storeStrong((id *)&self->_linksData, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_codings, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
