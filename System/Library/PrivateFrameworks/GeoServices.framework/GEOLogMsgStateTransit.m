@implementation GEOLogMsgStateTransit

- (BOOL)transitNotAvailableAdvisoryShowing
{
  return self->_transitNotAvailableAdvisoryShowing;
}

- (void)setTransitNotAvailableAdvisoryShowing:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_transitNotAvailableAdvisoryShowing = a3;
}

- (void)setHasTransitNotAvailableAdvisoryShowing:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTransitNotAvailableAdvisoryShowing
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
  v8.super_class = (Class)GEOLogMsgStateTransit;
  -[GEOLogMsgStateTransit description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateTransit dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateTransit _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1[12] & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("transitNotAvailableAdvisoryShowing");
      else
        v6 = CFSTR("transit_not_available_advisory_showing");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

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
  return -[GEOLogMsgStateTransit _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateTransit)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateTransit *)-[GEOLogMsgStateTransit _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("transitNotAvailableAdvisoryShowing");
      else
        v6 = CFSTR("transit_not_available_advisory_showing");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitNotAvailableAdvisoryShowing:", objc_msgSend(v7, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateTransit)initWithJSON:(id)a3
{
  return (GEOLogMsgStateTransit *)-[GEOLogMsgStateTransit _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateTransitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateTransitReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;

  v4 = a3;
  -[GEOLogMsgStateTransit readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[8] = self->_transitNotAvailableAdvisoryShowing;
    v4[12] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_transitNotAvailableAdvisoryShowing;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_4;
  -[GEOLogMsgStateTransit readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      v5 = 0;
      goto LABEL_5;
    }
    if (self->_transitNotAvailableAdvisoryShowing)
    {
      if (!v4[8])
        goto LABEL_4;
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgStateTransit readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 2654435761 * self->_transitNotAvailableAdvisoryShowing;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;

  v4 = (BOOL *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[12])
  {
    self->_transitNotAvailableAdvisoryShowing = v4[8];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
