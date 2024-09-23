@implementation _INPBAnnouncementRecord

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_originator, a3);
}

- (BOOL)hasOriginator
{
  return self->_originator != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnnouncementRecordReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_INPBAnnouncementRecord hasDuration](self, "hasDuration"))
    PBDataWriterWriteDoubleField();
  -[_INPBAnnouncementRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBAnnouncementRecord originator](self, "originator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v5)
  {
    -[_INPBAnnouncementRecord originator](self, "originator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v6 = v8;
  }

}

- (_INPBAnnouncementRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAnnouncementRecord *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAnnouncementRecord *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAnnouncementRecord *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAnnouncementRecord initWithData:](self, "initWithData:", v6);

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
  -[_INPBAnnouncementRecord data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAnnouncementRecord *v5;
  void *v6;
  id v7;

  v5 = -[_INPBAnnouncementRecord init](+[_INPBAnnouncementRecord allocWithZone:](_INPBAnnouncementRecord, "allocWithZone:"), "init");
  if (-[_INPBAnnouncementRecord hasDuration](self, "hasDuration"))
  {
    -[_INPBAnnouncementRecord duration](self, "duration");
    -[_INPBAnnouncementRecord setDuration:](v5, "setDuration:");
  }
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBAnnouncementRecord setIdentifier:](v5, "setIdentifier:", v6);

  v7 = -[_INPBHomeFilter copyWithZone:](self->_originator, "copyWithZone:", a3);
  -[_INPBAnnouncementRecord setOriginator:](v5, "setOriginator:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double duration;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBAnnouncementRecord hasDuration](self, "hasDuration");
  if (v5 != objc_msgSend(v4, "hasDuration"))
    goto LABEL_16;
  if (-[_INPBAnnouncementRecord hasDuration](self, "hasDuration"))
  {
    if (objc_msgSend(v4, "hasDuration"))
    {
      duration = self->_duration;
      objc_msgSend(v4, "duration");
      if (duration != v7)
        goto LABEL_16;
    }
  }
  -[_INPBAnnouncementRecord identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_15;
  -[_INPBAnnouncementRecord identifier](self, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_INPBAnnouncementRecord identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBAnnouncementRecord originator](self, "originator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) != (v9 != 0))
  {
    -[_INPBAnnouncementRecord originator](self, "originator");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {

LABEL_19:
      v20 = 1;
      goto LABEL_17;
    }
    v16 = (void *)v15;
    -[_INPBAnnouncementRecord originator](self, "originator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v20 = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  double duration;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  NSUInteger v8;

  if (-[_INPBAnnouncementRecord hasDuration](self, "hasDuration"))
  {
    duration = self->_duration;
    v4 = -duration;
    if (duration >= 0.0)
      v4 = self->_duration;
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
  v8 = -[NSString hash](self->_identifier, "hash") ^ v7;
  return v8 ^ -[_INPBHomeFilter hash](self->_originator, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBAnnouncementRecord hasDuration](self, "hasDuration"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBAnnouncementRecord duration](self, "duration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  }
  if (self->_identifier)
  {
    -[_INPBAnnouncementRecord identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));

  }
  -[_INPBAnnouncementRecord originator](self, "originator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originator"));

  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBHomeFilter)originator
{
  return self->_originator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
