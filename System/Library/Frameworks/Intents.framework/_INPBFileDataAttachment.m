@implementation _INPBFileDataAttachment

- (void)setData:(id)a3
{
  NSData *v4;
  NSData *data;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  data = self->_data;
  self->_data = v4;

}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setFileName:(id)a3
{
  NSString *v4;
  NSString *fileName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fileName = self->_fileName;
  self->_fileName = v4;

}

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFileDataAttachmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBFileDataAttachment data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  -[_INPBFileDataAttachment fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (_INPBFileDataAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFileDataAttachment *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFileDataAttachment *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFileDataAttachment *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFileDataAttachment initWithData:](self, "initWithData:", v6);

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
  -[_INPBFileDataAttachment data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFileDataAttachment *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBFileDataAttachment init](+[_INPBFileDataAttachment allocWithZone:](_INPBFileDataAttachment, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  -[_INPBFileDataAttachment setData:](v5, "setData:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  -[_INPBFileDataAttachment setFileName:](v5, "setFileName:", v7);

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
  -[_INPBFileDataAttachment data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBFileDataAttachment data](self, "data");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFileDataAttachment data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBFileDataAttachment fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBFileDataAttachment fileName](self, "fileName");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBFileDataAttachment fileName](self, "fileName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileName");
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

  v3 = -[NSData hash](self->_data, "hash");
  return -[NSString hash](self->_fileName, "hash") ^ v3;
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
  if (self->_data)
  {
    -[_INPBFileDataAttachment data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("data"));

  }
  if (self->_fileName)
  {
    -[_INPBFileDataAttachment fileName](self, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fileName"));

  }
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
