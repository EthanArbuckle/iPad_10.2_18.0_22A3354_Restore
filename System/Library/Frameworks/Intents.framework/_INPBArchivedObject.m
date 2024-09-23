@implementation _INPBArchivedObject

- (void)setMessageData:(id)a3
{
  NSData *v4;
  NSData *messageData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  messageData = self->_messageData;
  self->_messageData = v4;

}

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
}

- (void)setTypeName:(id)a3
{
  NSString *v4;
  NSString *typeName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  typeName = self->_typeName;
  self->_typeName = v4;

}

- (BOOL)hasTypeName
{
  return self->_typeName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBArchivedObjectReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBArchivedObject messageData](self, "messageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[_INPBArchivedObject typeName](self, "typeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (_INPBArchivedObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBArchivedObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBArchivedObject *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBArchivedObject *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBArchivedObject initWithData:](self, "initWithData:", v6);

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
  -[_INPBArchivedObject data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBArchivedObject *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBArchivedObject init](+[_INPBArchivedObject allocWithZone:](_INPBArchivedObject, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  -[_INPBArchivedObject setMessageData:](v5, "setMessageData:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_typeName, "copyWithZone:", a3);
  -[_INPBArchivedObject setTypeName:](v5, "setTypeName:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBArchivedObject messageData](self, "messageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBArchivedObject messageData](self, "messageData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBArchivedObject messageData](self, "messageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBArchivedObject typeName](self, "typeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBArchivedObject typeName](self, "typeName");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBArchivedObject typeName](self, "typeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_messageData, "hash");
  return -[NSString hash](self->_typeName, "hash") ^ v3;
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
  if (self->_messageData)
  {
    -[_INPBArchivedObject messageData](self, "messageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("messageData"));

  }
  if (self->_typeName)
  {
    -[_INPBArchivedObject typeName](self, "typeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("typeName"));

  }
  return v3;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
