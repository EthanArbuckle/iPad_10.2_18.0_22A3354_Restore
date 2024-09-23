@implementation _INPBRangeValue

- (void)setLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_length = a3;
}

- (BOOL)hasLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setLocation:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_location = a3;
}

- (BOOL)hasLocation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRangeValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBRangeValue hasLength](self, "hasLength"))
    PBDataWriterWriteUint64Field();
  if (-[_INPBRangeValue hasLocation](self, "hasLocation"))
    PBDataWriterWriteUint64Field();
  -[_INPBRangeValue valueMetadata](self, "valueMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBRangeValue valueMetadata](self, "valueMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBRangeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRangeValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRangeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRangeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRangeValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBRangeValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRangeValue *v5;
  id v6;

  v5 = -[_INPBRangeValue init](+[_INPBRangeValue allocWithZone:](_INPBRangeValue, "allocWithZone:"), "init");
  if (-[_INPBRangeValue hasLength](self, "hasLength"))
    -[_INPBRangeValue setLength:](v5, "setLength:", -[_INPBRangeValue length](self, "length"));
  if (-[_INPBRangeValue hasLocation](self, "hasLocation"))
    -[_INPBRangeValue setLocation:](v5, "setLocation:", -[_INPBRangeValue location](self, "location"));
  v6 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBRangeValue setValueMetadata:](v5, "setValueMetadata:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  unint64_t length;
  int v7;
  unint64_t location;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBRangeValue hasLength](self, "hasLength");
    if (v5 == objc_msgSend(v4, "hasLength"))
    {
      if (!-[_INPBRangeValue hasLength](self, "hasLength")
        || !objc_msgSend(v4, "hasLength")
        || (length = self->_length, length == objc_msgSend(v4, "length")))
      {
        v7 = -[_INPBRangeValue hasLocation](self, "hasLocation");
        if (v7 == objc_msgSend(v4, "hasLocation"))
        {
          if (!-[_INPBRangeValue hasLocation](self, "hasLocation")
            || !objc_msgSend(v4, "hasLocation")
            || (location = self->_location, location == objc_msgSend(v4, "location")))
          {
            -[_INPBRangeValue valueMetadata](self, "valueMetadata");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "valueMetadata");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if ((v9 == 0) != (v10 != 0))
            {
              -[_INPBRangeValue valueMetadata](self, "valueMetadata");
              v12 = objc_claimAutoreleasedReturnValue();
              if (!v12)
              {

LABEL_18:
                v17 = 1;
                goto LABEL_16;
              }
              v13 = (void *)v12;
              -[_INPBRangeValue valueMetadata](self, "valueMetadata");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "valueMetadata");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if ((v16 & 1) != 0)
                goto LABEL_18;
            }
            else
            {

            }
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  if (-[_INPBRangeValue hasLength](self, "hasLength"))
    v3 = 2654435761u * self->_length;
  else
    v3 = 0;
  if (-[_INPBRangeValue hasLocation](self, "hasLocation"))
    v4 = 2654435761u * self->_location;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
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
  if (-[_INPBRangeValue hasLength](self, "hasLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBRangeValue length](self, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("length"));

  }
  if (-[_INPBRangeValue hasLocation](self, "hasLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBRangeValue location](self, "location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("location"));

  }
  -[_INPBRangeValue valueMetadata](self, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("valueMetadata"));

  return v3;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)location
{
  return self->_location;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
