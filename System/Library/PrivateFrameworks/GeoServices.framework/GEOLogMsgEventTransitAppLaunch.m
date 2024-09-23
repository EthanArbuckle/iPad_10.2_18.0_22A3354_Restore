@implementation GEOLogMsgEventTransitAppLaunch

- (GEOLogMsgEventTransitAppLaunch)init
{
  GEOLogMsgEventTransitAppLaunch *v2;
  GEOLogMsgEventTransitAppLaunch *v3;
  GEOLogMsgEventTransitAppLaunch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTransitAppLaunch;
  v2 = -[GEOLogMsgEventTransitAppLaunch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTransitAppLaunch)initWithData:(id)a3
{
  GEOLogMsgEventTransitAppLaunch *v3;
  GEOLogMsgEventTransitAppLaunch *v4;
  GEOLogMsgEventTransitAppLaunch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTransitAppLaunch;
  v3 = -[GEOLogMsgEventTransitAppLaunch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBundleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTransitAppLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBundleIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasBundleIdentifier
{
  -[GEOLogMsgEventTransitAppLaunch _readBundleIdentifier]((uint64_t)self);
  return self->_bundleIdentifier != 0;
}

- (NSString)bundleIdentifier
{
  -[GEOLogMsgEventTransitAppLaunch _readBundleIdentifier]((uint64_t)self);
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void)_readSource
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTransitAppLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSource_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSource
{
  -[GEOLogMsgEventTransitAppLaunch _readSource]((uint64_t)self);
  return self->_source != 0;
}

- (GEOLatLng)source
{
  -[GEOLogMsgEventTransitAppLaunch _readSource]((uint64_t)self);
  return self->_source;
}

- (void)setSource:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_source, a3);
}

- (void)_readDestination
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTransitAppLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestination_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDestination
{
  -[GEOLogMsgEventTransitAppLaunch _readDestination]((uint64_t)self);
  return self->_destination != 0;
}

- (GEOLatLng)destination
{
  -[GEOLogMsgEventTransitAppLaunch _readDestination]((uint64_t)self);
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_destination, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasTimestamp
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
  v8.super_class = (Class)GEOLogMsgEventTransitAppLaunch;
  -[GEOLogMsgEventTransitAppLaunch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventTransitAppLaunch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTransitAppLaunch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("bundleIdentifier");
      else
        v6 = CFSTR("bundle_identifier");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("source"));

    }
    objc_msgSend((id)a1, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v10, "jsonRepresentation");
      else
        objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("destination"));

    }
    if ((*(_BYTE *)(a1 + 60) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timestamp"));

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
  return -[GEOLogMsgEventTransitAppLaunch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTransitAppLaunch)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTransitAppLaunch *)-[GEOLogMsgEventTransitAppLaunch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOLatLng *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  GEOLatLng *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("bundleIdentifier");
      else
        v6 = CFSTR("bundle_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setBundleIdentifier:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOLatLng initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOLatLng initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setSource:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destination"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOLatLng initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOLatLng initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setDestination:", v15);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

    }
  }

  return a1;
}

- (GEOLogMsgEventTransitAppLaunch)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTransitAppLaunch *)-[GEOLogMsgEventTransitAppLaunch _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_4433;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4434;
    GEOLogMsgEventTransitAppLaunchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_source, "readAll:", 1);
    -[GEOLatLng readAll:](self->_destination, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTransitAppLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTransitAppLaunchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventTransitAppLaunch readAll:](self, "readAll:", 0);
    if (self->_bundleIdentifier)
      PBDataWriterWriteStringField();
    if (self->_source)
      PBDataWriterWriteSubmessage();
    if (self->_destination)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLogMsgEventTransitAppLaunch _readDestination]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_destination, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgEventTransitAppLaunch _readSource]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_source, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgEventTransitAppLaunch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_bundleIdentifier)
    objc_msgSend(v5, "setBundleIdentifier:");
  if (self->_source)
    objc_msgSend(v5, "setSource:");
  v4 = v5;
  if (self->_destination)
  {
    objc_msgSend(v5, "setDestination:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[5] = *(id *)&self->_timestamp;
    *((_BYTE *)v4 + 60) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventTransitAppLaunchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventTransitAppLaunch readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_source, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOLatLng copyWithZone:](self->_destination, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 40) = self->_timestamp;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleIdentifier;
  GEOLatLng *source;
  GEOLatLng *destination;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOLogMsgEventTransitAppLaunch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](source, "isEqual:"))
      goto LABEL_12;
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](destination, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0 && self->_timestamp == *((double *)v4 + 5))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double timestamp;
  double v8;
  long double v9;
  double v10;

  -[GEOLogMsgEventTransitAppLaunch readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[GEOLatLng hash](self->_source, "hash");
  v5 = -[GEOLatLng hash](self->_destination, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    timestamp = self->_timestamp;
    v8 = -timestamp;
    if (timestamp >= 0.0)
      v8 = self->_timestamp;
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
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLatLng *source;
  uint64_t v6;
  GEOLatLng *destination;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if (v9[2])
  {
    -[GEOLogMsgEventTransitAppLaunch setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v9;
  }
  source = self->_source;
  v6 = v4[4];
  if (source)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLatLng mergeFrom:](source, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLogMsgEventTransitAppLaunch setSource:](self, "setSource:");
  }
  v4 = v9;
LABEL_9:
  destination = self->_destination;
  v8 = v4[3];
  if (destination)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOLatLng mergeFrom:](destination, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOLogMsgEventTransitAppLaunch setDestination:](self, "setDestination:");
  }
  v4 = v9;
LABEL_15:
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_timestamp = (double)v4[5];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
