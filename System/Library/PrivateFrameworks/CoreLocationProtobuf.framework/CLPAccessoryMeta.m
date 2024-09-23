@implementation CLPAccessoryMeta

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
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
  v8.super_class = (Class)CLPAccessoryMeta;
  -[CLPAccessoryMeta description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPAccessoryMeta dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *make;
  NSString *model;
  NSString *version;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  make = self->_make;
  if (make)
    objc_msgSend(v3, "setObject:forKey:", make, CFSTR("make"));
  model = self->_model;
  if (model)
    objc_msgSend(v4, "setObject:forKey:", model, CFSTR("model"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAccessoryMetaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_make)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_version)
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
  if (self->_make)
  {
    objc_msgSend(v4, "setMake:");
    v4 = v5;
  }
  if (self->_model)
  {
    objc_msgSend(v5, "setModel:");
    v4 = v5;
  }
  if (self->_version)
  {
    objc_msgSend(v5, "setVersion:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_make, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *make;
  NSString *model;
  NSString *version;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((make = self->_make, !((unint64_t)make | v4[1])) || -[NSString isEqual:](make, "isEqual:"))
    && ((model = self->_model, !((unint64_t)model | v4[2]))
     || -[NSString isEqual:](model, "isEqual:")))
  {
    version = self->_version;
    if ((unint64_t)version | v4[3])
      v8 = -[NSString isEqual:](version, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_make, "hash");
  v4 = -[NSString hash](self->_model, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_version, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[CLPAccessoryMeta setMake:](self, "setMake:");
  if (v4[2])
    -[CLPAccessoryMeta setModel:](self, "setModel:");
  if (v4[3])
    -[CLPAccessoryMeta setVersion:](self, "setVersion:");

}

- (NSString)make
{
  return self->_make;
}

- (void)setMake:(id)a3
{
  objc_storeStrong((id *)&self->_make, a3);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
}

@end
