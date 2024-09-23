@implementation ATXTimelineRelevancePBTimelineRelevanceSuggestion

- (BOOL)hasSuggestionID
{
  return self->_suggestionID != 0;
}

- (void)clearAbuseControlOutcomes
{
  -[NSMutableArray removeAllObjects](self->_abuseControlOutcomes, "removeAllObjects");
}

- (void)addAbuseControlOutcome:(id)a3
{
  id v4;
  NSMutableArray *abuseControlOutcomes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  abuseControlOutcomes = self->_abuseControlOutcomes;
  v8 = v4;
  if (!abuseControlOutcomes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_abuseControlOutcomes;
    self->_abuseControlOutcomes = v6;

    v4 = v8;
    abuseControlOutcomes = self->_abuseControlOutcomes;
  }
  -[NSMutableArray addObject:](abuseControlOutcomes, "addObject:", v4);

}

- (unint64_t)abuseControlOutcomesCount
{
  return -[NSMutableArray count](self->_abuseControlOutcomes, "count");
}

- (id)abuseControlOutcomeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_abuseControlOutcomes, "objectAtIndex:", a3);
}

+ (Class)abuseControlOutcomeType
{
  return (Class)objc_opt_class();
}

- (void)clearTimelineRelevanceScoreEntrys
{
  -[NSMutableArray removeAllObjects](self->_timelineRelevanceScoreEntrys, "removeAllObjects");
}

- (void)addTimelineRelevanceScoreEntry:(id)a3
{
  id v4;
  NSMutableArray *timelineRelevanceScoreEntrys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  timelineRelevanceScoreEntrys = self->_timelineRelevanceScoreEntrys;
  v8 = v4;
  if (!timelineRelevanceScoreEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_timelineRelevanceScoreEntrys;
    self->_timelineRelevanceScoreEntrys = v6;

    v4 = v8;
    timelineRelevanceScoreEntrys = self->_timelineRelevanceScoreEntrys;
  }
  -[NSMutableArray addObject:](timelineRelevanceScoreEntrys, "addObject:", v4);

}

- (unint64_t)timelineRelevanceScoreEntrysCount
{
  return -[NSMutableArray count](self->_timelineRelevanceScoreEntrys, "count");
}

- (id)timelineRelevanceScoreEntryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_timelineRelevanceScoreEntrys, "objectAtIndex:", a3);
}

+ (Class)timelineRelevanceScoreEntryType
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceSuggestion;
  -[ATXTimelineRelevancePBTimelineRelevanceSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineRelevancePBTimelineRelevanceSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *suggestionID;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  suggestionID = self->_suggestionID;
  if (suggestionID)
    objc_msgSend(v3, "setObject:forKey:", suggestionID, CFSTR("suggestionID"));
  if (-[NSMutableArray count](self->_abuseControlOutcomes, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_abuseControlOutcomes, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_abuseControlOutcomes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("abuseControlOutcome"));
  }
  if (-[NSMutableArray count](self->_timelineRelevanceScoreEntrys, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_timelineRelevanceScoreEntrys, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_timelineRelevanceScoreEntrys;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timelineRelevanceScoreEntry"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceSuggestionReadFrom(self, (uint64_t)a3);
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
  if (self->_suggestionID)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_abuseControlOutcomes;
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

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_timelineRelevanceScoreEntrys;
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
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_suggestionID)
    objc_msgSend(v12, "setSuggestionID:");
  if (-[ATXTimelineRelevancePBTimelineRelevanceSuggestion abuseControlOutcomesCount](self, "abuseControlOutcomesCount"))
  {
    objc_msgSend(v12, "clearAbuseControlOutcomes");
    v4 = -[ATXTimelineRelevancePBTimelineRelevanceSuggestion abuseControlOutcomesCount](self, "abuseControlOutcomesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXTimelineRelevancePBTimelineRelevanceSuggestion abuseControlOutcomeAtIndex:](self, "abuseControlOutcomeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAbuseControlOutcome:", v7);

      }
    }
  }
  if (-[ATXTimelineRelevancePBTimelineRelevanceSuggestion timelineRelevanceScoreEntrysCount](self, "timelineRelevanceScoreEntrysCount"))
  {
    objc_msgSend(v12, "clearTimelineRelevanceScoreEntrys");
    v8 = -[ATXTimelineRelevancePBTimelineRelevanceSuggestion timelineRelevanceScoreEntrysCount](self, "timelineRelevanceScoreEntrysCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ATXTimelineRelevancePBTimelineRelevanceSuggestion timelineRelevanceScoreEntryAtIndex:](self, "timelineRelevanceScoreEntryAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addTimelineRelevanceScoreEntry:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_suggestionID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_abuseControlOutcomes;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addAbuseControlOutcome:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_timelineRelevanceScoreEntrys;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addTimelineRelevanceScoreEntry:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *suggestionID;
  NSMutableArray *abuseControlOutcomes;
  NSMutableArray *timelineRelevanceScoreEntrys;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((suggestionID = self->_suggestionID, !((unint64_t)suggestionID | v4[2]))
     || -[NSString isEqual:](suggestionID, "isEqual:"))
    && ((abuseControlOutcomes = self->_abuseControlOutcomes, !((unint64_t)abuseControlOutcomes | v4[1]))
     || -[NSMutableArray isEqual:](abuseControlOutcomes, "isEqual:")))
  {
    timelineRelevanceScoreEntrys = self->_timelineRelevanceScoreEntrys;
    if ((unint64_t)timelineRelevanceScoreEntrys | v4[3])
      v8 = -[NSMutableArray isEqual:](timelineRelevanceScoreEntrys, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_suggestionID, "hash");
  v4 = -[NSMutableArray hash](self->_abuseControlOutcomes, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_timelineRelevanceScoreEntrys, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  if (*((_QWORD *)v4 + 2))
    -[ATXTimelineRelevancePBTimelineRelevanceSuggestion setSuggestionID:](self, "setSuggestionID:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[ATXTimelineRelevancePBTimelineRelevanceSuggestion addAbuseControlOutcome:](self, "addAbuseControlOutcome:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[ATXTimelineRelevancePBTimelineRelevanceSuggestion addTimelineRelevanceScoreEntry:](self, "addTimelineRelevanceScoreEntry:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionID, a3);
}

- (NSMutableArray)abuseControlOutcomes
{
  return self->_abuseControlOutcomes;
}

- (void)setAbuseControlOutcomes:(id)a3
{
  objc_storeStrong((id *)&self->_abuseControlOutcomes, a3);
}

- (NSMutableArray)timelineRelevanceScoreEntrys
{
  return self->_timelineRelevanceScoreEntrys;
}

- (void)setTimelineRelevanceScoreEntrys:(id)a3
{
  objc_storeStrong((id *)&self->_timelineRelevanceScoreEntrys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRelevanceScoreEntrys, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);
  objc_storeStrong((id *)&self->_abuseControlOutcomes, 0);
}

@end
