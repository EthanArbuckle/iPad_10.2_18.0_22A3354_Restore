@implementation _INPBSupportedTrafficIncidentType

- (void)setLocalizedDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayString, a3);
}

- (BOOL)hasLocalizedDisplayString
{
  return self->_localizedDisplayString != 0;
}

- (void)setType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E22952D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEEDTRAP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONSTRUCTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ROADWORK")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSupportedTrafficIncidentTypeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBSupportedTrafficIncidentType localizedDisplayString](self, "localizedDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSupportedTrafficIncidentType localizedDisplayString](self, "localizedDisplayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSupportedTrafficIncidentType hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSupportedTrafficIncidentType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSupportedTrafficIncidentType *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSupportedTrafficIncidentType *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSupportedTrafficIncidentType *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSupportedTrafficIncidentType initWithData:](self, "initWithData:", v6);

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
  -[_INPBSupportedTrafficIncidentType data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSupportedTrafficIncidentType *v5;
  id v6;

  v5 = -[_INPBSupportedTrafficIncidentType init](+[_INPBSupportedTrafficIncidentType allocWithZone:](_INPBSupportedTrafficIncidentType, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_localizedDisplayString, "copyWithZone:", a3);
  -[_INPBSupportedTrafficIncidentType setLocalizedDisplayString:](v5, "setLocalizedDisplayString:", v6);

  if (-[_INPBSupportedTrafficIncidentType hasType](self, "hasType"))
    -[_INPBSupportedTrafficIncidentType setType:](v5, "setType:", -[_INPBSupportedTrafficIncidentType type](self, "type"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBSupportedTrafficIncidentType localizedDisplayString](self, "localizedDisplayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSupportedTrafficIncidentType localizedDisplayString](self, "localizedDisplayString");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBSupportedTrafficIncidentType localizedDisplayString](self, "localizedDisplayString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedDisplayString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBSupportedTrafficIncidentType hasType](self, "hasType");
    if (v13 == objc_msgSend(v4, "hasType"))
    {
      if (!-[_INPBSupportedTrafficIncidentType hasType](self, "hasType")
        || !objc_msgSend(v4, "hasType")
        || (type = self->_type, type == objc_msgSend(v4, "type")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBString hash](self->_localizedDisplayString, "hash");
  if (-[_INPBSupportedTrafficIncidentType hasType](self, "hasType"))
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSupportedTrafficIncidentType localizedDisplayString](self, "localizedDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("localizedDisplayString"));

  if (-[_INPBSupportedTrafficIncidentType hasType](self, "hasType"))
  {
    v6 = -[_INPBSupportedTrafficIncidentType type](self, "type");
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E22952D0[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  }
  return v3;
}

- (_INPBString)localizedDisplayString
{
  return self->_localizedDisplayString;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
