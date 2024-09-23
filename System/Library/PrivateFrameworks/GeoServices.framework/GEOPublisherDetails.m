@implementation GEOPublisherDetails

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPublisherDetails;
  -[GEOPublisherDetails dealloc](&v3, sel_dealloc);
}

- (unint64_t)publisherIdsCount
{
  return self->_publisherIds.count;
}

- (unint64_t)publisherIds
{
  return self->_publisherIds.list;
}

- (void)clearPublisherIds
{
  PBRepeatedUInt64Clear();
}

- (void)addPublisherId:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)publisherIdAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_publisherIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_publisherIds = &self->_publisherIds;
  count = self->_publisherIds.count;
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
  return p_publisherIds->list[a3];
}

- (void)setPublisherIds:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (BOOL)currentlyFollowing
{
  return self->_currentlyFollowing;
}

- (void)setCurrentlyFollowing:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_currentlyFollowing = a3;
}

- (void)setHasCurrentlyFollowing:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCurrentlyFollowing
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOPublisherDetails;
  -[GEOPublisherDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPublisherDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPublisherDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 16))
    {
      PBRepeatedUInt64NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("publisherId");
      else
        v6 = CFSTR("publisher_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    if ((*(_BYTE *)(a1 + 36) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v8 = CFSTR("currentlyFollowing");
      else
        v8 = CFSTR("currently_following");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

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
  return -[GEOPublisherDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPublisherDetails)initWithDictionary:(id)a3
{
  return (GEOPublisherDetails *)-[GEOPublisherDetails _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("publisherId");
      else
        v6 = CFSTR("publisher_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v18;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addPublisherId:", objc_msgSend(v13, "unsignedLongLongValue", (_QWORD)v17));
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("currentlyFollowing");
      else
        v14 = CFSTR("currently_following");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14, (_QWORD)v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCurrentlyFollowing:", objc_msgSend(v15, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOPublisherDetails)initWithJSON:(id)a3
{
  return (GEOPublisherDetails *)-[GEOPublisherDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPublisherDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPublisherDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_publisherIds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_publisherIds.count);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _BYTE *v7;

  v7 = a3;
  -[GEOPublisherDetails readAll:](self, "readAll:", 0);
  if (-[GEOPublisherDetails publisherIdsCount](self, "publisherIdsCount"))
  {
    objc_msgSend(v7, "clearPublisherIds");
    v4 = -[GEOPublisherDetails publisherIdsCount](self, "publisherIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPublisherId:", -[GEOPublisherDetails publisherIdAtIndex:](self, "publisherIdAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[32] = self->_currentlyFollowing;
    v7[36] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[32] = self->_currentlyFollowing;
    v4[36] |= 1u;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_5;
  -[GEOPublisherDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_5;
  v5 = (v4[36] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[36] & 1) == 0)
    {
LABEL_5:
      v5 = 0;
      goto LABEL_6;
    }
    if (self->_currentlyFollowing)
    {
      if (!v4[32])
        goto LABEL_5;
    }
    else if (v4[32])
    {
      goto LABEL_5;
    }
    v5 = 1;
  }
LABEL_6:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPublisherDetails readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt64Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_currentlyFollowing;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL *v7;

  v7 = (BOOL *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "publisherIdsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPublisherDetails addPublisherId:](self, "addPublisherId:", objc_msgSend(v7, "publisherIdAtIndex:", i));
  }
  if (v7[36])
  {
    self->_currentlyFollowing = v7[32];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
