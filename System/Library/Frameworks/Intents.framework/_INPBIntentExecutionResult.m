@implementation _INPBIntentExecutionResult

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

- (void)setEncodedIntentResponse:(id)a3
{
  NSString *v4;
  NSString *encodedIntentResponse;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  encodedIntentResponse = self->_encodedIntentResponse;
  self->_encodedIntentResponse = v4;

}

- (BOOL)hasEncodedIntentResponse
{
  return self->_encodedIntentResponse != 0;
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
  return _INPBIntentExecutionResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBIntentExecutionResult encodedIntent](self, "encodedIntent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBIntentExecutionResult encodedIntentResponse](self, "encodedIntentResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentExecutionResult hasEncodingFormat](self, "hasEncodingFormat"))
    PBDataWriterWriteInt32Field();

}

- (_INPBIntentExecutionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentExecutionResult *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentExecutionResult *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentExecutionResult *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentExecutionResult initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentExecutionResult data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentExecutionResult *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBIntentExecutionResult init](+[_INPBIntentExecutionResult allocWithZone:](_INPBIntentExecutionResult, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_encodedIntent, "copyWithZone:", a3);
  -[_INPBIntentExecutionResult setEncodedIntent:](v5, "setEncodedIntent:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_encodedIntentResponse, "copyWithZone:", a3);
  -[_INPBIntentExecutionResult setEncodedIntentResponse:](v5, "setEncodedIntentResponse:", v7);

  if (-[_INPBIntentExecutionResult hasEncodingFormat](self, "hasEncodingFormat"))
    -[_INPBIntentExecutionResult setEncodingFormat:](v5, "setEncodingFormat:", -[_INPBIntentExecutionResult encodingFormat](self, "encodingFormat"));
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
  int encodingFormat;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBIntentExecutionResult encodedIntent](self, "encodedIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBIntentExecutionResult encodedIntent](self, "encodedIntent");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentExecutionResult encodedIntent](self, "encodedIntent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedIntent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBIntentExecutionResult encodedIntentResponse](self, "encodedIntentResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodedIntentResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBIntentExecutionResult encodedIntentResponse](self, "encodedIntentResponse");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentExecutionResult encodedIntentResponse](self, "encodedIntentResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedIntentResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBIntentExecutionResult hasEncodingFormat](self, "hasEncodingFormat");
  if (v19 == objc_msgSend(v4, "hasEncodingFormat"))
  {
    if (!-[_INPBIntentExecutionResult hasEncodingFormat](self, "hasEncodingFormat")
      || !objc_msgSend(v4, "hasEncodingFormat")
      || (encodingFormat = self->_encodingFormat, encodingFormat == objc_msgSend(v4, "encodingFormat")))
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
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_encodedIntent, "hash");
  v4 = -[NSString hash](self->_encodedIntentResponse, "hash");
  if (-[_INPBIntentExecutionResult hasEncodingFormat](self, "hasEncodingFormat"))
    v5 = 2654435761 * self->_encodingFormat;
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
  uint64_t v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_encodedIntent)
  {
    -[_INPBIntentExecutionResult encodedIntent](self, "encodedIntent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("encodedIntent"));

  }
  if (self->_encodedIntentResponse)
  {
    -[_INPBIntentExecutionResult encodedIntentResponse](self, "encodedIntentResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("encodedIntentResponse"));

  }
  if (-[_INPBIntentExecutionResult hasEncodingFormat](self, "hasEncodingFormat"))
  {
    v8 = -[_INPBIntentExecutionResult encodingFormat](self, "encodingFormat");
    if ((_DWORD)v8 == 1)
    {
      v9 = CFSTR("JSON_STRING");
    }
    else if ((_DWORD)v8 == 2)
    {
      v9 = CFSTR("PROTOBUF_STRING");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("encodingFormat"));

  }
  return v3;
}

- (NSString)encodedIntent
{
  return self->_encodedIntent;
}

- (NSString)encodedIntentResponse
{
  return self->_encodedIntentResponse;
}

- (int)encodingFormat
{
  return self->_encodingFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedIntentResponse, 0);
  objc_storeStrong((id *)&self->_encodedIntent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
