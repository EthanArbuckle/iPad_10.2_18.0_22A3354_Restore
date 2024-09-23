@implementation GEORouteInformation

- (void)mergeFrom:(_QWORD *)a1
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  -[GEORouteInformation readAll:]((uint64_t)v12, 0);
  v3 = (void *)a1[5];
  v4 = *((_QWORD *)v12 + 5);
  if (v3)
  {
    if (v4)
      objc_msgSend(v3, "mergeFrom:");
  }
  else if (v4)
  {
    -[GEORouteInformation setDuration:]((uint64_t)a1, *((void **)v12 + 5));
  }
  v5 = (void *)a1[3];
  v6 = *((_QWORD *)v12 + 3);
  if (v5)
  {
    if (v6)
      objc_msgSend(v5, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORouteInformation setDetail:]((uint64_t)a1, *((void **)v12 + 3));
  }
  v7 = (void *)a1[4];
  v8 = *((_QWORD *)v12 + 4);
  if (v7)
  {
    if (v8)
      objc_msgSend(v7, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORouteInformation setDistance:]((uint64_t)a1, *((void **)v12 + 4));
  }
  v9 = (void *)a1[6];
  v10 = *((_QWORD *)v12 + 6);
  if (v9)
  {
    if (v10)
      objc_msgSend(v9, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEORouteInformation setRouteDescription:]((uint64_t)a1, *((void **)v12 + 6));
  }
  v11 = (void *)*((_QWORD *)v12 + 7);
  if (v11)
    -[GEORouteInformation setSeparator:]((uint64_t)a1, v11);

}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(v1 + 76) |= 1u;
    *(_BYTE *)(v1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEORouteInformation readAll:](v1, 0);
    objc_msgSend(*(id *)(v1 + 40), "clearUnknownFields:", 1);
    objc_msgSend(*(id *)(v1 + 24), "clearUnknownFields:", 1);
    objc_msgSend(*(id *)(v1 + 32), "clearUnknownFields:", 1);
    return objc_msgSend(*(id *)(v1 + 48), "clearUnknownFields:", 1);
  }
  return result;
}

- (GEORouteInformation)init
{
  GEORouteInformation *v2;
  GEORouteInformation *v3;
  GEORouteInformation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteInformation;
  v2 = -[GEORouteInformation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteInformation)initWithData:(id)a3
{
  GEORouteInformation *v3;
  GEORouteInformation *v4;
  GEORouteInformation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteInformation;
  v3 = -[GEORouteInformation initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDuration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDuration_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)duration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEORouteInformation _readDuration]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setDuration:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 8u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setDetail:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 2u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readDistance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDistance_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)distance
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEORouteInformation _readDistance]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setDistance:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 4u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readRouteDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteDescription_tags_5323);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)routeDescription
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEORouteInformation _readRouteDescription]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setRouteDescription:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x10u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readSeparator
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSeparator_tags_5324);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)separator
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEORouteInformation _readSeparator]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setSeparator:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 76) |= 0x20u;
  *(_BYTE *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 56), a2);

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
  v8.super_class = (Class)GEORouteInformation;
  -[GEORouteInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  -[GEORouteInformation readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteInformation duration]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("duration"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 76) & 2) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEORouteInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetail_tags_5322);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v10 = *(id *)(a1 + 24);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("detail"));

  }
  -[GEORouteInformation distance]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("distance"));

  }
  -[GEORouteInformation routeDescription]((id *)a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("routeDescription");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("route_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  -[GEORouteInformation separator]((id *)a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("separator"));

  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __49__GEORouteInformation__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteInformation _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_5327;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5328;
      GEORouteInformationReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEORouteInformationCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __49__GEORouteInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  GEOFormattedString *v8;
  GEOFormattedString *v9;
  GEOFormattedString *v10;
  void *v11;
  GEOFormattedString *v12;
  GEOFormattedString *v13;
  GEOFormattedString *v14;
  void *v15;
  GEOFormattedString *v16;
  GEOFormattedString *v17;
  GEOFormattedString *v18;
  const __CFString *v19;
  void *v20;
  GEOFormattedString *v21;
  GEOFormattedString *v22;
  GEOFormattedString *v23;
  void *v24;
  void *v25;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = [GEOFormattedString alloc];
      if ((a3 & 1) != 0)
        v9 = -[GEOFormattedString initWithJSON:](v8, "initWithJSON:", v7);
      else
        v9 = -[GEOFormattedString initWithDictionary:](v8, "initWithDictionary:", v7);
      v10 = v9;
      -[GEORouteInformation setDuration:](v6, v9);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detail"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = [GEOFormattedString alloc];
      if ((a3 & 1) != 0)
        v13 = -[GEOFormattedString initWithJSON:](v12, "initWithJSON:", v11);
      else
        v13 = -[GEOFormattedString initWithDictionary:](v12, "initWithDictionary:", v11);
      v14 = v13;
      -[GEORouteInformation setDetail:](v6, v13);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = [GEOFormattedString alloc];
      if ((a3 & 1) != 0)
        v17 = -[GEOFormattedString initWithJSON:](v16, "initWithJSON:", v15);
      else
        v17 = -[GEOFormattedString initWithDictionary:](v16, "initWithDictionary:", v15);
      v18 = v17;
      -[GEORouteInformation setDistance:](v6, v17);

    }
    if (a3)
      v19 = CFSTR("routeDescription");
    else
      v19 = CFSTR("route_description");
    objc_msgSend(v5, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = [GEOFormattedString alloc];
      if ((a3 & 1) != 0)
        v22 = -[GEOFormattedString initWithJSON:](v21, "initWithJSON:", v20);
      else
        v22 = -[GEOFormattedString initWithDictionary:](v21, "initWithDictionary:", v20);
      v23 = v22;
      -[GEORouteInformation setRouteDescription:](v6, v22);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("separator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[GEORouteInformation setSeparator:](v6, v25);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteInformationIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORouteInformation readAll:]((uint64_t)self, 0);
    if (self->_duration)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_detail)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_distance)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_routeDescription)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_separator)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORouteInformation readAll:]((uint64_t)self, 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_duration, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_detail, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEOFormattedString copyWithZone:](self->_distance, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[GEOFormattedString copyWithZone:](self->_routeDescription, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v14;

    v16 = -[NSString copyWithZone:](self->_separator, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORouteInformationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *duration;
  GEOFormattedString *detail;
  GEOFormattedString *distance;
  GEOFormattedString *routeDescription;
  NSString *separator;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORouteInformation readAll:]((uint64_t)self, 1),
         -[GEORouteInformation readAll:]((uint64_t)v4, 1),
         duration = self->_duration,
         !((unint64_t)duration | v4[5]))
     || -[GEOFormattedString isEqual:](duration, "isEqual:"))
    && ((detail = self->_detail, !((unint64_t)detail | v4[3]))
     || -[GEOFormattedString isEqual:](detail, "isEqual:"))
    && ((distance = self->_distance, !((unint64_t)distance | v4[4]))
     || -[GEOFormattedString isEqual:](distance, "isEqual:"))
    && ((routeDescription = self->_routeDescription, !((unint64_t)routeDescription | v4[6]))
     || -[GEOFormattedString isEqual:](routeDescription, "isEqual:")))
  {
    separator = self->_separator;
    if ((unint64_t)separator | v4[7])
      v10 = -[NSString isEqual:](separator, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEORouteInformation readAll:]((uint64_t)self, 1);
  v3 = -[GEOFormattedString hash](self->_duration, "hash");
  v4 = -[GEOFormattedString hash](self->_detail, "hash") ^ v3;
  v5 = -[GEOFormattedString hash](self->_distance, "hash");
  v6 = v4 ^ v5 ^ -[GEOFormattedString hash](self->_routeDescription, "hash");
  return v6 ^ -[NSString hash](self->_separator, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
