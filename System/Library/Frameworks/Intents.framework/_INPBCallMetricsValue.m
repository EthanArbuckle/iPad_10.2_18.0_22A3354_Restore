@implementation _INPBCallMetricsValue

- (void)setCallDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_callDuration = a3;
}

- (BOOL)hasCallDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCallDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setTimeToEstablish:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timeToEstablish = a3;
}

- (BOOL)hasTimeToEstablish
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasTimeToEstablish:(BOOL)a3
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
  return _INPBCallMetricsValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBCallMetricsValue hasCallDuration](self, "hasCallDuration"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBCallMetricsValue hasTimeToEstablish](self, "hasTimeToEstablish"))
    PBDataWriterWriteDoubleField();

}

- (_INPBCallMetricsValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCallMetricsValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCallMetricsValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCallMetricsValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCallMetricsValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBCallMetricsValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCallMetricsValue *v4;

  v4 = -[_INPBCallMetricsValue init](+[_INPBCallMetricsValue allocWithZone:](_INPBCallMetricsValue, "allocWithZone:", a3), "init");
  if (-[_INPBCallMetricsValue hasCallDuration](self, "hasCallDuration"))
  {
    -[_INPBCallMetricsValue callDuration](self, "callDuration");
    -[_INPBCallMetricsValue setCallDuration:](v4, "setCallDuration:");
  }
  if (-[_INPBCallMetricsValue hasTimeToEstablish](self, "hasTimeToEstablish"))
  {
    -[_INPBCallMetricsValue timeToEstablish](self, "timeToEstablish");
    -[_INPBCallMetricsValue setTimeToEstablish:](v4, "setTimeToEstablish:");
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double callDuration;
  double v7;
  int v8;
  BOOL v9;
  double timeToEstablish;
  double v12;

  v4 = a3;
  v9 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBCallMetricsValue hasCallDuration](self, "hasCallDuration");
    if (v5 == objc_msgSend(v4, "hasCallDuration"))
    {
      if (!-[_INPBCallMetricsValue hasCallDuration](self, "hasCallDuration")
        || !objc_msgSend(v4, "hasCallDuration")
        || (callDuration = self->_callDuration, objc_msgSend(v4, "callDuration"), callDuration == v7))
      {
        v8 = -[_INPBCallMetricsValue hasTimeToEstablish](self, "hasTimeToEstablish");
        if (v8 == objc_msgSend(v4, "hasTimeToEstablish"))
        {
          if (!-[_INPBCallMetricsValue hasTimeToEstablish](self, "hasTimeToEstablish")
            || !objc_msgSend(v4, "hasTimeToEstablish")
            || (timeToEstablish = self->_timeToEstablish, objc_msgSend(v4, "timeToEstablish"), timeToEstablish == v12))
          {
            v9 = 1;
          }
        }
      }
    }
  }

  return v9;
}

- (unint64_t)hash
{
  double callDuration;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double timeToEstablish;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  if (-[_INPBCallMetricsValue hasCallDuration](self, "hasCallDuration"))
  {
    callDuration = self->_callDuration;
    v4 = -callDuration;
    if (callDuration >= 0.0)
      v4 = self->_callDuration;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    v7 = 0;
  }
  if (-[_INPBCallMetricsValue hasTimeToEstablish](self, "hasTimeToEstablish"))
  {
    timeToEstablish = self->_timeToEstablish;
    v9 = -timeToEstablish;
    if (timeToEstablish >= 0.0)
      v9 = self->_timeToEstablish;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v12 += (unint64_t)v11;
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v12 = 0;
  }
  return v12 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBCallMetricsValue hasCallDuration](self, "hasCallDuration"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBCallMetricsValue callDuration](self, "callDuration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("callDuration"));

  }
  if (-[_INPBCallMetricsValue hasTimeToEstablish](self, "hasTimeToEstablish"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBCallMetricsValue timeToEstablish](self, "timeToEstablish");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("timeToEstablish"));

  }
  return v3;
}

- (double)callDuration
{
  return self->_callDuration;
}

- (double)timeToEstablish
{
  return self->_timeToEstablish;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
