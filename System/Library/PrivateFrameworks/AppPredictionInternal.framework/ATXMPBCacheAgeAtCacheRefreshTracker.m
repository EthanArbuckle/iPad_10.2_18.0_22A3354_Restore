@implementation ATXMPBCacheAgeAtCacheRefreshTracker

- (BOOL)hasCacheName
{
  return self->_cacheName != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (void)setCacheAge:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cacheAge = a3;
}

- (void)setHasCacheAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheAge
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)ATXMPBCacheAgeAtCacheRefreshTracker;
  -[ATXMPBCacheAgeAtCacheRefreshTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBCacheAgeAtCacheRefreshTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *cacheName;
  NSString *abGroup;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  cacheName = self->_cacheName;
  if (cacheName)
    objc_msgSend(v3, "setObject:forKey:", cacheName, CFSTR("cacheName"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cacheAge);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cacheAge"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBCacheAgeAtCacheRefreshTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_cacheName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_cacheName)
  {
    objc_msgSend(v4, "setCacheName:");
    v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_cacheAge;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_cacheName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_cacheAge;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *cacheName;
  NSString *abGroup;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  cacheName = self->_cacheName;
  if ((unint64_t)cacheName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](cacheName, "isEqual:"))
      goto LABEL_10;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_cacheAge == *((_DWORD *)v4 + 4))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_cacheName, "hash");
  v4 = -[NSString hash](self->_abGroup, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_cacheAge;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBCacheAgeAtCacheRefreshTracker setCacheName:](self, "setCacheName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBCacheAgeAtCacheRefreshTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_cacheAge = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (void)setCacheName:(id)a3
{
  objc_storeStrong((id *)&self->_cacheName, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (unsigned)cacheAge
{
  return self->_cacheAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
