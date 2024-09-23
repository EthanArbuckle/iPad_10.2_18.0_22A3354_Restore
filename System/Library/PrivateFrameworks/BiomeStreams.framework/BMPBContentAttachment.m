@implementation BMPBContentAttachment

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasFilename
{
  return self->_filename != 0;
}

- (BOOL)hasPath
{
  return self->_path != 0;
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
  v8.super_class = (Class)BMPBContentAttachment;
  -[BMPBContentAttachment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBContentAttachment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *type;
  NSString *filename;
  NSString *path;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  filename = self->_filename;
  if (filename)
    objc_msgSend(v4, "setObject:forKey:", filename, CFSTR("filename"));
  path = self->_path;
  if (path)
    objc_msgSend(v4, "setObject:forKey:", path, CFSTR("path"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBContentAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_filename)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_path)
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
  if (self->_type)
  {
    objc_msgSend(v4, "setType:");
    v4 = v5;
  }
  if (self->_filename)
  {
    objc_msgSend(v5, "setFilename:");
    v4 = v5;
  }
  if (self->_path)
  {
    objc_msgSend(v5, "setPath:");
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
  v6 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_filename, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *type;
  NSString *filename;
  NSString *path;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:"))
    && ((filename = self->_filename, !((unint64_t)filename | v4[1]))
     || -[NSString isEqual:](filename, "isEqual:")))
  {
    path = self->_path;
    if ((unint64_t)path | v4[2])
      v8 = -[NSString isEqual:](path, "isEqual:");
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

  v3 = -[NSString hash](self->_type, "hash");
  v4 = -[NSString hash](self->_filename, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_path, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[BMPBContentAttachment setType:](self, "setType:");
  if (v4[1])
    -[BMPBContentAttachment setFilename:](self, "setFilename:");
  if (v4[2])
    -[BMPBContentAttachment setPath:](self, "setPath:");

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
