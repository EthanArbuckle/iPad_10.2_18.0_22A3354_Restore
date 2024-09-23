@implementation BMPBNamedHandle

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasHandleType
{
  return self->_handleType != 0;
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
  v8.super_class = (Class)BMPBNamedHandle;
  -[BMPBNamedHandle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBNamedHandle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *handle;
  NSString *contactIdentifier;
  NSString *handleType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  handle = self->_handle;
  if (handle)
    objc_msgSend(v4, "setObject:forKey:", handle, CFSTR("handle"));
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
    objc_msgSend(v4, "setObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  handleType = self->_handleType;
  if (handleType)
    objc_msgSend(v4, "setObject:forKey:", handleType, CFSTR("handleType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNamedHandleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_handle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_handleType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_handle)
  {
    objc_msgSend(v5, "setHandle:");
    v4 = v5;
  }
  if (self->_contactIdentifier)
  {
    objc_msgSend(v5, "setContactIdentifier:");
    v4 = v5;
  }
  if (self->_handleType)
  {
    objc_msgSend(v5, "setHandleType:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_handleType, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *handle;
  NSString *contactIdentifier;
  NSString *handleType;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[4])) || -[NSString isEqual:](name, "isEqual:"))
    && ((handle = self->_handle, !((unint64_t)handle | v4[2]))
     || -[NSString isEqual:](handle, "isEqual:"))
    && ((contactIdentifier = self->_contactIdentifier, !((unint64_t)contactIdentifier | v4[1]))
     || -[NSString isEqual:](contactIdentifier, "isEqual:")))
  {
    handleType = self->_handleType;
    if ((unint64_t)handleType | v4[3])
      v9 = -[NSString isEqual:](handleType, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_handle, "hash") ^ v3;
  v5 = -[NSString hash](self->_contactIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_handleType, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[BMPBNamedHandle setName:](self, "setName:");
  if (v4[2])
    -[BMPBNamedHandle setHandle:](self, "setHandle:");
  if (v4[1])
    -[BMPBNamedHandle setContactIdentifier:](self, "setContactIdentifier:");
  if (v4[3])
    -[BMPBNamedHandle setHandleType:](self, "setHandleType:");

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(id)a3
{
  objc_storeStrong((id *)&self->_handleType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
