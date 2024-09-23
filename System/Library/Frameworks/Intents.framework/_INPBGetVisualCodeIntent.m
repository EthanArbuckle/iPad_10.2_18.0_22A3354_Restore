@implementation _INPBGetVisualCodeIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setVisualCodeType:(int)a3
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
    self->_visualCodeType = a3;
  }
}

- (BOOL)hasVisualCodeType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasVisualCodeType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)visualCodeTypeAsString:(int)a3
{
  if (a3 < 7)
    return *(&off_1E228A6D0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVisualCodeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_PAYMENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEND_PAYMENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBWAY")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetVisualCodeIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBGetVisualCodeIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBGetVisualCodeIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBGetVisualCodeIntent hasVisualCodeType](self, "hasVisualCodeType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBGetVisualCodeIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetVisualCodeIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetVisualCodeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetVisualCodeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetVisualCodeIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBGetVisualCodeIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetVisualCodeIntent *v5;
  id v6;

  v5 = -[_INPBGetVisualCodeIntent init](+[_INPBGetVisualCodeIntent allocWithZone:](_INPBGetVisualCodeIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBGetVisualCodeIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  if (-[_INPBGetVisualCodeIntent hasVisualCodeType](self, "hasVisualCodeType"))
    -[_INPBGetVisualCodeIntent setVisualCodeType:](v5, "setVisualCodeType:", -[_INPBGetVisualCodeIntent visualCodeType](self, "visualCodeType"));
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
  int visualCodeType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBGetVisualCodeIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBGetVisualCodeIntent intentMetadata](self, "intentMetadata");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBGetVisualCodeIntent intentMetadata](self, "intentMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "intentMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBGetVisualCodeIntent hasVisualCodeType](self, "hasVisualCodeType");
    if (v13 == objc_msgSend(v4, "hasVisualCodeType"))
    {
      if (!-[_INPBGetVisualCodeIntent hasVisualCodeType](self, "hasVisualCodeType")
        || !objc_msgSend(v4, "hasVisualCodeType")
        || (visualCodeType = self->_visualCodeType, visualCodeType == objc_msgSend(v4, "visualCodeType")))
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

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBGetVisualCodeIntent hasVisualCodeType](self, "hasVisualCodeType"))
    v4 = 2654435761 * self->_visualCodeType;
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
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBGetVisualCodeIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (-[_INPBGetVisualCodeIntent hasVisualCodeType](self, "hasVisualCodeType"))
  {
    v6 = -[_INPBGetVisualCodeIntent visualCodeType](self, "visualCodeType");
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E228A6D0 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("visualCodeType"));

  }
  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)visualCodeType
{
  return self->_visualCodeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
