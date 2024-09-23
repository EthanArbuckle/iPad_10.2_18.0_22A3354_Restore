@implementation GEOLogMsgStateMapViewLocation

- (int)locationBucket
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_locationBucket;
  else
    return 0;
}

- (void)setLocationBucket:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_locationBucket = a3;
}

- (void)setHasLocationBucket:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLocationBucket
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)locationBucketAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22D30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationBucket:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_BUCKET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEAR_BUCKET")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR_BUCKET")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentLocationInViewport
{
  return self->_isCurrentLocationInViewport;
}

- (void)setIsCurrentLocationInViewport:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isCurrentLocationInViewport = a3;
}

- (void)setHasIsCurrentLocationInViewport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsCurrentLocationInViewport
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasTouristInfo
{
  return self->_touristInfo != 0;
}

- (GEOTouristInfo)touristInfo
{
  return self->_touristInfo;
}

- (void)setTouristInfo:(id)a3
{
  objc_storeStrong((id *)&self->_touristInfo, a3);
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
  v8.super_class = (Class)GEOLogMsgStateMapViewLocation;
  -[GEOLogMsgStateMapViewLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapViewLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapViewLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) != 0)
    {
      v6 = *(int *)(a1 + 16);
      if (v6 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C22D30[v6];
      }
      if (a2)
        v8 = CFSTR("locationBucket");
      else
        v8 = CFSTR("location_bucket");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("isCurrentLocationInViewport");
      else
        v10 = CFSTR("is_current_location_in_viewport");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "touristInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("touristInfo");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("tourist_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

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
  return -[GEOLogMsgStateMapViewLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapViewLocation)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapViewLocation *)-[GEOLogMsgStateMapViewLocation _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  GEOTouristInfo *v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  if (!a1)
    goto LABEL_32;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_32;
  if (a3)
    v6 = CFSTR("locationBucket");
  else
    v6 = CFSTR("location_bucket");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_BUCKET")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEAR_BUCKET")) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("FAR_BUCKET")))
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
    objc_msgSend(a1, "setLocationBucket:", v9);
  }

  if (a3)
    v10 = CFSTR("isCurrentLocationInViewport");
  else
    v10 = CFSTR("is_current_location_in_viewport");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCurrentLocationInViewport:", objc_msgSend(v11, "BOOLValue"));

  if (a3)
    v12 = CFSTR("touristInfo");
  else
    v12 = CFSTR("tourist_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOTouristInfo alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOTouristInfo initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOTouristInfo initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setTouristInfo:", v15);

  }
LABEL_32:

  return a1;
}

- (GEOLogMsgStateMapViewLocation)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapViewLocation *)-[GEOLogMsgStateMapViewLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapViewLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapViewLocationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_touristInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOLogMsgStateMapViewLocation readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_locationBucket;
    *((_BYTE *)v6 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v6 + 20) = self->_isCurrentLocationInViewport;
    *((_BYTE *)v6 + 24) |= 2u;
  }
  if (self->_touristInfo)
  {
    objc_msgSend(v6, "setTouristInfo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_locationBucket;
    *(_BYTE *)(v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 20) = self->_isCurrentLocationInViewport;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v8 = -[GEOTouristInfo copyWithZone:](self->_touristInfo, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  GEOTouristInfo *touristInfo;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOLogMsgStateMapViewLocation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_locationBucket != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_17;
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  if ((*((_BYTE *)v4 + 24) & 2) == 0)
    goto LABEL_11;
  if (!self->_isCurrentLocationInViewport)
  {
    if (!*((_BYTE *)v4 + 20))
      goto LABEL_17;
    goto LABEL_11;
  }
  if (!*((_BYTE *)v4 + 20))
    goto LABEL_11;
LABEL_17:
  touristInfo = self->_touristInfo;
  if ((unint64_t)touristInfo | *((_QWORD *)v4 + 1))
    v5 = -[GEOTouristInfo isEqual:](touristInfo, "isEqual:");
  else
    v5 = 1;
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLogMsgStateMapViewLocation readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_locationBucket;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[GEOTouristInfo hash](self->_touristInfo, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_isCurrentLocationInViewport;
  return v4 ^ v3 ^ -[GEOTouristInfo hash](self->_touristInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  GEOTouristInfo *touristInfo;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 24);
  if ((v5 & 1) != 0)
  {
    self->_locationBucket = *((_DWORD *)v8 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v8 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_isCurrentLocationInViewport = *((_BYTE *)v8 + 20);
    *(_BYTE *)&self->_flags |= 2u;
  }
  touristInfo = self->_touristInfo;
  v7 = *((_QWORD *)v8 + 1);
  if (touristInfo)
  {
    if (v7)
    {
      -[GEOTouristInfo mergeFrom:](touristInfo, "mergeFrom:");
LABEL_10:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOLogMsgStateMapViewLocation setTouristInfo:](self, "setTouristInfo:");
    goto LABEL_10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touristInfo, 0);
}

@end
