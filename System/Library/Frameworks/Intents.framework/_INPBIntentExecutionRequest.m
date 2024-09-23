@implementation _INPBIntentExecutionRequest

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (BOOL)hasAppIdentifier
{
  return self->_appIdentifier != 0;
}

- (void)setEncodedIntent:(id)a3
{
  NSString *v4;
  NSString *encodedIntent;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  encodedIntent = self->_encodedIntent;
  self->_encodedIntent = v4;

}

- (BOOL)hasEncodedIntent
{
  return self->_encodedIntent != 0;
}

- (void)setEncodedIntentDefinition:(id)a3
{
  NSString *v4;
  NSString *encodedIntentDefinition;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  encodedIntentDefinition = self->_encodedIntentDefinition;
  self->_encodedIntentDefinition = v4;

}

- (BOOL)hasEncodedIntentDefinition
{
  return self->_encodedIntentDefinition != 0;
}

- (void)setEncodingFormat:(int)a3
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
    self->_encodingFormat = a3;
  }
}

- (BOOL)hasEncodingFormat
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEncodingFormat:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)encodingFormatAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("JSON_STRING");
  if (a3 == 2)
  {
    v3 = CFSTR("PROTOBUF_STRING");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsEncodingFormat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JSON_STRING")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOBUF_STRING")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentExecutionRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBIntentExecutionRequest appIdentifier](self, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBIntentExecutionRequest appIdentifier](self, "appIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentExecutionRequest encodedIntent](self, "encodedIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBIntentExecutionRequest encodedIntentDefinition](self, "encodedIntentDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentExecutionRequest hasEncodingFormat](self, "hasEncodingFormat"))
    PBDataWriterWriteInt32Field();

}

- (_INPBIntentExecutionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentExecutionRequest *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentExecutionRequest *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentExecutionRequest *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentExecutionRequest initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentExecutionRequest data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentExecutionRequest *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = -[_INPBIntentExecutionRequest init](+[_INPBIntentExecutionRequest allocWithZone:](_INPBIntentExecutionRequest, "allocWithZone:"), "init");
  v6 = -[_INPBAppIdentifier copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  -[_INPBIntentExecutionRequest setAppIdentifier:](v5, "setAppIdentifier:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_encodedIntent, "copyWithZone:", a3);
  -[_INPBIntentExecutionRequest setEncodedIntent:](v5, "setEncodedIntent:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_encodedIntentDefinition, "copyWithZone:", a3);
  -[_INPBIntentExecutionRequest setEncodedIntentDefinition:](v5, "setEncodedIntentDefinition:", v8);

  if (-[_INPBIntentExecutionRequest hasEncodingFormat](self, "hasEncodingFormat"))
    -[_INPBIntentExecutionRequest setEncodingFormat:](v5, "setEncodingFormat:", -[_INPBIntentExecutionRequest encodingFormat](self, "encodingFormat"));
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int v24;
  int encodingFormat;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBIntentExecutionRequest appIdentifier](self, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBIntentExecutionRequest appIdentifier](self, "appIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentExecutionRequest appIdentifier](self, "appIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBIntentExecutionRequest encodedIntent](self, "encodedIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBIntentExecutionRequest encodedIntent](self, "encodedIntent");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentExecutionRequest encodedIntent](self, "encodedIntent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedIntent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBIntentExecutionRequest encodedIntentDefinition](self, "encodedIntentDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedIntentDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_INPBIntentExecutionRequest encodedIntentDefinition](self, "encodedIntentDefinition");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBIntentExecutionRequest encodedIntentDefinition](self, "encodedIntentDefinition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedIntentDefinition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  v24 = -[_INPBIntentExecutionRequest hasEncodingFormat](self, "hasEncodingFormat");
  if (v24 == objc_msgSend(v4, "hasEncodingFormat"))
  {
    if (!-[_INPBIntentExecutionRequest hasEncodingFormat](self, "hasEncodingFormat")
      || !objc_msgSend(v4, "hasEncodingFormat")
      || (encodingFormat = self->_encodingFormat, encodingFormat == objc_msgSend(v4, "encodingFormat")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[_INPBAppIdentifier hash](self->_appIdentifier, "hash");
  v4 = -[NSString hash](self->_encodedIntent, "hash");
  v5 = -[NSString hash](self->_encodedIntentDefinition, "hash");
  if (-[_INPBIntentExecutionRequest hasEncodingFormat](self, "hasEncodingFormat"))
    v6 = 2654435761 * self->_encodingFormat;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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
  uint64_t v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBIntentExecutionRequest appIdentifier](self, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appIdentifier"));

  if (self->_encodedIntent)
  {
    -[_INPBIntentExecutionRequest encodedIntent](self, "encodedIntent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("encodedIntent"));

  }
  if (self->_encodedIntentDefinition)
  {
    -[_INPBIntentExecutionRequest encodedIntentDefinition](self, "encodedIntentDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("encodedIntentDefinition"));

  }
  if (-[_INPBIntentExecutionRequest hasEncodingFormat](self, "hasEncodingFormat"))
  {
    v10 = -[_INPBIntentExecutionRequest encodingFormat](self, "encodingFormat");
    if ((_DWORD)v10 == 1)
    {
      v11 = CFSTR("JSON_STRING");
    }
    else if ((_DWORD)v10 == 2)
    {
      v11 = CFSTR("PROTOBUF_STRING");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("encodingFormat"));

  }
  return v3;
}

- (_INPBAppIdentifier)appIdentifier
{
  return self->_appIdentifier;
}

- (NSString)encodedIntent
{
  return self->_encodedIntent;
}

- (NSString)encodedIntentDefinition
{
  return self->_encodedIntentDefinition;
}

- (int)encodingFormat
{
  return self->_encodingFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedIntentDefinition, 0);
  objc_storeStrong((id *)&self->_encodedIntent, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
