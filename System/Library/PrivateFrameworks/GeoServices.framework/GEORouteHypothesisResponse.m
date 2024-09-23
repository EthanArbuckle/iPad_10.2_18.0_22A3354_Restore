@implementation GEORouteHypothesisResponse

- (GEORouteHypothesisResponse)init
{
  GEORouteHypothesisResponse *v2;
  GEORouteHypothesisResponse *v3;
  GEORouteHypothesisResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteHypothesisResponse;
  v2 = -[GEORouteHypothesisResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteHypothesisResponse)initWithData:(id)a3
{
  GEORouteHypothesisResponse *v3;
  GEORouteHypothesisResponse *v4;
  GEORouteHypothesisResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteHypothesisResponse;
  v3 = -[GEORouteHypothesisResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteHypothesisResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDirectionsResponse
{
  -[GEORouteHypothesisResponse _readDirectionsResponse]((uint64_t)self);
  return self->_directionsResponse != 0;
}

- (GEODirectionsResponse)directionsResponse
{
  -[GEORouteHypothesisResponse _readDirectionsResponse]((uint64_t)self);
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_directionsResponse, a3);
}

- (void)_readEtaResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteHypothesisResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaResponse_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEtaResponse
{
  -[GEORouteHypothesisResponse _readEtaResponse]((uint64_t)self);
  return self->_etaResponse != 0;
}

- (GEOETAResponse)etaResponse
{
  -[GEORouteHypothesisResponse _readEtaResponse]((uint64_t)self);
  return self->_etaResponse;
}

- (void)setEtaResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_etaResponse, a3);
}

- (double)updatedTimeStamp
{
  return self->_updatedTimeStamp;
}

- (void)setUpdatedTimeStamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_updatedTimeStamp = a3;
}

- (void)setHasUpdatedTimeStamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasUpdatedTimeStamp
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
  v8.super_class = (Class)GEORouteHypothesisResponse;
  -[GEORouteHypothesisResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteHypothesisResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteHypothesisResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "directionsResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("directionsResponse"));

    }
    objc_msgSend((id)a1, "etaResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("etaResponse"));

    }
    if ((*(_BYTE *)(a1 + 52) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("updatedTimeStamp"));

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
  return -[GEORouteHypothesisResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORouteHypothesisResponse)initWithDictionary:(id)a3
{
  return (GEORouteHypothesisResponse *)-[GEORouteHypothesisResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEODirectionsResponse *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOETAResponse *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("directionsResponse"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEODirectionsResponse alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEODirectionsResponse initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEODirectionsResponse initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setDirectionsResponse:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("etaResponse"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOETAResponse alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOETAResponse initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOETAResponse initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setEtaResponse:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updatedTimeStamp"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(a1, "setUpdatedTimeStamp:");
      }

    }
  }

  return a1;
}

- (GEORouteHypothesisResponse)initWithJSON:(id)a3
{
  return (GEORouteHypothesisResponse *)-[GEORouteHypothesisResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_23;
    else
      v8 = (int *)&readAll__nonRecursiveTag_23;
    GEORouteHypothesisResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEODirectionsResponse readAll:](self->_directionsResponse, "readAll:", 1);
    -[GEOETAResponse readAll:](self->_etaResponse, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteHypothesisResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteHypothesisResponseReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORouteHypothesisResponseIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORouteHypothesisResponse readAll:](self, "readAll:", 0);
    if (self->_directionsResponse)
      PBDataWriterWriteSubmessage();
    if (self->_etaResponse)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORouteHypothesisResponseClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORouteHypothesisResponse _readDirectionsResponse]((uint64_t)self);
  if (-[GEODirectionsResponse hasGreenTeaWithValue:](self->_directionsResponse, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORouteHypothesisResponse _readEtaResponse]((uint64_t)self);
  return -[GEOETAResponse hasGreenTeaWithValue:](self->_etaResponse, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORouteHypothesisResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponse)
    objc_msgSend(v4, "setDirectionsResponse:");
  if (self->_etaResponse)
    objc_msgSend(v4, "setEtaResponse:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[4] = *(id *)&self->_updatedTimeStamp;
    *((_BYTE *)v4 + 52) |= 1u;
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
  void *v12;

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
      GEORouteHypothesisResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteHypothesisResponse readAll:](self, "readAll:", 0);
  v9 = -[GEODirectionsResponse copyWithZone:](self->_directionsResponse, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[GEOETAResponse copyWithZone:](self->_etaResponse, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_updatedTimeStamp;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEODirectionsResponse *directionsResponse;
  GEOETAResponse *etaResponse;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEORouteHypothesisResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsResponse = self->_directionsResponse;
  if ((unint64_t)directionsResponse | *((_QWORD *)v4 + 2))
  {
    if (!-[GEODirectionsResponse isEqual:](directionsResponse, "isEqual:"))
      goto LABEL_10;
  }
  etaResponse = self->_etaResponse;
  if ((unint64_t)etaResponse | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOETAResponse isEqual:](etaResponse, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0 && self->_updatedTimeStamp == *((double *)v4 + 4))
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double updatedTimeStamp;
  double v7;
  long double v8;
  double v9;

  -[GEORouteHypothesisResponse readAll:](self, "readAll:", 1);
  v3 = -[GEODirectionsResponse hash](self->_directionsResponse, "hash");
  v4 = -[GEOETAResponse hash](self->_etaResponse, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    updatedTimeStamp = self->_updatedTimeStamp;
    v7 = -updatedTimeStamp;
    if (updatedTimeStamp >= 0.0)
      v7 = self->_updatedTimeStamp;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEODirectionsResponse *directionsResponse;
  uint64_t v6;
  GEOETAResponse *etaResponse;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  directionsResponse = self->_directionsResponse;
  v6 = v9[2];
  if (directionsResponse)
  {
    if (!v6)
      goto LABEL_7;
    -[GEODirectionsResponse mergeFrom:](directionsResponse, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEORouteHypothesisResponse setDirectionsResponse:](self, "setDirectionsResponse:");
  }
  v4 = v9;
LABEL_7:
  etaResponse = self->_etaResponse;
  v8 = v4[3];
  if (etaResponse)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOETAResponse mergeFrom:](etaResponse, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEORouteHypothesisResponse setEtaResponse:](self, "setEtaResponse:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_updatedTimeStamp = (double)v4[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaResponse, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
