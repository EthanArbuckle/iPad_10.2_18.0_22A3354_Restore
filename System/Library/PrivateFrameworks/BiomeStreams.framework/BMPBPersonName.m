@implementation BMPBPersonName

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameComponents
{
  return self->_nameComponents != 0;
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
  v8.super_class = (Class)BMPBPersonName;
  -[BMPBPersonName description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBPersonName dictionaryRepresentation](self, "dictionaryRepresentation");
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
  BMPBNameComponents *nameComponents;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  nameComponents = self->_nameComponents;
  if (nameComponents)
  {
    -[BMPBNameComponents dictionaryRepresentation](nameComponents, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("nameComponents"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPersonNameReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_nameComponents)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_nameComponents)
  {
    objc_msgSend(v5, "setNameComponents:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[BMPBNameComponents copyWithZone:](self->_nameComponents, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  BMPBNameComponents *nameComponents;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    nameComponents = self->_nameComponents;
    if ((unint64_t)nameComponents | v4[2])
      v7 = -[BMPBNameComponents isEqual:](nameComponents, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[BMPBNameComponents hash](self->_nameComponents, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  BMPBNameComponents *nameComponents;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[BMPBPersonName setName:](self, "setName:");
    v4 = v7;
  }
  nameComponents = self->_nameComponents;
  v6 = v4[2];
  if (nameComponents)
  {
    if (v6)
    {
      -[BMPBNameComponents mergeFrom:](nameComponents, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[BMPBPersonName setNameComponents:](self, "setNameComponents:");
    goto LABEL_8;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BMPBNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nameComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
