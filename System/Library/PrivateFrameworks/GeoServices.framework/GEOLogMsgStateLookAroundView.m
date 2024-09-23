@implementation GEOLogMsgStateLookAroundView

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)heading
{
  return self->_heading;
}

- (void)setHeading:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_heading = a3;
}

- (void)setHasHeading:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHeading
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
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

- (unsigned)numberPoisInView
{
  return self->_numberPoisInView;
}

- (void)setNumberPoisInView:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_numberPoisInView = a3;
}

- (void)setHasNumberPoisInView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberPoisInView
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)isLabelingShown
{
  return self->_isLabelingShown;
}

- (void)setIsLabelingShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isLabelingShown = a3;
}

- (void)setHasIsLabelingShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsLabelingShown
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateLookAroundView;
  -[GEOLogMsgStateLookAroundView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateLookAroundView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateLookAroundView _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  v8 = *(_BYTE *)(a1 + 36);
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("heading"));

    v8 = *(_BYTE *)(a1 + 36);
    if ((v8 & 1) == 0)
    {
LABEL_9:
      if ((v8 & 4) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)(a1 + 36) & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("zoomLevel");
  else
    v11 = CFSTR("zoom_level");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v8 = *(_BYTE *)(a1 + 36);
  if ((v8 & 4) == 0)
  {
LABEL_10:
    if ((v8 & 8) == 0)
      return v4;
    goto LABEL_21;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("numberPoisInView");
  else
    v13 = CFSTR("number_pois_in_view");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  if ((*(_BYTE *)(a1 + 36) & 8) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("isLabelingShown");
    else
      v15 = CFSTR("is_labeling_shown");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateLookAroundView _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateLookAroundView)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateLookAroundView *)-[GEOLogMsgStateLookAroundView _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLocation *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOLocation initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOLocation initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setLocation:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("heading"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHeading:", objc_msgSend(v10, "unsignedIntValue"));

      if (a3)
        v11 = CFSTR("zoomLevel");
      else
        v11 = CFSTR("zoom_level");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(a1, "setZoomLevel:");
      }

      if (a3)
        v13 = CFSTR("numberPoisInView");
      else
        v13 = CFSTR("number_pois_in_view");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberPoisInView:", objc_msgSend(v14, "unsignedIntValue"));

      if (a3)
        v15 = CFSTR("isLabelingShown");
      else
        v15 = CFSTR("is_labeling_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsLabelingShown:", objc_msgSend(v16, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateLookAroundView)initWithJSON:(id)a3
{
  return (GEOLogMsgStateLookAroundView *)-[GEOLogMsgStateLookAroundView _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateLookAroundViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateLookAroundViewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint32Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_8:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMsgStateLookAroundViewClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOLogMsgStateLookAroundView readAll:](self, "readAll:", 0);
  if (self->_location)
    objc_msgSend(v5, "setLocation:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_heading;
    *((_BYTE *)v5 + 36) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v5 + 7) = self->_numberPoisInView;
      *((_BYTE *)v5 + 36) |= 4u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_zoomLevel;
  *((_BYTE *)v5 + 36) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    *((_BYTE *)v5 + 32) = self->_isLabelingShown;
    *((_BYTE *)v5 + 36) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_heading;
    *(_BYTE *)(v5 + 36) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 28) = self->_numberPoisInView;
      *(_BYTE *)(v5 + 36) |= 4u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_zoomLevel;
  *(_BYTE *)(v5 + 36) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 32) = self->_isLabelingShown;
    *(_BYTE *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocation *location;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOLogMsgStateLookAroundView readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_heading != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_zoomLevel != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_numberPoisInView != *((_DWORD *)v4 + 7))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_21;
  }
  v6 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
    {
LABEL_21:
      v6 = 0;
      goto LABEL_22;
    }
    if (self->_isLabelingShown)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_21;
    }
    v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char flags;
  uint64_t v5;
  double zoomLevel;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[GEOLogMsgStateLookAroundView readAll:](self, "readAll:", 1);
  v3 = -[GEOLocation hash](self->_location, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5 = 2654435761 * self->_heading;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  zoomLevel = self->_zoomLevel;
  v7 = -zoomLevel;
  if (zoomLevel >= 0.0)
    v7 = self->_zoomLevel;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
    v11 = 2654435761 * self->_numberPoisInView;
    if ((flags & 8) != 0)
      goto LABEL_13;
LABEL_15:
    v12 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((flags & 8) == 0)
    goto LABEL_15;
LABEL_13:
  v12 = 2654435761 * self->_isLabelingShown;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  GEOLocation *location;
  uint64_t v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  location = self->_location;
  v5 = *((_QWORD *)v7 + 1);
  if (location)
  {
    if (v5)
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLogMsgStateLookAroundView setLocation:](self, "setLocation:");
  }
  v6 = *((_BYTE *)v7 + 36);
  if ((v6 & 2) != 0)
  {
    self->_heading = *((_DWORD *)v7 + 6);
    *(_BYTE *)&self->_flags |= 2u;
    v6 = *((_BYTE *)v7 + 36);
    if ((v6 & 1) == 0)
    {
LABEL_8:
      if ((v6 & 4) == 0)
        goto LABEL_9;
LABEL_14:
      self->_numberPoisInView = *((_DWORD *)v7 + 7);
      *(_BYTE *)&self->_flags |= 4u;
      if ((*((_BYTE *)v7 + 36) & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v7 + 36) & 1) == 0)
  {
    goto LABEL_8;
  }
  self->_zoomLevel = *((double *)v7 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v6 = *((_BYTE *)v7 + 36);
  if ((v6 & 4) != 0)
    goto LABEL_14;
LABEL_9:
  if ((v6 & 8) != 0)
  {
LABEL_10:
    self->_isLabelingShown = *((_BYTE *)v7 + 32);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
