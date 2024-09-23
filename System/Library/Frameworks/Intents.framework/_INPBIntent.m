@implementation _INPBIntent

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

- (void)setIntentTypeName:(id)a3
{
  NSString *v4;
  NSString *intentTypeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  intentTypeName = self->_intentTypeName;
  self->_intentTypeName = v4;

}

- (BOOL)hasIntentTypeName
{
  return self->_intentTypeName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBIntent appIdentifier](self, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBIntent appIdentifier](self, "appIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntent encodedIntent](self, "encodedIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBIntent encodedIntentDefinition](self, "encodedIntentDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if (-[_INPBIntent hasEncodingFormat](self, "hasEncodingFormat"))
    PBDataWriterWriteInt32Field();
  -[_INPBIntent intentTypeName](self, "intentTypeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (_INPBIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntent *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[_INPBIntent init](+[_INPBIntent allocWithZone:](_INPBIntent, "allocWithZone:"), "init");
  v6 = -[_INPBAppIdentifier copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  -[_INPBIntent setAppIdentifier:](v5, "setAppIdentifier:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_encodedIntent, "copyWithZone:", a3);
  -[_INPBIntent setEncodedIntent:](v5, "setEncodedIntent:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_encodedIntentDefinition, "copyWithZone:", a3);
  -[_INPBIntent setEncodedIntentDefinition:](v5, "setEncodedIntentDefinition:", v8);

  if (-[_INPBIntent hasEncodingFormat](self, "hasEncodingFormat"))
    -[_INPBIntent setEncodingFormat:](v5, "setEncodingFormat:", -[_INPBIntent encodingFormat](self, "encodingFormat"));
  v9 = (void *)-[NSString copyWithZone:](self->_intentTypeName, "copyWithZone:", a3);
  -[_INPBIntent setIntentTypeName:](v5, "setIntentTypeName:", v9);

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
  int v22;
  int encodingFormat;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[_INPBIntent appIdentifier](self, "appIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBIntent appIdentifier](self, "appIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntent appIdentifier](self, "appIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBIntent encodedIntent](self, "encodedIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBIntent encodedIntent](self, "encodedIntent");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntent encodedIntent](self, "encodedIntent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedIntent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBIntent encodedIntentDefinition](self, "encodedIntentDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedIntentDefinition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBIntent encodedIntentDefinition](self, "encodedIntentDefinition");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBIntent encodedIntentDefinition](self, "encodedIntentDefinition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedIntentDefinition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_26;
  }
  else
  {

  }
  v22 = -[_INPBIntent hasEncodingFormat](self, "hasEncodingFormat");
  if (v22 != objc_msgSend(v4, "hasEncodingFormat"))
    goto LABEL_26;
  if (-[_INPBIntent hasEncodingFormat](self, "hasEncodingFormat"))
  {
    if (objc_msgSend(v4, "hasEncodingFormat"))
    {
      encodingFormat = self->_encodingFormat;
      if (encodingFormat != objc_msgSend(v4, "encodingFormat"))
        goto LABEL_26;
    }
  }
  -[_INPBIntent intentTypeName](self, "intentTypeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntent intentTypeName](self, "intentTypeName");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBIntent intentTypeName](self, "intentTypeName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentTypeName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
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
  if (-[_INPBIntent hasEncodingFormat](self, "hasEncodingFormat"))
    v6 = 2654435761 * self->_encodingFormat;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_intentTypeName, "hash");
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
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBIntent appIdentifier](self, "appIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appIdentifier"));

  if (self->_encodedIntent)
  {
    -[_INPBIntent encodedIntent](self, "encodedIntent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("encodedIntent"));

  }
  if (self->_encodedIntentDefinition)
  {
    -[_INPBIntent encodedIntentDefinition](self, "encodedIntentDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("encodedIntentDefinition"));

  }
  if (-[_INPBIntent hasEncodingFormat](self, "hasEncodingFormat"))
  {
    v10 = -[_INPBIntent encodingFormat](self, "encodingFormat");
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
  if (self->_intentTypeName)
  {
    -[_INPBIntent intentTypeName](self, "intentTypeName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("intentTypeName"));

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

- (NSString)intentTypeName
{
  return self->_intentTypeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentTypeName, 0);
  objc_storeStrong((id *)&self->_encodedIntentDefinition, 0);
  objc_storeStrong((id *)&self->_encodedIntent, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
