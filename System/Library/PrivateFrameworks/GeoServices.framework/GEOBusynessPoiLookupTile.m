@implementation GEOBusynessPoiLookupTile

- (GEOBusynessPoiLookupTile)init
{
  GEOBusynessPoiLookupTile *v2;
  GEOBusynessPoiLookupTile *v3;
  GEOBusynessPoiLookupTile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBusynessPoiLookupTile;
  v2 = -[GEOBusynessPoiLookupTile init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusynessPoiLookupTile)initWithData:(id)a3
{
  GEOBusynessPoiLookupTile *v3;
  GEOBusynessPoiLookupTile *v4;
  GEOBusynessPoiLookupTile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBusynessPoiLookupTile;
  v3 = -[GEOBusynessPoiLookupTile initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOBusynessPoiLookupTile;
  -[GEOBusynessPoiLookupTile dealloc](&v3, sel_dealloc);
}

- (void)_readLatitudeE7s
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusynessPoiLookupTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatitudeE7s_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readLongitudeE7s
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusynessPoiLookupTileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLongitudeE7s_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
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
  v8.super_class = (Class)GEOBusynessPoiLookupTile;
  -[GEOBusynessPoiLookupTile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusynessPoiLookupTile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    -[GEOBusynessPoiLookupTile readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("offsetId"));

    }
    if (*(_QWORD *)(a1 + 24))
    {
      PBRepeatedInt32NSArray();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("latitudeE7"));

    }
    if (*(_QWORD *)(a1 + 48))
    {
      PBRepeatedInt32NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("longitudeE7"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_36;
      else
        v6 = (int *)&readAll__nonRecursiveTag_36;
      GEOBusynessPoiLookupTileReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusynessPoiLookupTileReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_longitudeE7s;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_latitudeE7s.count)
    {
      PBDataWriterPlaceMark();
      if (self->_latitudeE7s.count)
      {
        v6 = 0;
        do
        {
          PBDataWriterWriteSfixed32Field();
          ++v6;
        }
        while (v6 < self->_latitudeE7s.count);
      }
      PBDataWriterRecallMark();
    }
    p_longitudeE7s = &self->_longitudeE7s;
    if (p_longitudeE7s->count)
    {
      PBDataWriterPlaceMark();
      if (p_longitudeE7s->count)
      {
        v8 = 0;
        do
        {
          PBDataWriterWriteSfixed32Field();
          ++v8;
        }
        while (v8 < p_longitudeE7s->count);
      }
      PBDataWriterRecallMark();
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  id v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v6 = reader;
    objc_sync_enter(v6);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOBusynessPoiLookupTileReadAllFrom(v4, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v7 = (id)v4;
      objc_sync_exit(v6);

      return (id)v4;
    }
    objc_sync_exit(v6);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 76) = self->_offsetId;
    *(_BYTE *)(v4 + 80) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 1);
  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_offsetId != *((_DWORD *)v4 + 19))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_9;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_9:
    IsEqual = 0;
    goto LABEL_10;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_10:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOBusynessPoiLookupTile readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_offsetId;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash() ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
