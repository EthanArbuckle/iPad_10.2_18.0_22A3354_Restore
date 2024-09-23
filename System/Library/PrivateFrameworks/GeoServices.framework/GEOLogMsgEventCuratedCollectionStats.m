@implementation GEOLogMsgEventCuratedCollectionStats

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgEventCuratedCollectionStats;
  -[GEOLogMsgEventCuratedCollectionStats dealloc](&v3, sel_dealloc);
}

- (unint64_t)savedCollectionMuidsCount
{
  return self->_savedCollectionMuids.count;
}

- (unint64_t)savedCollectionMuids
{
  return self->_savedCollectionMuids.list;
}

- (void)clearSavedCollectionMuids
{
  PBRepeatedUInt64Clear();
}

- (void)addSavedCollectionMuids:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)savedCollectionMuidsAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_savedCollectionMuids;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_savedCollectionMuids = &self->_savedCollectionMuids;
  count = self->_savedCollectionMuids.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_savedCollectionMuids->list[a3];
}

- (void)setSavedCollectionMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
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
  v8.super_class = (Class)GEOLogMsgEventCuratedCollectionStats;
  -[GEOLogMsgEventCuratedCollectionStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventCuratedCollectionStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionStats _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[2])
    {
      PBRepeatedUInt64NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("savedCollectionMuids");
      else
        v6 = CFSTR("saved_collection_muids");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventCuratedCollectionStats _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventCuratedCollectionStats)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionStats *)-[GEOLogMsgEventCuratedCollectionStats _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("savedCollectionMuids");
      else
        v6 = CFSTR("saved_collection_muids");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addSavedCollectionMuids:", objc_msgSend(v13, "unsignedLongLongValue", (_QWORD)v15));
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v10);
        }

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventCuratedCollectionStats)initWithJSON:(id)a3
{
  return (GEOLogMsgEventCuratedCollectionStats *)-[GEOLogMsgEventCuratedCollectionStats _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventCuratedCollectionStatsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventCuratedCollectionStatsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_savedCollectionMuids;
  unint64_t v4;

  p_savedCollectionMuids = &self->_savedCollectionMuids;
  if (self->_savedCollectionMuids.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v4;
    }
    while (v4 < p_savedCollectionMuids->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  -[GEOLogMsgEventCuratedCollectionStats readAll:](self, "readAll:", 0);
  if (-[GEOLogMsgEventCuratedCollectionStats savedCollectionMuidsCount](self, "savedCollectionMuidsCount"))
  {
    objc_msgSend(v7, "clearSavedCollectionMuids");
    v4 = -[GEOLogMsgEventCuratedCollectionStats savedCollectionMuidsCount](self, "savedCollectionMuidsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSavedCollectionMuids:", -[GEOLogMsgEventCuratedCollectionStats savedCollectionMuidsAtIndex:](self, "savedCollectionMuidsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[GEOLogMsgEventCuratedCollectionStats readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOLogMsgEventCuratedCollectionStats readAll:](self, "readAll:", 1);
  return PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "savedCollectionMuidsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOLogMsgEventCuratedCollectionStats addSavedCollectionMuids:](self, "addSavedCollectionMuids:", objc_msgSend(v7, "savedCollectionMuidsAtIndex:", i));
  }

}

@end
