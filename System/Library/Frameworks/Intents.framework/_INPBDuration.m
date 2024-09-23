@implementation _INPBDuration

- (void)setNanos:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nanos = a3;
}

- (BOOL)hasNanos
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNanos:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setSeconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_seconds = a3;
}

- (BOOL)hasSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBDuration hasNanos](self, "hasNanos"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBDuration hasSeconds](self, "hasSeconds"))
    PBDataWriterWriteInt64Field();

}

- (_INPBDuration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDuration *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDuration *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDuration *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDuration initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBDuration data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDuration *v4;

  v4 = -[_INPBDuration init](+[_INPBDuration allocWithZone:](_INPBDuration, "allocWithZone:", a3), "init");
  if (-[_INPBDuration hasNanos](self, "hasNanos"))
    -[_INPBDuration setNanos:](v4, "setNanos:", -[_INPBDuration nanos](self, "nanos"));
  if (-[_INPBDuration hasSeconds](self, "hasSeconds"))
    -[_INPBDuration setSeconds:](v4, "setSeconds:", -[_INPBDuration seconds](self, "seconds"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int nanos;
  int v7;
  BOOL v8;
  int64_t seconds;

  v4 = a3;
  v8 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBDuration hasNanos](self, "hasNanos");
    if (v5 == objc_msgSend(v4, "hasNanos"))
    {
      if (!-[_INPBDuration hasNanos](self, "hasNanos")
        || !objc_msgSend(v4, "hasNanos")
        || (nanos = self->_nanos, nanos == objc_msgSend(v4, "nanos")))
      {
        v7 = -[_INPBDuration hasSeconds](self, "hasSeconds");
        if (v7 == objc_msgSend(v4, "hasSeconds"))
        {
          if (!-[_INPBDuration hasSeconds](self, "hasSeconds")
            || !objc_msgSend(v4, "hasSeconds")
            || (seconds = self->_seconds, seconds == objc_msgSend(v4, "seconds")))
          {
            v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if (-[_INPBDuration hasNanos](self, "hasNanos"))
    v3 = 2654435761 * self->_nanos;
  else
    v3 = 0;
  if (-[_INPBDuration hasSeconds](self, "hasSeconds"))
    v4 = 2654435761 * self->_seconds;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDuration hasNanos](self, "hasNanos"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBDuration nanos](self, "nanos"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("nanos"));

  }
  if (-[_INPBDuration hasSeconds](self, "hasSeconds"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBDuration seconds](self, "seconds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("seconds"));

  }
  return v3;
}

- (int)nanos
{
  return self->_nanos;
}

- (int64_t)seconds
{
  return self->_seconds;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
