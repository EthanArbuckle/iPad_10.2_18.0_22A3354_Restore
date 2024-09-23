@implementation _INPBIntentResponsePayloadFailure

- (void)setAppLaunchRequested:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appLaunchRequested = a3;
}

- (BOOL)hasAppLaunchRequested
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAppLaunchRequested:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setEnumTypeName:(id)a3
{
  NSString *v4;
  NSString *enumTypeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  enumTypeName = self->_enumTypeName;
  self->_enumTypeName = v4;

}

- (BOOL)hasEnumTypeName
{
  return self->_enumTypeName != 0;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
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
  return _INPBIntentResponsePayloadFailureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_INPBIntentResponsePayloadFailure hasAppLaunchRequested](self, "hasAppLaunchRequested"))
    PBDataWriterWriteBOOLField();
  -[_INPBIntentResponsePayloadFailure enumTypeName](self, "enumTypeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentResponsePayloadFailure hasErrorCode](self, "hasErrorCode"))
    PBDataWriterWriteInt32Field();

}

- (_INPBIntentResponsePayloadFailure)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentResponsePayloadFailure *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentResponsePayloadFailure *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentResponsePayloadFailure *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentResponsePayloadFailure initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentResponsePayloadFailure data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentResponsePayloadFailure *v5;
  void *v6;

  v5 = -[_INPBIntentResponsePayloadFailure init](+[_INPBIntentResponsePayloadFailure allocWithZone:](_INPBIntentResponsePayloadFailure, "allocWithZone:"), "init");
  if (-[_INPBIntentResponsePayloadFailure hasAppLaunchRequested](self, "hasAppLaunchRequested"))
    -[_INPBIntentResponsePayloadFailure setAppLaunchRequested:](v5, "setAppLaunchRequested:", -[_INPBIntentResponsePayloadFailure appLaunchRequested](self, "appLaunchRequested"));
  v6 = (void *)-[NSString copyWithZone:](self->_enumTypeName, "copyWithZone:", a3);
  -[_INPBIntentResponsePayloadFailure setEnumTypeName:](v5, "setEnumTypeName:", v6);

  if (-[_INPBIntentResponsePayloadFailure hasErrorCode](self, "hasErrorCode"))
    -[_INPBIntentResponsePayloadFailure setErrorCode:](v5, "setErrorCode:", -[_INPBIntentResponsePayloadFailure errorCode](self, "errorCode"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int appLaunchRequested;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;
  int errorCode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  v5 = -[_INPBIntentResponsePayloadFailure hasAppLaunchRequested](self, "hasAppLaunchRequested");
  if (v5 != objc_msgSend(v4, "hasAppLaunchRequested"))
    goto LABEL_13;
  if (-[_INPBIntentResponsePayloadFailure hasAppLaunchRequested](self, "hasAppLaunchRequested"))
  {
    if (objc_msgSend(v4, "hasAppLaunchRequested"))
    {
      appLaunchRequested = self->_appLaunchRequested;
      if (appLaunchRequested != objc_msgSend(v4, "appLaunchRequested"))
        goto LABEL_13;
    }
  }
  -[_INPBIntentResponsePayloadFailure enumTypeName](self, "enumTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBIntentResponsePayloadFailure enumTypeName](self, "enumTypeName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[_INPBIntentResponsePayloadFailure enumTypeName](self, "enumTypeName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enumTypeName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_13;
    }
    else
    {

    }
    v15 = -[_INPBIntentResponsePayloadFailure hasErrorCode](self, "hasErrorCode");
    if (v15 == objc_msgSend(v4, "hasErrorCode"))
    {
      if (!-[_INPBIntentResponsePayloadFailure hasErrorCode](self, "hasErrorCode")
        || !objc_msgSend(v4, "hasErrorCode")
        || (errorCode = self->_errorCode, errorCode == objc_msgSend(v4, "errorCode")))
      {
        v16 = 1;
        goto LABEL_14;
      }
    }
  }
  else
  {

  }
LABEL_13:
  v16 = 0;
LABEL_14:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if (-[_INPBIntentResponsePayloadFailure hasAppLaunchRequested](self, "hasAppLaunchRequested"))
    v3 = 2654435761 * self->_appLaunchRequested;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_enumTypeName, "hash");
  if (-[_INPBIntentResponsePayloadFailure hasErrorCode](self, "hasErrorCode"))
    v5 = 2654435761 * self->_errorCode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  if (-[_INPBIntentResponsePayloadFailure hasAppLaunchRequested](self, "hasAppLaunchRequested"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentResponsePayloadFailure appLaunchRequested](self, "appLaunchRequested"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("app_launch_requested"));

  }
  if (self->_enumTypeName)
  {
    -[_INPBIntentResponsePayloadFailure enumTypeName](self, "enumTypeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enum_type_name"));

  }
  if (-[_INPBIntentResponsePayloadFailure hasErrorCode](self, "hasErrorCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_INPBIntentResponsePayloadFailure errorCode](self, "errorCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("error_code"));

  }
  return v3;
}

- (BOOL)appLaunchRequested
{
  return self->_appLaunchRequested;
}

- (NSString)enumTypeName
{
  return self->_enumTypeName;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumTypeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
