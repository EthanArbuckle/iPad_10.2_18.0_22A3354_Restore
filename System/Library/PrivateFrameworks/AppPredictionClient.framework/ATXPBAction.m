@implementation ATXPBAction

- (NSString)uuid
{
  return self->_uuid;
}

- (NSData)contentAttributeSet
{
  return self->_contentAttributeSet;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)activityString
{
  return self->_activityString;
}

- (NSData)intent
{
  return self->_intent;
}

- (NSData)userActivityProxy
{
  return self->_userActivityProxy;
}

- (int64_t)userActivityHash
{
  return self->_userActivityHash;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (ATXPBAVRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)isFutureMedia
{
  return self->_isFutureMedia;
}

- (NSString)heuristic
{
  return self->_heuristic;
}

- (NSMutableArray)heuristicMetadatas
{
  return self->_heuristicMetadatas;
}

- (BOOL)hasCachedHash
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (ATXPBActionCriteria)criteria
{
  return self->_criteria;
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userActivityProxy, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_predictableParameterCombinations, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_heuristicMetadatas, 0);
  objc_storeStrong((id *)&self->_heuristic, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_contentAttributeSet, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activityString, 0);
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setActionType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (BOOL)hasHeuristic
{
  return self->_heuristic != 0;
}

- (void)setIsFutureMedia:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isFutureMedia = a3;
}

- (void)setHasIsFutureMedia:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFutureMedia
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setUserActivityHash:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userActivityHash = a3;
}

- (void)setHasUserActivityHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserActivityHash
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivityString
{
  return self->_activityString != 0;
}

- (BOOL)hasUserActivityProxy
{
  return self->_userActivityProxy != 0;
}

- (BOOL)hasItemIdentifier
{
  return self->_itemIdentifier != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasContentAttributeSet
{
  return self->_contentAttributeSet != 0;
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
}

- (BOOL)hasRouteInfo
{
  return self->_routeInfo != 0;
}

- (void)clearHeuristicMetadatas
{
  -[NSMutableArray removeAllObjects](self->_heuristicMetadatas, "removeAllObjects");
}

- (void)addHeuristicMetadata:(id)a3
{
  id v4;
  NSMutableArray *heuristicMetadatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  heuristicMetadatas = self->_heuristicMetadatas;
  v8 = v4;
  if (!heuristicMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_heuristicMetadatas;
    self->_heuristicMetadatas = v6;

    v4 = v8;
    heuristicMetadatas = self->_heuristicMetadatas;
  }
  -[NSMutableArray addObject:](heuristicMetadatas, "addObject:", v4);

}

- (unint64_t)heuristicMetadatasCount
{
  return -[NSMutableArray count](self->_heuristicMetadatas, "count");
}

- (id)heuristicMetadataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_heuristicMetadatas, "objectAtIndex:", a3);
}

+ (Class)heuristicMetadataType
{
  return (Class)objc_opt_class();
}

- (void)setCachedHash:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cachedHash = a3;
}

- (void)setHasCachedHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)clearPredictableParameterCombinations
{
  -[NSMutableArray removeAllObjects](self->_predictableParameterCombinations, "removeAllObjects");
}

- (void)addPredictableParameterCombinations:(id)a3
{
  id v4;
  NSMutableArray *predictableParameterCombinations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  predictableParameterCombinations = self->_predictableParameterCombinations;
  v8 = v4;
  if (!predictableParameterCombinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_predictableParameterCombinations;
    self->_predictableParameterCombinations = v6;

    v4 = v8;
    predictableParameterCombinations = self->_predictableParameterCombinations;
  }
  -[NSMutableArray addObject:](predictableParameterCombinations, "addObject:", v4);

}

- (unint64_t)predictableParameterCombinationsCount
{
  return -[NSMutableArray count](self->_predictableParameterCombinations, "count");
}

- (id)predictableParameterCombinationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_predictableParameterCombinations, "objectAtIndex:", a3);
}

+ (Class)predictableParameterCombinationsType
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
  v8.super_class = (Class)ATXPBAction;
  -[ATXPBAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  void *v6;
  NSData *intent;
  NSString *heuristic;
  void *v9;
  NSString *title;
  NSString *subtitle;
  void *v12;
  NSString *activityString;
  NSData *userActivityProxy;
  NSString *itemIdentifier;
  NSString *uuid;
  NSString *languageCode;
  NSData *contentAttributeSet;
  ATXPBActionCriteria *criteria;
  void *v20;
  ATXPBAVRouteInfo *routeInfo;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_actionType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("actionType"));

  }
  intent = self->_intent;
  if (intent)
    objc_msgSend(v4, "setObject:forKey:", intent, CFSTR("intent"));
  heuristic = self->_heuristic;
  if (heuristic)
    objc_msgSend(v4, "setObject:forKey:", heuristic, CFSTR("heuristic"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFutureMedia);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("isFutureMedia"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_userActivityHash);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("userActivityHash"));

  }
  activityString = self->_activityString;
  if (activityString)
    objc_msgSend(v4, "setObject:forKey:", activityString, CFSTR("activityString"));
  userActivityProxy = self->_userActivityProxy;
  if (userActivityProxy)
    objc_msgSend(v4, "setObject:forKey:", userActivityProxy, CFSTR("userActivityProxy"));
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier)
    objc_msgSend(v4, "setObject:forKey:", itemIdentifier, CFSTR("itemIdentifier"));
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v4, "setObject:forKey:", uuid, CFSTR("uuid"));
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v4, "setObject:forKey:", languageCode, CFSTR("languageCode"));
  contentAttributeSet = self->_contentAttributeSet;
  if (contentAttributeSet)
    objc_msgSend(v4, "setObject:forKey:", contentAttributeSet, CFSTR("contentAttributeSet"));
  criteria = self->_criteria;
  if (criteria)
  {
    -[ATXPBActionCriteria dictionaryRepresentation](criteria, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("criteria"));

  }
  routeInfo = self->_routeInfo;
  if (routeInfo)
  {
    -[ATXPBAVRouteInfo dictionaryRepresentation](routeInfo, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("routeInfo"));

  }
  if (-[NSMutableArray count](self->_heuristicMetadatas, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_heuristicMetadatas, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v24 = self->_heuristicMetadatas;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("heuristicMetadata"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_cachedHash);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("cachedHash"));

  }
  if (-[NSMutableArray count](self->_predictableParameterCombinations, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_predictableParameterCombinations, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v32 = self->_predictableParameterCombinations;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v40 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v39);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v34);
    }

    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("predictableParameterCombinations"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActionReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_intent)
    PBDataWriterWriteDataField();
  if (self->_heuristic)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_activityString)
    PBDataWriterWriteStringField();
  if (self->_userActivityProxy)
    PBDataWriterWriteDataField();
  if (self->_itemIdentifier)
    PBDataWriterWriteStringField();
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_languageCode)
    PBDataWriterWriteStringField();
  if (self->_contentAttributeSet)
    PBDataWriterWriteDataField();
  if (self->_criteria)
    PBDataWriterWriteSubmessage();
  if (self->_routeInfo)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_heuristicMetadatas;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteFixed64Field();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_predictableParameterCombinations;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_actionType;
    *((_BYTE *)v4 + 156) |= 1u;
  }
  if (self->_intent)
  {
    objc_msgSend(v13, "setIntent:");
    v4 = v13;
  }
  if (self->_heuristic)
  {
    objc_msgSend(v13, "setHeuristic:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 152) = self->_isFutureMedia;
    *((_BYTE *)v4 + 156) |= 8u;
  }
  if (self->_title)
  {
    objc_msgSend(v13, "setTitle:");
    v4 = v13;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v13, "setSubtitle:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_userActivityHash;
    *((_BYTE *)v4 + 156) |= 4u;
  }
  if (self->_activityString)
    objc_msgSend(v13, "setActivityString:");
  if (self->_userActivityProxy)
    objc_msgSend(v13, "setUserActivityProxy:");
  if (self->_itemIdentifier)
    objc_msgSend(v13, "setItemIdentifier:");
  if (self->_uuid)
    objc_msgSend(v13, "setUuid:");
  if (self->_languageCode)
    objc_msgSend(v13, "setLanguageCode:");
  if (self->_contentAttributeSet)
    objc_msgSend(v13, "setContentAttributeSet:");
  if (self->_criteria)
    objc_msgSend(v13, "setCriteria:");
  if (self->_routeInfo)
    objc_msgSend(v13, "setRouteInfo:");
  if (-[ATXPBAction heuristicMetadatasCount](self, "heuristicMetadatasCount"))
  {
    objc_msgSend(v13, "clearHeuristicMetadatas");
    v5 = -[ATXPBAction heuristicMetadatasCount](self, "heuristicMetadatasCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXPBAction heuristicMetadataAtIndex:](self, "heuristicMetadataAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addHeuristicMetadata:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v13 + 2) = self->_cachedHash;
    *((_BYTE *)v13 + 156) |= 2u;
  }
  if (-[ATXPBAction predictableParameterCombinationsCount](self, "predictableParameterCombinationsCount"))
  {
    objc_msgSend(v13, "clearPredictableParameterCombinations");
    v9 = -[ATXPBAction predictableParameterCombinationsCount](self, "predictableParameterCombinationsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ATXPBAction predictableParameterCombinationsAtIndex:](self, "predictableParameterCombinationsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPredictableParameterCombinations:", v12);

      }
    }
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_actionType;
    *(_BYTE *)(v5 + 156) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_intent, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  v10 = -[NSString copyWithZone:](self->_heuristic, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_isFutureMedia;
    *(_BYTE *)(v5 + 156) |= 8u;
  }
  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v12;

  v14 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v14;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_userActivityHash;
    *(_BYTE *)(v5 + 156) |= 4u;
  }
  v16 = -[NSString copyWithZone:](self->_activityString, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = -[NSData copyWithZone:](self->_userActivityProxy, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v18;

  v20 = -[NSString copyWithZone:](self->_itemIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v22 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  v26 = -[NSData copyWithZone:](self->_contentAttributeSet, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v26;

  v28 = -[ATXPBActionCriteria copyWithZone:](self->_criteria, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v28;

  v30 = -[ATXPBAVRouteInfo copyWithZone:](self->_routeInfo, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v30;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v32 = self->_heuristicMetadatas;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v50;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v36), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHeuristicMetadata:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v34);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_cachedHash;
    *(_BYTE *)(v5 + 156) |= 2u;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v38 = self->_predictableParameterCombinations;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v46;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(v38);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v42), "copyWithZone:", a3, (_QWORD)v45);
        objc_msgSend((id)v5, "addPredictableParameterCombinations:", v43);

        ++v42;
      }
      while (v40 != v42);
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v40);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSData *intent;
  NSString *heuristic;
  NSString *title;
  NSString *subtitle;
  NSString *activityString;
  NSData *userActivityProxy;
  NSString *itemIdentifier;
  NSString *uuid;
  NSString *languageCode;
  NSData *contentAttributeSet;
  ATXPBActionCriteria *criteria;
  ATXPBAVRouteInfo *routeInfo;
  NSMutableArray *heuristicMetadatas;
  NSMutableArray *predictableParameterCombinations;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 1) == 0 || self->_actionType != *((_QWORD *)v4 + 1))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 156) & 1) != 0)
  {
    goto LABEL_55;
  }
  intent = self->_intent;
  if ((unint64_t)intent | *((_QWORD *)v4 + 10) && !-[NSData isEqual:](intent, "isEqual:"))
    goto LABEL_55;
  heuristic = self->_heuristic;
  if ((unint64_t)heuristic | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](heuristic, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 8) != 0)
    {
      if (self->_isFutureMedia)
      {
        if (!*((_BYTE *)v4 + 152))
          goto LABEL_55;
        goto LABEL_21;
      }
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_21;
    }
LABEL_55:
    v20 = 0;
    goto LABEL_56;
  }
  if ((*((_BYTE *)v4 + 156) & 8) != 0)
    goto LABEL_55;
LABEL_21:
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 16) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_55;
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 4) == 0 || self->_userActivityHash != *((_QWORD *)v4 + 3))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 156) & 4) != 0)
  {
    goto LABEL_55;
  }
  activityString = self->_activityString;
  if ((unint64_t)activityString | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](activityString, "isEqual:"))
  {
    goto LABEL_55;
  }
  userActivityProxy = self->_userActivityProxy;
  if ((unint64_t)userActivityProxy | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](userActivityProxy, "isEqual:"))
      goto LABEL_55;
  }
  itemIdentifier = self->_itemIdentifier;
  if ((unint64_t)itemIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](itemIdentifier, "isEqual:"))
      goto LABEL_55;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_55;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:"))
      goto LABEL_55;
  }
  contentAttributeSet = self->_contentAttributeSet;
  if ((unint64_t)contentAttributeSet | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](contentAttributeSet, "isEqual:"))
      goto LABEL_55;
  }
  criteria = self->_criteria;
  if ((unint64_t)criteria | *((_QWORD *)v4 + 7))
  {
    if (!-[ATXPBActionCriteria isEqual:](criteria, "isEqual:"))
      goto LABEL_55;
  }
  routeInfo = self->_routeInfo;
  if ((unint64_t)routeInfo | *((_QWORD *)v4 + 14))
  {
    if (!-[ATXPBAVRouteInfo isEqual:](routeInfo, "isEqual:"))
      goto LABEL_55;
  }
  heuristicMetadatas = self->_heuristicMetadatas;
  if ((unint64_t)heuristicMetadatas | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](heuristicMetadatas, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 2) == 0 || self->_cachedHash != *((_QWORD *)v4 + 2))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 156) & 2) != 0)
  {
    goto LABEL_55;
  }
  predictableParameterCombinations = self->_predictableParameterCombinations;
  if ((unint64_t)predictableParameterCombinations | *((_QWORD *)v4 + 13))
    v20 = -[NSMutableArray isEqual:](predictableParameterCombinations, "isEqual:");
  else
    v20 = 1;
LABEL_56:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;

  v22 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v21 = 2654435761 * self->_actionType;
  else
    v21 = 0;
  v20 = -[NSData hash](self->_intent, "hash");
  v19 = -[NSString hash](self->_heuristic, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v18 = 2654435761 * self->_isFutureMedia;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_title, "hash");
  v16 = -[NSString hash](self->_subtitle, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = -[NSString hash](self->_activityString, "hash", 2654435761 * self->_userActivityHash);
  else
    v3 = -[NSString hash](self->_activityString, "hash", 0);
  v4 = v3;
  v5 = -[NSData hash](self->_userActivityProxy, "hash");
  v6 = -[NSString hash](self->_itemIdentifier, "hash");
  v7 = -[NSString hash](self->_uuid, "hash");
  v8 = -[NSString hash](self->_languageCode, "hash");
  v9 = -[NSData hash](self->_contentAttributeSet, "hash");
  v10 = -[ATXPBActionCriteria hash](self->_criteria, "hash");
  v11 = -[ATXPBAVRouteInfo hash](self->_routeInfo, "hash");
  v12 = -[NSMutableArray hash](self->_heuristicMetadatas, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v13 = 2654435761u * self->_cachedHash;
  else
    v13 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSMutableArray hash](self->_predictableParameterCombinations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXPBActionCriteria *criteria;
  uint64_t v6;
  ATXPBAVRouteInfo *routeInfo;
  uint64_t v8;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[ATXPBAction setBundleId:](self, "setBundleId:");
  if ((*((_BYTE *)v4 + 156) & 1) != 0)
  {
    self->_actionType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 10))
    -[ATXPBAction setIntent:](self, "setIntent:");
  if (*((_QWORD *)v4 + 8))
    -[ATXPBAction setHeuristic:](self, "setHeuristic:");
  if ((*((_BYTE *)v4 + 156) & 8) != 0)
  {
    self->_isFutureMedia = *((_BYTE *)v4 + 152);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 16))
    -[ATXPBAction setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 15))
    -[ATXPBAction setSubtitle:](self, "setSubtitle:");
  if ((*((_BYTE *)v4 + 156) & 4) != 0)
  {
    self->_userActivityHash = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
    -[ATXPBAction setActivityString:](self, "setActivityString:");
  if (*((_QWORD *)v4 + 17))
    -[ATXPBAction setUserActivityProxy:](self, "setUserActivityProxy:");
  if (*((_QWORD *)v4 + 11))
    -[ATXPBAction setItemIdentifier:](self, "setItemIdentifier:");
  if (*((_QWORD *)v4 + 18))
    -[ATXPBAction setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 12))
    -[ATXPBAction setLanguageCode:](self, "setLanguageCode:");
  if (*((_QWORD *)v4 + 6))
    -[ATXPBAction setContentAttributeSet:](self, "setContentAttributeSet:");
  criteria = self->_criteria;
  v6 = *((_QWORD *)v4 + 7);
  if (criteria)
  {
    if (v6)
      -[ATXPBActionCriteria mergeFrom:](criteria, "mergeFrom:");
  }
  else if (v6)
  {
    -[ATXPBAction setCriteria:](self, "setCriteria:");
  }
  routeInfo = self->_routeInfo;
  v8 = *((_QWORD *)v4 + 14);
  if (routeInfo)
  {
    if (v8)
      -[ATXPBAVRouteInfo mergeFrom:](routeInfo, "mergeFrom:");
  }
  else if (v8)
  {
    -[ATXPBAction setRouteInfo:](self, "setRouteInfo:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *((id *)v4 + 9);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        -[ATXPBAction addHeuristicMetadata:](self, "addHeuristicMetadata:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  if ((*((_BYTE *)v4 + 156) & 2) != 0)
  {
    self->_cachedHash = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 13);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[ATXPBAction addPredictableParameterCombinations:](self, "addPredictableParameterCombinations:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (void)setHeuristic:(id)a3
{
  objc_storeStrong((id *)&self->_heuristic, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void)setActivityString:(id)a3
{
  objc_storeStrong((id *)&self->_activityString, a3);
}

- (void)setUserActivityProxy:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityProxy, a3);
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (void)setContentAttributeSet:(id)a3
{
  objc_storeStrong((id *)&self->_contentAttributeSet, a3);
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (void)setRouteInfo:(id)a3
{
  objc_storeStrong((id *)&self->_routeInfo, a3);
}

- (void)setHeuristicMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_heuristicMetadatas, a3);
}

- (NSMutableArray)predictableParameterCombinations
{
  return self->_predictableParameterCombinations;
}

- (void)setPredictableParameterCombinations:(id)a3
{
  objc_storeStrong((id *)&self->_predictableParameterCombinations, a3);
}

@end
