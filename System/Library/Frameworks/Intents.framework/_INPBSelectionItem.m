@implementation _INPBSelectionItem

- (void)setUuid:(id)a3
{
  NSString *v4;
  NSString *uuid;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uuid = self->_uuid;
  self->_uuid = v4;

}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setVocabularyValue:(id)a3
{
  NSString *v4;
  NSString *vocabularyValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  vocabularyValue = self->_vocabularyValue;
  self->_vocabularyValue = v4;

}

- (BOOL)hasVocabularyValue
{
  return self->_vocabularyValue != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSelectionItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBSelectionItem uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSelectionItem value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSelectionItem value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSelectionItem vocabularyValue](self, "vocabularyValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (_INPBSelectionItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSelectionItem *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSelectionItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSelectionItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSelectionItem initWithData:](self, "initWithData:", v6);

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
  -[_INPBSelectionItem data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSelectionItem *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[_INPBSelectionItem init](+[_INPBSelectionItem allocWithZone:](_INPBSelectionItem, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  -[_INPBSelectionItem setUuid:](v5, "setUuid:", v6);

  v7 = -[_INPBIntentSlotValue copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBSelectionItem setValue:](v5, "setValue:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_vocabularyValue, "copyWithZone:", a3);
  -[_INPBSelectionItem setVocabularyValue:](v5, "setVocabularyValue:", v8);

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBSelectionItem uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSelectionItem uuid](self, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSelectionItem uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSelectionItem value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSelectionItem value](self, "value");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSelectionItem value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSelectionItem vocabularyValue](self, "vocabularyValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vocabularyValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSelectionItem vocabularyValue](self, "vocabularyValue");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBSelectionItem vocabularyValue](self, "vocabularyValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vocabularyValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[_INPBIntentSlotValue hash](self->_value, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_vocabularyValue, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_uuid)
  {
    -[_INPBSelectionItem uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uuid"));

  }
  -[_INPBSelectionItem value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));

  if (self->_vocabularyValue)
  {
    -[_INPBSelectionItem vocabularyValue](self, "vocabularyValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("vocabularyValue"));

  }
  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (_INPBIntentSlotValue)value
{
  return self->_value;
}

- (NSString)vocabularyValue
{
  return self->_vocabularyValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
