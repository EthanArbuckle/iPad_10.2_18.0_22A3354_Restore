@implementation _INPBIntentResponsePayloadSuccess

- (void)setResponseMessageData:(id)a3
{
  NSData *v4;
  NSData *responseMessageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  responseMessageData = self->_responseMessageData;
  self->_responseMessageData = v4;

}

- (BOOL)hasResponseMessageData
{
  return self->_responseMessageData != 0;
}

- (void)setResponseTypeName:(id)a3
{
  NSString *v4;
  NSString *responseTypeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  responseTypeName = self->_responseTypeName;
  self->_responseTypeName = v4;

}

- (BOOL)hasResponseTypeName
{
  return self->_responseTypeName != 0;
}

- (void)setShouldOpenContainingApplication:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldOpenContainingApplication = a3;
}

- (BOOL)hasShouldOpenContainingApplication
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasShouldOpenContainingApplication:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentResponsePayloadSuccessReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBIntentResponsePayloadSuccess responseMessageData](self, "responseMessageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[_INPBIntentResponsePayloadSuccess responseTypeName](self, "responseTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication"))
  {
    PBDataWriterWriteBOOLField();
  }

}

- (_INPBIntentResponsePayloadSuccess)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentResponsePayloadSuccess *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentResponsePayloadSuccess *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentResponsePayloadSuccess *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentResponsePayloadSuccess initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentResponsePayloadSuccess data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentResponsePayloadSuccess *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBIntentResponsePayloadSuccess init](+[_INPBIntentResponsePayloadSuccess allocWithZone:](_INPBIntentResponsePayloadSuccess, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_responseMessageData, "copyWithZone:", a3);
  -[_INPBIntentResponsePayloadSuccess setResponseMessageData:](v5, "setResponseMessageData:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_responseTypeName, "copyWithZone:", a3);
  -[_INPBIntentResponsePayloadSuccess setResponseTypeName:](v5, "setResponseTypeName:", v7);

  if (-[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication"))
  {
    -[_INPBIntentResponsePayloadSuccess setShouldOpenContainingApplication:](v5, "setShouldOpenContainingApplication:", -[_INPBIntentResponsePayloadSuccess shouldOpenContainingApplication](self, "shouldOpenContainingApplication"));
  }
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int v19;
  int shouldOpenContainingApplication;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBIntentResponsePayloadSuccess responseMessageData](self, "responseMessageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBIntentResponsePayloadSuccess responseMessageData](self, "responseMessageData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentResponsePayloadSuccess responseMessageData](self, "responseMessageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseMessageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBIntentResponsePayloadSuccess responseTypeName](self, "responseTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBIntentResponsePayloadSuccess responseTypeName](self, "responseTypeName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentResponsePayloadSuccess responseTypeName](self, "responseTypeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseTypeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication");
  if (v19 == objc_msgSend(v4, "hasShouldOpenContainingApplication"))
  {
    if (!-[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication")|| !objc_msgSend(v4, "hasShouldOpenContainingApplication")|| (shouldOpenContainingApplication = self->_shouldOpenContainingApplication, shouldOpenContainingApplication == objc_msgSend(v4, "shouldOpenContainingApplication")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_responseMessageData, "hash");
  v4 = -[NSString hash](self->_responseTypeName, "hash");
  if (-[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication"))
  {
    v5 = 2654435761 * self->_shouldOpenContainingApplication;
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_responseMessageData)
  {
    -[_INPBIntentResponsePayloadSuccess responseMessageData](self, "responseMessageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("response_message_data"));

  }
  if (self->_responseTypeName)
  {
    -[_INPBIntentResponsePayloadSuccess responseTypeName](self, "responseTypeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("response_type_name"));

  }
  if (-[_INPBIntentResponsePayloadSuccess hasShouldOpenContainingApplication](self, "hasShouldOpenContainingApplication"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentResponsePayloadSuccess shouldOpenContainingApplication](self, "shouldOpenContainingApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("shouldOpenContainingApplication"));

  }
  return v3;
}

- (NSData)responseMessageData
{
  return self->_responseMessageData;
}

- (NSString)responseTypeName
{
  return self->_responseTypeName;
}

- (BOOL)shouldOpenContainingApplication
{
  return self->_shouldOpenContainingApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTypeName, 0);
  objc_storeStrong((id *)&self->_responseMessageData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
