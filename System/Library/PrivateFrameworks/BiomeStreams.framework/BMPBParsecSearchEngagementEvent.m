@implementation BMPBParsecSearchEngagementEvent

- (BOOL)hasResultId
{
  return self->_resultId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

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

- (BOOL)hasUserInput
{
  return self->_userInput != 0;
}

- (BOOL)hasCompletedQuery
{
  return self->_completedQuery != 0;
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
  v8.super_class = (Class)BMPBParsecSearchEngagementEvent;
  -[BMPBParsecSearchEngagementEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBParsecSearchEngagementEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *resultId;
  NSString *domainId;
  void *v7;
  NSString *userInput;
  NSString *completedQuery;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSString *uniqueId;
  NSString *contentProtection;
  NSString *personaId;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  resultId = self->_resultId;
  if (resultId)
    objc_msgSend(v3, "setObject:forKey:", resultId, CFSTR("resultId"));
  domainId = self->_domainId;
  if (domainId)
    objc_msgSend(v4, "setObject:forKey:", domainId, CFSTR("domainId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("absoluteTimestamp"));

  }
  userInput = self->_userInput;
  if (userInput)
    objc_msgSend(v4, "setObject:forKey:", userInput, CFSTR("userInput"));
  completedQuery = self->_completedQuery;
  if (completedQuery)
    objc_msgSend(v4, "setObject:forKey:", completedQuery, CFSTR("completedQuery"));
  if (-[NSMutableArray count](self->_entities, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_entities, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_entities;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("entities"));
  }
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v4, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v4, "setObject:forKey:", contentProtection, CFSTR("contentProtection"));
  personaId = self->_personaId;
  if (personaId)
    objc_msgSend(v4, "setObject:forKey:", personaId, CFSTR("personaId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBParsecSearchEngagementEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_resultId)
    PBDataWriterWriteStringField();
  if (self->_domainId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_userInput)
    PBDataWriterWriteStringField();
  if (self->_completedQuery)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
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
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_resultId)
  {
    objc_msgSend(v4, "setResultId:");
    v4 = v10;
  }
  if (self->_domainId)
  {
    objc_msgSend(v10, "setDomainId:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (self->_userInput)
    objc_msgSend(v10, "setUserInput:");
  if (self->_completedQuery)
    objc_msgSend(v10, "setCompletedQuery:");
  if (-[BMPBParsecSearchEngagementEvent entitiesCount](self, "entitiesCount"))
  {
    objc_msgSend(v10, "clearEntities");
    v5 = -[BMPBParsecSearchEngagementEvent entitiesCount](self, "entitiesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBParsecSearchEngagementEvent entitiesAtIndex:](self, "entitiesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEntities:", v8);

      }
    }
  }
  if (self->_uniqueId)
    objc_msgSend(v10, "setUniqueId:");
  v9 = v10;
  if (self->_contentProtection)
  {
    objc_msgSend(v10, "setContentProtection:");
    v9 = v10;
  }
  if (self->_personaId)
  {
    objc_msgSend(v10, "setPersonaId:");
    v9 = v10;
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_resultId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_domainId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_userInput, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v12 = -[NSString copyWithZone:](self->_completedQuery, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_entities;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addEntities:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v22 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *resultId;
  NSString *domainId;
  NSString *userInput;
  NSString *completedQuery;
  NSMutableArray *entities;
  NSString *uniqueId;
  NSString *contentProtection;
  NSString *personaId;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  resultId = self->_resultId;
  if ((unint64_t)resultId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](resultId, "isEqual:"))
      goto LABEL_23;
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  userInput = self->_userInput;
  if ((unint64_t)userInput | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](userInput, "isEqual:"))
    goto LABEL_23;
  completedQuery = self->_completedQuery;
  if ((unint64_t)completedQuery | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](completedQuery, "isEqual:"))
      goto LABEL_23;
  }
  entities = self->_entities;
  if ((unint64_t)entities | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](entities, "isEqual:"))
      goto LABEL_23;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_23;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:"))
      goto LABEL_23;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 6))
    v13 = -[NSString isEqual:](personaId, "isEqual:");
  else
    v13 = 1;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double absoluteTimestamp;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;

  v3 = -[NSString hash](self->_resultId, "hash");
  v4 = -[NSString hash](self->_domainId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v7 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v7 = self->_absoluteTimestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_userInput, "hash");
  v11 = -[NSString hash](self->_completedQuery, "hash");
  v12 = v11 ^ -[NSMutableArray hash](self->_entities, "hash");
  v13 = v10 ^ v12 ^ -[NSString hash](self->_uniqueId, "hash");
  v14 = -[NSString hash](self->_contentProtection, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_personaId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[BMPBParsecSearchEngagementEvent setResultId:](self, "setResultId:");
  if (*((_QWORD *)v4 + 4))
    -[BMPBParsecSearchEngagementEvent setDomainId:](self, "setDomainId:");
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 9))
    -[BMPBParsecSearchEngagementEvent setUserInput:](self, "setUserInput:");
  if (*((_QWORD *)v4 + 2))
    -[BMPBParsecSearchEngagementEvent setCompletedQuery:](self, "setCompletedQuery:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[BMPBParsecSearchEngagementEvent addEntities:](self, "addEntities:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 8))
    -[BMPBParsecSearchEngagementEvent setUniqueId:](self, "setUniqueId:");
  if (*((_QWORD *)v4 + 3))
    -[BMPBParsecSearchEngagementEvent setContentProtection:](self, "setContentProtection:");
  if (*((_QWORD *)v4 + 6))
    -[BMPBParsecSearchEngagementEvent setPersonaId:](self, "setPersonaId:");

}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_storeStrong((id *)&self->_resultId, a3);
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
  objc_storeStrong((id *)&self->_domainId, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (void)setUserInput:(id)a3
{
  objc_storeStrong((id *)&self->_userInput, a3);
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (void)setCompletedQuery:(id)a3
{
  objc_storeStrong((id *)&self->_completedQuery, a3);
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
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
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_completedQuery, 0);
}

@end
