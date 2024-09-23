@implementation _INPBVoiceCommandDeviceInformation

- (void)setDeviceIdiom:(int)a3
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
    self->_deviceIdiom = a3;
  }
}

- (BOOL)hasDeviceIdiom
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceIdiom:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)deviceIdiomAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1E2289E48[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceIdiom:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_POD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAC")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setIsHomePodInUltimateMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isHomePodInUltimateMode = a3;
}

- (BOOL)hasIsHomePodInUltimateMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsHomePodInUltimateMode:(BOOL)a3
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
  return _INPBVoiceCommandDeviceInformationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBVoiceCommandDeviceInformation hasDeviceIdiom](self, "hasDeviceIdiom"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBVoiceCommandDeviceInformation hasIsHomePodInUltimateMode](self, "hasIsHomePodInUltimateMode"))
    PBDataWriterWriteBOOLField();

}

- (_INPBVoiceCommandDeviceInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBVoiceCommandDeviceInformation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBVoiceCommandDeviceInformation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBVoiceCommandDeviceInformation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBVoiceCommandDeviceInformation initWithData:](self, "initWithData:", v6);

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
  -[_INPBVoiceCommandDeviceInformation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBVoiceCommandDeviceInformation *v4;

  v4 = -[_INPBVoiceCommandDeviceInformation init](+[_INPBVoiceCommandDeviceInformation allocWithZone:](_INPBVoiceCommandDeviceInformation, "allocWithZone:", a3), "init");
  if (-[_INPBVoiceCommandDeviceInformation hasDeviceIdiom](self, "hasDeviceIdiom"))
    -[_INPBVoiceCommandDeviceInformation setDeviceIdiom:](v4, "setDeviceIdiom:", -[_INPBVoiceCommandDeviceInformation deviceIdiom](self, "deviceIdiom"));
  if (-[_INPBVoiceCommandDeviceInformation hasIsHomePodInUltimateMode](self, "hasIsHomePodInUltimateMode"))
    -[_INPBVoiceCommandDeviceInformation setIsHomePodInUltimateMode:](v4, "setIsHomePodInUltimateMode:", -[_INPBVoiceCommandDeviceInformation isHomePodInUltimateMode](self, "isHomePodInUltimateMode"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int deviceIdiom;
  int v7;
  BOOL v8;
  int isHomePodInUltimateMode;

  v4 = a3;
  v8 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBVoiceCommandDeviceInformation hasDeviceIdiom](self, "hasDeviceIdiom");
    if (v5 == objc_msgSend(v4, "hasDeviceIdiom"))
    {
      if (!-[_INPBVoiceCommandDeviceInformation hasDeviceIdiom](self, "hasDeviceIdiom")
        || !objc_msgSend(v4, "hasDeviceIdiom")
        || (deviceIdiom = self->_deviceIdiom, deviceIdiom == objc_msgSend(v4, "deviceIdiom")))
      {
        v7 = -[_INPBVoiceCommandDeviceInformation hasIsHomePodInUltimateMode](self, "hasIsHomePodInUltimateMode");
        if (v7 == objc_msgSend(v4, "hasIsHomePodInUltimateMode"))
        {
          if (!-[_INPBVoiceCommandDeviceInformation hasIsHomePodInUltimateMode](self, "hasIsHomePodInUltimateMode")
            || !objc_msgSend(v4, "hasIsHomePodInUltimateMode")
            || (isHomePodInUltimateMode = self->_isHomePodInUltimateMode,
                isHomePodInUltimateMode == objc_msgSend(v4, "isHomePodInUltimateMode")))
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

  if (-[_INPBVoiceCommandDeviceInformation hasDeviceIdiom](self, "hasDeviceIdiom"))
    v3 = 2654435761 * self->_deviceIdiom;
  else
    v3 = 0;
  if (-[_INPBVoiceCommandDeviceInformation hasIsHomePodInUltimateMode](self, "hasIsHomePodInUltimateMode"))
    v4 = 2654435761 * self->_isHomePodInUltimateMode;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBVoiceCommandDeviceInformation hasDeviceIdiom](self, "hasDeviceIdiom"))
  {
    v4 = -[_INPBVoiceCommandDeviceInformation deviceIdiom](self, "deviceIdiom");
    if ((v4 - 1) >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2289E48[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceIdiom"));

  }
  if (-[_INPBVoiceCommandDeviceInformation hasIsHomePodInUltimateMode](self, "hasIsHomePodInUltimateMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBVoiceCommandDeviceInformation isHomePodInUltimateMode](self, "isHomePodInUltimateMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("isHomePodInUltimateMode"));

  }
  return v3;
}

- (int)deviceIdiom
{
  return self->_deviceIdiom;
}

- (BOOL)isHomePodInUltimateMode
{
  return self->_isHomePodInUltimateMode;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
