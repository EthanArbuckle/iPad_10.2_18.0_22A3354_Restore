@implementation CLPLOGENTRYVISIONLSLLocation

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (void)setAltitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLLocation;
  -[CLPLOGENTRYVISIONLSLLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONLSLLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPLOGENTRYVISIONLSLLocationCoordinate *coordinate;
  void *v5;
  void *v6;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  coordinate = self->_coordinate;
  if (coordinate)
  {
    -[CLPLOGENTRYVISIONLSLLocationCoordinate dictionaryRepresentation](coordinate, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("coordinate"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_altitude);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("altitude"));

  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    -[CLPLOGENTRYVISIONTimeStamp dictionaryRepresentation](timestamp, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_coordinate)
  {
    objc_msgSend(v4, "setCoordinate:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_altitude;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_timestamp)
  {
    objc_msgSend(v5, "setTimestamp:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPLOGENTRYVISIONLSLLocationCoordinate copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_altitude;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[CLPLOGENTRYVISIONTimeStamp copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONLSLLocationCoordinate *coordinate;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONLSLLocationCoordinate isEqual:](coordinate, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_altitude != *((double *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((_QWORD *)v4 + 3))
    v7 = -[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double altitude;
  double v6;
  long double v7;
  double v8;

  v3 = -[CLPLOGENTRYVISIONLSLLocationCoordinate hash](self->_coordinate, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    altitude = self->_altitude;
    v6 = -altitude;
    if (altitude >= 0.0)
      v6 = self->_altitude;
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
  return v4 ^ v3 ^ -[CLPLOGENTRYVISIONTimeStamp hash](self->_timestamp, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPLOGENTRYVISIONLSLLocationCoordinate *coordinate;
  uint64_t v6;
  CLPLOGENTRYVISIONTimeStamp *timestamp;
  uint64_t v8;
  id v9;

  v4 = a3;
  coordinate = self->_coordinate;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (coordinate)
  {
    if (!v6)
      goto LABEL_7;
    -[CLPLOGENTRYVISIONLSLLocationCoordinate mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CLPLOGENTRYVISIONLSLLocation setCoordinate:](self, "setCoordinate:");
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_altitude = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  timestamp = self->_timestamp;
  v8 = *((_QWORD *)v4 + 3);
  if (timestamp)
  {
    if (v8)
    {
      -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](timestamp, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[CLPLOGENTRYVISIONLSLLocation setTimestamp:](self, "setTimestamp:");
    goto LABEL_14;
  }

}

- (CLPLOGENTRYVISIONLSLLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (double)altitude
{
  return self->_altitude;
}

- (CLPLOGENTRYVISIONTimeStamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end
