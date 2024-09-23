@implementation GEORPSuggestedRouteIndex

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPSuggestedRouteIndex;
  -[GEORPSuggestedRouteIndex dealloc](&v3, sel_dealloc);
}

- (unsigned)directionsResponseIndex
{
  return self->_directionsResponseIndex;
}

- (void)setDirectionsResponseIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_directionsResponseIndex = a3;
}

- (void)setHasDirectionsResponseIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDirectionsResponseIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)directionsResponseSuggestedRoutesIndex
{
  return self->_directionsResponseSuggestedRoutesIndex;
}

- (void)setDirectionsResponseSuggestedRoutesIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_directionsResponseSuggestedRoutesIndex = a3;
}

- (void)setHasDirectionsResponseSuggestedRoutesIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDirectionsResponseSuggestedRoutesIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)clusteredRouteRideSelectionsCount
{
  return self->_clusteredRouteRideSelections.count;
}

- (unsigned)clusteredRouteRideSelections
{
  return self->_clusteredRouteRideSelections.list;
}

- (void)clearClusteredRouteRideSelections
{
  PBRepeatedUInt32Clear();
}

- (void)addClusteredRouteRideSelections:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)clusteredRouteRideSelectionsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_clusteredRouteRideSelections;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_clusteredRouteRideSelections = &self->_clusteredRouteRideSelections;
  count = self->_clusteredRouteRideSelections.count;
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
  return p_clusteredRouteRideSelections->list[a3];
}

- (void)setClusteredRouteRideSelections:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)GEORPSuggestedRouteIndex;
  -[GEORPSuggestedRouteIndex description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPSuggestedRouteIndex dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSuggestedRouteIndex _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 40);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("directionsResponseIndex");
      else
        v7 = CFSTR("directions_response_index");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 40);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("directionsResponseSuggestedRoutesIndex");
      else
        v9 = CFSTR("directions_response_suggested_routes_index");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    if (*(_QWORD *)(a1 + 16))
    {
      PBRepeatedUInt32NSArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("clusteredRouteRideSelections");
      else
        v11 = CFSTR("clustered_route_ride_selections");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

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
  return -[GEORPSuggestedRouteIndex _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPSuggestedRouteIndex)initWithDictionary:(id)a3
{
  return (GEORPSuggestedRouteIndex *)-[GEORPSuggestedRouteIndex _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionsResponseIndex");
      else
        v6 = CFSTR("directions_response_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDirectionsResponseIndex:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("directionsResponseSuggestedRoutesIndex");
      else
        v8 = CFSTR("directions_response_suggested_routes_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDirectionsResponseSuggestedRoutesIndex:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("clusteredRouteRideSelections");
      else
        v10 = CFSTR("clustered_route_ride_selections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addClusteredRouteRideSelections:", objc_msgSend(v17, "unsignedIntValue", (_QWORD)v19));
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v14);
        }

      }
    }
  }

  return a1;
}

- (GEORPSuggestedRouteIndex)initWithJSON:(id)a3
{
  return (GEORPSuggestedRouteIndex *)-[GEORPSuggestedRouteIndex _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSuggestedRouteIndexIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSuggestedRouteIndexReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_clusteredRouteRideSelections;
  unint64_t v7;
  id v8;

  v4 = a3;
  flags = (char)self->_flags;
  v8 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  p_clusteredRouteRideSelections = &self->_clusteredRouteRideSelections;
  if (p_clusteredRouteRideSelections->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < p_clusteredRouteRideSelections->count);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  _DWORD *v8;

  v8 = a3;
  -[GEORPSuggestedRouteIndex readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v8[8] = self->_directionsResponseIndex;
    *((_BYTE *)v8 + 40) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v8[9] = self->_directionsResponseSuggestedRoutesIndex;
    *((_BYTE *)v8 + 40) |= 2u;
  }
  if (-[GEORPSuggestedRouteIndex clusteredRouteRideSelectionsCount](self, "clusteredRouteRideSelectionsCount"))
  {
    objc_msgSend(v8, "clearClusteredRouteRideSelections");
    v5 = -[GEORPSuggestedRouteIndex clusteredRouteRideSelectionsCount](self, "clusteredRouteRideSelectionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addClusteredRouteRideSelections:", -[GEORPSuggestedRouteIndex clusteredRouteRideSelectionsAtIndex:](self, "clusteredRouteRideSelectionsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_directionsResponseIndex;
    *(_BYTE *)(v4 + 40) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 36) = self->_directionsResponseSuggestedRoutesIndex;
    *(_BYTE *)(v4 + 40) |= 2u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEORPSuggestedRouteIndex readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_directionsResponseIndex != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    IsEqual = 0;
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_directionsResponseSuggestedRoutesIndex != *((_DWORD *)v4 + 9))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_13;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_14:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEORPSuggestedRouteIndex readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_directionsResponseIndex;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ PBRepeatedUInt32Hash();
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_directionsResponseSuggestedRoutesIndex;
  return v4 ^ v3 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unsigned int *v8;

  v8 = (unsigned int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = *((_BYTE *)v8 + 40);
  if ((v4 & 1) != 0)
  {
    self->_directionsResponseIndex = v8[8];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v8 + 40);
  }
  if ((v4 & 2) != 0)
  {
    self->_directionsResponseSuggestedRoutesIndex = v8[9];
    *(_BYTE *)&self->_flags |= 2u;
  }
  v5 = objc_msgSend(v8, "clusteredRouteRideSelectionsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEORPSuggestedRouteIndex addClusteredRouteRideSelections:](self, "addClusteredRouteRideSelections:", objc_msgSend(v8, "clusteredRouteRideSelectionsAtIndex:", i));
  }

}

@end
