@implementation GEOLogMsgStateExtension

- (BOOL)hasRideBookingAppInstalled
{
  return self->_hasRideBookingAppInstalled;
}

- (void)setHasRideBookingAppInstalled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_hasRideBookingAppInstalled = a3;
}

- (void)setHasHasRideBookingAppInstalled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasRideBookingAppInstalled
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasRideBookingAppEnabled
{
  return self->_hasRideBookingAppEnabled;
}

- (void)setHasRideBookingAppEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_hasRideBookingAppEnabled = a3;
}

- (void)setHasHasRideBookingAppEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHasRideBookingAppEnabled
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasTableBookingAppInstalled
{
  return self->_hasTableBookingAppInstalled;
}

- (void)setHasTableBookingAppInstalled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_hasTableBookingAppInstalled = a3;
}

- (void)setHasHasTableBookingAppInstalled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHasTableBookingAppInstalled
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hasTableBookingAppEnabled
{
  return self->_hasTableBookingAppEnabled;
}

- (void)setHasTableBookingAppEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_hasTableBookingAppEnabled = a3;
}

- (void)setHasHasTableBookingAppEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHasTableBookingAppEnabled
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateExtension;
  -[GEOLogMsgStateExtension description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateExtension dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateExtension _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[12];
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[9]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("hasRideBookingAppInstalled");
    else
      v7 = CFSTR("has_ride_booking_app_installed");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = a1[12];
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("hasRideBookingAppEnabled");
    else
      v9 = CFSTR("has_ride_booking_app_enabled");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = a1[12];
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        return v4;
      goto LABEL_19;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[11]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("hasTableBookingAppInstalled");
  else
    v11 = CFSTR("has_table_booking_app_installed");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((a1[12] & 4) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("hasTableBookingAppEnabled");
    else
      v13 = CFSTR("has_table_booking_app_enabled");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateExtension _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateExtension)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateExtension *)-[GEOLogMsgStateExtension _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("hasRideBookingAppInstalled");
      else
        v6 = CFSTR("has_ride_booking_app_installed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasRideBookingAppInstalled:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("hasRideBookingAppEnabled");
      else
        v8 = CFSTR("has_ride_booking_app_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasRideBookingAppEnabled:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("hasTableBookingAppInstalled");
      else
        v10 = CFSTR("has_table_booking_app_installed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasTableBookingAppInstalled:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("hasTableBookingAppEnabled");
      else
        v12 = CFSTR("has_table_booking_app_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHasTableBookingAppEnabled:", objc_msgSend(v13, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateExtension)initWithJSON:(id)a3
{
  return (GEOLogMsgStateExtension *)-[GEOLogMsgStateExtension _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateExtensionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateExtensionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteBOOLField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateExtension readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[9] = self->_hasRideBookingAppInstalled;
    v5[12] |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
LABEL_9:
      v5[11] = self->_hasTableBookingAppInstalled;
      v5[12] |= 8u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[8] = self->_hasRideBookingAppEnabled;
  v5[12] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    v5[10] = self->_hasTableBookingAppEnabled;
    v5[12] |= 4u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_hasRideBookingAppInstalled;
    *((_BYTE *)result + 12) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 8) = self->_hasRideBookingAppEnabled;
  *((_BYTE *)result + 12) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_BYTE *)result + 11) = self->_hasTableBookingAppInstalled;
  *((_BYTE *)result + 12) |= 8u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_5:
  *((_BYTE *)result + 10) = self->_hasTableBookingAppEnabled;
  *((_BYTE *)result + 12) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOLogMsgStateExtension readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) == 0)
      goto LABEL_28;
    if (self->_hasRideBookingAppInstalled)
    {
      if (!v4[9])
        goto LABEL_28;
    }
    else if (v4[9])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_28;
    if (self->_hasRideBookingAppEnabled)
    {
      if (!v4[8])
        goto LABEL_28;
    }
    else if (v4[8])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v4[12] & 8) == 0)
      goto LABEL_28;
    if (self->_hasTableBookingAppInstalled)
    {
      if (!v4[11])
        goto LABEL_28;
    }
    else if (v4[11])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 8) != 0)
  {
    goto LABEL_28;
  }
  v5 = (v4[12] & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_hasTableBookingAppEnabled)
      {
        if (!v4[10])
          goto LABEL_28;
      }
      else if (v4[10])
      {
        goto LABEL_28;
      }
      v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLogMsgStateExtension readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_hasRideBookingAppInstalled;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_hasRideBookingAppEnabled;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_hasTableBookingAppInstalled;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_hasTableBookingAppEnabled;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[12];
  if ((v4 & 2) != 0)
  {
    self->_hasRideBookingAppInstalled = v5[9];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = v5[12];
    if (!v4)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_hasTableBookingAppInstalled = v5[11];
      *(_BYTE *)&self->_flags |= 8u;
      if ((v5[12] & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if (!v5[12])
  {
    goto LABEL_3;
  }
  self->_hasRideBookingAppEnabled = v5[8];
  *(_BYTE *)&self->_flags |= 1u;
  v4 = v5[12];
  if ((v4 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_5:
    self->_hasTableBookingAppEnabled = v5[10];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_6:

}

@end
