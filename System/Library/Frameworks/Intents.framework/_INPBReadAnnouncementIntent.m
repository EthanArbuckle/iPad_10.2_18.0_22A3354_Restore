@implementation _INPBReadAnnouncementIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setReadType:(int)a3
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
    self->_readType = a3;
  }
}

- (BOOL)hasReadType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReadType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)readTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("READ");
  if (a3 == 2)
  {
    v3 = CFSTR("REPEAT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsReadType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READ")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("REPEAT")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setStartAnnouncementIdentifier:(id)a3
{
  NSString *v4;
  NSString *startAnnouncementIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  startAnnouncementIdentifier = self->_startAnnouncementIdentifier;
  self->_startAnnouncementIdentifier = v4;

}

- (BOOL)hasStartAnnouncementIdentifier
{
  return self->_startAnnouncementIdentifier != 0;
}

- (void)setUserNotificationType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_userNotificationType = a3;
  }
}

- (BOOL)hasUserNotificationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasUserNotificationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)userNotificationTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ANNOUNCEMENT");
  if (a3 == 2)
  {
    v3 = CFSTR("DELIVERY_FAILURE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUserNotificationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("DELIVERY_FAILURE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReadAnnouncementIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBReadAnnouncementIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBReadAnnouncementIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBReadAnnouncementIntent hasReadType](self, "hasReadType"))
    PBDataWriterWriteInt32Field();
  -[_INPBReadAnnouncementIntent startAnnouncementIdentifier](self, "startAnnouncementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_INPBReadAnnouncementIntent hasUserNotificationType](self, "hasUserNotificationType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBReadAnnouncementIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBReadAnnouncementIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBReadAnnouncementIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBReadAnnouncementIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBReadAnnouncementIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBReadAnnouncementIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBReadAnnouncementIntent *v5;
  id v6;
  void *v7;

  v5 = -[_INPBReadAnnouncementIntent init](+[_INPBReadAnnouncementIntent allocWithZone:](_INPBReadAnnouncementIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBReadAnnouncementIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  if (-[_INPBReadAnnouncementIntent hasReadType](self, "hasReadType"))
    -[_INPBReadAnnouncementIntent setReadType:](v5, "setReadType:", -[_INPBReadAnnouncementIntent readType](self, "readType"));
  v7 = (void *)-[NSString copyWithZone:](self->_startAnnouncementIdentifier, "copyWithZone:", a3);
  -[_INPBReadAnnouncementIntent setStartAnnouncementIdentifier:](v5, "setStartAnnouncementIdentifier:", v7);

  if (-[_INPBReadAnnouncementIntent hasUserNotificationType](self, "hasUserNotificationType"))
    -[_INPBReadAnnouncementIntent setUserNotificationType:](v5, "setUserNotificationType:", -[_INPBReadAnnouncementIntent userNotificationType](self, "userNotificationType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int readType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  int v21;
  int userNotificationType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[_INPBReadAnnouncementIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_15;
  -[_INPBReadAnnouncementIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBReadAnnouncementIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_16;
  }
  else
  {

  }
  v12 = -[_INPBReadAnnouncementIntent hasReadType](self, "hasReadType");
  if (v12 != objc_msgSend(v4, "hasReadType"))
    goto LABEL_16;
  if (-[_INPBReadAnnouncementIntent hasReadType](self, "hasReadType"))
  {
    if (objc_msgSend(v4, "hasReadType"))
    {
      readType = self->_readType;
      if (readType != objc_msgSend(v4, "readType"))
        goto LABEL_16;
    }
  }
  -[_INPBReadAnnouncementIntent startAnnouncementIdentifier](self, "startAnnouncementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnnouncementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  -[_INPBReadAnnouncementIntent startAnnouncementIdentifier](self, "startAnnouncementIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBReadAnnouncementIntent startAnnouncementIdentifier](self, "startAnnouncementIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAnnouncementIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_16;
  }
  else
  {

  }
  v21 = -[_INPBReadAnnouncementIntent hasUserNotificationType](self, "hasUserNotificationType");
  if (v21 == objc_msgSend(v4, "hasUserNotificationType"))
  {
    if (!-[_INPBReadAnnouncementIntent hasUserNotificationType](self, "hasUserNotificationType")
      || !objc_msgSend(v4, "hasUserNotificationType")
      || (userNotificationType = self->_userNotificationType,
          userNotificationType == objc_msgSend(v4, "userNotificationType")))
    {
      v19 = 1;
      goto LABEL_17;
    }
  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBReadAnnouncementIntent hasReadType](self, "hasReadType"))
    v4 = 2654435761 * self->_readType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_startAnnouncementIdentifier, "hash");
  if (-[_INPBReadAnnouncementIntent hasUserNotificationType](self, "hasUserNotificationType"))
    v6 = 2654435761 * self->_userNotificationType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBReadAnnouncementIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (-[_INPBReadAnnouncementIntent hasReadType](self, "hasReadType"))
  {
    v6 = -[_INPBReadAnnouncementIntent readType](self, "readType");
    if ((_DWORD)v6 == 1)
    {
      v7 = CFSTR("READ");
    }
    else if ((_DWORD)v6 == 2)
    {
      v7 = CFSTR("REPEAT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("readType"));

  }
  if (self->_startAnnouncementIdentifier)
  {
    -[_INPBReadAnnouncementIntent startAnnouncementIdentifier](self, "startAnnouncementIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("startAnnouncementIdentifier"));

  }
  if (-[_INPBReadAnnouncementIntent hasUserNotificationType](self, "hasUserNotificationType"))
  {
    v10 = -[_INPBReadAnnouncementIntent userNotificationType](self, "userNotificationType");
    if ((_DWORD)v10 == 1)
    {
      v11 = CFSTR("ANNOUNCEMENT");
    }
    else if ((_DWORD)v10 == 2)
    {
      v11 = CFSTR("DELIVERY_FAILURE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("userNotificationType"));

  }
  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)readType
{
  return self->_readType;
}

- (NSString)startAnnouncementIdentifier
{
  return self->_startAnnouncementIdentifier;
}

- (int)userNotificationType
{
  return self->_userNotificationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAnnouncementIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
