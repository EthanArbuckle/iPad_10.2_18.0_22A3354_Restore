@implementation _INPBEditMessageIntent

- (void)setEditedContent:(id)a3
{
  NSString *v4;
  NSString *editedContent;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  editedContent = self->_editedContent;
  self->_editedContent = v4;

}

- (BOOL)hasEditedContent
{
  return self->_editedContent != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setMessageIdentifier:(id)a3
{
  NSString *v4;
  NSString *messageIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  messageIdentifier = self->_messageIdentifier;
  self->_messageIdentifier = v4;

}

- (BOOL)hasMessageIdentifier
{
  return self->_messageIdentifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBEditMessageIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBEditMessageIntent editedContent](self, "editedContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBEditMessageIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBEditMessageIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBEditMessageIntent messageIdentifier](self, "messageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (_INPBEditMessageIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBEditMessageIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBEditMessageIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBEditMessageIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBEditMessageIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBEditMessageIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBEditMessageIntent *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = -[_INPBEditMessageIntent init](+[_INPBEditMessageIntent allocWithZone:](_INPBEditMessageIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_editedContent, "copyWithZone:", a3);
  -[_INPBEditMessageIntent setEditedContent:](v5, "setEditedContent:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBEditMessageIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_messageIdentifier, "copyWithZone:", a3);
  -[_INPBEditMessageIntent setMessageIdentifier:](v5, "setMessageIdentifier:", v8);

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
  -[_INPBEditMessageIntent editedContent](self, "editedContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBEditMessageIntent editedContent](self, "editedContent");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBEditMessageIntent editedContent](self, "editedContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editedContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBEditMessageIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBEditMessageIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBEditMessageIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBEditMessageIntent messageIdentifier](self, "messageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBEditMessageIntent messageIdentifier](self, "messageIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBEditMessageIntent messageIdentifier](self, "messageIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageIdentifier");
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

  v3 = -[NSString hash](self->_editedContent, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_messageIdentifier, "hash");
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
  if (self->_editedContent)
  {
    -[_INPBEditMessageIntent editedContent](self, "editedContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("editedContent"));

  }
  -[_INPBEditMessageIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (self->_messageIdentifier)
  {
    -[_INPBEditMessageIntent messageIdentifier](self, "messageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("messageIdentifier"));

  }
  return v3;
}

- (NSString)editedContent
{
  return self->_editedContent;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_editedContent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
