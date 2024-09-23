@implementation FCCKPRecordField

- (FCCKPRecordFieldIdentifier)identifier
{
  return self->_identifier;
}

- (FCCKPRecordFieldValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordField;
  -[FCCKPRecordField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRecordField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPRecordFieldIdentifier *identifier;
  void *v5;
  FCCKPRecordFieldValue *value;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    -[FCCKPRecordFieldIdentifier dictionaryRepresentation](identifier, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  }
  value = self->_value;
  if (value)
  {
    -[FCCKPRecordFieldValue dictionaryRepresentation](value, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("value"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordFieldReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPRecordFieldIdentifier copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[FCCKPRecordFieldValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPRecordFieldIdentifier *identifier;
  FCCKPRecordFieldValue *value;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[FCCKPRecordFieldIdentifier isEqual:](identifier, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2])
      v7 = -[FCCKPRecordFieldValue isEqual:](value, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[FCCKPRecordFieldIdentifier hash](self->_identifier, "hash");
  return -[FCCKPRecordFieldValue hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  FCCKPRecordFieldIdentifier *identifier;
  uint64_t v6;
  FCCKPRecordFieldValue *value;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  identifier = self->_identifier;
  v6 = v4[1];
  v9 = v4;
  if (identifier)
  {
    if (!v6)
      goto LABEL_7;
    -[FCCKPRecordFieldIdentifier mergeFrom:](identifier, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[FCCKPRecordField setIdentifier:](self, "setIdentifier:");
  }
  v4 = v9;
LABEL_7:
  value = self->_value;
  v8 = v4[2];
  if (value)
  {
    if (v8)
    {
      -[FCCKPRecordFieldValue mergeFrom:](value, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[FCCKPRecordField setValue:](self, "setValue:");
    goto LABEL_12;
  }

}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

@end
