@implementation GEORPIncidentLocation

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (unsigned)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasZoomLevel
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
  v8.super_class = (Class)GEORPIncidentLocation;
  -[GEORPIncidentLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPIncidentLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "latLng");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("latLng");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("lat_lng");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("zoomLevel");
      else
        v10 = CFSTR("zoom_level");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

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
  return -[GEORPIncidentLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentLocation)initWithDictionary:(id)a3
{
  return (GEORPIncidentLocation *)-[GEORPIncidentLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("latLng");
      else
        v6 = CFSTR("lat_lng");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setLatLng:", v9);

      }
      if (a3)
        v11 = CFSTR("zoomLevel");
      else
        v11 = CFSTR("zoom_level");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZoomLevel:", objc_msgSend(v12, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEORPIncidentLocation)initWithJSON:(id)a3
{
  return (GEORPIncidentLocation *)-[GEORPIncidentLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentLocationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_latLng)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_latLng, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPIncidentLocation readAll:](self, "readAll:", 0);
  if (self->_latLng)
    objc_msgSend(v4, "setLatLng:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_zoomLevel;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_latLng, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_zoomLevel;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *latLng;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEORPIncidentLocation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_zoomLevel == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEORPIncidentLocation readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_latLng, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_zoomLevel;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *latLng;
  uint64_t v5;
  unsigned int *v6;

  v6 = (unsigned int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  latLng = self->_latLng;
  v5 = *((_QWORD *)v6 + 1);
  if (latLng)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPIncidentLocation setLatLng:](self, "setLatLng:");
  }
  if ((v6[5] & 1) != 0)
  {
    self->_zoomLevel = v6[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latLng, 0);
}

@end
