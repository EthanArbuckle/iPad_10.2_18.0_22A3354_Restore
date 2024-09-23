@implementation BMPBPhotosKnowledgeGraphEnrichmentEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearTopics
{
  -[NSMutableArray removeAllObjects](self->_topics, "removeAllObjects");
}

- (void)addTopics:(id)a3
{
  id v4;
  NSMutableArray *topics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topics = self->_topics;
  v8 = v4;
  if (!topics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_topics;
    self->_topics = v6;

    v4 = v8;
    topics = self->_topics;
  }
  -[NSMutableArray addObject:](topics, "addObject:", v4);

}

- (unint64_t)topicsCount
{
  return -[NSMutableArray count](self->_topics, "count");
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topics, "objectAtIndex:", a3);
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

- (void)clearEntities
{
  -[NSMutableArray removeAllObjects](self->_entities, "removeAllObjects");
}

- (void)addEntities:(id)a3
{
  id v4;
  NSMutableArray *entities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  entities = self->_entities;
  v8 = v4;
  if (!entities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_entities;
    self->_entities = v6;

    v4 = v8;
    entities = self->_entities;
  }
  -[NSMutableArray addObject:](entities, "addObject:", v4);

}

- (unint64_t)entitiesCount
{
  return -[NSMutableArray count](self->_entities, "count");
}

- (id)entitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_entities, "objectAtIndex:", a3);
}

+ (Class)entitiesType
{
  return (Class)objc_opt_class();
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

+ (Class)locationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
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
  v8.super_class = (Class)BMPBPhotosKnowledgeGraphEnrichmentEvent;
  -[BMPBPhotosKnowledgeGraphEnrichmentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBPhotosKnowledgeGraphEnrichmentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSString *uniqueId;
  NSString *contentProtection;
  NSString *personaId;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  if (-[NSMutableArray count](self->_topics, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = self->_topics;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("topics"));
  }
  if (-[NSMutableArray count](self->_entities, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_entities, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = self->_entities;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("entities"));
  }
  if (-[NSMutableArray count](self->_locations, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = self->_locations;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("locations"));
  }
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v3, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v3, "setObject:forKey:", contentProtection, CFSTR("contentProtection"));
  personaId = self->_personaId;
  if (personaId)
    objc_msgSend(v3, "setObject:forKey:", personaId, CFSTR("personaId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPhotosKnowledgeGraphEnrichmentEventReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_topics;
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
        PBDataWriterWriteSubmessage();
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
  v10 = self->_entities;
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
        PBDataWriterWriteSubmessage();
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
  v15 = self->_locations;
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
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_uniqueId)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();

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
  void *v17;
  id v18;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v18 = v4;
  if (-[BMPBPhotosKnowledgeGraphEnrichmentEvent topicsCount](self, "topicsCount"))
  {
    objc_msgSend(v18, "clearTopics");
    v5 = -[BMPBPhotosKnowledgeGraphEnrichmentEvent topicsCount](self, "topicsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent topicsAtIndex:](self, "topicsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addTopics:", v8);

      }
    }
  }
  if (-[BMPBPhotosKnowledgeGraphEnrichmentEvent entitiesCount](self, "entitiesCount"))
  {
    objc_msgSend(v18, "clearEntities");
    v9 = -[BMPBPhotosKnowledgeGraphEnrichmentEvent entitiesCount](self, "entitiesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent entitiesAtIndex:](self, "entitiesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEntities:", v12);

      }
    }
  }
  if (-[BMPBPhotosKnowledgeGraphEnrichmentEvent locationsCount](self, "locationsCount"))
  {
    objc_msgSend(v18, "clearLocations");
    v13 = -[BMPBPhotosKnowledgeGraphEnrichmentEvent locationsCount](self, "locationsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent locationsAtIndex:](self, "locationsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addLocations:", v16);

      }
    }
  }
  if (self->_uniqueId)
    objc_msgSend(v18, "setUniqueId:");
  v17 = v18;
  if (self->_contentProtection)
  {
    objc_msgSend(v18, "setContentProtection:");
    v17 = v18;
  }
  if (self->_personaId)
  {
    objc_msgSend(v18, "setPersonaId:");
    v17 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = self->_topics;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addTopics:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v9);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = self->_entities;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addEntities:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = self->_locations;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v23), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend(v6, "addLocations:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v21);
  }

  v25 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v26 = (void *)v6[7];
  v6[7] = v25;

  v27 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v28 = (void *)v6[2];
  v6[2] = v27;

  v29 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v30 = (void *)v6[5];
  v6[5] = v29;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *topics;
  NSMutableArray *entities;
  NSMutableArray *locations;
  NSString *uniqueId;
  NSString *contentProtection;
  NSString *personaId;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((_QWORD *)v4 + 6) && !-[NSMutableArray isEqual:](topics, "isEqual:"))
    goto LABEL_19;
  entities = self->_entities;
  if ((unint64_t)entities | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](entities, "isEqual:"))
      goto LABEL_19;
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:"))
      goto LABEL_19;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_19;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:"))
      goto LABEL_19;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](personaId, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSMutableArray hash](self->_topics, "hash") ^ v3;
  v9 = -[NSMutableArray hash](self->_entities, "hash");
  v10 = v8 ^ v9 ^ -[NSMutableArray hash](self->_locations, "hash");
  v11 = -[NSString hash](self->_uniqueId, "hash");
  v12 = v11 ^ -[NSString hash](self->_contentProtection, "hash");
  return v10 ^ v12 ^ -[NSString hash](self->_personaId, "hash");
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
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 6);
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
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent addTopics:](self, "addTopics:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v5[3];
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
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent addEntities:](self, "addEntities:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v5[4];
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
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent addLocations:](self, "addLocations:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if (v5[7])
    -[BMPBPhotosKnowledgeGraphEnrichmentEvent setUniqueId:](self, "setUniqueId:");
  if (v5[2])
    -[BMPBPhotosKnowledgeGraphEnrichmentEvent setContentProtection:](self, "setContentProtection:");
  if (v5[5])
    -[BMPBPhotosKnowledgeGraphEnrichmentEvent setPersonaId:](self, "setPersonaId:");

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
  objc_storeStrong((id *)&self->_topics, a3);
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
  objc_storeStrong((id *)&self->_contentProtection, a3);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
  objc_storeStrong((id *)&self->_personaId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
}

@end
