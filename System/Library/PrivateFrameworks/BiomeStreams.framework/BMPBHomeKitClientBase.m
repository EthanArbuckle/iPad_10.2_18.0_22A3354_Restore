@implementation BMPBHomeKitClientBase

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasHomeUniqueIdentifier
{
  return self->_homeUniqueIdentifier != 0;
}

- (void)setHomeOccupancy:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_homeOccupancy = a3;
}

- (void)setHasHomeOccupancy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHomeOccupancy
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasClientName
{
  return self->_clientName != 0;
}

- (BOOL)hasEventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier != 0;
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
  v8.super_class = (Class)BMPBHomeKitClientBase;
  -[BMPBHomeKitClientBase description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBHomeKitClientBase dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *homeUniqueIdentifier;
  void *v8;
  NSString *source;
  NSString *clientName;
  NSString *eventCorrelationIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("absoluteTimestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  }
  homeUniqueIdentifier = self->_homeUniqueIdentifier;
  if (homeUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", homeUniqueIdentifier, CFSTR("homeUniqueIdentifier"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_homeOccupancy);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("homeOccupancy"));

  }
  source = self->_source;
  if (source)
    objc_msgSend(v3, "setObject:forKey:", source, CFSTR("source"));
  clientName = self->_clientName;
  if (clientName)
    objc_msgSend(v3, "setObject:forKey:", clientName, CFSTR("clientName"));
  eventCorrelationIdentifier = self->_eventCorrelationIdentifier;
  if (eventCorrelationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", eventCorrelationIdentifier, CFSTR("eventCorrelationIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHomeKitClientBaseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_homeUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_clientName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_eventCorrelationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  v6 = v4;
  if (self->_homeUniqueIdentifier)
  {
    objc_msgSend(v4, "setHomeUniqueIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_homeOccupancy;
    *((_BYTE *)v4 + 64) |= 4u;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
    v4 = v6;
  }
  if (self->_clientName)
  {
    objc_msgSend(v6, "setClientName:");
    v4 = v6;
  }
  if (self->_eventCorrelationIdentifier)
  {
    objc_msgSend(v6, "setEventCorrelationIdentifier:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_duration;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_homeUniqueIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_homeOccupancy;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_clientName, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_eventCorrelationIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *homeUniqueIdentifier;
  NSString *source;
  NSString *clientName;
  NSString *eventCorrelationIdentifier;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  homeUniqueIdentifier = self->_homeUniqueIdentifier;
  if ((unint64_t)homeUniqueIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](homeUniqueIdentifier, "isEqual:"))
    {
LABEL_26:
      v10 = 0;
      goto LABEL_27;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_homeOccupancy != *((_DWORD *)v4 + 10))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_26;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 7) && !-[NSString isEqual:](source, "isEqual:"))
    goto LABEL_26;
  clientName = self->_clientName;
  if ((unint64_t)clientName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientName, "isEqual:"))
      goto LABEL_26;
  }
  eventCorrelationIdentifier = self->_eventCorrelationIdentifier;
  if ((unint64_t)eventCorrelationIdentifier | *((_QWORD *)v4 + 4))
    v10 = -[NSString isEqual:](eventCorrelationIdentifier, "isEqual:");
  else
    v10 = 1;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double absoluteTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double duration;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  NSUInteger v18;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v6 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v6 = self->_absoluteTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    duration = self->_duration;
    v11 = -duration;
    if (duration >= 0.0)
      v11 = self->_duration;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSString hash](self->_homeUniqueIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_homeOccupancy;
  else
    v15 = 0;
  v16 = v9 ^ v4 ^ v15 ^ v14;
  v17 = -[NSString hash](self->_source, "hash");
  v18 = v16 ^ v17 ^ -[NSString hash](self->_clientName, "hash");
  return v18 ^ -[NSString hash](self->_eventCorrelationIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_duration = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBHomeKitClientBase setHomeUniqueIdentifier:](self, "setHomeUniqueIdentifier:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    self->_homeOccupancy = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBHomeKitClientBase setSource:](self, "setSource:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBHomeKitClientBase setClientName:](self, "setClientName:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBHomeKitClientBase setEventCorrelationIdentifier:](self, "setEventCorrelationIdentifier:");
    v4 = v6;
  }

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (void)setHomeUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, a3);
}

- (int)homeOccupancy
{
  return self->_homeOccupancy;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (NSString)eventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier;
}

- (void)setEventCorrelationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
