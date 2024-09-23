@implementation INArchivedObject

- (INArchivedObject)initWithTypeName:(id)a3 messageData:(id)a4
{
  id v6;
  id v7;
  INArchivedObject *v8;
  uint64_t v9;
  NSString *typeName;
  uint64_t v11;
  NSData *messageData;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INArchivedObject;
  v8 = -[INArchivedObject init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    typeName = v8->_typeName;
    v8->_typeName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    messageData = v8->_messageData;
    v8->_messageData = (NSData *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_typeName, "hash");
  return -[NSData hash](self->_messageData, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INArchivedObject *v4;
  INArchivedObject *v5;
  NSString *typeName;
  NSData *messageData;
  BOOL v8;

  v4 = (INArchivedObject *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      typeName = self->_typeName;
      v8 = 0;
      if (typeName == v5->_typeName || -[NSString isEqual:](typeName, "isEqual:"))
      {
        messageData = self->_messageData;
        if (messageData == v5->_messageData || -[NSData isEqual:](messageData, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INArchivedObject)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  INArchivedObject *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("typeName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INArchivedObject initWithTypeName:messageData:](self, "initWithTypeName:messageData:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *typeName;
  id v5;

  typeName = self->_typeName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", typeName, CFSTR("typeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageData, CFSTR("messageData"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_typeName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("typeName"));

  objc_msgSend(v6, "encodeObject:", self->_messageData);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("messageData"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INArchivedObject descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INArchivedObject;
  -[INArchivedObject description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INArchivedObject _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *typeName;
  void *v4;
  NSData *messageData;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("typeName");
  typeName = self->_typeName;
  v4 = typeName;
  if (!typeName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("messageData");
  v10[0] = v4;
  messageData = self->_messageData;
  v6 = messageData;
  if (!messageData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!messageData)
  {

    if (typeName)
      return v7;
LABEL_9:

    return v7;
  }
  if (!typeName)
    goto LABEL_9;
  return v7;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("typeName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("messageData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTypeName:messageData:", v9, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
