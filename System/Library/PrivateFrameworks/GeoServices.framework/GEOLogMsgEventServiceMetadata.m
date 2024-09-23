@implementation GEOLogMsgEventServiceMetadata

- (GEOLogMsgEventServiceMetadata)init
{
  GEOLogMsgEventServiceMetadata *v2;
  GEOLogMsgEventServiceMetadata *v3;
  GEOLogMsgEventServiceMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventServiceMetadata;
  v2 = -[GEOLogMsgEventServiceMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventServiceMetadata)initWithData:(id)a3
{
  GEOLogMsgEventServiceMetadata *v3;
  GEOLogMsgEventServiceMetadata *v4;
  GEOLogMsgEventServiceMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventServiceMetadata;
  v3 = -[GEOLogMsgEventServiceMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)serviceMetadataType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_serviceMetadataType;
  else
    return 0;
}

- (void)setServiceMetadataType:(int)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_serviceMetadataType = a3;
}

- (void)setHasServiceMetadataType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasServiceMetadataType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)serviceMetadataTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22848[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServiceMetadataType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ServiceMetadataType_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ServiceMetadataType_DIRECTIONS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ServiceMetadataType_PLACES")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDirectionsMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventServiceMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDirectionsMetadata
{
  -[GEOLogMsgEventServiceMetadata _readDirectionsMetadata]((uint64_t)self);
  return self->_directionsMetadata != 0;
}

- (GEODirectionsRequestResponseAnalyticsData)directionsMetadata
{
  -[GEOLogMsgEventServiceMetadata _readDirectionsMetadata]((uint64_t)self);
  return self->_directionsMetadata;
}

- (void)setDirectionsMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_directionsMetadata, a3);
}

- (void)_readPlacesMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventServiceMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlacesMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasPlacesMetadata
{
  -[GEOLogMsgEventServiceMetadata _readPlacesMetadata]((uint64_t)self);
  return self->_placesMetadata != 0;
}

- (GEOPDPlacesRequestResponseAnalyticsData)placesMetadata
{
  -[GEOLogMsgEventServiceMetadata _readPlacesMetadata]((uint64_t)self);
  return self->_placesMetadata;
}

- (void)setPlacesMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_placesMetadata, a3);
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
  v8.super_class = (Class)GEOLogMsgEventServiceMetadata;
  -[GEOLogMsgEventServiceMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventServiceMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventServiceMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v5 = *(int *)(a1 + 44);
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C22848[v5];
      }
      if (a2)
        v7 = CFSTR("serviceMetadataType");
      else
        v7 = CFSTR("service_metadata_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "directionsMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("directionsMetadata");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("directions_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    objc_msgSend((id)a1, "placesMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v12, "jsonRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("placesMetadata");
      }
      else
      {
        objc_msgSend(v12, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("places_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

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
  return -[GEOLogMsgEventServiceMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventServiceMetadata)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventServiceMetadata *)-[GEOLogMsgEventServiceMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEODirectionsRequestResponseAnalyticsData *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOPDPlacesRequestResponseAnalyticsData *v17;
  uint64_t v18;
  void *v19;

  v5 = a2;
  if (!a1)
    goto LABEL_35;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_35;
  if (a3)
    v6 = CFSTR("serviceMetadataType");
  else
    v6 = CFSTR("service_metadata_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ServiceMetadataType_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ServiceMetadataType_DIRECTIONS")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ServiceMetadataType_PLACES")))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_17:
    objc_msgSend(a1, "setServiceMetadataType:", v9);
  }

  if (a3)
    v10 = CFSTR("directionsMetadata");
  else
    v10 = CFSTR("directions_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEODirectionsRequestResponseAnalyticsData alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEODirectionsRequestResponseAnalyticsData initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEODirectionsRequestResponseAnalyticsData initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setDirectionsMetadata:", v13);

  }
  if (a3)
    v15 = CFSTR("placesMetadata");
  else
    v15 = CFSTR("places_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEOPDPlacesRequestResponseAnalyticsData alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEOPDPlacesRequestResponseAnalyticsData initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEOPDPlacesRequestResponseAnalyticsData initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(a1, "setPlacesMetadata:", v18);

  }
LABEL_35:

  return a1;
}

- (GEOLogMsgEventServiceMetadata)initWithJSON:(id)a3
{
  return (GEOLogMsgEventServiceMetadata *)-[GEOLogMsgEventServiceMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4000;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4001;
    GEOLogMsgEventServiceMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEODirectionsRequestResponseAnalyticsData readAll:](self->_directionsMetadata, "readAll:", 1);
    -[GEOPDPlacesRequestResponseAnalyticsData readAll:](self->_placesMetadata, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventServiceMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventServiceMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
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
    -[GEOLogMsgEventServiceMetadata readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_directionsMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_placesMetadata)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgEventServiceMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_serviceMetadataType;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  if (self->_directionsMetadata)
  {
    objc_msgSend(v5, "setDirectionsMetadata:");
    v4 = v5;
  }
  if (self->_placesMetadata)
  {
    objc_msgSend(v5, "setPlacesMetadata:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventServiceMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventServiceMetadata readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_serviceMetadataType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[GEODirectionsRequestResponseAnalyticsData copyWithZone:](self->_directionsMetadata, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[GEOPDPlacesRequestResponseAnalyticsData copyWithZone:](self->_placesMetadata, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEODirectionsRequestResponseAnalyticsData *directionsMetadata;
  GEOPDPlacesRequestResponseAnalyticsData *placesMetadata;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOLogMsgEventServiceMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_serviceMetadataType != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  directionsMetadata = self->_directionsMetadata;
  if ((unint64_t)directionsMetadata | *((_QWORD *)v4 + 2)
    && !-[GEODirectionsRequestResponseAnalyticsData isEqual:](directionsMetadata, "isEqual:"))
  {
    goto LABEL_11;
  }
  placesMetadata = self->_placesMetadata;
  if ((unint64_t)placesMetadata | *((_QWORD *)v4 + 3))
    v7 = -[GEOPDPlacesRequestResponseAnalyticsData isEqual:](placesMetadata, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  -[GEOLogMsgEventServiceMetadata readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_serviceMetadataType;
  else
    v3 = 0;
  v4 = -[GEODirectionsRequestResponseAnalyticsData hash](self->_directionsMetadata, "hash") ^ v3;
  return v4 ^ -[GEOPDPlacesRequestResponseAnalyticsData hash](self->_placesMetadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEODirectionsRequestResponseAnalyticsData *directionsMetadata;
  uint64_t v6;
  GEOPDPlacesRequestResponseAnalyticsData *placesMetadata;
  uint64_t v8;
  int *v9;

  v9 = (int *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  if ((v9[12] & 1) != 0)
  {
    self->_serviceMetadataType = v9[11];
    *(_BYTE *)&self->_flags |= 1u;
  }
  directionsMetadata = self->_directionsMetadata;
  v6 = *((_QWORD *)v9 + 2);
  if (directionsMetadata)
  {
    if (!v6)
      goto LABEL_9;
    -[GEODirectionsRequestResponseAnalyticsData mergeFrom:](directionsMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLogMsgEventServiceMetadata setDirectionsMetadata:](self, "setDirectionsMetadata:");
  }
  v4 = v9;
LABEL_9:
  placesMetadata = self->_placesMetadata;
  v8 = *((_QWORD *)v4 + 3);
  if (placesMetadata)
  {
    if (v8)
    {
      -[GEOPDPlacesRequestResponseAnalyticsData mergeFrom:](placesMetadata, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[GEOLogMsgEventServiceMetadata setPlacesMetadata:](self, "setPlacesMetadata:");
    goto LABEL_14;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placesMetadata, 0);
  objc_storeStrong((id *)&self->_directionsMetadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
