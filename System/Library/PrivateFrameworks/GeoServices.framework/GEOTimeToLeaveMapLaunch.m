@implementation GEOTimeToLeaveMapLaunch

- (double)minutesUntilEvent
{
  return self->_minutesUntilEvent;
}

- (void)setMinutesUntilEvent:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_minutesUntilEvent = a3;
}

- (void)setHasMinutesUntilEvent:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMinutesUntilEvent
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
  v8.super_class = (Class)GEOTimeToLeaveMapLaunch;
  -[GEOTimeToLeaveMapLaunch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTimeToLeaveMapLaunch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTimeToLeaveMapLaunch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("minutesUntilEvent");
      else
        v6 = CFSTR("minutes_until_event");
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
  return -[GEOTimeToLeaveMapLaunch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTimeToLeaveMapLaunch)initWithDictionary:(id)a3
{
  return (GEOTimeToLeaveMapLaunch *)-[GEOTimeToLeaveMapLaunch _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("minutesUntilEvent");
      else
        v6 = CFSTR("minutes_until_event");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setMinutesUntilEvent:");
      }

    }
  }

  return a1;
}

- (GEOTimeToLeaveMapLaunch)initWithJSON:(id)a3
{
  return (GEOTimeToLeaveMapLaunch *)-[GEOTimeToLeaveMapLaunch _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTimeToLeaveMapLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTimeToLeaveMapLaunchReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  -[GEOTimeToLeaveMapLaunch readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_minutesUntilEvent;
    *((_BYTE *)v4 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_minutesUntilEvent;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOTimeToLeaveMapLaunch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0 && self->_minutesUntilEvent == *((double *)v4 + 1))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  unint64_t result;
  double minutesUntilEvent;
  double v5;
  long double v6;
  double v7;

  -[GEOTimeToLeaveMapLaunch readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return 0;
  minutesUntilEvent = self->_minutesUntilEvent;
  v5 = -minutesUntilEvent;
  if (minutesUntilEvent >= 0.0)
    v5 = self->_minutesUntilEvent;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  result = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      result += (unint64_t)v7;
  }
  else
  {
    result -= (unint64_t)fabs(v7);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  double *v4;

  v4 = (double *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (((_BYTE)v4[2] & 1) != 0)
  {
    self->_minutesUntilEvent = v4[1];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
